Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 764488FEAC
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Aug 2019 11:07:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726973AbfHPJHp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Aug 2019 05:07:45 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:42614 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726863AbfHPJHp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 16 Aug 2019 05:07:45 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 5DC656E0A5FDC11CA106;
        Fri, 16 Aug 2019 17:07:42 +0800 (CST)
Received: from localhost.localdomain (10.67.212.75) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.439.0; Fri, 16 Aug 2019 17:07:33 +0800
From:   Wei Xu <xuwei5@hisilicon.com>
To:     <xuwei5@hisilicon.com>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linus.walleij@linaro.org>,
        <rjw@rjwysocki.net>, <lenb@kernel.org>,
        <mika.westerberg@linux.intel.com>, <andy.shevchenko@gmail.com>
CC:     <linuxarm@huawei.com>, <shameerali.kolothum.thodi@huawei.com>,
        <jonathan.cameron@huawei.com>, <john.garry@huawei.com>,
        <salil.mehta@huawei.com>, <shiju.jose@huawei.com>,
        <jinying@hisilicon.com>, <zhangyi.ac@huawei.com>,
        <liguozhu@hisilicon.com>, <tangkunshan@huawei.com>,
        <huangdaode@hisilicon.com>
Subject: [PATCH v2] gpio: pl061: Fix the issue failed to register the ACPI interrtupion
Date:   Fri, 16 Aug 2019 17:05:36 +0800
Message-ID: <1565946336-20080-1-git-send-email-xuwei5@hisilicon.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.212.75]
X-CFilter-Loop: Reflected
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Invoke acpi_gpiochip_request_interrupts after the acpi data has been
attached to the pl061 acpi node to register interruption.

Otherwise it will be failed to register interruption for the ACPI case.
Because in the gpiochip_add_data_with_key, acpi_gpiochip_add is invoked
after gpiochip_add_irqchip but at that time the acpi data has not been
attached yet.

Tested with below steps on QEMU v4.1.0-rc3 and Linux kernel v5.3-rc4,
and found pl061 interruption is missed in the /proc/interrupts:
1.
qemu-system-aarch64 \
-machine virt,gic-version=3 -cpu cortex-a57 \
-m 1G,maxmem=4G,slots=4 \
-kernel Image -initrd rootfs.cpio.gz \
-net none -nographic  \
-bios QEMU_EFI.fd  \
-append "console=ttyAMA0 acpi=force earlycon=pl011,0x9000000"

2. cat /proc/interrupts in the guest console:

	estuary:/$ cat /proc/interrupts
		   CPU0
	2:         3228     GICv3  27 Level     arch_timer
	4:           15     GICv3  33 Level     uart-pl011
	42:           0     GICv3  23 Level     arm-pmu
	IPI0:         0       Rescheduling interrupts
	IPI1:         0       Function call interrupts
	IPI2:         0       CPU stop interrupts
	IPI3:         0       CPU stop (for crash dump) interrupts
	IPI4:         0       Timer broadcast interrupts
	IPI5:         0       IRQ work interrupts
	IPI6:         0       CPU wake-up interrupts
	Err:          0

But on QEMU v3.0.0 and Linux kernel v5.2.0-rc7, pl061 interruption is
there as below:

	estuary:/$ cat /proc/interrupts
		   CPU0
	  2:       2648     GICv3  27 Level     arch_timer
	  4:         12     GICv3  33 Level     uart-pl011
	 42:          0     GICv3  23 Level     arm-pmu
	 43:          0  ARMH0061:00   3 Edge      ACPI:Event
	IPI0:         0       Rescheduling interrupts
	IPI1:         0       Function call interrupts
	IPI2:         0       CPU stop interrupts
	IPI3:         0       CPU stop (for crash dump) interrupts
	IPI4:         0       Timer broadcast interrupts
	IPI5:         0       IRQ work interrupts
	IPI6:         0       CPU wake-up interrupts
	Err:          0

