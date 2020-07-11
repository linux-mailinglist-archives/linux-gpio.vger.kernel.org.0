Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A402A21C660
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2020 23:17:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbgGKVR5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 11 Jul 2020 17:17:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726281AbgGKVR5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 11 Jul 2020 17:17:57 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3B91C08C5DD
        for <linux-gpio@vger.kernel.org>; Sat, 11 Jul 2020 14:17:56 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id r19so10353494ljn.12
        for <linux-gpio@vger.kernel.org>; Sat, 11 Jul 2020 14:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wqb18s+NYtJBD4ijNg7d8R2/EPoJeQ86xG7wEDLp5I0=;
        b=UqNakKmZZ125zE7aCrUB/FRrke2hYX8bYIK72Azll6JhZ9g46WilSX2lPkVONVzkUn
         38oy1jIZbRqpBJqkOD51aYCJmb4Q4ElI2SAzJzDx2C0I0q7XCi1+zbT/MjHXnpnjHz+B
         lGug/VLskaWGmyA3bbZaudgCg2sieCTvxiamZDlgPXJDizun+WoNnsonxdYKxE4AT229
         FcWc98rUvcWF3JXBq/Gwr55pydfM5BitCAzvjIymtpl+dfRDYQtrsmnHsEKEM1/bein5
         iuAgSGLetrR08XSBvlJGEFzCLZo4AwNPGS2Wh3mZEJP/crq5RsZ3dA1A75XozhvnO5ES
         yJrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wqb18s+NYtJBD4ijNg7d8R2/EPoJeQ86xG7wEDLp5I0=;
        b=SWLX3hZfEErxlCSDBsW3/HJGMZn2t8KjarPqd4Mq1AN0BEjJY+aU7Q5pJMabKWUuQb
         EW+ZozIZZjR5vKmbwzYFqFkZPJyQF5tE1LvM3wbHMnh1xsQ1GCAX0VKfjuwrqYCyJQ1i
         M7Jxj8IyRndDJrq9TI+A48mZiX3+th2l6/+U8TxP8hK7TT96EGbp8d3uQN5LTmfANsEK
         cL4O5+hKoapxqNMlTiK8DgwJCPmQx0D8G5x6sIkfAqfBDHspXLyRfKn6hpGoC9t7SJc1
         hkSQvk+yH1MrBl4hYeTkzSRkIkTFmEITY3NdvGtqRRT7xvWMH2DWZzoKvXmOpoeu9jV7
         9WgA==
X-Gm-Message-State: AOAM533jZrEQuK9tEFHlhwogsqXQLAvnGdegfJcCyPojnv1hYrr1MLK/
        9zYjMYVaZMjjlGEth2qGRcsNTJWgUwrz716axNkIsw==
X-Google-Smtp-Source: ABdhPJxTb9eukJ235AFc+OGGaO7D1n9aCXDniaL1t98L7aPdbqsBZfzXdMGSsKdhxtpjBTSzm37thnqZs2YYXtskJPc=
X-Received: by 2002:a2e:8597:: with SMTP id b23mr27400495lji.338.1594502275360;
 Sat, 11 Jul 2020 14:17:55 -0700 (PDT)
MIME-Version: 1.0
References: <1594164323-14920-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1594164323-14920-1-git-send-email-Anson.Huang@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 11 Jul 2020 23:17:44 +0200
Message-ID: <CACRpkdYP4J+MZjxWUnkM-XGaMmFFZfMCfY13r7G6r2=v3F6zQw@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpio: mxc: Support module build
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     Russell King <linux@armlinux.org.uk>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        oleksandr.suvorov@toradex.com, Adam Ford <aford173@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        hverkuil-cisco@xs4all.nl,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Leo Li <leoyang.li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Olof Johansson <olof@lixom.net>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        NXP Linux Team <Linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 8, 2020 at 1:28 AM Anson Huang <Anson.Huang@nxp.com> wrote:

>  subsys_initcall(gpio_mxc_init);
> +
> +MODULE_AUTHOR("Shawn Guo <shawn.guo@linaro.org>");
> +MODULE_DESCRIPTION("i.MX GPIO Driver");
> +MODULE_LICENSE("GPL");

You are making this modualrizable but keeping the subsys_initcall(),
which doesn't make very much sense. It is obviously not necessary
to do this probe at subsys_initcall() time, right?

Take this opportunity to convert the driver to use
module_platform_driver() as well.

Yours,
Linus Walleij
