Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C095E3E93AF
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 16:29:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232340AbhHKOaD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 10:30:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232226AbhHKOaC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Aug 2021 10:30:02 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB304C0613D3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 07:29:38 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id x7so4909341ljn.10
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 07:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=byRWu4PhUCdZFFH1ZumTdX1T6Ymne+7G/GMqF1AsKeo=;
        b=TQ0+K8Q208fCgyW6b+ydqb4ei0swe653pxt/8T4zbPvt81Ga4ieUhFvLjVoMmO3PeG
         stZUDSJ9OwFw3PViTYGAtIIa3bQ7aMSN8GzbJr5s8GGl4y82H95drSpKNn8bL0+YzSNS
         3L8WI8PbfzJVxsEWLlhwIx9KtZhs1hzZGHO02Q3LWWVXiqqAROaas3FaU67Pb4Q+NO6r
         t/5mGIjByjqIf2rxGMuYnGQ2fXq13F2V3J8iXwSwuPRQ5CZNFBYUXiNvcBP6pBY4O7vw
         Z6Ya2E81bbkVRnDFD+gfrsfGDqVT/Wlmi7Dc/iFQQZ46MXP+VFlJqhyUDYYF5LymDeUG
         9iOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=byRWu4PhUCdZFFH1ZumTdX1T6Ymne+7G/GMqF1AsKeo=;
        b=IDOcqsbQ5Wlryx/3rX1bd8l2DJJMql2hJVL0G65K3Tyk+jS+8+uwiM7mDmLKQEklsy
         J4wolR6daHD4v12Nd2uQIt6tZRqQMxrhgwc2XxBnL08VUJBtyKFR/Z2Kl+oMY7BJvOBj
         NHDqbaLlzhXhfF43TMxHURYBHdZDxfpjxOeb20Diz4pwUYUJ15hgcXy51Yy2MP0o9lyc
         INfsRxhBHdoF2JzU61pEcpEZ9UqXGyddVeLs8asUIngzM6J4S69dpZ3myBRe0Gm4irZk
         V66XBdzubDRpmUpp+0a7En2VKPz3tslN7l1nt0ooa1x9Atrs3oM6mR5h9g7NoTwQt9uX
         zIVw==
X-Gm-Message-State: AOAM533PBqY34L2QryDvRlS+o4MmlIc3ihN/yuvi3zagaJmRdeVTB20T
        00ObrgDiF5LEuUdzqXbzagjf+0wf36pjsL0QV0SI8Q==
X-Google-Smtp-Source: ABdhPJxBdYcghpunD657bOZ7806ZT+wcnJ7txkGAZ2F/bbA56xhlBP0tdZ7GGVTtpq3wji6h+fPbaw8uQmVTjYxu5ic=
X-Received: by 2002:a2e:a231:: with SMTP id i17mr13033001ljm.467.1628692177306;
 Wed, 11 Aug 2021 07:29:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210728041253.15382-1-sergio.paracuellos@gmail.com>
 <CAMpxmJUnXpOhvaQuNPbFt3TY363vrsEWV1KXxhyBm7cJ-PWvwQ@mail.gmail.com>
 <CACRpkdbHzdCnHB8358Wi6zojMhfi5urhdm2XOiPmhph7q_L1ew@mail.gmail.com> <CAMhs-H-+yiWitOkMCwmqrMAh6sLPViT0VRXz=YV_F4-vRQH6sw@mail.gmail.com>
In-Reply-To: <CAMhs-H-+yiWitOkMCwmqrMAh6sLPViT0VRXz=YV_F4-vRQH6sw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Aug 2021 16:29:25 +0200
Message-ID: <CACRpkdYsuL7pHxxy5YfRjfmTdKivnHxtSV3Xtops1qad4WGb1A@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] gpiolib: convert 'devprop_gpiochip_set_names' to
 support multiple gpiochip banks per device
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Gregory Fong <gregory.0xf0@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        John Thomson <git@johnthomson.fastmail.com.au>,
        NeilBrown <neil@brown.name>,
        Nicholas Mc Guire <hofrat@osadl.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 11, 2021 at 12:27 PM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:

> I was searching for clear patterns that were using a similar approach
> to this new stuff inside the gpio folder and I was not able to
> properly be sure which other drivers can get the same change that I
> did for mt7621 and broadcom applied... If you point me out to which
> drivers can also use this, I am ok in sending patches for all of them
> when I come back from a little rest time on August 23th.

I don't know exactly how to identify these but this is one:
pinctrl-microchip-sgpio.c

Yours,
Linus Walleij
