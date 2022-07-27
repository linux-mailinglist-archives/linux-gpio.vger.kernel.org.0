Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC72E582773
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jul 2022 15:15:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232704AbiG0NPi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jul 2022 09:15:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233724AbiG0NPg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jul 2022 09:15:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AFB33275C7
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jul 2022 06:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658927731;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+U2SMjrAZx6a3vXMCUjxlR0K/3DAi/IYsuGYocVm8PM=;
        b=BrtCn2yqmPK2MB4wJdxYVqz4Zzrf9V4ppgdbwt3quJ0HCwxLylHq4Sm36DZOVO2g4K+zce
        wnbsGDFOk65K81sJApK4UpBxSXk8tCmYisryrbRza/RVhM+pENy3+k8d3l0hHVtQEokUvq
        JrAh82wYsUVo8cx+FB1fO0Ret3Tf7Fw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-_ZMMFSvMPqGJFLcbiG0SUA-1; Wed, 27 Jul 2022 09:15:30 -0400
X-MC-Unique: _ZMMFSvMPqGJFLcbiG0SUA-1
Received: by mail-ej1-f70.google.com with SMTP id nb10-20020a1709071c8a00b006e8f89863ceso5152359ejc.18
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jul 2022 06:15:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+U2SMjrAZx6a3vXMCUjxlR0K/3DAi/IYsuGYocVm8PM=;
        b=jvwsqBj7kYtcbcm4TFovyz8EuV4SgADFJYcrrqCPAwX7UFPY3/vu5y5rugoX7NTlFK
         /KbGKcYzPv7/GJaszSNX6TXitIvYBVOaGPkGAOZfMJluaZwAciUeY1Z2sSKwnmANG0HW
         70eykHYF+wa+WYFkMCZ616PsnU1IaP8nb1g0ZDCktI1S5zBPOvhpehMWqKS68BBAiDfF
         Hbe78WC6Kw26IovFSXVZMI7u712apCkBG80Zfuq5NasCtNPb+G13+KHFmmAcFmvmKPjx
         9QH60T/oPL02k8w+DyKCDlVK5zPDPFlhCo6MqkTpUIKuz6t0jmvhYTB9nMmc3f3h+Uxv
         681g==
X-Gm-Message-State: AJIora8z7RuzeKOT+HjPBo+Rz0gZalEsx+mPAwrWC1mwaHkVyDLbPQ/P
        yYyADoZPbvXlFCayUiDU/lkUlNEWqb+y5T2eHWAo7OIkw/+f9nPJNf4FzIFjDeN43o/m07/fbv5
        CNJvbr4iCpYJelsw+EnZ5ww==
X-Received: by 2002:aa7:c599:0:b0:43b:b7c8:36ff with SMTP id g25-20020aa7c599000000b0043bb7c836ffmr23067783edq.110.1658927729163;
        Wed, 27 Jul 2022 06:15:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uQBCa2+G+jTdUedn1Ozel7kHw3Vtt+HOUWRygOCweoJHcBFw76XKlCNA93hHF3POGePgt8YQ==
X-Received: by 2002:aa7:c599:0:b0:43b:b7c8:36ff with SMTP id g25-20020aa7c599000000b0043bb7c836ffmr23067763edq.110.1658927729007;
        Wed, 27 Jul 2022 06:15:29 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id u17-20020a1709061db100b0072aeda86ac3sm7689731ejh.149.2022.07.27.06.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 06:15:28 -0700 (PDT)
Message-ID: <9c7c86da-9114-8d68-38f0-ec8284b79af0@redhat.com>
Date:   Wed, 27 Jul 2022 15:15:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] gpiolib: acpi: Add a quirk for Asus UM325UAZ
Content-Language: en-US
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Pavel Krc <reg.krn@pkrc.net>, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220719142142.247-1-mario.limonciello@amd.com>
 <20220719142142.247-2-mario.limonciello@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220719142142.247-2-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 7/19/22 16:21, Mario Limonciello wrote:
> Asus UM325UAZ has GPIO 18 programmed as both an interrupt and a wake
> source, but confirmed with internal team on this design this pin is
> floating and shouldn't have been programmed. This causes lots of
> spurious IRQs on the system and horrendous battery life.
> 
> Add a quirk to ignore attempts to program this pin on this system.
> 
> Reported-and-tested-by: Pavel Krc <reg.krn@pkrc.net>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=216208
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/gpio/gpiolib-acpi.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
> index 375942d92d6f..2149713ea8f1 100644
> --- a/drivers/gpio/gpiolib-acpi.c
> +++ b/drivers/gpio/gpiolib-acpi.c
> @@ -1586,6 +1586,20 @@ static const struct dmi_system_id gpiolib_acpi_quirks[] __initconst = {
>  			.ignore_wake = "INT33FF:01@0",
>  		},
>  	},
> +	{
> +		/*
> +		 * Interrupt storm caused from edge triggered floating pin
> +		 * Found in BIOS UX325UAZ.300
> +		 * https://bugzilla.kernel.org/show_bug.cgi?id=216208
> +		 */
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "ZenBook UX325UAZ_UM325UAZ"),
> +		},
> +		.driver_data = &(struct acpi_gpiolib_dmi_quirk) {
> +			.ignore_interrupt = "AMDI0030:00@18",
> +		},
> +	},
>  	{} /* Terminating entry */
>  };
>  

