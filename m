Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3291B63B36D
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Nov 2022 21:38:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234219AbiK1UiO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Nov 2022 15:38:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234224AbiK1Uh5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Nov 2022 15:37:57 -0500
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 365FCE84
        for <linux-gpio@vger.kernel.org>; Mon, 28 Nov 2022 12:37:31 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-381662c78a9so118188947b3.7
        for <linux-gpio@vger.kernel.org>; Mon, 28 Nov 2022 12:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Be9fcRFb+iBXtwrEt2w+xItkZ62HJRwPRVzp0QrUGXs=;
        b=MkXQB5OgJq8mcUlg1oxBB/+/M1OdRykLerdCz/RALQ7YP98YD5Hp95vOvkH7PMmrQn
         rSaaDU29SiwDCUB2QgelBIP75pHs7ittRdmNjf/DAfkaSuqtEdm4k4c6YFm84aS/yqsE
         bbN/xg44PhNQDVqdm8TZxXM5Aif9KJAFQKp5vpxiI9CFOXE5ZNvcKte7bVpHX4oQ1R9S
         2+b2pLM+kBawV5Lb1rrXheTpK0QL/jkR3lSMwz0x3CxGa+41/162ZHxOWdzvxayj9OSl
         P+bc41WXLZwEwoWjfJkBgzmNl1yVEv1MftxFlqYOFDMGw80mKiSGC4wCQ/imCnAs6yrC
         XRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Be9fcRFb+iBXtwrEt2w+xItkZ62HJRwPRVzp0QrUGXs=;
        b=IJf+RXnZ2kY26TykrXUl0mztAIm0FxE80tn0BWoHzOlwaH5Bk+wC01LaXrVbYOb1+J
         O1AILfxgR/ZOaDO7qUWX/SoKO3acbd3enGAiPpJ7K8Nw/spBviAv4uW4KyZODQh5Nv1r
         nczCSa6Wkp7o1JQTf1k/v38ZqytnyewwrcwRZVMdjHBaFFxle6Ik5Mi6/HXoHzyDf5Mn
         Tui5UUYeNrTXKzH3C56OFvX6IAkId4tPZ2E3rKXwjMINsq69X5+IzF24pQbDB0goPIrS
         eELxBSdRmUct5/VzsQtEqMhAXu+VoM7iiPW00XhqjLPuylt9rI2DsU3fDFs7Tnd8hjTN
         CFCg==
X-Gm-Message-State: ANoB5pnbWxVHWGlgTWC1wSECzMIvVZ/1xelUOvRXhH5Tb37xok6OLBkA
        jUv0r+jmkSx/tHuoYkQXRkQDssYJIIuXFewzhnWxIA==
X-Google-Smtp-Source: AA0mqf4aBg2mwDM8RJm0Cjg/v7cTvSlnBRa9Z2/ZVsQUyCqFE6E6HBJlcn8f1czkYtVuaDfYqb2WId3bsK/c3teKXLI=
X-Received: by 2002:a0d:fdc7:0:b0:37a:e8f:3cd3 with SMTP id
 n190-20020a0dfdc7000000b0037a0e8f3cd3mr49928758ywf.187.1669667851150; Mon, 28
 Nov 2022 12:37:31 -0800 (PST)
MIME-Version: 1.0
References: <20221128175214.602612-1-brgl@bgdev.pl>
In-Reply-To: <20221128175214.602612-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 28 Nov 2022 21:37:20 +0100
Message-ID: <CACRpkdb+C64AF_N3goRz206k_YfoHn3_kietet6yvz=FrbuUWw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] gpiolib: don't allow user-space to crash the
 kernel with hot-unplugs
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 28, 2022 at 6:52 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This is a second iteration of the changes that aim at fixing the situation
> in which the user-space can provoke a NULL-pointer derefence in the kernel
> when a GPIO device that's in use by user-space is removed.
>
> v1 -> v2:
> - add missing gdev->chip checks in patch 1/2
> - add a second patch that protects the structures that can be accessed
>   by user-space calls against concurrent removal

Thanks for looking into this.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
for the series.

Yours,
Linus Walleij
