Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D84551ABF9
	for <lists+linux-gpio@lfdr.de>; Wed,  4 May 2022 19:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359735AbiEDSCO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 May 2022 14:02:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377577AbiEDSBN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 May 2022 14:01:13 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 952514E3B3
        for <linux-gpio@vger.kernel.org>; Wed,  4 May 2022 10:16:54 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id p4so2481914edx.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 May 2022 10:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fiVARxmXu8FTB4rwzADnzbXFPdjI8umDaxKRYynAmhQ=;
        b=TM8GmEt9YloR+Qv/mT7g6w8/+iPNVgrRi+Ym/LhHMZs79+zWcr0aTLLrivUDaliIeA
         EnMUEa1WnJ5vxOOWyNvJDBmcFkbhcebsTJc46wwYpoxg7fD2m6r3Ukywyhaol4FYRU7N
         PV8Y+wrHKtCH5SntwUq5U5sd3spaKzbBrCYpt3eJRuEBc9yUwJN+7UvXUzEudPfsOtQK
         /RBagaBch5I2IBx1KoDObN5OJH6dOYJqPbNHOz/hmnjUfUQ079jWtigdWh0ns+UtGbgD
         EGVQ2d11luLHCuL1cMlOQgu6BYedUk34XhQKzv6PfeFLf19uZevzfC2btvS6LiE4LZ4a
         n4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fiVARxmXu8FTB4rwzADnzbXFPdjI8umDaxKRYynAmhQ=;
        b=sE5WyOk7eQOeqt73knXdfI7uGS9M/2nH0mKr+nK2jH17nuQzy8kce967x+hnIZRjOF
         j6PaA0DfjWURT5jYHm6aZaxZ77E2p7LQRCPmJnqtxTCBcIYW4lbCsmOdkb//DiR+N6B6
         timxIOcxtFDp6eOT7M00WQothReAd9OOrcTEHn4x/HrOOlC4J4Cvb3La5gXcoMcNlRRs
         i9XX6l1ILGz5cZEMFLHNxkmW/W82cqFxrIAfBHsjvrggKjvkpzsGzaPbB1o14MqCVoog
         jEB6taSha2nENnL0AYl5QEwAPkVlw01ur7XnPP3W+z3wxOsQe1aQWAg2sK9iU2rF8ATp
         5jzg==
X-Gm-Message-State: AOAM532fQ0J0VU++VEa9nE4S3UckPcWIOyyQmHj1lfkjuWw8TPAWzYmh
        +xM9Q3C+/JDI/csr5dWFY28=
X-Google-Smtp-Source: ABdhPJwRgFhXMv3zDJ3kdKMXaXUveRvG3cyjmR3eLowMukINPTS5zG+/xCtn0bwMVjkNnvoixZkH8A==
X-Received: by 2002:a05:6402:2397:b0:426:4967:8574 with SMTP id j23-20020a056402239700b0042649678574mr24704358eda.197.1651684613103;
        Wed, 04 May 2022 10:16:53 -0700 (PDT)
Received: from kista.localnet (cpe1-3-76.cable.triera.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id v23-20020aa7d657000000b0042617ba639esm9386887edr.40.2022.05.04.10.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 10:16:52 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Andre Przywara <andre.przywara@arm.com>
Cc:     writeforever@foxmail.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] pinctrl: sunxi: f1c100s: Fix signal name comment for PA2 SPI pin
Date:   Wed, 04 May 2022 19:16:51 +0200
Message-ID: <2507520.Lt9SDvczpP@kista>
In-Reply-To: <20220504170736.2669595-1-andre.przywara@arm.com>
References: <20220504170736.2669595-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Dne sreda, 04. maj 2022 ob 19:07:36 CEST je Andre Przywara napisal(a):
> The manual describes function 0x6 of pin PA2 as "SPI1_CLK", so change
> the comment to reflect that.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/pinctrl/sunxi/pinctrl-suniv-f1c100s.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-suniv-f1c100s.c b/drivers/pinctrl/
sunxi/pinctrl-suniv-f1c100s.c
> index 2801ca7062732..8109efac341e2 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-suniv-f1c100s.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-suniv-f1c100s.c
> @@ -51,7 +51,7 @@ static const struct sunxi_desc_pin suniv_f1c100s_pins[] = 
{
>  		  SUNXI_FUNCTION(0x3, "pwm0"),		/* PWM0 
*/
>  		  SUNXI_FUNCTION(0x4, "i2s"),		/* IN */
>  		  SUNXI_FUNCTION(0x5, "uart1"),		/* RX */
> -		  SUNXI_FUNCTION(0x6, "spi1")),		/* MOSI 
*/
> +		  SUNXI_FUNCTION(0x6, "spi1")),		/* CLK 
*/
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 3),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
> -- 
> 2.25.1
> 
> 


