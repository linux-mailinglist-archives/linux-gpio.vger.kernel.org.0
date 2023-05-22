Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05D6270CDBD
	for <lists+linux-gpio@lfdr.de>; Tue, 23 May 2023 00:21:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232136AbjEVWV1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 May 2023 18:21:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233045AbjEVWU4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 May 2023 18:20:56 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12F11BF;
        Mon, 22 May 2023 15:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684794054; x=1716330054;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=JZjQTVs1TZ5kTgg/xR+HBi/yoYC47r3zfGn11eJKA+8=;
  b=qfXVRymmKsc1Q1XOvmWBfTs9e4XeSWU8iaQHJQza/Af6eARrOaDcAPUJ
   qhMLwJ5AiWLippzlUnYj8Ektt/Rahj/8iggCrH8qr4pSex+/BpptJjzl3
   14GaHcQcM35bYxiqVjzroOszLHivpyDQVhyeM0Ta6oIRwLkBmDFSzw9bA
   OGLLbCs91NOdW8xEeNCkwoDEgP6fheUeks9qmj/On3IPnwi/2ofNMuLkk
   77YBbDMHw/hRpaXv2xcP0Qhost2P1AjCpF4hBgt9ci5NABZMJSvpP7nZD
   A68OxAhKFuUNCos5pFwL3yZJn9ra3xjVXNWkURd1i3im1QbT+dC/E4Te1
   A==;
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="153385720"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 May 2023 15:20:54 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 22 May 2023 15:20:53 -0700
Received: from [10.14.52.160] (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 22 May 2023 15:20:53 -0700
Message-ID: <8931f046-561c-1aae-fab3-1c572002b86f@microchip.com>
Date:   Mon, 22 May 2023 15:20:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] pinctrl: at91: fix a couple NULL vs IS_ERR() checks
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Ludovic Desroches <ludovic.desroches@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        <linux-gpio@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
References: <5697980e-f687-47a7-9db8-2af34ae464bd@kili.mountain>
From:   Ryan Wanner <ryan.wanner@microchip.com>
In-Reply-To: <5697980e-f687-47a7-9db8-2af34ae464bd@kili.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 5/22/23 00:44, Dan Carpenter wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> The devm_kasprintf_strarray() function doesn't return NULL on error,
> it returns error pointers.  Update the checks accordingly.
> 
> Fixes: f494c1913cbb ("pinctrl: at91: use devm_kasprintf() to avoid potential leaks (part 2)")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Acked-by: Ryan Wanner <ryan.wanner@microchip.com>
> ---
>  drivers/pinctrl/pinctrl-at91.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
> index 871209c24153..39956d821ad7 100644
> --- a/drivers/pinctrl/pinctrl-at91.c
> +++ b/drivers/pinctrl/pinctrl-at91.c
> @@ -1389,8 +1389,8 @@ static int at91_pinctrl_probe(struct platform_device *pdev)
>                 char **names;
> 
>                 names = devm_kasprintf_strarray(dev, "pio", MAX_NB_GPIO_PER_BANK);
> -               if (!names)
> -                       return -ENOMEM;
> +               if (IS_ERR(names))
> +                       return PTR_ERR(names);
> 
>                 for (j = 0; j < MAX_NB_GPIO_PER_BANK; j++, k++) {
>                         char *name = names[j];
> @@ -1870,8 +1870,8 @@ static int at91_gpio_probe(struct platform_device *pdev)
>         }
> 
>         names = devm_kasprintf_strarray(dev, "pio", chip->ngpio);
> -       if (!names)
> -               return -ENOMEM;
> +       if (IS_ERR(names))
> +               return PTR_ERR(names);
> 
>         for (i = 0; i < chip->ngpio; i++)
>                 strreplace(names[i], '-', alias_idx + 'A');
> --
> 2.39.2
> 

