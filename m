Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04C95A9911
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2019 05:57:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730694AbfIED5C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Sep 2019 23:57:02 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:49867 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727544AbfIED5B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Sep 2019 23:57:01 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 814F92224B;
        Wed,  4 Sep 2019 23:57:00 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute4.internal (MEProxy); Wed, 04 Sep 2019 23:57:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=+V9xRJ/1HYR/6pMO/bSb1yTgfA8crQE
        LD2nMcJY5P7A=; b=IoF9PQ1RkDCys0xkz+lZRQguCSRh7slGKu5KZtp+1LyW8i/
        a7DFk4a3k8BtOhf3yMfLLSfil2OCs40k4cHV+u5IYo8s+WGQ++7d/oyGVAlENucA
        o71Auw5Mq6LTZ4NPnB9KetCTEFIwBqqduKdrSUKdEj10plt+Qe/CSfJm2wQKTqFO
        UXL16wcbbdvN3cRvfC/hq7znM/QPAVG2mlvUDyxSuT7G+ISWgdmGu77tHkwPUJCS
        C4yiZuq5kYTiRqD/hznCSwgGFs5pDopWR/QAhsGJgkCt/Ircho/SU/Dpcuv3h9S9
        /ycjiFlSF9aZuJtaGI9R3k91VLlCXg9JtgMEIJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=+V9xRJ
        /1HYR/6pMO/bSb1yTgfA8crQELD2nMcJY5P7A=; b=RwBU5HufEwtLr7hmn5hFM8
        3jFoeaJ/dg+xVlYvI5fqMNShQ4Eu8zM3oi5mz+xKKP5pCsHH0uH3xEymJCvQQkoh
        44rcJkgW5aPTeOpKzS0BDRH3NeTbmcAzKcziFoieNzQ+6XuDixV9yKRHgD8HWUj1
        KNfzO3/2KvcY7cOFI+c4y7Yb4iYMuuNRoY2V9Me4HuiMLF5j0NU0+7H3gB/tX9Ay
        pJC5rI2R8fr6Jd/nzv2A18/fK0IMaOfj6+7jLKCgmmvznh1mhjUbOKCGgUZkFFpR
        0NVPf0lro9lxurIyhhsCXIdc8Mif6W5v4l+a8pV62PILCB2SJbJt+SZsu5xuQFng
        ==
X-ME-Sender: <xms:i4dwXYRhJyeuKwo61YgKWs1xYKTxeAkjPWH8YzFfRaWAyMAPeRvWKw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudejiedgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
    rhfuihiivgeptd
X-ME-Proxy: <xmx:i4dwXQIyRvLX_XI8h3N3YZS7z2WMtSyGY6UxtYCZWxpZf1NNjzwNMQ>
    <xmx:i4dwXb-2b7vzCwNRzTIqEdxId6bRzjUZf4DjhBkpK4vXb8TOTIuLcQ>
    <xmx:i4dwXXKNO2LuZxAZ5fiOhTrraiZATYgyFrnuHMtXRoczXTAl9ApV_g>
    <xmx:jIdwXWJQvkWW9LqKYDunvqlKDW5hvmqknTx00ao0U65HUg7nIQ4AOg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id E2964E00A3; Wed,  4 Sep 2019 23:56:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-186-gf4cb3c3-fmstable-20190904v1
Mime-Version: 1.0
Message-Id: <40601711-5fcf-40a0-bfc2-ae5043948a41@www.fastmail.com>
In-Reply-To: <20190905011732.16059-1-rashmica.g@gmail.com>
References: <20190905011732.16059-1-rashmica.g@gmail.com>
Date:   Thu, 05 Sep 2019 13:27:23 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Rashmica Gupta" <rashmica.g@gmail.com>,
        "Linus Walleij" <linus.walleij@linaro.org>
Cc:     "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
        "Joel Stanley" <joel@jms.id.au>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] gpio: Add in ast2600 details to Aspeed driver
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Thu, 5 Sep 2019, at 10:47, Rashmica Gupta wrote:
> The ast2600 is a new generation of SoC from ASPEED. Similarly to the
> ast2400 and ast2500, it has a GPIO controller for it's 3.6V GPIO pins.
> Additionally, it has a GPIO controller for 36 1.8V GPIO pins. These
> voltages are fixed and cannot be configured via pinconf, so we need two
> separate drivers for them.

