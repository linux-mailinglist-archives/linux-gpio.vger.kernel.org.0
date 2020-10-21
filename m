Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB8FF295245
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Oct 2020 20:32:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504082AbgJUScH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Oct 2020 14:32:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438999AbgJUScH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Oct 2020 14:32:07 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C209C0613CE;
        Wed, 21 Oct 2020 11:31:54 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id z22so2949566wmi.0;
        Wed, 21 Oct 2020 11:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=yUTgxpiT08oBQ9hfi+d+pkTbWtXAxHPTehJ770HzoDg=;
        b=S65iLghfjmtS5nVmQqoagDm1ZCo9/pq8MkmFaikhBsx7OVMzqsz03Njsx7wixDk9gF
         I5i1XnMzQNXel0PwrJwGrVNEFrZms+s5/8L7u+DicbAb4Y6oU738aIon1YdpOklN7PFE
         ZMNEK9xwHK0B7H1uj3oGtUSBYYzEMJ1byred6eGxZSQfLZLCQZCdz54uc3odx04ovx8J
         KDKpMptN3BzHSqzUkDzILtwc2v7hYmuVX5kCjq5fdK5f/sv8K0TzKgRX7kdBcOa7vyje
         URzwSNMsFycA+kNeaW9HQIDqarj5aJ/ATK8gCWtmwonFVP+QyR1noPoxd05VmlwoZGDE
         WZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=yUTgxpiT08oBQ9hfi+d+pkTbWtXAxHPTehJ770HzoDg=;
        b=Yib8BSI5vWiw6rL1FK1SEVkZx/W1Axq0I7n3EBiU1TIUiTkmB/sRPPdlD1X0LGnXDY
         RVu0u1dF3oP5jUVMOMRf/YrpL9WDj5idGeC4wFW2RiLuxWKqyMQY5LdkJyaP4sUGlPku
         IVmeLVPUDi6m4GGGfEN3/OdRAghC0A2iB46vcaJfQYmIDupATFs2QHSE4TtgpiTobqEu
         7KQ53PPknFkVkI8p4V74Nv1EK6YyBAZJuGPNDNSRcwGCOKqw3KGxF1mTfsGCBoT2WOfj
         Bi2n1s3d3NIHH3ZlFi+tysuxK11m69+GVQ6JCqOQ83RjzAHFxrxTfC9RAbY3q0Tr/mtW
         pelw==
X-Gm-Message-State: AOAM530XbkdUmjzFB1pbxJ24oMVyxhX9UAMOjlG0bP+gGYY+IgjZWTjH
        EICv72dDLR4QWSOUkPTuKns=
X-Google-Smtp-Source: ABdhPJycbKWpOH3sm+7gWSfyMwO03mNoUeXaXX7zcpcDmOwWOajf3BkupBBT69Ki1BEvgbditGoLAw==
X-Received: by 2002:a7b:ca50:: with SMTP id m16mr4903891wml.106.1603305112176;
        Wed, 21 Oct 2020 11:31:52 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id z6sm4688012wmi.28.2020.10.21.11.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 11:31:51 -0700 (PDT)
Date:   Wed, 21 Oct 2020 20:31:49 +0200
From:   Corentin Labbe <clabbe.montjoie@gmail.com>
To:     linus.walleij@linaro.org, mripard@kernel.org, wens@csie.org,
        linux-gpio@vger.kernel.org, lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [BUG] Error applying setting, reverse things back on lot of devices
Message-ID: <20201021183149.GA8436@Red>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello

