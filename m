Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7AF211CADD
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 11:33:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728775AbfLLKcx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 05:32:53 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:36192 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728605AbfLLKcw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Dec 2019 05:32:52 -0500
Received: by mail-lf1-f65.google.com with SMTP id n12so1304673lfe.3
        for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2019 02:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VWL9+V2LMiT9o2FJLi3yEGGm0mbcqGKTZCNZjA3DyVQ=;
        b=JHNgQG4JaflzNKZS6SjnLq+BGIY0xKcrhawJ4qSCLadAe7hUlYSTTM6yg9Y3InFPme
         65GvyKU8ZgeTTvHCUQpLz3gdVifxv2sx5EB0maUrWRtmXnyQeQ2RzH4e6AwIIFn/Ocv0
         HbafD0hIdo8H/uCHiT0TBp2VElIGTB/axXoF4ZoG9VakftAWgZS11IgoT8MI8CaJ2S5P
         2tfrszsvlyNzhBe6mtgHXMJKQChMyGr5KV9reluXUNs2LuGTjNveZegBli/WGzmT/qJ3
         sLkdgkiLdb9gNFrmBa8EmK7AzxkqHOHCD9MBb052/a9h6FU3fjQSTfjAoXXWV9ze1b1q
         ZwyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VWL9+V2LMiT9o2FJLi3yEGGm0mbcqGKTZCNZjA3DyVQ=;
        b=m54eO6rQsc9pVlHU6Wrdzy8IwzOMcWMfpchUn8EJm91Qz8ZhoAE5AuKAwEhUIdE4zj
         /1ca8BCSw/mT8/xjMMTPT/0lNX0EXfdI/uBp7mrRf3jZafxlKtN9Q15Dvdk/zkF1OyCQ
         mXAJjil1Jj/Fb5I0KxhyrVf+zHp2wg32jWZ2gClWbKZGC6Ne0pGK/UyUIjkXVDDQKnyD
         27ZAgl1IqbCp5sstQbCBx0Tf8t4CmMlhkT05RZydSRG7HkxDQp79znKXXisQLHbX6bfU
         mjgxpTiBRxpEN9VoJfVra1xw3QnlusIo0TyUpU3L0Z3LtGSpbFcKJRGu3nVkfXk1IQ9i
         BHAA==
X-Gm-Message-State: APjAAAX2hN31EI2w6seIRjhHh4CFiaMEcNbAtoclfcrxgXmK5e/L7ZNk
        STSAPWrjxmU+MM3iy71K8Kzq1HG+D8ugVj3j/kVZlw==
X-Google-Smtp-Source: APXvYqywDQNwDMe4Gb7wNrl8nlViHTFAYbbKR8mGbYLzjghxmd/DxWHrpL44HVqLtiyMfWxK6a/Gv0MgTOUFix3M9V4=
X-Received: by 2002:a19:c0b:: with SMTP id 11mr5269617lfm.135.1576146770206;
 Thu, 12 Dec 2019 02:32:50 -0800 (PST)
MIME-Version: 1.0
References: <cover.1574871463.git.nishadkamdar@gmail.com> <5a7ed2e4b58ba7ff2f0638a2435a3a1e1c62c9f6.1574871463.git.nishadkamdar@gmail.com>
In-Reply-To: <5a7ed2e4b58ba7ff2f0638a2435a3a1e1c62c9f6.1574871463.git.nishadkamdar@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Dec 2019 11:32:39 +0100
Message-ID: <CACRpkdaDaM6wSfeeo6NARC0VibLMWWDDsN2LbLRooih3uGTvog@mail.gmail.com>
Subject: Re: [PATCH 4/5] pinctrl: sh-pfc: Use the correct style for SPDX
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

On Wed, Nov 27, 2019 at 5:46 PM Nishad Kamdar <nishadkamdar@gmail.com> wrote:

> This patch corrects the SPDX License Identifier style in
> header files related to Reneses Soc pinctrl driver.
> It assigns explicit block comment for the SPDX License Identifier.
>
> Changes made by using a script provided by Joe Perches here:
> https://lkml.org/lkml/2019/2/7/46.
>
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>

I leave it to Geert to decide if he wants to pick this up for
sh-pfc or not.

Yours,
Linus Walleij
