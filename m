Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1B3D36F44
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2019 10:59:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727585AbfFFI7C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Jun 2019 04:59:02 -0400
Received: from anchovy3.45ru.net.au ([203.30.46.155]:50690 "EHLO
        anchovy3.45ru.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727279AbfFFI7B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Jun 2019 04:59:01 -0400
Received: (qmail 22833 invoked by uid 5089); 6 Jun 2019 08:58:59 -0000
Received: by simscan 1.2.0 ppid: 22798, pid: 22799, t: 0.0453s
         scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
Received: from unknown (HELO ?192.168.0.128?) (preid@electromag.com.au@203.59.235.95)
  by anchovy2.45ru.net.au with ESMTPA; 6 Jun 2019 08:58:59 -0000
To:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
From:   Phil Reid <preid@electromag.com.au>
Subject: pinctrl: mcp23s08: detected irqchip that is shared with multiple
 gpiochips - real of false?
Message-ID: <ba89e0fd-c9a9-4326-1fb3-a8b9dcb24601@electromag.com.au>
Date:   Thu, 6 Jun 2019 16:58:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

G'day All,

Using kernel 5.1 I'm getting the following message:
"detected irqchip that is shared with multiple gpiochips: please fix the driver"

Which I believe should be fixed by:
19ab5ca "pinctrl: mcp23s08: Allocate irq_chip dynamic"

However mcp23s08_probe_one() ends up calling gpiochip_set_irq_hooks() twice.
Once from

[    1.482385] [<8049da44>] (gpiochip_set_irq_hooks) from [<8049781c>] (gpiochip_irqchip_add_key+0x134/0x140)
[    1.482394]  r5:ef1e8bf0 r4:ee74f074
[    1.482409] [<804976e8>] (gpiochip_irqchip_add_key) from [<8049640c>] (mcp23s08_probe_one.constprop.0+0x4b0/0x6c0)
[    1.482424]  r9:00000020 r8:ee74f074 r7:80d09088 r6:ee74ec20 r5:ee74f160 r4:ee74f040
[    1.482438] [<80495f5c>] (mcp23s08_probe_one.constprop.0) from [<804966f4>] (mcp230xx_probe+0xd8/0x104)
[    1.482452]  r10:00000000 r9:80a31820 r8:ee74ec20 r7:eee6997c r6:80d09088 r5:ee74ec00
[    1.482458]  r4:ee74f040
[    1.482474] [<8049661c>] (mcp230xx_probe) from [<80607934>] (i2c_device_probe+0x290/0x2d4)

And then:
[    1.492123] [<8049da44>] (gpiochip_set_irq_hooks) from [<8049d904>] (gpiochip_add_data_with_key+0x988/0x9a8)
[    1.492132]  r5:ee74f074 r4:ef1e8bf0
[    1.492147] [<8049cf7c>] (gpiochip_add_data_with_key) from [<8049d978>] (devm_gpiochip_add_data+0x54/0x90)
[    1.492162]  r10:00000000 r9:00000020 r8:ee74f074 r7:ee74ec20 r6:ee74f074 r5:ee71a5c0
[    1.492169]  r4:ee74f040
[    1.492184] [<8049d924>] (devm_gpiochip_add_data) from [<80496194>] (mcp23s08_probe_one.constprop.0+0x238/0x6c0)
[    1.492195]  r7:80d09088 r6:ee74ec20 r5:00000000 r4:ee74f040
[    1.492209] [<80495f5c>] (mcp23s08_probe_one.constprop.0) from [<804966f4>] (mcp230xx_probe+0xd8/0x104)
[    1.492222]  r10:00000000 r9:80a31820 r8:ee74ec20 r7:eee6997c r6:80d09088 r5:ee74ec00
[    1.492229]  r4:ee74f040
[    1.492243] [<8049661c>] (mcp230xx_probe) from [<80607934>] (i2c_device_probe+0x290/0x2d4)

The first time is via:
mcp23s08_probe_one
mcp23s08_irqchip_setup - inlined
gpiochip_irqchip_add_nested - inlined
gpiochip_irqchip_add_key

So is the warning something that can be ignored or is something wrong happening.

I'm seeing this on a couple of other gpio drivers as well.



-- 
Regards
Phil Reid


