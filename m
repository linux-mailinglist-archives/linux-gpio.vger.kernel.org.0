Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB968724772
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jun 2023 17:18:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237685AbjFFPSF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Jun 2023 11:18:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231178AbjFFPSF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Jun 2023 11:18:05 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08C718F
        for <linux-gpio@vger.kernel.org>; Tue,  6 Jun 2023 08:18:04 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f60a27c4a2so7320194e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 06 Jun 2023 08:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686064682; x=1688656682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5AuxoqrwkQZSjIMKdMUTNGrtAy8t+MWhWjAMZaSuFlw=;
        b=n0k7d+rYfD7QtJRCr4z+2sle9HKUO7qk27pcvo4j+aGGCEohF8Qew5Zo5jkDcV0qi2
         vCbHT2sc/QSaUAb6lk/uJRCwodzaR/uTvB+ChRiSnpGykfmo0k5Tz8n8D71MFlkTyarz
         XmTi8wCJ/ghu/ObKc6SVb/oVSNkhBKRLGuLgpn6c+2elAOcW4xbQplA4PckPF59zAndn
         tMLOemLoSOwemDfUm3kH0nEpKAHIxzkvKwK+/WvZsP8TDxSi0fah27LWsTN6Qi7CeHj/
         tCf4Q0TwAnvd6xJwDa+3X6CZr8Kxw4TSbvOFOsrV49/C+I9l7NtHp2pQumZEg/QseXpH
         oH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686064682; x=1688656682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5AuxoqrwkQZSjIMKdMUTNGrtAy8t+MWhWjAMZaSuFlw=;
        b=ZiSuGl5GdURQg/8FfPbvJMiXLZhGsDyTdbiXuzbiFimrJN+SLioiylP19dWRyU2hkX
         GiNRJxJmt2dsSoCSuury5YQl1LhF70fqQL+tO6loFNzziClfDnVo9egb1EYG+Yff/71Q
         9LdUd8SouPGONb9A/GKEEoKHAjBJsk4X+l0pfpPzB6xH565J+bVlvxzFWUIPPg+Yh47P
         TfYvdVKugqBgcnDHRzTkYLxUp4a4NeAAb8HSSVrTJy1AsAs4aTt/0UPEtl92ll+a8NHB
         qrBLzKR0IFvVFeySjNvyvHzggPKmgQjTjtAnOtOMMHDOdFkGzk1r2fRfsDqGWmZnEqc0
         mfBA==
X-Gm-Message-State: AC+VfDyz4scwmZQ7SCKmYRxwDXJtfZ4asyemS0ecWCPx4md5nIReO5ou
        jYrqu3ORLS90MsTQhbCcag1sexNWpEqwV7ER0aDvZI/YGzo2P/TK
X-Google-Smtp-Source: ACHHUZ57qGI8V2hGv5YTmInyrrkQU03eGUDjwIGHcKNKjJmNBnlsUw8eoQvWrZTCIUwwKD6ANBMsBojao2YfRAI/lEA=
X-Received: by 2002:ac2:47e8:0:b0:4f3:8260:f18c with SMTP id
 b8-20020ac247e8000000b004f38260f18cmr960911lfp.57.1686064682311; Tue, 06 Jun
 2023 08:18:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230606150427.3999216-1-joe.slater@windriver.com>
In-Reply-To: <20230606150427.3999216-1-joe.slater@windriver.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 6 Jun 2023 17:17:50 +0200
Message-ID: <CAMRc=MeLKL33qYD5AR+SFoYhapSwzKC74OyfM339-Q6nRw2wDA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v4] gpio-tools-test.bats: modify delays in
 toggle test
To:     joe.slater@windriver.com
Cc:     linux-gpio@vger.kernel.org, randy.macleod@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 6, 2023 at 5:04=E2=80=AFPM <joe.slater@windriver.com> wrote:
>
> From: Joe Slater <joe.slater@windriver.com>
>
> The test "gpioset: toggle (continuous)" uses fixed delays to test
> toggling values.  This is not reliable, so we switch to looking
> for transitions from one value to another.
>
> We wait for a transition up to 1.5 seconds.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  tools/gpio-tools-test.bats | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
> index c83ca7d..929c35a 100755
> --- a/tools/gpio-tools-test.bats
> +++ b/tools/gpio-tools-test.bats
> @@ -141,6 +141,20 @@ gpiosim_check_value() {
>         [ "$VAL" =3D "$EXPECTED" ]
>  }
>
> +gpiosim_wait_value() {
> +       local OFFSET=3D$2
> +       local EXPECTED=3D$3
> +       local DEVNAME=3D${GPIOSIM_DEV_NAME[$1]}
> +       local CHIPNAME=3D${GPIOSIM_CHIP_NAME[$1]}
> +       local PORT=3D$GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/va=
lue
> +
> +       for i in {1..15}; do
> +               [ "$(<$PORT)" =3D "$EXPECTED" ] && return
> +               sleep 0.1
> +       done
> +       return 1
> +}
> +
>  gpiosim_cleanup() {
>         for CHIP in ${!GPIOSIM_CHIP_NAME[@]}
>         do
> @@ -1567,15 +1581,12 @@ request_release_line() {
>         gpiosim_check_value sim0 4 0
>         gpiosim_check_value sim0 7 0
>
> -       sleep 1
> -
> -       gpiosim_check_value sim0 1 0
> +       gpiosim_wait_value sim0 1 0
>         gpiosim_check_value sim0 4 1
>         gpiosim_check_value sim0 7 1
>
> -       sleep 1
>
> -       gpiosim_check_value sim0 1 1
> +       gpiosim_wait_value sim0 1 1
>         gpiosim_check_value sim0 4 0
>         gpiosim_check_value sim0 7 0
>  }
> --
> 2.25.1
>

I responded to the wrong email. I applied this one and tweaked the
commit message.

Bart
