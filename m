Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 372A82EBD3F
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Jan 2021 12:40:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726407AbhAFLji convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Wed, 6 Jan 2021 06:39:38 -0500
Received: from mail-lf1-f47.google.com ([209.85.167.47]:37135 "EHLO
        mail-lf1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726395AbhAFLji (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jan 2021 06:39:38 -0500
Received: by mail-lf1-f47.google.com with SMTP id o17so5869423lfg.4;
        Wed, 06 Jan 2021 03:39:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9NAogX/r0yPOocWypmpLSORnJfFTmk75hbuYknPac4o=;
        b=Y/1eh1j29BMjk1qCXEHx619Hj8AcbdQBW6B2bNMotTdZvaaUheOynvDKresa9TOn2X
         hw/BgAWCjZnGzMYUxTjmhygnBIrziuvffaMXRYPQue2nnpOAo17ZcqEHcThnf4hzqXwl
         CNkwxlVuFnqObR5O99pIa4vnzjXGr6OM0UqehRlWw1TfOo/n7JKx5lC8l9/TngrrxCUK
         61WetHWFeVRpTIw66oG7JXWhKQSBDaMXsyjqFnbPaScE9sbvBe+C3JlDuStduNoLongh
         hJpyIrJUScXDL1vLhlDMTnrKtODmh2gMtzXc2upVtv3VmsUV9UxCc/YdTCO16vsoMylQ
         ykdQ==
X-Gm-Message-State: AOAM531cqHIwgjViL0Tq7Q31d4wPD1zRQszwJ/42F69jO5W17uxSEJQa
        5qd2gsH1sXeFtoeKTpFAARAvOKt9aNS5Fw==
X-Google-Smtp-Source: ABdhPJxjKEV8Q2sKm9aALXRuigiseAO3GYM/HOt/BA5XgTvnzeZH1PIifoo6Hm/PhYBo5vVIvvvA5w==
X-Received: by 2002:a05:6512:3047:: with SMTP id b7mr1685168lfb.210.1609933134626;
        Wed, 06 Jan 2021 03:38:54 -0800 (PST)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id g2sm297977lfb.255.2021.01.06.03.38.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jan 2021 03:38:54 -0800 (PST)
Received: by mail-lf1-f53.google.com with SMTP id b26so5791069lff.9;
        Wed, 06 Jan 2021 03:38:53 -0800 (PST)
X-Received: by 2002:a2e:8852:: with SMTP id z18mr2089818ljj.94.1609933133706;
 Wed, 06 Jan 2021 03:38:53 -0800 (PST)
MIME-Version: 1.0
References: <20210103100007.32867-1-samuel@sholland.org> <20210103100007.32867-5-samuel@sholland.org>
 <a6c2eac4-7e98-ecb4-ee8a-d67a7f1b6871@arm.com> <20210106110643.agq3mjyhgvg3w4i6@gilmour>
In-Reply-To: <20210106110643.agq3mjyhgvg3w4i6@gilmour>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Wed, 6 Jan 2021 19:38:43 +0800
X-Gmail-Original-Message-ID: <CAGb2v64mcLogZax8vVJJxG9feBzmGc8VyazTvp7XkBAoLXw9JA@mail.gmail.com>
Message-ID: <CAGb2v64mcLogZax8vVJJxG9feBzmGc8VyazTvp7XkBAoLXw9JA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: allwinner: h6: Use RSB for AXP805 PMIC connection
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>,
        Samuel Holland <samuel@sholland.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 6, 2021 at 7:06 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Mon, Jan 04, 2021 at 10:54:19AM +0000, André Przywara wrote:
> > On 03/01/2021 10:00, Samuel Holland wrote:
> > > On boards where the only peripheral connected to PL0/PL1 is an X-Powers
> > > PMIC, configure the connection to use the RSB bus rather than the I2C
> > > bus. Compared to the I2C controller that shares the pins, the RSB
> > > controller allows a higher bus frequency, and it is more CPU-efficient.
> >
> > But is it really necessary to change the DTs for those boards in this
> > way? It means those newer DTs now become incompatible with older
> > kernels, and I don't know if those reasons above really justify this.
> >
> > I understand that we officially don't care about "newer DTs on older
> > kernels", but do we really need to break this deliberately, for no
> > pressing reasons?
> >
> > P.S. I am fine with supporting RSB on H6, and even using it on new DTs,
> > just want to avoid breaking existing ones.
>
> Doing so would also introduce some inconsistencies, one more thing to
> consider during reviews, and would require more testing effort.
>
> I'm not sure that stretching our - already fairly sparse - resources
> thin would be very wise here, especially for something that we don't
> have to do and for a setup that isn't really used that much.

As soon as some software component starts running RSB, (which I assume
is what Samuel is planning to do in Crust?), there's a chance that it
doesn't switch the chip back to I2C. And then Linux won't be able to
access it.

So I'm for keeping things consistent and converting all users to RSB.


ChenYu
