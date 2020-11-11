Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D9F92AFB2C
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 23:14:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726849AbgKKWOV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 17:14:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbgKKWOV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2020 17:14:21 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4942CC0613D1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2020 14:14:20 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id g11so1685054pll.13
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2020 14:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=grPL2seYIl0cq0jOrQvMacLqRHtmT90rDqSoRVTB9II=;
        b=gGPfIRTQE7guA4oO1t82Mgvf64e2s/qAvQPWFP0fvBz4aLMUP8l5MoWP6/1wuABa5H
         eoXJLvgKLR5C5ptuGUhNAMvyCGuZGV8Gg6RJ7AZUBC/sjlfiMgUIvYdTUsVpNFpezyhy
         gMb8KVG2uQatmCIT3Gar8XeTnhIWqJTaB7o/Qdt3bQGY91NCkxQZExmLzoHBw5tCObws
         XOdeaEVx7g/YwbecFmSQ5EjX5Aazdrso9O3xGNhsVrac4NJCDJXng01qd/AP/KoRWwsv
         yZ4JB7HTl5NCHek5MpUfn7axHWunXRWnLZZU4NpiR6Ej6gpJnSN14sRgZVTEBV8KYSzs
         IpNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=grPL2seYIl0cq0jOrQvMacLqRHtmT90rDqSoRVTB9II=;
        b=QCDZy+63AWHyv3f5te+uozGx4mBAdmAMtylyFBWRoXvCAahMfg3pldy4AY5b9DPuH7
         333YA52ovjZG5f7zT2tJpiEEe8dZMIRBnJ5qFzcW3icklJ3nIgZTQEd4Kw1k9/j2z5F9
         eaiG9y1mUgVpvpSv5qyeew2Nr/mQEj8PpFenLSszXJVVQipmYyKpDBhn07ctINRJojJ2
         wCH3Op8UGUAg1tgs+EQ/qpodBdmL1SMLwqqvIyRPOB7wPSBqtJ2NA0TAiry9+m/RiSnb
         IPnmQnQnaDYAoTdJXf/qmy0kSMNngCSKXE/n72dJtOS4tEbumJg2fAGEDND2OiDmzJXp
         upQw==
X-Gm-Message-State: AOAM531Zzcr+aTXZSIaVPwTl/EH3rhIiYt/qDjxcaBY9hya635hsSxce
        WlNjHs9dbpyvjVjaQRfFjvEMHv/RTCml3/g11Gw=
X-Google-Smtp-Source: ABdhPJyKx5cVbodz7Yl+9PVzm0QLWunKwghl9jUPj3kc+L3Cdv3CBzWH1+J70fwAvTUWd/kLqIBvsnbIyKeMBmUCECQ=
X-Received: by 2002:a17:902:aa8a:b029:d3:c9dd:77d1 with SMTP id
 d10-20020a170902aa8ab02900d3c9dd77d1mr23381960plr.0.1605132859849; Wed, 11
 Nov 2020 14:14:19 -0800 (PST)
MIME-Version: 1.0
References: <20201111215401.34449-1-andriy.shevchenko@linux.intel.com> <CAE=gft7cuEiA+esfsA4NCj4xKx5jA=Da_Su9Y+vUjM2vCeimXg@mail.gmail.com>
In-Reply-To: <CAE=gft7cuEiA+esfsA4NCj4xKx5jA=Da_Su9Y+vUjM2vCeimXg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 12 Nov 2020 00:15:08 +0200
Message-ID: <CAHp75VfXZnaur=_tiebQ3Gs_OPFBy-nLMnn1gE6-o63cri9=Yw@mail.gmail.com>
Subject: Re: [PATCH v1] pinctrl: jasperlake: Fix HOSTSW_OWN register offset
To:     Evan Green <evgreen@chromium.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 12, 2020 at 12:08 AM Evan Green <evgreen@chromium.org> wrote:
>
> On Wed, Nov 11, 2020 at 1:54 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > Jasper Lake uses different offset for HOSTSW_OWN register.
> > Fix it here.
> >
> > Fixes: e278dcb7048b ("pinctrl: intel: Add Intel Jasper Lake pin controller support")
> > Reported-by: Evan Green <evgreen@chromium.org>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> > I have got a confirmation that PADCFGLOCK is still 0x80.
> > I updated my patch and put your name as Reported-by. If you want me
> > to have your patch instead, I can review it (it needs some massage
> > of the commit message)
>
> Either way is ok. I'm happy to spin and edit my commit message, let me
> know how to change.

Okay, let's drop this one, because it repeats yours 100% code wise.

-- 
With Best Regards,
Andy Shevchenko
