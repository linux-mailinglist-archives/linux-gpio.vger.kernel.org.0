Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4F50345993
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Mar 2021 09:22:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbhCWIVs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Mar 2021 04:21:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbhCWIVl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Mar 2021 04:21:41 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30EF6C061574
        for <linux-gpio@vger.kernel.org>; Tue, 23 Mar 2021 01:21:40 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id z8so24408396ljm.12
        for <linux-gpio@vger.kernel.org>; Tue, 23 Mar 2021 01:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vfh7RHJH7TqUQQUYO/+Qiig2kV4WDmfzqVLlNYtSPj0=;
        b=r1/tGZeuZRAhYCBUY8bP93UPCjTjrilpbwIbMfNEVkRyglXR8wXCcSU3W+gBEWXJPZ
         PrwrJ5QHqx58Tdw/mBeYZxVVrmDe0uCj23UCqbfKxsb1c53Ob6M0aCinrJ6yU/sWQeX+
         NLM7ufXOzeon6nX0cJO87ri5kx7vimtpk6j7vb1jDWi1v48Dgj/ytkO7oR98PRgX8sz0
         7S0xEs/euWa2DdbhkVJDyOMbO9xtmaXTO/rVgq8x0tNBVLLWfPcNkxoTBu5JvfuyyKFP
         aZxn9mGkFC9lnPtsD2WYLETy1aADjhg2Vjccu5hzkM2ZzMjQ1YuAMdIfL3puSsUyc723
         ZNMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vfh7RHJH7TqUQQUYO/+Qiig2kV4WDmfzqVLlNYtSPj0=;
        b=KFdxYhxoa7jN/npXo60Dj5tnwdB71ZuI6EzfD9QuqnuBFlY3BjGmkEWWH/mu2FpeWQ
         14e45VN8jCtZ7btaym5s4h19Xbq7v4H75QbHjFYEqN/47sfcdG6hDldzupzFgRZG86BL
         +vXq2rr6HF/y7xpQ9hm7gZGVf17ihgMydZDuJvl1A6rFeaNx2yK2mOMSC/C2ZO3YAlvh
         5DA4hj/JDeQwE/fdSlYkvyx8KNfnORWUOcO/RrJug3coeUAFC3jMiJG2nX1RmtvL1Tnw
         qZcL2q+ZEJ8g2is0yjpYJ0fCBZl5KQnhmio3Is+USqIoNTHhRHBi1tSgW11DUtuabdUD
         LOEQ==
X-Gm-Message-State: AOAM531SEfJY1jELAU/k1f5DiOQ4ulQJ52TMlJ8T7DlGV6qxMX9HpMDN
        X5i1Obj2FMNgO5zJ+L3y7JH4BjKyww+xcCLjAZMxSvLM978/BFBs
X-Google-Smtp-Source: ABdhPJy469K0mMd+ZKths8N70V0S3UbCW1hRjGfXztIU7JTpwAdBzvMs22Mj32cRPM8L9wjyDEGAVMIxMXWLQCwzWLM=
X-Received: by 2002:a2e:1649:: with SMTP id 9mr2517823ljw.74.1616487699274;
 Tue, 23 Mar 2021 01:21:39 -0700 (PDT)
MIME-Version: 1.0
References: <1042421616413081@mail.yandex.ru> <BYAPR01MB5621E8956FDBF8F194ABB598D0659@BYAPR01MB5621.prod.exchangelabs.com>
 <01b4dedd0f7efba749ebf598925886a6a69d5b41.camel@gmail.com>
In-Reply-To: <01b4dedd0f7efba749ebf598925886a6a69d5b41.camel@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 23 Mar 2021 09:21:28 +0100
Message-ID: <CACRpkdZG_9iHieCkFqPMx3y3ZKdBVy_FKtHtn_OuFipRmvp-NA@mail.gmail.com>
Subject: Re: RFC Need advice on reworking gpio-ep93xx.c to DT support
To:     Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc:     Hartley Sweeten <HartleyS@visionengravers.com>,
        "nikita.shubin@maquefel.me" <nikita.shubin@maquefel.me>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 22, 2021 at 4:59 PM Alexander Sverdlin
<alexander.sverdlin@gmail.com> wrote:

> I'm sceptical about this DT convertion.
> Not only will it make the kernel bigger (back then is was a concern),
> but they also do not guarantee any order of GPIOs with DT:
>
> https://patchwork.kernel.org/comment/24009887/

I guess what you're actually saying is that you are using the GPIO
sysfs for interacting with GPIOs.

I am a bit troubled if boardfiles and old GPIO global numbers are
in the same legacy bundle but seems like so, because the device
tree ambition is to make resources abstract, not enumerated.

For good or for bad, it's not like I don't see the problem of supporting
legacy code.

I think a good approach is to create a DT-specific boardfile so that
systems can be booted from DT on EP93xx and then migrate those
boards that can. Then we see about the rest. It should also mean that
if you don't activate DT support the impact should be minimal.

Yours,
Linus Walleij
