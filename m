Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F07F5580779
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jul 2022 00:37:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237340AbiGYWhB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Jul 2022 18:37:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237298AbiGYWg5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Jul 2022 18:36:57 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1830725E91
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jul 2022 15:36:53 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id l23so23120307ejr.5
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jul 2022 15:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=98iCKfPkmvBPew8aWDfgC49or7P8i1iJw7YiOtSO9xs=;
        b=rtPvQhPMfcCvVS1XipOoBjrbz9dpP3OFP6/sPL1qKy84hthyWwAHFeXQdlZrBgNfud
         eL2ZF0/DjZ+JFtSOn0nvUsOMBSpzGSWJNFZTNQRonRiN+a1hS2Q6OR50kX/+YCaM1inq
         xo9OH0CZygCsASmEdYgD+evBerHeQ/lhiN1krxRAMUwaLRAxGLQBJtxSwuy6HC3Lov9F
         goJz5zN+99mfoZOnxBldMeUNAKFaSCoadXrg8oegWGUIb5E8H/DFIYgKCjp1Ka8Xli+o
         sO8xjY1SieZFAGB1+JBuMWuXSlp9IIshJG8+wVleO1rbe9D0DKQramZEBNC4Hg+vM4Yl
         Kv5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=98iCKfPkmvBPew8aWDfgC49or7P8i1iJw7YiOtSO9xs=;
        b=jxHWXmLaoXygCvVG0S13EG50iIrEBZ0XZaSJFgYSHvSX22LBXPfd/LnLXaA9bdtjBl
         bZLDXdbjqy5RPWQPBdlAlAaR7aKZNxEKvEP/efoT1AT0SaMQAzCLpYw7lofWHAaRcmNt
         XswrnUsFZLQthyWJFJe2wGZFfGpJtJ+Xm9Xjgkwckkiztf/U9fsexccLBcf/M/NGl3X9
         sT6+NgV3X5Np9OrYtLcUQ99fID9kUYVL7lJJQgOQaFkhk8CSlul3l73XN8tz2OpNr3vH
         Us131ZdsxZOXvms9BlIgx5YWWItqE3qGVpthvir1tKJB3lvsUa/G9UqShAvY768Dd8/F
         ucow==
X-Gm-Message-State: AJIora8TYTAH44smszN7XAwkzaPww8WXqo76HeQw/m/0a0Nz9GgMnsLw
        DhsNiz4PyyZpfuy0uMm+OP0ZsQM+pUQ0g68JTPiZrA==
X-Google-Smtp-Source: AGRyM1vZIT9QfddBJj/UIXBdH2m0mfEbhV2BebQrmbkEEnmUD49mb/eoxtoENsI5TAgTew0yrtzFkqliiZxh/bQZpag=
X-Received: by 2002:a17:906:2ed7:b0:72f:d080:411 with SMTP id
 s23-20020a1709062ed700b0072fd0800411mr7076178eji.203.1658788612035; Mon, 25
 Jul 2022 15:36:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220725103445.88674-1-marex@denx.de> <20220725103445.88674-2-marex@denx.de>
In-Reply-To: <20220725103445.88674-2-marex@denx.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Jul 2022 00:36:40 +0200
Message-ID: <CACRpkdaTRXzqHzz28Lz9grLHVuVNiERvgCLM1bsdD_0MeQkqTg@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] gpio: mxc: Protect GPIO irqchip RMW with bgpio spinlock
To:     Marek Vasut <marex@denx.de>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 25, 2022 at 12:35 PM Marek Vasut <marex@denx.de> wrote:

> The driver currently performs register read-modify-write without locking
> in its irqchip part, this could lead to a race condition when configuring
> interrupt mode setting. Add the missing bgpio spinlock lock/unlock around
> the register read-modify-write.
>
> Fixes: 07bd1a6cc7cbb ("MXC arch: Add gpio support for the whole platform")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Loic Poulain <loic.poulain@linaro.org>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> ---
> V3: New patch
> V4: Include linux/spinlock.h
> V5: Use raw_spinlock per 3c938cc5cebcb ("gpio: use raw spinlock for gpio chip shadowed data")

OK I was a bit confused this looks good and that spinlock is indeed raw.
There is maybe a bit of over-locking with one single lock for all registers
but I'm not very picky so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
