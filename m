Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB96E167F4C
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2020 14:53:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728765AbgBUNxI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Feb 2020 08:53:08 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44919 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728496AbgBUNxI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Feb 2020 08:53:08 -0500
Received: by mail-lj1-f193.google.com with SMTP id q8so2241141ljj.11
        for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2020 05:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bocRSQzLDaTwv7v9OxUFP+rBJyC1D4NMJ64qgWlEHDs=;
        b=HbD7uMVDU9BN4HHpP/Uq9PzzrHWBEf/ld2so6FHZGkyjty2Ds5TT66WplexiMNFV/V
         9BAGOsZKgAB2Uk3uCSAoOeXULLAYwVBR4sbFOMA9OnAOcCyIRLdoxWC/4ZsUBIVOlFlL
         D3+Vh4xEeUytjeXgQFZI2PT3lPUmf/y0IaxladyFfEwwzEoKub6rzBqVQTz1iogq0A6p
         9b67/TRxuaRtkR/QFR4XxQ5JiowDDtMDdC5EJQx4/Vdfw0xh++DD91AfDnr3/7dTYK08
         CEovteO5uxclBRpFVcsRiqkK3N7pw3/ofJZSElFqMyy5WYRoYilb93NU0U/c0NqAfr4m
         w9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bocRSQzLDaTwv7v9OxUFP+rBJyC1D4NMJ64qgWlEHDs=;
        b=UHnxMRzasRdvj5fCYj1x00mtqRzZa9FKzWAO7i2QaFti2gRlO7f0xV/9i23kXOiQQd
         uLfdGtVb1oBUVkGvCwhSYGhbCF/Vh66Lgn0W7C3grvgruuxLnMijfaQquvkate8W1ONa
         6TmGCFOHFSrGgBAddly30gK8w7Kr702eRsRSZLQ5YhLRozUuKs/sAHGQL9dPkcQnAzEo
         cuJIAAgYFxbpXGQ6MSMB9xAMrQgJdza7U3YvROfnLkAth+MwU8SE6bmiBF0m0RG1YSl7
         M8uDVQt3CCkt9RTpLLcvIwEckbOLZ/uQm5gxWSB+ijsfeOpui+ZdvAC1JgJvsxrPe57D
         LRCw==
X-Gm-Message-State: APjAAAXAnuyhdVxTEawRfeYtaNWupih7m2tf2tOUvCrUl06Fieb9FV9C
        ug/40ZFC3UejCtGkROt8WGUP+o8Hh4uB/RyeavlqOA==
X-Google-Smtp-Source: APXvYqy3Tud5fSZk+NS99V4j+h1pHwX6bNMG7bt5PEc4SKLazBwRPCyljUVZpWJMKR9U3zeZeBsru4Y1mTtAVVCTsBo=
X-Received: by 2002:a2e:2a84:: with SMTP id q126mr21388876ljq.258.1582293185570;
 Fri, 21 Feb 2020 05:53:05 -0800 (PST)
MIME-Version: 1.0
References: <87d0al4600.fsf@nanos.tec.linutronix.de> <20200211135121.15752-1-uwe@kleine-koenig.org>
In-Reply-To: <20200211135121.15752-1-uwe@kleine-koenig.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Feb 2020 14:52:54 +0100
Message-ID: <CACRpkdYXBn+30HJWU7rbvfkgmwxxiRs7k3H9KWNb-X1WLEgt4w@mail.gmail.com>
Subject: Re: [PATCH] gpio: siox: use raw spinlock for irq related locking
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thorsten Scherer <t.scherer@eckelmann.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        kernel-janitors@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 11, 2020 at 2:59 PM Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.or=
g> wrote:

> All the irq related callbacks are called with the (raw) spinlock
> desc->lock being held. So the lock here must be raw as well. Also irqs
> were already disabled by the caller for the irq chip callbacks, so the
> non-irq variants of spin_lock must be used there.
>
> Fixes: be8c8facc707 ("gpio: new driver to work with a 8x12 siox")
> Signed-off-by: Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org>

Patch applied. Is this a regression so I should put it in fixes?
I put it for v5.7 for now but I can easily change that.

Yours,
Linus Walleij
