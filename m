Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAEE96E906C
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Apr 2023 12:38:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234541AbjDTKiX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Apr 2023 06:38:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234907AbjDTKh4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Apr 2023 06:37:56 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2E87A24C;
        Thu, 20 Apr 2023 03:34:54 -0700 (PDT)
Received: from [192.168.1.141] ([37.4.248.58]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MvKL3-1q6yRO1njV-00rLT3; Thu, 20 Apr 2023 12:34:43 +0200
Message-ID: <c13b29fc-ebad-7898-a03e-e028e6651810@i2se.com>
Date:   Thu, 20 Apr 2023 12:34:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] pinctrl-bcm2835.c: fix race condition when setting gpio
 dir
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-rpi-kernel@lists.infradead.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>
References: <4c15982a-e159-4238-d484-3f2b3d7b39bd@xs4all.nl>
Content-Language: en-US
From:   Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <4c15982a-e159-4238-d484-3f2b3d7b39bd@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:LvNneocE60CfAp7wtsi1f/ahR8eqS1pXJTO3uHE1Q0Pl4Hq0YIX
 +BXrk61EWjEquaa0KAkcOrzFvcdlW9CRnQZ0tPKKByTxB+/fVHcFvyGBk4BLlv76j/l3y7c
 ZODcILIaLmnPsmlJTWtu6hcmxcFwvC0spAS5igyP2HLINHyHFBKpF5Xfi1GX2w017M/oRgN
 Uh6NbQQzVtVDFFdzHUZrw==
UI-OutboundReport: notjunk:1;M01:P0:bcfvwL6Ots8=;aEjYvll4G7SEAgiDLAyG0C8IpZj
 tRTT9RnZGZMT1p1WbIowhNkPkMFvEFQpboLCfCGWm2ZbframAz+IiDqm+786VZopdMTbFgtNG
 Df/e6WzdA5HXibr5BUF1khJ4zOBztcIAOik8rJQhtFUKzCbsVOd15/neLwNvGxY3mruIbZ+EQ
 dWl2rioNXWhZziNx6yRsEbcEku1cW+9+kM6p9D3upwnras8cRyGbydTTlW2AFzmAG3dFRD6c8
 z7Jsi7f3L25ohndtBgGniN/y2hCQjGUtI+WkooAh18depsZ8Z8Z2hlZg1iXnFITY9Wq70XqZQ
 pmt29HInWkScD39HeuzaXRkfcusmB1Sv0nvuS8Kbh3B6CLtrRjN1FrCv9SKBufo8L+CCwllgw
 V3B5MAnuRH+fszKZZyTAZsV+fXfv8EzvV7CFTgqJEq7rjJd8oK0yENH5YDq5IC8acedvEMKj2
 d5qWxoHbIDTCCy3hemf4/T/kP2R+8miVnm2uqYAwyRtaOFuqx3DGITy7ITRYIZJ78gRMVa0xQ
 Yk8WFeOw6gdWGirBFMEeUG1jIiT8MQSqAAfTWUCoepVrC1+GGwKftCrr0RD4/bRevScg4cJhn
 4/ISoOBp5c3VvTH4r69SHItL9YNb0Jc1k8STLvWZV7KFP+wcOSpw5VhxBpHuPGwFDu7VVj51G
 XsPr2s/MxhwWK4Z5kxxapeXZhMgsL/GBgCSU6eHm2w==
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Hans,

Am 20.04.23 um 08:47 schrieb Hans Verkuil:
> In the past setting the pin direction called pinctrl_gpio_direction()
> which uses a mutex to serialize this. That was changed to set the
> direction directly in the pin controller driver, but that lost the
> serialization mechanism. Since the direction of multiple pins are in
> the same register you can have a race condition, something that was
> in fact observed with the cec-gpio driver.
> 
> Add a new spinlock to serialize writing to the FSEL registers.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Fixes: 1a4541b68e25 ("pinctrl-bcm2835: don't call pinctrl_gpio_direction()")
> ---
>   drivers/pinctrl/bcm/pinctrl-bcm2835.c | 19 +++++++++++++++----
>   1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> index 8e2551a08c37..345b9dea5ff6 100644
> --- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> +++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> @@ -90,6 +90,8 @@ struct bcm2835_pinctrl {
>   	struct pinctrl_gpio_range gpio_range;
> 
>   	raw_spinlock_t irq_lock[BCM2835_NUM_BANKS];
> +	/* Protect FSEL registers */
> +	spinlock_t fsel_lock;
>   };
> 
>   /* pins are just named GPIO0..GPIO53 */
> @@ -284,14 +286,21 @@ static inline void bcm2835_pinctrl_fsel_set(
>   		struct bcm2835_pinctrl *pc, unsigned pin,
>   		enum bcm2835_fsel fsel)
>   {
> -	u32 val = bcm2835_gpio_rd(pc, FSEL_REG(pin));
> -	enum bcm2835_fsel cur = (val >> FSEL_SHIFT(pin)) & BCM2835_FSEL_MASK;
> +	u32 val;
> +	enum bcm2835_fsel cur;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&pc->fsel_lock, flags);
> +	val = bcm2835_gpio_rd(pc, FSEL_REG(pin));
> +	cur = (val >> FSEL_SHIFT(pin)) & BCM2835_FSEL_MASK;
> 
>   	dev_dbg(pc->dev, "read %08x (%u => %s)\n", val, pin,
> -			bcm2835_functions[cur]);
> +		bcm2835_functions[cur]);
> 
> -	if (cur == fsel)
> +	if (cur == fsel) {
> +		spin_unlock_irqrestore(&pc->fsel_lock, flags);
>   		return;

How about adding a jump label to the latter spin_unlock_irqrestore and 
using a goto here?

> +	}
> 
>   	if (cur != BCM2835_FSEL_GPIO_IN && fsel != BCM2835_FSEL_GPIO_IN) {
>   		/* always transition through GPIO_IN */
> @@ -309,6 +318,7 @@ static inline void bcm2835_pinctrl_fsel_set(
>   	dev_dbg(pc->dev, "write %08x (%u <= %s)\n", val, pin,
>   			bcm2835_functions[fsel]);
>   	bcm2835_gpio_wr(pc, FSEL_REG(pin), val);
> +	spin_unlock_irqrestore(&pc->fsel_lock, flags);
>   }
> 
>   static int bcm2835_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
> @@ -1248,6 +1258,7 @@ static int bcm2835_pinctrl_probe(struct platform_device *pdev)
>   	pc->gpio_chip = *pdata->gpio_chip;
>   	pc->gpio_chip.parent = dev;
> 
> +	spin_lock_init(&pc->fsel_lock);
>   	for (i = 0; i < BCM2835_NUM_BANKS; i++) {
>   		unsigned long events;
>   		unsigned offset;
