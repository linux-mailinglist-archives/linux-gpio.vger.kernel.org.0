Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B74847C8073
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Oct 2023 10:37:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbjJMIhE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Oct 2023 04:37:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230123AbjJMIhD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Oct 2023 04:37:03 -0400
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCC19A9
        for <linux-gpio@vger.kernel.org>; Fri, 13 Oct 2023 01:37:01 -0700 (PDT)
Received: by mail-vs1-xe2c.google.com with SMTP id ada2fe7eead31-45271a44cc4so788943137.2
        for <linux-gpio@vger.kernel.org>; Fri, 13 Oct 2023 01:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697186221; x=1697791021; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fg4DDsIiD4lD3ytlo+JCwwwhkKNn4/39lFt3BKLtjr4=;
        b=Cg2APVZri4Pr5bhYd+X1pLS2UvDPDkXvigaGQqZzMXEoqX20uytLgrACOvB6JwFkt9
         RfLX4byd+wLZbIP+z18gjQugNBmZCfpLCzp+PhomcYhzhX5cjRnppHjRi5NkhByH7dsP
         lCLeHw2uYPnL5rzaBDEv9HKKtMvYd52iwXmE04LuE42mosIH7S30cDP/WMLBaS9dmUmm
         S+e5VQZXuaLoPN08ertgJrGwZ+//VhWgEeWZCERiFy+6VIu5wuGhxiwgkZm/s1u+83GJ
         L/Y9O6Ju772Z4+KV5eN2Ait4VhlZXw2tl8bMjR/pYLTpT6b+Mn0qiLRy355r4U52iJ5r
         Fv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697186221; x=1697791021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fg4DDsIiD4lD3ytlo+JCwwwhkKNn4/39lFt3BKLtjr4=;
        b=NaJgHv4dcwvQ6tsJMUp5gIF406FlOmGdEaXJGWOFHeoLSdzSyoO90KgPneDKPWhIbF
         +V5eYuO1Smgz13pWiZiEa95yE2wy/umu2zxO7pqy/1n0jcsMD0YdPK3Us2CcE443SvPJ
         mMSBq/eWNCkT7tpk8V9Ll9DwY6vOnTzxg8Sr6PKSuNqeH9T1ICcgL0gNJ8efcj1PQDQU
         H4WrBAki4Fh/lIWKo9mFicIJDo8DM+spHkyfUyBQLj3CsLWIZJYXYa04b11d40+G5B3n
         ROn6FoW9Crd+mj45kKKfZlz3Ey2CSgzP6KoD58fnx55K282quKUejsfqEeWIqhlcJuS/
         Y6eA==
X-Gm-Message-State: AOJu0Ywaivb4/mCj//pLVKa9qwaWwt8Z8pWA2cJR5yWyfITjj4QHEc5z
        Qrban4pzGJTSEg3+0jh6+aAPbvtc4Bq0pG0DZmldCg==
X-Google-Smtp-Source: AGHT+IGyuBVlYXvuv+Cmdv3EQCkPdQR24IPx3eBQuW/OzXRMH4F7SxaUJlbDKOKrOAGNRGgfXNmqSRe4Iq5nef/EaNY=
X-Received: by 2002:a67:c205:0:b0:457:b8a8:f58f with SMTP id
 i5-20020a67c205000000b00457b8a8f58fmr2869944vsj.8.1697186220789; Fri, 13 Oct
 2023 01:37:00 -0700 (PDT)
MIME-Version: 1.0
References: <20231012195139.81613-1-phil@gadgetoid.com>
In-Reply-To: <20231012195139.81613-1-phil@gadgetoid.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 13 Oct 2023 10:36:50 +0200
Message-ID: <CAMRc=MexQJd9wx3Qmof2t88VMD1VenJx81_dcvn09oPcqJ2u4Q@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] bindings: python: simplify environ access
To:     Phil Howard <phil@gadgetoid.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 12, 2023 at 9:51=E2=80=AFPM Phil Howard <phil@gadgetoid.com> wr=
ote:
>
> Use environ.get() in lieu of an explicit check for GPIOD_WITH_TESTS in
> os.environ.
>
> Returns None and evaluates as False if GPIOD_WITH_TESTS =3D=3D "1" is
> not specified.
>
> Signed-off-by: Phil Howard <phil@gadgetoid.com>
> ---
>  bindings/python/setup.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/bindings/python/setup.py b/bindings/python/setup.py
> index fd674aa..df10e18 100644
> --- a/bindings/python/setup.py
> +++ b/bindings/python/setup.py
> @@ -50,7 +50,7 @@ procname_ext =3D Extension(
>  )
>
>  extensions =3D [gpiod_ext]
> -if "GPIOD_WITH_TESTS" in environ and environ["GPIOD_WITH_TESTS"] =3D=3D =
"1":
> +if environ.get("GPIOD_WITH_TESTS") =3D=3D "1":
>      extensions.append(gpiosim_ext)
>      extensions.append(procname_ext)
>
> --
> 2.34.1
>

Applied, thanks!

Bart
