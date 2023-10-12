Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9FE17C7651
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Oct 2023 21:07:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235770AbjJLTH4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Oct 2023 15:07:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbjJLTH4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Oct 2023 15:07:56 -0400
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A95CB83
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 12:07:54 -0700 (PDT)
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-457c134a702so39358137.1
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 12:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697137674; x=1697742474; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Okw/blO2N8YRJLAoUYPE0S/faOkpGW5PoZ4kdiOPWc=;
        b=iskRn0rWF339mm0Na1FNJDtVRvWulBdk5d6/zIgfnrEHU/FAJIel8C5SxuEXNOb7rp
         AkD4KM74/VyCzSFl6RFOed59c42MbB8Jwgs6H6cPMB8aSpdkSkG+VqqFLAr4a+dEDW8s
         NLAJkhS+PIngIwmk8EwZAKIWfLiwnVukBf24aNM0jDlSOvSEPFXLwyBl9x0Oih1FnObO
         F3iMzo5s5MBewtz8+4HZhi854iqmZhgMaTjnJfZ0KNUn+s/rfLVi2EVEaZ8K4UYv8Pr/
         e/CBM9qABpd08/7mY/BAe8lTi4/71LlmeVKgXtd3+KxkClPFc5hZFTX3TXg16pPmBVk0
         oldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697137674; x=1697742474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Okw/blO2N8YRJLAoUYPE0S/faOkpGW5PoZ4kdiOPWc=;
        b=LzkQ0TrfAf7hhXxgRvTKJX1+gx4wkD8nurW5IsO4jfRSylu9RhHISCYF32gEBevsnC
         Yc1VsUDdoYRHnyqoF9GmBDkBuXMn16JJDsPvfccqICU6SZ7zuuy5+NmqOtQGmmZYEFOm
         5mzZFjksPj5+asDB8WEWaMFAiRNYxcWG7rXn7eqZgxUFfUSe+fgehjNbQ+85n1a1JjpN
         e7agWR6wHQcxBzLgrJjHSUf9jbAHw6B9TglWvR4uCE8hlFekU6pjQY+wXvL+Pz1T0sW2
         LFbgeqzvyaRZW7weX2blvPlB+N2yhFuBNLyjMqqFDupqP7aAI95iU+J9a7ncmixwi4wi
         M7Cg==
X-Gm-Message-State: AOJu0YyueG1QQXk231+kmC1RIWhrQEOu98vg6wYoe9JffPJFUmfneQIW
        GSTXGCn5W3XlT9c52B0EwnRR+WtUdYfHFu/AJFsY/g==
X-Google-Smtp-Source: AGHT+IHHVawg512gdTklCRn4uwJL0wxamEP0WHM5TA8m7ei3rLBXDDhiLhyUN58MOgcfmvBtCkWPYJuN7T8/IOPYV2I=
X-Received: by 2002:a67:ea05:0:b0:44d:4aa1:9d44 with SMTP id
 g5-20020a67ea05000000b0044d4aa19d44mr18062146vso.8.1697137673687; Thu, 12 Oct
 2023 12:07:53 -0700 (PDT)
MIME-Version: 1.0
References: <20231011121246.9467-1-phil@gadgetoid.com> <20231011121246.9467-4-phil@gadgetoid.com>
In-Reply-To: <20231011121246.9467-4-phil@gadgetoid.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 12 Oct 2023 21:07:42 +0200
Message-ID: <CAMRc=MdoJMZHmou7xC=G6OgiO_3z1OVL60uGW703f+B2dx2VHg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 3/3] bindings: python: require python 3.9.0
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

On Wed, Oct 11, 2023 at 2:13=E2=80=AFPM Phil Howard <phil@gadgetoid.com> wr=
ote:
>
> Required minimum version for PyModule_AddType helper.
>
> Signed-off-by: Phil Howard <phil@gadgetoid.com>
> ---
>  bindings/python/setup.py | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/bindings/python/setup.py b/bindings/python/setup.py
> index 2e25981..fbba7ab 100644
> --- a/bindings/python/setup.py
> +++ b/bindings/python/setup.py
> @@ -91,6 +91,7 @@ if "GPIOD_WITH_TESTS" in environ and environ["GPIOD_WIT=
H_TESTS"] =3D=3D "1":
>  setup(
>      name=3D"libgpiod",
>      packages=3Dfind_packages(exclude=3D["tests", "tests.*"]),
> +    python_requires=3D">=3D3.9.0",
>      ext_modules=3Dextensions,
>      cmdclass=3D{"build_ext": build_ext},
>      version=3D__version__,
> --
> 2.34.1
>

Applied, thanks!

Bart
