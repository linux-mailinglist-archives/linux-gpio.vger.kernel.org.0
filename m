Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35F7B7AFF38
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Sep 2023 11:00:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230311AbjI0JAM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Sep 2023 05:00:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbjI0JAG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Sep 2023 05:00:06 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFED9DE
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 02:00:04 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-59f7cc71e2eso76584077b3.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 02:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695805204; x=1696410004; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TutIAe4KzHZUJ9ATW3VpQ4iw5gN1jLgS94r63g8BT3A=;
        b=G/C9h8ACQ4gisppe+8QdxxZVETy2BjOPzbl93h6IFvwnlaZOF7aLwhGnVgF/vCzmpp
         /sYd/c15H27j9S7/5J3Ee30LhgNKyrO2fPMvDYrBIPH8LntDvp4ae0qj90nuHF1XxCgX
         NoFZ4LoAbmV2LONc/J/sgI+VqiyPfK02DixUCkfGsvcHyVBilXKOiEYCqL3dlQ6Vga1d
         WqGrPFH5yzlZRLJP8VqnoDytB4PCEV07zBJV11+7UFh9qA/EkQ7EKkZ6z4DNzMffDEvH
         6ULUeOFnTcwXME2V1C3k7g01hbn/FgeHm0zi98u1Gv0KktMGGygV6jKeGNF6OO8PSmLf
         8Arg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695805204; x=1696410004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TutIAe4KzHZUJ9ATW3VpQ4iw5gN1jLgS94r63g8BT3A=;
        b=cXMu8Bed8bm83INN0tQpwqtot0RJrWPfPdcwAH1aejMChIsjUj6HbC3Fo4f5EvOPPy
         CP1E+Pn0RMTqKG5Oz/ka8YMwUbma18gP5UX0+MltW+VbPruqkrE24iTCaB2ktUjpm014
         349OIkdAM5hFrmmaj69b7eX9oYacT/4c/cDCsfD3pWz+fxj9pgxlueA7dQwfYOMZ7bWz
         dYzzPQ88G2brr393vQXpEIMbgwP9tJB9d7RgXsMuOkvp9TYWLtQS/FV8bVwS4z/kIMu2
         bz6pcPhxr2gZ0z4AnLY0F9JVThzsEUg5VfjAdt6v1SxyxmWxrsgaZhNkzmkX0fbs5865
         VuwA==
X-Gm-Message-State: AOJu0YyQZ3dV2h+R16gkXUzWZ+JkPmd5xVdjeSkZfm8uM+zI0VPRrPuJ
        XQKOO7vMB2Krtu8nDrBVS7SmV7vHnu7G3EUbyh+5Pg==
X-Google-Smtp-Source: AGHT+IEnVNlxtU365OSVa+Vju3oylJH3jIZadB6OzZFRZDu29MnEdrWa5VJAMDN8qQBkpr8ELeV9VjCIo0BH0fj47CQ=
X-Received: by 2002:a0d:df45:0:b0:59f:7dcf:edee with SMTP id
 i66-20020a0ddf45000000b0059f7dcfedeemr1832413ywe.9.1695805203882; Wed, 27 Sep
 2023 02:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230922175006.work.421-kees@kernel.org>
In-Reply-To: <20230922175006.work.421-kees@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 27 Sep 2023 10:59:52 +0200
Message-ID: <CACRpkdaVauiB0M3PNjGgcAj2Cw1gZ=NenkOuh=PKT=8uEYc5rA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: uniphier: Annotate struct uniphier_pinctrl_reg_region
 with __counted_by
To:     Kees Cook <keescook@chromium.org>
Cc:     Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 22, 2023 at 7:50=E2=80=AFPM Kees Cook <keescook@chromium.org> w=
rote:

> Prepare for the coming implementation by GCC and Clang of the __counted_b=
y
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUND=
S
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
>
> As found with Coccinelle[1], add __counted_by for struct uniphier_pinctrl=
_reg_region.
>
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/c=
ounted_by.cocci
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> Cc: Masami Hiramatsu <mhiramat@kernel.org>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Excellent!
Patch applied.

Yours,
Linus Walleij
