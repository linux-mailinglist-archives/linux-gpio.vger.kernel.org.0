Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF07B29D837
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Oct 2020 23:30:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387735AbgJ1Wae (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Oct 2020 18:30:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49942 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387724AbgJ1Wad (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 28 Oct 2020 18:30:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603924231;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uXyTJ5ZNulYxVxIF/NjorarYJlIPSBRNS0JKyxirVLY=;
        b=XM8Plx+MnqWLEM0xyu4lqYJ2mu2/0F9esCPJGUrn/OyN4OgkrSS3bw2rV0WEAebvFp0hTB
        Cpv2Yoqv+odKnw+ur9wR+9vnx8StZaM0Bobx41HaIb8iAQVHLH/SwLcz9kMSuBmApG43ho
        Z0hh+Fsi+4IMkmf4t1arBxM3KdSpstM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-Ue_sI55INB-jZH2VDn40aw-1; Wed, 28 Oct 2020 08:28:31 -0400
X-MC-Unique: Ue_sI55INB-jZH2VDn40aw-1
Received: by mail-ed1-f72.google.com with SMTP id n16so2024525edw.19
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 05:28:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uXyTJ5ZNulYxVxIF/NjorarYJlIPSBRNS0JKyxirVLY=;
        b=qMrLh0scgQS/SqqeI88OOEmjqQ1AwJA6a6NvTuJhQ+8TI32OLo7z6dUttvuDAftHm7
         oExCNVxWzWv+vy2sICh/WpALc98ZkfiC9y4S+8wXvvnO1WQzrTxPq0TCJwN+fnhEPJ1p
         Yb9SdehYS/141nbtRrBoz6BejVSRNVABlW7isPqgb6UM8hjL3wYkWadU79hMe4xNuXxE
         RCGol2uLN91WeeCjfmWxCyOxfjqDfTlwRov43iJIWXXwHTEjCQUYym8PfG8yrBNYetDf
         8ASKvLpF5eFT8lfe6th/V1tuEHPmyrvoh6A8Hs1NXqMrLrACWI5MI7ed0ke4zitUmLoK
         psdw==
X-Gm-Message-State: AOAM530tIzWznfy6avgcYUsIi+WoGr1UvzGSGJ5Vj4uMx1pBmw5RqiQR
        sF9UEJx1yzogoYcIxseAQGKN+bfHR9v5naTVgmm/UGa0OE4dnCsHkZMqW2Ff/Qdyp1o5WVwjk6B
        fYD+3fed1GrLjUk2aQVupaA==
X-Received: by 2002:a05:6402:104d:: with SMTP id e13mr7274689edu.322.1603888109831;
        Wed, 28 Oct 2020 05:28:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjtiCWnW8B4qcnf12gfhX66pZsYr63/PXN7fVO0WHcBkMA4/gsEPW/pMhtHkyVrC/843oQ8g==
X-Received: by 2002:a05:6402:104d:: with SMTP id e13mr7274679edu.322.1603888109643;
        Wed, 28 Oct 2020 05:28:29 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id f15sm2885885ejt.22.2020.10.28.05.28.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2020 05:28:29 -0700 (PDT)
Subject: Re: Request for pre-review of pending MID removal patch series
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Gross <mgross@linux.intel.com>, lee.jones@linaro.org
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Len Brown <lenb@kernel.org>
References: <CAHp75Ve8ncybbLB7hCb0Qxh=JjJr8e1tVrXXiJhwFt9=2b3AYg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <b5533f2d-ea77-59d8-159c-55b54be4bc10@redhat.com>
Date:   Wed, 28 Oct 2020 13:28:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAHp75Ve8ncybbLB7hCb0Qxh=JjJr8e1tVrXXiJhwFt9=2b3AYg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 10/23/20 7:07 PM, Andy Shevchenko wrote:
> Hi!
> 
> There is a pending patch series [1] to remove a lot of legacy code
> related to old Intel MID platforms. (Note, not all of them, since we
> have an ACPI based Intel Edison edition which continue working nicely
> after this)
> 
> Most of the code is shuffling arch/x86 and the series is quite
> dependent on the contents of that folder (for the sake of
> bisectability). Since that the only way it would be integrated is
> through the tip tree I would like to have your preliminary review on
> other contents — #3 and #4 are PDx86 and GPIO subsystems. In this case
> I won't resend this many times.

The drivers/platform/x86 changes (including moving some code there)
are all fine with me. You can add my:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

To those.

I'm fine with this being merged through another tree. But keep
in mind that Lee Jones will likely merge the Intel PMT series
through the MFD tree soon and that touches CONFIG_INTEL_FOO
bits of drivers/platform/x86/{Kconfig,Makefile} too, so there
might be a possible conflict there.

Regards,

Hans

