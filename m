Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8822546E9FA
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Dec 2021 15:30:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232195AbhLIOeS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Dec 2021 09:34:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232090AbhLIOeS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Dec 2021 09:34:18 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B880AC061746;
        Thu,  9 Dec 2021 06:30:44 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id b19so7464293ljr.12;
        Thu, 09 Dec 2021 06:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=QT54190t3qfCea6s60BSqaxNZWq4+3MML0gun0ydbX8=;
        b=fszIPBT7Ax6rweIlHnaAlHXg65ndInswLzHC5UMx5Ls+1QPP4Jzl0KLEbOi5JWVzNc
         zNZIHxwShlEsQU/fe9TDRO6buCuZRQBucqqZNxcETT8ZnWHZwXBHMC08+VsGpvbwuN7R
         V/NRNL6IATASuXmNJgBWLTrv7Qe8ezv3Cg4nQhryo1aqwAq6mWT+NaeznW+BasGQkBJL
         81rv5NzudmlGV32Byx8epU55iVs6Qwar3zninFvcbsn+Dnm8sqkH13pVN4RAc5bzXa1N
         1x2WCgEvWPjn/lHA0xmZlSmrZo4zpO5qCzfAC5TDuWMB+/RzGBesYzaOyIl8ytSYWy11
         lDvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=QT54190t3qfCea6s60BSqaxNZWq4+3MML0gun0ydbX8=;
        b=Ipe4n3tqnB4ErXz4RjdG+QlNRRdLYVGMyD7PWp6KnEaVxh/nVw76Gt+mdnODJpkL0E
         h0tjg5LFxQyUgG2BF2qq3tW/qesxXoLjAKwOKrsCZRgzACR5uZpP6xTI7ByCTFFw0+cu
         SBartj2Pt/td1iJH5hWgzStbC2N4xyLWbnTcsAZZu1dkQsTZza37siNjFpxCht0ruapz
         dpCnYEWKAieqwUsK1wFloAy/htD34j0Jr1gHChhP010+nPTspGPdA2zAKv4ARwR7hiW+
         bdqxlVPy6A04D0an5fe5LVKjdxMo2k7dpUVdwUBjo4VMbCRhiJ/5vh5EbPPo7xpW4wsA
         o1bA==
X-Gm-Message-State: AOAM530ACSmdnvihrhFfu2AWEG8OaX434V3wSSC+03Q7S+X8YRnI4qrw
        3QfbYT2tpGYMgY6uTnDEDtM=
X-Google-Smtp-Source: ABdhPJyWyu5NBs9Pz6LPdYFj/Uk1CCGPaeP5MWzuqoc+GPM04FieHmlpojMmrajjXCh38oadHfQezA==
X-Received: by 2002:a2e:7807:: with SMTP id t7mr6388090ljc.426.1639060242981;
        Thu, 09 Dec 2021 06:30:42 -0800 (PST)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id k13sm2083lfg.306.2021.12.09.06.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Dec 2021 06:30:42 -0800 (PST)
Message-ID: <ef03eefa-a400-c832-5efd-c6148b053182@gmail.com>
Date:   Thu, 9 Dec 2021 15:30:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH V2 0/6] pinctrl: support platform (e.g. DT) stored pins,
 groups & functions
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>
References: <20211124230439.17531-1-zajec5@gmail.com>
 <CAHp75VeyJ5HtH-T9mOexz07WCa=nngqzrcYZie+t+fdYz2Hngg@mail.gmail.com>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <CAHp75VeyJ5HtH-T9mOexz07WCa=nngqzrcYZie+t+fdYz2Hngg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 25.11.2021 10:58, Andy Shevchenko wrote:
> Besides that, consider test cases to be added (OF has its unittest
> built-in into the kernel).

I'm confused here. We indeed have drivers/of/unittest.c but that seems
to cover in-kernel DT API. All kind of of_*() helper functions.

What I add is a simple binding support. I don't extend kernel API. What
possibly should I add to unit tests?
