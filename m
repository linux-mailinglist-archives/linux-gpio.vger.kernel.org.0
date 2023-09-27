Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8446E7AFB9C
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Sep 2023 09:02:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbjI0HCU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Sep 2023 03:02:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbjI0HCR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Sep 2023 03:02:17 -0400
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EC2BF4
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 00:02:16 -0700 (PDT)
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-7ab5150a7b5so7069129241.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 00:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695798135; x=1696402935; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PIhw6V2vNvwuHPJdanJymYad1CWCeReXt9hAkVYiSu8=;
        b=UUgp2qkBRuw7atZO+bq6YhZnv2XP7IXd16nAdUZoFPR6yYKrrje3qoKCG8PWe+lXZA
         wvB6L/b2+jWifMiFq2LqfScOb5McaPyr2PYzZvk/ALoL6VW2SHkFRXRTaOUvDD1IGoHf
         ITmQj2ihroFVxBp29v3yyrtt+7r4ErTriCU25/tuGZFctbEV2L4PwyKDhg1o6oBDNOGT
         HP1HGeGNkUro89LmwjFXv9IxiUI4w2v3dQP6TpVZoFaNzNKjsYz9lDXyuSXIwU0eiwqt
         Dud/Vjhj74jiZ3HK5VGJR00Uvdcm+B5JEEbgSrmp3KrKxH+4A1JhuTZCA4KDgkZniqJM
         tmMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695798135; x=1696402935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PIhw6V2vNvwuHPJdanJymYad1CWCeReXt9hAkVYiSu8=;
        b=bM06dngHP4pjbvwWPCcVrFCGWJdrBZ7BXa34xfPQRa634hZHhDbpHqeSlCVTwSy6Cm
         7uPyZl/80lnbaB5wi18gGDqacAeQqZc1XovtzOVufVRAAmHPqfKZMvY0b82HDdNl7ynT
         msh+T37uo2Mq4LiDZ+ZwvuV+5HQmctv7hy9MLoAJEolEcvXimwBVul+Mx9YydL2kb+w7
         CnCy3sefXJMkkOIOZOx+toYHZHWSqPtZjsRV+x8Igy38ItB2dod0pkYwHHGLf8km/htu
         hoBU19QBJQBeYwS0HYealiEgttskaJq9K2DtnfZ9axJWoLOz1LsLh/tjmXC4YDMbSmQI
         MVyQ==
X-Gm-Message-State: AOJu0YzjOVB2bxnQmRRvSG5PMMan2+3zHyY7MFLfCjfbcMSTQ1EIz/5N
        PktS8o5ChQ6QN4S32hVIRvvlCSsGBGncTPPDdqY/UQ==
X-Google-Smtp-Source: AGHT+IFeBg+cETieioky1nVVQRLBCT9NkB2t+sJgbjsopgLmTzgcBajxJFtqUg5cY06CWtryBPEjDMHEXp1rIT8Co8E=
X-Received: by 2002:a05:6102:3e0f:b0:450:985f:ef28 with SMTP id
 j15-20020a0561023e0f00b00450985fef28mr2450526vsv.5.1695798135672; Wed, 27 Sep
 2023 00:02:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230926145943.42814-1-brgl@bgdev.pl> <20230926145943.42814-3-brgl@bgdev.pl>
 <ZRL4PYeX21bwCPR0@smile.fi.intel.com>
In-Reply-To: <ZRL4PYeX21bwCPR0@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 27 Sep 2023 09:02:04 +0200
Message-ID: <CAMRc=Mf7P4sWdhgTV+jVD8HEVpxbSuGK8JjJb5Q9djCkKUeUcg@mail.gmail.com>
Subject: Re: [RFT PATCH 2/4] platform/x86: int3472: led: don't use gpiod_toggle_active_low()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 26, 2023 at 5:27=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Sep 26, 2023 at 04:59:41PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Instead of acpi_get_and_request_gpiod() + gpiod_toggle_active_low(), us=
e
> > temporary lookup tables with appropriate lookup flags.
>
> ...
>
> > +     int3472->pled.gpio =3D skl_int3472_gpiod_get_from_temp_lookup(
> > +                             int3472->dev, path, agpio->pin_table[0],
> > +                             "int3472,privacy-led", polarity,
> > +                             GPIOD_OUT_LOW);
>
> Personally I found this style weird. I prefer to have longer line over
> the split on the parentheses.
>

I in turn prefer this one. Checkpatch doesn't complain either way so
I'll leave it to the maintainers of this driver to decide.

Bart
