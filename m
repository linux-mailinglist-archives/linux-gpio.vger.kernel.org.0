Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B03DC1ECCEB
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2020 11:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbgFCJtC convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Wed, 3 Jun 2020 05:49:02 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34297 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726099AbgFCJtB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Jun 2020 05:49:01 -0400
Received: by mail-lf1-f66.google.com with SMTP id e125so923673lfd.1;
        Wed, 03 Jun 2020 02:48:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PMOVHnGEcXL7cxNnZJH62mImVMlDJ7z1JOGvnBRid68=;
        b=Cx7zxwU/XozHp29LQsWwlrR022t3k0/nEIMwP/y+msZSnQSvfFfPQQgoBiKlkdDehC
         e+T2ITdho5p2bxpH8zvbWRCNh4gRMxqYgL9ooOpM0Cio2B0sog0Oro4lcvLM8mrMuvrr
         c5KVL55I+lFL19w5YnT2wlnZBNYC7Q32yNHusu2ocO3YiEHulcTLIAyVt/dKi0Y4Wjg7
         hw2aNGm9Tiv9zA2Lkv0sTOyn7VMYKrXsSYkHknDORLNNX/k3c9tDhh6l6xvQwpedGpxG
         jXeIADnJSMid+PPhnLsOLqRxyAREW40zG2jXlNTJi8ootzh4NenajJs7Kx78DuXyGLA7
         dIng==
X-Gm-Message-State: AOAM533qS9GAtx/twYWxsZW/Jc6chjNpandsbS++5fsbTtlxZ9G1Ya0h
        1laBCK2bOjEy3wQdcDXbuklaC0PuxAk=
X-Google-Smtp-Source: ABdhPJyyaIyuOWNBAgIVj2qkE/YvtIT3cQ3jw7VMWldMfAnKzXsjU0EcLF1XQ31/gR9QLsXZ2QN1sg==
X-Received: by 2002:ac2:5f82:: with SMTP id r2mr1952220lfe.119.1591177738122;
        Wed, 03 Jun 2020 02:48:58 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id l16sm331057lji.138.2020.06.03.02.48.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2020 02:48:57 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id s1so1931460ljo.0;
        Wed, 03 Jun 2020 02:48:56 -0700 (PDT)
X-Received: by 2002:a2e:8047:: with SMTP id p7mr1551215ljg.190.1591177736679;
 Wed, 03 Jun 2020 02:48:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200522030743.10204-1-frank@allwinnertech.com>
 <20200522030743.10204-2-frank@allwinnertech.com> <20200522151403.7ovbdza2o3cjrb7a@gilmour.lan>
 <d7d6ee84-bfbb-4fef-9ed8-1f7045494594.frank@allwinnertech.com>
In-Reply-To: <d7d6ee84-bfbb-4fef-9ed8-1f7045494594.frank@allwinnertech.com>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Wed, 3 Jun 2020 17:48:44 +0800
X-Gmail-Original-Message-ID: <CAGb2v66rZpX-+DK_MnP7RRp7LL7GrXTd1ExpE6z_AjKDVjVwNg@mail.gmail.com>
Message-ID: <CAGb2v66rZpX-+DK_MnP7RRp7LL7GrXTd1ExpE6z_AjKDVjVwNg@mail.gmail.com>
Subject: Re: [PATCH 1/4] clk: sunxi-ng: add support for the Allwinner A100 CCU
To:     =?UTF-8?B?5p2O5oms6Z+s?= <frank@allwinnertech.com>
Cc:     Maxime Ripard <maxime@cerno.tech>, "robh+dt" <robh+dt@kernel.org>,
        mturquette <mturquette@baylibre.com>, sboyd <sboyd@kernel.org>,
        "linus.walleij" <linus.walleij@linaro.org>,
        "p.zabel" <p.zabel@pengutronix.de>,
        =?UTF-8?B?6buE54OB55Sf?= <huangshuosheng@allwinnertech.com>,
        "tiny.windzz" <tiny.windzz@gmail.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 3, 2020 at 5:42 PM 李扬韬 <frank@allwinnertech.com> wrote:
>
> >> + /* Enable the lock bits on all PLLs */
> >> + for (i = 0; i < ARRAY_SIZE(pll_regs); i++) {
> >> +  val = readl(reg + pll_regs[i]);
> >> +  val |= BIT(29);
> >
> >Having a define for that would be nice here
> >
> >> +  writel(val, reg + pll_regs[i]);
> >> + }
> >> +
> >> + /*
> >> +  * In order to pass the EMI certification, the SDM function of
> >> +  * the peripheral 1 bus is enabled, and the frequency is still
> >> +  * calculated using the previous division factor.
> >> +  */
> >> + writel(0xd1303333, reg + SUN50I_A100_PLL_PERIPH1_PATTERN0_REG);
> >
> >Same here
>
> Having a define? I don’t quite understand what you mean,
> can you give me an example?

What Maxime means is that 0xd1303333 is a magic number.
It is better to make a properly named macro, or many macros
that you then bitwise-OR together. So you should make macros
for each bitfield in that register, which would likely include
the SDM calculation factors, the enable bit, and any other fields.

ChenYu

> MBR,
> Yangtao
