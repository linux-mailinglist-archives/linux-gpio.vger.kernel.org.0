Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 245A1344C90
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Mar 2021 18:01:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231607AbhCVRAu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Mar 2021 13:00:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231518AbhCVRAk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Mar 2021 13:00:40 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 248A1C061574
        for <linux-gpio@vger.kernel.org>; Mon, 22 Mar 2021 10:00:39 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id n11-20020a05600c4f8bb029010e5cf86347so11293153wmq.1
        for <linux-gpio@vger.kernel.org>; Mon, 22 Mar 2021 10:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=j/C4kDY+HSO2VoPNq16ShHCLSkoPAd8hpuoUjrQa35o=;
        b=PPmFisTbOoMnoEfi6Xm9jSBFhdmUXJSr1qyVlYRugk+BEJqw6NMbwFpUI8q9tcKCjD
         GHOnRVExfmJVZtJnsygFJom9v/cD3d7rzO6lXOPB5mLTfs5yJZp5PVOCym2s3gch+1s1
         M76t8+7LInOkJApu6UkiA4Hl5mBaZzjAy5cLbe6exe66zEowEQHhGV6qh339DlXrk+cf
         HzBoa0Q8GzVxHkuCgCHDBcNHtWHI0y95q/+/chP+3XeKJS/tg858N647SyE5d0clsiN/
         0Y7mLdDsslNe0iVKkZVqIC3M9p4H+FuzTB3Faiey0VKlnXUbAlxYezCsdLZJrMhHdRgx
         +BeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=j/C4kDY+HSO2VoPNq16ShHCLSkoPAd8hpuoUjrQa35o=;
        b=JxkrU+uGiZewtsYZaf8+5+bqzBx9dRObY+M312NXFDDV1Fqy6QmeWGzixdJeYOA5f8
         lyu4bFPKY7rBTMwb2Tsb1j9fkFHIzV+Y23++dNo2jTjVBaQ6FjSKibVdsqjG/ocbWGgO
         6MJHG7viDebQGlk5ZmcHms7SAyjMBFpf6xifpKiX8ObyDFB+oz+13yK/nIHPzjERoIYm
         /GTzh9Wvexk5uftyxtm2jCZGZ/peB4fdlrC3RKARlH0oxHkKEKpMq5GvjO3jaCNBWRl5
         UijOT6AUkppHUcLI1v3rWfWi5n3VnVFzTcL/D+ekgQHX2dRlw48ITLuQ/FWU47pREL8e
         DolA==
X-Gm-Message-State: AOAM533Ui4Q1ndnZD7xaY+LJwNEjZH2dWWqrb7eeILi6FzfwkUhAdGoo
        0WJSfFlBAqeWeEjV6G8/HnM=
X-Google-Smtp-Source: ABdhPJxsE6G+a+zyprNIuEiTHvr6QJCSqGTPSf3c1wlffkBbKmqttO+/gCh7a93SHtysFSgPSWiIJQ==
X-Received: by 2002:a05:600c:3514:: with SMTP id h20mr18103wmq.45.1616432434619;
        Mon, 22 Mar 2021 10:00:34 -0700 (PDT)
Received: from [192.168.1.21] ([195.245.23.48])
        by smtp.gmail.com with ESMTPSA id g11sm19887393wrw.89.2021.03.22.10.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 10:00:33 -0700 (PDT)
Message-ID: <d7685a8561d9be5ce6269bbf5d600f8f3f5f743b.camel@gmail.com>
Subject: Re: RFC Need advice on reworking gpio-ep93xx.c to DT support
From:   Alexander Sverdlin <alexander.sverdlin@gmail.com>
To:     "nikita.shubin@maquefel.me" <nikita.shubin@maquefel.me>,
        Hartley Sweeten <hartleys@visionengravers.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd.bergmann@linaro.org>
Date:   Mon, 22 Mar 2021 18:00:32 +0100
In-Reply-To: <36281616430257@mail.yandex.ru>
References: <1042421616413081@mail.yandex.ru>
         <BYAPR01MB5621E8956FDBF8F194ABB598D0659@BYAPR01MB5621.prod.exchangelabs.com>
         <01b4dedd0f7efba749ebf598925886a6a69d5b41.camel@gmail.com>
         <BYAPR01MB5621066B411F68EF840B8417D0659@BYAPR01MB5621.prod.exchangelabs.com>
         <36281616430257@mail.yandex.ru>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Nikita, Arnd!

On Mon, 2021-03-22 at 19:48 +0300, nikita.shubin@maquefel.me wrote:
> > > >  Note that the GPIO banks are registered a bit goofy, Ports C and F are
> > > >  not in order. They have been that way since the original Cirrus "crater"
> > > >  code base. If I remember correctly this was somewhere back in the 2.6.x
> > > >  kernel. Please make sure the GPIO numbers stay the same so that any
> > > >  userspace code does not break.
> > 
> > >  I'm sceptical about this DT convertion.
> > 
> > I'm in the same boat. One of the reasons I have not tried to convert it...
> 
> I find this a bit confusing, so you think ep93xx shouldn't be touched at all ?
> 
> AFAIK the question is reworking to DT or it will be dropped eventually:
> 
> https://lore.kernel.org/lkml/CAK8P3a2VW8T+yYUG1pn1yR-5eU4jJXe1+M_ot6DAvfr2KyXCzQ@mail.gmail.com/

I somehow missed the Jan Email even though I should be in the "maintainers"
for EP93xx. I still know about thousands of devices running 24/7 with mainline Linux.

Is it really about "DT conversion or die"?
These systems really have very tight RAM and Flash budgets...

-- 
Alexander Sverdlin.


