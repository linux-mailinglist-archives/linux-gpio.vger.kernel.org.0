Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E52DE39869E
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jun 2021 12:35:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231877AbhFBKhM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Jun 2021 06:37:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231792AbhFBKhL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Jun 2021 06:37:11 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C98AC06174A
        for <linux-gpio@vger.kernel.org>; Wed,  2 Jun 2021 03:35:28 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id a2so2582790lfc.9
        for <linux-gpio@vger.kernel.org>; Wed, 02 Jun 2021 03:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rdEIJAwf/C90MdVmxcnl9GFMUpGP/9aFprmh9SH0smc=;
        b=vbudbSJX9/uMoq8F7wPu2EXLTplWPaIrkSkSKNy1vJ2uMkMOs8qtwP/irbUZqa4KUq
         pIqH+1medM+pKocqJj/X0/wPlg+l4P7jp0dYsNtvlTYSrKdmcjG50kms1scvO7ityhQp
         CW1oAX7au6inGoWhD/6oOp1zXiZbmiGvloms9htpbDhweurXqUakbUSkUfkpxd8kLz3b
         QUBbPA1vpAUosMQmAg1z61Eob8CUGoxLp5uVSoiUzbe9unq85n9BqxBQG7O96x3BnVby
         hRXJHkgzCoUEP5d0IYzS2qVf/nTWlZ9PWwmGoPbfzHQw2RGNqBOpmHb2vHlldxwvOCYH
         oPag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rdEIJAwf/C90MdVmxcnl9GFMUpGP/9aFprmh9SH0smc=;
        b=MuDblxc2qKzHvl0kA4GCe3T6eCoS7tInsM6RA7jzySwoBjI5SbgC4+2p8I1Mk2PwaJ
         0/4lKEa4jg/ej13UNqSWfGJfaVQmwDMzHZ+kbOMyF7sEfEpwUm14S9iHC/ul3Rnwdhcv
         9WqJd4qFHo2vp7YZ+Movv4S/VfpFAzT7bEHlFKfM3BjLMdm/VjbqQpW02NtTEOgKIMpN
         8dWFfHuBge3IHgy7qhS9QKDJPXvmFFAX/5+/CUEPyJqqkPde6d5r4jIDnetmrUR6uyAj
         AEbNKRPyvL9azfX+0xX13TJn4dVCi3IA84BMtcbE1W/b3+NA0cw0b6NPc5TNeqHez3f8
         hBWg==
X-Gm-Message-State: AOAM531I4nX6K0k2NL89Ym8eYSgFlY0XU6jj7ARKR47NL3Tx1q9s3fOI
        dn+HhKHk/thZQoo3H++6hmYS8SPrqrfc2P1K2XSxXA==
X-Google-Smtp-Source: ABdhPJyIN/3Se7S1fjFYFkTdtSGpmA37gohmI47+odduWtxPG/vQ7MAEqicJ3YclH1sFg/eryN0vXIuXtirSd/Q4Dns=
X-Received: by 2002:a05:6512:3241:: with SMTP id c1mr13831781lfr.29.1622630126777;
 Wed, 02 Jun 2021 03:35:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210325122832.119147-1-sandberg@mailfence.com>
 <20210530161333.3996-1-maukka@ext.kapsi.fi> <20210530161333.3996-2-maukka@ext.kapsi.fi>
 <CACRpkdZfdd=ogHoNGuLzGGZYkvw7xtNO2VJm-t-2vMibGNy=dA@mail.gmail.com> <866ff376-6d74-49c9-9e4c-2bf36bbd5981@ext.kapsi.fi>
In-Reply-To: <866ff376-6d74-49c9-9e4c-2bf36bbd5981@ext.kapsi.fi>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 2 Jun 2021 12:35:14 +0200
Message-ID: <CACRpkda9LD00=mUjLbb+wG3mnEVHbyqj-3L98=c-k-bV54gmTg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: gpio-mux-input: add documentation
To:     Mauri Sandberg <maukka@ext.kapsi.fi>
Cc:     Mauri Sandberg <sandberg@mailfence.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Drew Fustini <drew@beagleboard.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Mauri,

On Wed, Jun 2, 2021 at 11:31 AM Mauri Sandberg <maukka@ext.kapsi.fi> wrote:

> But there is a small detail that needs to be sorted out.
> The name 'gpio-mux'
> has already been taken by 'mux-gpio' driver [2] [3].

What about "gpio-multiplexer"?

It is not good that the thing using GPIOs to do multiplexing
has take a name that seem to infer that GPIOs are being
multiplexed. Now we can't do much about that we just have
to live with it. How typical of formal languages to screw
with the semantics of natural languages and create confusion...

> Should we look for another name for this driver and it's bindings or
> refactor the mux-gpio's bindings
> first?

Bindings are etched in stone and cannot be changed.
Unless we change them anyways.
But generally we can't.

> The bindings for mux-gpio need to be converted to .yaml anyhow

Yeah just do it if you have the time, all conversions are appreciated.
(Separate patch and work item though, don't know if you need to
mix that with this work?)

> and maybe
> the issues with the schema
> that Rob pointed out elsewhere would go away too. Otherwise I cannot
> really say what's wrong as the
> errors look unrelated to me.

I don't know about these, tell Rob if you have issues and I might
be able to pitch in, I write a fair amount of schema too.

Yours,
Linus Walleij
