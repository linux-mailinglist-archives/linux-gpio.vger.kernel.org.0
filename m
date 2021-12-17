Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A04064787E8
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Dec 2021 10:40:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234444AbhLQJke (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Dec 2021 04:40:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231424AbhLQJke (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Dec 2021 04:40:34 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5A1BC061574
        for <linux-gpio@vger.kernel.org>; Fri, 17 Dec 2021 01:40:33 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id t5so5736864edd.0
        for <linux-gpio@vger.kernel.org>; Fri, 17 Dec 2021 01:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jvbbAck9N/PFqEV4NFWYkmFJEYNao5P+mcqzcBaX50A=;
        b=hzmsYZ2Hydx+TDV3t/yVQTDCT1zqlHRpw2pvbeRPk91QsrmDfka962V8eM014UtYeU
         skcctsVRkPvdmv9IP57OY3ebByf2RufL/Asmg/kIJ1E4Ud6vOqi2PlxifJGbNoD7Qvca
         5hj8Ju1PawICQHTMbXYAeEYBkKniOomR6+zcl/UjLFYHE58EKPPJaHHlMgw9pEwImLsr
         xr1/TqMPylo6g2zx/5jtEdovYgQsDaVXJwlayYMMhUeTPKttr0HSHMG32Tb9dYRBAJHN
         HPot2tvquAyiEP4OvKumwZkhZEXw2eeBJQ/BfmcWSwGFJjM6343C/hmfKH+H0mikSPav
         dC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jvbbAck9N/PFqEV4NFWYkmFJEYNao5P+mcqzcBaX50A=;
        b=BwZwIY+f983r0wE16LOGuSJL/evHAVgrdNz9vDGj1fvrPhJNWAAhA0+ZknMihosRvj
         6eTX+IHtvbYo/Niiz9i1DCs6E1/HZ7VXeZ+YZzgz1GpyRYCTqAnteEGAzzt7BN0Ytu2m
         dpy5YHSQOmStBMUgc3BfE0LLT75PuFs5InA9khZjBGShIO01wvhZBPlXaJdMz0wX83Pq
         hiDDbZqgvRceVxgH9a2wBL8De3fBMrIYF4Ys7ne1Lfu5X5V71cYNJgQq081u12V0TaJd
         gMbrENmrLK4HiWTFKAOZMaWL5O3jRMU73/pm9xj/mV6khP5YclMGrHhURGaeQfHt1EJr
         4hxQ==
X-Gm-Message-State: AOAM5322r/+BvHSemlKeBJPAiJ0Qb8eMWhnA75gu7V091HEQOzLh8EMI
        ylRFZTVq9sbHEBHeO7nkCPezFgC4WXKbhsrnBu4=
X-Google-Smtp-Source: ABdhPJw1k+5VlFSe0HI7DK32ofzFELgd2rozwhZ4k+y8Q2H70zgQVFRUbXniimfb01TzZE/ORGbQnqM4DEBGoWqhZdo=
X-Received: by 2002:a17:906:3ed0:: with SMTP id d16mr1829819ejj.636.1639734032356;
 Fri, 17 Dec 2021 01:40:32 -0800 (PST)
MIME-Version: 1.0
References: <20211216162206.8027-1-zajec5@gmail.com>
In-Reply-To: <20211216162206.8027-1-zajec5@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 17 Dec 2021 11:39:56 +0200
Message-ID: <CAHp75VfsEEccJk48=2Te5WWxeBJ--MTYN4MWeE1-M_oopRGNJA@mail.gmail.com>
Subject: Re: [PATCH V2 1/4] pinctrl: imx: prepare for making "group_names" in
 "function_desc" const
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 17, 2021 at 1:54 AM Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> =
wrote:
>
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> The plan for "struct function_desc" is to make its "group_names"
> /double/ const. That will allow drivers to use it with static const
> data.

Good plan, I support it!

> This imx change is required to avoid:
> drivers/pinctrl/freescale/pinctrl-imx.c: In function 'imx_pinctrl_parse_f=
unctions':
> drivers/pinctrl/freescale/pinctrl-imx.c:672:24: error: assignment of read=
-only location '*(func->group_names + (sizetype)(i * 4))'
>   672 |   func->group_names[i] =3D child->name;
>       |                        ^

--=20
With Best Regards,
Andy Shevchenko
