Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86BAB6A5748
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Feb 2023 11:57:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231407AbjB1K53 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Feb 2023 05:57:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231300AbjB1K5Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Feb 2023 05:57:16 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E85E2233FD
        for <linux-gpio@vger.kernel.org>; Tue, 28 Feb 2023 02:56:25 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id l1so6200665wry.12
        for <linux-gpio@vger.kernel.org>; Tue, 28 Feb 2023 02:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677581784;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1g1zgoQ8e1rCmD+8V4lGEZR3Cqpnsy/4iKzn5XmTAqQ=;
        b=qPtYuCnjYFvgN/MWdlB6HfRBPLMrs5RBj9IQwO3XK1T3AjSHxK+spWk7T5Px0cFxMN
         ZWO8cO2ychz4ST51hBTs+hR1sXLdKySOB+ONK29wSvgfpooZXSlAkpNnJDDtL3gaYVvX
         SEoD8eudJR0mIaRTchppYPlspfXGoifvkrLlCtozjhCZZPlBU9ETwhuysK5zoc3C0EkV
         BjkGTELeEoP4OFN56BsSiR01v7cKCXrDgl8wvMd3C6CJk+8xJjby+nNBjL8PX4PaxEgl
         rjkXAUYZoXy6FUBUnNtOhPg45jeAqyExnXZrRHAXSQHGU6I0CHgwu6VnzZlqEk1kVHq/
         fVyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677581784;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1g1zgoQ8e1rCmD+8V4lGEZR3Cqpnsy/4iKzn5XmTAqQ=;
        b=kkc0bOKZlnph+Alf5opBoD45Jhk6czEX8BseVnvrcWzjXPcGZHAA0I4ydMcLaQYCK7
         j8Pj+4SOC2w4NL81CPwtmlN3WyuiiOQEsE/MrSxPgsPveGdryphlvAM3YivFY03iiHpf
         A5dyoN502XA6Kt9Q64Zb8M9jB+aerthkY96V5WCl0TfPitMuyE+YYLrhEeFILBLzVdz+
         GBcmzxmmFMn56dIGCv7V4bz6Wd1mDIF9VYF1A9ZrtMUUTcp+YMIkqefYf0ohofqmdRTN
         rY736Eby3J1cIX1IZ1b8UN9h9iHSqsijA9FIbGJiLbQKUTlVxWXnpQcSckRY7bKik22m
         hr+g==
X-Gm-Message-State: AO0yUKXIgx2B37554DMbhOu6ZXcHL/qxKVYFhNbvqJBE6PBKtjcNYxxZ
        EBJc+cgb4c0GOegYCVV156QQZA==
X-Google-Smtp-Source: AK7set/gFPVojB1YHQtiFQzFwtOTIxwh5zVr8canwK3mSUBFXw89fvTyUYLRoiWrIidbpCXW6nM0Ow==
X-Received: by 2002:a5d:598b:0:b0:2c5:67e3:808d with SMTP id n11-20020a5d598b000000b002c567e3808dmr8344224wri.35.1677581784294;
        Tue, 28 Feb 2023 02:56:24 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id s9-20020a5d4249000000b002c5598c14acsm9443185wrr.6.2023.02.28.02.56.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 02:56:23 -0800 (PST)
Message-ID: <91879230-7f2d-c168-3808-d567b9e19e82@linaro.org>
Date:   Tue, 28 Feb 2023 11:56:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/2] dt-bindings:pinctrl:at91:Adding macros for sama7g5
Content-Language: en-US
To:     Ryan.Wanner@microchip.com, ludovic.desroches@microchip.com,
        linus.walleij@linaro.org, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <cover.1677520830.git.Ryan.Wanner@microchip.com>
 <936fd3060662becd5485e32d5947286fcf0a3502.1677520830.git.Ryan.Wanner@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <936fd3060662becd5485e32d5947286fcf0a3502.1677520830.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 27/02/2023 19:07, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Adding macros for sama7g drive strength.


Look at output of the command I gave you. Now look at your subject...
Missing spaces.

BTW, it is "Add", not "Adding".
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
> changes since v1:
> - Fix ABI break.
> - Add explanation for drive strength macros.
> 
> changes since v2:
> -Fix subject prefix to match subsystem.
> -Add more in-depth discription of sama7g5 define values.
> -Fix formatting issues.
> 
>  include/dt-bindings/pinctrl/at91.h | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/pinctrl/at91.h b/include/dt-bindings/pinctrl/at91.h
> index e8e117306b1b..a02bee76b1fb 100644
> --- a/include/dt-bindings/pinctrl/at91.h
> +++ b/include/dt-bindings/pinctrl/at91.h
> @@ -42,8 +42,21 @@
>  #define AT91_PERIPH_C		3
>  #define AT91_PERIPH_D		4
>  
> -#define ATMEL_PIO_DRVSTR_LO	1
> +/*These macros are for all other at91 pinctrl drivers*/
> +#define ATMEL_PIO_DRVSTR_LO	0

That's still ABI break, isn't it?


Best regards,
Krzysztof

