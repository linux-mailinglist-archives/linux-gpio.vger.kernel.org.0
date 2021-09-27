Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2E9C41A3D5
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Sep 2021 01:34:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238086AbhI0Xgb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Sep 2021 19:36:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238012AbhI0Xga (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Sep 2021 19:36:30 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44E9DC061575
        for <linux-gpio@vger.kernel.org>; Mon, 27 Sep 2021 16:34:52 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id i4so84361462lfv.4
        for <linux-gpio@vger.kernel.org>; Mon, 27 Sep 2021 16:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p7CVYFYB6IScMOhinp3eAsjdEnQjzCUu4WAwVsai6UI=;
        b=ARTNOmegDd2cYQVwVGZVZRUiqMIC096e1dNKRcQ75TeYZ3hrY4z2gyQ1O8isDXWQF7
         u2tCIyZn1TKlYnOA8bPFSY0JiJvqK6NCEG6EhTP1ZZs2+GGUENijb5LSCsGYapqCcMy1
         Lbn8PIUsAaJDjNV5beQph21T6CkWFYkw4802TtDvNtWcyuxCTQti9Q+QSa8XO+465CRa
         6qaU7qpM2E1iDwHJ2KZM090E5Qk42OxTlx+LHHj0NMJt3dX7qmq/+3uVtCtcASsFqQJm
         4ozNDUXXyAZgkfxPZs34wj/dxrEdkjDUknTRmNsd/IbztPQUuVp8WjmIxgHyz8x+pcJA
         VOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p7CVYFYB6IScMOhinp3eAsjdEnQjzCUu4WAwVsai6UI=;
        b=L/bAdPWl504wp6mz4iIwvY9Zc0/BsNLuw8UCj/kcTEBKFl00ZlMHYkFgVskV7tn2AG
         PXhufA71I2iNip36e+4dxu1c+H+KWXyPcWBYFO/K6JM7OYoWY63dQHYJM3WZPxAdEhR9
         KcyjZujhpn1f6WLdevfFgolO1FuC7Z67MFKOxTZFv3ugcyaxuxBZuVCXZGRgj1eWv72X
         2sptzTUoCsNvqAGEPNb9Cf0b1OqJojU+b8VgZi9oqPEbJhKPVAgTGxXWvazVeF1EdHiW
         x1WBuobeHsWkfxAVPBqP8qzCsWV3JtKsJ1S8pCm2SuMtBmSbyl4+Rx6EGaQUoO0fK3QG
         F0yQ==
X-Gm-Message-State: AOAM531I5/YbD9P5kIpSQDWLcwTtB3FdZGQM1kp2tTb7WNie1WAOOhgV
        aRtWJSHlFFVAYIDnBrS1s9FMApVA8VjOpBLkPGbwAA==
X-Google-Smtp-Source: ABdhPJzMLGSoR5x/ReVFQpoyvOZVuGs4vKSdd7fgqjJp7B1S+/Dj8KSMv0NAhAQ7+QePasooWbdF8yxoTjJZy27FGp8=
X-Received: by 2002:a05:6512:1303:: with SMTP id x3mr2408184lfu.291.1632785690654;
 Mon, 27 Sep 2021 16:34:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210921222956.40719-1-joey.gouly@arm.com> <20210921222956.40719-2-joey.gouly@arm.com>
 <YUrZR/Tl7obfehXP@smile.fi.intel.com> <20210925134425.GA4681@e124191.cambridge.arm.com>
 <CAHp75VecEoUnNLx_tw3Fa=9jaDQaXbaaN=gGfFSXPkvpUOihoQ@mail.gmail.com>
 <CACRpkdY01KsAo1OP=MF0LKWt1r5UDXDW=U0Bce1ZMPQGcXmrjg@mail.gmail.com>
 <50d6a8f0-c515-43dc-af06-b31bf8f863df@www.fastmail.com> <CACRpkdb-TZfjyonddfHjOFqZXuLSGi7ER3_onnom-5VYm5GsgQ@mail.gmail.com>
 <9e7842b6-eff5-440d-b97a-175bd8e37fa6@www.fastmail.com>
In-Reply-To: <9e7842b6-eff5-440d-b97a-175bd8e37fa6@www.fastmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Sep 2021 01:34:39 +0200
Message-ID: <CACRpkdZp_SNZEvLW=mYTJxaTdnX=mL0tbC6hnSkr1kht67ufZA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: add pinctrl/GPIO driver for Apple SoCs
To:     Sven Peter <sven@svenpeter.dev>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Joey Gouly <joey.gouly@arm.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hector Martin <marcan@marcan.st>,
        Marc Zyngier <maz@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        nd <nd@arm.com>, Stan Skowronek <stan@corellium.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Sep 26, 2021 at 4:36 PM Sven Peter <sven@svenpeter.dev> wrote:
> On Sun, Sep 26, 2021, at 15:10, Linus Walleij wrote:

> > If these four blocks in the SoC are different, they should have
> > different compatible strings, because they are not, by
> > definition, compatible.
>
> I'd prefer to have a single compatible and get the npins from some
> property and I don't think that's necessarily over-generalizing.
> AFAICT Apple has been using the exact same MMIO interface for years
> and I'd expect them to continue using it in the future. The only thing
> that seems to change is the number of pins available and their assignment.
> If we just have a single compatible we can likely support the M1X/2 or
> however Apple calls the next SoCs with just a simple DTB change without
> touching any driver code.

Admittedly the word "compatible" in DT context is a bit fuzzy around the
edges. Sometimes it is more like "parameterizable" which is what you
are saying here.

I don't have a very strong opinion on it, both approaches are possible.
Being able to define new SoCs are not always helpful for developers
as the data in DT can become opaque and hard to understand if it
is too general.

Yours,
Linus Walleij
