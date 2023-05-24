Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F054070F176
	for <lists+linux-gpio@lfdr.de>; Wed, 24 May 2023 10:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240422AbjEXIwG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 May 2023 04:52:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240462AbjEXIwE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 May 2023 04:52:04 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEC97184
        for <linux-gpio@vger.kernel.org>; Wed, 24 May 2023 01:52:01 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-561bd0d31c1so6515467b3.0
        for <linux-gpio@vger.kernel.org>; Wed, 24 May 2023 01:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684918321; x=1687510321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9c9KLlfxZTlVXD1HXgvyCoARTi/rzjAMY1PqK/999Bs=;
        b=xNhyzd8Hh5jsW6VnCTkKMY/0MwFykvaVmY/zFTT1eRy4NA/FfEkkU5o9vzCA5hhLGr
         GA0W9VC5LrGAxiUNisXs0kQKwQBhYHYwck18kNX5lsgUixnG/bwgJFMpr8ukldam5Hxi
         374+NYX+FfWkU81pQmDRN1J4sdgwW6qbOkG7biWqrZrAINAylxYqPVFKUTRr1EgiLOBr
         14uJ8/J2tAjk0t1qhwwjYtUTrFh+K3ivCDe/rsqODlZGHmCHPWoWh6k3mZv9EhvEstvf
         DekpnMBQHGQ+5PSkGYTu8NPxhV1IXdRSA4P/zzSSQ0JDZGeflAS+6edE89YwcJ0CLgpy
         nwUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684918321; x=1687510321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9c9KLlfxZTlVXD1HXgvyCoARTi/rzjAMY1PqK/999Bs=;
        b=IzG5mF03W5ZqSC9z2eu5gJM5Kqhjlq/kokMA5GnPyr1NhD2Ww7j57xKeOlZ2ZZiqRh
         8S0NtHuCQM3BOsxdSRn0GbuxkXnKKe/TyFSq8+cSv6POImQSNWHf1JAhEeDZZ8cuNv+z
         /eS0vHiu3ALzc131aK9AWpxPwFfUrmCdAbpJqcWfrbar8F9tNP05Xu6t0h9+ygWf5VRa
         BGYb6HlQ7G1KzRyWv3knLPlOciR702sQVTJfrvjqn+UGRkjDDqDAJtdlJZZOxbD8vxcA
         HyaiGhrVbPWo3S+vKBI5yR4UlI8QhCRQRJhzuQukROTe16zTJmLfdLXLE4yQG+K4zoG5
         9okw==
X-Gm-Message-State: AC+VfDyhdYG9E2InxxG/OltfG5MtMxwnDrUVcfCdhymsT6KisfbL/SPN
        VxRIaIi7wYksuhMmu4uU3Pm7Tozfj2RlFDngYb+ccxmaZpI8g9ep
X-Google-Smtp-Source: ACHHUZ5pfZmOIYQ8mIoyinB0Leuc8SST7V06CxGf85cEY5JraDDuw7yqI8yWVUg9SyytLYDtuMMBiApP9rEhF5IHqjM=
X-Received: by 2002:a81:5a0a:0:b0:565:3749:c24d with SMTP id
 o10-20020a815a0a000000b005653749c24dmr6414756ywb.14.1684918320912; Wed, 24
 May 2023 01:52:00 -0700 (PDT)
MIME-Version: 1.0
References: <5697980e-f687-47a7-9db8-2af34ae464bd@kili.mountain>
In-Reply-To: <5697980e-f687-47a7-9db8-2af34ae464bd@kili.mountain>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 24 May 2023 10:51:50 +0200
Message-ID: <CACRpkdauaQiuJJy-VxHDixU0MHR9qf8Qd2cRW0m5TbWsKnnAzA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: at91: fix a couple NULL vs IS_ERR() checks
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 22, 2023 at 9:45=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

> The devm_kasprintf_strarray() function doesn't return NULL on error,
> it returns error pointers.  Update the checks accordingly.
>
> Fixes: f494c1913cbb ("pinctrl: at91: use devm_kasprintf() to avoid potent=
ial leaks (part 2)")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Patch applied.

Yours,
Linus Walleij
