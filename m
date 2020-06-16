Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 171861FBDC9
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2020 20:17:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbgFPSQC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 14:16:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727006AbgFPSQB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jun 2020 14:16:01 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C6C2C061573
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2020 11:16:00 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id 35so3407073ple.0
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2020 11:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z1XaYlehYWut5xn5qNaNhnjCbRokX8uPbXrjUXkK3Pc=;
        b=TqAJzV9Ol2dWnzzlf/TumUPcxa0ADyk5/T1ZI5Ti2h/X2YqeauR1UhwnWMjxhAhsNC
         +VZCYHWi6RXHXRN1v43tes0wA6wOa1/JIxuwdcRwgKM/R+Q2Pf/RkRROA0EHhgkC8R7u
         miWoQb45WeLw//3BG43KjWbWbBr6Q8pzhWvT6Df875xfI7Y9tuQnPigw2rH8u5ciXPGG
         m/KuCgr/iIXJUz4t/tsOkzXL1FvhFtVlrhdG4qccFREUNVwpdrCE3/tPzlC2M6Zf4qOC
         te6U5dsN+Tsa4bV1GUP4TmKwN+0j62kq2vrJtKntbXuxbsuClM4vAMc33TIYe7mBxWbe
         LHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z1XaYlehYWut5xn5qNaNhnjCbRokX8uPbXrjUXkK3Pc=;
        b=eEdLJ8jPAvTaH2LeZ7R/9mvbQcGLBsPl44uyIfC+J6dDRczWwyb/OsUKZlxOyuA9mc
         Tea6j6YlzWWvO872oMJQhxtHbrHnGrdRBV1d6hd0axfkKV77kHMzdEVSEV4pdEmVU4Fa
         2M4t0uBmCxnyg9/0HC8BJsFBd7PjK2srlOuqJv9gHerC6jCKmt4UN9mibx+JZad6MVJ2
         lgt96yexeFVKOG1eoFb+o99Igp8A/b0/EnTMBRMoAMzsAXF0LAQ6SQZ6k4AWQkdlmhVi
         8AEymLmh0UTo7D7M8Sqb3444yNvQgeyBwMt4L2gFx0ZuSBpchT6ohtIL5mjA1Sj+7cfr
         lU1A==
X-Gm-Message-State: AOAM530O7g4rWtfM7zruUSkbR9PQ26Tib/eja0/ukFpQXg1cKcOFwRKO
        cFl3knX1NPa4HzDW/dCUEUagMWy5yTgYf4Z+o+U=
X-Google-Smtp-Source: ABdhPJyuvpcpZihgfTE4ALQk6gSSM54KpW+diJ3rfsWrP9y1YBpF/h9TAsdomfouYQmKK8RLzhAKRIzPj7bcG5YVv+A=
X-Received: by 2002:a17:90a:b30d:: with SMTP id d13mr3903755pjr.181.1592331359686;
 Tue, 16 Jun 2020 11:15:59 -0700 (PDT)
MIME-Version: 1.0
References: <1591673223-1680-1-git-send-email-haibo.chen@nxp.com> <AM6PR04MB4966D0FCE44CC173F95C139A809D0@AM6PR04MB4966.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR04MB4966D0FCE44CC173F95C139A809D0@AM6PR04MB4966.eurprd04.prod.outlook.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 16 Jun 2020 21:15:43 +0300
Message-ID: <CAHp75VdvV-tBtZKU6WKHJy+yuesaq6c=PbxCFaJuvujeWhmm-Q@mail.gmail.com>
Subject: Re: [PATCH v2] Revert "pinctrl: freescale: imx: Use 'devm_of_iomap()'
 to avoid a resource leak in case of error in 'imx_pinctrl_probe()'"
To:     Aisheng Dong <aisheng.dong@nxp.com>
Cc:     BOUGH CHEN <haibo.chen@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "christophe.jaillet@wanadoo.fr" <christophe.jaillet@wanadoo.fr>,
        "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 16, 2020 at 5:54 AM Aisheng Dong <aisheng.dong@nxp.com> wrote:

> Could you help apply this patch as it blocked MX7D booting for a while?

> > This reverts commit ba403242615c2c99e27af7984b1650771a2cc2c9.
> >
> > After commit 26d8cde5260b ("pinctrl: freescale: imx: add shared input select
> > reg support"). i.MX7D has two iomux controllers iomuxc and iomuxc-lpsr which
> > share select_input register for daisy chain settings.
> > If use 'devm_of_iomap()', when probe the iomuxc-lpsr, will call
> > devm_request_mem_region() for the region <0x30330000-0x3033ffff> for the
> > first time. Then, next time when probe the iomuxc, API
> > devm_platform_ioremap_resource() will also use the API
> > devm_request_mem_region() for the share region <0x30330000-0x3033ffff>
> > again, then cause issue, log like below:
> >
> > [    0.179561] imx7d-pinctrl 302c0000.iomuxc-lpsr: initialized IMX pinctrl
> > driver
> > [    0.191742] imx7d-pinctrl 30330000.pinctrl: can't request region for
> > resource [mem 0x30330000-0x3033ffff]
> > [    0.191842] imx7d-pinctrl: probe of 30330000.pinctrl failed with error -16

It means that shared support took a wrong approach. If something has
shared resources, another schema should be used, something like MFD
(parent device which keeps only shared resources). Easiest way is to
switch to the regmap API.

P.S. The revert is okay as a quick fix but... see above.

-- 
With Best Regards,
Andy Shevchenko
