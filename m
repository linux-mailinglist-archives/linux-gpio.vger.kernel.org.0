Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDBF87B7386
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Oct 2023 23:51:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232502AbjJCVvY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Oct 2023 17:51:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232457AbjJCVvX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Oct 2023 17:51:23 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2657A1
        for <linux-gpio@vger.kernel.org>; Tue,  3 Oct 2023 14:51:19 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-59c268676a9so17874167b3.0
        for <linux-gpio@vger.kernel.org>; Tue, 03 Oct 2023 14:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696369878; x=1696974678; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IYSo37MNMNSHe1ppr3BExCLjoNGDWxayjSiu18PcIu8=;
        b=ri27ITsjTSgvn+nIfF0YFxTY+F0Fxw7G4FAcxQgvpz4KU2OQm/I+s8RPdt/za4zzCg
         Qo52DZ4C1srFUPa1v40iR0FRX3R3hJ+m5h38l6V7E3JSB/uQZOgihnt/imbto6Y+Ov0G
         pkz+4H9PCTOQg4rJpfGgeycyewVIysU0BUVCLgeu+jGaUgUm5r0AlfDF0+pNzR9VTcEj
         6uwJjHa4H9c6JMCz0dAd4DkRwrA3BIXcAl202z1TzpkWmLNwYkNbreclqc9sco+xeKaV
         DTyMHX361ef1kEA3yerNtiOU7YVvMh/y+bvBvRKm+4lsp+xCxJjzCtl+9bqvIfPdonof
         gwBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696369878; x=1696974678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IYSo37MNMNSHe1ppr3BExCLjoNGDWxayjSiu18PcIu8=;
        b=FHJ486LZR4VjlY0IxC6AGODFh8WmYu0Smx+qS4x0hBrcKGxO1bgqZlJH9bhQhmPN/2
         51+5sTukuVjwQg+gTVw93+Ic/zNDPvmtRJ0+FgVlV9apTJPm3t7cDyDmZ+YaBmcl/QuZ
         QzsfSjMi/b/d1svQ8lf0SAxpnnevqHwZ6/5SBeZ06hazJTzcmmNXM0QRV9SSJK9piCA7
         gYGWu3MCLiCEgHCjTtu/wjLkMYNiajbN8PtzalktY1mF8tG/XDg3QFH+Swi+A5puzlly
         Pv2CKwEQo0jeflJ85SH/sRtwA1KbwPgRpvIrNpvdWGu3oTHFxOtbPNdtwzT+36jeZupE
         eTLQ==
X-Gm-Message-State: AOJu0YzV2ImaHj+BClPsuato4Lb0EaLTJGYNBKt/gCa9Y3GrF1qJChg4
        TLTMB/YJGY4cLhRzRDB7dR5JOI/fLthkNL/R7fqg+Q==
X-Google-Smtp-Source: AGHT+IFpAKaZcePQhrSK//gT7QKNjoNg5pwUIjzpRPi/IB8Rlk7anbHUuBthbP5VTQuPBwdWJWqTtFXTIqF0Q54meQM=
X-Received: by 2002:a81:4f85:0:b0:59f:4c75:1314 with SMTP id
 d127-20020a814f85000000b0059f4c751314mr925263ywb.4.1696369878633; Tue, 03 Oct
 2023 14:51:18 -0700 (PDT)
MIME-Version: 1.0
References: <20231003145114.21637-1-brgl@bgdev.pl>
In-Reply-To: <20231003145114.21637-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 3 Oct 2023 23:51:06 +0200
Message-ID: <CACRpkdY03QUkHcmyfTTfvVFbmNujW3qg5GcNJ-=8zj_zvGqDeg@mail.gmail.com>
Subject: Re: [PATCH 00/36] pinctrl: don't use GPIOLIB global numberspace in helpers
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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

On Tue, Oct 3, 2023 at 4:51=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We have a set of pinctrl helpers for GPIOLIB drivers that take a number
> from the global GPIO numberspace as argument. We are trying to get rid
> of this global numbering. Let's rework these helpers to use the
> recommended gpio_chip + controller-relative offset instead.
>
> This work is split into phases: first let's introduce the new variants
> of the helpers. Next: let's convert all users one-by-one for easier
> review. Finally let's remove the old helpers and rename the new variants
> to take the place of the old ones.

Almost too good attention to process here, I hope you used some
tooling and didn't do all this by hand...

I reviewed it by applying the lot with b4 on a branch off
my devel branch, and

git diff devel..HEAD

which shows what the goal of the patches is and since the
kernel clearly looks better after than before the patches:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Or I can just merge this branch into my devel (for v6.7)
branch, and offer you the same as immutable.
Which is my plan.

Shall I just do it?

Yours,
Linus Walleij
