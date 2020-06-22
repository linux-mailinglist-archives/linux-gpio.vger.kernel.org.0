Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC78203D24
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2020 18:52:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729797AbgFVQwl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jun 2020 12:52:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729669AbgFVQwj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jun 2020 12:52:39 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6C60C061573
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2020 09:52:38 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id l188so3101262qkf.10
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2020 09:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xKlTLIr9tKVPVyEmN3O+/UkYg0WlA5ho7PxkSHR5NzY=;
        b=s7hHLK8CF7P1rEZlyq5Ba1zzjNuyXZHfdd6V5zCHpjwzqJpO+k7ijIKsQ3rMKHnVpQ
         haebi/K3MfTdgqAS8bI+RO4GRQP7+Cwzuv52xT4DJIy1oS4dmr3XZnzmKEYG4p5KpXZn
         x2mUjuAz0Kvobg3oGfzRfFHtXM2nU6Fyaho7pb3Jo6Pj4D8as/Ju2l4O3QPzrKo2S6UM
         zcck1QhxlvllhVx2VKlTfmL2USvekMl0uptErzE0aNrBwX53a21o2u6rjN8QvnqJl1c0
         1BiIWORmrDAzIPuBcamt+kKpk2myp0BDuqLPiSQPdR62yx0xUUxruvhblG1OdYNei2uw
         3G/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xKlTLIr9tKVPVyEmN3O+/UkYg0WlA5ho7PxkSHR5NzY=;
        b=VwD/TDABZY/L3xXOTbKP+J29mGchLkuOl0bezR/+OIFzHJJiNsXEcu9hpBQllQKvbL
         vtEAGOMIyXazbguyMmMC7oHHKjPZq+n0YMK9DpDIJEQEOce7CmGmLso8T+ziEEVPt0YB
         ZnfrQ1m26ER1ZFvUUNj5vrgqHUheF0h+qx7NR0x+3dxob4mom6Sq7iAtW2eKExGDyHlQ
         qAuGrVEJglLlSn5UDPGr3EXq9dbhJ7a+nI+jea5NInam+8osKbOk+z2V9ccjFpX0gO+w
         OdNiDitMz2elWu9lnwlTv9kLY93DmRQ8z9Nv6U+fko+3q5/UfM7Vr551T6YZG65YtxCm
         p+sg==
X-Gm-Message-State: AOAM530Qqvm/1pngEY7OB9JDeHzBfE57pjdqOuHDAXf/jkKBqb+/SkXZ
        us3AmOmDODT6SkRfMMKNHjkQetZIeSQufmh5BjI2jOU0
X-Google-Smtp-Source: ABdhPJwdzGM650XCKSYu6fonmtxJdOrCDiID1B96i6bFOCK45RM2LyuBvGd0CJQFlhk1Xzp7+LpRN6eSWIyzZQVCa8I=
X-Received: by 2002:a05:620a:1114:: with SMTP id o20mr16913291qkk.120.1592844758047;
 Mon, 22 Jun 2020 09:52:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200618114906.79346-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdbWMS+qNQFsJ+9QrphTcqw+2EVRw177X0wTvTLoaXNuyQ@mail.gmail.com> <CAHp75VdMLQth4pM7zgzcWt8vaBBPo-75=a3SSRv0SOGR8Eqk9A@mail.gmail.com>
In-Reply-To: <CAHp75VdMLQth4pM7zgzcWt8vaBBPo-75=a3SSRv0SOGR8Eqk9A@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 22 Jun 2020 18:52:26 +0200
Message-ID: <CAMpxmJWN-yc+MEkX3VVDRF1XwtUmvcuYVPUV-qhmP8SeDP2pFw@mail.gmail.com>
Subject: Re: [PATCH v1] gpio: pca953x: Fix GPIO resource leak on Intel Galileo
 Gen 2
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

niedz., 21 cze 2020 o 10:23 Andy Shevchenko
<andy.shevchenko@gmail.com> napisa=C5=82(a):
>
> On Sun, Jun 21, 2020 at 12:33 AM Linus Walleij <linus.walleij@linaro.org>=
 wrote:
> >
> > On Thu, Jun 18, 2020 at 1:49 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> >
> > > When adding a quirk for IRQ on Intel Galileo Gen 2 the commit ba8c90c=
61847
> > > ("gpio: pca953x: Override IRQ for one of the expanders on Galileo Gen=
 2")
> > > missed GPIO resource release. We can safely do this in the same quirk=
, since
> > > IRQ will be locked by GPIO framework when requested and unlocked on f=
reeing.
> > >
> > > Fixes: ba8c90c61847 ("gpio: pca953x: Override IRQ for one of the expa=
nders on Galileo Gen 2")
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> >
> > This seems to go on top of what Bartosz applied so I expect him to pick
> > it up!
>
> Yes, that's what is expected.
>
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Thanks!
>
> --
> With Best Regards,
> Andy Shevchenko

Applied for fixes. I'll send a PR to Linus later this week.

Bart
