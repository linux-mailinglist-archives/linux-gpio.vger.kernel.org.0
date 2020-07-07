Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 470D22167EE
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2020 10:02:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725825AbgGGICW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jul 2020 04:02:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726540AbgGGICV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jul 2020 04:02:21 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68F48C061755
        for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2020 01:02:21 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id z24so23921466ljn.8
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2020 01:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jtUOyKVPfoqn53IJY34j6NjtojqZ+ul+fKHV5uiQxGk=;
        b=kmiwBLiGpZZvtNTeKIU15ceN7oNeR238ooJAt0CvbsVCRioMTMtD1x4K9zbkRWKQfj
         W7RgeINwBObWyC5/fs3l+iztnAPnFlO+7+rT6TlvFxObY1g1gx3t3JQjKxE6FyUa9juo
         5N8AYr3CY5BYyDuMbcSRhA0X+wn/rOYZ8rkv5KuIj68/y3Xy1IWztOLZ/SwuJntz+jrv
         Vt9rGJw2piKJn4szUdPZwshV+vMr/O1n7q77GXP+6ZIdII0HAE3ejY83wE1+z2nQ/E+d
         7uBzrhj0+a6r2uqpZpQ5jycmEYlAqNFMZ6fT6hAcoUqpziWRbqwswmZSjiDqbSu9jA0q
         nVNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jtUOyKVPfoqn53IJY34j6NjtojqZ+ul+fKHV5uiQxGk=;
        b=cmcS1U/hm0vR8+EoMomEWUk7wU6Ajo2W0Us8evSERrCT62qsYYVztjAMaTYn9VIDRM
         GYLUlktvRYQkv6Pf/IgaX5U+1XJwy+0HNSgMnL9oCzv3Z6Zx9NcKG87Bdo+bL69dScbt
         40AOFgJowYtrQ0HF0h4nNnNLUYFgPsoqQ05S3mdiqRxccedl122oGz9tTg+5kCBqy+97
         KB0w90hxVgqyfNitiDl3NGJBVYXwW1JiFYD/7m0WjSIdlVVrp0qFmwa0z+O4wl8vGLZ7
         4ApGI1RjZ2hpRNKBlEp38Xxn/Ho4HQwaj5JcnefOmaX26dZbuZFLiruhe07yjs+Od1ny
         aONw==
X-Gm-Message-State: AOAM532pJqcLF8PlDzSJgJJitHCNv4G1WDzR8rJAxi9bgrkonUphIhRk
        x7+yIlW2TZpRcnF2L4cWgUEyakq+kEsJSliRK3rrlg==
X-Google-Smtp-Source: ABdhPJyCTsje409P42BtkQ0ytfSdmbTULZn92mJJL2yEDwiZIrlVL3eLoJyeVqyBJtF11vUkJyptRe6bOJBOKNMOG8s=
X-Received: by 2002:a2e:8046:: with SMTP id p6mr15386545ljg.100.1594108939830;
 Tue, 07 Jul 2020 01:02:19 -0700 (PDT)
MIME-Version: 1.0
References: <1592979844-18833-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1592979844-18833-1-git-send-email-Anson.Huang@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jul 2020 10:02:08 +0200
Message-ID: <CACRpkdYYJfA9uur0R+9ONkEk1pEABJnzrPe7U0VX4-QVQHgLcQ@mail.gmail.com>
Subject: Re: [PATCH V6 0/9] Support i.MX8 SoCs pinctrl drivers built as module
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Sascha Hauer <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        NXP Linux Team <Linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 24, 2020 at 8:35 AM Anson Huang <Anson.Huang@nxp.com> wrote:

> There are more and mroe requirements that SoC specific modules should be built
> as module in order to support generic kernel image, such as Android GKI concept.
>
> This patch series supports i.MX8 SoCs pinctrl drivers to be built as module,
> including i.MX8MQ/MM/MN/MP/QXP/QM/DXL SoCs, i.MX common pinctrl driver and i.MX
> SCU common pinctrl driver as still built-in.
>
> Compared to V5, the changes are as below:
>         - Keep i.MX common pinctrl libary built in, ONLY i.MX SoC pinctrl driver
>           support built as module.
>
> Anson Huang (9):
>   pinctrl: imx: Support i.MX8 SoCs pinctrl driver built as module
>   pinctrl: imx: scu: Support i.MX8 SCU SoCs pinctrl driver built as
>     module
>   pinctrl: imx8mm: Support building as module
>   pinctrl: imx8mn: Support building as module
>   pinctrl: imx8mq: Support building as module
>   pinctrl: imx8mp: Support building as module
>   pinctrl: imx8qxp: Support building as module
>   pinctrl: imx8qm: Support building as module
>   pinctrl: imx8dxl: Support building as module

Patches applied to the pinctrl devel branch for v5.9.

Yours,
Linus Walleij
