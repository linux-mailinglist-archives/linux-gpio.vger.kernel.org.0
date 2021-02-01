Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B325E30A6E7
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Feb 2021 12:55:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbhBALyw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Feb 2021 06:54:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbhBALyq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Feb 2021 06:54:46 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14D14C061756
        for <linux-gpio@vger.kernel.org>; Mon,  1 Feb 2021 03:54:06 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id l12so16268416wry.2
        for <linux-gpio@vger.kernel.org>; Mon, 01 Feb 2021 03:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XjOJa7QlABs/occ5tZpsqKRne/eoSWruqT/Ed+n9su0=;
        b=n8PaiSzGu2DeLewHVdD3N5UTF2mZcDgBcIuFWGB6OD8oOXVsLxmx2n5AGgBgP2W3h2
         BbxCO77dDysoWLSsdfqAHnsEjaRveFs5ez+SPGU8Y3pFUz/sElF76VVmsKfPcTpFis39
         CkbFtxCcOU9HXyoHukyU/0NFvyFyxtKkWYfac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XjOJa7QlABs/occ5tZpsqKRne/eoSWruqT/Ed+n9su0=;
        b=SGuKkqOWwBvS2fuss2q+6++DgfRhzcMsPU5EWO7cEDtzqedmYryVjN9pRzWM718UEM
         4+FnTsZuAxGvkk+gGhuVJubJ3a+2H1+/SpPAtP+uS1Jh1qTvFc3Nh+E9cPXa2NCjMIoK
         Q/mTImSR7oR5lPFiBDyp1PX5Sfh1R/6Q1BoaeTScp1eYEaua2gR1HerF4qXdBfK/b1Si
         iv+71BH+xEUOKZCmNZM5DrYcS1kVotxs8caPyETkRUGvADPbZi0Nt4WWYcQwlfFlmENI
         YZByX+kuNdNOQkNuq2pbBEWQi5oAur93IU/3awk/pd2HSv+4Up5Vc72z6vOWaVLg732d
         YanA==
X-Gm-Message-State: AOAM530Ys+l6SZOr9qb9ujwXFo0mLR+UwBWhJKSS+hc4ybmAQ0RJ6LO8
        0Pz7ZQsfSaDYzSH2V8QL/jzeo0xLkHoGm6N2W3HpzZy6F61smQ==
X-Google-Smtp-Source: ABdhPJz5ftVYH+BAeT1wbNi+TIqy/F8+dN/r1U+PPd7RakebXcOpaXNF8InVz1DFIv8HE/3hOiUEMJvNLw2Sf3eRUgo=
X-Received: by 2002:a5d:654f:: with SMTP id z15mr17808025wrv.46.1612180444701;
 Mon, 01 Feb 2021 03:54:04 -0800 (PST)
MIME-Version: 1.0
References: <20210130082128.3778939-1-michael@amarulasolutions.com> <CAOMZO5DyKDj_RjHM-qwcU9gcuROL6OYzDj3a_fdRRqCwOxWcdw@mail.gmail.com>
In-Reply-To: <CAOMZO5DyKDj_RjHM-qwcU9gcuROL6OYzDj3a_fdRRqCwOxWcdw@mail.gmail.com>
From:   Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date:   Mon, 1 Feb 2021 12:53:53 +0100
Message-ID: <CAOf5uwmSR1MjGdFd2ShHWchrdL6Kxo1HJOys9JoVP1vCDX57Lw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Support pin that does not support configuration option
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Fabio

On Mon, Feb 1, 2021 at 12:47 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Michael,
>
> On Sat, Jan 30, 2021 at 5:21 AM Michael Trimarchi
> <michael@amarulasolutions.com> wrote:
> >
> > Some of the iMX25 pins have not an associated configuration register so
> > when they are configured the standard way through the device tree the
> > kernel complains with:
> >
> > imx25-pinctrl 43fac000.iomuxc: Pin(MX25_PAD_EXT_ARMCLK) does not support
> > config function
>
> Could you please share your device tree that causes this warning?
>
> Shouldn't you pass 0x80000000 in the devicetree for this pad then?
>
> 0x80000000 means that the kernel should not touch the PAD_CTL register
> and use the default configuration from the bootloader/POR.

arch/arm/boot/dts/imx25-lisa.dts:
MX25_PAD_EXT_ARMCLK__GPIO_3_15  0x80000000

The problem that exists pad that can be muxed but not configured

Michael


-- 
Michael Nazzareno Trimarchi
Amarula Solutions BV
COO Co-Founder
Cruquiuskade 47 Amsterdam 1018 AM NL
T. +31(0)851119172
M. +39(0)3479132170
[`as] https://www.amarulasolutions.com
