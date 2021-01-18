Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F2902F9DBA
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jan 2021 12:14:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388537AbhARKrn convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Mon, 18 Jan 2021 05:47:43 -0500
Received: from mail-lf1-f50.google.com ([209.85.167.50]:36959 "EHLO
        mail-lf1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389350AbhARJwm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jan 2021 04:52:42 -0500
Received: by mail-lf1-f50.google.com with SMTP id o17so23178731lfg.4;
        Mon, 18 Jan 2021 01:52:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=f6/A9O7eNdKAIZiobaJeehhCHfZRWG7ySyY4et57HyA=;
        b=rvASG1sleFE6IWPcqdVgBCSj6h80l7q7KNJCVTj5AYrNNckmnU5t0xUgNZ2Vqa2F2q
         nboP1vVDtYLluQWci/GQOCnzR49qnPCcmzLX4KYXwiDNZmX1rIPfutToMwUrNdqC91ne
         ggOK0e5un7Hn4vDrZWD5VzTSAzfEMIvQzS3yVhwZ/TRDXuXgPNyIJRfvuAIMVD1lo0u7
         Fj0m1kTuEYImcIiqblF719HVkKwe78TbCQlL08rvgdfAbc9obSPl55DLJ4t2lp10Ljq7
         m5B8wQGDhdbrzyqbuSb9vEBdUemJzXij7Lvu6LXnl3h2VclHtbTaEetZTaSAzJ0DO7A1
         Q85Q==
X-Gm-Message-State: AOAM531dgxImMXY50iN1fyHWr8sMRfHZmNsSPmDgLovsdIr3yzMgaDJT
        DOz2yOr2m3m8++XadwNB3ESZJnwhRpfDHA==
X-Google-Smtp-Source: ABdhPJxiy1BvWVxBFtbE+Ncgm9Y36VPfh1+9CPLxrCt5ZIsofyLkh6nMVX7xLjWQJLH8Fyya/8jkng==
X-Received: by 2002:a19:ac06:: with SMTP id g6mr11017729lfc.611.1610963511458;
        Mon, 18 Jan 2021 01:51:51 -0800 (PST)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id u5sm1845138lfr.154.2021.01.18.01.51.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jan 2021 01:51:50 -0800 (PST)
Received: by mail-lj1-f180.google.com with SMTP id u11so17493929ljo.13;
        Mon, 18 Jan 2021 01:51:50 -0800 (PST)
X-Received: by 2002:a2e:a407:: with SMTP id p7mr10355197ljn.78.1610963510141;
 Mon, 18 Jan 2021 01:51:50 -0800 (PST)
MIME-Version: 1.0
References: <20210103100007.32867-1-samuel@sholland.org> <20210103100007.32867-5-samuel@sholland.org>
 <a6c2eac4-7e98-ecb4-ee8a-d67a7f1b6871@arm.com> <20210106110643.agq3mjyhgvg3w4i6@gilmour>
 <CAGb2v64mcLogZax8vVJJxG9feBzmGc8VyazTvp7XkBAoLXw9JA@mail.gmail.com>
 <bc95a8d2-ebec-489c-10af-fd5a80ea1276@sholland.org> <CAGb2v679L8fDbaE6dpEdo2q=fJdF=e6AfzOXvHLBuwZ_5YbDeQ@mail.gmail.com>
In-Reply-To: <CAGb2v679L8fDbaE6dpEdo2q=fJdF=e6AfzOXvHLBuwZ_5YbDeQ@mail.gmail.com>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Mon, 18 Jan 2021 17:51:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v64WmrbJ_Dtecg2AmWo1Hok0zGt2GCST_KcSAOn-o97U4g@mail.gmail.com>
Message-ID: <CAGb2v64WmrbJ_Dtecg2AmWo1Hok0zGt2GCST_KcSAOn-o97U4g@mail.gmail.com>
Subject: Re: [linux-sunxi] Re: [PATCH v2 4/4] arm64: dts: allwinner: h6: Use
 RSB for AXP805 PMIC connection
To:     Samuel Holland <samuel@sholland.org>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>,
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

On Wed, Jan 13, 2021 at 5:16 PM Chen-Yu Tsai <wens@csie.org> wrote:
>
> On Thu, Jan 7, 2021 at 6:27 PM Samuel Holland <samuel@sholland.org> wrote:
> >
> > On 1/6/21 5:38 AM, Chen-Yu Tsai wrote:
> > > On Wed, Jan 6, 2021 at 7:06 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > >>
> > >> On Mon, Jan 04, 2021 at 10:54:19AM +0000, André Przywara wrote:
> > >>> On 03/01/2021 10:00, Samuel Holland wrote:
> > >>>> On boards where the only peripheral connected to PL0/PL1 is an X-Powers
> > >>>> PMIC, configure the connection to use the RSB bus rather than the I2C
> > >>>> bus. Compared to the I2C controller that shares the pins, the RSB
> > >>>> controller allows a higher bus frequency, and it is more CPU-efficient.
> > >>>
> > >>> But is it really necessary to change the DTs for those boards in this
> > >>> way? It means those newer DTs now become incompatible with older
> > >>> kernels, and I don't know if those reasons above really justify this.
> > >>>
> > >>> I understand that we officially don't care about "newer DTs on older
> > >>> kernels", but do we really need to break this deliberately, for no
> > >>> pressing reasons?
> > >>>
> > >>> P.S. I am fine with supporting RSB on H6, and even using it on new DTs,
> > >>> just want to avoid breaking existing ones.
> > >>
> > >> Doing so would also introduce some inconsistencies, one more thing to
> > >> consider during reviews, and would require more testing effort.
> > >>
> > >> I'm not sure that stretching our - already fairly sparse - resources
> > >> thin would be very wise here, especially for something that we don't
> > >> have to do and for a setup that isn't really used that much.
> > >
> > > As soon as some software component starts running RSB, (which I assume
> > > is what Samuel is planning to do in Crust?), there's a chance that it
> > > doesn't switch the chip back to I2C. And then Linux won't be able to
> > > access it.
> >
> > Crust can handle either way via a config option, which currently
> > defaults to I2C for H6. It must use the same selection as Linux, not
> > only because of the PMIC mode, but also because of the pinctrl.
>
> Could Crust be made to also handle pinctrl?
>
> > TF-A is already converted to use RSB[1], and it does switch the PMIC
> > back to I2C before handing off to U-Boot[2]. So new TF-A + old Linux is
> > fine. However, Linux currently does not switch the PMIC back. So the
> > most likely problem from this patch is that, with new Linux + old TF-A,
> > TF-A will be unable to power down the board or access regulators after
> > an SoC reset.
> >
> > I expect there will be a TF-A release between now and when 5.12 hits
> > stable, but people tend not upgrade their U-Boot/TF-A very often.
> >
> > We could solve this by having the Linux RSB driver switch all child
> > devices back to I2C in .shutdown, or by dropping this patch and only
> > using RSB for new boards (which would also address Andre's concern).
>
> This will work for most cases, except in a kernel panic or IIRC direct
> reboot using sysrq. So it's not robust as we'd like it to be.

I also wonder what would happen when there are multiple RSB devices, and
we switch them back to I2C one by one. It's not like there's an option
to switch all of them back at the same time, unlike switching from I2C
to RSB. The A80 and A83T are the platforms that would be affected.

So I merged the previous patch, i.e. changes to the .dtsi, but I think
we should delay this one by a release. That would give us more time to
think about it, and let users upgrade U-Boot/TF-A.

ChenYu

> ChenYu
>
> > Cheers,
> > Samuel
> >
> > [1]: https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/7576
> > [2]: https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/7575
> >
> > > So I'm for keeping things consistent and converting all users to RSB.
> > >
> > >
> > > ChenYu
> > >
> >
> > --
> > You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> > To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe@googlegroups.com.
> > To view this discussion on the web, visit https://groups.google.com/d/msgid/linux-sunxi/bc95a8d2-ebec-489c-10af-fd5a80ea1276%40sholland.org.
