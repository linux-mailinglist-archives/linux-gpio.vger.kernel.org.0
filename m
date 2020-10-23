Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39A412970C9
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Oct 2020 15:42:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S372746AbgJWNmH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Oct 2020 09:42:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S369633AbgJWNmH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Oct 2020 09:42:07 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B446C0613CE;
        Fri, 23 Oct 2020 06:42:05 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id y12so1888157wrp.6;
        Fri, 23 Oct 2020 06:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bdjaP0fhANVtpXlIMlhBu4dd4slUX+bDre1mo2WPunc=;
        b=R26LX+0v5ejN6YN4G8bUFKWGejG1tW12G7mFY4XS3t608U2u6NHcAeEKv0IIdp590E
         5breouFsY9pQ1potu+M+5v1nXWnokewAoJO2yENzVti8Iu6a77dnYW5VFAaDU/bJlo76
         zN9CaNa//gqD6qvETjIEX+KjchaLZvGqa4mef/NAV6n9sUAOGT/uKdpv/SYK2Tlz1oZ9
         mz+EpelP/ir3V0C6AGSlr8H5SeJDEq9sdjgo7IS/y7C9m+DNZALcpRmyuwJO5qt1hdtX
         MaiSeGnp/QaAUneRG6kGf6nLx/eMrd/O4Ihh6r4lgp+GNkBnEMrx3UA2aqgUkAtNJIzw
         ZWeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bdjaP0fhANVtpXlIMlhBu4dd4slUX+bDre1mo2WPunc=;
        b=VLoXXChRlG0jxHGDXpzSYFTjBnwwmW9SrnY5T2XiDDQa3TIBOpcooCBBxgy2736Qoz
         PNPqeVGVvi9gI+PU1qc6DU1ErtIfCbSriCRu+Ac+b4tqNZlFDenpexNMhAY1Rdf02k7P
         822QSCZB5mc1SFO/c10OzSMrK3CLf01co7s6lTflsHHRAJNRhx+4eMQwnjLlWNWFLVlw
         vwM46Y+EzSVEPOqjpLKmSYEKLwS8CQCFXzdE7MIi5dtbPwCWnHGG9+Lp53+5/pW2QQtk
         vAOLataPLnWJHoq8YuPvPnaRSj9a+xBe1pe7/A8gFO3VjQSywTAjmoBlr3Ajm5DtHrfC
         MBZQ==
X-Gm-Message-State: AOAM532+yZxCgtOV2BrJVBwv1bK3fOzOweiD0dlw78KDk2ybxMlGdMM/
        AnPOTz9eSrZcjqQ+G8TYcGEESslxvZk=
X-Google-Smtp-Source: ABdhPJy8QAynyQwQsaTFU67HuldOwJst1BJPTKkZR5weZl/+2/psVaS3cDEkPOBpIdXfpXzjmM75gw==
X-Received: by 2002:adf:8462:: with SMTP id 89mr2652005wrf.389.1603460524217;
        Fri, 23 Oct 2020 06:42:04 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id c15sm3179196wmb.27.2020.10.23.06.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 06:42:03 -0700 (PDT)
Date:   Fri, 23 Oct 2020 15:42:01 +0200
From:   Corentin Labbe <clabbe.montjoie@gmail.com>
To:     linus.walleij@linaro.org, mripard@kernel.org, wens@csie.org,
        linux-gpio@vger.kernel.org, lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [BUG] Error applying setting, reverse things back on lot of
 devices
