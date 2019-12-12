Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAE7111CAEA
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 11:33:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728575AbfLLKdn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 05:33:43 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:40833 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728345AbfLLKdn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Dec 2019 05:33:43 -0500
Received: by mail-lf1-f66.google.com with SMTP id i23so1293607lfo.7
        for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2019 02:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qPF/yalYFBJGDvckzezeF6fnanapi0q/ha5oqUAAdfg=;
        b=bxIPBTZs+yyuk1iz9+TSeqfLyQlsmsZfby1gnoJPTupkUIIcjhzcAZV9uufsKBGZWN
         vR23FlTa/YkI85fPoHmQ4FgXSF9a7mK/nnWkW+c3Zpzt+nLzOEGOesVlVfVJPQgaGr93
         FlPWdlWae9BWBbJ15aG9wHqztZLEl0OZXoJtDEar4hhVSb8uVspdReOtPfaMBf3qojY4
         /HwPMp5fU9dpztsingagfq+N1kqlraRGZ4M2CJ34t8ohPrUd/rzGc0PZLnz01aZfCeeq
         3r4OBKGePnEbVXQ/kbKUExFUz7YRNCsM6bo5mmnQC8DmaVZ3EtsZRxS9P037JZWIDzeD
         x/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qPF/yalYFBJGDvckzezeF6fnanapi0q/ha5oqUAAdfg=;
        b=TbUFTlKt8jdi7V5XSkGt+W/CjN/FflEIa7GEDX61zBrUYi/KJyUXJ0i0ajOOsVKoPs
         IdAaUkVhFWnBKAQ5zYrrlp0V8DxLUeIM7+CO9BQl7QBd5lg4SY3qtTtHfbXsjb4tRP/f
         TToqoUaowV/GGURseB/+Q2cjm0ccxOVbq+/ElHXq+UXUyvECBvbnxMyPGAsRaFFbtcLy
         aFo0k5emhWjaCib8Kh4rLzSLEeJy+vhEngcUbnFvsxuEqnOqKwyiNBqPd7Zp4W8qW5ze
         30eulzTgkQZBYkvkD+6vY3JwUIRHxBXpYb5y3SWK6BIVUAWrLVU1lwijcTqJbspA8Dvc
         D+/g==
X-Gm-Message-State: APjAAAUGLsiQnBYcRWPLfNkoPOSYxdU+vKpl5yfDgY/V1I+kYiWfBmkU
        CfmIPmFB632yGJdtF9hOisYELsM7z0QjwKGMxlkRXw==
X-Google-Smtp-Source: APXvYqx0DF665CL99HUndMdW5PwUL0nbCGCmH0rw2D798Z4vnEevdnPuA75RWOwCG6MTgLnkPM3wqGCGL/aWEO6tMgE=
X-Received: by 2002:ac2:5c4b:: with SMTP id s11mr5064376lfp.133.1576146821960;
 Thu, 12 Dec 2019 02:33:41 -0800 (PST)
MIME-Version: 1.0
References: <cover.1574871463.git.nishadkamdar@gmail.com> <bcb86aa22d8d8499502bbd8c54a364be24886a86.1574871463.git.nishadkamdar@gmail.com>
In-Reply-To: <bcb86aa22d8d8499502bbd8c54a364be24886a86.1574871463.git.nishadkamdar@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Dec 2019 11:33:30 +0100
Message-ID: <CACRpkdYL+_bQU0PRfOFBY37O0K8W8WW0-tRM49FckA3Uh8S8WA@mail.gmail.com>
Subject: Re: [PATCH 3/5] pinctrl: meson-axg: Use the correct style for SPDX
 License Identifier
To:     Nishad Kamdar <nishadkamdar@gmail.com>
Cc:     =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joe Perches <joe@perches.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 27, 2019 at 5:44 PM Nishad Kamdar <nishadkamdar@gmail.com> wrote:

> This patch corrects the SPDX License Identifier style in
> header file related Meson axg SoC pinctrl driver.
> It assigns explicit block comment for the SPDX License Identifier.
>
> Changes made by using a script provided by Joe Perches here:
> https://lkml.org/lkml/2019/2/7/46.
>
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>

Patch applied.

Yours,
Linus Walleij
