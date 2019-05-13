Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C48281B955
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2019 16:59:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729211AbfEMO7F (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 May 2019 10:59:05 -0400
Received: from webbox1416.server-home.net ([77.236.96.61]:59482 "EHLO
        webbox1416.server-home.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728381AbfEMO7F (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 13 May 2019 10:59:05 -0400
Received: from imapserver.systec-electronic.com (unknown [212.185.67.146])
        by webbox1416.server-home.net (Postfix) with ESMTPA id 45F8627A821;
        Mon, 13 May 2019 16:59:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by imapserver.systec-electronic.com (Postfix) with ESMTP id C50B71A1B68;
        Mon, 13 May 2019 16:59:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at imapserver.systec-electronic.com
Received: from imapserver.systec-electronic.com ([127.0.0.1])
        by localhost (imapserver.systec-electronic.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 4rr_bLRmwvBE; Mon, 13 May 2019 16:59:01 +0200 (CEST)
Received: from ws-140106.localnet (ws-140106.systec.local [192.168.10.84])
        by imapserver.systec-electronic.com (Postfix) with ESMTPA id 684201A1B66;
        Mon, 13 May 2019 16:59:01 +0200 (CEST)
From:   Alexander Stein <alexander.stein@systec-electronic.com>
To:     Joe Burmeister <joe.burmeister@devtank.co.uk>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/2] (v2) Mark MCP23S08 as one that will not sleep.
Date:   Mon, 13 May 2019 16:59:01 +0200
Message-ID: <3227167.XK1kVzz4uE@ws-140106>
In-Reply-To: <534ddec6-4161-10d7-8240-fb385e5ea9b9@devtank.co.uk>
References: <20190513120024.17026-1-joe.burmeister@devtank.co.uk> <3181642.RMDZkMuPfY@ws-140106> <534ddec6-4161-10d7-8240-fb385e5ea9b9@devtank.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am Montag, 13. Mai 2019, 16:02:18 CEST schrieb Joe Burmeister:
> Hi Alexander,
> 
> You probably noticed there is a v3, but that just adds the missing signoff.
> 
> On 13/05/2019 13:59, Alexander Stein wrote:
> 
> > Am Montag, 13. Mai 2019, 14:00:24 CEST schrieb Joe Burmeister:
> >> Though it has a 'standby' it doesn't appear to be an issue and
> >> marking the chip with can_sleep means gpiolib.c won't allow its use
> >> as a interrupt controller.
> >> ---
> >>   drivers/pinctrl/pinctrl-mcp23s08.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/
pinctrl-mcp23s08.c
> >> index 3fc63cb5b332..7334d8eb9135 100644
> >> --- a/drivers/pinctrl/pinctrl-mcp23s08.c
> >> +++ b/drivers/pinctrl/pinctrl-mcp23s08.c
> >> @@ -890,7 +890,7 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, 
struct device *dev,
> >>   		return PTR_ERR(mcp->regmap);
> >>   
> >>   	mcp->chip.base = base;
> >> -	mcp->chip.can_sleep = true;
> >> +	mcp->chip.can_sleep = false;
> >>   	mcp->chip.parent = dev;
> >>   	mcp->chip.owner = THIS_MODULE;
> >>   
> >>
> > IMHO this is completly wrong, please refer to the documentation of this 
flag, e.g. https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
tree/include/linux/gpio/driver.h#n217
> > It essentially means you can't use this GPIOs from atomic context, as SPI 
or I2C transfers block/sleep, hence the name.
> > In your case the IRQs are probably not requested as threaded, as stated in 
the link above.
> 
> 
> I should have seen that bit of docs, sorry.
> 
> That opens a bit of a Pandora's box.
> 
> Now I look again with a better idea of what that means, I see this isn't 
> the only driver that has a mutex, and sets can_sleep to true, uses 
> devm_request_threaded_irq, and called 
> gpiochip_set_nested_irqchip/gpiochip_set_chained_irqchip.
> 
> Now I'm confused because I can't see how you can use them as nested 
> interrupt controllers.
> 
> They will all cause "you cannot have chained interrupts on a chip that 
> may sleep" from gpiochip_set_cascaded_irqchip the moment you try.
> 
> I'm still reading through what I do now, but any hints or tips would be 
> appreciated.

Have a look at https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/
linux.git/tree/Documentation/driver-api/gpio/driver.rst#n309 which pretty much 
describes the types.
I think you are confusing chained and nested IRQ controllers. Using 
gpiochip_set_nested_irqchip cannot result in that error.
mcp23s08 driver is using gpiochip_set_nested_irqchip appropriately.
I'm wondering what you are trying to resolve. Are you attaching another IRQ 
controller to MCP23Sxx inputs?

Best regards,
Alexander



