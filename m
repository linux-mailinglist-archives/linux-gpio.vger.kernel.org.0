Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 982383BF1E2
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jul 2021 00:13:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232134AbhGGWQC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Jul 2021 18:16:02 -0400
Received: from [94.230.151.217] ([94.230.151.217]:42360 "EHLO ixit.cz"
        rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
        id S229717AbhGGWQC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 7 Jul 2021 18:16:02 -0400
Received: from [192.168.1.138] (unknown [94.230.151.217])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 8B8DD23B1D;
        Thu,  8 Jul 2021 00:13:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1625695998;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=nOidn3A5WEe5fwqM/sGG8TpQeerXRLwVhOXpo4MqC4w=;
        b=Osk65zPSSICKWy4VMsbaYc+aNrJytN0swLJtDlY99GJ83CWx0aRcHzePyL9Svu0n5/UZBf
        fE1c6+Y3P2MOyQFbPS6k3Z0Adgq61d6KsaXiHkvV+XaGPDp4F6b5j9i/8LQbMH1W7Knm4q
        45YIbXs0J+FtqMnClBKnSolswGkdJjM=
Date:   Thu, 08 Jul 2021 00:12:29 +0200
From:   David Heidelberg <david@ixit.cz>
Subject: Re: (probably) Qualcomm PM8xxx PMIC chips driver issue in 5.10+
 kernel
To:     Doug Anderson <dianders@chromium.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        GPIO SUBSYSTEM <linux-gpio@vger.kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-Id: <T0BWVQ.57K5KI0VO3U71@ixit.cz>
In-Reply-To: <CAD=FV=XJYDE-gmN5Sq9n6GH2mr6V2o-AbUxcsHKrM_vkemU-MQ@mail.gmail.com>
References: <5B3HVQ.XR62REW2D4KQ1@ixit.cz> <R3LHVQ.51D68IW9A14U3@ixit.cz>
        <CAD=FV=XJYDE-gmN5Sq9n6GH2mr6V2o-AbUxcsHKrM_vkemU-MQ@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Doug,

thank you for your reply. Further investigation led me to the "irq: 
Request and release resources for chained IRQs" (hack) which I used for 
many previous kernels to avoid fatal panic (at PM8xxx dependent 
components).
It seems it does not only collide with your patch, but also thanks to 
your fix I can drop it since from 5.10.

Only thing which remains is this warning in the place of RCU stall:

[ 1.739567] ssbi c00000.ssbi: SSBI controller type: 'pmic-arbiter'
[ 1.741905] pm8xxx_probe: PMIC revision 1: F3
[ 1.747435] pm8xxx_probe: PMIC revision 2: 0B
[ 1.751786] ------------[ cut here ]------------
[ 1.756102] WARNING: CPU: 0 PID: 1 at drivers/gpio/gpiolib.c:3316 
gpiochip_enable_irq+0xa4/0xa8
[ 1.760782] Modules linked in:
[ 1.769192] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 
5.10.48-postmarketos-qcom-apq8064+ #1
[ 1.772323] Hardware name: Generic DT based system
[ 1.780558] Backtrace:
[ 1.785433] [<c0de32a4>] (dump_backtrace) from [<c0de3668>] 
(show_stack+0x20/0x24)
[ 1.787782] r7:60000093 r6:c13bfce0 r5:00000000 r4:c13bfce0
[ 1.795420] [<c0de3648>] (show_stack) from [<c0de6a88>] 
(dump_stack+0x94/0xa8)
[ 1.801243] [<c0de69f4>] (dump_stack) from [<c032188c>] 
(__warn+0xfc/0x114)
[ 1.808259] r7:00000cf4 r6:c06eb8cc r5:00000009 r4:c10d864c
[ 1.815121] [<c0321790>] (__warn) from [<c0de3d34>] 
(warn_slowpath_fmt+0x74/0xd0)
[ 1.821024] r7:c06eb8cc r6:00000cf4 r5:c10d864c r4:00000000
[ 1.828403] [<c0de3cc4>] (warn_slowpath_fmt) from [<c06eb8cc>] 
(gpiochip_enable_irq+0xa4/0xa8)
[ 1.834136] r8:00000000 r7:00000001 r6:c27e7718 r5:c2569848 r4:c021a5f0
[ 1.842553] [<c06eb828>] (gpiochip_enable_irq) from [<c06eb938>] 
(gpiochip_irq_enable+0x28/0x38)
[ 1.849411] r5:c2569848 r4:c27e7718
[ 1.858173] [<c06eb910>] (gpiochip_irq_enable) from [<c0387808>] 
(irq_enable+0x48/0x78)
[ 1.861737] r5:00000000 r4:c27e7700
[ 1.869450] [<c03877c0>] (irq_enable) from [<c03878b8>] 
(__irq_startup+0x80/0xbc)
[ 1.873279] r5:00000000 r4:c27e7700
[ 1.880650] [<c0387838>] (__irq_startup) from [<c038794c>] 
(irq_startup+0x58/0x15c)
[ 1.884305] r7:00000001 r6:00000001 r5:00000000 r4:c27e7700
[ 1.891680] [<c03878f4>] (irq_startup) from [<c0387a8c>] 
(irq_activate_and_startup+0x3c/0x74)
[ 1.897593] r9:c27e7840 r8:c2d20800 r7:c27e7700 r6:00000001 r5:c27e7700 
r4:00000000
[ 1.906011] [<c0387a50>] (irq_activate_and_startup) from [<c0387b90>] 
(__irq_do_set_handler+0xcc/0x1c0)
[ 1.913824] r7:c27e7700 r6:c0381aa8 r5:c0883230 r4:00000001
[ 1.922931] [<c0387ac4>] (__irq_do_set_handler) from [<c0387db8>] 
(irq_set_chained_handler_and_data+0x60/0x98)
[ 1.928843] r7:c2d24010 r6:c27e7840 r5:c0883230 r4:c27e7700
[ 1.938650] [<c0387d58>] (irq_set_chained_handler_and_data) from 
[<c08831e0>] (pm8xxx_probe+0x1fc/0x24c)
[ 1.944466] r6:0000003a r5:0000003a r4:c2d24000
[ 1.953926] [<c0882fe4>] (pm8xxx_probe) from [<c0857484>] 
(platform_drv_probe+0x58/0xa8)
[ 1.958529] r10:c1458a88 r9:c13ee420 r8:00000000 r7:c14aa580 
r6:c13ee420 r5:c2d24010
[ 1.966595] r4:00000000
[ 1.974310] [<c085742c>] (platform_drv_probe) from [<c0854594>] 
(really_probe+0x11c/0x510)
[ 1.976928] r7:c14aa580 r6:00000000 r5:c14aa57c r4:c2d24010
[ 1.984995] [<c0854478>] (really_probe) from [<c0854c20>] 
(driver_probe_device+0xd8/0x1fc)
[ 1.990820] r10:c1458a88 r9:c13ec90c r8:c1458a88 r7:67a8b90a 
r6:00000000 r5:c13ee420
[ 1.998885] r4:c2d24010
[ 2.006776] [<c0854b48>] (driver_probe_device) from [<c0854f10>] 
(__device_attach_driver+0xa8/0x114)
[ 2.009399] r9:c13ec90c r8:00000000 r7:c2d24010 r6:cf739bb4 r5:c13ee420 
r4:00000001
[ 2.018513] [<c0854e68>] (__device_attach_driver) from [<c0852460>] 
(bus_for_each_drv+0x94/0xe4)
[ 2.026236] r7:c14aa554 r6:c0854e68 r5:cf739bb4 r4:00000000
[ 2.034995] [<c08523cc>] (bus_for_each_drv) from [<c08543c0>] 
(__device_attach+0x104/0x19c)
[ 2.040642] r6:00000001 r5:c2d24054 r4:c2d24010
[ 2.048707] [<c08542bc>] (__device_attach) from [<c0854f98>] 
(device_initial_probe+0x1c/0x20)
[ 2.053579] r6:c2d24010 r5:c13eced0 r4:c2d24010
[ 2.061990] [<c0854f7c>] (device_initial_probe) from [<c0853414>] 
(bus_probe_device+0x94/0x9c)
[ 2.066702] [<c0853380>] (bus_probe_device) from [<c084efb4>] 
(device_add+0x3c4/0x7c4)
[ 2.075104] r7:c14aa554 r6:c2518010 r5:00000000 r4:c2d24010
[ 2.083008] [<c084ebf0>] (device_add) from [<c0a4dd18>] 
(of_device_add+0x44/0x4c)
[ 2.088821] r9:00000001 r8:c2518010 r7:e93ebd7c r6:00000000 r5:00000000 
r4:c2d24000
[ 2.096204] [<c0a4dcd4>] (of_device_add) from [<c0a4e498>] 
(of_platform_device_create_pdata+0xa4/0xcc)
[ 2.104022] [<c0a4e3f4>] (of_platform_device_create_pdata) from 
[<c0a4e6d4>] (of_platform_bus_create+0x1f0/0x518)
[ 2.113134] r9:00000001 r8:c2518010 r7:00000000 r6:00000000 r5:00000000 
r4:e93ebd2c
[ 2.123460] [<c0a4e4e4>] (of_platform_bus_create) from [<c0a4ebd4>] 
(of_platform_populate+0x98/0x128)
[ 2.131273] r10:c1458a88 r9:00000001 r8:c2518010 r7:00000000 
r6:00000000 r5:e93ebc10
[ 2.140377] r4:e93ebd2c
[ 2.148182] [<c0a4eb3c>] (of_platform_populate) from [<c0a4ece0>] 
(devm_of_platform_populate+0x50/0x90)
[ 2.150805] r9:c13ee5cc r8:00000000 r7:e93ebc10 r6:c2c2aac0 r5:c2c2acc0 
r4:c2518010
[ 2.159921] [<c0a4ec90>] (devm_of_platform_populate) from [<c0883cb0>] 
(ssbi_probe+0x138/0x16c)
[ 2.167902] r7:e93ebc10 r6:c2c2aac0 r5:c2518010 r4:ff8db01c
[ 2.176318] [<c0883b78>] (ssbi_probe) from [<c0857484>] 
(platform_drv_probe+0x58/0xa8)
[ 2.182224] r7:c14aa580 r6:c13ee5cc r5:c2518010 r4:00000000
[ 2.189945] [<c085742c>] (platform_drv_probe) from [<c0854594>] 
(really_probe+0x11c/0x510)
[ 2.195765] r7:c14aa580 r6:00000000 r5:c14aa57c r4:c2518010
[ 2.203833] [<c0854478>] (really_probe) from [<c0854c20>] 
(driver_probe_device+0xd8/0x1fc)
[ 2.209655] r10:c124a854 r9:0000011c r8:c1458a88 r7:6784d86f 
r6:00000000 r5:c13ee5cc
[ 2.217723] r4:c2518010
[ 2.225612] [<c0854b48>] (driver_probe_device) from [<c0855004>] 
(device_driver_attach+0x68/0x70)
[ 2.228235] r9:0000011c r8:c124a834 r7:00000000 r6:c13ee5cc r5:00000000 
r4:c2518010
[ 2.237002] [<c0854f9c>] (device_driver_attach) from [<c08550d0>] 
(__driver_attach+0xc4/0x164)
[ 2.244812] r7:00000000 r6:c2518010 r5:c13ee5cc r4:00000000
[ 2.253223] [<c085500c>] (__driver_attach) from [<c0852354>] 
(bus_for_each_dev+0x88/0xd4)
[ 2.259046] r7:00000000 r6:c085500c r5:c13ee5cc r4:00000000
[ 2.267114] [<c08522cc>] (bus_for_each_dev) from [<c0853e10>] 
(driver_attach+0x2c/0x30)
[ 2.272847] r6:c13eced0 r5:c2c2aa00 r4:c13ee5cc
[ 2.280565] [<c0853de4>] (driver_attach) from [<c08536e4>] 
(bus_add_driver+0x180/0x21c)
[ 2.285441] [<c0853564>] (bus_add_driver) from [<c0855d3c>] 
(driver_register+0x84/0x118)
[ 2.293162] r7:00000000 r6:c02288d4 r5:c1226dd4 r4:c13ee5cc
[ 2.301490] [<c0855cb8>] (driver_register) from [<c08573d8>] 
(__platform_driver_register+0x50/0x58)
[ 2.307137] r5:c1226dd4 r4:c144c9e0
[ 2.315899] [<c0857388>] (__platform_driver_register) from [<c1226df8>] 
(ssbi_driver_init+0x24/0x28)
[ 2.319739] [<c1226dd4>] (ssbi_driver_init) from [<c0302360>] 
(do_one_initcall+0x68/0x2f8)
[ 2.328847] [<c03022f8>] (do_one_initcall) from [<c1201304>] 
(kernel_init_freeable+0x1f4/0x258)
[ 2.336913] r7:00000007 r6:c11d13f8 r5:c0231200 r4:c127bb9c
[ 2.345509] [<c1201110>] (kernel_init_freeable) from [<c0def97c>] 
(kernel_init+0x18/0x12c)
[ 2.351410] r10:00000000 r9:00000000 r8:00000000 r7:00000000 
r6:00000000 r5:c0def964
[ 2.359477] r4:00000000
[ 2.367367] [<c0def964>] (kernel_init) from [<c0300148>] 
(ret_from_fork+0x14/0x2c)
[ 2.369981] Exception stack(0xcf739fb0 to 0xcf739ff8)
[ 2.377360] 9fa0: 00000000 00000000 00000000 00000000
[ 2.382503] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 
00000000 00000000
[ 2.390658] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[ 2.398795] r5:c0def964 r4:00000000
[ 2.405220] ---[ end trace 2699fe303e6416d5 ]---
[ 2.409039] genirq: irq_chip msmgpio did not update eff. affinity mask 
of irq 58
[ 2.416100] ssbi 500000.qcom,ssbi: SSBI controller type: 'pmic-arbiter'
[ 2.421863] pm8xxx_probe: PMIC revision 1: F4
[ 2.427466] pm8xxx_probe: PMIC revision 2: 06
[ 2.431900] ------------[ cut here ]------------
[ 2.436212] WARNING: CPU: 0 PID: 1 at drivers/gpio/gpiolib.c:3316 
gpiochip_enable_irq+0xa4/0xa8
[ 2.440900] Modules linked in:
[ 2.449308] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G W 
5.10.48-postmarketos-qcom-apq8064+ #1
[ 2.452450] Hardware name: Generic DT based system
[ 2.462067] Backtrace:
[ 2.466936] [<c0de32a4>] (dump_backtrace) from [<c0de3668>] 
(show_stack+0x20/0x24)
[ 2.469291] r7:60000093 r6:c13bfce0 r5:00000000 r4:c13bfce0
[ 2.476925] [<c0de3648>] (show_stack) from [<c0de6a88>] 
(dump_stack+0x94/0xa8)
[ 2.482749] [<c0de69f4>] (dump_stack) from [<c032188c>] 
(__warn+0xfc/0x114)
[ 2.489771] r7:00000cf4 r6:c06eb8cc r5:00000009 r4:c10d864c
[ 2.496631] [<c0321790>] (__warn) from [<c0de3d34>] 
(warn_slowpath_fmt+0x74/0xd0)
[ 2.502535] r7:c06eb8cc r6:00000cf4 r5:c10d864c r4:00000000
[ 2.509911] [<c0de3cc4>] (warn_slowpath_fmt) from [<c06eb8cc>] 
(gpiochip_enable_irq+0xa4/0xa8)
[ 2.515646] r8:00000000 r7:00000001 r6:c27e7d18 r5:c2569848 r4:c021a5c8
[ 2.524062] [<c06eb828>] (gpiochip_enable_irq) from [<c06eb938>] 
(gpiochip_irq_enable+0x28/0x38)
[ 2.530923] r5:c2569848 r4:c27e7d18
[ 2.539679] [<c06eb910>] (gpiochip_irq_enable) from [<c0387808>] 
(irq_enable+0x48/0x78)
[ 2.543246] r5:00000000 r4:c27e7d00
[ 2.550961] [<c03877c0>] (irq_enable) from [<c03878b8>] 
(__irq_startup+0x80/0xbc)
[ 2.554789] r5:00000000 r4:c27e7d00
[ 2.562159] [<c0387838>] (__irq_startup) from [<c038794c>] 
(irq_startup+0x58/0x15c)
[ 2.565815] r7:00000001 r6:00000001 r5:00000000 r4:c27e7d00
[ 2.573189] [<c03878f4>] (irq_startup) from [<c0387a8c>] 
(irq_activate_and_startup+0x3c/0x74)
[ 2.579102] r9:c2d20e40 r8:c2d20c00 r7:c27e7d00 r6:00000001 r5:c27e7d00 
r4:00000000
[ 2.587522] [<c0387a50>] (irq_activate_and_startup) from [<c0387b90>] 
(__irq_do_set_handler+0xcc/0x1c0)
[ 2.595334] r7:c27e7d00 r6:c0381aa8 r5:c08834c4 r4:00000001
[ 2.604440] [<c0387ac4>] (__irq_do_set_handler) from [<c0387db8>] 
(irq_set_chained_handler_and_data+0x60/0x98)
[ 2.610353] r7:c2d24410 r6:c2d20e40 r5:c08834c4 r4:c27e7d00
[ 2.620153] [<c0387d58>] (irq_set_chained_handler_and_data) from 
[<c08831e0>] (pm8xxx_probe+0x1fc/0x24c)
[ 2.625976] r6:0000003f r5:0000003f r4:c2d24400
[ 2.635429] [<c0882fe4>] (pm8xxx_probe) from [<c0857484>] 
(platform_drv_probe+0x58/0xa8)
[ 2.640039] r10:c1458a88 r9:c13ee420 r8:00000000 r7:c14aa580 
r6:c13ee420 r5:c2d24410
[ 2.648105] r4:00000000
[ 2.655821] [<c085742c>] (platform_drv_probe) from [<c0854594>] 
(really_probe+0x11c/0x510)
[ 2.658439] r7:c14aa580 r6:00000000 r5:c14aa57c r4:c2d24410
[ 2.666506] [<c0854478>] (really_probe) from [<c0854c20>] 
(driver_probe_device+0xd8/0x1fc)
[ 2.672331] r10:c1458a88 r9:c13ec90c r8:c1458a88 r7:90305706 
r6:00000000 r5:c13ee420
[ 2.680395] r4:c2d24410
[ 2.688284] [<c0854b48>] (driver_probe_device) from [<c0854f10>] 
(__device_attach_driver+0xa8/0x114)
[ 2.690908] r9:c13ec90c r8:00000000 r7:c2d24410 r6:cf739bb4 r5:c13ee420 
r4:00000001
[ 2.700022] [<c0854e68>] (__device_attach_driver) from [<c0852460>] 
(bus_for_each_drv+0x94/0xe4)
[ 2.707747] r7:c14aa554 r6:c0854e68 r5:cf739bb4 r4:00000000
[ 2.716507] [<c08523cc>] (bus_for_each_drv) from [<c08543c0>] 
(__device_attach+0x104/0x19c)
[ 2.722154] r6:00000001 r5:c2d24454 r4:c2d24410
[ 2.730217] [<c08542bc>] (__device_attach) from [<c0854f98>] 
(device_initial_probe+0x1c/0x20)
[ 2.735089] r6:c2d24410 r5:c13eced0 r4:c2d24410
[ 2.743500] [<c0854f7c>] (device_initial_probe) from [<c0853414>] 
(bus_probe_device+0x94/0x9c)
[ 2.748205] [<c0853380>] (bus_probe_device) from [<c084efb4>] 
(device_add+0x3c4/0x7c4)
[ 2.756615] r7:c14aa554 r6:c2518410 r5:00000000 r4:c2d24410
[ 2.764513] [<c084ebf0>] (device_add) from [<c0a4dd18>] 
(of_device_add+0x44/0x4c)
[ 2.770330] r9:00000001 r8:c2518410 r7:e93ec1dc r6:00000000 r5:00000000 
r4:c2d24400
[ 2.777716] [<c0a4dcd4>] (of_device_add) from [<c0a4e498>] 
(of_platform_device_create_pdata+0xa4/0xcc)
[ 2.785533] [<c0a4e3f4>] (of_platform_device_create_pdata) from 
[<c0a4e6d4>] (of_platform_bus_create+0x1f0/0x518)
[ 2.794644] r9:00000001 r8:c2518410 r7:00000000 r6:00000000 r5:00000000 
r4:e93ec18c
[ 2.804971] [<c0a4e4e4>] (of_platform_bus_create) from [<c0a4ebd4>] 
(of_platform_populate+0x98/0x128)
[ 2.812784] r10:c1458a88 r9:00000001 r8:c2518410 r7:00000000 
r6:00000000 r5:e93ec064
[ 2.821890] r4:e93ec18c
[ 2.829693] [<c0a4eb3c>] (of_platform_populate) from [<c0a4ece0>] 
(devm_of_platform_populate+0x50/0x90)
[ 2.832316] r9:c13ee5cc r8:00000000 r7:e93ec064 r6:c2c882c0 r5:c2c884c0 
r4:c2518410
[ 2.841431] [<c0a4ec90>] (devm_of_platform_populate) from [<c0883cb0>] 
(ssbi_probe+0x138/0x16c)
[ 2.849413] r7:e93ec064 r6:c2c882c0 r5:c2518410 r4:ff8db19c
[ 2.857829] [<c0883b78>] (ssbi_probe) from [<c0857484>] 
(platform_drv_probe+0x58/0xa8)
[ 2.863733] r7:c14aa580 r6:c13ee5cc r5:c2518410 r4:00000000
[ 2.871456] [<c085742c>] (platform_drv_probe) from [<c0854594>] 
(really_probe+0x11c/0x510)
[ 2.877275] r7:c14aa580 r6:00000000 r5:c14aa57c r4:c2518410
[ 2.885342] [<c0854478>] (really_probe) from [<c0854c20>] 
(driver_probe_device+0xd8/0x1fc)
[ 2.891166] r10:c124a854 r9:0000011c r8:c1458a88 r7:8fd8a844 
r6:00000000 r5:c13ee5cc
[ 2.899232] r4:c2518410
[ 2.907122] [<c0854b48>] (driver_probe_device) from [<c0855004>] 
(device_driver_attach+0x68/0x70)
[ 2.909745] r9:0000011c r8:c124a834 r7:00000000 r6:c13ee5cc r5:00000000 
r4:c2518410
[ 2.918511] [<c0854f9c>] (device_driver_attach) from [<c08550d0>] 
(__driver_attach+0xc4/0x164)
[ 2.926321] r7:00000000 r6:c2518410 r5:c13ee5cc r4:00000000
[ 2.934734] [<c085500c>] (__driver_attach) from [<c0852354>] 
(bus_for_each_dev+0x88/0xd4)
[ 2.940556] r7:00000000 r6:c085500c r5:c13ee5cc r4:00000000
[ 2.948625] [<c08522cc>] (bus_for_each_dev) from [<c0853e10>] 
(driver_attach+0x2c/0x30)
[ 2.954358] r6:c13eced0 r5:c2c2aa00 r4:c13ee5cc
[ 2.962076] [<c0853de4>] (driver_attach) from [<c08536e4>] 
(bus_add_driver+0x180/0x21c)
[ 2.966949] [<c0853564>] (bus_add_driver) from [<c0855d3c>] 
(driver_register+0x84/0x118)
[ 2.974672] r7:00000000 r6:c02288d4 r5:c1226dd4 r4:c13ee5cc
[ 2.983000] [<c0855cb8>] (driver_register) from [<c08573d8>] 
(__platform_driver_register+0x50/0x58)
[ 2.988647] r5:c1226dd4 r4:c144c9e0
[ 2.997409] [<c0857388>] (__platform_driver_register) from [<c1226df8>] 
(ssbi_driver_init+0x24/0x28)
[ 3.001244] [<c1226dd4>] (ssbi_driver_init) from [<c0302360>] 
(do_one_initcall+0x68/0x2f8)
[ 3.010354] [<c03022f8>] (do_one_initcall) from [<c1201304>] 
(kernel_init_freeable+0x1f4/0x258)
[ 3.018423] r7:00000007 r6:c11d13f8 r5:c0231200 r4:c127bb9c
[ 3.027011] [<c1201110>] (kernel_init_freeable) from [<c0def97c>] 
(kernel_init+0x18/0x12c)
[ 3.032921] r10:00000000 r9:00000000 r8:00000000 r7:00000000 
r6:00000000 r5:c0def964
[ 3.040987] r4:00000000
[ 3.048876] [<c0def964>] (kernel_init) from [<c0300148>] 
(ret_from_fork+0x14/0x2c)
[ 3.051491] Exception stack(0xcf739fb0 to 0xcf739ff8)
[ 3.058869] 9fa0: 00000000 00000000 00000000 00000000
[ 3.064012] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 
00000000 00000000
[ 3.072166] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[ 3.080305] r5:c0def964 r4:00000000
[ 3.086719] ---[ end trace 2699fe303e6416d6 ]---
[ 3.100970] initcall ssbi_driver_init+0x0/0x28 returned 0 after 1329833 
usecs

Anyway - thank you again!
David

On Wed, Jul 7 2021 at 08:45:02 -0700, Doug Anderson 
<dianders@chromium.org> wrote:
> Hi,
> 
> On Tue, Jun 29, 2021 at 4:27 PM David Heidelberg <david@ixit.cz> 
> wrote:
>> 
>>  I did bisection and it lead me to the commit
>> 
>>  pinctrl: qcom: Don't clear pending interrupts when enabling
>>  39afef8a282b8ce63edb8d2ceb8a71e5440de059 for 5.10 (equal to
>>  cf9d052aa6005f1e8dfaf491d83bf37f368af69e for upstream)
>> 
>>  adding people into CC, I assume it's possible it just uncovers
>>  different issue, but reverting it makes 5.10.y usable.
> 
> Sorry that my change is causing problems for you! :(
> 
> If I had to guess my intuition would tell me that this is happening:
> 
> 1. The bootloader on your system is leaving some GPIO interrupt
> asserted but masked.
> 
> 2. Some driver in your system is requesting its interrupt in its probe
> call before it's actually ready for the interrupt to fire.
> 
> 3. Since the driver isn't really ready for the interrupt, it doesn't
> clear things properly and the interrupt just keeps firing over and
> over again and the system just locks.
> 
> It's been several months since I wrote that change, but I believe that
> before that change then requesting an interrupt would implicitly "ack"
> any pending interrupt and that will no longer be the case now.
> 
> Assuming that the above is true then probably the best way to fix it
> is to figure out which driver is requesting its irq too early and move
> the request to later in its probe.
> 
> You might be able to use "initcall_debug" to help find out what driver
> is probing. You should also be able to add some printouts to the
> pinctrl driver to see what interrupt is actually firing, though it
> might be hard to figure out exactly where to put the logs since it
> uses a bunch of common code. Hrm, actually, maybe the easiest is to
> add a log to msm_gpio_irq_enable(), even just adding a dump_stack() to
> that function. If my guess is right then whatever the last stack
> dumped would point to the problem.
> 
> 
> -Doug