And the whole dmesg log on Linux kernel v5.2.0-rc7 is as below:

	[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x411fd070]
	[    0.000000] Linux version 5.2.0-rc7 (joyx@Turing-Arch-b) (gcc version 4.9.1 20140505 (prerelease) (crosstool-NG linaro-1.13.1-4.9-2014.05 - Linaro GCC 4.9-2014.05)) #61 SMP PREEMPT Fri Aug 16 11:54:31 CST 2019
	[    0.000000] earlycon: pl11 at MMIO 0x0000000009000000 (options '')
	[    0.000000] printk: bootconsole [pl11] enabled
	[    0.000000] efi: Getting EFI parameters from FDT:
	[    0.000000] efi: EFI v2.70 by EDK II
	[    0.000000] efi:  SMBIOS 3.0=0x7f8e0000  MEMATTR=0x7d60f018  ACPI 2.0=0x7c270000  MEMRESERVE=0x7c503018
	[    0.000000] cma: Reserved 32 MiB at 0x000000007a000000
	[    0.000000] ACPI: Early table checksum verification disabled
	[    0.000000] ACPI: RSDP 0x000000007C270000 000024 (v02 BOCHS )
	[    0.000000] ACPI: XSDT 0x000000007C260000 000054 (v01 BOCHS  BXPCFACP 00000001      01000013)
	[    0.000000] ACPI: FACP 0x000000007C220000 00010C (v05 BOCHS  BXPCFACP 00000001 BXPC 00000001)
	[    0.000000] ACPI: DSDT 0x000000007C230000 00482C (v02 BOCHS  BXPCDSDT 00000001 BXPC 00000001)
	[    0.000000] ACPI: APIC 0x000000007C210000 0000A0 (v03 BOCHS  BXPCAPIC 00000001 BXPC 00000001)
	[    0.000000] ACPI: GTDT 0x000000007C200000 000060 (v02 BOCHS  BXPCGTDT 00000001 BXPC 00000001)v
	[    0.000000] ACPI: MCFG 0x000000007C1F0000 00003C (v01 BOCHS  BXPCMCFG 00000001 BXPC 00000001)
	[    0.000000] ACPI: SPCR 0x000000007C1E0000 000050 (v02 BOCHS  BXPCSPCR 00000001 BXPC 00000001)
	[    0.000000] ACPI: SRAT 0x000000007C1D0000 00006A (v03 BOCHS  BXPCSRAT 00000001 BXPC 00000001)
	[    0.000000] ACPI: SPCR: console: pl011,mmio,0x9000000,9600
	[    0.000000] ACPI: SRAT: Node 0 PXM 0 [mem 0x40000000-0x7fffffff]
	[    0.000000] NUMA: NODE_DATA [mem 0x7fdfb840-0x7fdfcfff]
	[    0.000000] Zone ranges:
	[    0.000000]   DMA32    [mem 0x0000000040000000-0x000000007fffffff]
	[    0.000000]   Normal   empty
	[    0.000000] Movable zone start for each node
	[    0.000000] Early memory node ranges
	[    0.000000]   node   0: [mem 0x0000000040000000-0x000000007c27ffff]
	[    0.000000]   node   0: [mem 0x000000007c280000-0x000000007c4fffff]
	[    0.000000]   node   0: [mem 0x000000007c500000-0x000000007f7dffff]
	[    0.000000]   node   0: [mem 0x000000007f7e0000-0x000000007f86ffff]
	[    0.000000]   node   0: [mem 0x000000007f870000-0x000000007f87ffff]
	[    0.000000]   node   0: [mem 0x000000007f880000-0x000000007f99ffff]
	[    0.000000]   node   0: [mem 0x000000007f9a0000-0x000000007fffffff]
	[    0.000000] Zeroed struct page in unavailable ranges: 416 pages
	[    0.000000] Initmem setup node 0 [mem 0x0000000040000000-0x000000007fffffff]
	[    0.000000] On node 0 totalpages: 262144
	[    0.000000]   DMA32 zone: 4096 pages used for memmap
	[    0.000000]   DMA32 zone: 0 pages reserved
	[    0.000000]   DMA32 zone: 262144 pages, LIFO batch:63
	[    0.000000] psci: probing for conduit method from ACPI.
	[    0.000000] psci: PSCIv0.2 detected in firmware.
	[    0.000000] psci: Using standard PSCI v0.2 function IDs
	[    0.000000] psci: Trusted OS migration not required
	[    0.000000] ACPI: NUMA: SRAT: PXM 0 -> MPIDR 0x0 -> Node 0
	[    0.000000] percpu: Embedded 23 pages/cpu s56768 r8192 d29248 u94208
	[    0.000000] pcpu-alloc: s56768 r8192 d29248 u94208 alloc=23*4096
	[    0.000000] pcpu-alloc: [0] 0
	[    0.000000] Detected PIPT I-cache on CPU0
	[    0.000000] CPU features: detected: ARM erratum 832075
	[    0.000000] CPU features: detected: GIC system register CPU interface
	[    0.000000] CPU features: detected: ARM erratum 834220
	[    0.000000] CPU features: detected: EL2 vector hardening
	[    0.000000] ARM_SMCCC_ARCH_WORKAROUND_1 missing from firmware
	[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 258048
	[    0.000000] Policy zone: DMA32
	[    0.000000] Kernel command line: console=ttyAMA0 acpi=force earlycon=pl011,0x9000000 initrd=initrd
	[    0.000000] Memory: 848128K/1048576K available (11132K kernel code, 1766K rwdata, 5924K rodata, 1344K init, 447K bss, 167680K reserved, 32768K cma-reserved)
	[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
	[    0.000000] rcu: Preemptible hierarchical RCU implementation.
	[    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=256 to nr_cpu_ids=1.
	[    0.000000]  Tasks RCU enabled.
	[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
	[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=1
	[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
	[    0.000000] GICv3: Distributor has no Range Selector support
	[    0.000000] GICv3: no VLPI support, no direct LPI support
	[    0.000000] GICv3: CPU0: found redistributor 0 region 0:0x00000000080a0000
	[    0.000000] random: get_random_bytes called from start_kernel+0x2b4/0x470 with crng_init=0
	[    0.000000] arch_timer: cp15 timer(s) running at 62.50MHz (virt).
	[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x1cd42e208c, max_idle_ns: 881590405314 ns
	[    0.000092] sched_clock: 56 bits at 62MHz, resolution 16ns, wraps every 4398046511096ns
	[    0.007507] Console: colour dummy device 80x25
	[    0.009048] ACPI: Core revision 20190509
	[    0.013315] Calibrating delay loop (skipped), value calculated using timer frequency.. 125.00 BogoMIPS (lpj=250000)
	[    0.014388] pid_max: default: 32768 minimum: 301
	[    0.015596] LSM: Security Framework initializing
	[    0.125480] Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes)
	[    0.126961] Inode-cache hash table entries: 65536 (order: 7, 524288 bytes)
	[    0.127543] Mount-cache hash table entries: 2048 (order: 2, 16384 bytes)
	[    0.127927] Mountpoint-cache hash table entries: 2048 (order: 2, 16384 bytes)
	[    0.139974] *** VALIDATE proc ***
	[    0.144385] *** VALIDATE cgroup1 ***
	[    0.144602] *** VALIDATE cgroup2 ***
	[    0.156728] ACPI PPTT: No PPTT table found, CPU and cache topology may be inaccurate
	[    0.185506] ASID allocator initialised with 32768 entries
	[    0.193054] rcu: Hierarchical SRCU implementation.
	[    0.204036] Remapping and enabling EFI services.
	[    0.213563] smp: Bringing up secondary CPUs ...
	[    0.213898] smp: Brought up 1 node, 1 CPU
	[    0.214131] SMP: Total of 1 processors activated.
	[    0.214418] CPU features: detected: 32-bit EL0 Support
	[    0.214766] CPU features: detected: CRC32 instructions
	[    0.223253] CPU: All CPU(s) started at EL1
	[    0.223634] alternatives: patching kernel code
	[    0.244639] devtmpfs: initialized
	[    0.256434] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
	[    0.257056] futex hash table entries: 256 (order: 2, 16384 bytes)
	[    0.263282] pinctrl core: initialized pinctrl subsystem
	[    0.276553] SMBIOS 3.0.0 present.
	[    0.276921] DMI: QEMU QEMU Virtual Machine, BIOS 0.0.0 02/06/2015
	[    0.284007] NET: Registered protocol family 16
	[    0.286721] audit: initializing netlink subsys (disabled)
	[    0.291045] audit: type=2000 audit(0.268:1): state=initialized audit_enabled=0 res=1
	[    0.295580] cpuidle: using governor menu
	[    0.297330] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
	[    0.304834] DMA: preallocated 256 KiB pool for atomic allocations
	[    0.308014] ACPI: bus type PCI registered
	[    0.308308] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
	[    0.310517] Serial: AMBA PL011 UART driver
	[    0.354362] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
	[    0.354735] HugeTLB registered 32.0 MiB page size, pre-allocated 0 pages
	[    0.355104] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
	[    0.355445] HugeTLB registered 64.0 KiB page size, pre-allocated 0 pages
	[    0.382352] cryptd: max_cpu_qlen set to 1000
	[    0.408375] ACPI: Added _OSI(Module Device)
	[    0.408641] ACPI: Added _OSI(Processor Device)
	[    0.408873] ACPI: Added _OSI(3.0 _SCP Extensions)
	[    0.409122] ACPI: Added _OSI(Processor Aggregator Device)
	[    0.409476] ACPI: Added _OSI(Linux-Dell-Video)
	[    0.410058] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
	[    0.410334] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
	[    0.491373] ACPI: 1 ACPI AML tables successfully acquired and loaded
	[    0.506610] ACPI: Interpreter enabled
	[    0.506855] ACPI: Using GIC for interrupt routing
	[    0.507529] ACPI: MCFG table detected, 1 entries
	[    0.562419] ARMH0011:00: ttyAMA0 at MMIO 0x9000000 (irq = 4, base_baud = 0) is a SBSA
	[    0.635348] printk: console [ttyAMA0] enabled
	[    0.671533] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
	[    0.672857] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI HPX-Type3]
	[    0.680379] acpi PNP0A08:00: _OSC: platform does not support [LTR]
	[    0.683111] acpi PNP0A08:00: _OSC: OS now controls [PME AER PCIeCapability]
	[    0.688777] acpi PNP0A08:00: ECAM area [mem 0x4010000000-0x401fffffff] reserved by PNP0C02:00
	[    0.689904] acpi PNP0A08:00: ECAM at [mem 0x4010000000-0x401fffffff] for [bus 00-ff]
	[    0.691879] Remapped I/O 0x000000003eff0000 to [io  0x0000-0xffff window]
	[    0.695715] PCI host bridge to bus 0000:00
	[    0.696261] pci_bus 0000:00: root bus resource [mem 0x10000000-0x3efeffff window]
	[    0.697055] pci_bus 0000:00: root bus resource [io  0x0000-0xffff window]
	[    0.697735] pci_bus 0000:00: root bus resource [mem 0x8000000000-0xffffffffff window]
	[    0.698606] pci_bus 0000:00: root bus resource [bus 00-ff]
	[    0.700266] pci 0000:00:00.0: [1b36:0008] type 00 class 0x060000
	[    0.706988] ACPI: PCI Interrupt Link [GSI0] (IRQs *35)
	[    0.707965] ACPI: PCI Interrupt Link [GSI1] (IRQs *36)
	[    0.708661] ACPI: PCI Interrupt Link [GSI2] (IRQs *37)
	[    0.709336] ACPI: PCI Interrupt Link [GSI3] (IRQs *38)
	[    0.721505] vgaarb: loaded
	[    0.723261] SCSI subsystem initialized
	[    0.725065] libata version 3.00 loaded.
	[    0.726270] ACPI: bus type USB registered
	[    0.727346] usbcore: registered new interface driver usbfs
	[    0.728223] usbcore: registered new interface driver hub
	[    0.729326] usbcore: registered new device driver usb
	[    0.732056] pps_core: LinuxPPS API ver. 1 registered
	[    0.732580] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
	[    0.733803] PTP clock support registered
	[    0.734781] EDAC MC: Ver: 3.0.0
	[    0.739155] Registered efivars operations
	[    0.752186] FPGA manager framework
	[    0.753453] Advanced Linux Sound Architecture Driver Initialized.
	[    0.767808] clocksource: Switched to clocksource arch_sys_counter
	[    0.769435] VFS: Disk quotas dquot_6.6.0
	[    0.770090] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
	[    0.772939] *** VALIDATE hugetlbfs ***
	[    0.775509] pnp: PnP ACPI init
	[    0.779262] system 00:00: [mem 0x4010000000-0x401fffffff window] could not be reserved
	[    0.780474] system 00:00: Plug and Play ACPI device, IDs PNP0c02 (active)
	[    0.780648] pnp: PnP ACPI: found 1 devices
	[    0.814296] NET: Registered protocol family 2
	[    0.820604] tcp_listen_portaddr_hash hash table entries: 512 (order: 1, 8192 bytes)
	[    0.821551] TCP established hash table entries: 8192 (order: 4, 65536 bytes)
	[    0.822567] TCP bind hash table entries: 8192 (order: 5, 131072 bytes)
	[    0.823490] TCP: Hash tables configured (established 8192 bind 8192)
	[    0.826650] UDP hash table entries: 512 (order: 2, 16384 bytes)
	[    0.827508] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes)
	[    0.829971] NET: Registered protocol family 1
	[    0.846727] RPC: Registered named UNIX socket transport module.
	[    0.847379] RPC: Registered udp transport module.
	[    0.848334] RPC: Registered tcp transport module.
	[    0.848818] RPC: Registered tcp NFSv4.1 backchannel transport module.
	[    0.849786] PCI: CLS 0 bytes, default 64
	[    0.853671] Unpacking initramfs...
	[    6.993882] Freeing initrd memory: 123392K
	[    6.996833] hw perfevents: enabled with armv8_pmuv3_0 PMU driver, 1 counters available
	[    6.997772] kvm [1]: HYP mode not available
	[    7.699500] Initialise system trusted keyrings
	[    7.701698] workingset: timestamp_bits=44 max_order=18 bucket_order=0
	[    7.734096] squashfs: version 4.0 (2009/01/31) Phillip Lougher
	[    7.742467] NFS: Registering the id_resolver key type
	[    7.743404] Key type id_resolver registered
	[    7.744455] Key type id_legacy registered
	[    7.745321] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
	[    7.747602] 9p: Installing v9fs 9p2000 file system support
	[    7.778884] Key type asymmetric registered
	[    7.779383] Asymmetric key parser 'x509' registered
	[    7.780548] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 245)
	[    7.781375] io scheduler mq-deadline registered
	[    7.781899] io scheduler kyber registered
	[    7.809878] pl061_gpio ARMH0061:00: PL061 GPIO chip @0x0000000009030000 registered
	[    7.820983] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0
	[    7.822495] ACPI: Power Button [PWRB]
	[    7.829682] EINJ: EINJ table not found.
	[    7.893411] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
	[    7.902202] SuperH (H)SCI(F) driver initialized
	[    7.904102] msm_serial: driver initialized
	[    7.908209] cacheinfo: Unable to detect cache hierarchy for CPU 0
	[    7.940712] loop: module loaded
	[    7.957364] libphy: Fixed MDIO Bus: probed
	[    7.959166] tun: Universal TUN/TAP device driver, 1.6
	[    7.962432] thunder_xcv, ver 1.0
	[    7.962986] thunder_bgx, ver 1.0
	[    7.963542] nicpf, ver 1.0
	[    7.965950] hclge is initializing
	[    7.966402] hns3: Hisilicon Ethernet Network Driver for Hip08 Family - version
	[    7.967095] hns3: Copyright (c) 2017 Huawei Corporation.
	[    7.968228] e1000e: Intel(R) PRO/1000 Network Driver - 3.2.6-k
	[    7.968792] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
	[    7.969591] igb: Intel(R) Gigabit Ethernet Network Driver - version 5.6.0-k
	[    7.970258] igb: Copyright (c) 2007-2014 Intel Corporation.
	[    7.971023] igbvf: Intel(R) Gigabit Virtual Function Network Driver - version 2.4.0-k
	[    7.971977] igbvf: Copyright (c) 2009 - 2012 Intel Corporation.
	[    7.973720] sky2: driver version 1.30
	[    7.976724] VFIO - User Level meta-driver version: 0.3
	[    7.988959] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
	[    7.989976] ehci-pci: EHCI PCI platform driver
	[    7.991065] ehci-platform: EHCI generic platform driver
	[    7.992716] ehci-orion: EHCI orion driver
	[    7.993799] ehci-exynos: EHCI EXYNOS driver
	[    7.994893] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
	[    7.995615] ohci-pci: OHCI PCI platform driver
	[    7.996497] ohci-platform: OHCI generic platform driver
	[    7.997352] ohci-exynos: OHCI EXYNOS driver
	[    7.999395] usbcore: registered new interface driver usb-storage
	[    8.013108] rtc-efi rtc-efi: registered as rtc0
	[    8.016099] i2c /dev entries driver
	[    8.031422] sdhci: Secure Digital Host Controller Interface driver
	[    8.032163] sdhci: Copyright(c) Pierre Ossman
	[    8.034139] Synopsys Designware Multimedia Card Interface Driver
	[    8.037333] sdhci-pltfm: SDHCI platform and OF driver helper
	[    8.042220] ledtrig-cpu: registered to indicate activity on CPUs
	[    8.049014] usbcore: registered new interface driver usbhid
	[    8.049565] usbhid: USB HID core driver
	[    8.062947] NET: Registered protocol family 17
	[    8.065201] 9pnet: Installing 9P2000 support
	[    8.065961] Key type dns_resolver registered
	[    8.069421] registered taskstats version 1
	[    8.069864] Loading compiled-in X.509 certificates
	[    8.075662] rtc-efi rtc-efi: setting system clock to 2019-08-16T07:48:26 UTC (1565941706)
	[    8.079525] ALSA device list:
	[    8.080167]   No soundcards found.
	[    8.478229] Freeing unused kernel memory: 1344K
	[    8.480677] Run /init as init process
	[    9.767007] random: sshd: uninitialized urandom read (32 bytes read)
	estuary:/$

Fixes: 04ce935c6b2a ("gpio: pl061: Pass irqchip when adding gpiochip")
Signed-off-by: Wei Xu <xuwei5@hisilicon.com>
---

v1- > v2:
* rebased on https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/log/?h=devel
* attached the log based on QEMU v3.0.0 and Linux kernel v5.2.0-rc7
---
 drivers/gpio/gpio-pl061.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 722ce5c..e1a434e 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -8,6 +8,7 @@
  *
  * Data sheet: ARM DDI 0190B, September 2000
  */
+#include <linux/acpi.h>
 #include <linux/spinlock.h>
 #include <linux/errno.h>
 #include <linux/init.h>
@@ -24,6 +25,9 @@
 #include <linux/pinctrl/consumer.h>
 #include <linux/pm.h>
 
+#include "gpiolib.h"
+#include "gpiolib-acpi.h"
+
 #define GPIODIR 0x400
 #define GPIOIS  0x404
 #define GPIOIBE 0x408
@@ -345,6 +349,9 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 	if (ret)
 		return ret;
 
+	if (has_acpi_companion(dev))
+		acpi_gpiochip_request_interrupts(&pl061->gc);
+
 	amba_set_drvdata(adev, pl061);
 	dev_info(dev, "PL061 GPIO chip registered\n");
 
-- 
2.8.1

