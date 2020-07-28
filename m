Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E134A2304F4
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jul 2020 10:09:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726990AbgG1IJq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jul 2020 04:09:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbgG1IJq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jul 2020 04:09:46 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FFA6C0619D2
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jul 2020 01:09:46 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id h19so20120451ljg.13
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jul 2020 01:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=refqiK2IWlQ3mOTyFeqnVmB/kSEzmm9CW2c4TQojIKs=;
        b=WfCuIF+N2NmU60NsCa/JwDfZ/2Nv3VdLtl+PsjLet0Nzca6wYbZhf3KLfYAcH+yG6N
         LaR9+097mHxfUn8gn7Be8CFNnGBmtnA/zxEpDJV/ocsagkHix4jVu3EVG6FrI64jWHYI
         M+PzasI6lq60ee4UopcVSOqHZ2rmhBcou1LSLGPdsYSqBNegBgB1DWqpolUEmgNk0ju4
         CBCGJrhfdr5TCA4JVBROBndTQtCW+wqbRJegLmMyk5uVj7QvYvbvRVhkOWcs5kLLW5ui
         HOqodhXVOpi6VXsxgX/17k48jouG1wJLBMVXy14roEsN2uWmc+DdP+Mq7Tr986xY3Y5I
         qdWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=refqiK2IWlQ3mOTyFeqnVmB/kSEzmm9CW2c4TQojIKs=;
        b=iOaOuyHSEFDjnF2p9VUk8H2aLLLMdjvXtPmpheWbdNbbd4VP83POIFIsFcSc33J1Ry
         Puapv047friuGKbHQTwDsQ2RupfWRmQCT8HTk2Tp8dorLuzsKQltaML3V4eNRNJA83vW
         Ewa5m8DYYOMk32D5apU9DKviRKskGS5l6HXxwmHoEly2/DqUwovXMsx9dXNRzGKA4TcK
         6e4alAlx2dksqximPIHYzpeh05WlNE0ePSG+YSaauGDzQ4cq+MJVeGK/emBdVMTHyjoY
         ZbkUjHoBg+tW19YOcavbOeigsLB5p4Ixmz25BXmqIFfXnszzNQQuHo54hBcG4K7w31Ts
         XLnQ==
X-Gm-Message-State: AOAM5326EdISpKhK54KjM3Z+zWZppdsREfkq7dXWxhd9UvF+hPRBRgpM
        SzPEkJFCs7mpi/iPHg/WtPQQY8yhBK54yxLyJ7qeOQ==
X-Google-Smtp-Source: ABdhPJztqYIekifUAkogxvmP6cFAfSb8mD1OJ06MuDN7GJEQY/Tvu7YCiuhZGtOCnc4NehwkSNKZYCHWWEIIOHWVZ8w=
X-Received: by 2002:a05:651c:1291:: with SMTP id 17mr12792312ljc.286.1595923784397;
 Tue, 28 Jul 2020 01:09:44 -0700 (PDT)
MIME-Version: 1.0
References: <1595382353-17486-1-git-send-email-Anson.Huang@nxp.com>
 <CAK8P3a13gcF_+dkfxZW0u_YuJ92hY1JukWfzM+e30iM=YUhraQ@mail.gmail.com>
 <DB3PR0402MB3916F080E4912B27B18BEADEF5720@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CAK8P3a2CBYV2xEkedQYmzL4XgHPeu02=vmLffq+RWwvEvuUGKQ@mail.gmail.com>
 <DB3PR0402MB391674F67A1B9F2732883C0BF5720@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CAK8P3a0XpKnbz79dH4i7HofGgpAodtmgdBmVBVQOKfCiJMkpPw@mail.gmail.com>
In-Reply-To: <CAK8P3a0XpKnbz79dH4i7HofGgpAodtmgdBmVBVQOKfCiJMkpPw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Jul 2020 10:09:33 +0200
Message-ID: <CACRpkdb4CCNYtMpPOAB6hF8gSCHa4NtpO8TzH0pVEuh-Spe44w@mail.gmail.com>
Subject: Re: [PATCH V2 1/4] gpio: mxc: Support module build
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Anson Huang <anson.huang@nxp.com>,
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

On Mon, Jul 27, 2020 at 1:57 PM Arnd Bergmann <arnd@arndb.de> wrote:

> Overall, my feeling is that making sure all drivers that depend on the pinctrl
> driver can deal with deferred probing is a prerequisite before this can be
> made a loadable module itself (same for clk, irqchip, etc drivers that others
> may rely on).
>
> I understand that your primary motivation is to fit into Google's GKI framework,
> but I think that doing the conversion only partially would neither serve to
> improve the kernel nor actually meet the GKI requirements.

This has been my worry as well when it comes to these GKI-initiated
patches that are flying right now.

> Most pinctrl drivers are currently always built-in to work around the
> load order dependencies. This of course is a bit of a hack and we'd be
> better off if all drivers managed to avoid the dependencies, but this
> can also require a lot of work.

Several people have argued that it is reasonable to cut corners to
achieve the "greater good" of GKI.

I try to handle it on a "does the kernel look better after than
before" basis, while pushing gently for at least trying to
properly modularize the whole thing. It can become pretty hard
to test I think. If it is things like GPIO expanders on I2C
that can be used by several SoCs I would be more hard on
this, on a single SoC not as much.

One discussion thread got inflamed because of ARM vs x86
discussions "x86 is better modularized" which is something I want
to avoid, it is easy to be modularized when your irqs, clocks,
regulators and pins are handled by the BIOS. This is a SoC
problem and x86 SoCs with no BIOS, RISCV, ARM and whatever
doesn't have a fix-it-all-BIOS have this problem. :/

Yours,
Linus Walleij
