Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D3B87BFE72
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Oct 2023 15:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232276AbjJJNwq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Oct 2023 09:52:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232442AbjJJNwk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Oct 2023 09:52:40 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1867710EA
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 06:42:33 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-5a7af20c488so15736877b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 06:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696945352; x=1697550152; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NHv90yeM59s0sxqLXofNmRkQi512BP/YIHCc5n2XRV8=;
        b=vxZEcFScrsEJDK9tv1BoX3DsLYmBSFnmWQoUZH9HVgZWR23OyV7MpwptRhkemKUt/x
         phtaodpmmAPfMORdd72oCDzQ+ork9hngSy+CKbTHgRXEaqbTMKKrsd8T47QRtIthx0mE
         rbc2jxDzMtw7EPptU9e7TkHIfIZnz3KCfImR5k0MQ0mEp0N6Rh2pXx1zJElsmHHSzVZl
         asU9M7XSwyHVYwDhG/vHUiFl07+Qi5A8lQ1xzZxGFEnCaZ0fFge6Rmkxyq4XnMZhsxAj
         OOag22wF4MQ7EXz8qGVHgD0iUParlwHmdbvj7++W88E0N0q61VCK/qBpxDIXl8dU0gZP
         Jh6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696945352; x=1697550152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NHv90yeM59s0sxqLXofNmRkQi512BP/YIHCc5n2XRV8=;
        b=MV5w4SAeki2brj1Wyf7GbHX1+ghCQHgZTHSSH0Qf+FN0GExXbEMuXq1PyaMImnFmo8
         IC/t57UpiXAurUAapfHFDCMsiywSd/WpjJa+vUPB6YqzXLEVljk34vOI4SUdQW8Du1Yd
         T3OB+j9dx0B3+enhxmva1Pgx1Ehms/WBPmmufzoqFc3jw3X6s20FdYUCVlR5hAYTbyc3
         +UKsKhxzojFY+VWiQM/4BVtKL6TMRDJH2Qadc401CuLNNGW8OAdoZMtNd7eWVLw+fCyQ
         bA83IhHQoGKDHgbScT1+fWRVI4EWFdZXXNCGl6e/P0VsK8+0/LaQwAbilj2M23n3uwiq
         SIUw==
X-Gm-Message-State: AOJu0YzH0vTA/7bU3rej3EutIgIzwLkuOMr/fMxEekHMlCIpXIZU73EQ
        ESDLIypZ/GXAUU3GGFUTaO+hSLKC4TsRj0IJyik97Q==
X-Google-Smtp-Source: AGHT+IGNsJwnmmQA/OwxH8sKScOWP6t0fKFBGj5+E+gCuKw12wtPXcVUQL2NZqdH7G1/OZrUzycv/Tf44RgjgCeFxdY=
X-Received: by 2002:a81:5e0a:0:b0:59b:bed9:9a3a with SMTP id
 s10-20020a815e0a000000b0059bbed99a3amr20112991ywb.41.1696945352241; Tue, 10
 Oct 2023 06:42:32 -0700 (PDT)
MIME-Version: 1.0
References: <20231009083856.222030-1-u.kleine-koenig@pengutronix.de> <20231009083856.222030-15-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231009083856.222030-15-u.kleine-koenig@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Oct 2023 15:42:21 +0200
Message-ID: <CACRpkdaf5PeW8G-WHFFfBUG4VnsJjss1f0NkF-V5SZW7QfBzYA@mail.gmail.com>
Subject: Re: [PATCH 14/20] pinctrl: tb10x: Convert to platform remove callback
 returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
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