On next-20201016, booting my sun8i-r40-bananapi-m2-ultra, the boot end without at least stmmac working.
[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 5.9.0-next-20201016-00055-g98489213ff7c-dirty (compile@Red) (armv7a-unknown-linux-gnueabihf-gcc (Gentoo 9.3.0-r1 p3) 9.3.0, GNU ld (Gentoo 2.33.1 p2) 2.33.1) #162 SMP Tue Oct 20 08:10:25 CEST 2020
[    0.000000] CPU: ARMv7 Processor [410fc075] revision 5 (ARMv7), cr=10c5387d
[    0.000000] CPU: div instructions available: patching division code
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
[    0.000000] OF: fdt: Machine model: Banana Pi BPI-M2-Ultra
[    0.000000] Memory policy: Data cache writealloc
[    0.000000] cma: Reserved 16 MiB at 0xbec00000
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000040000000-0x000000006fffffff]
[    0.000000]   HighMem  [mem 0x0000000070000000-0x00000000bfffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000040000000-0x00000000bfffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000040000000-0x00000000bfffffff]
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: Using PSCI v0.1 Function IDs from DT
[    0.000000] percpu: Embedded 15 pages/cpu s30924 r8192 d22324 u61440
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 522752
[    0.000000] Kernel command line: console=ttyS0,115200n8 root=/dev/ram0 ip=dhcp trace_event=initcall:*,module:* trace_options=stacktrace ip=dhcp
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 bytes, linear)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 2020320K/2097152K available (7168K kernel code, 934K rwdata, 2252K rodata, 1024K init, 248K bss, 60448K reserved, 16384K cma-reserved, 1294324K highmem)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu: 	RCU event tracing is enabled.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=8 to nr_cpu_ids=4.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
[    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    0.000000] GIC: Using split EOI/Deactivate mode
[    0.000000] random: get_random_bytes called from start_kernel+0x320/0x4ac with crng_init=0
[    0.000000] arch_timer: cp15 timer(s) running at 24.00MHz (phys).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x588fe9dc0, max_idle_ns: 440795202592 ns
[    0.000007] sched_clock: 56 bits at 24MHz, resolution 41ns, wraps every 4398046511097ns
[    0.000020] Switching to timer-based delay loop, resolution 41ns
[    0.000176] Console: colour dummy device 80x30
[    0.000230] Calibrating delay loop (skipped), value calculated using timer frequency.. 48.00 BogoMIPS (lpj=240000)
[    0.000251] pid_max: default: 32768 minimum: 301
[    0.000395] Mount-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
[    0.000414] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
[    0.001117] CPU: Testing write buffer coherency: ok
[    0.001420] /cpus/cpu@0 missing clock-frequency property
[    0.001442] /cpus/cpu@1 missing clock-frequency property
[    0.001459] /cpus/cpu@2 missing clock-frequency property
[    0.001477] /cpus/cpu@3 missing clock-frequency property
[    0.001490] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[    0.002001] Setting up static identity map for 0x40100000 - 0x40100060
[    0.002119] rcu: Hierarchical SRCU implementation.
[    0.002580] smp: Bringing up secondary CPUs ...
[    0.013271] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
[    0.024063] CPU2: thread -1, cpu 2, socket 0, mpidr 80000002
[    0.034784] CPU3: thread -1, cpu 3, socket 0, mpidr 80000003
[    0.034880] smp: Brought up 1 node, 4 CPUs
[    0.034904] SMP: Total of 4 processors activated (192.00 BogoMIPS).
[    0.034912] CPU: All CPU(s) started in HYP mode.
[    0.034919] CPU: Virtualization extensions available.
[    0.035754] devtmpfs: initialized
[    0.041021] VFP support v0.3: implementor 41 architecture 2 part 30 variant 7 rev 5
[    0.041258] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.041283] futex hash table entries: 1024 (order: 4, 65536 bytes, linear)
[    0.042026] pinctrl core: initialized pinctrl subsystem
[    0.043049] NET: Registered protocol family 16
[    0.044324] DMA: preallocated 256 KiB pool for atomic coherent allocations
[    0.045360] thermal_sys: Registered thermal governor 'step_wise'
[    0.045788] hw-breakpoint: found 5 (+1 reserved) breakpoint and 4 watchpoint registers.
[    0.045805] hw-breakpoint: maximum watchpoint size is 8 bytes.
[    0.065862] alg: extra crypto tests enabled.  This is intended for developer use only.
[    0.123361] alg_test_stdrng test ansi_cprng
[    0.150327] SCSI subsystem initialized
[    0.150742] usbcore: registered new interface driver usbfs
[    0.150789] usbcore: registered new interface driver hub
[    0.150845] usbcore: registered new device driver usb
[    0.151014] mc: Linux media interface: v0.10
[    0.151049] videodev: Linux video capture interface: v2.00
[    0.151149] pps_core: LinuxPPS API ver. 1 registered
[    0.151159] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.151180] PTP clock support registered
[    0.151575] Advanced Linux Sound Architecture Driver Initialized.
[    0.152420] clocksource: Switched to clocksource arch_sys_counter
[    0.159588] NET: Registered protocol family 2
[    0.160080] tcp_listen_portaddr_hash hash table entries: 512 (order: 0, 6144 bytes, linear)
[    0.160112] TCP established hash table entries: 8192 (order: 3, 32768 bytes, linear)
[    0.160188] TCP bind hash table entries: 8192 (order: 4, 65536 bytes, linear)
[    0.160304] TCP: Hash tables configured (established 8192 bind 8192)
[    0.160423] UDP hash table entries: 512 (order: 2, 16384 bytes, linear)
[    0.160489] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes, linear)
[    0.160689] NET: Registered protocol family 1
[    0.161248] RPC: Registered named UNIX socket transport module.
[    0.161263] RPC: Registered udp transport module.
[    0.161272] RPC: Registered tcp transport module.
[    0.161280] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.161510] Unpacking initramfs...
[    1.988543] Freeing initrd memory: 30460K
[    1.989598] hw perfevents: enabled with armv7_cortex_a7 PMU driver, 5 counters available
[    1.990836] workingset: timestamp_bits=30 max_order=19 bucket_order=0
[    1.996523] NFS: Registering the id_resolver key type
[    1.996573] Key type id_resolver registered
[    1.996582] Key type id_legacy registered
[    1.996659] NET: Registered protocol family 38
[    1.996725] bounce: pool size: 64 pages
[    1.996770] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 246)
[    1.996782] io scheduler mq-deadline registered
[    1.996790] io scheduler kyber registered
[    1.997771] sun4i-usb-phy 1c13400.phy: failed to get clock usb0_phy
[    1.999624] sun4i-pinctrl 1c20800.pinctrl: supply vcc-pi not found, using dummy regulator
[    2.052865] Serial: 8250/16550 driver, 8 ports, IRQ sharing disabled
[    2.058849] sun8i-mixer 1100000.mixer: Couldn't get our reset line
[    2.058962] sun4i-drm display-engine: Couldn't bind all pipelines components
[    2.061927] lima 1c40000.gpu: gp - mali400 version major 1 minor 1
[    2.061987] lima 1c40000.gpu: pp0 - mali400 version major 1 minor 1
[    2.062041] lima 1c40000.gpu: pp1 - mali400 version major 1 minor 1
[    2.062092] lima 1c40000.gpu: l2 cache 64K, 4-way, 64byte cache line, 64bit external bus
[    2.062567] lima 1c40000.gpu: bus rate = 200000000
[    2.062584] lima 1c40000.gpu: mod rate = 297000000
[    2.062990] [drm] Initialized lima 1.1.0 20191231 for 1c40000.gpu on minor 0
[    2.071234] loop: module loaded
[    2.072785] libphy: Fixed MDIO Bus: probed
[    2.073308] CAN device driver interface
[    2.074052] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    2.074063] ehci-platform: EHCI generic platform driver
[    2.074552] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    2.074579] ohci-platform: OHCI generic platform driver
[    2.076335] sun6i-rtc 1c20400.rtc: registered as rtc0
[    2.076383] sun6i-rtc 1c20400.rtc: setting system clock to 1970-01-01T00:00:08 UTC (8)
[    2.076394] sun6i-rtc 1c20400.rtc: RTC enabled
[    2.076673] i2c /dev entries driver
[    2.079404] sunxi-wdt 1c20c90.watchdog: Watchdog enabled (timeout=16 sec, nowayout=0)
[    2.079812] device-mapper: ioctl: 4.43.0-ioctl (2020-10-01) initialised: dm-devel@redhat.com
[    2.080803] sun8i-ce 1c15000.crypto: Set mod clock to 300000000 (300 Mhz) from 24000000 (24 Mhz)
[    2.081050] sun8i-ce 1c15000.crypto: will run requests pump with realtime priority
[    2.081384] sun8i-ce 1c15000.crypto: will run requests pump with realtime priority
[    2.081521] sun8i-ce 1c15000.crypto: will run requests pump with realtime priority
[    2.081630] sun8i-ce 1c15000.crypto: will run requests pump with realtime priority
[    2.081728] sun8i-ce 1c15000.crypto: Register cbc(aes)
[    2.120538] sun8i-ce 1c15000.crypto: Fallback for cbc-aes-sun8i-ce is cbc(aes-generic)
[    2.357120] sun8i-ce 1c15000.crypto: Register ecb(aes)
[    2.387952] sun8i-ce 1c15000.crypto: Fallback for ecb-aes-sun8i-ce is ecb(aes-generic)
[    2.407064] random: fast init done
[    2.589700] sun8i-ce 1c15000.crypto: Register cbc(des3_ede)
[    2.641051] sun8i-ce 1c15000.crypto: Fallback for cbc-des3-sun8i-ce is cbc(des3_ede-generic)
[    3.281510] sun8i-ce 1c15000.crypto: Register ecb(des3_ede)
[    3.333414] sun8i-ce 1c15000.crypto: Fallback for ecb-des3-sun8i-ce is ecb(des3_ede-generic)
[    3.874269] sun8i-ce 1c15000.crypto: Register md5
[    3.874437] sun8i-ce 1c15000.crypto: Fallback for md5-sun8i-ce is md5-generic
[    3.980669] sun8i-ce 1c15000.crypto: Register sha1
[    3.980869] sun8i-ce 1c15000.crypto: Fallback for sha1-sun8i-ce is sha1-generic
[    4.104525] sun8i-ce 1c15000.crypto: Register sha224
[    4.159000] sun8i-ce 1c15000.crypto: Fallback for sha224-sun8i-ce is sha224-generic
[    4.323465] sun8i-ce 1c15000.crypto: Register sha256
[    4.323665] sun8i-ce 1c15000.crypto: Fallback for sha256-sun8i-ce is sha256-generic
[    4.484572] sun8i-ce 1c15000.crypto: DEBUG: Algo of sha384 not supported
[    4.484598] sun8i-ce 1c15000.crypto: DEBUG: Algo of sha512 not supported
[    4.484609] sun8i-ce 1c15000.crypto: Register stdrng
[    4.484782] alg_test_stdrng test sun8i-ce-prng
[    4.484881] sun8i-ce 1c15000.crypto: TRNG not supported
[    4.484897] sun8i-ce 1c15000.crypto: CryptoEngine Die ID 0
[    4.486084] usbcore: registered new interface driver usbhid
[    4.486098] usbhid: USB HID core driver
[    4.488554] NET: Registered protocol family 17
[    4.488580] can: controller area network core
[    4.488668] NET: Registered protocol family 29
[    4.488681] can: raw protocol
[    4.488691] can: broadcast manager protocol
[    4.488705] can: netlink gateway - max_hops=1
[    4.488918] Key type dns_resolver registered
[    4.489063] Registering SWP/SWPB emulation handler
[    4.501808] sun4i-usb-phy 1c13400.phy: Couldn't get regulator usb1_vbus... Deferring probe
[    4.503853] sun4i-pinctrl 1c20800.pinctrl: supply vcc-pi not found, using dummy regulator
[    4.505470] sun4i-pinctrl 1c20800.pinctrl: initialized sunXi PIO driver
[    4.507391] sun4i-pinctrl 1c20800.pinctrl: supply vcc-pb not found, using dummy regulator
[    4.508216] printk: console [ttyS0] disabled
[    4.528470] 1c28000.serial: ttyS0 at MMIO 0x1c28000 (irq = 45, base_baud = 1500000) is a U6_16550A
[    5.585887] printk: console [ttyS0] enabled
[    5.590785] dw-apb-uart 1c28c00.serial: Error applying setting, reverse things back
[    5.609876] sun4i-drm display-engine: bound 1100000.mixer (ops 0xc087f4d0)
[    5.618713] sun4i-drm display-engine: bound 1200000.mixer (ops 0xc087f4d0)
[    5.626022] sun4i-drm display-engine: bound 1c70000.tcon-top (ops 0xc08837e0)
[    5.633467] sun4i-drm display-engine: bound 1c73000.lcd-controller (ops 0xc087b760)
[    5.641177] sun8i-dw-hdmi 1ee0000.hdmi: supply hvcc not found, using dummy regulator
[    5.682538] sun8i-dw-hdmi 1ee0000.hdmi: Detected HDMI TX controller v1.32a with HDCP (sun8i_dw_hdmi_phy)
[    5.692591] sun8i-dw-hdmi 1ee0000.hdmi: registered DesignWare HDMI I2C bus driver
[    5.700429] sun4i-drm display-engine: bound 1ee0000.hdmi (ops 0xc087ea28)
[    5.707707] [drm] Initialized sun4i-drm 1.0.0 20150629 for display-engine on minor 1
[    5.715530] sun4i-drm display-engine: [drm] Cannot find any crtc or sizes
[    5.723563] dwmac-sun8i 1c50000.ethernet: Error applying setting, reverse things back
[    5.734175] sun4i-drm display-engine: [drm] Cannot find any crtc or sizes
[    5.741110] i2c i2c-1: Not using recovery: no recover_bus() found
[    5.748415] axp20x-i2c 1-0034: AXP20x variant AXP221 found
[    5.761265] input: axp20x-pek as /devices/platform/soc/1c2ac00.i2c/i2c-1/1-0034/axp221-pek/input/input0
[    5.780739] vcc-3v3: supplied by regulator-dummy
[    5.786045] vdd-cpu: supplied by regulator-dummy
[    5.791332] vdd-sys: supplied by regulator-dummy
[    5.796585] dcdc4: supplied by regulator-dummy
[    5.801647] vcc-dram: supplied by regulator-dummy
[    5.806470] vcc-gmac-phy: failed to get the current voltage: -EINVAL
[    5.812839] axp20x-regulator axp20x-regulator: Failed to register dc1sw
[    5.820291] axp20x-regulator: probe of axp20x-regulator failed with error -22
[    5.828002] axp20x-adc axp22x-adc: DMA mask not set
[    5.833987] axp20x-i2c 1-0034: AXP20X driver loaded
[    5.839676] Registered IR keymap rc-empty
[    5.843800] rc rc0: sunxi-ir as /devices/platform/soc/1c21800.ir/rc/rc0
[    5.850532] input: sunxi-ir as /devices/platform/soc/1c21800.ir/rc/rc0/input1
[    5.858103] sunxi-ir 1c21800.ir: initialized sunXi IR driver
[    5.864697] sun4i-pinctrl 1c20800.pinctrl: supply vcc-ph not found, using dummy regulator
[    5.874795] sunxi-mmc 1c0f000.mmc: Error applying setting, reverse things back
[    5.875558] sunxi-mmc 1c10000.mmc: Error applying setting, reverse things back
[    5.876884] dw-apb-uart 1c28c00.serial: Error applying setting, reverse things back
[    5.878097] dwmac-sun8i 1c50000.ethernet: Error applying setting, reverse things back
[    5.878735] ehci-platform 1c19000.usb: EHCI Host Controller
[    5.878762] ehci-platform 1c19000.usb: new USB bus registered, assigned bus number 1
[    5.879477] sunxi-mmc 1c11000.mmc: Error applying setting, reverse things back
[    5.925620] ehci-platform 1c19000.usb: irq 37, io mem 0x01c19000
[    5.952422] ehci-platform 1c19000.usb: USB 2.0 started, EHCI 1.00
[    5.959298] hub 1-0:1.0: USB hub found
[    5.963115] hub 1-0:1.0: 1 port detected
[    5.968106] ehci-platform 1c1c000.usb: EHCI Host Controller
[    5.973724] ehci-platform 1c1c000.usb: new USB bus registered, assigned bus number 2
[    5.981683] ehci-platform 1c1c000.usb: irq 39, io mem 0x01c1c000
[    6.012423] ehci-platform 1c1c000.usb: USB 2.0 started, EHCI 1.00
[    6.019222] hub 2-0:1.0: USB hub found
[    6.023042] hub 2-0:1.0: 1 port detected
[    6.027973] ohci-platform 1c19400.usb: Generic Platform OHCI controller
[    6.034626] ohci-platform 1c19400.usb: new USB bus registered, assigned bus number 3
[    6.042544] ohci-platform 1c19400.usb: irq 38, io mem 0x01c19400
[    6.117046] hub 3-0:1.0: USB hub found
[    6.120832] hub 3-0:1.0: 1 port detected
[    6.125796] ohci-platform 1c1c400.usb: Generic Platform OHCI controller
[    6.132452] ohci-platform 1c1c400.usb: new USB bus registered, assigned bus number 4
[    6.140346] ohci-platform 1c1c400.usb: irq 40, io mem 0x01c1c400
[    6.217070] hub 4-0:1.0: USB hub found
[    6.220858] hub 4-0:1.0: 1 port detected
[    6.225960] dw-apb-uart 1c28c00.serial: Error applying setting, reverse things back
[    6.234620] dwmac-sun8i 1c50000.ethernet: Error applying setting, reverse things back
[    6.244069] sunxi-mmc 1c11000.mmc: Error applying setting, reverse things back
[    6.244793] sunxi-mmc 1c0f000.mmc: Error applying setting, reverse things back
[    6.245206] sunxi-mmc 1c10000.mmc: Error applying setting, reverse things back
[    6.245793] dw-apb-uart 1c28c00.serial: Error applying setting, reverse things back
[    6.246659] dwmac-sun8i 1c50000.ethernet: Error applying setting, reverse things back
[    6.247794] sunxi-mmc 1c10000.mmc: Error applying setting, reverse things back
[    6.251915] dw-apb-uart 1c28c00.serial: Error applying setting, reverse things back
[    6.297008] dwmac-sun8i 1c50000.ethernet: Error applying setting, reverse things back
[    6.306355] sunxi-mmc 1c10000.mmc: Error applying setting, reverse things back
[    6.306908] sunxi-mmc 1c11000.mmc: Error applying setting, reverse things back
[    6.307660] dw-apb-uart 1c28c00.serial: Error applying setting, reverse things back
[    6.307935] sunxi-mmc 1c0f000.mmc: Error applying setting, reverse things back
[   18.812596] ALSA device list:
[   18.815569]   No soundcards found.
[   18.821014] Freeing unused kernel memory: 1024K
[   18.825777] Run /init as init process

