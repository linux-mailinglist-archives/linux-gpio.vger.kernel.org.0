Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 307F16B6120
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Mar 2023 22:47:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbjCKVra (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 11 Mar 2023 16:47:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229722AbjCKVr3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 11 Mar 2023 16:47:29 -0500
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA5C067838
        for <linux-gpio@vger.kernel.org>; Sat, 11 Mar 2023 13:47:17 -0800 (PST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-536bbef1c5eso169378357b3.9
        for <linux-gpio@vger.kernel.org>; Sat, 11 Mar 2023 13:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678571237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6Mw0ypF+8k7PLrY/7XQrGegOH0i0vAAhAg3d54HVCs=;
        b=F1dKTj5WejEHbCAqSmkG0MtDRsafkJzlKuv7Blx5gzzjMJoWDtTuJYNCEvgPDPOZvb
         crh7vTUcNgrZF5QmstwHiyQp+rOnLrZpcZyjxYVDzhwHevFX41PPFOq7zxcH0w4eQSxX
         3i3c9azeyCeScysourVSzlPP3Xk6Jaitc/Zk21n6pLdsotwLVIkXl9yHolrExYnCLW6w
         L+xfSEKlr4ApGzlwduG0FM7VNqiNX5NJS7KdIrl7AiYjnG3T7QxUnhb/QIxzuYTX9JUf
         RoyJWnWW/ElU/8SXQ5IOeIX3jU/N+0nV/W4pjg8qly9QE78i1Hn+lTc4rRbT3Zf+VbqZ
         6b8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678571237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J6Mw0ypF+8k7PLrY/7XQrGegOH0i0vAAhAg3d54HVCs=;
        b=gLYDqd8mj2fNX9X0dJBaS9Wv6Fd2zKHGNkSkb+P8TDuVJa7gWL+/0AYfKOrT/AlpuX
         4vVb825ALshoH7HEhvmszMVy8BrlemEj+NkwKg4Dz/YWnKG90aWKVjFoZIUwIblOS4eu
         XuCBYgJJF9aFj9reIIydDFxP6V7Irt39a8tgyWt5db1em/j7hnRFT39Le65erCK7RZrZ
         bbQTli2LJBYIYgoRedUnaL7zptalIbu0h42dkshWqNTPpReWwatrZaLo0WFe/Kx6lavi
         8HZufQw//+dfybdtlEeTbKFd+gMp3eoxqo6k68FwZJjA/JYkl+Hj7HA6soR6yXe5rF0N
         gn4w==
X-Gm-Message-State: AO0yUKVxgko7wVMeLGYhQ1geebm1q2DOfBkDq0WJnxGh2p2M3AtVs1qc
        WdZDkJCwxfsvYUxXIy/H53lrpEN54TT4kZW3JkUurQ==
X-Google-Smtp-Source: AK7set+wqGujzuEzqpe0yUtH0QryUw6iAwkO3ZlCcQUkRUb09qFyUtqFnBmFWknIwDMk5oPEudc8Sc+vNQAvx0IRP08=
X-Received: by 2002:a81:b665:0:b0:541:8285:b25 with SMTP id
 h37-20020a81b665000000b0054182850b25mr902617ywk.10.1678571236874; Sat, 11 Mar
 2023 13:47:16 -0800 (PST)
MIME-Version: 1.0
References: <20230311111307.251123-1-krzysztof.kozlowski@linaro.org> <20230311111307.251123-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230311111307.251123-2-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 11 Mar 2023 22:47:05 +0100
Message-ID: <CACRpkdYfmApW0m_2yCK8QLR+opdRvzi6a-ULTL_k5WG3bXqqpA@mail.gmail.com>
Subject: Re: [PATCH 2/8] gpio: altera: drop of_match_ptr for ID table
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Mun Yew Tham <mun.yew.tham@intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Nandor Han <nandor.han@ge.com>,
        Semi Malinen <semi.malinen@ge.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Mar 11, 2023 at 12:13=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it might not be relevant here).
>
>   drivers/gpio/gpio-altera.c:324:34: error: =E2=80=98altera_gpio_of_match=
=E2=80=99 defined but not used [-Werror=3Dunused-const-variable=3D]
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
