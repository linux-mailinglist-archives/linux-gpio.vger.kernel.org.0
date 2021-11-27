Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35F8C45FEA9
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Nov 2021 13:52:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243974AbhK0Mzy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 27 Nov 2021 07:55:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237071AbhK0Mxy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 27 Nov 2021 07:53:54 -0500
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com [IPv6:2607:f8b0:4864:20::a33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24AFFC061756;
        Sat, 27 Nov 2021 04:49:11 -0800 (PST)
Received: by mail-vk1-xa33.google.com with SMTP id 84so7701470vkc.6;
        Sat, 27 Nov 2021 04:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AhTTFdq9Ouec2Tp6O3ODQcGsU1dD+1o+XNr7Zcpuux4=;
        b=aUXDxw+wxuMfK0NN8FA5RBdWoJRuGZruR2eeUtw9vunGcBVFcz6a94bYV7441YRx4J
         YSDVawbU8r3G2qYRzqCU/7UOrnpDE8jSYZ7BORrxpOkDBiWyXln63uSXVywij0e4oZyE
         lj1F6POIHIqjc9nkAKgFL5Ma5m+fFnQIEjgGi0gbfV7XrbDHEidWN+hKDpHSjZ/ux/Bo
         ELw6MphLUtfPiAqSEZgbyU0QC6skids8eW8GsKzyoflJhPXz486/jO7VDkV5ojirizmR
         i59FBFk+VzAaa9RJ8PILqercKpdsI5QoOJDuBqod72YkgOy8RilIFiZ30bjiOuvWHI1f
         USIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AhTTFdq9Ouec2Tp6O3ODQcGsU1dD+1o+XNr7Zcpuux4=;
        b=MmoAd0ux2IeNfTrZelp+6vjTGWCvtWCPLB25tCm2gljLYZIer8iZNzCqfABsd/mzF2
         wO8gn7eovaVImsIV1pEt8ib0OER31TJUxcmte32peCoGJSHaDCLKc1VfXEagaDzMd4mo
         b9FY6ogwoViiRaB/NkFmvkMZgXxsnNSfZ9yjYwQpBi2YJel5mQFA6Zf3O6i9TxENSTx7
         ghcjociKLqzCCz5+xLupx5WFYKh1A3G7hUSFjQEbF23xvsaB204PKrNis5r0ExgAFr4I
         9LAnJ6iYzA+zR+HdsD+vYsIdlhocvngCR+VHELPLd5p0d11MlSTEgCmJrWZBmVxl5Zba
         kDzQ==
X-Gm-Message-State: AOAM530wi0xznPPFu1VJ2BLextHaLAYMn3bn5x8t8QYqYYLy9GzR42yZ
        CqcjI61sXtq/nTQkfo01EudFHrXXR97iuphWPEeO8zzj
X-Google-Smtp-Source: ABdhPJwR6Ggz9AFJAtv78Mk3+wpQfGFn/ZWsDVX2sy5m5SBxiY/eT8fXvH489Y2Xkh4JHYdHbxwV7GG3sGXn2rRmx3A=
X-Received: by 2002:a05:6122:629:: with SMTP id g9mr20722297vkp.36.1638017350280;
 Sat, 27 Nov 2021 04:49:10 -0800 (PST)
MIME-Version: 1.0
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com> <20211125211443.1150135-5-Mr.Bossman075@gmail.com>
In-Reply-To: <20211125211443.1150135-5-Mr.Bossman075@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Sat, 27 Nov 2021 09:48:59 -0300
Message-ID: <CAOMZO5Az+JJB7pokhOue+DZpKTxu3uQFkDJd7LpLgri5aLv9zg@mail.gmail.com>
Subject: Re: [PATCH v3 04/13] pinctrl: freescale: Add i.MXRT1050 pinctrl
 driver support
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
> From: Giulio Benetti <giulio.benetti@benettiengineering.com>
>
> Add the pinctrl driver support for i.MXRT1050.
>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>

Looks good:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