I have bisected this issue but some (partialy unrelated) crash prevent to find the good commit:
git bisect start
# good: [3acff11cef1dece31cd29956f19181895996a7c5] regulator: gpio: Honor regulator-boot-on property
git bisect good 3acff11cef1dece31cd29956f19181895996a7c5
# bad: [6228cc8aed9e51afa56727b11001b37913e4dda6] regulator: rtmv20: Add missing regcache cache only before marked as dirty
git bisect bad 6228cc8aed9e51afa56727b11001b37913e4dda6
# good: [8186749621ed6b8fc42644c399e8c755a2b6f630] Merge tag 'drm-next-2020-08-06' of git://anongit.freedesktop.org/drm/drm
git bisect good 8186749621ed6b8fc42644c399e8c755a2b6f630
# good: [60e76bb8a4e4c5398ea9053535e1fd0c9d6bb06e] Merge tag 'm68knommu-for-v5.9' of git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu
git bisect good 60e76bb8a4e4c5398ea9053535e1fd0c9d6bb06e
# good: [d566a9c2d482640abf5e602957b44e7b3bbe858d] perf sched: Prefer sched_waking event when it exists
git bisect good d566a9c2d482640abf5e602957b44e7b3bbe858d
# skip: [ab97a28908bff7ffdadd50da17c2b4d9a4dade86] Merge branch 'sfc-more-EF100-fixes'
git bisect skip ab97a28908bff7ffdadd50da17c2b4d9a4dade86
# bad: [335956421c86f64fd46186d76d3961f6adcff187] cxgb4: Fix work request size calculation for loopback test
git bisect bad 335956421c86f64fd46186d76d3961f6adcff187
# skip: [335956421c86f64fd46186d76d3961f6adcff187] cxgb4: Fix work request size calculation for loopback test
git bisect skip 335956421c86f64fd46186d76d3961f6adcff187
# good: [e764a1e32337aaf325fc5b14a5bbd06eabba4699] Merge branch 'i2c/for-5.9' of git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux
git bisect good e764a1e32337aaf325fc5b14a5bbd06eabba4699
# skip: [884e0d3dd59dde1c1f0fbb5b9db2bcdc581982c7] Merge tag 'mfd-next-5.9-1' of git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd
git bisect skip 884e0d3dd59dde1c1f0fbb5b9db2bcdc581982c7
# good: [0ac10dc1888cd1a8b994f32b51f0eaeba1e803ef] Merge branch 'bpf_iter-uapi-fix'
git bisect good 0ac10dc1888cd1a8b994f32b51f0eaeba1e803ef
# good: [fc4177be963dccad73b98d7db3a8a38911f952b7] exec: restore EACCES of S_ISDIR execve()
git bisect good fc4177be963dccad73b98d7db3a8a38911f952b7
# skip: [410520d07f5c66a6c1f3eb7ef2063d9bdd3d440b] Merge tag '9p-for-5.9-rc1' of git://github.com/martinetd/linux
git bisect skip 410520d07f5c66a6c1f3eb7ef2063d9bdd3d440b
# good: [0f71241a8e32baf9ac290cf915bc9b3ff265f7d3] selftests/exec: add file type errno tests
git bisect good 0f71241a8e32baf9ac290cf915bc9b3ff265f7d3
# good: [638037b158df00a860251772239778a25a692b8c] NFS: Add tracepoints for layouterror and layoutstats.
git bisect good 638037b158df00a860251772239778a25a692b8c
# skip: [1195d58f003bf84d37fc5c30017600e09ba567b2] Merge tag 'sched-urgent-2020-08-15' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
git bisect skip 1195d58f003bf84d37fc5c30017600e09ba567b2
# skip: [6ffdcde4ee9a20beda096dec664da89002610d7d] Merge tag 'edac_updates_for_5.9_pt2' of git://git.kernel.org/pub/scm/linux/kernel/git/ras/ras
git bisect skip 6ffdcde4ee9a20beda096dec664da89002610d7d
# good: [44ad23dfbccbcd26d6ca504eba1ac55755864969] libbpf: Handle BTF pointer sizes more carefully
git bisect good 44ad23dfbccbcd26d6ca504eba1ac55755864969
# skip: [eb1319af4119c4936e02c879295e9fd4d50bbe3a] Merge tag 'locking-urgent-2020-08-15' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
git bisect skip eb1319af4119c4936e02c879295e9fd4d50bbe3a
# good: [6c357848b44b4016ca422178aa368a7472245f6f] mm: replace hpage_nr_pages with thp_nr_pages
git bisect good 6c357848b44b4016ca422178aa368a7472245f6f
# good: [2db13a9b30f7e438777eb1a462c4b055ba948b89] perf bench numa: Use numa_node_to_cpus() to bind tasks to nodes
git bisect good 2db13a9b30f7e438777eb1a462c4b055ba948b89
# skip: [713eee84720e6525bc5b65954c5087604a15f5e8] Merge tag 'perf-tools-2020-08-14' of git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux
git bisect skip 713eee84720e6525bc5b65954c5087604a15f5e8
# good: [87bd8c2b93ae899ecd90a5e0550cdae4260cc4ca] Merge tag 'sound-fix-5.9-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound
git bisect good 87bd8c2b93ae899ecd90a5e0550cdae4260cc4ca
# skip: [7f5faaaa5909bb0b26dcd309424da14bdf0c7e93] Merge tag 'perf-urgent-2020-08-15' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
git bisect skip 7f5faaaa5909bb0b26dcd309424da14bdf0c7e93
# good: [8a8fb8977ea2bdf160b9e475cf2350abbad4f0e7] scsi: scsi_transport_sas: Add spaces around binary operator "|"
git bisect good 8a8fb8977ea2bdf160b9e475cf2350abbad4f0e7
# good: [18737f4243abe02f55ad62ad4baa04c318b48e8d] Merge branch 'akpm' (patches from Andrew)
git bisect good 18737f4243abe02f55ad62ad4baa04c318b48e8d
# good: [e8efa9b88e3c20a20ff34bb33e2e94bf6896016a] md: get sysfs entry after redundancy attr group create
git bisect good e8efa9b88e3c20a20ff34bb33e2e94bf6896016a
# good: [846f9e1fb9b9a2c4eecefa2fdbfb51e975a7d532] dma-mapping: consolidate the NO_DMA definition in kernel/dma/Kconfig
git bisect good 846f9e1fb9b9a2c4eecefa2fdbfb51e975a7d532
# skip: [50f6c7dbd973092d8e5f3c89f29eb4bea19fdebd] Merge tag 'x86-urgent-2020-08-15' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
git bisect skip 50f6c7dbd973092d8e5f3c89f29eb4bea19fdebd
# skip: [b07175dc41babfec057f494d22a750af755297d8] Merge tag 'devicetree-fixes-for-5.9' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux
git bisect skip b07175dc41babfec057f494d22a750af755297d8
# good: [3c4dc21b75a74d4a8458624649a3e09af399a384] perf: ftrace: Add set_tracing_options() to set all trace options
git bisect good 3c4dc21b75a74d4a8458624649a3e09af399a384
# good: [45d93065c8ec4e671f4b1ff02b5b3a633658a92f] mfd: stm32: Enable regmap fast_io for stm32-lptimer
git bisect good 45d93065c8ec4e671f4b1ff02b5b3a633658a92f
# skip: [7d2594cd1fa0b03b2746ce811926ee150a3a14fa] mfd: smsc-ece1099: Remove driver
git bisect skip 7d2594cd1fa0b03b2746ce811926ee150a3a14fa
# skip: [db06ea341fcd1752fbdb58454507faa140e3842f] sfc: really check hash is valid before using it
git bisect skip db06ea341fcd1752fbdb58454507faa140e3842f
# skip: [a3f673d0092cee167b2a6e3d61454405d0a06b25] dt-bindings: mfd: st,stmfx: Remove I2C unit name
git bisect skip a3f673d0092cee167b2a6e3d61454405d0a06b25
# good: [475f63ae63b5102ae6423d1712333929d04d6ecc] kexec_file: Correctly output debugging information for the PT_LOAD ELF header
git bisect good 475f63ae63b5102ae6423d1712333929d04d6ecc
# skip: [4ee1d9dc8073acd40f04e5fe3771a5dff978d077] mfd: intel_soc_pmic_mrfld: Simplify the return expression of intel_scu_ipc_dev_iowrite8()
git bisect skip 4ee1d9dc8073acd40f04e5fe3771a5dff978d077
# good: [5c04da55c754c44937b3d19c6522f9023fd5c5d5] netfilter: ebtables: reject bogus getopt len value
git bisect good 5c04da55c754c44937b3d19c6522f9023fd5c5d5
# good: [f4fd77fd87e9b214c26bb2ebd4f90055eaea5ade] can: j1939: fix support for multipacket broadcast message
git bisect good f4fd77fd87e9b214c26bb2ebd4f90055eaea5ade
# good: [2ed0b7578170c3bab10cde09d4440897b305e40c] 9p: Remove unneeded cast from memory allocation
git bisect good 2ed0b7578170c3bab10cde09d4440897b305e40c
# skip: [e7b85500885f2a70129f5d3a72153e23b37d0fe5] mfd: max77693-private: Drop a duplicated word
git bisect skip e7b85500885f2a70129f5d3a72153e23b37d0fe5
# good: [51a4cc112c7a42b62a91bcccdfac42e7c4561729] io_uring: defer file table grabbing request cleanup for locked requests
git bisect good 51a4cc112c7a42b62a91bcccdfac42e7c4561729
# skip: [f6513bd39c15af8f8a63b1fbfcb1bf4717241655] Merge tag '5.9-rc-smb3-fixes-part2' of git://git.samba.org/sfrench/cifs-2.6
git bisect skip f6513bd39c15af8f8a63b1fbfcb1bf4717241655
# good: [3d4a87576f3762c8c986950af157bc9025808b5c] mfd: sprd-sc27xx-spi: Fix symbol 'sprd_pmic_detect_charger_type' was not declared warning
git bisect good 3d4a87576f3762c8c986950af157bc9025808b5c
# skip: [9123e3a74ec7b934a4a099e98af6a61c2f80bbf5] Linux 5.9-rc1
git bisect skip 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5
# good: [492e4edba6e2fc0620a69266d33f29c4a1f9ac1e] perf ftrace: Make option description initials all capital letters
git bisect good 492e4edba6e2fc0620a69266d33f29c4a1f9ac1e
# skip: [e15d7f2b81d2e7d93115d46fa931b366c1cdebc2] mfd: syscon: Use a unique name with regmap_config
git bisect skip e15d7f2b81d2e7d93115d46fa931b366c1cdebc2
# skip: [06a4ec1d9dc652e17ee3ac2ceb6c7cf6c2b75cdd] Merge tag 'pstore-v5.9-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux
git bisect skip 06a4ec1d9dc652e17ee3ac2ceb6c7cf6c2b75cdd
# skip: [4b6c093e21d36bede0fd88fd0aeb3b03647260e4] Merge tag 'block-5.9-2020-08-14' of git://git.kernel.dk/linux-block
git bisect skip 4b6c093e21d36bede0fd88fd0aeb3b03647260e4
# good: [07d88c97aef826f1ba8a5026ea30700f85433057] mfd: db8500-prcmu: Remove incorrect function header from .probe() function
git bisect good 07d88c97aef826f1ba8a5026ea30700f85433057
# good: [b35fd7422c2f8e04496f5a770bd4e1a205414b3f] block: check queue's limits.discard_granularity in __blkdev_issue_discard()
git bisect good b35fd7422c2f8e04496f5a770bd4e1a205414b3f
# good: [981b1261bfdf7cb3e3c2029ecc4a1510d46eff9e] mfd: si476x-cmd: Add missing documentation for si476x_cmd_fm_rds_status()'s arg 'report'
git bisect good 981b1261bfdf7cb3e3c2029ecc4a1510d46eff9e
# good: [7f9bf6e82461b97ce43a912cb4a959c5a41367ac] Revert "net: xdp: pull ethernet header off packet after computing skb->protocol"
git bisect good 7f9bf6e82461b97ce43a912cb4a959c5a41367ac
# good: [d58669b093997e4e5f98c38a54f99761657c19d2] ACPI: APD: Change name from ST to FCH
git bisect good d58669b093997e4e5f98c38a54f99761657c19d2
# good: [6dfdf673ccb24dccc95b342235cac3e585c5af34] sh: use the generic dma coherent remap allocator
git bisect good 6dfdf673ccb24dccc95b342235cac3e585c5af34
# good: [52416ffcf823ee11aa19792715664ab94757f111] x86/purgatory: Don't generate debug info for purgatory.ro
git bisect good 52416ffcf823ee11aa19792715664ab94757f111
# good: [09fc67b500c7f0bb1b5ed774197ac7f2c5285655] kprobes: Remove show_registers() function prototype
git bisect good 09fc67b500c7f0bb1b5ed774197ac7f2c5285655
# good: [c8c412f976124d85b8ded85c6ac3f760c12b63a3] SMB3: Fix mkdir when idsfromsid configured on mount
git bisect good c8c412f976124d85b8ded85c6ac3f760c12b63a3
# skip: [4f4ed4543e2096dc0158ff79bd6d8bc09e27fa93] mfd: Replace HTTP links with HTTPS ones
git bisect skip 4f4ed4543e2096dc0158ff79bd6d8bc09e27fa93
# good: [0bb605c2c7f2b4b314b91510810b226de7f34fa1] sh: Add SECCOMP_FILTER
git bisect good 0bb605c2c7f2b4b314b91510810b226de7f34fa1
# skip: [1a5d9dbbaf3af4d029a081bd58dc83b6a25d109e] Merge tag 'pm-5.9-rc1-3' of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm
git bisect skip 1a5d9dbbaf3af4d029a081bd58dc83b6a25d109e
# skip: [9cbbc451098ec1e9942886023203b2247dec94bd] sfc: take correct lock in ef100_reset()
git bisect skip 9cbbc451098ec1e9942886023203b2247dec94bd
# skip: [341323fa0eed1b201130b7af84d40fa04725c832] Merge tag 'acpi-5.9-rc1-2' of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm
git bisect skip 341323fa0eed1b201130b7af84d40fa04725c832
# good: [46b5780688c0d825b6b8d49b267b13102bea512d] dt-bindings: mfd: Convert ChromeOS EC bindings to json-schema
git bisect good 46b5780688c0d825b6b8d49b267b13102bea512d
# skip: [819e42e00d2eca536d5187de21971ed345861102] mfd: motorola-cpcap: Disable interrupt for suspend
git bisect skip 819e42e00d2eca536d5187de21971ed345861102
# skip: [37711e5e2325535bf094bdc0a66790d659b52d5b] Merge tag 'nfs-for-5.9-1' of git://git.linux-nfs.org/projects/trondmy/linux-nfs
git bisect skip 37711e5e2325535bf094bdc0a66790d659b52d5b
# skip: [e9faaf056d2812c0b602c3dbeb5b83756b58abc5] dt-bindings: mfd: ti,j721e-system-controller.yaml: Add J721e system controller
git bisect skip e9faaf056d2812c0b602c3dbeb5b83756b58abc5
# good: [f516fb704d02fff292cb79a6ad85c56529f7c8cf] dt-bindings: Whitespace clean-ups in schema files
git bisect good f516fb704d02fff292cb79a6ad85c56529f7c8cf
# skip: [8b61fba503904acae24aeb2bd5569b4d6544d48f] macvlan: validate setting of multiple remote source MAC addresses
git bisect skip 8b61fba503904acae24aeb2bd5569b4d6544d48f
# good: [cb75c95c5262328bd4da3dd334f6826a3a34a979] Documentation/locking/locktypes: Fix a typo
git bisect good cb75c95c5262328bd4da3dd334f6826a3a34a979
# good: [d4e7cd36a90e38e0276d6ce0c20f5ccef17ec38c] io_uring: sanitize double poll handling
git bisect good d4e7cd36a90e38e0276d6ce0c20f5ccef17ec38c
# skip: [5a4fe0624687e62919a5913dc7c937fbfcf61fdc] mailmap: Add WeiXiong Liao
git bisect skip 5a4fe0624687e62919a5913dc7c937fbfcf61fdc
# good: [03dd061f0d203c3479791490d6b9359b2eaf9fec] sh: bring syscall_set_return_value in line with other architectures
git bisect good 03dd061f0d203c3479791490d6b9359b2eaf9fec
# skip: [d6bd5201f7eaa9c15ea9b0f8ff17dd7bc3b9d78f] mailmap: Restore dictionary sorting
git bisect skip d6bd5201f7eaa9c15ea9b0f8ff17dd7bc3b9d78f
# good: [ff041727e9e029845857cac41aae118ead5e261b] NFS: Don't move layouts to plh_return_segs list while in use
git bisect good ff041727e9e029845857cac41aae118ead5e261b
# skip: [e6a43910d55d09dae65772ad571d4c61e459b17a] sfc: don't free_irq()s if they were never requested
git bisect skip e6a43910d55d09dae65772ad571d4c61e459b17a
# skip: [2cc3c4b3c2e9c99e90aaf19cd801ff2c160f283c] Merge tag 'io_uring-5.9-2020-08-15' of git://git.kernel.dk/linux-block
git bisect skip 2cc3c4b3c2e9c99e90aaf19cd801ff2c160f283c
# skip: [d097965bb6682afe1f8481923b16c033f708923b] mfd: core: Fix formatting of MFD helpers
git bisect skip d097965bb6682afe1f8481923b16c033f708923b
# skip: [6f6aea7e966cda5a817d091e938c2d9b52209893] parisc: fix PMD pages allocation by restoring pmd_alloc_one()
git bisect skip 6f6aea7e966cda5a817d091e938c2d9b52209893
# good: [b4487b93545214a9db8cbf32e86411677b0cca21] nfs: Fix getxattr kernel panic and memory overflow
git bisect good b4487b93545214a9db8cbf32e86411677b0cca21
# good: [8dfddfb79653df7c38a9c8c4c034f242a36acee9] net: qrtr: fix usage of idr in port assignment to socket
git bisect good 8dfddfb79653df7c38a9c8c4c034f242a36acee9
# good: [4bb5fcb97a5df0bbc0a27e0252b1e7ce140a8431] perf/x86/rapl: Fix missing psys sysfs attributes
git bisect good 4bb5fcb97a5df0bbc0a27e0252b1e7ce140a8431
# good: [7f8802f2d2ed67ffbac9264f946a52507f749e19] ACPI: APD: Add a fmw property is_raven
git bisect good 7f8802f2d2ed67ffbac9264f946a52507f749e19
# skip: [788f920a0f137baa4dbc1efdd5039c4a0a01b8d7] sfc: null out channel->rps_flow_id after freeing it
git bisect skip 788f920a0f137baa4dbc1efdd5039c4a0a01b8d7
# skip: [d84835b118ed8c14c21fa056ca54014b2eff068b] Merge tag 'riscv-for-linus-5.9-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux
git bisect skip d84835b118ed8c14c21fa056ca54014b2eff068b
# good: [563c53e73b8b6ec842828736f77e633f7b0911e9] NFS: Fix flexfiles read failover
git bisect good 563c53e73b8b6ec842828736f77e633f7b0911e9
# skip: [5bbec3cfe376ed0014d9456a9be11d5ed75d587b] Merge tag 'sh-for-5.9' of git://git.libc.org/linux-sh
git bisect skip 5bbec3cfe376ed0014d9456a9be11d5ed75d587b
# good: [fe6a8fc5ed2f0081f17375ae2005718522c392c6] loop: unset GENHD_FL_NO_PART_SCAN on LOOP_CONFIGURE
git bisect good fe6a8fc5ed2f0081f17375ae2005718522c392c6
# good: [c1e2b8422bf946c80e832cee22b3399634f87a2c] block: fix double account of flush request's driver tag
git bisect good c1e2b8422bf946c80e832cee22b3399634f87a2c
# skip: [4cf7562190c795f1f95be6ee0d161107d0dc5d49] Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
git bisect skip 4cf7562190c795f1f95be6ee0d161107d0dc5d49
# good: [76d4467a97bd8c4bb01e810a5129c8f96d7dcbf8] riscv: Setup exception vector for nommu platform
git bisect good 76d4467a97bd8c4bb01e810a5129c8f96d7dcbf8
# skip: [cf84dc0bb40f4b41f7853f224b37954cf273ee24] mfd: rn5t618: Make restart handler atomic safe
git bisect skip cf84dc0bb40f4b41f7853f224b37954cf273ee24
# good: [76d10256a97a7cab72b123d54b766a3c17da658c] x86/fpu/xstate: Fix an xstate size check warning with architectural LBRs
git bisect good 76d10256a97a7cab72b123d54b766a3c17da658c
# skip: [29e44f4535faa71a70827af3639b5e6762d8f02a] watch_queue: Limit the number of watches a user can hold
git bisect skip 29e44f4535faa71a70827af3639b5e6762d8f02a
# good: [74f41adab0f4a61857833e1b6fa8e9ad12c251b6] perf/x86/rapl: Support multiple RAPL unit quirks
git bisect good 74f41adab0f4a61857833e1b6fa8e9ad12c251b6
# skip: [23ef2b642b85f03a109fbf5958134a5e40193dbd] mfd: da9055: pdata.h: Drop a duplicated word
git bisect skip 23ef2b642b85f03a109fbf5958134a5e40193dbd
# good: [a1bd06853ee478d37fae9435c5521e301de94c67] sched: Fix use of count for nr_running tracepoint
git bisect good a1bd06853ee478d37fae9435c5521e301de94c67
# skip: [594f1935b373019aacaff00929ae61fec0ec83a5] mfd: rn5t618: Fix caching of battery related registers
git bisect skip 594f1935b373019aacaff00929ae61fec0ec83a5
# good: [709ed1bcef12398ac1a35c149f3e582db04456c2] EDAC/ie31200: Fallback if host bridge device is already initialized
git bisect good 709ed1bcef12398ac1a35c149f3e582db04456c2
# skip: [1f0fa85c07fb53d756219cf7e6e8e77eab6e75eb] mfd: max14577: Remove redundant initialization of variable current_bits
git bisect skip 1f0fa85c07fb53d756219cf7e6e8e77eab6e75eb
# good: [5f0b06da5cde3f0a613308b89f0afea678559fdf] dt-bindings: Remove more cases of 'allOf' containing a '$ref'
git bisect good 5f0b06da5cde3f0a613308b89f0afea678559fdf
# skip: [114294d276279d6cda81f9c685452239ea89cdb8] mfd: mfd-core: Add mechanism for removal of a subset of children
git bisect skip 114294d276279d6cda81f9c685452239ea89cdb8
# skip: [466a62d7642f02f36d37d9b30c19a725538a01ca] mfd: core: Make a best effort attempt to match devices with the correct of_nodes
git bisect skip 466a62d7642f02f36d37d9b30c19a725538a01ca
# skip: [77b3ddab713a2276c789a8e1beb339ce185cebc2] mfd: madera: Improve handling of regulator unbinding
git bisect skip 77b3ddab713a2276c789a8e1beb339ce185cebc2
# good: [405fa8ac89e7aaa87282df659e525992f2639e76] futex: Convert to use the preferred 'fallthrough' macro
git bisect good 405fa8ac89e7aaa87282df659e525992f2639e76
# skip: [564de7628dab38f2d51bac2608fe1043704622b7] mfd: kempld-core: Fix 'assignment of read-only location' error
git bisect skip 564de7628dab38f2d51bac2608fe1043704622b7
# good: [19fe87fd854a92c746ac73cb91a0bebac07a4618] clk: x86: Support RV architecture
git bisect good 19fe87fd854a92c746ac73cb91a0bebac07a4618
# skip: [3d858942250820b9adc35f963a257481d6d4c81d] mfd: dln2: Run event handler loop under spinlock
git bisect skip 3d858942250820b9adc35f963a257481d6d4c81d
# good: [0c64a0dce51faa9c706fdf1f957d6f19878f4b81] sh: landisk: Add missing initialization of sh_io_port_base
git bisect good 0c64a0dce51faa9c706fdf1f957d6f19878f4b81
# skip: [85c307850784eaa0f81713edf707e6f2e4d64eb3] mfd: axp20x: Allow the AXP803 to be probed by I2C
git bisect skip 85c307850784eaa0f81713edf707e6f2e4d64eb3
# good: [bcfd218b66790243ef303c1b35ce59f786ded225] perf/x86/rapl: Add support for Intel SPR platform
git bisect good bcfd218b66790243ef303c1b35ce59f786ded225
# skip: [9ece3601aed46f7b460b79cd7d60908b47b2b0d4] mfd: da9063: Add support for latest DA silicon revision
git bisect skip 9ece3601aed46f7b460b79cd7d60908b47b2b0d4
# good: [f3db6de55e95eee6457a14912dd382a6cfc98edd] Merge branch 'pm-cpufreq'
git bisect good f3db6de55e95eee6457a14912dd382a6cfc98edd
# good: [bf2bcd6f1a8822ea45465f86d705951725883ee8] otx2_common: Use devm_kcalloc() in otx2_config_npa()
git bisect good bf2bcd6f1a8822ea45465f86d705951725883ee8
# skip: [091c6110862bce4e2380e353cb062dcb6a56bcb6] mfd: da9063: Fix revision handling to correctly select reg tables
git bisect skip 091c6110862bce4e2380e353cb062dcb6a56bcb6
# good: [a6d996cbd38b42341ad3fce74506b9fdc280e395] x86/alternatives: Acquire pte lock with interrupts enabled
git bisect good a6d996cbd38b42341ad3fce74506b9fdc280e395
# skip: [44e6171ed04a0cd0378e2503f03a444ebdd4e8e3] mfd: core: Add OF_MFD_CELL_REG() helper
git bisect skip 44e6171ed04a0cd0378e2503f03a444ebdd4e8e3
# good: [cc172ff301d8079e941a6eb31758951a6d764084] sched/debug: Fix the alignment of the show-state debug output
git bisect good cc172ff301d8079e941a6eb31758951a6d764084
# good: [f91daf565b0e272a33bd3fcd19eaebd331c5cffd] io_uring: short circuit -EAGAIN for blocking read attempt
git bisect good f91daf565b0e272a33bd3fcd19eaebd331c5cffd
# only skipped commits left to test
# possible first bad commit: [335956421c86f64fd46186d76d3961f6adcff187] cxgb4: Fix work request size calculation for loopback test
# possible first bad commit: [ab97a28908bff7ffdadd50da17c2b4d9a4dade86] Merge branch 'sfc-more-EF100-fixes'
# possible first bad commit: [e6a43910d55d09dae65772ad571d4c61e459b17a] sfc: don't free_irq()s if they were never requested
# possible first bad commit: [788f920a0f137baa4dbc1efdd5039c4a0a01b8d7] sfc: null out channel->rps_flow_id after freeing it
# possible first bad commit: [9cbbc451098ec1e9942886023203b2247dec94bd] sfc: take correct lock in ef100_reset()
# possible first bad commit: [db06ea341fcd1752fbdb58454507faa140e3842f] sfc: really check hash is valid before using it
# possible first bad commit: [8b61fba503904acae24aeb2bd5569b4d6544d48f] macvlan: validate setting of multiple remote source MAC addresses
# possible first bad commit: [06a4ec1d9dc652e17ee3ac2ceb6c7cf6c2b75cdd] Merge tag 'pstore-v5.9-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux
# possible first bad commit: [4cf7562190c795f1f95be6ee0d161107d0dc5d49] Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
# possible first bad commit: [5a4fe0624687e62919a5913dc7c937fbfcf61fdc] mailmap: Add WeiXiong Liao
# possible first bad commit: [d6bd5201f7eaa9c15ea9b0f8ff17dd7bc3b9d78f] mailmap: Restore dictionary sorting
# possible first bad commit: [29e44f4535faa71a70827af3639b5e6762d8f02a] watch_queue: Limit the number of watches a user can hold
# possible first bad commit: [9123e3a74ec7b934a4a099e98af6a61c2f80bbf5] Linux 5.9-rc1
# possible first bad commit: [2cc3c4b3c2e9c99e90aaf19cd801ff2c160f283c] Merge tag 'io_uring-5.9-2020-08-15' of git://git.kernel.dk/linux-block
# possible first bad commit: [6f6aea7e966cda5a817d091e938c2d9b52209893] parisc: fix PMD pages allocation by restoring pmd_alloc_one()
# possible first bad commit: [4b6c093e21d36bede0fd88fd0aeb3b03647260e4] Merge tag 'block-5.9-2020-08-14' of git://git.kernel.dk/linux-block
# possible first bad commit: [d84835b118ed8c14c21fa056ca54014b2eff068b] Merge tag 'riscv-for-linus-5.9-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux
# possible first bad commit: [5bbec3cfe376ed0014d9456a9be11d5ed75d587b] Merge tag 'sh-for-5.9' of git://git.libc.org/linux-sh
# possible first bad commit: [713eee84720e6525bc5b65954c5087604a15f5e8] Merge tag 'perf-tools-2020-08-14' of git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux
# possible first bad commit: [50f6c7dbd973092d8e5f3c89f29eb4bea19fdebd] Merge tag 'x86-urgent-2020-08-15' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
# possible first bad commit: [1195d58f003bf84d37fc5c30017600e09ba567b2] Merge tag 'sched-urgent-2020-08-15' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
# possible first bad commit: [7f5faaaa5909bb0b26dcd309424da14bdf0c7e93] Merge tag 'perf-urgent-2020-08-15' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
# possible first bad commit: [eb1319af4119c4936e02c879295e9fd4d50bbe3a] Merge tag 'locking-urgent-2020-08-15' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
# possible first bad commit: [410520d07f5c66a6c1f3eb7ef2063d9bdd3d440b] Merge tag '9p-for-5.9-rc1' of git://github.com/martinetd/linux
# possible first bad commit: [f6513bd39c15af8f8a63b1fbfcb1bf4717241655] Merge tag '5.9-rc-smb3-fixes-part2' of git://git.samba.org/sfrench/cifs-2.6
# possible first bad commit: [37711e5e2325535bf094bdc0a66790d659b52d5b] Merge tag 'nfs-for-5.9-1' of git://git.linux-nfs.org/projects/trondmy/linux-nfs
# possible first bad commit: [6ffdcde4ee9a20beda096dec664da89002610d7d] Merge tag 'edac_updates_for_5.9_pt2' of git://git.kernel.org/pub/scm/linux/kernel/git/ras/ras
# possible first bad commit: [b07175dc41babfec057f494d22a750af755297d8] Merge tag 'devicetree-fixes-for-5.9' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux
# possible first bad commit: [341323fa0eed1b201130b7af84d40fa04725c832] Merge tag 'acpi-5.9-rc1-2' of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm
# possible first bad commit: [1a5d9dbbaf3af4d029a081bd58dc83b6a25d109e] Merge tag 'pm-5.9-rc1-3' of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm
# possible first bad commit: [884e0d3dd59dde1c1f0fbb5b9db2bcdc581982c7] Merge tag 'mfd-next-5.9-1' of git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd
# possible first bad commit: [e15d7f2b81d2e7d93115d46fa931b366c1cdebc2] mfd: syscon: Use a unique name with regmap_config
# possible first bad commit: [4f4ed4543e2096dc0158ff79bd6d8bc09e27fa93] mfd: Replace HTTP links with HTTPS ones
# possible first bad commit: [3d858942250820b9adc35f963a257481d6d4c81d] mfd: dln2: Run event handler loop under spinlock
# possible first bad commit: [77b3ddab713a2276c789a8e1beb339ce185cebc2] mfd: madera: Improve handling of regulator unbinding
# possible first bad commit: [114294d276279d6cda81f9c685452239ea89cdb8] mfd: mfd-core: Add mechanism for removal of a subset of children
# possible first bad commit: [4ee1d9dc8073acd40f04e5fe3771a5dff978d077] mfd: intel_soc_pmic_mrfld: Simplify the return expression of intel_scu_ipc_dev_iowrite8()
# possible first bad commit: [1f0fa85c07fb53d756219cf7e6e8e77eab6e75eb] mfd: max14577: Remove redundant initialization of variable current_bits
# possible first bad commit: [594f1935b373019aacaff00929ae61fec0ec83a5] mfd: rn5t618: Fix caching of battery related registers
# possible first bad commit: [e7b85500885f2a70129f5d3a72153e23b37d0fe5] mfd: max77693-private: Drop a duplicated word
# possible first bad commit: [23ef2b642b85f03a109fbf5958134a5e40193dbd] mfd: da9055: pdata.h: Drop a duplicated word
# possible first bad commit: [cf84dc0bb40f4b41f7853f224b37954cf273ee24] mfd: rn5t618: Make restart handler atomic safe
# possible first bad commit: [564de7628dab38f2d51bac2608fe1043704622b7] mfd: kempld-core: Fix 'assignment of read-only location' error
# possible first bad commit: [85c307850784eaa0f81713edf707e6f2e4d64eb3] mfd: axp20x: Allow the AXP803 to be probed by I2C
# possible first bad commit: [9ece3601aed46f7b460b79cd7d60908b47b2b0d4] mfd: da9063: Add support for latest DA silicon revision
# possible first bad commit: [091c6110862bce4e2380e353cb062dcb6a56bcb6] mfd: da9063: Fix revision handling to correctly select reg tables
# possible first bad commit: [a3f673d0092cee167b2a6e3d61454405d0a06b25] dt-bindings: mfd: st,stmfx: Remove I2C unit name
# possible first bad commit: [e9faaf056d2812c0b602c3dbeb5b83756b58abc5] dt-bindings: mfd: ti,j721e-system-controller.yaml: Add J721e system controller
# possible first bad commit: [819e42e00d2eca536d5187de21971ed345861102] mfd: motorola-cpcap: Disable interrupt for suspend
# possible first bad commit: [7d2594cd1fa0b03b2746ce811926ee150a3a14fa] mfd: smsc-ece1099: Remove driver
# possible first bad commit: [44e6171ed04a0cd0378e2503f03a444ebdd4e8e3] mfd: core: Add OF_MFD_CELL_REG() helper
# possible first bad commit: [d097965bb6682afe1f8481923b16c033f708923b] mfd: core: Fix formatting of MFD helpers
# possible first bad commit: [466a62d7642f02f36d37d9b30c19a725538a01ca] mfd: core: Make a best effort attempt to match devices with the correct of_nodes

