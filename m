Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AD2D62545A
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Nov 2022 08:15:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232778AbiKKHPw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Nov 2022 02:15:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbiKKHPu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Nov 2022 02:15:50 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D184C220E5
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 23:15:49 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id d9so618799wrm.13
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 23:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4eTwrkDb9olcMeo5mJv791iRCoHWsO9jzyk3Ut1Z2jM=;
        b=nXY/YUdyh+wy6sjnii/CTq8J7FzaGV75FO0qN1WY6QS//tTxtzN/FQ7iijSO4VNCCp
         XMy0y5NleVK/KWWPCdQDV0XOKxCNTQi1rxinq6T9fYEgous+qcZuqZYA1jkLgtNvpSYM
         lqRurBAisbhNA1IYo+mvqqAkirGK0Esl1pCoQF+npDI6nlNjYTyvM6ZwCt1C+NgMow/8
         yW0SzjKbIgYWqQ3QQypEzslcbroCzmAPCPjpsTuIL8TytVF8qkNXebj83vqqSw0KtyCl
         3RM3O2wdN3zHqb2xMIKWpC8wsiaKtoiPiOZ38ueC9/6+C2MBN0V/uuW3M/TRCvdm0g9N
         YnVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4eTwrkDb9olcMeo5mJv791iRCoHWsO9jzyk3Ut1Z2jM=;
        b=Xb7YxceIsSMbzhVaX4nMNe6+NHsH/k/bkJ2SzULGaEC/ZKDHQLW9hlTbFv3ym2Qgba
         xlIvKRwdgKNDnESX/I2GVhA4ln8YDODziZ3LUgPHvJoTzM+AIbJOHRBczrLurU8wZX2z
         ce9+T+wTR9RDhmHFUrPAOMydRyclXXAA5gvNtUq5YppPLWMkvlaQriSa9BaVdsD1H7Tg
         gXboIDioeXYN9miz91YY6fx71i5HgnbpJr35cfN//Mtr0afyz7eFojvcb7frhD7FLPXJ
         wrGr/Taeds8J6CmHQQziNFxOsh4+3u4XipcqRZoc12lIb6Uyz4bbA5vw6xzSp5cwf08d
         tuww==
X-Gm-Message-State: ANoB5plZF42rR0Fe8sqZqVQhXg586vs/gJqBkJGBiEHIMyLSKFmLf3nL
        KdH1q222g9ZESgOVYWkYIm6HEfYRUpkTjhTZ
X-Google-Smtp-Source: AA0mqf4PjGUdIQOkDFwrSr98IMiZsGfmDfDfYcSUZfVCrPTXwfj2hOYyeGcXzMBG1/wj+uQURWphxA==
X-Received: by 2002:a5d:518d:0:b0:236:4ec6:af52 with SMTP id k13-20020a5d518d000000b002364ec6af52mr385577wrv.524.1668150948400;
        Thu, 10 Nov 2022 23:15:48 -0800 (PST)
Received: from [192.168.1.166] ([212.228.7.114])
        by smtp.gmail.com with ESMTPSA id y10-20020adff14a000000b00236860e7e9esm1079314wro.98.2022.11.10.23.15.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 23:15:47 -0800 (PST)
Message-ID: <b3f26f6b-757d-a3b0-fb54-ea54f3588fc0@linaro.org>
Date:   Fri, 11 Nov 2022 07:15:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH RFC 0/3] pinctrl: add ACPI support to pin controller
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com,
        rafael@kernel.org, linus.walleij@linaro.org
References: <20221110191258.1134378-1-niyas.sait@linaro.org>
 <Y21btYwNRMD4xXXL@smile.fi.intel.com> <Y21dtJySQX29VDIh@smile.fi.intel.com>
From:   Niyas Sait <niyas.sait@linaro.org>
In-Reply-To: <Y21dtJySQX29VDIh@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> Meanwhile, can we see the DSDT excerpt(s) that shows how you use these
> resources there?
I've used the following prototype for I.MX8MP

https://gitlab.com/nsait-linaro/acpi-patches/-/blob/master/0001-add-acpi-pinctrl-support-for-i2c-controllers.patch

> Also note, we need some clarification to be done in the ACPI specification
> regarding the numbering schema, used in those resources. TL;DR: for Gpio*()
> the number space is GPIO, for Pin*() is pin control (real pin numbering,
> since not all of them can be GPIOs and GPIO can have its own additional
> layer of numbering mapping).

Yes that would be helpful!

I've done some prototyping and have used the _DSD to pass the GPIO to 
Pin mapping to the GPIO controller. See following patches

https://gitlab.com/nsait-linaro/acpi-patches/-/blob/master/0001-add-GPIO-controllers-to-ACPI-table.patch#L89

https://gitlab.com/nsait-linaro/acpi-patches/-/blob/master/0001-add-acpi-gpio-controller-support-to-IMX-platform.patch
