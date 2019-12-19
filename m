Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3526126731
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 17:34:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726936AbfLSQeG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 11:34:06 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35393 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726855AbfLSQeG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 11:34:06 -0500
Received: by mail-lj1-f194.google.com with SMTP id j6so6931150lja.2;
        Thu, 19 Dec 2019 08:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NbGUxJZschh5pU5eBUWoyfxmgLY0Jtie4Fq87j9uajM=;
        b=fYwP12aOi9NdXLIYBDuMsIPSrXPApDqz1POx12Skp5WX/xXXSTSsF/HVtd7Wf+G4AW
         A/0iKnvcDCBdN1udrsefmIgBSgvsHGMPH+bPozR/f2ZCXuR22TgnzCUey7Z3WTX4S+o1
         53PkDayjk238dAMSO1Ha21+HUiLGYI1RCrorqWH8TyP0jAgeriBPEypujR22PRj9mTb6
         dKJEZew4DEO3wEQQ9ncPmtx0a1F39/sVZt2iqF6ZYsO4uNPDxohorTYg/IGT/nF6AZTC
         w7sq1iAHf9La7k5GuZnXwUr6wJk1wAjJyWRjx/nvLWwE4oUBQC7s093m1MEvX26GuXFj
         /9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NbGUxJZschh5pU5eBUWoyfxmgLY0Jtie4Fq87j9uajM=;
        b=SYGwakmBD1qRWQWXX7dtnP+oQztbo7PtVWajWnaobPwRNXkAoLkyh1KDPZEdTCUDnm
         EYOpppi9T3vOXATh/fOk7WsyNcdtzKNgKwdqvJ6ghHr9MPzT9YbBlX2JjCSMWJFhB8di
         iTmxJELugFxZ+JNd2YC7mF45WTExSPPyZG83QJ1nXoI9B34gqTaSV9J+72gSEapYeamP
         ZK5X5AdVf873Oj6j1+MDnFpxhlTx6ZTaziqks8etHBnJk7O/xsDZe51FMUCHgJB2xgnK
         qaarNE7LyvNsgFdwsAoovs8l5b8djjr4Vd0LfKKqnYrreAcE01xrh9mwBemCRIqy8JmM
         M8Eg==
X-Gm-Message-State: APjAAAXUNT2WFrL83/gbt0MaQ2eYU25rGGcqahfaVVC7y2VpPN3NVelw
        pvQJShpOLS8endQHvv4Di/M0xYw/
X-Google-Smtp-Source: APXvYqytljIvdSb9uKAA4Z5f9O3C9KOePxedpYlxO/c853cn0BV5XGhgglOiAUNSRF8Vr2L4UbB00A==
X-Received: by 2002:a2e:91cb:: with SMTP id u11mr6801694ljg.82.1576773243568;
        Thu, 19 Dec 2019 08:34:03 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id g85sm2824824lfd.66.2019.12.19.08.34.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2019 08:34:02 -0800 (PST)
Subject: Re: [PATCH v1 1/3] gpio: tegra: Use generic
 readl_relaxed/writel_relaxed accessors
To:     Ben Dooks <ben.dooks@codethink.co.uk>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        LKML <linux-kernel@vger.kernel.org>
References: <20191215183047.9414-1-digetx@gmail.com>
 <20191215183047.9414-2-digetx@gmail.com>
 <CAMpxmJUmLOZoKeeo4XMVEOWKRgwfS4O2szVboY-qTTYXg_aTVg@mail.gmail.com>
 <b38cd167-4a61-4903-cf44-910dcb66f751@codethink.co.uk>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e6a67fa4-977d-bac9-f7c0-51d5cea526e5@gmail.com>
Date:   Thu, 19 Dec 2019 19:34:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <b38cd167-4a61-4903-cf44-910dcb66f751@codethink.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

19.12.2019 18:57, Ben Dooks пишет:
> On 19/12/2019 11:01, Bartosz Golaszewski wrote:
>> niedz., 15 gru 2019 o 19:31 Dmitry Osipenko <digetx@gmail.com>
>> napisał(a):
>>>
>>> There is no point in using old-style raw accessors, the generic
>>> accessors
>>> do the same thing and also take into account CPU endianness. Tegra
>>> SoCs do
>>> not support big-endian mode in the upstream kernel, but let's switch
>>> away
>>> from the outdated things anyway, just to keep code up-to-date.
> 
> Good idea, I think I got most of the way to booting a tegra jetson board
> with a big endian image a few years ago, but never got time to finish
> the work.
> 

Thanks, I remember yours effort in regards to the upstreaming big endian
support for Jetson :) You were pretty close back then, but Thierry had a
different opinion in regards to maintaining that support in terms of
having extra testing burden.
