Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98BE4573EF0
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Jul 2022 23:25:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237485AbiGMVZA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Jul 2022 17:25:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237482AbiGMVY7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Jul 2022 17:24:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 55CD11FCE7
        for <linux-gpio@vger.kernel.org>; Wed, 13 Jul 2022 14:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657747497;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2Prw975jaglYxtkVp+vq83GSZySiqpzDYEyN9m98BO8=;
        b=TN7Lc8RWAC6IawlZLcqCxwbjl7qB+pcPSWDVpkjyAVYTQ1uo2wdzLOLJP7Z5vp8HnbX5/w
        XRm48oIUblly8BNm7oS2K6qZwHRbr5Amo1GHzaGegym5KZ52SneuiAUrtNCX6oOQZYIoQn
        jOzVaEZaWwnzZ1MNCJsvIXeF9CGzQiU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-497-XXGRab8UMZ6BUvyFyZKv0A-1; Wed, 13 Jul 2022 17:24:56 -0400
X-MC-Unique: XXGRab8UMZ6BUvyFyZKv0A-1
Received: by mail-ed1-f69.google.com with SMTP id t5-20020a056402524500b0043a923324b2so9274408edd.22
        for <linux-gpio@vger.kernel.org>; Wed, 13 Jul 2022 14:24:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2Prw975jaglYxtkVp+vq83GSZySiqpzDYEyN9m98BO8=;
        b=3dEApuD+dS/pCZpm/cGpTLuK1wcuTu+9sqitKJWixEUc7HsAPCpXX/Jh4YzaY18dq8
         YiBm8YDJik2gCw/xHlOmzUnni3Ko83FX9Z+jajgZJyMMLB46Nc9/+0GtE+Aargv4wNTV
         rTdshqFx7VSkh6pJRQHf5sgWyG/il19XpqnLj5f22mp3tDXzLLQHm/+1Uv/gt3E3ae+M
         9y23nQHWByCsrv+Xwn2kqTlgGeVqjlza/OE13tdjJlSkNbtXtEebS0tYrmL6R66I2FdI
         +pNg2cMzmBP6lgnCfFBszoC/tuz2RUdFC2vBwZjmrF8y8rrRa/L6vh1x1Y8AfXwe/LNH
         S4KQ==
X-Gm-Message-State: AJIora8rlTYEsz0LiElqma5Q5Q6Ksq//oCxIRw1IocXF1OysaWehY4Ji
        mXOkPejsVPHbU4tnStBzmC+fPim2g3Ddlq16sWza9gSX8wTmdLE7ICNSe/XGcnacxoVsi9yyxo7
        4EmyUcTcX3gL+TDu5nm9Rag==
X-Received: by 2002:a17:907:6e89:b0:72b:68d6:c9d6 with SMTP id sh9-20020a1709076e8900b0072b68d6c9d6mr5424566ejc.711.1657747494244;
        Wed, 13 Jul 2022 14:24:54 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tKBz+IWpbjn95o3r0w4RFo76+LtvJZNuG6ihRK7LxgdjesQrErdjjV4j3Jq6uvWdh4hx78DQ==
X-Received: by 2002:a17:907:6e89:b0:72b:68d6:c9d6 with SMTP id sh9-20020a1709076e8900b0072b68d6c9d6mr5424560ejc.711.1657747494059;
        Wed, 13 Jul 2022 14:24:54 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id ky6-20020a170907778600b0072b11cb485asm5355840ejc.208.2022.07.13.14.24.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jul 2022 14:24:53 -0700 (PDT)
Message-ID: <3295df49-1ef0-7726-5cfa-462bac1ccf12@redhat.com>
Date:   Wed, 13 Jul 2022 23:24:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] pinctrl: Don't allow PINCTRL_AMD to be a module
Content-Language: en-US
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Basavaraj.Natikar@amd.com, madcatx@atlas.cz,
        jwrdegoede@fedoraproject.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220713175950.964-1-mario.limonciello@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220713175950.964-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 7/13/22 19:59, Mario Limonciello wrote:
> It was observed that by allowing pinctrl_amd to be loaded
> later in the boot process that interrupts sent to the GPIO
> controller early in the boot are not serviced.  The kernel treats
> these as a spurious IRQ and disables the IRQ.
> 
> This problem was exacerbated because it happened on a system with
> an encrypted partition so the kernel object was not accesssible for
> an extended period of time while waiting for a passphrase.
> 
> To avoid this situation from occurring, stop allowing pinctrl-amd
> from being built as a module and instead require it to be built-in
> or disabled.
> 
> Reported-by: madcatx@atlas.cz
> Suggested-by: jwrdegoede@fedoraproject.org

Note I generally use: "Hans de Goede <hdegoede@redhat.com>" for all
things kernel related.

This looks good to me. Fedora is already building in amd-pinctrl
which AFAIK is done because of similar issues to the reason given
in the commit message:

Acked-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> Link: https://bugzilla.kernel.org/show_bug.cgi?id=216230
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/pinctrl/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index f52960d2dfbe..bff144c97e66 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -32,7 +32,7 @@ config DEBUG_PINCTRL
>  	  Say Y here to add some extra checks and diagnostics to PINCTRL calls.
>  
>  config PINCTRL_AMD
> -	tristate "AMD GPIO pin control"
> +	bool "AMD GPIO pin control"
>  	depends on HAS_IOMEM
>  	depends on ACPI || COMPILE_TEST
>  	select GPIOLIB

