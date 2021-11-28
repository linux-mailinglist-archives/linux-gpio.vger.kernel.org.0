Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4E104609DF
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Nov 2021 21:57:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354776AbhK1VBN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Nov 2021 16:01:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357945AbhK1U7M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Nov 2021 15:59:12 -0500
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com [IPv6:2607:f8b0:4864:20::a30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FD61C061746;
        Sun, 28 Nov 2021 12:54:41 -0800 (PST)
Received: by mail-vk1-xa30.google.com with SMTP id u68so9562862vke.11;
        Sun, 28 Nov 2021 12:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hD8X8qVZq4QKTN1ZTeopdiOIlClAYJmnZKU9CVsO/cs=;
        b=aQg3vtt+4H1lt0RbLFuPBMh8bth02t7Ut92OWIKW2emBz2XXNHbzvFxf+/P5VUrr97
         GDXNJQ6yUURYSpyi0lKuaoq8r5ivaD0nM+3Up/L2fbRBSOiWy1twBwURPjdOr6yRidvo
         YI909txyLgz3vvYfi9//m1Z7wiZfjoAM88zGAW4HxfCP6zqpeb9X07Su2xS37uBk4+wr
         D6DA0omN63xrdYEOOYofEOEkga/4xhoowr3EMRYWQwY+QZroTYK0HWiaIHmg++hoosCS
         zhfS/G+gBRNSUIqzXMa3D7ZXDQFpcrBElurXwgLguCI937gUXEoIul2GU9NV3GXydVBU
         bCHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hD8X8qVZq4QKTN1ZTeopdiOIlClAYJmnZKU9CVsO/cs=;
        b=J3OUJ0dG4emDmi+RqX8H0ZzHZlTz4ykORceOUqMgNLEC6/OXqs4mp+mhQNtkq6e3OZ
         KFTzkUMh5I8U2fwwA7aPUeJNl8zgFH9apOwoMpnsa/uSk2yj41/hvRa/YPjLJlexbSnr
         L4LJsTm2KnNGpbHY5swg2bu300qxUYeSeYAlHDU+Ur2ifplS/4xzQeKZ/NA0dCxO3X7l
         2o7+8mwACKbsI3NzpcZ0cD+muKO4KcgvfkveHKa2h+RoabyBjkWxiGVAQcXZVMTLb9gz
         iVHV/YLaXId5oRNk8YSmevqB+xTrBS6yF3/n3L9yf6XYl7g0BIJErR5hFuWa9Z/bTZ4d
         S1lQ==
X-Gm-Message-State: AOAM5330vBhWtZK3/HlspRcNE6UPoh/0K3VivqRtALeCtN98zhT9cenZ
        5+SBIH/1fVYcSrPcvxvY/8VwotVZ5wqdX0CUIAw=
X-Google-Smtp-Source: ABdhPJy4IAicZ4T3I0QqmFkKXJz64V93a9r3U1yEXvPSJUIQruJd7WrzOa8FDTdmvw9a/2V3TdwZq25nTnF467frhZs=
X-Received: by 2002:a1f:2b4a:: with SMTP id r71mr27341358vkr.37.1638132880735;
 Sun, 28 Nov 2021 12:54:40 -0800 (PST)
MIME-Version: 1.0
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
 <20211125211443.1150135-8-Mr.Bossman075@gmail.com> <CAOMZO5Dqo6c=4nGCOakMKG8fn=V1HA7-O26t3GmwWtD-FbZiPg@mail.gmail.com>
 <dae68360-456e-3db8-57ed-2287dc7cfd57@gmail.com>
In-Reply-To: <dae68360-456e-3db8-57ed-2287dc7cfd57@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Sun, 28 Nov 2021 17:54:30 -0300
Message-ID: <CAOMZO5Ca7j6_KOBJ1XVpx0yRvCaAH3i2Wac0jwL8HT8pxso2eA@mail.gmail.com>
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

On Sun, Nov 28, 2021 at 5:52 PM Jesse Taube <mr.bossman075@gmail.com> wrote:

> we can have multiple imxrt versions in there like the other IMX clk
> drivers, is this okay?

Yes, in i.MX we use drivers/clk/imx/clk-<soc>.c

The same pattern could be used for i.MXRT as well.
