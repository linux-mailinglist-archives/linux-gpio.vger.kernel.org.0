Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FD99222BB2
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 21:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728560AbgGPTO5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 15:14:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728374AbgGPTO5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 15:14:57 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3DD1C061755;
        Thu, 16 Jul 2020 12:14:56 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id f5so9540728ljj.10;
        Thu, 16 Jul 2020 12:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FH1i/9Q7biv+5kd2aHJzTASe8AFgNZkqx6zcZ0CRgAM=;
        b=Wn7hhFIJBgNHurMYXpcMzkVEpgS+G0L7MmD8J8qk3tCEqcYin8UHdaPxMT5CXRg+S9
         g83fFCUogHDCB6WOJ4rpJ+8uh1wxnGl0J7FmcabE8rce6HWdqsbzaw0R4/Dowv1tdpJh
         DIAlQT38AV71ra9Ka/8j1WaHlIv5TEvlzqq9oZTib3fjS8IydzBFRyvELNRZQU9vVPeV
         /x0xTA6jYir1Q9hW5bTld/jgCm4zngsfN39XIiRD+XNuixgVtIOcfW4aW3DVcKpD+Vcf
         KmzvDEK+J86k5402o4XaGz7PhPUV1EWfNEK72hUm7msuQgdm0zxDD9bGTq+4PjpsD6rv
         5M8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FH1i/9Q7biv+5kd2aHJzTASe8AFgNZkqx6zcZ0CRgAM=;
        b=uKLA6yRgm8fzkGOEwfROln2VXNcnT9krxSdFUu4aMpusmPwlKCq3j2B0NMj3LqkyR1
         Y64/7klSMjrcbXJDM3w8uKkl86NPAWiI52Ml1fkLRaV9xnXyiq8rsx+8GyCAgvz3KPmr
         YIhMY6V6JaXc7c9DJKO1tvN2+sWhLlPxzQjXe4ABxow9c8Ul1YWcg1z6PSoQ/31+56Gk
         OvDAv/JEXvIWhx/E0drfkStjwL9sX8s78baP3MEvYqmVF8ATuneygDM0TZYBWYxNqNZl
         FuADX8nTzy6ORUnF1lti8vOEnYrtsUtlLT1sRqURbMLNKIm+PaV9o+u4KVmOzMPSx1BZ
         N6zw==
X-Gm-Message-State: AOAM531l6Y1lE0iPp+psx40QRea7ByUGwCXcb6ae/VrbnAxKHO9Sshud
        /5oM+WqtnihKz9+dGF2SOtKgopaS
X-Google-Smtp-Source: ABdhPJwcYWd14dWMRbo7MCBi1xwO+8IGc1NwY6E8MeiMH3Khln7PDLzj6vFwtTk/KoIlzzJ7hJsiig==
X-Received: by 2002:a2e:5746:: with SMTP id r6mr2910169ljd.205.1594926894806;
        Thu, 16 Jul 2020 12:14:54 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-4-184.pppoe.mtu-net.ru. [91.76.4.184])
        by smtp.googlemail.com with ESMTPSA id s4sm1357437lfc.71.2020.07.16.12.14.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2020 12:14:54 -0700 (PDT)
Subject: Re: [PATCH v4 0/6] Improvements for MAX77620 GPIO driver
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-tegra@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20200709171203.12950-1-digetx@gmail.com>
 <CACRpkdZNLDgsrPRenyvPZD6A+Wvj-P3AJBf5Ke-uY9=R9DyjxQ@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c33c7f0d-cc0d-a9ba-dbd2-587c8cf9e2e8@gmail.com>
Date:   Thu, 16 Jul 2020 22:14:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdZNLDgsrPRenyvPZD6A+Wvj-P3AJBf5Ke-uY9=R9DyjxQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

16.07.2020 11:52, Linus Walleij пишет:
> On Thu, Jul 9, 2020 at 7:12 PM Dmitry Osipenko <digetx@gmail.com> wrote:
> 
>> This series addresses a problem that I discovered on Nexus 7 device where
>> GPIO interrupts may be left enabled after bootloader and the driver isn't
>> prepared to this. It also makes a small improvements to the code, fixes the
>> non-released interrupt bug and converts driver to use irqchip template.
>>
>> Changelog:
>>
>> v4: - Added stable-tag to the patch "Fix missing release of interrupt".
> 
> This v4 series applied, thanks a *LOT* for your patient work on this!

Hello, Linus! Thank you for applying the patches!

> I need to fix the USB port on my Nexus 7 so I can test how the
> mainline support is working these days!

Please notice that this should be a Nexus 7 2012, which is NVIDIA
Tegra30-based Nexus 7.

The mainline support just starting to emerge for the 2012 model,
although not much is missed in the upstream. There are couple patches
currently under review which are necessary for Nexus 7 2012 in order to
make it ready for everyday use, like a tiny patch for the touchscreen
support and DRM bridges/panel orientation improvements for the Tegra DRM
driver. We're pretty close! :)
