Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD6EC3DB6C9
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 12:04:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238574AbhG3KEr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 06:04:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238610AbhG3KEb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jul 2021 06:04:31 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2D18C061798
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 03:04:26 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id h9so11586072ljq.8
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 03:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wtpcqQ3ttDmFKkQP8v9pbMvBJuRURUOv8GMLs8rUfJk=;
        b=l1v9nVzGgLqz7W4ef9RnUG0dQMl+2Q4Q2HZs3g9etuK+7EXeSxwZz8/ujvduqdSL6r
         AWKs3Hti/98R1fZqo9h+Iqu2dRkY00iRX4r9DKkdC7HvdxNgkYDUhsSSU8cInFPmqJaJ
         n9H2pJuYHeQm0VbNHDVp+NV51OouPmH0zHumIeaCLRXE86bYm8GXWjMoUFuznSgXTl+k
         Q45pzlFSSpjfpg1/9c746TgG1MbXYLYeX5aPhMplHounzZlUfyk0s8qlYAfMeaX/g/N6
         DzMWAXG4Ba/+VAG5FhjdQdw3PkMKsnXmJySoOZCNP5jsTaYV3SLTkjMgVNzYqGYDbhst
         ladg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wtpcqQ3ttDmFKkQP8v9pbMvBJuRURUOv8GMLs8rUfJk=;
        b=NBm4MWwnZO2b0WINOVvxJ2lNbh/2LeNDHMgUJcvi5AR65XFkn1qUFX87XduUF5DtIK
         2HsqvPKw5PJepZyAyPqnnQ1KaOoRu218xSPaAYEl/0NpgI+Zh9LKfN3pm1lbdiQL0nGv
         EKhOZv8soOXNarkckv+erMvGETbpr92a3LP2l8mhszs+zuKTPoS2CQlpleU5PhfXjHus
         OzyXRpdd5T3SKPzQ/7/vntvqIJ+Hxum8JSJbZR6a3O7C/6sbnu7cIE1BzObU1z14rtle
         oIClETxJM7ncpdL0PSdRCASZxLYAvAStZbYofjBnrh7P5MgYmqlFErB+Y73WiKLyRuSI
         MBrg==
X-Gm-Message-State: AOAM5321wKSs1I8V48J7iiX1k+vsCJg862SQUq/+6uNO6MxmaJXEvCuD
        fCzeny3C/V3vVYJ9hk02HOXNU1oEazaMCk1BNJbHEg==
X-Google-Smtp-Source: ABdhPJwX/a62UeJqkfeninnpqbYjFQzoa9t8Zz3CgdSG5KYhz2has6VC01v8PC81r6V884LKzR6q8OmBGzo5fXwtmjE=
X-Received: by 2002:a2e:7c04:: with SMTP id x4mr1139294ljc.273.1627639465112;
 Fri, 30 Jul 2021 03:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210713122513.3112941-1-festevam@gmail.com>
In-Reply-To: <20210713122513.3112941-1-festevam@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 30 Jul 2021 12:04:14 +0200
Message-ID: <CACRpkdac_D+qT+FMMmuwEXu-cqBKvgBu_5mHwgbDR4wR+fSpNg@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: imx8mn: Constify imx_pinctrl_soc_info
To:     Fabio Estevam <festevam@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 13, 2021 at 2:25 PM Fabio Estevam <festevam@gmail.com> wrote:

> The imx_pinctrl_soc_info structure content is never changed, so it can be
> declared as 'const', like it is done on all other i.MX pinctrl drivers.
>
> Make it 'const' in this driver too.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Both patches applied!

Yours,
Linus Walleij
