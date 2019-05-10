Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD1891994F
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2019 10:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbfEJILd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 May 2019 04:11:33 -0400
Received: from mailgate.dias-infrared.de ([212.111.239.21]:37942 "EHLO
        mailgate.dias-infrared.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726984AbfEJILd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 May 2019 04:11:33 -0400
Received: from localhost (localhost [127.0.0.1])
        by mailgate.dias-infrared.de (Postfix) with ESMTP id 2730E5FFD0;
        Fri, 10 May 2019 10:11:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mailgate.dias-infrared.de
Received: from mailgate.dias-infrared.de ([127.0.0.1])
        by localhost (mailgate.dias-infrared.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id kpkxzqQlGjeo; Fri, 10 May 2019 10:11:30 +0200 (CEST)
Received: from srv-exch1.dias.local (srv-exch1.dias.local [192.168.1.115])
        by mailgate.dias-infrared.de (Postfix) with ESMTP id ABA125FECF;
        Fri, 10 May 2019 10:11:30 +0200 (CEST)
Received: from [192.168.1.197] (192.168.1.197) by srv-exch1.dias.local
 (192.168.1.115) with Microsoft SMTP Server (TLS) id 15.0.1263.5; Fri, 10 May
 2019 10:11:30 +0200
From:   Stefan Steude <s.steude@dias-infrared.de>
Subject: gpio-altera.c driver kernel panic
To:     Tien Hock Loh <thloh@altera.com>
CC:     <linux-gpio@vger.kernel.org>
Message-ID: <c5dd9852-bd19-c0c6-2b08-5d11870d0581@dias-infrared.de>
Date:   Fri, 10 May 2019 10:11:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: de-DE
X-Originating-IP: [192.168.1.197]
X-ClientProxiedBy: SRV-EXCH1.dias.local (192.168.1.115) To
 srv-exch1.dias.local (192.168.1.115)
X-EsetResult: clean, is OK
X-EsetId: 37303A29DC75FA6B66766B
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

I am developing software on a Cyclone5 SoC Board. With Linux Kernel 
version 4.15.

For loading our fpga-design we use device tree overlays with the altera 
fpga-mgr.

We want to load and unload different device trees and 
fpga-configurations with device tree overlays.

Now I considered a problem with the gpio-altera driver. Everything works 
fine if I load the device tree overlay once. When I unload the device 
tree and load the same device tree overlay again I get a kernel panic 
inside the gpio-altera driver. If I dont use the altera-gpio driver and 
use the uio-genirq-driver for our GPIOs everything works fine. The next 
thing I found out: if I remove the interrupt section of the GPIO inside 
the device tree overlay, unloading and loading the device tree with the 
altera-gpio driver works as well. So it has to do something with the 
interrupt handling.


As basic for our device tree configuration I used this site: 
https://rocketboards.org/foswiki/Documentation/WS2LinuxKernelIntroductionForAlteraSoCDevicesLab4SoCFPGALinuxKernel


I send you the kernel panic log and my device-tree overlay. I hope you 
can help me solving this problem. For so long I will use the uio-driver 
instead of the gpio-altera driver.




Kind regards, Stefan.




part of the overlay.dts:

//plugin/; /
////{ /
///    fragment@0 { /
///        target-path = "/soc/base-fpga-region"; /
///        #address-cells = <2>; /
///        #size-cells = <1>; /
///        __overlay__ {/
///            #address-cells = <2>; /
///            #size-cells = <1>; /
//
///            firmware-name = "soc_system.rbf";/
////
///            pio_interrupt: gpio@0x100000000 {/
///                compatible = "altr,pio-18.1", "altr,pio-1.0";/
///                reg = <0x00000001 0x00000000 0x00000020>;/
///                interrupts = <0 72 1>;/
///                altr,gpio-bank-width = <8>;    /* 
embeddedsw.dts.params.altr,gpio-bank-width type NUMBER *//
///                altr,interrupt-type = <1>;    /* 
embeddedsw.dts.params.altr,interrupt-type type NUMBER *//
///                edge_type = <0>;    /* 
embeddedsw.dts.params.edge_type type NUMBER *//
///                level_trigger = <0>;    /* 
embeddedsw.dts.params.level_trigger type NUMBER *//
///                resetvalue = <0>;    /* 
embeddedsw.dts.params.resetvalue type NUMBER *//
///                #gpio-cells = <2>;/
///                gpio-controller;/
///            }; //end gpio@0x100000000 (pio_interrupt)/
//
/.../




kernel panic log:

/mount: /config: none already mounted on /config./
///[   45.509108] fpga_manager fpga0: writing soc_system.rbf to Altera 
SOCFPGA FPGA Manager/
///[   45.544491] Unable to handle kernel NULL pointer dereference at 
virtual address 00000080/
///[   45.552586] pgd = c6020418/
///[   45.555294] [00000080] *pgd=00000000/
///[   45.558883] Internal error: Oops: 5 [#1] SMP ARM/
///[   45.563494] Modules linked in: gpio_altera spi_altera/
///[   45.568561] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 
4.15.0-altera #11/
///[   45.575154] Hardware name: Altera SOCFPGA/
///[   45.579175] PC is at altera_gpio_irq_edge_handler+0x38/0x11c 
[gpio_altera]/
///[   45.586033] LR is at altera_gpio_irq_edge_handler+0x28/0x11c 
[gpio_altera]/
///[   45.592887] pc : [<bf0082f0>]    lr : [<bf0082e0>]    psr: a0010193/
///[   45.599133] sp : c0c01e58  ip : c0c01e58  fp : c0c01e84/
///[   45.604343] r10: c08d5140  r9 : e0803100  r8 : dc785a14/
///[   45.609553] r7 : c0c0434c  r6 : 00000000  r5 : 00000000  r4 : 
dc785a00/
///[   45.616060] r3 : c0449428  r2 : 00000000  r1 : db92a274  r0 : 
00000000/
///[   45.622571] Flags: NzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  
Segment none/
///[   45.629770] Control: 10c5387d  Table: 1d62404a  DAC: 00000051/
///[   45.635503] Process swapper/0 (pid: 0, stack limit = 0x82a9ee73)/
///[   45.641493] Stack: (0xc0c01e58 to 0xc0c02000)/
///[   45.645843] 1e40: c0b7fcfc 00000000/
///[   45.654001] 1e60: 00000000 c0b7fcfc 00000000 00000000 00000001 
dd418800 c0c01e94 c0c01e88/
///[   45.662158] 1e80: c016bb44 bf0082c4 c0c01ebc c0c01e98 c016c1b0 
c016bb1c c0c0434c c0c47e9c/
///[   45.670315] 1ea0: e080210c e0802100 c0c01ee8 e0803100 c0c01ee4 
c0c01ec0 c01014f8 c016c150/
///[   45.678472] 1ec0: c0108e60 60010013 ffffffff c0c01f1c 00000001 
c0c00000 c0c01f44 c0c01ee8/
///[   45.686629] 1ee0: c010db4c c01014a8 00000000 00037eec 1d041000 
c011ba60 ffffe000 c0c03c28/
///[   45.694785] 1f00: c0c03c74 00000001 00000001 c0c700ab c08d5140 
c0c01f44 c0c01f48 c0c01f38/
///[   45.702940] 1f20: c0108e5c c0108e60 60010013 ffffffff 00000051 
00000000 c0c01f54 c0c01f48/
///[   45.711096] 1f40: c076210c c0108e24 c0c01f84 c0c01f58 c015f320 
c07620e8 c0b78244 000000c2/
///[   45.719252] 1f60: c0c79800 c0c03c00 ffffffff c0c79800 c0b538c8 
ddfffcc0 c0c01f94 c0c01f88/
///[   45.727409] 1f80: c015f61c c015f24c c0c01fac c0c01f98 c075c7b4 
c015f600 00000000 c0c79800/
///[   45.735564] 1fa0: c0c01ff4 c0c01fb0 c0b00d74 c075c700 ffffffff 
ffffffff 00000000 c0b00748/
///[   45.743720] 1fc0: 00000000 c0b538c8 00000000 c0b0032c 00000051 
10c0387d 00000000 03ff6000/
///[   45.751876] 1fe0: 413fc090 10c5387d 00000000 c0c01ff8 00000000 
c0b00a40 00000000 00000000/
///[   45.760067] [<bf0082f0>] (altera_gpio_irq_edge_handler 
[gpio_altera]) from [<c016bb44>] (generic_handle_irq+0x34/0x44)/
///[   45.770745] [<c016bb44>] (generic_handle_irq) from [<c016c1b0>] 
(__handle_domain_irq+0x6c/0xc4)/
///[   45.779427] [<c016c1b0>] (__handle_domain_irq) from [<c01014f8>] 
(gic_handle_irq+0x5c/0xa0)/
///[   45.787765] [<c01014f8>] (gic_handle_irq) from [<c010db4c>] 
(__irq_svc+0x6c/0x90)/
///[   45.795222] Exception stack(0xc0c01ee8 to 0xc0c01f30)/
///[   45.800267] 1ee0:                   00000000 00037eec 1d041000 
c011ba60 ffffe000 c0c03c28/
///[   45.808423] 1f00: c0c03c74 00000001 00000001 c0c700ab c08d5140 
c0c01f44 c0c01f48 c0c01f38/
///[   45.816575] 1f20: c0108e5c c0108e60 60010013 ffffffff/
///[   45.821633] [<c010db4c>] (__irq_svc) from [<c0108e60>] 
(arch_cpu_idle+0x48/0x4c)/
///[   45.829027] [<c0108e60>] (arch_cpu_idle) from [<c076210c>] 
(default_idle_call+0x30/0x3c)/
///[   45.837114] [<c076210c>] (default_idle_call) from [<c015f320>] 
(do_idle+0xe0/0x140)/
///[   45.844762] [<c015f320>] (do_idle) from [<c015f61c>] 
(cpu_startup_entry+0x28/0x2c)/
///[   45.852328] [<c015f61c>] (cpu_startup_entry) from [<c075c7b4>] 
(rest_init+0xc0/0xc4)/
///[   45.860063] [<c075c7b4>] (rest_init) from [<c0b00d74>] 
(start_kernel+0x340/0x34c)/
///[   45.867533] Code: e5947024 e5973028 e3530000 e1a05000 (e5906080)/
///[   45.873614] ---[ end trace 3375238a48dbe91d ]---/
///[   45.878221] Kernel panic - not syncing: Fatal exception in interrupt/
///[   45.884569] CPU1: stopping/
///[   45.887290] CPU: 1 PID: 0 Comm: swapper/1 Tainted: G      
D          4.15.0-altera #11/
///[   45.895180] Hardware name: Altera SOCFPGA/
///[   45.899211] [<c0112584>] (unwind_backtrace) from [<c010cdb0>] 
(show_stack+0x20/0x24)/
///[   45.906948] [<c010cdb0>] (show_stack) from [<c0746eac>] 
(dump_stack+0x90/0xa4)/
///[   45.914164] [<c0746eac>] (dump_stack) from [<c0110904>] 
(handle_IPI+0x358/0x374)/
///[   45.921548] [<c0110904>] (handle_IPI) from [<c0101538>] 
(gic_handle_irq+0x9c/0xa0)/
///[   45.929102] [<c0101538>] (gic_handle_irq) from [<c010db4c>] 
(__irq_svc+0x6c/0x90)/
///[   45.936559] Exception stack(0xdd509f30 to 0xdd509f78)/
///[   45.941602] 9f20: 00000000 00023678 1d051000 c011ba60/
///[   45.949760] 9f40: ffffe000 c0c03c28 c0c03c74 00000002 00000001 
c0c700ab c08d5140 dd509f8c/
///[   45.957915] 9f60: dd509f90 dd509f80 c0108e5c c0108e60 60060013 
ffffffff/
///[   45.964526] [<c010db4c>] (__irq_svc) from [<c0108e60>] 
(arch_cpu_idle+0x48/0x4c)/
///[   45.971912] [<c0108e60>] (arch_cpu_idle) from [<c076210c>] 
(default_idle_call+0x30/0x3c)/
///[   45.979990] [<c076210c>] (default_idle_call) from [<c015f320>] 
(do_idle+0xe0/0x140)/
///[   45.987635] [<c015f320>] (do_idle) from [<c015f61c>] 
(cpu_startup_entry+0x28/0x2c)/
///[   45.995192] [<c015f61c>] (cpu_startup_entry) from [<c0110334>] 
(secondary_start_kernel+0x15c/0x164)/
///[   46.004219] [<c0110334>] (secondary_start_kernel) from 
[<0010194c>] (0x10194c)/
///[   46.011430] ---[ end Kernel panic - not syncing: Fatal exception 
in interrupt/
//

