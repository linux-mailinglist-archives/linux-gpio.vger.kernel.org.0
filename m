Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19AD51FAB02
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2020 10:22:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726805AbgFPIWO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 04:22:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726064AbgFPIWN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jun 2020 04:22:13 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CB58C05BD43
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2020 01:22:12 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id a9so22463227ljn.6
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2020 01:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LNJZwDu+FhV9MYnbDbOtjk6SYzYKRS5qjtvDhysBDeM=;
        b=vWGmRhZoVanaxPCyE1b1AZo4raPw5+syz8tg5FG9rcBbK1qdxGiaHjfhzq5m3qoUfB
         denebWDCpCe6vCsbYeyFdv8W8vx/yvRKNccht3iSFHtXeB5r/i6bqic6KTJCdlrhM0YG
         GW+CHBvNRgItJ+CHzHgXJgSJJPlNwnmW3+YI94AkmcFALXH18LVK5GZDpQwIOxekzdhd
         o9/6zQ3nZi6gs52onTQkusoFT82+Wu/22YVYRFna1305TKtvPBR4gY10paBGUGcel+WZ
         9JU7/YBc6tE1nWksYlgk8Eh3ZxYXSrQAZnLt84hUUXccpWRKcC3j/dwbA6YeYkvtNSqU
         ZkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LNJZwDu+FhV9MYnbDbOtjk6SYzYKRS5qjtvDhysBDeM=;
        b=OJxwWaKWHCQtBotdIlvAhNivurUjBcoUMZnQ+ulyVT5PS0Df0Br3dFQm//HaQOsaFG
         zVus7AC/YjBlZ5lMOxoPqzCi3MWtOD3uEn20ANoAP3fqAUXVJbDQfgzWgLp6H0IS/4eT
         ww0dNKg+XgSEuQpxvNQOBEDwok8BK8lLEZLNxZiFK2eYPhQd0VWbR5OyimqZgw/NXC9V
         xgtHAwHgcmv4Rq8HsQxqrxFZXIxFfpur3/+SXnmLYw4aEu3vMW9inXGfuhl0DI6CAGya
         gL/fmSkjKrS6rkZf/UpYmucCvHoreEWWbCvtk8dBCBySrZiVpUWks4usadeSNv8kgbAE
         BbBQ==
X-Gm-Message-State: AOAM532Qfm+p0h5r9qLwgmD2SOD2pCLDraUODDuu5/NnYW6zC8/qLbq5
        JEzYkrfeFg+JG3EvH2Ym17e3WxxT9/Ru13Qb3geynA==
X-Google-Smtp-Source: ABdhPJwM7yRy/hwEMsnFTsrEBcOMR12J8cXXTi1lQ8ZNw+y+8VtSVrqt4FTOKoJq8FXYOBmql3WI428aQ1jY46vmfp8=
X-Received: by 2002:a2e:8705:: with SMTP id m5mr802409lji.269.1592295730793;
 Tue, 16 Jun 2020 01:22:10 -0700 (PDT)
MIME-Version: 1.0
References: <1591673223-1680-1-git-send-email-haibo.chen@nxp.com>
In-Reply-To: <1591673223-1680-1-git-send-email-haibo.chen@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 16 Jun 2020 10:21:59 +0200
Message-ID: <CACRpkdYOJR9RW3_coqt-facnHHNv_eDBWvc-43XM9Zx2LoxtVA@mail.gmail.com>
Subject: Re: [PATCH v2] Revert "pinctrl: freescale: imx: Use 'devm_of_iomap()'
 to avoid a resource leak in case of error in 'imx_pinctrl_probe()'"
To:     Bough Chen <haibo.chen@nxp.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Sascha Hauer <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 9, 2020 at 5:38 AM <haibo.chen@nxp.com> wrote:

> From: Haibo Chen <haibo.chen@nxp.com>
>
> This reverts commit ba403242615c2c99e27af7984b1650771a2cc2c9.
>
> After commit 26d8cde5260b ("pinctrl: freescale: imx: add shared
> input select reg support"). i.MX7D has two iomux controllers
> iomuxc and iomuxc-lpsr which share select_input register for
> daisy chain settings.
> If use 'devm_of_iomap()', when probe the iomuxc-lpsr, will call
> devm_request_mem_region() for the region <0x30330000-0x3033ffff>
> for the first time. Then, next time when probe the iomuxc, API
> devm_platform_ioremap_resource() will also use the API
> devm_request_mem_region() for the share region <0x30330000-0x3033ffff>
> again, then cause issue, log like below:
>
> [    0.179561] imx7d-pinctrl 302c0000.iomuxc-lpsr: initialized IMX pinctrl driver
> [    0.191742] imx7d-pinctrl 30330000.pinctrl: can't request region for resource [mem 0x30330000-0x3033ffff]
> [    0.191842] imx7d-pinctrl: probe of 30330000.pinctrl failed with error -16
>
> Fixes: ba403242615c ("pinctrl: freescale: imx: Use 'devm_of_iomap()' to avoid a resource leak in case of error in 'imx_pinctrl_probe()'")
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>

Patch applied for fixes.

Yours,
Linus Walleij