Working backwards, we don't really have multiple drivers, just different
configurations for the same driver. So I think this should be reworded.

Also it's not really the voltage differences that are driving the different
configurations but rather that there are two separate sets of registers
in the 2600 with overlapping bank names (they happen to be split into
3.3V and 1.8V groups). The key point being that there aren't just more
GPIO registers tacked on the end of the original 3.3V group.

> 
> Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
> ---
>  drivers/gpio/gpio-aspeed.c | 30 ++++++++++++++++++++++++++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index 16c6eaf70857..4723b8780a8c 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -662,12 +662,14 @@ static void aspeed_gpio_irq_handler(struct irq_desc *desc)
>  	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
>  	struct irq_chip *ic = irq_desc_get_chip(desc);
>  	struct aspeed_gpio *data = gpiochip_get_data(gc);
> -	unsigned int i, p, girq;
> +	unsigned int i, p, girq, banks;
>  	unsigned long reg;
> +	struct aspeed_gpio *gpio = gpiochip_get_data(gc);
>  
>  	chained_irq_enter(ic, desc);
>  
> -	for (i = 0; i < ARRAY_SIZE(aspeed_gpio_banks); i++) {
> +	banks = DIV_ROUND_UP(gpio->config->nr_gpios, 32);
> +	for (i = 0; i < banks; i++) {
>  		const struct aspeed_gpio_bank *bank = &aspeed_gpio_banks[i];
>  
>  		reg = ioread32(bank_reg(data, bank, reg_irq_status));
> @@ -1108,9 +1110,33 @@ static const struct aspeed_gpio_config ast2500_config =
>  	/* 232 for simplicity, actual number is 228 (4-GPIO hole in GPIOAB) */
>  	{ .nr_gpios = 232, .props = ast2500_bank_props, };
>  
> +static const struct aspeed_bank_props ast2600_bank_props[] = {
> +	/*     input	  output   */
> +	{5, 0xffffffff,  0x0000ffff}, /* U/V/W/X */
> +	{6, 0xffff0000,  0x0fff0000}, /* Y/Z */
> +	{ },
> +};
> +
> +static const struct aspeed_gpio_config ast2600_config =
> +	/* 208 3.6V GPIOs */
> +	{ .nr_gpios = 208, .props = ast2600_bank_props, };
> +
> +static const struct aspeed_bank_props ast2600_1_8v_bank_props[] = {
> +	/*     input	  output   */
> +	{1, 0x0000000f,  0x0000000f}, /* E */

If there are 36 GPIOs then this configuration is suggesting that all of them
are capable of input and output. A handy observation here is that the first
36 GPIOs of the 3.3V GPIO controller in the 2600 also have both capabilities,
so we can re-use the 3.3V configuration if we can limit the number of GPIOs
somehow.

The devicetree binding already describes an `ngpios` property so perhaps
we could make use of this to use the same properties struct instance for both
controllers in the 2600: Require that the property be present for 2600-
compatible devicetree nodes and test for its presence in probe(), then fall
back to the hard-coded value in the config struct if it is not (this keeps
devicetree compatibility for the 2400 and 2500 drivers).

This way we can eliminate the aspeed,ast2600-1-8v-gpio compatible string
below (we just use aspeed,ast2600-gpio for both controllers).

Thoughts?

Andrew

> +	{ },
> +};
> +
> +static const struct aspeed_gpio_config ast2600_1_8v_config =
> +	/* 36 1.8V GPIOs */
> +	{ .nr_gpios = 36, .props = ast2600_1_8v_bank_props, };
> +
>  static const struct of_device_id aspeed_gpio_of_table[] = {
>  	{ .compatible = "aspeed,ast2400-gpio", .data = &ast2400_config, },
>  	{ .compatible = "aspeed,ast2500-gpio", .data = &ast2500_config, },
> +	{ .compatible = "aspeed,ast2600-gpio", .data = &ast2600_config, },
> +	{ .compatible = "aspeed,ast2600-1-8v-gpio",
> +	  .data = &ast2600_1_8v_config, },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, aspeed_gpio_of_table);
> -- 
> 2.20.1
> 
>
