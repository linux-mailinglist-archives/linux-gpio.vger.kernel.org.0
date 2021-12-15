Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DDEC475E58
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Dec 2021 18:16:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245202AbhLORPX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Dec 2021 12:15:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245165AbhLORPX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Dec 2021 12:15:23 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AE65C061574;
        Wed, 15 Dec 2021 09:15:22 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id r138so20630852pgr.13;
        Wed, 15 Dec 2021 09:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=DWpR7VzSMkOj52xwZxGBVFjzZXxmht/byeg9x6iZJWg=;
        b=Y5kHU601D76nf7medqA5Htl4SAVqLNULf0Oxrxxdo+Sd8q0SYNVnyR/UxHiRK8BnCq
         jGX2imsrMNAX4jSDj8C18WStVdDxe9NJPRMJDpOArbb7+GB13oO8NPS/IDq3n/7DDWsV
         l9S7/dYxTocMlGVdOZCC7ue09KBO72UqdBgi8rC2j1Ct7Z9KuyFLU62dBKmzPjWHpDVD
         TqL+fXjK7ylo2ncHBUSA7+tw2vMZsMWe5HXqnmFjHBxE+pSma3J/I11ckbtXFXpvPfWn
         z5ieHgdUQctilPDCrkX+ccxKXY/+Q4GWW+1R8vb/qWcmKv0onma6IzFFumahvk9Qggkz
         oPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DWpR7VzSMkOj52xwZxGBVFjzZXxmht/byeg9x6iZJWg=;
        b=cUesrLjq70FEnAPS55aWulf92Nu3wdTaL7QAtTUZNdtEbNJ1y4MRhF2p1jdwG+kCZ5
         WQqZecgyX0jD+63rfAoyXXaq9B563ENg0WdiMNqq3mzdK5hpN2SZL+ZPBOrMEly7+84c
         1qiwd8leieFm3TvpJEsIYQ4oMnrlgc0SW/6gTfjUfDVZI3DcfTBpBo6FOoDJgRJlucOM
         Nq/FvJZBFfKzkIlyLoNohj8oGl+FpFdvjNKA7TBNfrAe+HAMcYVmJoWU+xe2Vv2dFNYM
         BmmQlNeeOnZCs0dNrehcklSy220AIHY7BXm8efSbuH79Bvw4nXa6Ro+LqikVybikUTGG
         SPbQ==
X-Gm-Message-State: AOAM533KFN2WQ1Jeq1NzNL4zqBPzoKW8bL23BEaHbSfG294/HvAlpezz
        ELdSRAIkmMRa1KghkxnnHFwnSB/Wc5k=
X-Google-Smtp-Source: ABdhPJyWjK+A5OUrjO3MHADziA4tkZj4VYxm0xOJ/UFQoizQ54G5GSHpBMPzHtwtFORPyGR+fqPtdQ==
X-Received: by 2002:a63:e34c:: with SMTP id o12mr8676987pgj.509.1639588521546;
        Wed, 15 Dec 2021 09:15:21 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id n6sm3168837pfa.28.2021.12.15.09.15.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Dec 2021 09:15:21 -0800 (PST)
Subject: Re: [PATCH v2 2/2] ARM: dts: gpio-ranges property is now required
To:     Phil Elwell <phil@raspberrypi.com>,
        Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org
References: <20211206092237.4105895-1-phil@raspberrypi.com>
 <20211206092237.4105895-3-phil@raspberrypi.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <92f68c88-45b0-b060-f974-65f81d4a04d1@gmail.com>
Date:   Wed, 15 Dec 2021 09:15:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211206092237.4105895-3-phil@raspberrypi.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 12/6/21 1:22 AM, Phil Elwell wrote:
> Since [1], added in 5.7, the absence of a gpio-ranges property has
> prevented GPIOs from being restored to inputs when released.
> Add those properties for BCM283x and BCM2711 devices.
> 
> [1] commit 2ab73c6d8323 ("gpio: Support GPIO controllers without
>     pin-ranges")
> 
> Fixes: 2ab73c6d8323 ("gpio: Support GPIO controllers without pin-ranges")
> Signed-off-by: Phil Elwell <phil@raspberrypi.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
