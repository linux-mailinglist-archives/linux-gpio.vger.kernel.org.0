Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23959786973
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Aug 2023 10:06:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233582AbjHXIFb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Aug 2023 04:05:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240476AbjHXIFV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Aug 2023 04:05:21 -0400
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com [IPv6:2607:f8b0:4864:20::a29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 693BD1735
        for <linux-gpio@vger.kernel.org>; Thu, 24 Aug 2023 01:04:48 -0700 (PDT)
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-48d10c504a8so1581968e0c.2
        for <linux-gpio@vger.kernel.org>; Thu, 24 Aug 2023 01:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1692864287; x=1693469087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LiEv4XqC+7KuHP099o9BoI+4py4527eV//6q5pjiRJE=;
        b=E13rm5T5vcsam81LPUzwMKLwwRHQF+5UrjbeiVh6MlwbFu+j3LNZArr8E1Kn0Kv1Ko
         1H4UnU8iFu/bBCF2AYWy6qZ6kIJNcv494b9Uzh88U47y1YIbDXAsTmjw+iIOlcgMI5x3
         ebPDSrHspCjcOcyce10Sd3Tp/lBRaybhdpcGDZvJKm0WTNoDfjsTX9GGn1l4iIhzUcRI
         0W/1q8GUdvkBpIkDnz1AncIb98z8gNYZ7GUcA9xDMcwzuw5x3k7K4jNK7Z8jQo1V0NZz
         J1cpJwvMVPna8cQVsMOsp2PYj4YqP45UYLAMBSRuU678ERh7XU/5rg+kq1e7dzGrL2QQ
         a3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692864287; x=1693469087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LiEv4XqC+7KuHP099o9BoI+4py4527eV//6q5pjiRJE=;
        b=HWS9wS1Y7NAt/N/WMh1pzx1VMiG/+647WIKbgJat9G/2dgT9ulU4ITv1EpD4tSrCiL
         6JCEGGshHJYgxY3ZPcSrBMqEa2AqoAqVBP6y+2+kWYUAHAPfd887Hgs0ySqTTLjD6VZn
         GHFl/ebgCpC/rgQu7aZrVNpxQ0YT61SMpZ3v+uB76hZZIUEtriwSuHJ2WktjTkB9Cww2
         FNHipt4JEvj5A4mYp4IElznwZZT+Cn5zJkTJu7nbg6opd7XYFLi+D1WfewsID02pPkyr
         LmNUD1SEdg/1Z05NMxde4b++JGJsGTeZKe+pNmv6HZ5N5tDyWxhZyk00hSc2PNXpMgGC
         ZLJA==
X-Gm-Message-State: AOJu0YwDlsB3uOfyxRldRg+s4VDtEt+QPc0Lo/tu8W4uEHdEIBc/vf0g
        ZYLBeHBZdXpEJt31KZkO/iAiqwxiAth+P8CJqaLxzA==
X-Google-Smtp-Source: AGHT+IFWFkHg7eaqOaB86gkOgbNQfghPr9mXzXtCYBVN+jkZIKo2EEPebwD0aYA651pru1Qz76lZD0swwYS5O/Diuhw=
X-Received: by 2002:a1f:e783:0:b0:48f:9c75:411c with SMTP id
 e125-20020a1fe783000000b0048f9c75411cmr6190288vkh.6.1692864287288; Thu, 24
 Aug 2023 01:04:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230823085258.113701-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230823085258.113701-1-krzysztof.kozlowski@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 24 Aug 2023 10:04:36 +0200
Message-ID: <CAMRc=MfcRHhP5J2D9JCYfMkcRYBiTe-bfywEYVWtcv51HY=ERQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: mlxbf3: use capital "OR" for multiple licenses in SPDX
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 23, 2023 at 10:53=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Documentation/process/license-rules.rst and checkpatch expect the SPDX
> identifier syntax for multiple licenses to use capital "OR".  Correct it
> to keep consistent format and avoid copy-paste issues.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> Rebased on next-20230822, so might not apply cleanly.  What does not
> apply, can be skipped and I will fix it after next RC.
> ---
>  drivers/gpio/gpio-mlxbf3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-mlxbf3.c b/drivers/gpio/gpio-mlxbf3.c
> index 0a5f241a8352..7a3e1760fc5b 100644
> --- a/drivers/gpio/gpio-mlxbf3.c
> +++ b/drivers/gpio/gpio-mlxbf3.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0-only or BSD-3-Clause
> +// SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause
>  /* Copyright (C) 2022 NVIDIA CORPORATION & AFFILIATES */
>
>  #include <linux/bitfield.h>
> --
> 2.34.1
>

Applied, thanks!

Bart
