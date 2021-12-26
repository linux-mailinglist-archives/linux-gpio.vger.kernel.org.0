Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3D6547F4FF
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Dec 2021 04:20:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229748AbhLZDUZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Dec 2021 22:20:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbhLZDUY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Dec 2021 22:20:24 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2507EC061401
        for <linux-gpio@vger.kernel.org>; Sat, 25 Dec 2021 19:20:24 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id h15so6471124ljh.12
        for <linux-gpio@vger.kernel.org>; Sat, 25 Dec 2021 19:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jdSL9aVeOuoAth8IYdefiCkOwwscz9N5zIOBpWED8n4=;
        b=X0fepHUvnufOR2cUJ6TosJbTtjD6DAMn3xoqPl0CrUUgVLJ1kEVHb9UyDXPl8ugijF
         iToByT7SyQL4hTWJCnrc2Fsp5/CWEHAmi6L/jrq6rvlDplh+ZorphD4M3BRqF9tk63h4
         dMU4oMRecg+9/BgAxP71+C5Cdt0Ljw57DCwVSGEEzpaBfgNJw79SMNKTgBkaMRowaPd0
         1pp1JdALSrDTObPPeMbnj7KZzggYzkJ+HV1wgzUCpM8BGdXLLPLniIEBG1jm5fi6yl9l
         QlyPvhTG4i+fntCdGM4xnKDBU3CZr6NEd8y18dEppGmt0QkzywF144A09OCk7JBIZqm2
         9cbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jdSL9aVeOuoAth8IYdefiCkOwwscz9N5zIOBpWED8n4=;
        b=Lo3cOfvlX0oJafrWmQ3nZQjItgLVzP0F2/lGnDNd6yaFjJ3x2WMl2yt6g78Z/UNhnu
         XrQ3y6PbRda3IpI9AtHgvoskCGnDQxjbAWfny2RfF+f2A5PIVBczXmbGqqLgCNcaGadX
         JeDOyLtkRO2t1KZ6T4WrqGtoU5/iq10TBaqesTP11G3QNgmpnWCtMErUyib8jrl3jFTB
         0VFimtGoUx0v17osxLnn/S6S3mzDITbG9BiZRpIzIhHDYwbelnLJInxJC/IAHjgFRW2x
         Lll4VyPy+ULHIc2fL7oM+LqU0ho8bOYjpYnzTPwlvj2tAySxGonV5n9NYmaO6j7BHHV3
         ELBQ==
X-Gm-Message-State: AOAM532ncxykvG+7qYkj+ICFttLPdpklTZz86SNuWvD1e6Np+wa9BQIQ
        RYepa0ieDXk0JSIRG8j8U5/Xqyk17mYHHmSSxUWdyQ==
X-Google-Smtp-Source: ABdhPJx15hRL1lAP6AvgntjhwVVAxdXbFNo+p1djwIvBsgkcuwsS5cyektM2NkbVkiyIf22jOur7jXkBbMSxJ7adFFg=
X-Received: by 2002:a05:651c:623:: with SMTP id k35mr9495992lje.133.1640488822311;
 Sat, 25 Dec 2021 19:20:22 -0800 (PST)
MIME-Version: 1.0
References: <20211222212807.27122-1-zajec5@gmail.com>
In-Reply-To: <20211222212807.27122-1-zajec5@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 26 Dec 2021 04:20:10 +0100
Message-ID: <CACRpkdYg8Q79W-wH4wM3J4K10BuzZB5PKf2dnYhuwDuxEk9pzQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imx: fix allocation result check
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Abel Vesa <abel.vesa@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 22, 2021 at 10:28 PM Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>=
 wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> Fix code to check correct variable value.
>
> Reported-by: Abel Vesa <abel.vesa@nxp.com>
> Fixes: 02f117134952 ("pinctrl: imx: prepare for making "group_names" in "=
function_desc" const")
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

Patch applied!

> Linus: I'm not sure if you can rebase your tree. Treat it as separated
> patch or fixup. Depending on how to manage your repository.

Just applied it. It is usually nice to see this history.

Yours,
Linus Walleij
