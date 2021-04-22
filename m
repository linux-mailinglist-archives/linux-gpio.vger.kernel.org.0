Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B107367605
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Apr 2021 02:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235233AbhDVAEX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Apr 2021 20:04:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235055AbhDVAEX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Apr 2021 20:04:23 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D71CC06138A
        for <linux-gpio@vger.kernel.org>; Wed, 21 Apr 2021 17:03:49 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id b38so8583981ljf.5
        for <linux-gpio@vger.kernel.org>; Wed, 21 Apr 2021 17:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U1QwnFjwg+qiruvAOg6+zinx5rvS8M0pyF4i2GcVAmE=;
        b=orTnhf36GXirDCeVsiypbssXe5rFZB36xmmZJdK17QMOApGwcOrDsxs6j36DBTUHff
         BE+ipnCRL9NPi9dNUfOdrK6qHu9253lpggD13jhZKs5t7AjevxncOfAkjMPBSvAItOmM
         Zq21BSOAamOfx4J0+8wXkoT5sG0rYl31F1wn0u/NeNAAHWJOcDtm6WTGOU9EYqafd0sg
         IMTdA021DCeMaOsnDfggJvS8TgYKqbvSW0CrllZU5qsJKLjWvhvu0lLmU91P/dvGz8JX
         D/csxW5ZtVlRJd2rLXcrYuJrBYqbwe4NBuyCoRLLM8swQHR9F7oRr3DDCX/drUz1c9KR
         w6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U1QwnFjwg+qiruvAOg6+zinx5rvS8M0pyF4i2GcVAmE=;
        b=YAFgtlitFPVELwEg+iQdrMqPNKRtFeuP6JGuta9lDpAE2GTRCLF8L66ahC8pDbqumj
         LlYQQC/bFt4ANKiy3X/FIZWNzdbi5t+4qkxoH4rrG2rZcuyROILvH/NmjamxOn37dUy3
         dnNuZqnMcgQN3Mlusn0+Qc2/mOwFYsuwUVq5mGszsSUSeBOzdqJqqcrQ5zueHxswSfqU
         Sr2F4kcjGB185YmRce3WUq27yuqLLn5VzpEW/WREshwKQ0uhcA/6VYCAgdPKn/SmjvW1
         6hPkrAJCJ9bG9CAGLCGZxg/zCOuP8UEXVddebYMxUgHIGp4X1mEpXyDQybXMQ0UdnByx
         fFTg==
X-Gm-Message-State: AOAM531nMqBiNyFNC6A3jrSzWODnhBCfbMH4eHJys3LZzFn2FWKfd9xt
        PzWX1CLK6D7GmJVqGhaZ2b3HNVyEe24Jpca4KiXp0g==
X-Google-Smtp-Source: ABdhPJw07ibiZOQbsV404TdA6gZ4rmjnOIj6eSTd1OEVtUlqJBSjowl8qj6pES3zVtQAjnNOKDjShDZ5vjjxK6szcMg=
X-Received: by 2002:a2e:9cb:: with SMTP id 194mr530280ljj.438.1619049828194;
 Wed, 21 Apr 2021 17:03:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210412140741.39946-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210412140741.39946-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 22 Apr 2021 02:03:37 +0200
Message-ID: <CACRpkdbGsnkFa13O2pPSQaSR3aCZa=iXC19MNgv8is4-Wc3BxA@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] pinctrl: Keep enum pin_config_param ordered by name
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Drew Fustini <drew@beagleboard.org>,
        Tony Lindgren <tony@atomide.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Thierry Reding <treding@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Daniel Mack <daniel@zonque.org>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 12, 2021 at 4:07 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> It seems the ordering is by name. Keep it that way.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patches applied, nice spring cleaning so why not!

Yours,
Linus Walleij
