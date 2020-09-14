Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3840E268FC5
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Sep 2020 17:26:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725961AbgINP0M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Sep 2020 11:26:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbgINPUg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Sep 2020 11:20:36 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5205C06174A
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 08:20:34 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id l17so17970809edq.12
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 08:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ffL0DUzIZthhiRS+767sfBm6P5s0kTPJ4zPMLE04jZs=;
        b=iHwlK1m2qAHstQvGUBdoCB/ICwRZj/jWLGOy1TiX9VmJDkOOhzVRB02bRlgtLJtx6h
         wzBh1N8plpwxqwQtpEqXEWRoxK6HQ2hQCRxd6PZzc4CfTpUIdsnRPTvvox392oBkFc0U
         7eF2azzUj/9JsoshnZu4t9udRUpYI8eiC04UxuqaqUtVmrQeUkyFPK8dsdkV0o00fq7s
         y06ZzNiF2DlQOoO3VzcJgiVSziYhYEhhuLYMRVOpGPrB+qZ43AxQR3FycV8HDR7kJXWd
         +WjeKM9aTwFEJiHA8SoujcCW1T1R97ANU+CuTdBLpDeILPGCRl85cQwk/cZzUnzzhnEZ
         SHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ffL0DUzIZthhiRS+767sfBm6P5s0kTPJ4zPMLE04jZs=;
        b=llg3DSTWD9uYN4CVjqRXgHbKi9sm/lPlCBHqUonCkIJLX2CTxO0xBExhor2bsZpsq6
         r2+Jo+9m/MfCyKgRtAr841U0r1Fo9G4FkBfntWVn2jTKhVsN7I+pZd1yMPuRlArZ8/Sz
         QPuT0jyjhbefK/q61nn+/JSX5mUMe7l9/Wfd+e+cBA4rxzKndPO2d3jJatOzzjl1XRsv
         Rl/zLgCcINNt0vHZUhlAciETYRtOp1SJ29l0P4WN7gH6jKM++VEXPE2DLhGu/MgEmeHd
         2JkJIDYeP1bK59uPqX1GnVhOyfrzRiqmvkSxqJJYjeojs7IEHpmrym8bNCfFWY+8Wl79
         yo4A==
X-Gm-Message-State: AOAM533vheCWh2I4sOFqjX2CnChmVdy6DeEBE+sTC6C2cL/GuNjyikL3
        Ar1QuGbEmzFMP2BfiwgZw0mva7SiicTN5jYyEtQnTQ==
X-Google-Smtp-Source: ABdhPJwK0su7fkgSrW4/gBpLVKfQn/G2qZiELdcZRcZNr6wFsLeBEk/S1xnX1wijMf+mCwxPYHd62Org0o4x/ufxfUA=
X-Received: by 2002:a50:f687:: with SMTP id d7mr18395044edn.353.1600096833535;
 Mon, 14 Sep 2020 08:20:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200912081105.1615496-1-warthog618@gmail.com>
 <20200912081105.1615496-3-warthog618@gmail.com> <CAMpxmJWM4UZ2iDO047-H7sMeCR0BD2exmiMFo3=eF1UmYJZkQA@mail.gmail.com>
 <CAHp75VeFWQCkeXne+7i2FEUNy97yjPiMwsQqkm7mqhtXiGac7A@mail.gmail.com>
In-Reply-To: <CAHp75VeFWQCkeXne+7i2FEUNy97yjPiMwsQqkm7mqhtXiGac7A@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 14 Sep 2020 17:20:22 +0200
Message-ID: <CAMpxmJUHcFsoREWoqqS5y7ZhOm=KqquJ0LDkUj7C2ZvtmTps9w@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v2 2/2] core: fix reading subset of available events
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 14, 2020 at 5:16 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Sep 14, 2020 at 11:16 AM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
> > On Sat, Sep 12, 2020 at 10:11 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> > > Fixes: 44921ecc9a00 (core: provide functions for reading multiple
> > > line events at once)
> > >
> > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
>
>
> > Will apply shortly and backport it to stable branches too.
>
> Please note that
>  - Fixes (or actually any tag) should be one per line
>  - no blank lines in the tag block
>

Kent: no need to resend this, I fixed it when applying, but yeah for
the future it's true.

Bart
