Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5FCF743B59
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jun 2023 14:01:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232647AbjF3MBO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jun 2023 08:01:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232903AbjF3MBL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jun 2023 08:01:11 -0400
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD5043C0A
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 05:01:07 -0700 (PDT)
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-47e1c7c1148so302703e0c.0
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 05:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1688126467; x=1690718467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRepDYDrQnbTfhOGkLBDEB/AHtipHwSB8lprqXMRDG0=;
        b=E4ubv2eQC+AnTLUI1EhaL0Cy4juszE5S5X9YRbMvCMfSeNQyxh57PzK1T3jHQbBHGz
         1+hRDDPDtmTVsSFcpUR4FFOHnZxOG+qh5WA8zgmv/NK0AADKE1PaNow44juHFdWYUKpN
         3hZbw9FHyKxYqcK50r22JvwZ2UrEy/rlrkwH7SZZZNKJ74w2qzbZq1nxQUCCCCjyUXxN
         ObEutBsQCYuHpDBRKFXzrVMfKWUifct6y2zzy6qOICEYVSjtGstoLLVVQQRl3HCT31ur
         MTtyfbRExkI4BrtmssRYPenDIPKr2ab+80VrD5p9A/k6GQkekwapma2tnTrqzjFqmdM2
         elRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688126467; x=1690718467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JRepDYDrQnbTfhOGkLBDEB/AHtipHwSB8lprqXMRDG0=;
        b=lHo9sdBJaHxIZCUvZNyeE7yRm+rJL7PRRfPpF/3cu8B9OVBaWiHwKonXfBk17i2vvA
         OOoWSNB6NFqyUN10iaRFYBNxvqjhGwXSPS43BZxT9iry7sxvjc/UDg/Uz/9HIXOfkXGd
         +ZaFcSjMLz8IFnF/CRPpnXExoS12GsrQLstA1c4uIER3rYsEyq8rsTdJ6aklHrVJEiMO
         zwrv4Y5z/oNBER8x8RNDj0TIcYzs1DbonpILmxyf7POmRHOcJqu5l7uw1U+X6AuUyG8c
         ooYFbHl1Dk8nHAv9hnez2qIzdEl5BBcGBY7ooWZCi5h2KcZmmjcc/FQ69kEti53gx7Li
         ACOw==
X-Gm-Message-State: ABy/qLahIv9wKULbXcB1Lf7/fMSH1CHdydruN7ZvK2ly63z3vv6Ade4C
        4dj3C62YMrklVi+TTGZi67cane/5oupQTnqqY/NjaA==
X-Google-Smtp-Source: APBJJlGq4YkWMDsIX/TmWydHfD6qHEZqs3SyRk13XJY2JjkLPQb4OZZng1OfWMQmSsAwnzw/qRyVcHKIujfY97CNFvE=
X-Received: by 2002:a1f:41d7:0:b0:440:4946:fac with SMTP id
 o206-20020a1f41d7000000b0044049460facmr1140050vka.4.1688126466835; Fri, 30
 Jun 2023 05:01:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230629101455.127795-1-warthog618@gmail.com> <20230629101455.127795-2-warthog618@gmail.com>
In-Reply-To: <20230629101455.127795-2-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 30 Jun 2023 14:00:56 +0200
Message-ID: <CAMRc=MeR=cEoDamycgdZyLPP1F8gqpkagaTeXeGCK00Pb=wF7w@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 1/2] examples: fix typo in Makefile.am
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 29, 2023 at 12:15=E2=80=AFPM Kent Gibson <warthog618@gmail.com>=
 wrote:
>
> The trailing "s" is missing from "toggle_multiple_line_values" in
> several places, so add it.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  examples/Makefile.am | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/examples/Makefile.am b/examples/Makefile.am
> index daf902b..e92f303 100644
> --- a/examples/Makefile.am
> +++ b/examples/Makefile.am
> @@ -37,7 +37,7 @@ reconfigure_input_to_output_SOURCES =3D reconfigure_inp=
ut_to_output.c
>
>  toggle_line_value_SOURCES =3D toggle_line_value.c
>
> -toggle_multiple_line_value_SOURCES =3D toggle_multiple_line_value.c
> +toggle_multiple_line_values_SOURCES =3D toggle_multiple_line_values.c
>
>  watch_line_info_SOURCES =3D watch_line_info.c
>
> --
> 2.41.0
>

I'm wondering if we should just drop these as autotools will default
to using a single source file named after the target executable if
foobar_SOURCES is not defined. (iow: if the target is foobar and no
foobar_SOURCES is defined, then it will try foobar.c).

Bart
