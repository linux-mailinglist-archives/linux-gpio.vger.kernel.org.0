Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C36F92AB6C2
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 12:26:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729045AbgKIL0A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 06:26:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbgKILZ7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Nov 2020 06:25:59 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62C9AC0613CF;
        Mon,  9 Nov 2020 03:25:59 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id g11so4573410pll.13;
        Mon, 09 Nov 2020 03:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9VWTIKF28LHU8ZeLkZIsqVh2wDqnUw6qnVDKoXbjYGg=;
        b=nz3/eu1O5KMIUzeF87jX8MQ0u6TSvi2b17O8vZM0jPAa75eajjABWPhHVkWI5cPtU5
         jVvDPqgSiclX3+A5tdiB+80S0KKA5tkeeh14FOeHyZx4rmiaLnU44EAXqo19GUajwIIf
         kru70l2LhWEdFgmaOzqQqUtiuUD993y0YJjufBa1qRBlGuy2dabe1vWwc5/+VHQqzCgY
         6X8vNK9hgaLqbrtrt/RP3zhcFI+wnTYq98+0Y+C9kye/zaROcogam8vkimVDNJ97X/3h
         m4c4nevOWXrRtVkpNUlIXXR0XOxGfBBuHE39A/wnfLRFY3ZqtxIfZQz18WzA+9P9JvWx
         52bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9VWTIKF28LHU8ZeLkZIsqVh2wDqnUw6qnVDKoXbjYGg=;
        b=E/jps+EuvFT3JcydK1rKkbXlcilUfON9iN4Maze4gj0attwSXn3vgqZF5R0WnGJJ3S
         zpfMD26ARDr0B/LlbvVee2k7JMJAzF4b0/wQpiGa7C+O0Np/p88fF16lZJccLaF1LCSc
         U/BAQd4iGVQVAbPE8y9tEcs7uYRdB/BX5dL4+cw7AxUbT4bpd/zIqJnVMZR9sDacuR6s
         K+/QkO78qvt8Jf68XUoPDCk1Z9IF4M9UTYl5ROEq6Wu5UO6p4vbvIVm97k/257pp2zyi
         Ma/5aRWbXMEd3hGjImloseyzkoXOKYb2YBgP0ReE4K/i2oWlr1sLKWi+3B5ZCWWndEt+
         1FNQ==
X-Gm-Message-State: AOAM531EqJ86Zypo+vSWnRqhdzWlol/x8eO5O686D48NI53zX/nUZwSk
        cCDB79lq6MEYpjqLg8iOpCCY9QgjbL9JPvujt4XmJdu6SfE=
X-Google-Smtp-Source: ABdhPJzosvL5aKk2as0/mQgnAbi2zWKOPqsjGZTL1xstKFocnO/hTOzOGCEH0iQSQOFeISzMWUea6YTOC05a4Mu0N1E=
X-Received: by 2002:a17:902:bc4a:b029:d6:7ef9:689c with SMTP id
 t10-20020a170902bc4ab02900d67ef9689cmr12600774plz.21.1604921158928; Mon, 09
 Nov 2020 03:25:58 -0800 (PST)
MIME-Version: 1.0
References: <20201108180144.28594-1-martin@kaiser.cx>
In-Reply-To: <20201108180144.28594-1-martin@kaiser.cx>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 9 Nov 2020 13:26:48 +0200
Message-ID: <CAHp75VeVPUJ_a4L+Lj-zR6Wm3Woq6F0uHzmtx3NCRO=TVopvrw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: pinctrl-at91-pio4: Set irq handler and data in
 one go
To:     Martin Kaiser <martin@kaiser.cx>
Cc:     Ludovic Desroches <ludovic.desroches@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Nov 8, 2020 at 8:05 PM Martin Kaiser <martin@kaiser.cx> wrote:
>
> Replace the two separate calls for setting the irq handler and data with a
> single irq_set_chained_handler_and_data() call.

Can it be rewritten to use the GPIO core facility of instantiating IRQ chip?

-- 
With Best Regards,
Andy Shevchenko
