Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5D38724780
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jun 2023 17:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238312AbjFFPUL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Jun 2023 11:20:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238572AbjFFPUI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Jun 2023 11:20:08 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCF3D1B5
        for <linux-gpio@vger.kernel.org>; Tue,  6 Jun 2023 08:20:06 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b1c910ee19so31808901fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 06 Jun 2023 08:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686064805; x=1688656805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/LnXkFreLui9UjFdMRisW04zQV80b0oRimm/wsXE8M=;
        b=SHU9bHqswB74Jon2N2DjESsLFkTRsGt8vQaz3nE5CRyoNZGhO60A+dLyzRw39YI6mq
         coo9Xah0KdTKGkalafW3K7Kgli/4iV1vajWFSdBxzxUXTVvO2Zf/+TycGEEwge5sNeC1
         rTCUusFyQ3Y9VtubdLQODt44Qs+Mtm8wWTX1Ppz6ss2f6cpeC85WbicY5oYV86vhujQL
         USO3eCtuQjsg9Heh7z+20qJMMQ39LA+WkUvUjYZqHuaeYaNTN6S/oWyiifxB6CqIi5/j
         NUtZLvscVTs3y6lF7tA2IDuL8sYuqGUiT5U2j9VfK72mvurnmwCqdceK/BEmmksj1FYj
         CZ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686064805; x=1688656805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p/LnXkFreLui9UjFdMRisW04zQV80b0oRimm/wsXE8M=;
        b=Ayavdec+zFdlE2cHqmiucAgM0tKIQTGurmxsT6Zb7pFtwtH8Mj+JjKRcF4Cda1NvLV
         i/wkiFOknP7VjnlZS+e0ljp3x8MwTucGG9ccK2nlGd+WqDRPo595hqGGKOgnbl8iy3Wr
         kBmuIu0XlqTSPzLVNXOFjfZKTjZvmDTn0I6ryOSy4v4p9iAQHhus9+bXuOhxB4iZygY8
         eVTROn5HmsWM9ZQFJ5DjP5VbaIE28bWzzixSct/t95W/44kIcBb5caRUT/OKRnAC6B4d
         oBNbfdyKGKoysVn7MrawjIwEZporg5HjhV+IsX2vQoFYXiFWIWedjl5QKt3M4LPs/cpe
         2fyw==
X-Gm-Message-State: AC+VfDynNgV9j/KJ34Fq6QTJXKTrKf9P0zxzP8S77WHfEzId3UY4HWhJ
        Wt6f2inDRSvZEofKKVDQJBXuH7px3gXWDBiDi9Rgc3rLKuOf79e7
X-Google-Smtp-Source: ACHHUZ4ayQs7VIybukhoewxhJ/2SJMV+uFE5Er8PrglJU5w+WybwN9DFdrNvrdTBJrlok5XlXFMng/cOWeRQUjmQZZE=
X-Received: by 2002:a2e:3216:0:b0:2a8:c42f:6913 with SMTP id
 y22-20020a2e3216000000b002a8c42f6913mr1195265ljy.36.1686064805097; Tue, 06
 Jun 2023 08:20:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230605204335.4060789-1-joe.slater@windriver.com> <CAMRc=McsF9B+csnbTpmW30hfogkT6U=X6wi3TTJEwmVBF-OBfQ@mail.gmail.com>
In-Reply-To: <CAMRc=McsF9B+csnbTpmW30hfogkT6U=X6wi3TTJEwmVBF-OBfQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 6 Jun 2023 17:19:53 +0200
Message-ID: <CAMRc=MdLFQ6U6Mu5LoEwO2CsvE7V8S4Wy7RNRM+idje-qvCoww@mail.gmail.com>
Subject: Re: [v3][libgpiod][PATCH 1/1] gpio-tools-test.bats: modify delays in
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

On Tue, Jun 6, 2023 at 5:16=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> On Mon, Jun 5, 2023 at 10:43=E2=80=AFPM <joe.slater@windriver.com> wrote:
> >
> > From: Joe Slater <joe.slater@windriver.com>
> >
> > The test "gpioset: toggle (continuous)" uses fixed delays to test
> > toggling values.  This is not reliable, so we switch to looking
> > for transitions from one value to another.
> >
> > We wait for a transition up to 1.5 seconds.
> >
> > Signed-off-by: Joe Slater <joe.slater@windriver.com>
> > ---
> >  tools/gpio-tools-test.bats | 24 +++++++++++++++++++-----
> >  1 file changed, 19 insertions(+), 5 deletions(-)
> >
> > diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
> > index c83ca7d..05d7138 100755
> > --- a/tools/gpio-tools-test.bats
> > +++ b/tools/gpio-tools-test.bats
> > @@ -141,6 +141,20 @@ gpiosim_check_value() {
> >         [ "$VAL" =3D "$EXPECTED" ]
> >  }
> >
> > +gpiosim_wait_value() {
> > +       local OFFSET=3D$2
> > +       local EXPECTED=3D$3
> > +       local DEVNAME=3D${GPIOSIM_DEV_NAME[$1]}
> > +       local CHIPNAME=3D${GPIOSIM_CHIP_NAME[$1]}
> > +       local PORT=3D$GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/=
value
> > +
> > +       for i in {1..15}; do
> > +               [ "$(<$PORT)" =3D "$EXPECTED" ] && return
> > +               sleep 0.1
> > +       done
> > +       return 1
> > +}
> > +
> >  gpiosim_cleanup() {
> >         for CHIP in ${!GPIOSIM_CHIP_NAME[@]}
> >         do
> > @@ -1567,15 +1581,15 @@ request_release_line() {
> >         gpiosim_check_value sim0 4 0
> >         gpiosim_check_value sim0 7 0
> >
> > -       sleep 1
> > -
> > -       gpiosim_check_value sim0 1 0
> > +       # sleeping fixed amounts can be unreliable, so we
> > +       # sync to the toggles
> > +       #
> > +       gpiosim_wait_value sim0 1 0
> >         gpiosim_check_value sim0 4 1
> >         gpiosim_check_value sim0 7 1
> >
> > -       sleep 1
> >
> > -       gpiosim_check_value sim0 1 1
> > +       gpiosim_wait_value sim0 1 1
> >         gpiosim_check_value sim0 4 0
> >         gpiosim_check_value sim0 7 0
> >  }
> > --
> > 2.25.1
> >
>
> I applied this version as it no longer breaks my qemu tests. Please
> feel free to send it for meta-openembedded now with Upstream-status
> set to accepted and make sure to Cc me.
>
> Bart

I actually applied v4, just responded here by mistake.

Bart
