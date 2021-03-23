Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95D6834580F
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Mar 2021 07:58:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbhCWG5k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Mar 2021 02:57:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229670AbhCWG5G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Mar 2021 02:57:06 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D44FC061574
        for <linux-gpio@vger.kernel.org>; Mon, 22 Mar 2021 23:57:06 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id t5-20020a1c77050000b029010e62cea9deso10203984wmi.0
        for <linux-gpio@vger.kernel.org>; Mon, 22 Mar 2021 23:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=5ZMjc9VXo9ubTn31PzCPvTM8mI49yM+c9RTAVxtpnpw=;
        b=AfPaVGk8GV8XMUonuzx6QfTnVqBvCdBO9LvGBuguQraZRnkc6XnJ0Q95dIR7cFTVBc
         N8Ig+WftiCnBV4pq2NbzARBIJWtRwG5DG5z8AS0Kl3yHlXNtEzrvStjTyRIoWfUBLbm+
         7UjbjsMM4YztwLL63EjzVDLZ2Ltx+XF7bO6h5tfRXi+LFNZZsLcXrsPexN+By4bYJo88
         whuPM2lHejNnbg/vyl5+kUxYUtlAW9/ZQu9jBis0pNRcyuG4OVwXYh10qXNxE7n0OB5v
         ZG2VmVXVpVaiyKeoYbyGLYUmSs6Dl0t1E5G+nMy1b2KR4vtxQpc1KXWnug9bMzFYL4X7
         uX1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=5ZMjc9VXo9ubTn31PzCPvTM8mI49yM+c9RTAVxtpnpw=;
        b=LFPuKAMX9soVKWLPDQJGW2lVz0/10+gMkXIDlQOXhbUBTrf50u9KEf+FE1oye9lDMb
         xDPU2pLT7ffDR9cSrlcrIYvgPSQnA1YECbVispGSY0ZKMNKuMBhJHjovi0GBVxkAf3f7
         gWy388vgw/Dmcc/zkvuemKAB4/kqZjxGtZaeqTFyYkYtJv/xOZBvTVgi2bCxJCvpep2s
         j2ZjyjT2NRP4yPx/9RM9607Ebkgdb95WaWDylxnPlS5wdrinnczjaQ4Ry5vCAU8OPL/D
         Ifx4GXwBEUvIuBkC+TPNpSHgtucfwAiyLTDsm1nTVNTm9/F85xTQ4rRWXhzI2606fo41
         wZiA==
X-Gm-Message-State: AOAM530uDzrBuHnRPomGWwZ3K5Y/ASZ6T9DRl6kJMxoghn5gOunloTCi
        aXo1dBWMLIybBog/p3eg8dJ1QYTdp22b9g==
X-Google-Smtp-Source: ABdhPJz3+iV4FIBX4EKi4hgYNJtSbL0JsqeV154oIhUtr38a2kux3bYq5RyP/AdQx3H88cipHuuNpQ==
X-Received: by 2002:a05:600c:21d2:: with SMTP id x18mr1785482wmj.175.1616482624927;
        Mon, 22 Mar 2021 23:57:04 -0700 (PDT)
Received: from [192.168.1.21] ([195.245.23.48])
        by smtp.gmail.com with ESMTPSA id n6sm25776205wrw.63.2021.03.22.23.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 23:57:04 -0700 (PDT)
Message-ID: <854f1b96be2e2bf3daa9b8f2d8d00560f11fdfd3.camel@gmail.com>
Subject: Re: RFC Need advice on reworking gpio-ep93xx.c to DT support
From:   Alexander Sverdlin <alexander.sverdlin@gmail.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     "nikita.shubin@maquefel.me" <nikita.shubin@maquefel.me>,
        Hartley Sweeten <hartleys@visionengravers.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd.bergmann@linaro.org>
Date:   Tue, 23 Mar 2021 07:57:03 +0100
In-Reply-To: <CAK8P3a0nvComAVhUSK9NgnakLjqqVvnFJRx6oVciuG4deK7VDQ@mail.gmail.com>
References: <1042421616413081@mail.yandex.ru>
         <BYAPR01MB5621E8956FDBF8F194ABB598D0659@BYAPR01MB5621.prod.exchangelabs.com>
         <01b4dedd0f7efba749ebf598925886a6a69d5b41.camel@gmail.com>
         <BYAPR01MB5621066B411F68EF840B8417D0659@BYAPR01MB5621.prod.exchangelabs.com>
         <36281616430257@mail.yandex.ru>
         <d7685a8561d9be5ce6269bbf5d600f8f3f5f743b.camel@gmail.com>
         <CAK8P3a0nvComAVhUSK9NgnakLjqqVvnFJRx6oVciuG4deK7VDQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Arnd!

On Mon, 2021-03-22 at 23:31 +0100, Arnd Bergmann wrote:
> Unfortunately, building a multiplatform kernel makes the kernel image
> somewhat larger because it includes the code for CONFIG_OF, though
> it does not have the runtime overhead for the DT data structures that you
> get when running a DT-enabled kernel. Enabling CONFIG_USE_OF
> increased the ep93xx_defconfig build for me by 128KB, replacing
> the private clk driver with CONFIG_COMMON_CLOCK (and no driver)
> on top added another 50KB, and finally enabling multiplatform added
> another 2KB. In total, that is 2.7% total bloat in just the kernel image

This doesn't sound so bad as I expected. I still had no chance to figure out
much bigger increase from 5.4 to 5.12 ;)

>    text    data     bss     dec     hex filename
> 5677321 1119704   90556 6887581 69189d build/tmp/vmlinux
> 5782854 1143720   92188 7018762 6b190a build/tmp/vmlinux-use_of
> 5830020 1153408   89396 7072824 6bec38 build/tmp/vmlinux-of+clk
> 5829320 1153920   91308 7074548 6bf2f4 build/tmp/vmlinux-multi
> 
> I also think at some point in the distant future we will require DT boot for
> everything, but that probably comes after most ARMv4T and earlier machines
> have fallen out of use. I'd like to get a feeling for how EP93xx fits in there,
> can you say what memory configurations are widely deployed and how

The systems I know have 32MB RAM and 16MB Flash (but only 2MB was reserved for
compressed kernel back then).

> long you expect them to receive kernel upgrades in the future? Are these
> systems that will definitely get put out of use at a particular time (e.g.
> mobile phone infrastructure for older networks or fixed-time support
> contracts), or are these systems that you expect to keep patching until
> the hardware dies?

Yes, I expect them to work (and be patched) until they die and this
may take another decade ;)

-- 
Alexander Sverdlin.


