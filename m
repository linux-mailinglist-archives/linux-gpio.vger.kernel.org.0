Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F0B64609BD
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Nov 2021 21:49:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356407AbhK1Uwd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Nov 2021 15:52:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243450AbhK1Uuc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Nov 2021 15:50:32 -0500
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71304C061748;
        Sun, 28 Nov 2021 12:47:16 -0800 (PST)
Received: by mail-ua1-x92c.google.com with SMTP id o1so29741979uap.4;
        Sun, 28 Nov 2021 12:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6Giz1SwY82g/5k3rpig0B1bNAl0T39LLOyvXZ9G7668=;
        b=j9yVpxlkr92H3j8XogkkFArtyWSLj6On2TPoyYzLdK5KrdoxO2eKd6Z0AvY1ELzIlT
         Xw6AUlCFQ0qEnCsOsRq/kJXDfqq3WA7pV3WU1FFnVOyvcaX0q/jfQ2ofjQMziZcBsqYr
         vrzwZmmKmLXRa7zTmsSunVvQkBx+DJbEqHoAnSVqAADrtuCd1t91MP2H0xLFjpSTyPvG
         woIbpoPisS3x8pVGht9PZTEUWwN16zqsV0AQsGaZWUo+klR1vZc/iTAWjK1O7mrsPYTv
         ACRnR/ij6Lk4fHbwC77RAbCD2lUeEOUfXze8idiXLataBzvWB6pQjq2uebXQAc1NgngZ
         /+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6Giz1SwY82g/5k3rpig0B1bNAl0T39LLOyvXZ9G7668=;
        b=DlXoT4cWg1LjdGahtHPL7+X3+RspaeVXsql5uLPErrFxeGfzq8Kz/dxA/StCOI4whH
         u2l2zLNZlyyKnevwvpBsiLptV12eO5xUJNdCKcTUCrRKd94r6HoBMuJC5NwqUff3O7Ee
         oHC/fe79j8NJkc5L7pCItgJysKl6pu97Us08LAtCiaay/4epL0zF0+PA32gP1LZNWJX0
         vXmjKvb4Brn4tvLq8N2tvv11B96UGxMu4ZdKv5UO2we4IRW92zIHmBvh8mnBlSa0UHbf
         5ngKPimCGCC93UvAdIT9sDiuubIVw3FHi1/rdkWU0RlsqA5men53kdo8octWwqj8VjsD
         3kAA==
X-Gm-Message-State: AOAM531zqzErrgub0qouL/VS4wLtiLoTw20LzEgCWIhCF8oh2XJ7cuB6
        MoEAVz73sYg8tuBtDiYz3h5AzPoZMKb2/KGqza4=
X-Google-Smtp-Source: ABdhPJzzLRgOtej8nLnlEwtProk4Wve2g/tuNbislmc8PlVWD41K7eAX/FIlr4vGfJ4vq0VXhULX8+hk4y1B7/LqQAE=
X-Received: by 2002:a05:6102:3588:: with SMTP id h8mr28456760vsu.7.1638132435141;
 Sun, 28 Nov 2021 12:47:15 -0800 (PST)
MIME-Version: 1.0
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com> <20211125211443.1150135-10-Mr.Bossman075@gmail.com>
In-Reply-To: <20211125211443.1150135-10-Mr.Bossman075@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Sun, 28 Nov 2021 17:47:04 -0300
Message-ID: <CAOMZO5CjpRjBqj_9b17K1q7bw67XqNP5xWh2-MjWq8zMzhJVSg@mail.gmail.com>
Subject: Re: [PATCH v3 09/13] tty: serial: fsl_lpuart: add i.MXRT support
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

On Thu, Nov 25, 2021 at 6:15 PM Jesse Taube <mr.bossman075@gmail.com> wrote:
>
> From: Jesse Taube <mr.bossman075@gmail.com>
>
> Add support for i.MXRT1050's uart.
>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
