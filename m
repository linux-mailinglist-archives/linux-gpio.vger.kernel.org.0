Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7CDC3A0F80
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jun 2021 11:18:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233184AbhFIJUo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Jun 2021 05:20:44 -0400
Received: from mail-lj1-f178.google.com ([209.85.208.178]:42661 "EHLO
        mail-lj1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237954AbhFIJUo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Jun 2021 05:20:44 -0400
Received: by mail-lj1-f178.google.com with SMTP id r16so11583023ljk.9
        for <linux-gpio@vger.kernel.org>; Wed, 09 Jun 2021 02:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bEG/w+83YCQdhcjk3hMB/2pU0Hzz9e45pwvsQ652QZ4=;
        b=CKuHDfWBu2cwegozqj52R/g3GZnPS2uOKYtWbcWrnQB6pLHMwhDhTdoZjvpBq//AiL
         MLxZwa2uz9ZntVlOJ7sQsyWFIe1iS5JsYfe6Lp4pDUma8MeZfS8l4UsRweQRithBuXfi
         EBy5eM3VpgWhDTrdpb+aKxy/aKTOrUT+8yOM4aiREY/vEfJ8S79T46wGL2VFWYLNCAdt
         n4Qs2ypust5VOR80/jR1KriOS1AseOLMyQ/MF2eOfQyY6vWIXkSLS1Fh12e3/L4h6yNt
         4bBVNkTdUJT3V1j4OsonlnbJTe2gnRrchrwtR+oaGAsPQGQgUGqFBJ4KoZktllY3pBaF
         9x7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bEG/w+83YCQdhcjk3hMB/2pU0Hzz9e45pwvsQ652QZ4=;
        b=Mvby4Hmxafh2qV1L7SzU5dm4iK9Rj8OIWNgU0qwMHqHvTQyIIMVPNtlYFL4oOtDJDZ
         Unmug+tW4xmlVGCucxp25NAKoBQ/7Y/9lco+ND9gHeMGz/1BVFZ0atRB2Axo8gGUnq8h
         /CIlggzKLE6xTNKkTVvCahQHu5TuE9N0qlmWGqdaUs0hN2Syy7U1mQInw6AJNgPhkQiU
         GIP4hnXl+L0DbYj2Y322t6v9si0g/liOkLCAAUlkDdaU3udr+A0iujldFwDGTrGws7uc
         UGOo+v4FKFZVP6uiZAUe3kmeicHBwATLlQ69PhO08vzf6hu5/oYD9OOcbhFIfkuDAcFl
         Yeww==
X-Gm-Message-State: AOAM530G53aD6xHI3/17Gi5qRh2d2s2gjzdgHwEmfc2wmwyhpWVsAUgQ
        twqJDejkK25/8vVaviQ9awzsBlNNfb/EBvBC+EM7+w==
X-Google-Smtp-Source: ABdhPJwh4YesWYyUgVjZAE6+CeyPfHk/453koIwepndYg3pfX5+tYJ7/ek1lIJ5PGwRvjl003ULe/1DyWqcXDvcPOhc=
X-Received: by 2002:a2e:1319:: with SMTP id 25mr21554697ljt.200.1623230253367;
 Wed, 09 Jun 2021 02:17:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210603101822.9645-1-steven_lee@aspeedtech.com>
 <20210603101822.9645-2-steven_lee@aspeedtech.com> <516bb11a-b75f-49e1-ba79-e5a4c344a7ab@www.fastmail.com>
 <20210604033039.GC25112@aspeedtech.com>
In-Reply-To: <20210604033039.GC25112@aspeedtech.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Jun 2021 11:17:22 +0200
Message-ID: <CACRpkdawakx66Nix41h=FzhL--QEMZCcDX=a_hf_kTq+0DjpAg@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: aspeed-sgpio: Convert txt bindings to yaml.
To:     Steven Lee <steven_lee@aspeedtech.com>
Cc:     Andrew Jeffery <andrew@aj.id.au>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>,
        Hongwei Zhang <Hongweiz@ami.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 4, 2021 at 5:31 AM Steven Lee <steven_lee@aspeedtech.com> wrote:

> However, it might affect users who update kernel/driver from the
> old kernel/driver as they may expect the gpio output pin base is start
> from 80(MAX_NR_HW_SGPIO).

Why? What users? In-kernel, out-of-tree-kernel or userspace users?

In-kernel users can be fixed, out-of-tree kernels we don't care about
and userspace should be using the character device.

Just change it.

Yours,
Linus Walleij
