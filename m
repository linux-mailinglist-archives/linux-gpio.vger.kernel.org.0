Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B2524609C6
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Nov 2021 21:52:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350807AbhK1Uzp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Nov 2021 15:55:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237186AbhK1Uxp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Nov 2021 15:53:45 -0500
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F949C061574;
        Sun, 28 Nov 2021 12:50:28 -0800 (PST)
Received: by mail-vk1-xa2a.google.com with SMTP id m16so8627225vkl.13;
        Sun, 28 Nov 2021 12:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ozjJ3S5Udm4B/OHBZ5P2O9zki+yUp9fd6WJGfyI7sV4=;
        b=jL6xsvpd7T1ANE1JqP6l3iIR2W4N08COgcswxreba+5PfVGwvMc9GxbJ5vZtkb4rdR
         mcP70bSrCUnrbWduLH+5RKI5NI8TQNZ8lgsoj1Wzgmm0UcA2ipZIUS1OKKDD+SPz5K9K
         fIYaYX/JPFDrIVE6kGBYpANehgUJwE0pdIGWSt13EKtjpnllqQLfhAGMMbwVJFDMbc55
         0clotCrmP8TpwQTnG/UygBsPcHczlGUHStQz7yQEgcIcjQO4uWxgvvR9t9pMY0rpLxwK
         b++kUHcQQMtIExbSnYMfWvSZOljhDSSoK1f2GkcgGdHreihszyT/Kuh+9cEd2g2uyXlR
         XwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ozjJ3S5Udm4B/OHBZ5P2O9zki+yUp9fd6WJGfyI7sV4=;
        b=3e2Rcx5+5mP5va/q2XxJE1kn5TIKJyudDeMOGRgGaDbMeEyNeuRTcEKyc8R4M+LMZ6
         uBG7e3el32lXsrAf4aXodQuIvnAML1dxpdapgdY313NmHo7TO/1RHLoIeLm941Vu/9+U
         535UudBH3CiVev68Htx4hEZ8A24ThmY7m2s6CtP3zwKcvX/eJrfWvnprUTdPj5bWsP+K
         aUfJxEAMy3G21ydGc7IQmmRmxP+qzO+/74bgpdO8gBl8MQZ+eU3SNmSvAcQ6590BdYlc
         94dUKtcvITZsEh2n/M1JETouhuzjkaICtN7lHGpZK/tqZWaT3T9iC7kvn71saiB5am0l
         1yaA==
X-Gm-Message-State: AOAM531K8WKdta3W/4+m5UAFUfytarRQ+Pxo8HqfJ+y60aHvmuj9QYPE
        WjhM4Ri47aPcwZPoJ5VRSZwMr7wv3mMQUvOQEj0=
X-Google-Smtp-Source: ABdhPJwqKT0SJSealzpAeOuiuzBx+Ouri6WOg7q88zgMzKFcvEBeTGHbTYv3Au3CQjhcuPQWX3A/YVR/KzwFODrXPbA=
X-Received: by 2002:a05:6122:629:: with SMTP id g9mr27480004vkp.36.1638132627271;
 Sun, 28 Nov 2021 12:50:27 -0800 (PST)
MIME-Version: 1.0
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com> <20211125211443.1150135-8-Mr.Bossman075@gmail.com>
In-Reply-To: <20211125211443.1150135-8-Mr.Bossman075@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Sun, 28 Nov 2021 17:50:16 -0300
Message-ID: <CAOMZO5Dqo6c=4nGCOakMKG8fn=V1HA7-O26t3GmwWtD-FbZiPg@mail.gmail.com>
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

On Thu, Nov 25, 2021 at 6:14 PM Jesse Taube <mr.bossman075@gmail.com> wrote:
>
> From: Jesse Taube <mr.bossman075@gmail.com>
>
> This patch adds initial clock driver support for the i.MXRT series.
>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> Suggested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> * Kconfig: Add new line
> * clk-imxrt.c: Remove unused const
> * clk-imxrt.c: Remove set parents
> * clk-imxrt.c: Use fsl,imxrt-anatop for anatop base address
> V2->V3:
> * Remove unused ANATOP_BASE_ADDR
> * Move to hw API
> * Add GPT's own clock
> * Add SEMC clocks to set muxing to CRITICAL
> ---
>  drivers/clk/imx/Kconfig     |   4 +
>  drivers/clk/imx/Makefile    |   1 +
>  drivers/clk/imx/clk-imxrt.c | 156 ++++++++++++++++++++++++++++++++++++

Wouldn't it be better to name it clk-imxrt1050.c instead?
