Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C36245BDDC0
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Sep 2022 09:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbiITHD6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Sep 2022 03:03:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230077AbiITHDx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Sep 2022 03:03:53 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 467B152DC6
        for <linux-gpio@vger.kernel.org>; Tue, 20 Sep 2022 00:03:45 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id y8so2408045edc.10
        for <linux-gpio@vger.kernel.org>; Tue, 20 Sep 2022 00:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=SiXrIsNaie2MRLXksC3blUlB0yjpFRkVm37nQA2Mhw0=;
        b=liJ7PLFMpU7zhDKS2LgK20Q+FO+IVZKncoo4cqBPYGimVme+dUWIdLgYty/AEh3tw/
         aDAjEs8O28+Xaq62WLeZxOv4dcRvqsnACoMaqk4WEwbtRB8JpbhTGJ/YgXFLdoC5c2eT
         nk4Lrrupq/MLP0/O/wtA/14Rtr7yT2dC/td6zWKupkxrUyPMxfXJBvfBvQfDTtEm5SkS
         ewKJMDZtLZIrwi45BE3cTLIbgB4NssSUBlGb0Z6EgYlItG5R0wl6q53eVKjgWtgdGytY
         f26j6g4pxLcTuS5mUCPjxOA8Vt0P0CCVxUzR60q88l0ho5t9J1VkpoSiesPLqPmgOYeV
         OFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=SiXrIsNaie2MRLXksC3blUlB0yjpFRkVm37nQA2Mhw0=;
        b=1uv+pcs23dy9GCymz6sTtCVX1NKHl8xMpKGH2iY0ROoqf30rhS0iisEaoCpdio188N
         rzlizKcHKiFNIWQqOai8ZaXo6bskvdLm7P7mR4GLT42b+jaBjGMeA6xXxevABmpuzfBe
         Qvzdgh4kt50WJj4nh0cuGr1HVIzzYK8Ov+SNP6juUc3xsN2/dVyaMpFpkcoqW6ITCQAg
         yj94vgUwkKVI5IpGFvAdZT58qTFTau4rFBl/XZhSWp+fE5MlLKgviCrUXqW/GcpaThzO
         wnFn+znBbxjAuW4AIzG8kz2p2mKe+83SxUp2GiagPTsNxXJnxorbJtLZw4cwDaRNr7kI
         wrow==
X-Gm-Message-State: ACrzQf2mK5/NV4bu0kgaGQ44ERqRuZV8A696IWU2x2bPu3mTXu9qp5sx
        fO8HuJGuoYcXwiUR1bIStd1P0ZHISCwRhMf4WZGuqA==
X-Google-Smtp-Source: AMsMyM5+rme9LcZFJd3JJflD+Je2ueUO4Rjr96r4lXVPQ8azGmumbO7SfaJ9Fqrrk48J92V0eAk5uiJDDwN2FBmvtXQ=
X-Received: by 2002:a05:6402:3549:b0:454:414e:a7fd with SMTP id
 f9-20020a056402354900b00454414ea7fdmr5241912edd.69.1663657423837; Tue, 20 Sep
 2022 00:03:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220917213729.341321-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220917213729.341321-1-u.kleine-koenig@pengutronix.de>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 20 Sep 2022 09:03:16 +0200
Message-ID: <CAMRc=Mc3L4Q9V8Prwc5D+sMEJO2WYZzBcyJ0eKrn08ggAKRAcA@mail.gmail.com>
Subject: Re: [PATCH] gpio: twl4030: Reorder functions which allows to drop a
 forward declaraion
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Sep 17, 2022 at 11:38 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> There is no cyclic dependency between gpio_twl4030_probe() and
> gpio_twl4030_remove(), so by moving the latter before the former the
> forward declaration can be dropped.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---

Applied, thanks!

Bart
