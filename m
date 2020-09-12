Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5740C26794F
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Sep 2020 11:56:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbgILJ4c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Sep 2020 05:56:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725817AbgILJ4b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Sep 2020 05:56:31 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D277C061573
        for <linux-gpio@vger.kernel.org>; Sat, 12 Sep 2020 02:56:28 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id q8so8362799lfb.6
        for <linux-gpio@vger.kernel.org>; Sat, 12 Sep 2020 02:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aXnQCOIDAF26igRuvqn750+4zYYh14IpEdhmofjxQak=;
        b=xXRX+sXQl2Yor9/vyjzNVwZpQAHrNs++yHDa5IZtmtzpkCY16gRtp2GI3dxU5ePpd8
         59gYmkXwH5sZkb50EaqC/XNyiZVtFCMasDKCaYRUARYl1wIa81aGdOuLpzE2QFioX1Up
         pdcGHCwfB1fZ+Uw6KdRt+orQ040DUUeIue0jQLgkvn6nqm3tFMjWsk1KiajGGeaCYBpB
         cdtpldn1apNnsqvIaRys6s5EkU5X2xZkSwfuTU2jSbCho634oLn93vCsPg6FReb6WNc+
         aTcGdIc9VsWIz+ShYCgBM5dRg6XI5U/9obGY1TnF3uAHXxh8CTcL2BjGLtLZgJMEASWs
         pwtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aXnQCOIDAF26igRuvqn750+4zYYh14IpEdhmofjxQak=;
        b=NiGctgrSvK8DGfNIu8ocKlbUGTGWBzj3kMZtnfUoqAQHUCca/UOpWgD+d9nJirKkp9
         iweioReRBuJeLuqDfnvypOCR54vf8efuC4xncC/T1i00nXJ6FqIhhlqfDLc0+2G46hK4
         VQc6iSAJJHNrTVInzxhHLXN/SByPGNqg9Y7QpKB4xr/FlVwiHHbpOGmuO5DJsKncWqg4
         VCmnqto6fETwe5WsMN0NrcmMvrh00nFn2IsVT9xlN6qcZjxzF3ltRV21m2vCnvUMnf+Z
         UKrjnWoXlodK72y+OFNytbfs+S6eLG3xp7H0g4h38abC9KHXzTrAy9YH4Zd3cYInJhW0
         3mLw==
X-Gm-Message-State: AOAM531nUsmcTtShpVMX1ZZcG5ztBy0ROg9jsfZSWZX2mHfR7kpiy9Hv
        HS6laSssXgSp74DuAHhMIgUJ0NGclbhzXVUmxjnQKg==
X-Google-Smtp-Source: ABdhPJzsJw+me4s6PcSBWtViiL7mpCuWNhF8Uv7+9d1J2YQfVg+ItSNv+pEIEGjGpXGcSCM2228OCGoWH5J06YkwNbs=
X-Received: by 2002:a05:6512:370b:: with SMTP id z11mr1418607lfr.571.1599904586862;
 Sat, 12 Sep 2020 02:56:26 -0700 (PDT)
MIME-Version: 1.0
References: <1595382353-17486-1-git-send-email-Anson.Huang@nxp.com>
 <CAK8P3a13gcF_+dkfxZW0u_YuJ92hY1JukWfzM+e30iM=YUhraQ@mail.gmail.com>
 <DB3PR0402MB3916F080E4912B27B18BEADEF5720@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CAK8P3a2CBYV2xEkedQYmzL4XgHPeu02=vmLffq+RWwvEvuUGKQ@mail.gmail.com>
 <DB3PR0402MB391674F67A1B9F2732883C0BF5720@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CAK8P3a0XpKnbz79dH4i7HofGgpAodtmgdBmVBVQOKfCiJMkpPw@mail.gmail.com>
 <DB3PR0402MB3916634EA84687D6C7535BC1F5720@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CAK8P3a06tu4UgTxT4q9eS4=z5AHiEWQMhk5PfZEz=4t+f26s5Q@mail.gmail.com> <DB3PR0402MB391685755C70D85A1E797C0BF52C0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
In-Reply-To: <DB3PR0402MB391685755C70D85A1E797C0BF52C0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 12 Sep 2020 11:56:16 +0200
Message-ID: <CACRpkdYN4VdNZOC5f5eAxp=6cXq25owiNW0KVKRupbEFRSANKQ@mail.gmail.com>
Subject: Re: [PATCH V2 1/4] gpio: mxc: Support module build
To:     Anson Huang <anson.huang@nxp.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Peter Chen <peter.chen@nxp.com>,
        "oleksandr.suvorov@toradex.com" <oleksandr.suvorov@toradex.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Peng Fan <peng.fan@nxp.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Olof Johansson <olof@lixom.net>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Patrice Chotard <patrice.chotard@st.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Joel Stanley <joel@jms.id.au>, Lubomir Rintel <lkundrak@v3.sk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Leo Li <leoyang.li@nxp.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "michael@walle.cc" <michael@walle.cc>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 3, 2020 at 3:31 AM Anson Huang <anson.huang@nxp.com> wrote:

> Hi, Linus
>         Do you have chance to take a look at this patch series?

I've seen there was plenty discussion about them, like this one,
so I expected a repost (didn't anything change at all?) also a rebase
on v5.9-rc1 so I do not have to deal with any merge conflicts.

Could you rebase and resend?

Yours,
Linus Walleij
