Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADB0E2F475D
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Jan 2021 10:18:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727702AbhAMJRq convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Wed, 13 Jan 2021 04:17:46 -0500
Received: from mail-lf1-f51.google.com ([209.85.167.51]:39920 "EHLO
        mail-lf1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727527AbhAMJRm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Jan 2021 04:17:42 -0500
Received: by mail-lf1-f51.google.com with SMTP id a12so1703483lfl.6;
        Wed, 13 Jan 2021 01:17:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PL83MRTZmSl5in+hjwvHUEdnS7fuD7aTllMQF6TPQJw=;
        b=To2PeUjCYja5GfpSI5cn2aPh0tn3r5X2Uro2mtMGtDuKZiVqooEivUKHtgyplplANi
         jOwNTAGj2Dl3Dei4iH0t4EsGO37+Mn7KkF50U3RJTcLDi7FpUtALqhi6kSTjEOSNMYB4
         NnsvmvPT64QlZgJtZGMsedr5aQ0U/NRVBo4T9f5VexJ50qTpqkXkCWv0uPHU41QIUsXx
         W3PvDn5Uq09nosUFjbmjkMy1HSCgDbKLAGn1uv0fnyxa2id2cBPVhNusVn5HITtDmm0D
         CuVt+Bj19rZQ/HDuy2AWISBoxxsShniK2F4+n9h8NaCNCd701KwDx9oT8kxVr24YBYFI
         vLCA==
X-Gm-Message-State: AOAM5301FXWPum0hqHklIp8a1Ue4AUBZuEmRV5ZLkk8jWqZdNSHWCzOk
        ujf+udmF8PtONvDhIfj7eGr5FiaDbSejUg==
X-Google-Smtp-Source: ABdhPJxMs8TGw/WO/U6CBuzxxYeCb6wQJSZv+knK+N/KsCy1J9DWa22BPpVXxArcWcE95V5xJKQUOA==
X-Received: by 2002:ac2:498f:: with SMTP id f15mr489815lfl.60.1610529419373;
        Wed, 13 Jan 2021 01:16:59 -0800 (PST)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id f7sm122179ljk.4.2021.01.13.01.16.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jan 2021 01:16:58 -0800 (PST)
Received: by mail-lf1-f54.google.com with SMTP id m25so1667861lfc.11;
        Wed, 13 Jan 2021 01:16:58 -0800 (PST)
X-Received: by 2002:ac2:5979:: with SMTP id h25mr453376lfp.57.1610529418335;
 Wed, 13 Jan 2021 01:16:58 -0800 (PST)
MIME-Version: 1.0
References: <20210103100007.32867-1-samuel@sholland.org> <20210103100007.32867-5-samuel@sholland.org>
 <a6c2eac4-7e98-ecb4-ee8a-d67a7f1b6871@arm.com> <20210106110643.agq3mjyhgvg3w4i6@gilmour>
 <CAGb2v64mcLogZax8vVJJxG9feBzmGc8VyazTvp7XkBAoLXw9JA@mail.gmail.com> <bc95a8d2-ebec-489c-10af-fd5a80ea1276@sholland.org>
In-Reply-To: <bc95a8d2-ebec-489c-10af-fd5a80ea1276@sholland.org>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Wed, 13 Jan 2021 17:16:46 +0800
X-Gmail-Original-Message-ID: <CAGb2v679L8fDbaE6dpEdo2q=fJdF=e6AfzOXvHLBuwZ_5YbDeQ@mail.gmail.com>
Message-ID: <CAGb2v679L8fDbaE6dpEdo2q=fJdF=e6AfzOXvHLBuwZ_5YbDeQ@mail.gmail.com>
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

On Thu, Jan 7, 2021 at 6:27 PM Samuel Holland <samuel@sholland.org> wrote:
>
> On 1/6/21 5:38 AM, Chen-Yu Tsai wrote:
> > On Wed, Jan 6, 2021 at 7:06 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >>
> >> On Mon, Jan 04, 2021 at 10:54:19AM +0000, André Przywara wrote:
> >>> On 03/01/2021 10:00, Samuel Holland wrote:
> >>>> On boards where the only peripheral connected to PL0/PL1 is an X-Powers
> >>>> PMIC, configure the connection to use the RSB bus rather than the I2C
> >>>> bus. Compared to the I2C controller that shares the pins, the RSB
> >>>> controller allows a higher bus frequency, and it is more CPU-efficient.
> >>>
> >>> But is it really necessary to change the DTs for those boards in this
> >>> way? It means those newer DTs now become incompatible with older
> >>> kernels, and I don't know if those reasons above really justify this.
> >>>
> >>> I understand that we officially don't care about "newer DTs on older
> >>> kernels", but do we really need to break this deliberately, for no
> >>> pressing reasons?
> >>>
> >>> P.S. I am fine with supporting RSB on H6, and even using it on new DTs,
> >>> just want to avoid breaking existing ones.
> >>
> >> Doing so would also introduce some inconsistencies, one more thing to
> >> consider during reviews, and would require more testing effort.
> >>
> >> I'm not sure that stretching our - already fairly sparse - resources
> >> thin would be very wise here, especially for something that we don't
> >> have to do and for a setup that isn't really used that much.
> >
> > As soon as some software component starts running RSB, (which I assume
> > is what Samuel is planning to do in Crust?), there's a chance that it
> > doesn't switch the chip back to I2C. And then Linux won't be able to
> > access it.
>
> Crust can handle either way via a config option, which currently
> defaults to I2C for H6. It must use the same selection as Linux, not
> only because of the PMIC mode, but also because of the pinctrl.

Could Crust be made to also handle pinctrl?

> TF-A is already converted to use RSB[1], and it does switch the PMIC
> back to I2C before handing off to U-Boot[2]. So new TF-A + old Linux is
> fine. However, Linux currently does not switch the PMIC back. So the
> most likely problem from this patch is that, with new Linux + old TF-A,
> TF-A will be unable to power down the board or access regulators after
> an SoC reset.
>
> I expect there will be a TF-A release between now and when 5.12 hits
> stable, but people tend not upgrade their U-Boot/TF-A very often.
>
> We could solve this by having the Linux RSB driver switch all child
> devices back to I2C in .shutdown, or by dropping this patch and only
> using RSB for new boards (which would also address Andre's concern).

This will work for most cases, except in a kernel panic or IIRC direct
reboot using sysrq. So it's not robust as we'd like it to be.

ChenYu

> Cheers,
> Samuel
>
> [1]: https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/7576
> [2]: https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/7575
>
> > So I'm for keeping things consistent and converting all users to RSB.
> >
> >
> > ChenYu
> >
>
> --
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe@googlegroups.com.
> To view this discussion on the web, visit https://groups.google.com/d/msgid/linux-sunxi/bc95a8d2-ebec-489c-10af-fd5a80ea1276%40sholland.org.
