Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24DB21265B5
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 16:26:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726936AbfLSP0M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 10:26:12 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:32898 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726776AbfLSP0M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 10:26:12 -0500
Received: by mail-lj1-f196.google.com with SMTP id p8so6716507ljg.0;
        Thu, 19 Dec 2019 07:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EfMJAK6QdKFsh+fBVzyJUPJJh4olOvNdwOUocs3Xhps=;
        b=nsuYK9rVKQACfeRu9Z8HMvUbUy2U3uac5KvqBY2uHv1G4NDmeVbxnMm99VdxvlyrjY
         Ms5Paep/aqE1Qpugiti/UroiLXFPeLkDlymrD59PBm96RE2dGyxD/7btwCQucWGMVexF
         EALSGO0JH++DxTRly89fl1pXYNs+sojGl3R074/v5B/zea69udGzrNZAuEJj1wYI8USd
         CAsv8qQs/Vq/qd+d7kSbfA0QuJtJeEz0dkNKQqNsmcLLGLwGozQCtESJdrtFKbTDsg5Z
         LGKIOVl9Y5jvj+BZnwfoNhuoE+wdwDG64FAavt9FajbRp6lnTFXx/3tQ+9QTJV850WA1
         xJKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EfMJAK6QdKFsh+fBVzyJUPJJh4olOvNdwOUocs3Xhps=;
        b=JxnU7cw64/RrOjlw1OVGRVkzHVumW4le03BB2fjSIzmQs/cvSg+SJ4Jx12vTME1+/6
         xA6jEC6Xkv29Dw3Mob2gNfF1rYGFw7j+xMZ7c8RzcfoZmea19Hgp7twycLJCCXhuhMWE
         Juml1+5xYVY5oNdbRla4Zs75OK/DQyTq1m/XwccUTF9uLQMwnhHGLIG9l8iqmdyZU4Fa
         Xjs7tAd4OAI6KQ+CohB1zv7ZV45FsX+3TwYh8Rsuf80MV6TaQKfdj8fR4EqWKEhFfxYc
         KpQJLZ+apqPJ6hxV4OymHOjVAtGBtoiv1a2sfq+CsY/NmMq0BFa5rJYqe+HRbx3Y4jZm
         wrUA==
X-Gm-Message-State: APjAAAVsZa7lFuZiOXR+YFZMym82HHo9thXWoiroAjhQ0AST3xnLghe3
        TfJzh9I0tyOiogBdhcigwfBSEmcy
X-Google-Smtp-Source: APXvYqyxpPlUqDrJrTTqoRBffG4scu7HrXDMd4IQ99CE0YQXdPBAVdVy6IGag/hmiTmUvSgTzs0DRg==
X-Received: by 2002:a2e:93d5:: with SMTP id p21mr6652104ljh.50.1576769170048;
        Thu, 19 Dec 2019 07:26:10 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id i16sm2728741lfo.87.2019.12.19.07.26.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2019 07:26:09 -0800 (PST)
Subject: Re: [PATCH v1 0/3] Tegra GPIO: Minor code clean up
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
References: <20191215183047.9414-1-digetx@gmail.com>
 <20191219145341.GL1440537@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <aff1c503-f4da-275d-b867-ca14c86a00db@gmail.com>
Date:   Thu, 19 Dec 2019 18:26:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191219145341.GL1440537@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

19.12.2019 17:53, Thierry Reding пишет:
> On Sun, Dec 15, 2019 at 09:30:44PM +0300, Dmitry Osipenko wrote:
>> Hello,
>>
>> I was investigating why CPU hangs during of GPIO driver suspend and in
>> the end it turned out that it is a Broadcom WiFi driver problem because
>> it keeps OOB wake-interrupt enabled while WLAN interface is DOWN and this
>> may cause a bit weird CPU hang on writing to INT_ENB register during of
>> GPIO driver suspend. Meanwhile I also noticed that a few things could be
>> improved in the driver, that's what this small series addresses.
>>
>> Dmitry Osipenko (3):
>>   gpio: tegra: Use generic readl_relaxed/writel_relaxed accessors
>>   gpio: tegra: Properly handle irq_set_irq_wake() error
>>   gpio: tegra: Use NOIRQ phase for suspend/resume
>>
>>  drivers/gpio/gpio-tegra.c | 21 ++++++++++-----------
>>  1 file changed, 10 insertions(+), 11 deletions(-)
> 
> Patches look good:
> 
> Reviewed-by: Thierry Reding <treding@nvidia.com>
> 
> I also applied this series on top of v5.5-rc1 and ran it through our
> test system:
> 
>     Test results:
>         13 builds:  13 pass, 0 fail
>         22 boots:   22 pass, 0 fail
>         34 tests:   34 pass, 0 fail
> 
>     Linux version:  5.5.0-rc1-g3d0b4fced39e
>     Boards tested:  tegra124-jetson-tk1, tegra186-p2771-0000,
>                     tegra194-p2972-0000, tegra20-ventana,
>                     tegra210-p2371-2180, tegra30-cardhu-a04
> 
> All tests passing, so:
> 
> Tested-by: Thierry Reding <treding@nvidia.com>
> 

Thank you very much!
