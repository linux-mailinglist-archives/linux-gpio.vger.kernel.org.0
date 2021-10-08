Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 565CA4263D1
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Oct 2021 06:31:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbhJHEdi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Oct 2021 00:33:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:57910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229501AbhJHEdh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 8 Oct 2021 00:33:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 033DA60F3A;
        Fri,  8 Oct 2021 04:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633667503;
        bh=utkmbRIJp7j/rfAwWkG5g17O9iieLqyGctrPZuR07oU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=qAUKYUF8o2QxOtUmCJZ48ELFKpXhVoh0lmGpW/9Yrizk/L0xmbw2xWVeRq2FEcHFt
         v2CF9AVbbmsDs6U8M4mOosI6yO5gGQTNAnacbBueWdQErGMgBFJCxh+hobHhc3yP0Y
         e6bmdQi72UHTMnXyeRBAwxG0mqrluG5ekjkebg9Y2SNybbxxjg1NrcyQgz9UA4vg9T
         OTaE5JZDQO+ydlV8oOQLsM1prBeI3J/Sen6ncqrRGHWkoEpX2WogMj4zo23wl3gzzT
         RCpMBsLyR/rAOB+W0pwOG3yR9kMeKB7cqDEqP5rimbX4exKM1wSpm+9dMf4kvsk//i
         +kLtlDYUDQNFQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210928235635.1348330-6-willmcvicker@google.com>
References: <20210928235635.1348330-1-willmcvicker@google.com> <20210928235635.1348330-6-willmcvicker@google.com>
Subject: Re: [PATCH v2 05/12] clk: export __clk_lookup
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Saravana Kannan <saravanak@google.com>,
        Will McVicker <willmcvicker@google.com>,
        kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        John Stultz <john.stultz@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Will Deacon <will@kernel.org>,
        Will McVicker <willmcvicker@google.com>
Date:   Thu, 07 Oct 2021 21:31:41 -0700
Message-ID: <163366750168.2041162.10913803047304286656@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Will McVicker (2021-09-28 16:56:22)
> This symbol is needed to modularize the samsung clk drivers. It's used
> to get the clock using the clock name.
>=20
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> ---
>  drivers/clk/clk.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 65508eb89ec9..f2aa4b49adfc 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -612,6 +612,7 @@ struct clk *__clk_lookup(const char *name)
> =20
>         return !core ? NULL : core->hw->clk;
>  }
> +EXPORT_SYMBOL_GPL(__clk_lookup);

I'd prefer we deleted this API. Can you make the samsung clk driver stop
using it instead?