Message-ID: <20201023134201.GA533@Red>
References: <20201021183149.GA8436@Red>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201021183149.GA8436@Red>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 21, 2020 at 08:31:49PM +0200, Corentin Labbe wrote:
> Hello
> 
> On next-20201016, booting my sun8i-r40-bananapi-m2-ultra, the boot end without at least stmmac working.
> [    0.000000] Booting Linux on physical CPU 0x0
> [    0.000000] Linux version 5.9.0-next-20201016-00055-g98489213ff7c-dirty (compile@Red) (armv7a-unknown-linux-gnueabihf-gcc (Gentoo 9.3.0-r1 p3) 9.3.0, GNU ld (Gentoo 2.33.1 p2) 2.33.1) #162 SMP Tue Oct 20 08:10:25 CEST 2020
> [    0.000000] CPU: ARMv7 Processor [410fc075] revision 5 (ARMv7), cr=10c5387d
> [    0.000000] CPU: div instructions available: patching division code
> [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
> [    0.000000] OF: fdt: Machine model: Banana Pi BPI-M2-Ultra
> [    0.000000] Memory policy: Data cache writealloc
> [    0.000000] cma: Reserved 16 MiB at 0xbec00000
> [    0.000000] Zone ranges:
> [    0.000000]   Normal   [mem 0x0000000040000000-0x000000006fffffff]
> [    0.000000]   HighMem  [mem 0x0000000070000000-0x00000000bfffffff]
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000040000000-0x00000000bfffffff]
> [    0.000000] Initmem setup node 0 [mem 0x0000000040000000-0x00000000bfffffff]
> [    0.000000] psci: probing for conduit method from DT.
> [    0.000000] psci: Using PSCI v0.1 Function IDs from DT
> [    0.000000] percpu: Embedded 15 pages/cpu s30924 r8192 d22324 u61440
> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 522752
> [    0.000000] Kernel command line: console=ttyS0,115200n8 root=/dev/ram0 ip=dhcp trace_event=initcall:*,module:* trace_options=stacktrace ip=dhcp
> [    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 bytes, linear)
> [    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 bytes, linear)
> [    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
> [    0.000000] Memory: 2020320K/2097152K available (7168K kernel code, 934K rwdata, 2252K rodata, 1024K init, 248K bss, 60448K reserved, 16384K cma-reserved, 1294324K highmem)
> [    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
> [    0.000000] rcu: Hierarchical RCU implementation.
> [    0.000000] rcu: 	RCU event tracing is enabled.
> [    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=8 to nr_cpu_ids=4.
> [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.
> [    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
> [    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
> [    0.000000] GIC: Using split EOI/Deactivate mode
> [    0.000000] random: get_random_bytes called from start_kernel+0x320/0x4ac with crng_init=0
> [    0.000000] arch_timer: cp15 timer(s) running at 24.00MHz (phys).
> [    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x588fe9dc0, max_idle_ns: 440795202592 ns
> [    0.000007] sched_clock: 56 bits at 24MHz, resolution 41ns, wraps every 4398046511097ns
> [    0.000020] Switching to timer-based delay loop, resolution 41ns
> [    0.000176] Console: colour dummy device 80x30
> [    0.000230] Calibrating delay loop (skipped), value calculated using timer frequency.. 48.00 BogoMIPS (lpj=240000)
> [    0.000251] pid_max: default: 32768 minimum: 301
> [    0.000395] Mount-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
> [    0.000414] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
> [    0.001117] CPU: Testing write buffer coherency: ok
> [    0.001420] /cpus/cpu@0 missing clock-frequency property
> [    0.001442] /cpus/cpu@1 missing clock-frequency property
> [    0.001459] /cpus/cpu@2 missing clock-frequency property
> [    0.001477] /cpus/cpu@3 missing clock-frequency property
> [    0.001490] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
> [    0.002001] Setting up static identity map for 0x40100000 - 0x40100060
> [    0.002119] rcu: Hierarchical SRCU implementation.
> [    0.002580] smp: Bringing up secondary CPUs ...
> [    0.013271] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
> [    0.024063] CPU2: thread -1, cpu 2, socket 0, mpidr 80000002
> [    0.034784] CPU3: thread -1, cpu 3, socket 0, mpidr 80000003
> [    0.034880] smp: Brought up 1 node, 4 CPUs
> [    0.034904] SMP: Total of 4 processors activated (192.00 BogoMIPS).
> [    0.034912] CPU: All CPU(s) started in HYP mode.
> [    0.034919] CPU: Virtualization extensions available.
> [    0.035754] devtmpfs: initialized
> [    0.041021] VFP support v0.3: implementor 41 architecture 2 part 30 variant 7 rev 5
> [    0.041258] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
> [    0.041283] futex hash table entries: 1024 (order: 4, 65536 bytes, linear)
> [    0.042026] pinctrl core: initialized pinctrl subsystem
> [    0.043049] NET: Registered protocol family 16
> [    0.044324] DMA: preallocated 256 KiB pool for atomic coherent allocations
> [    0.045360] thermal_sys: Registered thermal governor 'step_wise'
> [    0.045788] hw-breakpoint: found 5 (+1 reserved) breakpoint and 4 watchpoint registers.
> [    0.045805] hw-breakpoint: maximum watchpoint size is 8 bytes.
> [    0.065862] alg: extra crypto tests enabled.  This is intended for developer use only.
> [    0.123361] alg_test_stdrng test ansi_cprng
> [    0.150327] SCSI subsystem initialized
> [    0.150742] usbcore: registered new interface driver usbfs
> [    0.150789] usbcore: registered new interface driver hub
> [    0.150845] usbcore: registered new device driver usb
> [    0.151014] mc: Linux media interface: v0.10
> [    0.151049] videodev: Linux video capture interface: v2.00
> [    0.151149] pps_core: LinuxPPS API ver. 1 registered
> [    0.151159] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
> [    0.151180] PTP clock support registered
> [    0.151575] Advanced Linux Sound Architecture Driver Initialized.
> [    0.152420] clocksource: Switched to clocksource arch_sys_counter
> [    0.159588] NET: Registered protocol family 2
> [    0.160080] tcp_listen_portaddr_hash hash table entries: 512 (order: 0, 6144 bytes, linear)
> [    0.160112] TCP established hash table entries: 8192 (order: 3, 32768 bytes, linear)
> [    0.160188] TCP bind hash table entries: 8192 (order: 4, 65536 bytes, linear)
> [    0.160304] TCP: Hash tables configured (established 8192 bind 8192)
> [    0.160423] UDP hash table entries: 512 (order: 2, 16384 bytes, linear)
> [    0.160489] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes, linear)
> [    0.160689] NET: Registered protocol family 1
> [    0.161248] RPC: Registered named UNIX socket transport module.
> [    0.161263] RPC: Registered udp transport module.
> [    0.161272] RPC: Registered tcp transport module.
> [    0.161280] RPC: Registered tcp NFSv4.1 backchannel transport module.
> [    0.161510] Unpacking initramfs...
> [    1.988543] Freeing initrd memory: 30460K
> [    1.989598] hw perfevents: enabled with armv7_cortex_a7 PMU driver, 5 counters available
> [    1.990836] workingset: timestamp_bits=30 max_order=19 bucket_order=0
> [    1.996523] NFS: Registering the id_resolver key type
> [    1.996573] Key type id_resolver registered
> [    1.996582] Key type id_legacy registered
> [    1.996659] NET: Registered protocol family 38
> [    1.996725] bounce: pool size: 64 pages
> [    1.996770] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 246)
> [    1.996782] io scheduler mq-deadline registered
> [    1.996790] io scheduler kyber registered
> [    1.997771] sun4i-usb-phy 1c13400.phy: failed to get clock usb0_phy
> [    1.999624] sun4i-pinctrl 1c20800.pinctrl: supply vcc-pi not found, using dummy regulator
> [    2.052865] Serial: 8250/16550 driver, 8 ports, IRQ sharing disabled
> [    2.058849] sun8i-mixer 1100000.mixer: Couldn't get our reset line
> [    2.058962] sun4i-drm display-engine: Couldn't bind all pipelines components
> [    2.061927] lima 1c40000.gpu: gp - mali400 version major 1 minor 1
> [    2.061987] lima 1c40000.gpu: pp0 - mali400 version major 1 minor 1
> [    2.062041] lima 1c40000.gpu: pp1 - mali400 version major 1 minor 1
> [    2.062092] lima 1c40000.gpu: l2 cache 64K, 4-way, 64byte cache line, 64bit external bus
> [    2.062567] lima 1c40000.gpu: bus rate = 200000000
> [    2.062584] lima 1c40000.gpu: mod rate = 297000000
> [    2.062990] [drm] Initialized lima 1.1.0 20191231 for 1c40000.gpu on minor 0
> [    2.071234] loop: module loaded
> [    2.072785] libphy: Fixed MDIO Bus: probed
> [    2.073308] CAN device driver interface
> [    2.074052] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
> [    2.074063] ehci-platform: EHCI generic platform driver
> [    2.074552] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
> [    2.074579] ohci-platform: OHCI generic platform driver
> [    2.076335] sun6i-rtc 1c20400.rtc: registered as rtc0
> [    2.076383] sun6i-rtc 1c20400.rtc: setting system clock to 1970-01-01T00:00:08 UTC (8)
> [    2.076394] sun6i-rtc 1c20400.rtc: RTC enabled
> [    2.076673] i2c /dev entries driver
> [    2.079404] sunxi-wdt 1c20c90.watchdog: Watchdog enabled (timeout=16 sec, nowayout=0)
> [    2.079812] device-mapper: ioctl: 4.43.0-ioctl (2020-10-01) initialised: dm-devel@redhat.com
> [    2.080803] sun8i-ce 1c15000.crypto: Set mod clock to 300000000 (300 Mhz) from 24000000 (24 Mhz)
> [    2.081050] sun8i-ce 1c15000.crypto: will run requests pump with realtime priority
> [    2.081384] sun8i-ce 1c15000.crypto: will run requests pump with realtime priority
> [    2.081521] sun8i-ce 1c15000.crypto: will run requests pump with realtime priority
> [    2.081630] sun8i-ce 1c15000.crypto: will run requests pump with realtime priority
> [    2.081728] sun8i-ce 1c15000.crypto: Register cbc(aes)
> [    2.120538] sun8i-ce 1c15000.crypto: Fallback for cbc-aes-sun8i-ce is cbc(aes-generic)
> [    2.357120] sun8i-ce 1c15000.crypto: Register ecb(aes)
> [    2.387952] sun8i-ce 1c15000.crypto: Fallback for ecb-aes-sun8i-ce is ecb(aes-generic)
> [    2.407064] random: fast init done
> [    2.589700] sun8i-ce 1c15000.crypto: Register cbc(des3_ede)
> [    2.641051] sun8i-ce 1c15000.crypto: Fallback for cbc-des3-sun8i-ce is cbc(des3_ede-generic)
> [    3.281510] sun8i-ce 1c15000.crypto: Register ecb(des3_ede)
> [    3.333414] sun8i-ce 1c15000.crypto: Fallback for ecb-des3-sun8i-ce is ecb(des3_ede-generic)
> [    3.874269] sun8i-ce 1c15000.crypto: Register md5
> [    3.874437] sun8i-ce 1c15000.crypto: Fallback for md5-sun8i-ce is md5-generic
> [    3.980669] sun8i-ce 1c15000.crypto: Register sha1
> [    3.980869] sun8i-ce 1c15000.crypto: Fallback for sha1-sun8i-ce is sha1-generic
> [    4.104525] sun8i-ce 1c15000.crypto: Register sha224
> [    4.159000] sun8i-ce 1c15000.crypto: Fallback for sha224-sun8i-ce is sha224-generic
> [    4.323465] sun8i-ce 1c15000.crypto: Register sha256
> [    4.323665] sun8i-ce 1c15000.crypto: Fallback for sha256-sun8i-ce is sha256-generic
> [    4.484572] sun8i-ce 1c15000.crypto: DEBUG: Algo of sha384 not supported
> [    4.484598] sun8i-ce 1c15000.crypto: DEBUG: Algo of sha512 not supported
> [    4.484609] sun8i-ce 1c15000.crypto: Register stdrng
> [    4.484782] alg_test_stdrng test sun8i-ce-prng
> [    4.484881] sun8i-ce 1c15000.crypto: TRNG not supported
> [    4.484897] sun8i-ce 1c15000.crypto: CryptoEngine Die ID 0
> [    4.486084] usbcore: registered new interface driver usbhid
> [    4.486098] usbhid: USB HID core driver
> [    4.488554] NET: Registered protocol family 17
> [    4.488580] can: controller area network core
> [    4.488668] NET: Registered protocol family 29
> [    4.488681] can: raw protocol
> [    4.488691] can: broadcast manager protocol
> [    4.488705] can: netlink gateway - max_hops=1
> [    4.488918] Key type dns_resolver registered
> [    4.489063] Registering SWP/SWPB emulation handler
> [    4.501808] sun4i-usb-phy 1c13400.phy: Couldn't get regulator usb1_vbus... Deferring probe
> [    4.503853] sun4i-pinctrl 1c20800.pinctrl: supply vcc-pi not found, using dummy regulator
> [    4.505470] sun4i-pinctrl 1c20800.pinctrl: initialized sunXi PIO driver
> [    4.507391] sun4i-pinctrl 1c20800.pinctrl: supply vcc-pb not found, using dummy regulator
> [    4.508216] printk: console [ttyS0] disabled
> [    4.528470] 1c28000.serial: ttyS0 at MMIO 0x1c28000 (irq = 45, base_baud = 1500000) is a U6_16550A
> [    5.585887] printk: console [ttyS0] enabled
> [    5.590785] dw-apb-uart 1c28c00.serial: Error applying setting, reverse things back
> [    5.609876] sun4i-drm display-engine: bound 1100000.mixer (ops 0xc087f4d0)
> [    5.618713] sun4i-drm display-engine: bound 1200000.mixer (ops 0xc087f4d0)
> [    5.626022] sun4i-drm display-engine: bound 1c70000.tcon-top (ops 0xc08837e0)
> [    5.633467] sun4i-drm display-engine: bound 1c73000.lcd-controller (ops 0xc087b760)
> [    5.641177] sun8i-dw-hdmi 1ee0000.hdmi: supply hvcc not found, using dummy regulator
> [    5.682538] sun8i-dw-hdmi 1ee0000.hdmi: Detected HDMI TX controller v1.32a with HDCP (sun8i_dw_hdmi_phy)
> [    5.692591] sun8i-dw-hdmi 1ee0000.hdmi: registered DesignWare HDMI I2C bus driver
> [    5.700429] sun4i-drm display-engine: bound 1ee0000.hdmi (ops 0xc087ea28)
> [    5.707707] [drm] Initialized sun4i-drm 1.0.0 20150629 for display-engine on minor 1
> [    5.715530] sun4i-drm display-engine: [drm] Cannot find any crtc or sizes
> [    5.723563] dwmac-sun8i 1c50000.ethernet: Error applying setting, reverse things back
> [    5.734175] sun4i-drm display-engine: [drm] Cannot find any crtc or sizes
> [    5.741110] i2c i2c-1: Not using recovery: no recover_bus() found
> [    5.748415] axp20x-i2c 1-0034: AXP20x variant AXP221 found
> [    5.761265] input: axp20x-pek as /devices/platform/soc/1c2ac00.i2c/i2c-1/1-0034/axp221-pek/input/input0
> [    5.780739] vcc-3v3: supplied by regulator-dummy
> [    5.786045] vdd-cpu: supplied by regulator-dummy
> [    5.791332] vdd-sys: supplied by regulator-dummy
> [    5.796585] dcdc4: supplied by regulator-dummy
> [    5.801647] vcc-dram: supplied by regulator-dummy
> [    5.806470] vcc-gmac-phy: failed to get the current voltage: -EINVAL
> [    5.812839] axp20x-regulator axp20x-regulator: Failed to register dc1sw
> [    5.820291] axp20x-regulator: probe of axp20x-regulator failed with error -22

I have just saw thoses 3 lines which are probably the real problem.
I have started a new bisect with this error, but it is hitting the same "crash range" the first one.

Regards
