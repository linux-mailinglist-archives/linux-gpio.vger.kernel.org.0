Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C2CF778F5B
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Aug 2023 14:24:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234418AbjHKMYt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Aug 2023 08:24:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233813AbjHKMYs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Aug 2023 08:24:48 -0400
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDD72E5F
        for <linux-gpio@vger.kernel.org>; Fri, 11 Aug 2023 05:24:47 -0700 (PDT)
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-44758510539so794288137.2
        for <linux-gpio@vger.kernel.org>; Fri, 11 Aug 2023 05:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691756687; x=1692361487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hfDeX6Y9wBLf0GVvOt3mdUnAH7ceb+Jxb/B62YkCUcI=;
        b=QTzvvZb0qd4SrWhInKc7097m9jREO3FEzzkLBMPPQN9KYLQFeKpZyBg8A/KfocSmse
         6hXLt0ZaFCaU6AV4/waNJIqiBa9szyVzNB3xfjLdkgsTtk6pY2wxYQhTH91E11GL96cV
         BUiScBXjq2iYRr53zqWkFVRyih6y8u7joGXHYvF3Yts74LLRPFDMwsz4NjhUKbA0oRsp
         dZgSP7tN6hnH0Woe5jossi8H+iYhxIrwolJWmOsY9u5VpF2EOEstW2u589leof69HCig
         w3LDY6p6bFiUmq1WFJ6FToutpeA+Avicr9cG8HsxNy3CM7npjl+9e1F+k+VxzU2Kvczp
         fvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691756687; x=1692361487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hfDeX6Y9wBLf0GVvOt3mdUnAH7ceb+Jxb/B62YkCUcI=;
        b=J/8Ub4SJ2HXj0IUPYjEZL0ZHjj0YH8bzR8PaPJ2rhOE8kiWs5Gb2A5KVbiSMfu3gqy
         7GoKRhfwqIzcIWAzyTVu0s8O2NAA4vg6HefLAv7cwKnrHk7648n3jKXKL7rx6nb9Z6LN
         pdwVwEKfPANKdacIJ5OXrklYUl4JJOi7zYvNIEliznJY9MRtpznXRo8hIgUqV4pX7PFc
         DRYnvcw7W9oWKe5yqi2T7mG5Kc8F0Okaa0s7EdnKepVLIVSVZP+UofieVi1CoZSlocS7
         Q0AcFwYF8lTCvog4zgwwVERgnjF3WA8e5RoLxoWwbpY9ABltKAr9BrCJwPbb2T2YZBn6
         LNqQ==
X-Gm-Message-State: AOJu0YwwY4XhKNdJU+L/GgTyFE/U9OSP6uGkh32+Cf743TLfTYM9TD5O
        JgYMwMwNZpLz6rUscCN17lII5ZUmg5DxR0aVSVSgz0Q2ix6RGdIqIUA=
X-Google-Smtp-Source: AGHT+IGACekgfPWEO7PL8jMECpn45c5OF/LcucpjVhRGub/xSPqyEeG/tUhYsxxMy66NYSTp0mFn3fXZiVj60zU95/8=
X-Received: by 2002:a67:f810:0:b0:443:5ec3:55da with SMTP id
 l16-20020a67f810000000b004435ec355damr1256885vso.15.1691756687049; Fri, 11
 Aug 2023 05:24:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1691703927.git.william.gray@linaro.org>
In-Reply-To: <cover.1691703927.git.william.gray@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 11 Aug 2023 14:24:36 +0200
Message-ID: <CAMRc=MdgXXsYmn_LQ9Qrx=vOz3jF=_Hq=cBn_-YuyUaZFm4DrQ@mail.gmail.com>
Subject: Re: [RESEND PATCH 0/7] Migrate ACCES and WinSystems drivers to the
 regmap API
To:     William Breathitt Gray <william.gray@linaro.org>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

On Fri, Aug 11, 2023 at 12:01=E2=80=AFAM William Breathitt Gray
<william.gray@linaro.org> wrote:
>
> This patchset is a collection and resend of the lingering GPIO patches
> for the regmap migration of the ACCES and WinSystems drivers.[^1][^2]
> Previously, these patches were postponed due to pending dependency
> patches that have since been merged into mainline. Now that those
> dependencies are present in the GPIO tree, this patchset can be merged
> without incident. An IRQ handling fix for the ws16c48 driver is also
> included at the end.[^3]
>
> [^1] https://lore.kernel.org/all/cover.1680618405.git.william.gray@linaro=
.org/
> [^2] https://lore.kernel.org/all/cover.1680708357.git.william.gray@linaro=
.org/
> [^3] https://lore.kernel.org/all/20230228081724.94786-1-william.gray@lina=
ro.org/
>
> William Breathitt Gray (7):
>   gpio: idio-16: Migrate to the regmap API
>   gpio: 104-idio-16: Migrate to the regmap API
>   gpio: pci-idio-16: Migrate to the regmap API
>   gpio: idio-16: Remove unused legacy interface
>   gpio: pcie-idio-24: Migrate to the regmap API
>   gpio: ws16c48: Migrate to the regmap API
>   gpio: ws16c48: Fix off-by-one error in WS16C48 resource region extent
>
>  drivers/gpio/Kconfig             |  13 +-
>  drivers/gpio/gpio-104-idio-16.c  | 286 +++----------
>  drivers/gpio/gpio-idio-16.c      | 254 ++++++------
>  drivers/gpio/gpio-idio-16.h      |  79 +---
>  drivers/gpio/gpio-pci-idio-16.c  | 294 +++-----------
>  drivers/gpio/gpio-pcie-idio-24.c | 677 +++++++++++--------------------
>  drivers/gpio/gpio-ws16c48.c      | 554 +++++++++----------------
>  7 files changed, 728 insertions(+), 1429 deletions(-)
>
>
> base-commit: 87d0688483f56c748b37a5298bdc382df5cf8f74
> --
> 2.41.0
>

Queued the last patch for fixes and the rest for v6.6.

Bart
