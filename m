Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D34B7AF28B
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Sep 2023 20:23:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbjIZSXM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Sep 2023 14:23:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjIZSXJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Sep 2023 14:23:09 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82BA4BF
        for <linux-gpio@vger.kernel.org>; Tue, 26 Sep 2023 11:23:03 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5a1d0fee86aso44260317b3.2
        for <linux-gpio@vger.kernel.org>; Tue, 26 Sep 2023 11:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695752582; x=1696357382; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sI3UkHqqf5WmbgSUGSm/14gRHcG/M3RotLOAmkRjLvo=;
        b=OFvQWgIcbTGASZICkY/Qt14NYxXBk9XsM6Q5o5grXFWDKk9n10eTWBYIJEeDYsfbz7
         6uQpfI7voVHvrCsMt26oOIjiERbznX2Rwr2yVSLxhitq7mA4Vfh5ItGSKMUWIUPJGB2v
         P0PcBNvnJKFUrj3NM7UkAlqP0eM1MtRiMWm5lr518R07m8u1j2JB/JK1AZEANdqxFiGs
         TIYGWhscnn8+LxHklyf3SymjrAr6G42H9dgZwXPVkgYoyQIgOiYiaQD5mK5OP51i9SkC
         +ZHlQ2KyA6QZVtwDjDk/JpG1h/lx4h3vFYkeN6v0FOtYENocc0sHdKlKy/jF38RxLtbX
         g06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695752582; x=1696357382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sI3UkHqqf5WmbgSUGSm/14gRHcG/M3RotLOAmkRjLvo=;
        b=Si9/ROjB0ueCvFSNbMDcxUey4BbXljM+hYuNCwy4FmFpApkr701nzPMEo5TdUWITKo
         3IGGeo3Fzk7xAHU9JMzSWxikAdT+PnYo5yharyZorr4pIQEqdHzWK1id1QgltEdQwdIZ
         1Zlkj8d3RZeulJsMKTsHiD1xKr7yum4SvK1eL552s2Rbqc54K54yIxdRzN9U9iMcRuKl
         RK1gn/ZWrh4f5CLJyJu73E3TrMauAW4FTZVOFiQRIoAcionOAOr0cUyecXMVL02dtmKN
         4nKtroEPyLoEs1aWg/xcxuQ+2jXhZ1TV21zB7nuz0GV51pWO8TU5u7FszJ+GWz7jYiHd
         1aOA==
X-Gm-Message-State: AOJu0Yzlo0jX8nk/Ne5XNLEhHnXFBjVnN5U8rajKuFwMBZfuk2TcQxpB
        WfRYWLoUjMW11FFbHOQXG4pXs0/m0krUjP8OSxoPEbMMrvyQuqgX
X-Google-Smtp-Source: AGHT+IE0yNG+tx7WImPxoj9f0KRcQ53cWmJ0g3FEAxxLPaxWmKXC5eVpm9tXntm6ZtPdG8k3kmVG86uNIr+Y8eKDWDg=
X-Received: by 2002:a0d:c7c3:0:b0:59b:ce0b:7829 with SMTP id
 j186-20020a0dc7c3000000b0059bce0b7829mr10211941ywd.35.1695752582691; Tue, 26
 Sep 2023 11:23:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230926132336.416612-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230926132336.416612-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Sep 2023 20:22:50 +0200
Message-ID: <CACRpkdZ2P7zeoRMwR=u84L_aysK2VOwVLNjFnTxvGNswd6DArw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: intel: Simplify code with cleanup helpers
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy@kernel.org>,
        Raag Jadav <raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 26, 2023 at 3:23=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Use macros defined in linux/cleanup.h to automate resource lifetime
> control in the driver.
>
> While at it, unify the variables and approach in intel_gpio_irq_*().
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Actually this is the best part:

>  drivers/pinctrl/intel/pinctrl-intel.c | 136 ++++++++++----------------
>  1 file changed, 50 insertions(+), 86 deletions(-)

So much easier to read the code, and lesser risk to do mistakes.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
