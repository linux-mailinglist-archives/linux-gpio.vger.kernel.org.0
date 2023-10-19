Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 902087CF225
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Oct 2023 10:13:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235102AbjJSINj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Oct 2023 04:13:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232897AbjJSINj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Oct 2023 04:13:39 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56E5911F
        for <linux-gpio@vger.kernel.org>; Thu, 19 Oct 2023 01:13:37 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5a2536adaf3so103174737b3.2
        for <linux-gpio@vger.kernel.org>; Thu, 19 Oct 2023 01:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697703216; x=1698308016; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i9fhwJmlR888T70x9Uiw048WLxhTWy/cYSAVt4Gvh1A=;
        b=TA8w8XQhS0CYGJ8/hoZ94FUOBWfWMuiFzgh+tI/t3kc/ryQ8MAqa3BGTkKUSXvzB3a
         OMSASFciFqA/c/MEbWOGIlbMkfQqODORyu7ZxHG4y86yb0hNHCPEMT4lI0G3H1vk/d0u
         7iwG8krNXWCp5W2h+qwM0gqJuOz9LbVwIpf+mN6uM8geS+h0xQWIWCsW9YK4uq5C+EiT
         GXb/1HC8FcZ03pDui9yveZokgp+R1MMqE10mdpr31GAhI8Zp9HA2OgkGooNDK8+i6pMC
         vQA0asLhfpXjdaWZyWDvQ0thPVUyd+b0kKj1Rg/U+4HfuY8Fx2lFxmY4Ram8iRB4dS+D
         BuXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697703216; x=1698308016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i9fhwJmlR888T70x9Uiw048WLxhTWy/cYSAVt4Gvh1A=;
        b=oTroSRke1k56GbeqUkRXS1tsr5rWxeLCK/DjBwCKDm6wB1iq8lok16nyaMgns664Fm
         1PL+XB+l2CSkeUl6nGptDJnD6O+mo6TayrKInrnUE+XIrv6PL9HX0cs3xgYy4yQk7auk
         m0Z8ma67gCZzVUcJvDQTEQ4L5SwqIxVUd4r6voBpVy/dj2KtmUcgJl7jJD/WpFYQXLll
         AiUb48bBFGii0OakXmq+4VnO8brIv0LC8lWv7UOJnE0EocTx+R5vA3FMTlxnlnOY/5vE
         DINKgrDBnIzh+eQO8Pj5Exi/IcZXJr0vy9rZov0rNiLb/o2nVD2/AJQHonj8t/sjtRU2
         2LVw==
X-Gm-Message-State: AOJu0YxmrxgIYLMbywspys/JbSMCH5K6dBO8eQ9HVqcZXEnOzX3BNmd5
        9LYgH35sgbSSPZCUOHLej1Ls8tR6zoR3Uk8iLflQqg==
X-Google-Smtp-Source: AGHT+IHBd1+CaBIqmM2Ccl54AyWx1wdFGrKQjzy3cvBUKP57YP7Xo7lRZQp/InkGvDJiozj5p0zCtls8KQ/5oXL7mi0=
X-Received: by 2002:a0d:d303:0:b0:5a7:d9e6:8fd4 with SMTP id
 v3-20020a0dd303000000b005a7d9e68fd4mr1691317ywd.12.1697703216544; Thu, 19 Oct
 2023 01:13:36 -0700 (PDT)
MIME-Version: 1.0
References: <20231017141806.535191-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231017141806.535191-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 19 Oct 2023 10:13:25 +0200
Message-ID: <CACRpkdYZonHWTtArvYLGBWJz6rae-aDHS5J5QHtzAb7qCkxTKQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] Revert "pinctrl: avoid unsafe code pattern in find_pinctrl()"
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ferry Toth <ftoth@exalondelft.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 17, 2023 at 4:18=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:


> The commit breaks MMC enumeration on the Intel Merrifield
> plaform.
>
> Before:
> [   36.439057] mmc0: SDHCI controller on PCI [0000:00:01.0] using ADMA
> [   36.450924] mmc2: SDHCI controller on PCI [0000:00:01.3] using ADMA
> [   36.459355] mmc1: SDHCI controller on PCI [0000:00:01.2] using ADMA
> [   36.706399] mmc0: new DDR MMC card at address 0001
> [   37.058972] mmc2: new ultra high speed DDR50 SDIO card at address 0001
> [   37.278977] mmcblk0: mmc0:0001 H4G1d 3.64 GiB
> [   37.297300]  mmcblk0: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10
>
> After:
> [   36.436704] mmc2: SDHCI controller on PCI [0000:00:01.3] using ADMA
> [   36.436720] mmc1: SDHCI controller on PCI [0000:00:01.0] using ADMA
> [   36.463685] mmc0: SDHCI controller on PCI [0000:00:01.2] using ADMA
> [   36.720627] mmc1: new DDR MMC card at address 0001
> [   37.068181] mmc2: new ultra high speed DDR50 SDIO card at address 0001
> [   37.279998] mmcblk1: mmc1:0001 H4G1d 3.64 GiB
> [   37.302670]  mmcblk1: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10
>
> This reverts commit c153a4edff6ab01370fcac8e46f9c89cca1060c2.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied for pronto fixes!

Yours,
Linus Walleij
