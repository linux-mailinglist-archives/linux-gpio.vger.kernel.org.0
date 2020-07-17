Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B809223D32
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 15:46:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbgGQNob (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 09:44:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726071AbgGQNo1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2020 09:44:27 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F587C061755
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 06:44:27 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id u12so6071485lff.2
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 06:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1cUJdFz7tKiJruju+faOa4LG72A7NyvpvJU3G6JjCco=;
        b=cZMposf8Bdnm371NM5sPZlM/Is0F5t0m+S9ezxyz5F0ewN5dQ4z9Gz4kV19AV/oGv7
         AHwH4yY0xZA85B8vd03RqF+47bHBNo+zh9Gn0WtV4oYw7yuzYJg94UEpD+yhv+YuCIFk
         DBN11Ba0xu3uapZyMG133CrLeSV5g0Md5zrsihIFZYDxIvcKlFifAd4KzKRbmJ8fUs13
         nW3qsfXWmjnoRjIk8xtLhgfZyupBJncmE7HMrBGg3zdfRQpIbiS/0fkEZv6YRmM10hjo
         1IDc22DAV+kyFgNesZmJCV92yMZpf8ajo9bFcrPoKc3k2puE/9sa3gjwE+Tl3cnJflBQ
         2lQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1cUJdFz7tKiJruju+faOa4LG72A7NyvpvJU3G6JjCco=;
        b=H9TwJdeFYpCfl8gz7vhYHJzCpDVJPTY1Y5NurBmys/qp3DoR1Vspgv8yriTFclHW1t
         WBVDC6rT1mKgj5JKseKbDkeGNewj03gUj7Xsvs1DNwj5vfrLT2qWf9VM4yiIjCe0Yyak
         cXB8OGINXmbE9C6l0sbRc/JvmEtfjpHzKStZcc8BZaHnVIwxXwlr1eFTDUDYmfuQt+fL
         j9JcZty1m2Zzj9elglH6dpHiAyR/VBSPJ6tfznhY8QszbIv24E94nhpOl564/Z4aTdh3
         5GqoaLYavFF0hK9ywaZLPn6BL4Nr3+MpUgySDms+jl0nLyzy7NI0RsbiHQZpnPEwD5+5
         Mq4g==
X-Gm-Message-State: AOAM530Z6dJxrjB1l4qydX4cCmVlUUZ4Sri3wlXsfUjtVbZtadlV3ex3
        Re0wTzRNhkvBfv/2munl8YgBe8/8NYKu+4cTbML+KQ==
X-Google-Smtp-Source: ABdhPJz9OaEbmRdr7tZ9xjj6gzeKrgTKyKKbHvXy2wlCBJ59h3kvRdQYhaDAYRnQwuY9xk+M8U0GuJTdEB6TDm8UksU=
X-Received: by 2002:a19:203:: with SMTP id 3mr4730864lfc.77.1594993465647;
 Fri, 17 Jul 2020 06:44:25 -0700 (PDT)
MIME-Version: 1.0
References: <1594164323-14920-1-git-send-email-Anson.Huang@nxp.com>
 <CACRpkdYP4J+MZjxWUnkM-XGaMmFFZfMCfY13r7G6r2=v3F6zQw@mail.gmail.com>
 <DB3PR0402MB39168FEA9306CBF90A596E31F5630@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <DB3PR0402MB3916FB27846F462C2210C3BFF57E0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CACRpkda2gdu8FsSM0MC6g8C1mebmVc5dFWJZwNvQUPXNi5bnkQ@mail.gmail.com>
 <DB3PR0402MB39167A4BB808A0679257DEF9F57F0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CACRpkdbCVZaHqijqMck+jLAJuCAT31HA=9wwcV_EnQc=hsXLwg@mail.gmail.com> <20200717121436.GA2953399@kroah.com>
In-Reply-To: <20200717121436.GA2953399@kroah.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 17 Jul 2020 15:44:14 +0200
Message-ID: <CACRpkdYd1g6GScFitPkf-VSn2kTmWOjUi07ZeVhZiP2=0qCUbA@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpio: mxc: Support module build
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Anson Huang <anson.huang@nxp.com>,
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
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Olof Johansson <olof@lixom.net>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Jon Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 17, 2020 at 2:14 PM Greg KH <gregkh@linuxfoundation.org> wrote:

> So moving drivers to modules is good.  If a module can be removed, even
> better, but developers should not be lazy and just flat out not try at
> all to make their code unloadable if at all possible.
>
> Does that help?

Yeah it confirms my intuitive maintenance approach: developer submits
modularization patch, I will be a bit inquisitive and "can't you attempt
to make this thing unload too" and if they conclude that that is
an unfathomable effort I will likely merge it anyway as very likely
the kernel looks better after than before provided all build and test
coverage stays the same as well.

Thanks!
Linus Walleij
