Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4E0A704E8B
	for <lists+linux-gpio@lfdr.de>; Tue, 16 May 2023 15:02:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233015AbjEPNCd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 May 2023 09:02:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232754AbjEPNCc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 May 2023 09:02:32 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAB0C59F2
        for <linux-gpio@vger.kernel.org>; Tue, 16 May 2023 06:02:00 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-ba6d024a196so5046662276.2
        for <linux-gpio@vger.kernel.org>; Tue, 16 May 2023 06:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684242119; x=1686834119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Sc2K84pfstCjboanjbniGfPzmMFGM13VBIVkXcnFxo=;
        b=kkhA6X93jXE0QOkWXeaNCjt+xYmw1ynoYM/E43vX77feqRNp/+tuNphUB99f+3kI5U
         jvAL8UusJC6ap2jilpR1/Mr9Gqdx3Ibc5zUWBIhOGCvPZsyF+SDyfwEIcmh0w7Aj69YR
         kEe0+paiUUUEfhscTjd5G+bYtA4pMzrMXYy4hbFSY0GKgI5gbgNg7GOA1mXYwSlZGIYO
         p9XVn4PZvKDNEPV/bYiSEOe5nzVEwb9Kkz/0EntiNtHvOtenxzApN0OSV7UThu40OAEK
         xu4UHaERnptKx0kpGekYkgXYPXENRJ4x4LrOhI2rPNq30z/oCg6XmtMuNhl1kZr36Kil
         hFbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684242119; x=1686834119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Sc2K84pfstCjboanjbniGfPzmMFGM13VBIVkXcnFxo=;
        b=WHnIIS+q53/2pxolFXQa7jqF19PVpZ8tTV5/kUlgjCI874noC5H+UTqnB+DPA61qQv
         1xxloB2QJDlWqe+gO2RWWSShhlRFBZxREJrv17ccW67UIJvMYZ55qBmCsctggZ89TFeh
         6ImwuCLTNSuRkhvbL/Dzn+8Md8qxg8A7+WGhW0xSIDtQhgVxxaYUg/Flf+aA2SCfSNxZ
         nP1iMMkedpBfojoo4zjh5o847MiUiJCuPJpLr1ldT4srmZ0C8dbm/ivROJW28Zu5CqIh
         LZvPKQ6lBLXURpzobl3x7MKQW24XUIzGrGytlT9cNrDvwKuJtcZrH+QqC8dXgoj9plBc
         h2Bw==
X-Gm-Message-State: AC+VfDzPIU2dHPxYmE7heqpnZlMQQHW/ywpSWeoVFslPlqKAjJWmrZgs
        3ULF1V5UjkEEYGP2DBYDRjjLin5zL6xPJbrhIyRZRQ==
X-Google-Smtp-Source: ACHHUZ70HnhjnzfnxzsrdJCOY9zjN8osMO4g94aw2jZK8YfrVM4k7BPGrbNplNGvVqzOvuvWLgJ7QJieP0BKKAqNKrU=
X-Received: by 2002:a25:888:0:b0:b92:3f59:26e with SMTP id 130-20020a250888000000b00b923f59026emr30221472ybi.41.1684242119121;
 Tue, 16 May 2023 06:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230512064925.133516-1-martin@geanix.com>
In-Reply-To: <20230512064925.133516-1-martin@geanix.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 16 May 2023 15:01:48 +0200
Message-ID: <CACRpkdbbCTGcLarqvzZ11oCrciCWVDs5SwAbf0E9N1M7xm==BA@mail.gmail.com>
Subject: Re: [PATCH RESEND] pinctrl: meson-axg: add missing GPIOA_18 gpio group
To:     =?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>,
        Yixun Lan <yixun.lan@amlogic.com>, stable@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 12, 2023 at 8:49=E2=80=AFAM Martin Hundeb=C3=B8ll <martin@geani=
x.com> wrote:

> Without this, the gpio cannot be explicitly mux'ed to its gpio function.
>
> Fixes: 83c566806a68a ("pinctrl: meson-axg: Add new pinctrl driver for Mes=
on AXG SoC")
> Cc: stable@vger.kernel.org
> Signed-off-by: Martin Hundeb=C3=B8ll <martin@geanix.com>

Patch applied for fixes.

Yours,
Linus Walleij
