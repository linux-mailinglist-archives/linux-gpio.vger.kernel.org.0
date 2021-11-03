Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7A1B4447C1
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Nov 2021 18:51:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230132AbhKCRyB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Nov 2021 13:54:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbhKCRyA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Nov 2021 13:54:00 -0400
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEA77C061714;
        Wed,  3 Nov 2021 10:51:23 -0700 (PDT)
Received: by mail-ua1-x92e.google.com with SMTP id b17so6091629uas.0;
        Wed, 03 Nov 2021 10:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y16TxmkBvfqZgNLIXU85g39fksG0Qn9oks7FAgvFiCM=;
        b=fPXyM8mzP3xvv8wh3rn4V3uaO87BNrn0AJ9Qk+6md27hPqHI7elIBnRFfZrMbkrB8z
         HMRAMWtnw0XtczVwAoKFJVJIdYOkvt8HQYEM8C6xTdZXiSzf4OZxmxoe6Y08fRhREPSJ
         XIWi2Lh6dvIz44V28gaJTn+LjOAiatp6weuHgHr8HN783Bom+vt60CdU1nql8hJzFwAf
         8xk0AzN3X2eOPziruIBW+zMsjC7zIG02FuAJFh5F++waTBxWkxxKZf6WCNIdprizOMbW
         Xm+0CZZTDVOgSmjSd7lFoDAmPZFRD0BUunnY1+vhJaIeWPGb9aoKk/6xNIoKE9mP9EBy
         QQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y16TxmkBvfqZgNLIXU85g39fksG0Qn9oks7FAgvFiCM=;
        b=6ed8Ak2NxFyuoGWkmmzeNtFP+9ujHdtv9ZDijobAHU4OlBvshZxm2U188Q9L5z5dK/
         fmT/ex04l0kVE2zarxz6Gk/8lG7Elfd7l2NCv//B5gEChpJnmFfKPtdFfoqrVdAln8m4
         Vdx1knm2xcNgXy7Ie0RYCeNGQa+ECDf+QyNhkWhDDtzdAl+8c5xuFWAZ0AYHNJk9BTQT
         tCrJPQf0kyw2zxNfzg01+R5xXegX0poj4npcKcgJjwlm4Qgg8DyGl8Yl8Mxa4k89YgEV
         dBiQH8zd+0AmJ+suvBt4VdJzBZ/TYADHMgH99ZORQq/Z5pVH8yItVNcCPamWLsS4mAIx
         CISA==
X-Gm-Message-State: AOAM532KKTYw+5sL9nIyLuKDlMc9GmQU6KRqXWs9JMN8H57Nx/BWTHb9
        tx2NYG0H7boJX16/FijrcDVGygK40wCcgHTwII8=
X-Google-Smtp-Source: ABdhPJx8cB1VYKTTJlveYA1FJ28sZ0zZeouC+gUZUYrWW2QvfiO2tYkKYYUUJqVe1q+ewdOqhm9/EvWuL40E8vwi7uo=
X-Received: by 2002:ab0:6ca7:: with SMTP id j7mr39236673uaa.133.1635961882870;
 Wed, 03 Nov 2021 10:51:22 -0700 (PDT)
MIME-Version: 1.0
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
 <20211102225701.98944-12-Mr.Bossman075@gmail.com> <CAOMZO5AxMXxDkNDqGJDhtepqSUxGRCWO+L=c67O==4fx66M7XQ@mail.gmail.com>
 <c1610093-95ae-68d3-57ae-93b1bc9715d7@gmail.com> <5ebe48f5-7b9c-be99-d50c-65a056084b96@benettiengineering.com>
In-Reply-To: <5ebe48f5-7b9c-be99-d50c-65a056084b96@benettiengineering.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 3 Nov 2021 14:51:12 -0300
Message-ID: <CAOMZO5DHCYaxzSASKq6Bk8ALkiQeVjPOHOyk-pKYepJFJk6oFQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/13] mmc: sdhci-esdhc-imx: Add sdhc support for
 i.MXRT series
To:     Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc:     Jesse Taube <mr.bossman075@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
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

Hi Giulio,

On Tue, Nov 2, 2021 at 8:30 PM Giulio Benetti
<giulio.benetti@benettiengineering.com> wrote:

> If we add every SoC we will end up having a long list for every device
> driver. At the moment it would be 7 parts:
> 1) imxrt1020
> 2) imxrt1024
> .
> .
> .
> 7) imxrt1170
>
> Is it ok anyway?

As this patch adds the support for imxrt1050, I would go with
"fsl,imxrt1050-usdhc" for now.
