Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE68F4609CB
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Nov 2021 21:53:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358002AbhK1U5K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Nov 2021 15:57:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240163AbhK1UzK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Nov 2021 15:55:10 -0500
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 974EBC061748;
        Sun, 28 Nov 2021 12:51:53 -0800 (PST)
Received: by mail-ua1-x931.google.com with SMTP id a14so29849703uak.0;
        Sun, 28 Nov 2021 12:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mJdw8+B+469lEUinr7Yxatle2qjN+p5Ob+KVnBKytm4=;
        b=dsu13FhAcDiygfmSbxULHp4GEXJHqRU/YAenvG+Tf7Hz2aiMpp/AE+rnWDXLY1NAJW
         wgyfTW89QOPU3zdLqhiVSP/Sv+svFMu2mBPy6aYXpcCuGC5wXvpXejTKbvEidiYvFch6
         IGDdl/Nmp6Skz6Zq0rCuNxd8RGBWWKscG5C3sMmi0UCiPy8u3oGMD8kdz2SkvXQvoT4G
         Yni7dznjeI2jiVZ7ps7NBDG5KCwt7tlunIqH4dBqDofe2FRCazrz2W+7KpnKXQHUccoh
         ftuu9mf2t7a57InoQ3uDY9qPBPVIqK9kleBEVlOtqNyLMPX3rDzsRMWpXq/yYR+nEt+v
         QMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mJdw8+B+469lEUinr7Yxatle2qjN+p5Ob+KVnBKytm4=;
        b=wIqkuEJXPgnHhS0PBMIUJnkVFpSpaZZ2d4BgZVAzQ/ZU8JQK6rOT925q0siUkbzDwh
         NkQ2nIn/w5FTKJo2z6EXqbZVL8T1fYj9EIoSBAIfc9HdY7e2bSo3hp0zKuLDDq/jqPzU
         9BqNa1o3WRzYAmUjXgX9UrWAxlGVGZR2yF9oBUJNXpwFqsWljWlF5OmjAvGiNdhV3wst
         XE3ZC0WDsvXnINvtMW6E/lJASCnlaxzHSWHeN3A7D75RKNwFgCG09IyK9uO4MKRAwhmW
         UuA8GuT2gI5cEQNHCrUufv531dQt9cES8dmoQKBR69ezyYEmq5dVrLsz3PoX0hjk8tzE
         wknQ==
X-Gm-Message-State: AOAM531sX7jbHAaT3QihZiIbhf/ttlwAvSLpiAmjHyeJ4DmAPIbu+2bf
        Ur5DK69SQn8nG5W5VOzrFOhJ0FLajp8Lc6U7RH0=
X-Google-Smtp-Source: ABdhPJynMWaOJnX0hrkBHJUH9VWS97JL7n8UsFCkiw/NzxJUQXKpFjsZQm64YrPy9ZIE5Gxp2tLJ3pplY9uaDBQFqlQ=
X-Received: by 2002:a67:e003:: with SMTP id c3mr28621655vsl.51.1638132712814;
 Sun, 28 Nov 2021 12:51:52 -0800 (PST)
MIME-Version: 1.0
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com> <20211125211443.1150135-12-Mr.Bossman075@gmail.com>
In-Reply-To: <20211125211443.1150135-12-Mr.Bossman075@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Sun, 28 Nov 2021 17:51:42 -0300
Message-ID: <CAOMZO5A8sOJLmYWLU4BZzL=C-PnXvgDOYEodtg6sHcP7tetJkg@mail.gmail.com>
Subject: Re: [PATCH v3 11/13] mmc: sdhci-esdhc-imx: Add sdhc support for
 i.MXRT series
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
> Add support for i.MXRT1050's sdhc.
>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
