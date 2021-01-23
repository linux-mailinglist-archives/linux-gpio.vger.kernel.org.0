Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A8BE301901
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Jan 2021 00:58:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725943AbhAWX46 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 23 Jan 2021 18:56:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725922AbhAWX45 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 23 Jan 2021 18:56:57 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAC39C0613D6;
        Sat, 23 Jan 2021 15:56:16 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id h7so12747733lfc.6;
        Sat, 23 Jan 2021 15:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=T9IQA43+iHU7clo6ySQk47UiflrToIRPUItvcZy5xwQ=;
        b=nbnEqrQRTfaMjj5a2wOeEPazP7sDVMGZCgcLFhyAuufpTqepvGrF0Fq3GbtAXHqgyL
         AFMEEBIfJ4wqMooL9WB2UhT5BL6fHTpiJ0UGcjjY8eSTE32G5qogKNLc6yPnlNvIXPpm
         YMCSsEPjmJpDQCaliT0t1M1IMdDUhuIN+ro+ESJq+N7bYY3Xlca1zHLTzrdjXzA5g7RG
         uV5RYOa1/Xpz8Ssvz3/V0/D7vvOkK0za21CmifZzVaJtmDMUO3qa203pNtoNOllPQEtR
         qRZG39S4RaTJeCk5vAvlgRaikqHQStPk8bPCzWy+DWQEnErrJxjvEX9+C4h1OkG54TYF
         ERQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=T9IQA43+iHU7clo6ySQk47UiflrToIRPUItvcZy5xwQ=;
        b=n5kLVDHWEc2RbaFCKKZMbwjf+kt1LFJ8cvgNDtDhFKouxIQA6VY9DZhO+D+DsL0gQA
         VORtYRAgMo+c1cxXeOFbJENw8CRVhyngQ44nehcjRx1sV3e+Dcav2pL0lsyMIDv0eCub
         r1B84wAUBWeJwNCvoPB/6Sjdu7T+rhViPA/J15C3uUKimvG+3WI70biD/hQQmu4biS5H
         ngG/R4RNj9TfB9LIwKEd31Zkn8s9Ohf7w189W2P0h3qVll4d1UXyMuNQEIiM+91G+Zd8
         iQkN1CgI/iHj1w5LA0tiRIZooW1XzGc9p4aDHanvbv+7rlGulPOhCF/aOl6UeqXyZ8l5
         3z8A==
X-Gm-Message-State: AOAM530vF0Q5IKLMcBZ8gY+s+KtqQ5S2b2+WuLzOE7qj+tPrjyMG9fAZ
        hB7fFQTHmwW/D5MUdDsgFrUM/rnMMLA=
X-Google-Smtp-Source: ABdhPJz41cCn8Y/V/v3MtOfBG/dT0MaGDym/74GGUaVDEnBChug3GcVuAPvzrBpgoqgQccgTn1eDBg==
X-Received: by 2002:ac2:51c9:: with SMTP id u9mr340219lfm.276.1611446174611;
        Sat, 23 Jan 2021 15:56:14 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id o5sm1484944lji.133.2021.01.23.15.56.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Jan 2021 15:56:13 -0800 (PST)
Subject: Re: [PATCH v1 0/3] Support building gpio-tegra driver as loadable
 module
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20210122185543.16554-1-digetx@gmail.com>
 <CACRpkdZTyBuz240iYuvi91k3dLKKXX=4DNxFEBP7mSNB58XtDw@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <24d46928-8c57-acba-f9cf-49afbe4c983c@gmail.com>
Date:   Sun, 24 Jan 2021 02:56:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <CACRpkdZTyBuz240iYuvi91k3dLKKXX=4DNxFEBP7mSNB58XtDw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

24.01.2021 01:50, Linus Walleij пишет:
> On Fri, Jan 22, 2021 at 7:59 PM Dmitry Osipenko <digetx@gmail.com> wrote:
> 
>> This small series adds modularization support to the gpio-tegra driver,
>> i.e. driver now could be built as a loadable kernel module.
>>
>> Dmitry Osipenko (3):
>>   gpio: tegra: Use debugfs_create_devm_seqfile()
>>   gpio: tegra: Clean up whitespaces in tegra_gpio_driver
>>   gpio: tegra: Support building driver as a loadable module
> 
> As these three patches clearly make the kernel look better after
> than before:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> However when we are doing this I would strongly encourage you
> to also make a patch implementing remove() so you can insmod
> rmmod the module at runtime.

The remove() is optional for drivers, it doesn't prevent the rmmod.
