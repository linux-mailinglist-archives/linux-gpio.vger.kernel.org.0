Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52D342C203A
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 09:41:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730652AbgKXIla (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Nov 2020 03:41:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730537AbgKXIl3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Nov 2020 03:41:29 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 891D9C0613CF
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2020 00:41:29 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id d17so27689310lfq.10
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2020 00:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sNwTVNPBk8PIyQSaRwIDJIv+OY57OQDUkBkRypcUFWg=;
        b=f0o9UbG9hmobiGVCxN59MBg5MaBa59ZM2Zg3Jm6BVg6Bo6tVJkh7REKf/yFLX32WSN
         82fBss5g+Ox8BjRTin4YiJasXM2xvdxW0XFj8SElEU6A6QNw6HuuwOvH/8MKra3/WU/o
         hi/IC9ObwHeeQl/x2Bt8m8qFGEUUlxiLXGZUtcGdr5n8EZQqsv0LA5yU6CJPG9guscMN
         rQ1m2YoqOHuupByKqgaP2UVnSm0o7J1WSdZ4FA5vQPVB9t6qVo4XzxeRbEABWU0WDHpE
         AwesjAkKHFy1APO3zUNt8A4mAXjPck0opUOrCRyIP6dk9qtNTCqxqkSwbouog8ZnLJ6O
         x1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sNwTVNPBk8PIyQSaRwIDJIv+OY57OQDUkBkRypcUFWg=;
        b=eRaA1aWe99Mo92SNJ8wYkgFEsLMOx5grr/yDk8cFIR4E2re63tEgSun5nrqyQR/ztt
         vHjHU8U4hXqUqNAYQISXxFP78KA6dk3+KlRMmvMqiYqgapM2/VQgfFyjTUplBGCgTIpY
         fSSBiNAouF7b3psORxFfYp9U3myPc4zPfeC83l08KifRuNBNrAY7KPc/tNIPYaiNffgH
         aMN7wD8OSzU/zbBwnn9GTYZUivz4K+CGhysaErVis1+XAcsloqM8/OOumQpmJIzURxAt
         +uvxEkKzgQOocdGqAc0z+NsQ5F4xmwC2xi9JFodkYaiNefUdvsj8H3VrPvq/rD2Rkzxk
         5lng==
X-Gm-Message-State: AOAM5315e9dC0AG9lGfX1BKpJ8thFZ8IN8DmujlZI2PViRJ81mMbFhv1
        Gb/Lcrqbirk/1E/+T+JJvqSVAT6DAFXsWqsivvg8rg==
X-Google-Smtp-Source: ABdhPJxegvXTPaufGbRnugZ49YnXR7JJuw3F0XnFokWZ/jjLdCPnwW/VrQ9FokWeWM4tulGN96EjM8LA2b+J0aAoMm0=
X-Received: by 2002:a19:8686:: with SMTP id i128mr1242866lfd.333.1606207288068;
 Tue, 24 Nov 2020 00:41:28 -0800 (PST)
MIME-Version: 1.0
References: <cover.1604988979.git.frank@allwinnertech.com> <470ebae22fc5434ad5409c4f6e29255467b3cef6.1604988979.git.frank@allwinnertech.com>
In-Reply-To: <470ebae22fc5434ad5409c4f6e29255467b3cef6.1604988979.git.frank@allwinnertech.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 24 Nov 2020 09:41:17 +0100
Message-ID: <CACRpkdZEcsw9zcAGmx1W5rcxums=Ja+14e3Kh52PixcqmU62=w@mail.gmail.com>
Subject: Re: [RESEND PATCH 02/19] pinctrl: sunxi: Mark the irq bank not found
 in sunxi_pinctrl_irq_handler() with WARN_ON
To:     Frank Lee <frank@allwinnertech.com>
Cc:     Frank Lee <tiny.windzz@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 10, 2020 at 7:24 AM Frank Lee <frank@allwinnertech.com> wrote:

> From: Yangtao Li <frank@allwinnertech.com>
>
> The interrupt descriptor cannot be found in the interrupt processing
> function, and this situation cannot happen when the system is running
> normally. It doesn't seem right to return directly to the status of not
> handling gic. In this case, it must be a bug, let's mark it with
> WARN_ON.
>
> Signed-off-by: Yangtao Li <frank@allwinnertech.com>

Patch applied.

Yours,
Linus Walleij
