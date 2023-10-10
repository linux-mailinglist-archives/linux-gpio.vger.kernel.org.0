Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1354E7BFE47
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Oct 2023 15:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232212AbjJJNpV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Oct 2023 09:45:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232938AbjJJNov (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Oct 2023 09:44:51 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 529D43262
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 06:42:05 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5a2536adaf3so69237357b3.2
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 06:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696945324; x=1697550124; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NHv90yeM59s0sxqLXofNmRkQi512BP/YIHCc5n2XRV8=;
        b=aSDiETKKlnt9oniV0fqiqS+VxAj46+QIh94yR6gXoDoGzOui/Hw2UkCUoa1+5BWJX3
         GCo+JKtsIvyalVhoY+Cb68vN8ZrPe4rcTCaD6D01AgF9ckI0AMrBI+Pw0cIUoPN1orlZ
         eETbpdK/uDuDBa7MDNV+czzk6Lsp7kWYrFLOXuPuWayKWajS2aCIAs2ubebSz2K+jczx
         u+ng4qboUPMiAYG9TBBWL5QKAIlRAXAVDYXMXIhxeKDcc/S0LvVuCs+1CmSUI3CQ3QNj
         WYWVP29XB7Nmq8Vx7wrfGx3Yt+3lVvpOs+ZjRQ3XVLhcwi9D6nAupNoaXgs2u/nmoHdN
         4hng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696945324; x=1697550124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NHv90yeM59s0sxqLXofNmRkQi512BP/YIHCc5n2XRV8=;
        b=acShydKMyet8jmbq3zWEWR/3gi6E+XuT4tZzF827Jaymle+Rbzjej8v40Oc1Ax41Tv
         x03Q753XBRkOY1ztpZ1S+pM2yVeJIoJw0bqYrVAQDdlfwwHqSkaUeBdiNAaDp5a6tTf0
         zze0lmohezEUe7fYvXQKxCd5Vum8tcmx9zqUajkxW7uz/D+mX5Rid03GirOgeChEz3TR
         gOg+pbo8EI4U9VFUwQKIPLqItH2BwpNIEnLTVq/ajGZcnrC++i2BsPdog4SJ1tfyZeJD
         VETUn0ha2h5YZ1FWGtYeU2/YrfmpRewNIo431XeG2t53Xrurqv84jlQERfDbWMCxprCy
         D4+A==
X-Gm-Message-State: AOJu0YxcvRvf9tAyJCotX5f3AcW5IlOgrvzeV8/ZKIm1L0cmQ+FYtSPm
        zGx67pFI+gnqoU7hlt3V7O+rJ+z6OfwAJbjVhVPt/A==
X-Google-Smtp-Source: AGHT+IF+FivLbJd4h5mpjqzG+FT5BbTXGsJ47whw63Zw+xMaA2NAf3r/Y348qQo5sHuP8ewYt1oWPN8xfz+tY7NKyrI=
X-Received: by 2002:a0d:d9d6:0:b0:589:fc81:952e with SMTP id
 b205-20020a0dd9d6000000b00589fc81952emr18207196ywe.7.1696945324216; Tue, 10
 Oct 2023 06:42:04 -0700 (PDT)
MIME-Version: 1.0
References: <20231009083856.222030-1-u.kleine-koenig@pengutronix.de> <20231009083856.222030-14-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231009083856.222030-14-u.kleine-koenig@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Oct 2023 15:41:52 +0200
Message-ID: <CACRpkdaSWbamnTRtwp-Cj_tSVQBh6nUVmJN478rczEiFpUNLgg@mail.gmail.com>
Subject: Re: [PATCH 13/20] pinctrl: stmfx: Convert to platform remove callback
 returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-gpio@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 9, 2023 at 11:22=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
>
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Patch applied.

Yours,
Linus Walleij
