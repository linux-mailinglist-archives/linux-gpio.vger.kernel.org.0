Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FB036CD503
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Mar 2023 10:45:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231229AbjC2Iou (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Mar 2023 04:44:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231231AbjC2Ior (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Mar 2023 04:44:47 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E394A1FCC
        for <linux-gpio@vger.kernel.org>; Wed, 29 Mar 2023 01:44:46 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id cf7so18390030ybb.5
        for <linux-gpio@vger.kernel.org>; Wed, 29 Mar 2023 01:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680079486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11JaD7hdMGYDMEVM2bxoT0TPTbslQdWxsEeb3qIPYls=;
        b=F/o42EqN0ifcxbRNd2+xZEitnwqM3+QHnI4io7mZ8NINwIjSuv6zRlWQKAnB0xn8JZ
         xqC9xpLrnqHJ1583+emjfoQUQIvaptA5QNA3Ve/9P21GdEOPBwhecYZ7ZrBrmXgHxd0X
         34pz6cHbfQzaSiwaRhsvYkuq6D7Mj3d5y2cpHJKCXJRe0Pob7g90/kVZQjgzxK0NjIiQ
         bPA+AXBN/E8AU0UzMjylFIuBEqTe2EBiaEnywlhplY+UDDgQkFQEP9iIrjoQt0w6pVdc
         gpajMqQnK/xBB/d1YndivVpogE0QOTwVTQK+djV+pW+UqNgLn9631XK5Rk2Ae6NdUqu7
         et8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680079486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=11JaD7hdMGYDMEVM2bxoT0TPTbslQdWxsEeb3qIPYls=;
        b=FWVbk6/dk2gM3sS6vzTV1U6ieYlnisceIKGtiQ26zG+FvuOdr9BWXu0dmDcnmuaw1X
         VWhlDzUKwNOZTY+/CPH9Ulhm81hrfrJ2EY5+I1MR9anGT9/RhodxSGdIjD7crwQ98P9z
         Cm9H8rG/04L2dvnjJDb7QY5ZJLx4avSoIf5eTBHJ+SXgXcZ5uZJv44Ej9eDSIdCfR9Da
         tP/Tjqbb5bqbW6MJ17QDz06RLGMYDfX/RVTKro0NEEdLrMpKJruTtY+iavF3isgMUuC1
         es9g3DCftINpYqaSn5Mgj+JIlYtb32aONahC7saL/NMh8WqmwKdbZigAXDEa7Fr6JLLi
         QuHA==
X-Gm-Message-State: AAQBX9fm8M4R+JqZctpVOdv/+6OrWWCSpkrzCve1X/CPTujjeCzvorUd
        duoP+OPPjgqsK1k2WqMRlWuO6MuS5OucBgfc68yMKw==
X-Google-Smtp-Source: AKy350aY55dPk1jxy2/5OQeOccyqKlQM19jufZynt6zF0+7H1kF7mvdwzMfPacylJ663xZp1I52XCMlaxXmLogmbD9E=
X-Received: by 2002:a25:8712:0:b0:b74:3236:2fac with SMTP id
 a18-20020a258712000000b00b7432362facmr11757896ybl.4.1680079485954; Wed, 29
 Mar 2023 01:44:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230323205733.20763-1-asmaa@nvidia.com>
In-Reply-To: <20230323205733.20763-1-asmaa@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 29 Mar 2023 10:44:34 +0200
Message-ID: <CACRpkdbc1p_BmGkQRNJYxjNAahJQQ_5+zUadm4fh4UxRmM_PyQ@mail.gmail.com>
Subject: Re: [PATCH v1] gpio: mmio: fix calculation of bgpio_bits
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     andy.shevchenko@gmail.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 23, 2023 at 9:57=E2=80=AFPM Asmaa Mnebhi <asmaa@nvidia.com> wro=
te:

> If the "ngpios" property is specified, bgpio_bits is calculated
> as the round up value of ngpio. At the moment, the only requirement
> specified is that the round up value must be a multiple of 8 but
> it should also be a power of 2 because we provide accessors based
> on the bank size in bgpio_setup_accessors().
>
> Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>

Neat fixup,
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
