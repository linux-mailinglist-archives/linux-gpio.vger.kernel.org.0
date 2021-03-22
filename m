Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A57BF3440DE
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Mar 2021 13:26:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbhCVM0c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Mar 2021 08:26:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbhCVMZv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Mar 2021 08:25:51 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C57B8C061574
        for <linux-gpio@vger.kernel.org>; Mon, 22 Mar 2021 05:25:50 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id u4so20769225ljo.6
        for <linux-gpio@vger.kernel.org>; Mon, 22 Mar 2021 05:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fuo280atv3rGFAaPpppT2Wxn8+EtdvpQB31ZsKqGltY=;
        b=sXX2S914CM7roxiZphqcuiN1/f2TsW4WZBMDqhGuX9WDQEDRDYAmpFXHU8PYuL/6qo
         u6s1Ab+L6XTTh3Xsdk7Bb3g9Jn5asUv8FK2n/cMkunEkSAtjRkYLlLi2z89p4Ki8maiO
         QB3LIOANGWtWgXP09QSlTSXcxXHWqEQlPwFsIAYSqNrdDdb2inVMrjh9pQykL0NN+FiJ
         cR/Qhc+hqV3WsKqzUeo8in5tQKgpOry4lZ9whdWHd7cd5mwMvwqQJIWeezIlJzx3M6UA
         DstVxYLk6CvqQ9Dg4YWgbgTy7k1qJyvi5O+U6rmekfxLrAo1rJU3Sk0Cwdc3RTv9ymEe
         LOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fuo280atv3rGFAaPpppT2Wxn8+EtdvpQB31ZsKqGltY=;
        b=sH55hcRL1yBXSjH3vqevP8GmagbY+nm8aXReATYJ7/osih6j7K1ODsyzAeFS7Kkkqy
         eihqgXbs5wwzhJFMnIFGasbx5Sh1kQxdiirHI6pEplrGU1Pfe5WwNZjprjOZghBxj8w6
         vTrpBbV6YMUEo/D6BdTo+qsJbMO8DO09gZkiEr4TF6exMfiBwgK4WZQQ6eb3Z7xodBUP
         9mSAChZ04UCJJeIK16nfU2Qg8V24YLwjy3MAxKOabaFtkZkLEcb9qWFgYYsbuvfZSRHD
         IKbYOwY01d3JtU5b5NBVPiOKgHdVb0Ujb7Db+5u9L1kWIpwsQ/LdZ2ez1TRx6rLjbpNc
         cLsg==
X-Gm-Message-State: AOAM531qldWE/yY8VNjW1W15yDqIIGNT6pEtsG9HWE+RaiyFv17PrmOH
        aXbY6GqX4YYQVviTH+nH9th8ebn3lpPYVQ3IuVPxOapVoKGe3q8+
X-Google-Smtp-Source: ABdhPJzRQZKRjwj2HhO1dkBUyHQ1xfTus66GJVxGV6QlKNseh4c7tZZy/wrFv+Tksfh9lCo5fHbh1PRWsApS8p/8FOw=
X-Received: by 2002:a2e:700a:: with SMTP id l10mr9518822ljc.368.1616415949178;
 Mon, 22 Mar 2021 05:25:49 -0700 (PDT)
MIME-Version: 1.0
References: <1042421616413081@mail.yandex.ru>
In-Reply-To: <1042421616413081@mail.yandex.ru>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 22 Mar 2021 13:25:38 +0100
Message-ID: <CACRpkdaUi6VM7LNE=NkFw4uDynfZjPA9gxXG6u1RPx31ntVFBA@mail.gmail.com>
Subject: Re: RFC Need advice on reworking gpio-ep93xx.c to DT support
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 22, 2021 at 1:19 PM <nikita.shubin@maquefel.me> wrote:

> So the work will be split into 2 stages:
> - breaking gpio platform data into pieces, adapting gpio-ep93xx.c
> - adding DT support for gpio-ep93xx.c
>
> Please advise me on this issue.

If that is your preferred way of working then use that, seems OK to me.

What I have done traditionally has been lazier: I just write the specification
for the device tree bindings as the hardware shall be described (noadays
using the YAML syntax) then adapt the driver to probing from that.

Then when all non-DT users are gone I just delete the old code.

During transitions from boardfile to DT we have often taken this
approach:

1. Add a specific DT boardfile
2. Make this boot
3. Add DT support to all drivers
4. Delete the old boardfiles
5. Delete the old platform data handling from the drivers

As you see, this makes the kernel bigger, then shrinks it.
This is what we have usually done: not refactor stuff into the
form it needs for DT support, instead implement DT on the
side and then eventually delete the old non-DT code.

Smoother transitions can work as well, I just never attempted
that, believeing that it is much more work.

Yours,
Linus Walleij
