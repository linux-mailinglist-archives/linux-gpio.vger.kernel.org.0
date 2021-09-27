Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 187CA41912F
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Sep 2021 10:56:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233585AbhI0I55 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Sep 2021 04:57:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230439AbhI0I54 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Sep 2021 04:57:56 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A768C061575
        for <linux-gpio@vger.kernel.org>; Mon, 27 Sep 2021 01:56:18 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id g7so6720243edv.1
        for <linux-gpio@vger.kernel.org>; Mon, 27 Sep 2021 01:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S9S287kDJw36awkRlyESw5Z3fTFge1KksLnZhQ7ify0=;
        b=JtFQVJBcmLRnAsIiH5v9L695DGcrb9oR9STuLr2g64yfcshsUnjiP6WbYIMmWhAQhm
         dcFl6Cpj4/wxqsirCx+CC8owKZUGZPvUOf46PaBeGlP8MExSSle/W8qG2pwIV666L+B8
         oDENh4OBPX4bSJk+Pl07WZg08TOfjTz8ghsfl04voGqZtQr3xxXjmzaCd1kThbTT++4h
         MktAwSc0J6n9bsXX9wGBkm3mu16Q/QXyA0MlaJCU3S5AffXlkYbnv6y4aF2iWLUpNBZf
         LjU29Plp/TDQCrW1Wi6Eg5VLaDe2NDHiMZ1dBdjAbamonxXs+yK6S2hWineXxkmAEmCB
         AdJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S9S287kDJw36awkRlyESw5Z3fTFge1KksLnZhQ7ify0=;
        b=6iXXrpJTk2cxwe7uMTFxKX+RfWTGGrA/sTwV6S42uGl7R69h2hYayL66v6z6H+La1a
         tmEmLhoZxx5TOMFGJHpdDtUnlgULQR4Jbyf4yOeVR3HsmB0AuPgFHc/Uc388ZiEh1SCr
         XDg1RfdWjT96lS/L9K3o0GLvC0CVrWAuLaLczCMupjknTLfKpWFjkqhEgoojRX7Dcy9T
         sjaummyQfooxunklxwBOtMDkxfmyaXX9XVZ6zv6S6AhlvZt67siUAFuU5yUTIs8l8U1e
         se/Hvz2x3sC5HS0qixwSQpl0ZlpVWk150dmGBTlEGV1GMTd72A07vG5rcg6B1bqmx8Se
         hbQw==
X-Gm-Message-State: AOAM533CBr0/frPBZ4t68tTyhiDXGMi9n8J+ZeSxNRo9LFRL89Cxwy5V
        IlfDN+U68QJQbm6pqc7ictHyeFZOar7ZwB56kl0=
X-Google-Smtp-Source: ABdhPJxGbvfc/X0p2frHpIOuKPuuz/sICvYr9ZFhnuyWHVbk/SwmtafjfDtnBtc6Y3AC4ZmncarJmMGNWJqWOq31rx0=
X-Received: by 2002:a17:906:3b56:: with SMTP id h22mr26092003ejf.141.1632732976787;
 Mon, 27 Sep 2021 01:56:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210921222956.40719-1-joey.gouly@arm.com> <20210921222956.40719-2-joey.gouly@arm.com>
 <YUrZR/Tl7obfehXP@smile.fi.intel.com> <20210925134425.GA4681@e124191.cambridge.arm.com>
 <CAHp75VecEoUnNLx_tw3Fa=9jaDQaXbaaN=gGfFSXPkvpUOihoQ@mail.gmail.com>
 <CACRpkdY01KsAo1OP=MF0LKWt1r5UDXDW=U0Bce1ZMPQGcXmrjg@mail.gmail.com>
 <50d6a8f0-c515-43dc-af06-b31bf8f863df@www.fastmail.com> <CACRpkdb-TZfjyonddfHjOFqZXuLSGi7ER3_onnom-5VYm5GsgQ@mail.gmail.com>
 <9e7842b6-eff5-440d-b97a-175bd8e37fa6@www.fastmail.com> <CAHp75Vc0CyhuqbVhpO-2xnjM5ZR2px5psZTVsKGdhx++OFB-kg@mail.gmail.com>
 <YVGE6r5RPjuP6u+W@maud>
In-Reply-To: <YVGE6r5RPjuP6u+W@maud>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 27 Sep 2021 11:55:40 +0300
Message-ID: <CAHp75VfNxshmpH5SOpteSmpTarpZHgmv3Ct9ypQnP9Cz390mDQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: add pinctrl/GPIO driver for Apple SoCs
To:     Alyssa Rosenzweig <alyssa@collabora.com>
Cc:     Sven Peter <sven@svenpeter.dev>,
        Linus Walleij <linus.walleij@linaro.org>,
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

On Mon, Sep 27, 2021 at 11:46 AM Alyssa Rosenzweig <alyssa@collabora.com> wrote:

...

> > nub is probably related to some type of hub (or maybe simple typo, or
> > typo on purpose?).
>
> Unlikely a typo. "nub" is an Apple term. In software, an XNU (macOS)
> kernel driver has a "nub" for exposing its public API. I don't know what
> it means for hardware but very likely intentional.

Good to know!

So, it would be nice to have a better understanding of what it's exactly...

-- 
With Best Regards,
Andy Shevchenko
