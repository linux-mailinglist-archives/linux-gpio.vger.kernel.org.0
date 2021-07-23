Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86BB93D3CFB
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jul 2021 17:55:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235764AbhGWPO5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jul 2021 11:14:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235657AbhGWPO5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jul 2021 11:14:57 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 598E4C061575
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jul 2021 08:55:30 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id d18so2836084lfb.6
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jul 2021 08:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=F254boyMsvGuYYqp3lw2/2iywjmwuHms3YgcIoosbWQ=;
        b=sQP3qs9VukGUqxkt/CdirL7Xex5Vu4HEYsVMNR8bf5LALNA6MH0r9UpnOg9fZj1dJ4
         WIUOdqQorheu3AByNYFSWGFMbB9Ujs/vRYOyUQQlpG21b8/iDSv1Lc/ImNXpffqNPTmK
         sGd1uv5LO/5GR5OeOHdiykYnxIOFazs1aBLqT7r8/4kBz/hKnt+8pxyJ06xqMT2vZXU6
         jyo6normElOum2zj6C8rP+QCzv8Ii7uChdZ5UmZK8SP8mUNwJX8gEUfDM9U2m2sUUKen
         mKjNtRqEI/N8JtXvlJcESHmPlLPDOg8KOv2HfA86cqQ/LqpyLUFHXBJvphyU7VXgaQpk
         N9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=F254boyMsvGuYYqp3lw2/2iywjmwuHms3YgcIoosbWQ=;
        b=nojZxIRH17nOWLrhW9CL4HtGWG575gfgpacVMVZS4nAxzErv5Fk1Ycw38TJVYy/Tl9
         Up4OId/f4beMe/JdW37CGRSwclMziIzSN2ZuOHccHeMUYg7T9/YVKv7y8DLAGGkVWdqH
         XCOmDdaut8KASz1wSsJjhToEJ979WBO1NZgm7KsuaIzA9xJFgsrRD6pjqi6LyBGJLvEV
         huAYcpGyZ4/FySefF3u82NLYu/aaxIs03hdPKG+yo6b3DY9Knfyhq7lw3ezASKX6pDgi
         nP0TQPCKRUc6aRqmUoOBT0/Fhaa+4VyhR4JGf3VEYEk3jVfWcipRb3dV1FFSZtHDPta9
         3xVw==
X-Gm-Message-State: AOAM5323Dh7OA98r/p8ObKlWatGHBJxpxVz5Wos0r8KkqZdIcQ5IJe/p
        MjauqGaTKtrMc8yJJ25xl0OF46p7cJnCNh8E8d9H1A==
X-Google-Smtp-Source: ABdhPJwzqVQlVZDEl6oo11hFeps5dggV/mHbLMWzFSnJ1UBwjt0JBU5npVOsuUjo6PzpE76UE2wq6APkm76hRqUfubQ=
X-Received: by 2002:a05:6512:3f1f:: with SMTP id y31mr3576333lfa.29.1627055728058;
 Fri, 23 Jul 2021 08:55:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210719112938.27594-1-kabel@kernel.org>
In-Reply-To: <20210719112938.27594-1-kabel@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Jul 2021 17:55:17 +0200
Message-ID: <CACRpkdbkWxw8wEOt2nsiYKLw+=TjFrJX=WYALupCtWWc9xGw7A@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: armada-37xx: Correct PWM pins definitions
To:     =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Patrick Williams <alpawi@amazon.com>,
        =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 19, 2021 at 1:29 PM Marek Beh=C3=BAn <kabel@kernel.org> wrote:

> The PWM pins on North Bridge on Armada 37xx can be configured into PWM
> or GPIO functions. When in PWM function, each pin can also be configured
> to drive low on 0 and tri-state on 1 (LED mode).
>
> The current definitions handle this by declaring two pin groups for each
> pin:
> - group "pwmN" with functions "pwm" and "gpio"
> - group "ledN_od" ("od" for open drain) with functions "led" and "gpio"
>
> This is semantically incorrect. The correct definition for each pin
> should be one group with three functions: "pwm", "led" and "gpio".
>
> Change the "pwmN" groups to support "led" function.
>
> Remove "ledN_od" groups. This cannot break backwards compatibility with
> older device trees: no device tree uses it since there is no PWM driver
> for this SOC yet. Also "ledN_od" groups are not even documented.
>
> Fixes: b835d6953009 ("pinctrl: armada-37xx: swap polarity on LED group")
> Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> Since v1 I've added Fixes tag and Rob's Acked-by.

Patch applied, sorry for taking such time with this.

Yours,
Linus Walleij
