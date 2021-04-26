Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8054336B095
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Apr 2021 11:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232570AbhDZJc3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Apr 2021 05:32:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232078AbhDZJc3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Apr 2021 05:32:29 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 609AFC061756
        for <linux-gpio@vger.kernel.org>; Mon, 26 Apr 2021 02:31:46 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 124so6234821lff.5
        for <linux-gpio@vger.kernel.org>; Mon, 26 Apr 2021 02:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AUK2VLb2h/aghhGuRyQu+vL3L73eWxKFqQuj5HuuBYQ=;
        b=CDdJaObR40rip9MxTz1LdVemkRQSvAkocNvoLrGdPfFD8OG1yQx/xe5OJPzMeYvm/A
         bi5Dt6n7tBEyePqlTy9ROiBzPlz4+VGL3lL3BbUV0fO7Upk5Aln0t8qp513/c/63MEjz
         SCwCyuNhOjxV6tPKZO+zfbw2yP8/kh4mr8F/OAN0yLKnBsZHlyBwILpjyWHWXXJ1NHAS
         UqyPZ3d858jg1mNhktP58Frt7fVhK9b0GQNQ8o63HWTWg81/f5xSMmNPCXBVoAqczXS/
         mGTxkiO5+Pjtk5MQbln4g33IbXar0NI8fkFbT8bsA53wXkWDCCcGW8D8q7GKn490UgYl
         RyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AUK2VLb2h/aghhGuRyQu+vL3L73eWxKFqQuj5HuuBYQ=;
        b=YkuUp7Ix1NrGY4DfyOx1WazNQVAsg+1Qnna7GireCxU1xBiNHc4w8EZklP1WKtUyEe
         sU4g7FWzgTArbiHqHwmAyzyMRv5Wbra40F37jT/aLWhVfEcKC3q8fOVy4zCP5L0nFAbt
         xJ9uds0Q+CPUpYlrkR+PyfDPaDulTYPQa0tvtT5C2P8Uu8irKE+9mTPM0LXmZ329RlRF
         2aM0E3EtXVVshdDPA0HEsM/JbeH6KEWA36tYK76EYwNGEH5h/hhVr7fj98X8XT9JEIiQ
         lwxJmPSLKIL+iPXe1XLuUrqqh3bgG66C+47zxipJgfSp4cfIFMRstDlMB12qtqBq2o8b
         dzXA==
X-Gm-Message-State: AOAM5314Pc/6XjArnsMjsyb0+weHj8fMwEZlMFrzMwl3RUTfuHj8VrJY
        /QgqqkMA0RSXk+Wh9+7XXeElvV22snMapSsE22F1Gw==
X-Google-Smtp-Source: ABdhPJwj+NTYA7RNA+Fft20gDnLHQJ6Yl87q4n7aqAjFFgRBXX2MuSAUioyuFradzv9MIRK00Of03/JYZLoF/3yEBLE=
X-Received: by 2002:ac2:4a87:: with SMTP id l7mr12474738lfp.586.1619429504851;
 Mon, 26 Apr 2021 02:31:44 -0700 (PDT)
MIME-Version: 1.0
References: <01afcac0-bd34-3fd0-b991-a8b40d4b4561@enneenne.com>
 <1c4f1a83-835a-9317-3647-b55f6f39c0ba@enneenne.com> <CACRpkdZPjJSryJc+RtYjRN=X7xKMcao5pYek1fUM2+sE9xgdFQ@mail.gmail.com>
 <CAMuHMdUtguuu4FWU4nRS=pBUyEwKM1JZ8DYPdCQHXBYN0i_Frg@mail.gmail.com>
 <87efe96c-3679-14d5-4d79-569b6c047b00@enneenne.com> <CAMuHMdUght0hkJT1N8ub5xR5GB+U18MAhAg+zDmAAuxoRSRaYg@mail.gmail.com>
 <d30e64c9-ad7f-7cd5-51a4-3f37d6f1e3d8@enneenne.com> <070fa558-6e20-0fbf-d3e4-0a0eca4fe82c@enneenne.com>
 <CACRpkdYFAW2bcB53M3_b2LsveJO_PWZJhprGhdTtfmW11B1WmQ@mail.gmail.com>
 <f66dc9c4-b164-c934-72a8-d4aca063fca5@enneenne.com> <CACRpkdbjc6vvpHVjnJNGisRw6LiLZd-95aHWJJORwvaRNigPcw@mail.gmail.com>
 <cb6e208b-446e-eba4-b324-d88aec94a69b@enneenne.com> <CACRpkdZBUw5UPyZB-aeVwh8-GiCifbwABZ9mOsyK90t3cdMQ+w@mail.gmail.com>
 <80bf1236-aacd-1044-b0e5-5b5718b7e9f0@enneenne.com> <CAHp75Vc1ezuW9m8OCQUmEJoNVoD-Z3eWF=Lzcr2v32Br8Gr60w@mail.gmail.com>
 <CACRpkdY+amtrDE4gaSU5Du2CUivxo6gnUV5zZOcaJJ8=md-4Kg@mail.gmail.com> <87207962-5848-3e5c-4d8d-f4a66c864413@enneenne.com>
In-Reply-To: <87207962-5848-3e5c-4d8d-f4a66c864413@enneenne.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 26 Apr 2021 11:31:34 +0200
Message-ID: <CACRpkdYCdhi_Vb_+0cfD02WRzOhvenoFt5tbowe91RMjQBfeug@mail.gmail.com>
Subject: Re: [RFC v2 GPIO lines [was: GPIO User I/O]
To:     Rodolfo Giometti <giometti@enneenne.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 26, 2021 at 10:44 AM Rodolfo Giometti <giometti@enneenne.com> wrote:
>
> On 20/07/20 10:17, Linus Walleij wrote:
> > IIUC Rodolfo's idea is to provide this with a DT compatible.
> > The use case will be industrial automation-ish tasks from userspace.
> >
> > Currently the only mechanism we have in the device tree to
> > assign a use for a line is the "gpio-line-names" property,
> > which creates a name that is reported upward to the character
> > device.
> >
> > Rodolfo's patch is for scripting use cases, assigning some lines
> > for some cases to be handled by scripts, not the character device.
> >
> > What I am a bit worried about is if this would be a Linuxism, as DT
> > should be OS neutral.
>
> Hello Linus,
>
> I'm currently using my solution for GPIOs management as input or output lines
> described in the DT on several systems.
>
> Are you re-thinking about this topic? Can we go further for inclusion or should
> I continue doing out-of-tree? :(

It is a system description question, and I think you will need to discuss it
on the devicetree@vger.kernel.org mailing list.

The people there are working with things like the system device tree which
is intended to describe aspects of a system apart from what Linux or
any operating system is doing with the hardware.

I would send an RFC of the proposed DT bindings there.

They have been Cced in the past but not addressed directly.

Yours,
Linus Walleij
