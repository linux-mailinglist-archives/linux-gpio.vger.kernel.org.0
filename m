Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A96BF4609F0
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Nov 2021 22:03:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357913AbhK1VHG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Nov 2021 16:07:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237186AbhK1VFG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Nov 2021 16:05:06 -0500
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD600C061756;
        Sun, 28 Nov 2021 13:01:49 -0800 (PST)
Received: by mail-ua1-x933.google.com with SMTP id ay21so29739725uab.12;
        Sun, 28 Nov 2021 13:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4/0Be4YdoJWrG3olK/Rdtkxl4HfF+TWIUQ8musiC5+o=;
        b=C9ZM6XWOIPWLRDmLnX8iB5K+Q89OAemIRb7G4mdMUTTTyxMxvQ+o9VJ/HI38gRYa68
         HtjcQXlde0R6vqRDS0Tn++YQiOyrogjVZTN1JRhLECsZGc8bEGgVEWXeaRsR2uc/yTz0
         0LjxJNv7NGZf6pz1DxGpR1qK1OuOBz8mWhVYQFxjCLDUJ2DHAPjt6yPA5qW13OAQ1054
         7Xu/tftqW5CTqxgRIcompK+CsA/IBVyeudJVwhCREI/ZG0ptcwbJHGtkrvWf+oj9p1xr
         lF3l3Becle1LGVz18sjXrPrG0evLCOEZahwMst+jMXqW94aC1Vk6Gid69uXKRfZKRjf+
         jwcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4/0Be4YdoJWrG3olK/Rdtkxl4HfF+TWIUQ8musiC5+o=;
        b=WCmswbt6x/ccJQP3RVRDLo9JjV4AuaUPYoIzLsSP+3qGOF2oiQMMs6pegcpVf7qgo/
         XZx1AqBQwuitV1jWQBV3yTSHhpSVcCoFlm/xDaWTxSMuC85NizG11pdk1rYAqsSGGLzZ
         k51GUvhf7UAJ19bw9ODv+SN6JqhTeltGuzXd5IROH5fPwbWoNXfusvqXQc/I9+0AK0TS
         zFyGA3J0k440IrpAD1KP/XTv63jvbQS8MCdctSiVN0V/sBHNDSYa9R8Kt+FYy8rZEipW
         p1YhyRE526+1k8wd25V78stn7xLLnn3lAFZY7nkefhdSXV2UKaR86YxqLWGwTXj6Lv8l
         D4nA==
X-Gm-Message-State: AOAM533ALOE11fwgEvVtFiiwRRW2LSCPNOdKxlXa0l/RQ7ZHFc2S+SjJ
        nKcMylu27Zfw+6ZZXSEeDMoJrximaBe3IZt6Cv4=
X-Google-Smtp-Source: ABdhPJzeuwkeOUNKv1l60vODjiUB+kSjTf1MFzRhiHgoVNc8dglgKZZM06QQhFncdAgmwuqbpybhxNs1g8eVL5sYhsc=
X-Received: by 2002:a05:6102:3588:: with SMTP id h8mr28485619vsu.7.1638133309000;
 Sun, 28 Nov 2021 13:01:49 -0800 (PST)
MIME-Version: 1.0
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
 <20211125211443.1150135-8-Mr.Bossman075@gmail.com> <CAOMZO5Dqo6c=4nGCOakMKG8fn=V1HA7-O26t3GmwWtD-FbZiPg@mail.gmail.com>
 <dae68360-456e-3db8-57ed-2287dc7cfd57@gmail.com> <CAOMZO5Ca7j6_KOBJ1XVpx0yRvCaAH3i2Wac0jwL8HT8pxso2eA@mail.gmail.com>
 <fca5e8f8-a442-c9ec-27ed-da9c8a8d8ed4@gmail.com>
In-Reply-To: <fca5e8f8-a442-c9ec-27ed-da9c8a8d8ed4@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Sun, 28 Nov 2021 18:01:38 -0300
Message-ID: <CAOMZO5AP338L_Fus7Bwiq+1-2V3jnMoikef+JvaNjTSRjU=kxw@mail.gmail.com>
Subject: Re: [PATCH v3 07/13] clk: imx: Add initial support for i.MXRT clock driver
To:     Jesse Taube <mr.bossman075@gmail.com>
Cc:     NXP Linux Team <linux-imx@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Stefan Agner <stefan@agner.ch>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>,
        Abel Vesa <abel.vesa@nxp.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Giulio Benetti <giulio.benetti@benettiengineering.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Nov 28, 2021 at 5:59 PM Jesse Taube <mr.bossman075@gmail.com> wrote:

> Uh so i should change it, or can i keep it like 'clk-imx5.c'(how it is now).
> sry for the confusion

Please name it drivers/clk/imx/clk-imxrt1050.c
