Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EEAA76101B
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jul 2023 12:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230195AbjGYKDc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jul 2023 06:03:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233583AbjGYKCs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jul 2023 06:02:48 -0400
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 803643C17
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jul 2023 03:02:02 -0700 (PDT)
Received: by mail-vs1-xe2f.google.com with SMTP id ada2fe7eead31-4468a772490so1835006137.3
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jul 2023 03:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1690279309; x=1690884109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KmRaQGQO/ykEbUOXzwvpBNx/v0912ojC9mEjp/4/XZ4=;
        b=Qi1lkQH/Eqrd09mX1PkGfF3B0qgBle4ZBvZNUyuUe2JjHQJPcDbJ9lu5ln/f/JGoIq
         moKwi5gKq4lv06CVL6JEv9YcwR/0bqhm3CUoO02eaEsqoUaqxvtoTgbc+HnM6AjvUtW1
         cprXi6hpeDl7hCD5RlRStLp5PdYBzZH/rp3ysgSWc+fHfHgWdX+Tf5kYpfQLxt7XmLJT
         3WF95FbJ1Ic9P4S7JumdBNwiYqMr1yRf5BE4836KQgWrtbHkCLkdoge5gtaH/HEIieup
         uBV9x8qqK9gsvuoTtzt11iUguXSoA10uex/RzVMYHPHnsiU4jaZPQuMI+zduFqwa727e
         82rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690279309; x=1690884109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KmRaQGQO/ykEbUOXzwvpBNx/v0912ojC9mEjp/4/XZ4=;
        b=NmyZBxLI9KeRgoaeabGFEROZzTVor0FfltSxDz3aJu1wwpbDjxkk9QKrSSgUglr+CP
         aY9MIaFmuP+8lHrP32EcrQq7/yOAjifuu82NmXc/nXNkshcvVewRZvA2ili1T3DEcmRy
         r40Fipku91OzLssQxG79UaSOXdGNcBKc0UdVjPdihgXoo9Yuz9DR2ETXvXWXheP6970N
         h6L/L7+uQhaywULivSZdqnjF/ITc8Ih9bI58kiBwDeD8gvPIVAu31b71UzTwYftpUVL2
         QnxQWbNctHXRA39S5/HEyTxCfy6Q6OS75BEgr7t4LSFCmU9ub912SssB5X2cpotCBozb
         gV2w==
X-Gm-Message-State: ABy/qLaEVyuqDYanJgWWHrZT1dxVfZIMc7rjZR19Q60YV4eLbvm8rAVg
        ocfQ5J4KN0epGDoGsgN/QzvPpGQ/pPKP4fdr+vYGLQ==
X-Google-Smtp-Source: APBJJlHW1OwS6bmpdk3IDFk8ozP39xVf4zgwhLTIAqpi+TPkfHN2o4MSO14iy4i5baBENqc3v7BetZBOVlgclD6dKAc=
X-Received: by 2002:a67:fa46:0:b0:443:7a85:8fbd with SMTP id
 j6-20020a67fa46000000b004437a858fbdmr3926469vsq.32.1690279309555; Tue, 25 Jul
 2023 03:01:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230725004043.381573-1-samuel.holland@sifive.com>
In-Reply-To: <20230725004043.381573-1-samuel.holland@sifive.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 25 Jul 2023 12:01:38 +0200
Message-ID: <CAMRc=MeCM3iJ4wT6p3h7cxX5_2Kg-xgZUgyGLSscLa+jzH=8Ew@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] gpio: sifive: Module support
To:     Samuel Holland <samuel.holland@sifive.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>,
        Emil Renner Berthing <emil.renner.berthing@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 25, 2023 at 2:40=E2=80=AFAM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> With the call to of_irq_count() removed, the SiFive GPIO driver can be
> built as a module. This helps to minimize the size of a multiplatform
> kernel, and is required by some downstream distributions (Android GKI).
>
> This series removes the rest of the of_* API usage in the process.
>
> Changes in v3:
>  - Use dev_fwnode() instead of member access
>  - Mention the SIFIVE_GPIO_MAX check in the commit message
>  - Keep the variable for the parent IRQ domain
>  - Add a comment explaining why the IRQ data lookup will succeed
>
> Changes in v2:
>  - Add 3 new patches removing of_* API usage
>  - Add MODULE_AUTHOR and MODULE_DESCRIPTION
>
> Samuel Holland (4):
>   gpio: sifive: Directly use the device's fwnode
>   gpio: sifive: Look up IRQs only once during probe
>   gpio: sifive: Get the parent IRQ's domain from its irq_data
>   gpio: sifive: Allow building the driver as a module
>
>  drivers/gpio/Kconfig       |  2 +-
>  drivers/gpio/gpio-sifive.c | 47 ++++++++++++++++----------------------
>  2 files changed, 21 insertions(+), 28 deletions(-)
>
> --
> 2.40.1
>

Applied, thanks!

Bartosz
