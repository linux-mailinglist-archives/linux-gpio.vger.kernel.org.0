Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E6D470F172
	for <lists+linux-gpio@lfdr.de>; Wed, 24 May 2023 10:51:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239085AbjEXIvO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 May 2023 04:51:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240401AbjEXIvN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 May 2023 04:51:13 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0909F1A4
        for <linux-gpio@vger.kernel.org>; Wed, 24 May 2023 01:51:08 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-561b43fc896so6599497b3.0
        for <linux-gpio@vger.kernel.org>; Wed, 24 May 2023 01:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684918267; x=1687510267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTHHxaJoMypDJpE/fsiTCCRA1MQ4EfaJk8LPuAmRUjY=;
        b=WWt1aFUgSK1Ne1Cxs/lfu8qKDGY9W9Y13wFo68wgZy1PwC6Mm36fuTV91X/m7vDu5s
         MSi9VVvYCz+uvJyy7ZTFObF4p0+QQcUKH44pvNXiUQSOvFQbnt/BtoxpUlXY2Qu41VZ3
         UiBXWHSSitiqsp4KMFNg9TM7rkywutQ8fNZJKQLrxHrgnZj5yhPDMpm0H3aR5YwsotJm
         38PMUgD1RCVfKyRIMN6geYUvqNAZMjoyDs4xt/qeiLoUwsfzLMHgcVA0FHSyQof1lYDX
         mIWu1FDUgm/wGXN72nPPmKFD7dlWxPYND8mezH46xxmUfW+NozrnpNUJoLWzTYNOO4Cc
         YbzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684918267; x=1687510267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yTHHxaJoMypDJpE/fsiTCCRA1MQ4EfaJk8LPuAmRUjY=;
        b=TWqqJrY02+oVWa4PHI1oDNauqyLG0ZiVvXFV5pR3nzK2C4ekJDen2J6vgznT14JQ8E
         nBl6iiUs4HvVLq3DNFYQEem3IhM3DsGVxWq6zePX9lDKr1JTHVnrLTqh2stohPPK+9Hs
         lXk/6JYf32duYvUdFEaYn2qoXD5uSY6vp7RuxQhNxEpYZKniFkrbhoB8K7duDX0yb9Ub
         ljEbsRO7Cc5KlUlv2jJd6M8rxRbCTh2mjJNfPBYdVMdm60nx71o3bMn3tVBTxHQDMdiM
         /XYGev8Mw28bj/ofMwC8rcra1qLW6COij6H93JAWpPY4sJcowZHGHh4xwpJN8zXX9Aj2
         AiGQ==
X-Gm-Message-State: AC+VfDzyTsb9PzE9gEOeGvetwIzDFh5XyVvSoO7R3P+XNwAD+t1WP8ML
        rJvuUBKeBPQf99uymixFDFmJnwnUE3Z1yUu7WSpVxw==
X-Google-Smtp-Source: ACHHUZ5vVK9vagH7aFbtx2YppYrWx9tZs7lNqLziCsJ17rVWYpua6FaBjs1X2V+4pwEhVnpLameEWFYTQofY27fqee8=
X-Received: by 2002:a0d:d4c7:0:b0:55a:52e3:da37 with SMTP id
 w190-20020a0dd4c7000000b0055a52e3da37mr16454222ywd.10.1684918267794; Wed, 24
 May 2023 01:51:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1684313910.git.Ryan.Wanner@microchip.com> <048a41d1dcb3da0e845986a73eaac61a54c69269.1684313910.git.Ryan.Wanner@microchip.com>
In-Reply-To: <048a41d1dcb3da0e845986a73eaac61a54c69269.1684313910.git.Ryan.Wanner@microchip.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 24 May 2023 10:50:57 +0200
Message-ID: <CACRpkdaN=9X_bvYrVF4xoZ1k4hbd+sMx6KtpPPLweKxtrSZ2Dg@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: at91-pio4: Add push-pull support
To:     Ryan.Wanner@microchip.com
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com,
        ludovic.desroches@microchip.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
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

On Wed, May 17, 2023 at 1:54=E2=80=AFPM <Ryan.Wanner@microchip.com> wrote:

> From: Ryan Wanner <Ryan.Wanner@microchip.com>
>
> Add generic push-pull support for pio4 driver.
>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>

Patch applied.

Yours,
Linus Walleij
