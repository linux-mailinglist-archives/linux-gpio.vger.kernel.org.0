Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26D8B1E3F37
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2020 12:38:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729940AbgE0KiO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 May 2020 06:38:14 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:48247 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729876AbgE0KiN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 27 May 2020 06:38:13 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id dtRkjMiyIdPgTdtRnjtUQq; Wed, 27 May 2020 12:38:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1590575891; bh=qRIFqz0elNM1geNjVEmMdd4KeyUj5WFBR8OGFEv/h8M=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=frpH8ObmjkPT4zHwSdbP0plnF9ghDkvb3DNdealDM5V90vC0z4M6px8BoxnUcwH69
         5EohCWTBwupg0/ujz6OYhW3r+obmlLNKG+OmS9udEmhj4zs/H7xSXGDhGhd16w4qJq
         milt6csZgLI+9EZAXL4jZyrxcTAXIXt+0pizZtuuHiORfgsQjQyEKJsJ132htjpZR6
         vrjnjPxUTn3kYRluNJGR3d1nlZUKnDUXzDzezytWptXH+FUmJLBHteDTmTmZq7bhWX
         FNm0UOBREbC2v/Q6dZIP/37L4dJZMM7vMKftyBPRF0uNMwxKFc+AtiVNapQ+1QCxGL
         qiFsPoRVG4kLw==
Subject: Re: [PATCH v2 1/4] gpio: gpiolib: Allow GPIO IRQs to lazy disable
To:     Linus Walleij <linus.walleij@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Doug Anderson <dianders@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org
References: <1590253873-11556-1-git-send-email-mkshah@codeaurora.org>
 <1590253873-11556-2-git-send-email-mkshah@codeaurora.org>
 <CACRpkdba9j4EdCkD5OeL=3A4Zeb57vO78FAXA9fo0SOgBE57ag@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <3efa1f69-1e1d-f919-d47e-b4c5c73532b7@xs4all.nl>
Date:   Wed, 27 May 2020 12:38:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdba9j4EdCkD5OeL=3A4Zeb57vO78FAXA9fo0SOgBE57ag@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHU8KnRyJwn+E52ojZZxHXaRmGhgMgCE+NU8TFHR0NZkWGBWUO7JKHZ1h8RtGzHn7GXOrxOQd3SaF1FqUJD7lueqQuWeBljRKHQPp9GaoL/NQsgpG1W5
 J3hAvfOg8rn4Sv+Dboblt1JB8v0ejHRjXEBSlo5yfLzs40RP2y+BekHomJl1DUEr/ccGo0nc0KL5ElOUlv/rixVF6IMurEuQcx7FD70ExArqpOPWcM6cIXXq
 GTIFFw1qTDRILuGJpX85aCmycYF/0G2uAWdSu8y3TIacl/1yA3QMiVaW3RhmNnWRYPSKYFyldSNLTTFcsCga7OqqAH+2nSupwbiZdfcyQgqzYTp7TYBi/yRQ
 sDYj5bvmKTndRFxbX4PATX7HcpAKZ6cVJLYwv0wPHIKgn88xPYlmwiEia0XU4H5qHPFxYxvcKE9iw3z0dngjjxva+Em4CAgG9P+8Dh61GbMhK7Qa+FxKHYt3
 y7q0G3Jo+mpckWIyfvAx176UAYFkc/Ppj5ikRabkcaqEHjTMJWZZpJ3l4WJqjYAPsEITK4EnWOOZrl5zjVkTgEn3/qkGHzMNaWaN5y3UKF4hTSioBjD6MmTu
 hIkZiJXwCw96pWHI1Gd15oZEmxsHiG76NPyWNJJ7pIqY6FN49HFiB3y3fSYAILby5ttT7BHugLxvsAe49IcR/yeAm6Ut270bsSqrlYrdCed8rbZvrb8PFHZj
 5X44Gs2jbqc=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 25/05/2020 13:55, Linus Walleij wrote:
> On Sat, May 23, 2020 at 7:11 PM Maulik Shah <mkshah@codeaurora.org> wrote:
> 
>> With 'commit 461c1a7d4733 ("gpiolib: override irq_enable/disable")' gpiolib
>> overrides irqchip's irq_enable and irq_disable callbacks. If irq_disable
>> callback is implemented then genirq takes unlazy path to disable irq.
>>
>> Underlying irqchip may not want to implement irq_disable callback to lazy
>> disable irq when client drivers invokes disable_irq(). By overriding
>> irq_disable callback, gpiolib ends up always unlazy disabling IRQ.
>>
>> Allow gpiolib to lazy disable IRQs by overriding irq_disable callback only
>> if irqchip implemented irq_disable. In cases where irq_disable is not
>> implemented irq_mask is overridden. Similarly override irq_enable callback
>> only if irqchip implemented irq_enable otherwise irq_unmask is overridden.
>>
>> Fixes: 461c1a7d47 (gpiolib: override irq_enable/disable)
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> 
> I definitely want Hans Verkuils test and review on this, since it
> is a usecase that he is really dependent on.

For this patch:

Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

However, I discovered that patch 256efaea1fdc ("gpiolib: fix up emulated
open drain outputs") broke the cec-gpio driver on the Raspberry Pi starting
with kernel v5.5.

The CEC pin is an open drain pin that is used in both input and output
directions and has an interrupt (which is of course disabled while in
output mode).

With this patch the interrupt can no longer be requested:

[    4.157806] gpio gpiochip0: (pinctrl-bcm2835): gpiochip_lock_as_irq: tried to flag a GPIO set as output for IRQ

[    4.168086] gpio gpiochip0: (pinctrl-bcm2835): unable to lock HW IRQ 7 for IRQ
[    4.175425] genirq: Failed to request resources for cec-gpio@7 (irq 79) on irqchip pinctrl-bcm2835
[    4.184597] cec-gpio: probe of cec-gpio@7 failed with error -5

You can easily test this with a RPi by enabling cec-gpio:

------------------------------------------------------
diff --git a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
index 054ecaa355c9..87d6ed711ce2 100644
--- a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
+++ b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
@@ -29,6 +29,13 @@ wifi_pwrseq: wifi-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&expgpio 1 GPIO_ACTIVE_LOW>;
 	};
+
+	cec-gpio@7 {
+		compatible = "cec-gpio";
+		cec-gpios = <&gpio 7 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		hpd-gpios = <&gpio 17 GPIO_ACTIVE_HIGH>;
+		v5-gpios = <&gpio 22 GPIO_ACTIVE_HIGH>;
+	};
 };

 &firmware {
------------------------------------------------------

Reverting that patch makes it work again.

I'm happy to test a fix for this.

Regards,

	Hans

> 
> Also the irqchip people preferredly.
> 
> But it does seem to mop up my mistakes and fix this up properly!
> 
> So with some testing I'll be happy to merge it, even this one
> patch separately if Hans can verify that it works.
> 
> Yours,
> Linus Walleij
> 

