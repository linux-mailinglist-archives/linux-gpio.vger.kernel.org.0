Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8CA026BC1A
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Sep 2020 08:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbgIPGEE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Sep 2020 02:04:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:39288 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726093AbgIPGEE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Sep 2020 02:04:04 -0400
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 257AB2220E;
        Wed, 16 Sep 2020 06:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600236243;
        bh=MGLUFXU7bgEiOq2QwCLtokuXU6KQpofMXm9tQrG1+AA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=xu9fAoLMxR+Sbne3nolGsptpoYBDPw5I5CfHKOMDdMWT0Fz/JyJVq6/ylx7FJzdOf
         x4/Kf10phhEzTQnup4DRMwW21ZWts2uITWbwa7Gj4pcZZB3kCEofefRTFqVTvzCZgB
         L02kMFOYEVDi3qDPM8ksi9I9Ys65VVf7t7YZO/r4=
Received: by mail-ed1-f46.google.com with SMTP id n22so5050347edt.4;
        Tue, 15 Sep 2020 23:04:03 -0700 (PDT)
X-Gm-Message-State: AOAM531B78Ia81StDogJYBq46fGvzRYnpYrPLmsX+50GHNX/zSGjj7B+
        wr+pSELRIO6KagrAHVA9NlNUC7EjbXLCuF8D80Q=
X-Google-Smtp-Source: ABdhPJzf7bf8D+dhy3zqQalV6k7pR+DsnqPe6uDFJBoNyVs7vkIF4YE5WM1N/PIcrsuSHlEipJiegQiLr568kZELN94=
X-Received: by 2002:a05:6402:ca7:: with SMTP id cn7mr25423402edb.143.1600236241549;
 Tue, 15 Sep 2020 23:04:01 -0700 (PDT)
MIME-Version: 1.0
References: <1600054147-29997-1-git-send-email-Anson.Huang@nxp.com>
 <1600054147-29997-2-git-send-email-Anson.Huang@nxp.com> <CAJKOXPfuz=vf9tCn8ZJ9dz2iAG_p61VvPWc9P=kp7nMy7tb6xw@mail.gmail.com>
 <DB3PR0402MB39168692AC262B7BFA21D0C0F5210@DB3PR0402MB3916.eurprd04.prod.outlook.com>
In-Reply-To: <DB3PR0402MB39168692AC262B7BFA21D0C0F5210@DB3PR0402MB3916.eurprd04.prod.outlook.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Wed, 16 Sep 2020 08:03:49 +0200
X-Gmail-Original-Message-ID: <CAJKOXPd-VZAOcezOS5-18te6OQZ53BU24su3WmAf+=Gtt8aBtw@mail.gmail.com>
Message-ID: <CAJKOXPd-VZAOcezOS5-18te6OQZ53BU24su3WmAf+=Gtt8aBtw@mail.gmail.com>
Subject: Re: [PATCH V2 RESEND 2/4] arm64: defconfig: Build in CONFIG_GPIO_MXC
 by default
To:     Anson Huang <anson.huang@nxp.com>
Cc:     "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
        "will@kernel.org" <will@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "oleksandr.suvorov@toradex.com" <oleksandr.suvorov@toradex.com>,
        Peng Fan <peng.fan@nxp.com>,
        "andreas@kemnade.info" <andreas@kemnade.info>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "olof@lixom.net" <olof@lixom.net>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "prabhakar.mahadev-lad.rj@bp.renesas.com" 
        <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "lkundrak@v3.sk" <lkundrak@v3.sk>,
        "joel@jms.id.au" <joel@jms.id.au>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        Leo Li <leoyang.li@nxp.com>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        "michael@walle.cc" <michael@walle.cc>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 16 Sep 2020 at 03:59, Anson Huang <anson.huang@nxp.com> wrote:
>
> Hi, Krzysztof
>
> > Subject: Re: [PATCH V2 RESEND 2/4] arm64: defconfig: Build in
> > CONFIG_GPIO_MXC by default
> >
> > On Mon, 14 Sep 2020 at 05:36, Anson Huang <Anson.Huang@nxp.com>
> > wrote:
> > >
> > > i.MX GPIO is NOT default enabled now, so select CONFIG_GPIO_MXC as
> > > built-in manually.
> >
> > Maybe it should stay not enabled? Please explain in commit msg why it should
> > be enabled.
>
> The CONFIG_GPIO_MXC is necessary for all the i.MX SoCs, as it provides the basic
> function of GPIO pin operations and IRQ operations, it is enabled by default previously
> with " def_bool y " in Kconfig, now it is changed to tristate, so it should be explicitly
> enabled in defconfig to make sure it does NOT break any existing functions, that is
> why I list " i.MX GPIO is NOT default enabled now, so select CONFIG_GPIO_MXC as
> built-in manually " in commit msg, it aims to NOT change any previous behaviors.

Sure, I was just saying that all this should be in commit msg. The
commit should explain why it is there in the Linux kernel.

Best regards,
Krzysztof
