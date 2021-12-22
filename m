Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08D7247CB2B
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Dec 2021 02:58:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234937AbhLVB6O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Dec 2021 20:58:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231315AbhLVB6O (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Dec 2021 20:58:14 -0500
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C8F6C061574
        for <linux-gpio@vger.kernel.org>; Tue, 21 Dec 2021 17:58:14 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id 45-20020a9d0a30000000b0058f1a6df088so863489otg.4
        for <linux-gpio@vger.kernel.org>; Tue, 21 Dec 2021 17:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=09/XagtxaFMH2QnJ4URCSc7DC4A5u+QKkKmeEcy5fEc=;
        b=KBQJqQ3IrW024qvO3DLIxd50vlmofL6QQiA/6g4cC0hTPvHP4DJWSZCb99Hg/OcGO9
         MclocX85aybCK+xolmb/JPjoQmKndc2rtX1oQzl3U+U4jQV5NaeDjB7xBGrSOKat8eEs
         90EIvldRoNpIAJHaiU+4O/JnLRgMNBHkjIptJhjIY4qNSLjwGzjmLj/dVfA9w8gTg0vN
         QPYwaMsAw/0/VVt7dnGUvPZ44I/6yt8P8q+MbdLdTrtoumbS5DZPA/OQ6PbibZUo8dfA
         2F+BF5ew85EA+NiNvwhJC4mask+qFpMSIuXAlqU3exkcATRq+2iUPWojcdt7i/12paJq
         +RKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=09/XagtxaFMH2QnJ4URCSc7DC4A5u+QKkKmeEcy5fEc=;
        b=c/aKdHqznl41Ex3jyb1800wLo5XXgkfnT7Cm92NOH057zrAQySJJWaMnofMUf9vUDw
         6F13kXMUOOCtcPjicWF8jxKZzdskGGhgn7M89zR38vqHpB2Pf/gi5Wus+3IP5+eGpPvg
         fSnoFMJ0RJS+SYD/p8rGQXF2+zkxRmSQONhqQfquQgHvClvoYUoKo9Zux+yq0vPOE0o4
         upD+j8cFnQJMiq73HHQPFJzEzFLiSRpKbKy3RavdhHEUHSHAC4zaQOA4H/AWv61+MFFb
         CfRTmCfJ+0JrU+iyEJTqFNHDYTjlOM9jFQX24nO/NM6zphUMPC6LcI82oo+2EptanoBY
         xMHw==
X-Gm-Message-State: AOAM532Ea9tTbWtIcZIlaWmCZtv0S0J8g+Hunhh2IZ6ayQwQcj1i1cbq
        +RdHzkSjrxcK+pehYw1UR5FQ/IvBt8MB9zf51HzKcA==
X-Google-Smtp-Source: ABdhPJwUBYU2kXW+VkI99dpmJ1UOrvwMqrY+7GzDoydvX5I1wbbSfZPSH0ZFdfb2VW2EEJi8/4MHSkxcAQRRc1RmUuI=
X-Received: by 2002:a9d:ed6:: with SMTP id 80mr724527otj.35.1640138293491;
 Tue, 21 Dec 2021 17:58:13 -0800 (PST)
MIME-Version: 1.0
References: <20211216162206.8027-1-zajec5@gmail.com>
In-Reply-To: <20211216162206.8027-1-zajec5@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 22 Dec 2021 02:58:02 +0100
Message-ID: <CACRpkdbw6B0nzLHfxY4SK+zay=iLXtEJdfirbw=0+6309zLuJA@mail.gmail.com>
Subject: Re: [PATCH V2 1/4] pinctrl: imx: prepare for making "group_names" in
 "function_desc" const
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 16, 2021 at 5:22 PM Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> =
wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> The plan for "struct function_desc" is to make its "group_names"
> /double/ const. That will allow drivers to use it with static const
> data.
>
> This imx change is required to avoid:
> drivers/pinctrl/freescale/pinctrl-imx.c: In function 'imx_pinctrl_parse_f=
unctions':
> drivers/pinctrl/freescale/pinctrl-imx.c:672:24: error: assignment of read=
-only location '*(func->group_names + (sizetype)(i * 4))'
>   672 |   func->group_names[i] =3D child->name;
>       |                        ^
>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

Patches applied, let's see what happens!

Yours,
Linus Walleij
