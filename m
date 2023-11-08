Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A23197E57CC
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Nov 2023 14:08:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344568AbjKHNIV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Nov 2023 08:08:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344255AbjKHNIV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Nov 2023 08:08:21 -0500
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A961198D
        for <linux-gpio@vger.kernel.org>; Wed,  8 Nov 2023 05:08:19 -0800 (PST)
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-7b9c8706fc1so2364433241.0
        for <linux-gpio@vger.kernel.org>; Wed, 08 Nov 2023 05:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1699448898; x=1700053698; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0W9CGzcTGEOZ/PBRMWq9ocU+tqxgRZZG2fVVjH0MiUQ=;
        b=is0K+4h9riL4QJFw72+ysAxfCNCDr1MJuJQ+rnRj1VA2+yJ/iMjXgDPijJcHSeAC2I
         cBB8iFZySePfbuxUhNyOG3HrwI+gsbttn3W2b/VpR1md0cEPeQJBuRVcfQhMRrqJg51Y
         9yNppzLUHVYFao3Gtk+oTYDBoEtpvIaEflioYi1IViYHY/ChERIIhWo+p0rkHJO67vp+
         LMGRByBcdYDmt2GEgdRuSGsRFOrCzFavv32h4V7DhXRPt/bvtEGUwv8Fgir7Xp/U8XFY
         aZuqJox/nTXNjB+GlOPA5V6to2zfMv5KomYqZBqoj/vLGk9Q0q656rlQQ0I2wIKbcW/M
         kpEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699448898; x=1700053698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0W9CGzcTGEOZ/PBRMWq9ocU+tqxgRZZG2fVVjH0MiUQ=;
        b=MRVZGhY+36BsCtWK+eg7zB4pYCWV/9ceI4MuHePUEwvX4ay5F8H/KB0lpuFWb/8pVk
         8NyNChmUtqL2QcUyaQ/JtML2Cc0OPkipbzROpEtgtk3at50DkJ/jtOnGs6XBlU40b0zt
         c0NXisMLrWCtQ/pMhRzuqYDVwXQWA8Mp1ucjBhINuurT+lr5W7J6wh0pfHjkFD3MugmA
         zvlYE2hd06UZaG2c/Xxx+3mw7kelGf3UsOcZsg7lTfTH6Ie4a1zx61vBVj/XtVlGktvs
         IyEDSRQWMkFQEYGix876ZTp6domFTgjS37Saa8KyHRUtquG5H1MRksyeCcpsTOjCDRL8
         hLJQ==
X-Gm-Message-State: AOJu0YwqYD91p+CffzGuccteJXZiATO2PTWTVrg/uUgEt/I+BKW+bdBF
        TttcDXyyEnzVbGpQarNhaw3LB+JqCDirUDDO2eTU2w==
X-Google-Smtp-Source: AGHT+IH9cifNQq/XgiVki4uDqI9VaGyBG/jjYkKC412Xh41MFnVd/ZI2eFmhCGj+YBRJAbJwnlJTKEMdamaoVIOFOVg=
X-Received: by 2002:a67:ab44:0:b0:45d:86bb:db8f with SMTP id
 k4-20020a67ab44000000b0045d86bbdb8fmr1455913vsh.0.1699448898161; Wed, 08 Nov
 2023 05:08:18 -0800 (PST)
MIME-Version: 1.0
References: <20231107134718.2913223-1-phil@gadgetoid.com>
In-Reply-To: <20231107134718.2913223-1-phil@gadgetoid.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 8 Nov 2023 14:08:07 +0100
Message-ID: <CAMRc=MeGp7+UN52-2sh_gTea+y2evbyseJ+rko9-=3vDT46=ZQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] bindings: python: fix library path for python test builds
To:     Phil Howard <phil@gadgetoid.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 7, 2023 at 2:47=E2=80=AFPM Phil Howard <phil@gadgetoid.com> wro=
te:
>
> Correct top_srcdir to top_builddir for out of tree builds.
>
> Signed-off-by: Phil Howard <phil@gadgetoid.com>
> ---
>  bindings/python/Makefile.am | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/bindings/python/Makefile.am b/bindings/python/Makefile.am
> index 079ceb1..b2f2779 100644
> --- a/bindings/python/Makefile.am
> +++ b/bindings/python/Makefile.am
> @@ -15,7 +15,7 @@ all-local:
>         GPIOD_WITH_TESTS=3D$(BUILD_TESTS) \
>         $(PYTHON) setup.py build_ext --inplace \
>                 --include-dirs=3D$(top_srcdir)/include/:$(top_srcdir)/tes=
ts/gpiosim/ \
> -               --library-dirs=3D$(top_builddir)/lib/.libs/:$(top_srcdir)=
/tests/gpiosim/.libs/
> +               --library-dirs=3D$(top_builddir)/lib/.libs/:$(top_builddi=
r)/tests/gpiosim/.libs/
>
>  install-exec-local:
>         GPIOD_WITH_TESTS=3D \
> --
> 2.34.1
>

Phil, please squash these two patches together as you're modifying a
line in the first one just to change it again in the second.

Bart
