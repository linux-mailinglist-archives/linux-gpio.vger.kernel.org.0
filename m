Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DEF248AB9C
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jan 2022 11:42:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237828AbiAKKmV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jan 2022 05:42:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25029 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1348523AbiAKKmS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 11 Jan 2022 05:42:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641897738;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=exGhddzIuXzYbFHzsLvqaYt7el+DtaIKJsXSkGywEqs=;
        b=Pv2F7lMUOsALc3i57MhGI8ocZ2+FiSnWUi2KqtNFKgDdVns+eI44O1bynLQ9PTvkEKbIyr
        v3XxR/5ZGbMbZi2y1vpiQkTCr8b+m6WAheUVDUXxcVB3QAuOBjGd+a9rvNT3kIN0Vi5PKY
        LaSfDXzXD547Q5+Cl2jpVmNqGprKrM0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-fi-0OEZwNpSYIKSbQu_TvA-1; Tue, 11 Jan 2022 05:42:16 -0500
X-MC-Unique: fi-0OEZwNpSYIKSbQu_TvA-1
Received: by mail-ed1-f71.google.com with SMTP id z10-20020a05640235ca00b003f8efab3342so12935547edc.2
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 02:42:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=exGhddzIuXzYbFHzsLvqaYt7el+DtaIKJsXSkGywEqs=;
        b=ENA8UbhUvgy0rSqoymtnXZJ4MvdeDqNzopeUUmCqgqZMYYvliudgNYxAG5QyfXSDLX
         /BiMm3Yt+HEg/GnsEmDsVg2EgIyaT4r+CBuHNxqpcaBtWWhkM9J/6dBMrIcNHZUt0tWF
         7B13xASHPpI7IZTgQ9OPpTXl43nk4zLqAf7sc9+romExZu8vAeGnwmo/JsfsTHiJe12t
         CSu0SIeMb3Cb9e1gwuzJsuXYi4qwykc/RMMXmANLMNMFGpDSdYoKiXRweIxluZE3T9TE
         EzjdxRuhwpXSKs7lV9xMh8BZXLFwRH631MX0/6Gv24oESfTtdXvQzgPTR1MtT2fJRH7m
         s3Vw==
X-Gm-Message-State: AOAM531FSHIGFWSsdX64T/TCdNkYUu7jF+A/nbxIf78fvLZ1k+hfdlpn
        RNleWahzS4RdjT6l+U+fgIRI0EafWMB+1DFweP1waRXDJ9K/wxc7P1AkvXnZBWX4trB+uO9Myqd
        HyG7rzvZhMetH5RgeZxqmMA==
X-Received: by 2002:a05:6402:230e:: with SMTP id l14mr3775449eda.370.1641897735630;
        Tue, 11 Jan 2022 02:42:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYt5xyRCuivW+wX2Tg7or8bWPjmW58fj295UBS5wMFzS+PKkPqWf06ZwdYN4+wJAFqJpCJ0w==
X-Received: by 2002:a05:6402:230e:: with SMTP id l14mr3775438eda.370.1641897735513;
        Tue, 11 Jan 2022 02:42:15 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id p16sm3523637ejn.76.2022.01.11.02.42.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jan 2022 02:42:15 -0800 (PST)
Message-ID: <71ce63a0-d460-8b79-5c56-1018076e6901@redhat.com>
Date:   Tue, 11 Jan 2022 11:42:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/2] gpio: tps68470: Allow building as module
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <20211225120026.95268-1-hdegoede@redhat.com>
 <CAHp75Vdz1zxE5V_ff+jSp6VUo34aRinLj-gK_HOi5-2Zgw3E8w@mail.gmail.com>
 <YdRU3DVsByJzyXmn@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YdRU3DVsByJzyXmn@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 1/4/22 15:08, Andy Shevchenko wrote:
> On Sat, Dec 25, 2021 at 04:41:58PM +0200, Andy Shevchenko wrote:
>> On Sat, Dec 25, 2021 at 2:00 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>
>>> The gpio-tps68470 driver binds to a tps68470-gpio platform-device which
>>> itself gets instantiated by a special MFD driver from
>>> drivers/platform/x86/intel/int3472/tps68470.c
>>>
>>> This MFD driver itself can be build as a module, so it makes no sense to
>>
>> built
>>
>>> force the gpio-tps68470 driver to always be builtin.
>>
>> built-in
>>
>> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>> (see one minor comment below)
> 
> I don't see the next version, in any case it's too far from the beginning of
> the v5.16 cycle and I gave my tags so Bart may (or may not :-) apply them. If
> it's okay to be v5.18 material, I'll take a new version sent after v5.17-rc1.

It is fine for this to go into v5.18, thank you for your review. I'll send
a new version addressing your comments.

Regards,

Hans

