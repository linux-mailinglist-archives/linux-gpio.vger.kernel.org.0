Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 087357CC1C2
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 13:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234608AbjJQLaZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 07:30:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232134AbjJQLaZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 07:30:25 -0400
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82FA59F
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 04:30:23 -0700 (PDT)
Received: by mail-vs1-xe2c.google.com with SMTP id ada2fe7eead31-457dc26ec2eso956808137.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 04:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697542222; x=1698147022; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ht7dqgeM1k2cHC8khLAP7axm5/375nZRaSd8x4a2RJM=;
        b=0D5OpBHbnbF/vWWDxPMYQFlvTn4ixDGWlMwW7aSAEu1pDq7LvuVuT0lTu+4Rp0Or15
         29D8j7pSK9bjZiC6DtglUkEmo5DLtMMxKmq84bsOTTQ8r1s8H6v4itqKqWEjqzV49Vto
         DVFW9f+EDrxBTD2fJehynU3UiM/k5tmib/NLpUz/X1ICIQs/QXktuYn7N2Bz5QeJ/q3p
         hvYI9GQ/f+acicoMrsuQWGi2OcdY1mk/fEe4hSVjCnKKbd2oN2mHxmy8GGOHZAGfqlzg
         8eVC3ISw/SH1FtfoUvkIM6qh7zQmkCPUrl56m2iC/DAlfjDrgqq0I2RA+cLgcCXBhzoS
         FJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697542222; x=1698147022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ht7dqgeM1k2cHC8khLAP7axm5/375nZRaSd8x4a2RJM=;
        b=v7sI9VmOe2tdfb0TllzQP5rZnARd3UIIWar7/UctNGqmbPk8WHw/kLT0pBe5IBCmYn
         7Tj9gUWL5ZfYM0i9NKsmnduXIrQscALuNQbRudbHI2QzIFfSGUUHUkJD3+3Q65FVhlCt
         9Oul8n3FSROGYJWpFQLjuVTLGrPr//UVENs25Z+KqHClo+NId4xA7AJ+0MgVyAXFZZYs
         Gk71oLsDNagih+rGRGofQBzqjABNa/GUyztpQJ1LvHgFKLMdT7sD1LK7vkvtor3spwx/
         U4Jt6/FP9ENA6J7iZ2Qs1phftpl0Oxm6FaAMwQOSjwC49tpIKTOaDLTcMobxpnTr77b3
         BM4g==
X-Gm-Message-State: AOJu0YyT2VwX01aYp78sFHTE1p5jHPK5rX/dzjlD0QVuJKOMpwOR6mwP
        pZbmLO3n8Z/w/949+eCvAdjxZ6O2IkMHoV+owgj3Tg==
X-Google-Smtp-Source: AGHT+IF2utlehz34sUvlA5SM1ACVwVnmxIwlhncgjPJc3sEaxuyMPmKrJQ9X5vCfcOYgXRw1y6AIOspA3l+mHAJN8xQ=
X-Received: by 2002:a67:e183:0:b0:458:1b5:11f8 with SMTP id
 e3-20020a67e183000000b0045801b511f8mr235813vsl.21.1697542222662; Tue, 17 Oct
 2023 04:30:22 -0700 (PDT)
MIME-Version: 1.0
References: <20231016151848.168209-1-phil@gadgetoid.com> <20231016151848.168209-2-phil@gadgetoid.com>
In-Reply-To: <20231016151848.168209-2-phil@gadgetoid.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 17 Oct 2023 13:30:11 +0200
Message-ID: <CAMRc=MdC1xYsV3WS95G_Ai7_kuc7o-xxYUdmh1hZ6i=cbkKJOg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v4 1/1] bindings: python: optionally include
 module in sdist
To:     Phil Howard <phil@gadgetoid.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 16, 2023 at 5:18=E2=80=AFPM Phil Howard <phil@gadgetoid.com> wr=
ote:
>
> Optionally vendor libgpiod source into sdist so that the
> Python module can be built from source, even with a missing
> or mismatched system libgpiod.
>
> Add optional environment variable "LINK_SYSTEM_LIBGPIOD=3D1"
> so that the sdist package can optionally be built and
> linked against a compatible system libgpiod.
>
> eg: LINK_SYSTEM_LIBGPIOD=3D1 pip install libgpiod
>
> Update build to add an additional sdist target for upload
> to pypi. Call setup.py with "GPIOD_VERSION_STR" set, which
> triggers a vendored package build. "GPIOD_VERSION_STR" is
> saved to "gpiod-version-str.txt" and included in the sdist
> for standalone builds.
>
> "GPIOD_VERSION_STR" must be specified in order to produce
> a standalone buildable sdist package, this requirement
> implicitly preserves the old build behaviour.
>
> Signed-off-by: Phil Howard <phil@gadgetoid.com>
> ---
>  bindings/python/MANIFEST.in |   5 ++
>  bindings/python/Makefile.am |   3 +
>  bindings/python/setup.py    | 122 +++++++++++++++++++++++++++++++-----
>  3 files changed, 114 insertions(+), 16 deletions(-)
>
> diff --git a/bindings/python/MANIFEST.in b/bindings/python/MANIFEST.in
> index c7124d4..acf9391 100644
> --- a/bindings/python/MANIFEST.in
> +++ b/bindings/python/MANIFEST.in
> @@ -2,6 +2,7 @@
>  # SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@=
linaro.org>
>
>  include setup.py
> +include gpiod-version-str.txt
>
>  recursive-include gpiod *.py
>  recursive-include tests *.py
> @@ -11,3 +12,7 @@ recursive-include gpiod/ext *.h
>
>  recursive-include tests/gpiosim *.c
>  recursive-include tests/procname *.c
> +
> +recursive-include lib *.c
> +recursive-include lib *.h
> +recursive-include include *.h
> diff --git a/bindings/python/Makefile.am b/bindings/python/Makefile.am
> index 079ceb1..7fadf52 100644
> --- a/bindings/python/Makefile.am
> +++ b/bindings/python/Makefile.am
> @@ -16,6 +16,9 @@ all-local:
>         $(PYTHON) setup.py build_ext --inplace \
>                 --include-dirs=3D$(top_srcdir)/include/:$(top_srcdir)/tes=
ts/gpiosim/ \
>                 --library-dirs=3D$(top_builddir)/lib/.libs/:$(top_srcdir)=
/tests/gpiosim/.libs/
> +       GPIOD_VERSION_STR=3D$(VERSION_STR) \

I suppose I can remove this line now?

Bart

[snip]