The crash I hit while bisecting:
[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 5.8.0-rc1-00057-g44e6171ed04a (compile@Red) (armv7a-unknown-linux-gnueabihf-gcc (Gentoo 9.3.0-r1 p3) 9.3.0, GNU ld (Gentoo 2.33.1 p2) 2.33.1) #130 SMP Wed Oct 21 19:38:09 CEST 2020
[    0.000000] CPU: ARMv7 Processor [410fc075] revision 5 (ARMv7), cr=10c5387d
[    0.000000] CPU: div instructions available: patching division code
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
[    0.000000] OF: fdt: Machine model: Banana Pi BPI-M2-Ultra
[    0.000000] Memory policy: Data cache writealloc
[    0.000000] cma: Reserved 16 MiB at 0xbec00000
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000040000000-0x000000006fffffff]
[    0.000000]   HighMem  [mem 0x0000000070000000-0x00000000bfffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000040000000-0x00000000bfffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000040000000-0x00000000bfffffff]
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: Using PSCI v0.1 Function IDs from DT
[    0.000000] percpu: Embedded 15 pages/cpu s30732 r8192 d22516 u61440
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 522752
[    0.000000] Kernel command line: console=ttyS0,115200n8 root=/dev/ram0 ip=dhcp ip=dhcp
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 bytes, linear)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 2023984K/2097152K available (7168K kernel code, 496K rwdata, 1840K rodata, 1024K init, 244K bss, 56784K reserved, 16384K cma-reserved, 1294324K highmem)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=8 to nr_cpu_ids=4.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
[    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    0.000000] GIC: Using split EOI/Deactivate mode
[    0.000000] random: get_random_bytes called from start_kernel+0x308/0x494 with crng_init=0
[    0.000000] arch_timer: cp15 timer(s) running at 24.00MHz (phys).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x588fe9dc0, max_idle_ns: 440795202592 ns
[    0.000006] sched_clock: 56 bits at 24MHz, resolution 41ns, wraps every 4398046511097ns
[    0.000017] Switching to timer-based delay loop, resolution 41ns
[    0.000172] Console: colour dummy device 80x30
[    0.000217] Calibrating delay loop (skipped), value calculated using timer frequency.. 48.00 BogoMIPS (lpj=240000)
[    0.000229] pid_max: default: 32768 minimum: 301
[    0.000386] Mount-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
[    0.000400] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
[    0.001062] CPU: Testing write buffer coherency: ok
[    0.001349] /cpus/cpu@0 missing clock-frequency property
[    0.001368] /cpus/cpu@1 missing clock-frequency property
[    0.001383] /cpus/cpu@2 missing clock-frequency property
[    0.001399] /cpus/cpu@3 missing clock-frequency property
[    0.001409] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[    0.001887] Setting up static identity map for 0x40100000 - 0x40100060
[    0.001989] rcu: Hierarchical SRCU implementation.
[    0.002422] smp: Bringing up secondary CPUs ...
[    0.013101] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
[    0.023850] CPU2: thread -1, cpu 2, socket 0, mpidr 80000002
[    0.034552] CPU3: thread -1, cpu 3, socket 0, mpidr 80000003
[    0.034645] smp: Brought up 1 node, 4 CPUs
[    0.034664] SMP: Total of 4 processors activated (192.00 BogoMIPS).
[    0.034669] CPU: All CPU(s) started in HYP mode.
[    0.034674] CPU: Virtualization extensions available.
[    0.035390] devtmpfs: initialized
[    0.040028] VFP support v0.3: implementor 41 architecture 2 part 30 variant 7 rev 5
[    0.040250] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.040272] futex hash table entries: 1024 (order: 4, 65536 bytes, linear)
[    0.041022] pinctrl core: initialized pinctrl subsystem
[    0.041546] thermal_sys: Registered thermal governor 'step_wise'
[    0.042208] NET: Registered protocol family 16
[    0.043383] DMA: preallocated 256 KiB pool for atomic coherent allocations
[    0.044387] hw-breakpoint: found 5 (+1 reserved) breakpoint and 4 watchpoint registers.
[    0.044398] hw-breakpoint: maximum watchpoint size is 8 bytes.
[    0.059917] SCSI subsystem initialized
[    0.060379] usbcore: registered new interface driver usbfs
[    0.060429] usbcore: registered new interface driver hub
[    0.060482] usbcore: registered new device driver usb
[    0.060669] pps_core: LinuxPPS API ver. 1 registered
[    0.060676] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.060694] PTP clock support registered
[    0.060928] Advanced Linux Sound Architecture Driver Initialized.
[    0.061744] clocksource: Switched to clocksource arch_sys_counter
[    0.068513] NET: Registered protocol family 2
[    0.068987] tcp_listen_portaddr_hash hash table entries: 512 (order: 0, 6144 bytes, linear)
[    0.069016] TCP established hash table entries: 8192 (order: 3, 32768 bytes, linear)
[    0.069088] TCP bind hash table entries: 8192 (order: 4, 65536 bytes, linear)
[    0.069203] TCP: Hash tables configured (established 8192 bind 8192)
[    0.069315] UDP hash table entries: 512 (order: 2, 16384 bytes, linear)
[    0.069379] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes, linear)
[    0.069571] NET: Registered protocol family 1
[    0.070039] RPC: Registered named UNIX socket transport module.
[    0.070050] RPC: Registered udp transport module.
[    0.070055] RPC: Registered tcp transport module.
[    0.070060] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.070287] Unpacking initramfs...
[    1.786046] Freeing initrd memory: 28264K
[    1.786927] hw perfevents: enabled with armv7_cortex_a7 PMU driver, 5 counters available
[    1.788115] workingset: timestamp_bits=30 max_order=19 bucket_order=0
[    1.794022] NFS: Registering the id_resolver key type
[    1.794066] Key type id_resolver registered
[    1.794072] Key type id_legacy registered
[    1.794179] bounce: pool size: 64 pages
[    1.794220] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 248)
[    1.794230] io scheduler mq-deadline registered
[    1.794236] io scheduler kyber registered
[    1.795136] sun4i-usb-phy 1c13400.phy: failed to get clock usb0_phy
[    1.796926] sun4i-pinctrl 1c20800.pinctrl: supply vcc-pi not found, using dummy regulator
[    1.842477] Serial: 8250/16550 driver, 8 ports, IRQ sharing disabled
[    1.848507] libphy: Fixed MDIO Bus: probed
[    1.848848] CAN device driver interface
[    1.849499] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    1.849508] ehci-platform: EHCI generic platform driver
[    1.849827] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    1.849845] ohci-platform: OHCI generic platform driver
[    1.851297] sun6i-rtc 1c20400.rtc: registered as rtc0
[    1.851341] sun6i-rtc 1c20400.rtc: setting system clock to 1970-01-01T00:00:08 UTC (8)
[    1.851349] sun6i-rtc 1c20400.rtc: RTC enabled
[    1.851584] i2c /dev entries driver
[    1.853546] sunxi-wdt 1c20c90.watchdog: Watchdog enabled (timeout=16 sec, nowayout=0)
[    1.854506] sun8i-ce 1c15000.crypto: Set mod clock to 300000000 (300 Mhz) from 24000000 (24 Mhz)
[    1.854719] sun8i-ce 1c15000.crypto: will run requests pump with realtime priority
[    1.855003] sun8i-ce 1c15000.crypto: will run requests pump with realtime priority
[    1.855110] sun8i-ce 1c15000.crypto: will run requests pump with realtime priority
[    1.855208] sun8i-ce 1c15000.crypto: will run requests pump with realtime priority
[    1.855296] sun8i-ce 1c15000.crypto: Register cbc(aes)
[    1.855395] sun8i-ce 1c15000.crypto: Register ecb(aes)
[    1.855480] sun8i-ce 1c15000.crypto: Register cbc(des3_ede)
[    1.855569] sun8i-ce 1c15000.crypto: Register ecb(des3_ede)
[    1.855671] sun8i-ce 1c15000.crypto: CryptoEngine Die ID 0
[    1.856401] usbcore: registered new interface driver usbhid
[    1.856409] usbhid: USB HID core driver
[    1.857858] NET: Registered protocol family 17
[    1.857878] can: controller area network core (rev 20170425 abi 9)
[    1.857968] NET: Registered protocol family 29
[    1.857977] can: raw protocol (rev 20170425)
[    1.857984] can: broadcast manager protocol (rev 20170425 t)
[    1.857994] can: netlink gateway (rev 20190810) max_hops=1
[    1.858189] Key type dns_resolver registered
[    1.858292] Registering SWP/SWPB emulation handler
[    1.870682] sun4i-usb-phy 1c13400.phy: Couldn't get regulator usb1_vbus... Deferring probe
[    1.872535] sun4i-pinctrl 1c20800.pinctrl: supply vcc-pi not found, using dummy regulator
[    1.874079] sun4i-pinctrl 1c20800.pinctrl: initialized sunXi PIO driver
[    1.875803] sun4i-pinctrl 1c20800.pinctrl: supply vcc-pb not found, using dummy regulator
[    1.876591] printk: console [ttyS0] disabled
[    1.896814] 1c28000.serial: ttyS0 at MMIO 0x1c28000 (irq = 34, base_baud = 1500000) is a U6_16550A
[    2.741204] printk: console [ttyS0] enabled
[    2.745919] sun4i-pinctrl 1c20800.pinctrl: Couldn't get bank PG regulator
[    2.752732] sun4i-pinctrl 1c20800.pinctrl: request() failed for pin 198
[    2.759339] sun4i-pinctrl 1c20800.pinctrl: pin-198 (1c28c00.serial) status -517
[    2.766654] sun4i-pinctrl 1c20800.pinctrl: could not request pin 198 (PG6) from group PG6  on device 1c20800.pinctrl
[    2.777170] dw-apb-uart 1c28c00.serial: Error applying setting, reverse things back
[    2.785711] sun4i-pinctrl 1c20800.pinctrl: Couldn't get bank PA regulator
[    2.792536] sun4i-pinctrl 1c20800.pinctrl: request() failed for pin 0
[    2.798971] sun4i-pinctrl 1c20800.pinctrl: pin-0 (1c50000.ethernet) status -517
[    2.806283] sun4i-pinctrl 1c20800.pinctrl: could not request pin 0 (PA0) from group PA0  on device 1c20800.pinctrl
[    2.816625] dwmac-sun8i 1c50000.ethernet: Error applying setting, reverse things back
[    2.827256] axp20x-i2c 0-0034: AXP20x variant AXP221 found
[    2.840064] input: axp20x-pek as /devices/platform/soc/1c2ac00.i2c/i2c-0/0-0034/axp221-pek/input/input0
[    2.858458] dcdc1: supplied by regulator-dummy
[    2.863418] vcc-3v0: Bringing 3300000uV into 3000000-3000000uV
[    2.870175] dcdc2: supplied by regulator-dummy
[    2.875268] dcdc3: supplied by regulator-dummy
[    2.880330] dcdc4: supplied by regulator-dummy
[    2.885405] dcdc5: supplied by regulator-dummy
[    2.890496] dc1sw: supplied by vcc-3v0
[    2.894460] dc5ldo: supplied by vcc-dram
[    2.898610] random: fast init done
[    2.902392] aldo1: supplied by regulator-dummy
[    2.907464] aldo2: supplied by regulator-dummy
[    2.912524] aldo3: supplied by regulator-dummy
[    2.918011] eldo1: supplied by regulator-dummy
[    2.923070] eldo2: supplied by regulator-dummy
[    2.928150] eldo3: supplied by regulator-dummy
[    2.933214] dldo1: supplied by regulator-dummy
[    2.938090] vcc-wifi-io: Bringing 700000uV into 1800000-1800000uV
[    2.945096] dldo2: supplied by regulator-dummy
[    2.949999] vcc-wifi: Bringing 700000uV into 3300000-3300000uV
[    2.956339] dldo3: supplied by regulator-dummy
[    2.961218] vcc-wifi-2: Bringing 700000uV into 3300000-3300000uV
[    2.968026] dldo4: supplied by regulator-dummy
[    2.973122] rtc_ldo: supplied by regulator-dummy
[    2.977932] ldo_io0: supplied by regulator-dummy
[    2.983183] ldo_io1: supplied by regulator-dummy
[    2.988805] axp20x-adc axp22x-adc: DMA mask not set
[    3.014035] axp20x-i2c 0-0034: failed to add MFD devices: -19
[    3.020892] sun4i-pinctrl 1c20800.pinctrl: Couldn't get bank PG regulator
[    3.027721] sun4i-pinctrl 1c20800.pinctrl: request() failed for pin 202
[    3.034406] sun4i-pinctrl 1c20800.pinctrl: pin-202 (1c20800.pinctrl:202) status -517
[    3.042743] sun4i-pinctrl 1c20800.pinctrl: Couldn't get bank PF regulator
[    3.049527] sun4i-pinctrl 1c20800.pinctrl: request() failed for pin 160
[    3.056152] sun4i-pinctrl 1c20800.pinctrl: pin-160 (1c0f000.mmc) status -517
[    3.063204] sun4i-pinctrl 1c20800.pinctrl: could not request pin 160 (PF0) from group PF0  on device 1c20800.pinctrl
[    3.073720] sunxi-mmc 1c0f000.mmc: Error applying setting, reverse things back
[    3.081464] sun4i-pinctrl 1c20800.pinctrl: Couldn't get bank PG regulator
[    3.088260] sun4i-pinctrl 1c20800.pinctrl: request() failed for pin 192
[    3.094876] sun4i-pinctrl 1c20800.pinctrl: pin-192 (1c10000.mmc) status -517
[    3.101927] sun4i-pinctrl 1c20800.pinctrl: could not request pin 192 (PG0) from group PG0  on device 1c20800.pinctrl
[    3.112441] sunxi-mmc 1c10000.mmc: Error applying setting, reverse things back
[    3.120181] sun4i-pinctrl 1c20800.pinctrl: Couldn't get bank PC regulator
[    3.126975] sun4i-pinctrl 1c20800.pinctrl: request() failed for pin 69
[    3.133504] sun4i-pinctrl 1c20800.pinctrl: pin-69 (1c11000.mmc) status -517
[    3.140458] sun4i-pinctrl 1c20800.pinctrl: could not request pin 69 (PC5) from group PC5  on device 1c20800.pinctrl
[    3.150885] sunxi-mmc 1c11000.mmc: Error applying setting, reverse things back
[    3.158378] sun4i-pinctrl 1c20800.pinctrl: supply vcc-ph not found, using dummy regulator
[    3.167676] ------------[ cut here ]------------
[    3.172306] WARNING: CPU: 0 PID: 30 at lib/refcount.c:25 klist_next+0x11c/0x120
[    3.179602] refcount_t: addition on 0; use-after-free.
[    3.184729] Modules linked in:
[    3.187786] CPU: 0 PID: 30 Comm: kworker/0:1 Not tainted 5.8.0-rc1-00057-g44e6171ed04a #130
[    3.196121] Hardware name: Allwinner sun8i Family
[    3.200828] Workqueue: events deferred_probe_work_func
[    3.205981] [<c010dcb4>] (unwind_backtrace) from [<c010a450>] (show_stack+0x10/0x14)
[    3.213720] [<c010a450>] (show_stack) from [<c03b59d8>] (dump_stack+0x98/0xac)
[    3.220938] [<c03b59d8>] (dump_stack) from [<c011d20c>] (__warn+0xbc/0xd4)
[    3.227808] [<c011d20c>] (__warn) from [<c011d2bc>] (warn_slowpath_fmt+0x98/0xbc)
[    3.235284] [<c011d2bc>] (warn_slowpath_fmt) from [<c03bacac>] (klist_next+0x11c/0x120)
[    3.243282] [<c03bacac>] (klist_next) from [<c049f224>] (device_for_each_child+0x44/0x98)
[    3.251453] [<c049f224>] (device_for_each_child) from [<c049ff00>] (device_is_dependent+0x20/0x90)
[    3.260402] [<c049ff00>] (device_is_dependent) from [<c04a19c8>] (device_link_add+0x194/0x4a8)
[    3.269007] [<c04a19c8>] (device_link_add) from [<c04173a4>] (_regulator_get+0xe4/0x268)
[    3.277093] [<c04173a4>] (_regulator_get) from [<c041a1ac>] (_devm_regulator_get+0x40/0x78)
[    3.285440] [<c041a1ac>] (_devm_regulator_get) from [<c03d22e0>] (sun4i_usb_phy_probe+0x310/0x648)
[    3.294393] [<c03d22e0>] (sun4i_usb_phy_probe) from [<c04a6c2c>] (platform_drv_probe+0x48/0x98)
[    3.303084] [<c04a6c2c>] (platform_drv_probe) from [<c04a4d50>] (really_probe+0x1e0/0x348)
[    3.311341] [<c04a4d50>] (really_probe) from [<c04a4fc4>] (driver_probe_device+0x5c/0xb4)
[    3.319511] [<c04a4fc4>] (driver_probe_device) from [<c04a31e4>] (bus_for_each_drv+0x84/0xc8)
[    3.328028] [<c04a31e4>] (bus_for_each_drv) from [<c04a4afc>] (__device_attach+0xd8/0x144)
[    3.336285] [<c04a4afc>] (__device_attach) from [<c04a3ea4>] (bus_probe_device+0x84/0x8c)
[    3.344455] [<c04a3ea4>] (bus_probe_device) from [<c04a4338>] (deferred_probe_work_func+0x64/0x90)
[    3.353406] [<c04a4338>] (deferred_probe_work_func) from [<c0136920>] (process_one_work+0x1dc/0x438)
[    3.362531] [<c0136920>] (process_one_work) from [<c0136dd8>] (worker_thread+0x25c/0x55c)
[    3.370701] [<c0136dd8>] (worker_thread) from [<c013c864>] (kthread+0x124/0x150)
[    3.378090] [<c013c864>] (kthread) from [<c0100148>] (ret_from_fork+0x14/0x2c)
[    3.385301] Exception stack(0xee979fb0 to 0xee979ff8)
[    3.390348] 9fa0:                                     00000000 00000000 00000000 00000000
[    3.398515] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    3.406681] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    3.413285] ---[ end trace a19797e8aa146b6d ]---
[    3.418023] 8<--- cut here ---
[    3.421076] Unable to handle kernel NULL pointer dereference at virtual address 00000010
[    3.429167] pgd = (ptrval)
[    3.431879] [00000010] *pgd=00000000
[    3.435455] Internal error: Oops: 5 [#1] SMP ARM
[    3.440064] Modules linked in:
[    3.443119] CPU: 0 #
PID: 30 Comm: kworker/0:1 Tainted: G        W         5.8.0-rc1-00057-g44e6171ed04a #130
[    3.452841] Hardware name: Allwinner sun8i Family
[    3.457540] Workqueue: events deferred_probe_work_func
[    3.462671] PC is at klist_put+0x18/0xa0
[    3.466589] LR is at klist_iter_exit+0x1c/0x28
[    3.471025] pc : [<c03ba9d0>]    lr : [<c03baa7c>]    psr: a0000013
[    3.477280] sp : ee979d50  ip : 00000000  fp : c0928b64
[    3.482496] r10: 00000001  r9 : 00000001  r8 : ee330478
[    3.487712] r7 : 00000000  r6 : c049fee0  r5 : ee2c4e94  r4 : 00000000
[    3.494229] r3 : 0000000b  r2 : 779dc6f4  r1 : 00000000  r0 : 00000000
[    3.500747] Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
[    3.507870] Control: 10c5387d  Table: 4000406a  DAC: 00000051
[    3.513608] Process kworker/0:1 (pid: 30, stack limit = 0x(ptrval))
[    3.519865] Stack: (0xee979d50 to 0xee97a000)
[    3.524217] 9d40:                                     ee979d74 ee330478 c049fee0 ee978000
[    3.532385] 9d60: ee330478 c03baa7c 00000000 c049f250 c083a1b0 ee928980 ee2c4e94 779dc6f4
[    3.540553] 9d80: 2e303034 00000001 ee973810 ee330478 ee973810 c049ff00 00000001 00000001
[    3.548721] 9da0: ee330478 ee973810 ee330478 c04a19c8 796c7070 ffff0a00 ee2e7000 ee330400
[    3.556889] 9dc0: 00000002 ee306300 ee973810 ee330478 00000001 00000001 c0928b64 c04173a4
[    3.565056] 9de0: ee306240 ee979e34 ee973810 00000002 ee973810 ee973800 c0928bdc c041a1ac
[    3.573224] 9e00: 00000001 00000000 ee2e6e70 ee2e6e40 ee973810 c03d22e0 00000000 00000001
[    3.581392] 9e20: c0b14ab4 0000000b 00000000 ee978000 00000000 31627375 7562765f ee000073
[    3.589560] 9e40: ee154840 779dc6f4 c0932bb0 00000000 ee973810 c0b14ab4 c0bb2884 00000000
[    3.597728] 9e60: c0b14ab4 0000000b eefb3980 c04a6c2c ee973810 c0bb287c 00000000 c0bb2884
[    3.605896] 9e80: 00000000 c04a4d50 ee973810 c0b14ab4 c04a50c4 ee978000 00000000 00000000
[    3.614064] 9ea0: 00000000 c04a4fc4 00000000 ee979ee4 c04a50c4 c04a31e4 ee971c9c ee809f6c
[    3.622232] 9ec0: eea6deb8 779dc6f4 00000000 ee973810 ee978000 00000001 ee973854 c04a4afc
[    3.630399] 9ee0: c0b4dba8 ee973810 00000001 779dc6f4 c0b4ddf0 ee973810 ee973810 c0b4e068
[    3.638567] 9f00: c0b4ddf0 c04a3ea4 ee973810 c0b4dddc c0b4dddc c04a4338 c0b4de0c ee928280
[    3.646735] 9f20: eefb3980 eefb6a00 00000000 c0136920 eefb3998 c0b03d00 ee928280 eefb3980
[    3.654903] 9f40: ee928294 eefb3998 c0b03d00 00000008 ee978000 c0136dd8 ffffe000 c0b77350
[    3.663071] 9f60: ee928280 ee8d8040 ee92b140 00000000 ee978000 c0136b7c ee928280 ee88beac
[    3.671239] 9f80: ee8d8064 c013c864 00000001 ee92b140 c013c740 00000000 00000000 00000000
[    3.679406] 9fa0: 00000000 00000000 00000000 c0100148 00000000 00000000 00000000 00000000
[    3.687573] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    3.695740] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
[    3.703910] [<c03ba9d0>] (klist_put) from [<c03baa7c>] (klist_iter_exit+0x1c/0x28)
[    3.711472] [<c03baa7c>] (klist_iter_exit) from [<c049f250>] (device_for_each_child+0x70/0x98)
[    3.720074] [<c049f250>] (device_for_each_child) from [<c049ff00>] (device_is_dependent+0x20/0x90)
[    3.729024] [<c049ff00>] (device_is_dependent) from [<c04a19c8>] (device_link_add+0x194/0x4a8)
[    3.737627] [<c04a19c8>] (device_link_add) from [<c04173a4>] (_regulator_get+0xe4/0x268)
[    3.745709] [<c04173a4>] (_regulator_get) from [<c041a1ac>] (_devm_regulator_get+0x40/0x78)
[    3.754054] [<c041a1ac>] (_devm_regulator_get) from [<c03d22e0>] (sun4i_usb_phy_probe+0x310/0x648)
[    3.763006] [<c03d22e0>] (sun4i_usb_phy_probe) from [<c04a6c2c>] (platform_drv_probe+0x48/0x98)
[    3.771697] [<c04a6c2c>] (platform_drv_probe) from [<c04a4d50>] (really_probe+0x1e0/0x348)
[    3.779954] [<c04a4d50>] (really_probe) from [<c04a4fc4>] (driver_probe_device+0x5c/0xb4)
[    3.788124] [<c04a4fc4>] (driver_probe_device) from [<c04a31e4>] (bus_for_each_drv+0x84/0xc8)
[    3.796641] [<c04a31e4>] (bus_for_each_drv) from [<c04a4afc>] (__device_attach+0xd8/0x144)
[    3.804897] [<c04a4afc>] (__device_attach) from [<c04a3ea4>] (bus_probe_device+0x84/0x8c)
[    3.813066] [<c04a3ea4>] (bus_probe_device) from [<c04a4338>] (deferred_probe_work_func+0x64/0x90)
[    3.822015] [<c04a4338>] (deferred_probe_work_func) from [<c0136920>] (process_one_work+0x1dc/0x438)
[    3.831139] [<c0136920>] (process_one_work) from [<c0136dd8>] (worker_thread+0x25c/0x55c)
[    3.839307] [<c0136dd8>] (worker_thread) from [<c013c864>] (kthread+0x124/0x150)
[    3.846696] [<c013c864>] (kthread) from [<c0100148>] (ret_from_fork+0x14/0x2c)
[    3.853905] Exception stack(0xee979fb0 to 0xee979ff8)
[    3.858950] 9fa0:                                     00000000 00000000 00000000 00000000
[    3.867117] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    3.875283] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    3.881891] Code: e5904000 e1a07001 e3c44001 e1a00004 (e5946010) 
[    3.888129] ---[ end trace a19797e8aa146b6e ]---

Regards
