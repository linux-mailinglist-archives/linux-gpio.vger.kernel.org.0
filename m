Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5A0E2180B2
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 09:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730223AbgGHHTb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 03:19:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730008AbgGHHTb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 03:19:31 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 219A3C08C5DC
        for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2020 00:19:31 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id b25so49341243ljp.6
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2020 00:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LnT3eplntVSO3TnnKwfNokLnknmvXCFbv6W9zfuLUC0=;
        b=VwpEs87iiiMruiQ5/fxvjctR1D7yZnGtEa3Un/i7qCRT4L+wpDUWQGSSOS+D1+21/R
         VIufQny35zNcZ4zh6YQC6tyH6o1M0H4ebsGuPxBHjUGesgtvon3KpitKJu9Gb9O4N76/
         MP4UMllpNN47WlgN9Do5VRG/sztbWPnt/Gv3hjwaXXQDuYCXltZc0sfNi6jO6p7UuU5m
         cVTXFx4N5Mv8EVERaxNtyS6YvzPc57t0aAqkl13c0zvjE99vEccSfA9sXXwwpdVtbnPN
         f26ZXNkQjUdHGDa8ZU0aI1p1ErJuxSQu4DOYn7EffkUmZPCQKluVmbqdULmQgWi0HDu0
         118w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LnT3eplntVSO3TnnKwfNokLnknmvXCFbv6W9zfuLUC0=;
        b=GyOegiXUj3VB9LG643nrlNoN46uLrjCSqyHMzlFPDSdj9pi9jI4llPfzOdD1WdNGBI
         +sVa9LzV/6RE2WPLR9s6V5PATEOhIYR2j1xcFGtIQauPwNq4uDOb34Z3RcfVvj4YluIJ
         o/Q6BNFk5vrTlhZ7VIch0/muHPQb6M686aoTCZDrOi01vM7dfoBp9kQj37nygknxofeS
         59+7qkwC8ZmOv080E1CC+XIHcN8gBte972ZI7VGQ7qZAFuFL0k18M6PS5muAhGEehyxN
         SIuZ9NOy1fB+TtgRVsCmpx2wtlUo4Vvrhx/3PlfpiS7h3OA5nitkGCF97ZuW98omc6ni
         KrVQ==
X-Gm-Message-State: AOAM532+Ls+U9/Waz8EkCydP5hr1uwPVsk2rXubC5LqVWltV2POuISGK
        6I31xoYpCzI07CKaXsrpuCmV5n+DSPW6KdFUedPbeQ==
X-Google-Smtp-Source: ABdhPJxlzaPzh7OZySnwtS2i+Y3my8fK+xpWXozFM6l6b8JYiDjlQi/s6JbdvsOKAAhxInlnD6DMbCxjZCPvl3UVXsg=
X-Received: by 2002:a2e:8046:: with SMTP id p6mr18621360ljg.100.1594192769561;
 Wed, 08 Jul 2020 00:19:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200630133345.2232932-1-lee.jones@linaro.org> <20200630133345.2232932-8-lee.jones@linaro.org>
In-Reply-To: <20200630133345.2232932-8-lee.jones@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 8 Jul 2020 09:19:18 +0200
Message-ID: <CACRpkdZW9GDcmEwsb8KOCrH9s6JJEAX_2=Qhw1h4bkcogiygaA@mail.gmail.com>
Subject: Re: [PATCH 07/10] gpio: gpio-it87: Fix formatting issues which
 confuse kerneldoc
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        =?UTF-8?Q?Diego_Elio_Petten=C3=B2?= <flameeyes@flameeyes.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 30, 2020 at 3:33 PM Lee Jones <lee.jones@linaro.org> wrote:

> Kerneldoc expects struct properties to be documented using the syntax
> '@.*: ', but no ':' has been provided in 'struct it87_gpio's
> header.  Add them to stop confusing kerneldoc.
>
> Fixes the following W=3D1 warnings:
>
>  drivers/gpio/gpio-it87.c:69: warning: Function parameter or member 'chip=
' not described in 'it87_gpio'
>  drivers/gpio/gpio-it87.c:69: warning: Function parameter or member 'lock=
' not described in 'it87_gpio'
>  drivers/gpio/gpio-it87.c:69: warning: Function parameter or member 'io_b=
ase' not described in 'it87_gpio'
>  drivers/gpio/gpio-it87.c:69: warning: Function parameter or member 'io_s=
ize' not described in 'it87_gpio'
>  drivers/gpio/gpio-it87.c:69: warning: Function parameter or member 'outp=
ut_base' not described in 'it87_gpio'
>  drivers/gpio/gpio-it87.c:69: warning: Function parameter or member 'simp=
le_base' not described in 'it87_gpio'
>  drivers/gpio/gpio-it87.c:69: warning: Function parameter or member 'simp=
le_size' not described in 'it87_gpio'
>
> Cc: "Diego Elio Petten=C3=B2" <flameeyes@flameeyes.eu>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Patch applied!

Yours,
Linus Walleij
