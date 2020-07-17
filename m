Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D4DD223B5A
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 14:28:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbgGQM14 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 08:27:56 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:36472 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726056AbgGQM14 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2020 08:27:56 -0400
Received: by mail-ot1-f65.google.com with SMTP id 72so6730085otc.3;
        Fri, 17 Jul 2020 05:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XoIzcs6Z5DfYcYeHic1Jyk1ECLgTpsxiaGouClyPiV4=;
        b=dm5PgJFE+CtNdFM0vnbEnv0N/gZKrTsDpRm44T8v19FB9ZsLUUDhz1IS3Eb+C/bWea
         0j7uC9er5YOCgpOLxaAlukrC1/0JWYm0quvJmUFHoel1tcsMUg6sDy7PpfBBk4feS6z3
         3PQEsBP4yEOoOLbzBGn/jrK565DcRbR4TrLCkF4B3ag+NkJm5bt3bxnzHjd3m7gaob3Z
         Y1xfuD7FRX3rzrLPvxLEMFdUyo8nwc3EGulUOj1zgQFJfpQaGshmwJSUkygztzjRLyys
         9RHM0mc1XXlEfkDDGCKKPmhpgFcGSr0fiMeYqCcvfdHLDhDXs+Z7us/fF9tdd8tUpNSN
         Up9w==
X-Gm-Message-State: AOAM533SAYHz1syiAld8e5zdJTZLV5EUuCZfkQlV5AZ2+dEeiNoBGKDN
        h4rXJ00mhtSXPN5tsXHTgp3Wbt5dfR+04nq3bJ8=
X-Google-Smtp-Source: ABdhPJxmnmNX9v0cRDQKI/DJbGQ4cNV3TS8JV3GJ+b/tgKcEvQZggQfhJz7W3c0/d8BocVIKZ8lL/eKm+1hhGmDa8Jg=
X-Received: by 2002:a9d:1b0d:: with SMTP id l13mr8411069otl.145.1594988875136;
 Fri, 17 Jul 2020 05:27:55 -0700 (PDT)
MIME-Version: 1.0
References: <1594164323-14920-1-git-send-email-Anson.Huang@nxp.com>
 <CACRpkdYP4J+MZjxWUnkM-XGaMmFFZfMCfY13r7G6r2=v3F6zQw@mail.gmail.com>
 <DB3PR0402MB39168FEA9306CBF90A596E31F5630@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <DB3PR0402MB3916FB27846F462C2210C3BFF57E0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CACRpkda2gdu8FsSM0MC6g8C1mebmVc5dFWJZwNvQUPXNi5bnkQ@mail.gmail.com>
 <DB3PR0402MB39167A4BB808A0679257DEF9F57F0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CACRpkdbCVZaHqijqMck+jLAJuCAT31HA=9wwcV_EnQc=hsXLwg@mail.gmail.com> <20200717121436.GA2953399@kroah.com>
In-Reply-To: <20200717121436.GA2953399@kroah.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Jul 2020 14:27:43 +0200
Message-ID: <CAMuHMdWdaQ_jK1T_ErJ36pJbUUS3SFBcqQmyvtufaKha2C76Gg@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpio: mxc: Support module build
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Anson Huang <anson.huang@nxp.com>,
        John Stultz <john.stultz@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "oleksandr.suvorov@toradex.com" <oleksandr.suvorov@toradex.com>,
        Adam Ford <aford173@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Leo Li <leoyang.li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Jon Corbet <corbet@lwn.net>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Greg,

On Fri, Jul 17, 2020 at 2:14 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> Android is just finally pushing vendors to get their code upstream,
> which is a good thing to see.  And building things as a module is an
> even better thing as now it is finally allowing arm64 systems to be
> built to support more than one specific hardware platform at runtime.

Can you please stop spreading this FUD?

As I said before, Arm64 kernels have supported more than one specific
hardware platform at runtime from the beginning of the arm64 port
(assumed the needed platform support has been enabled in the kernel
 config, of course).
Even most arm32 kernels support this, since the introduction of the
CONFIG_ARCH_MULTIPLATFORM option.  In fact every recently
introduced arm32 platform is usually v7, and must conform to this.
The sole exceptions are very old platforms, and the v4/v5/v6/v7 split
due to architectural issues (the latter still support clusters of
platforms in a single kernel).

Thank you, and have a nice weekend!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
