Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C00F530D9D2
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Feb 2021 13:32:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234393AbhBCMbH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Feb 2021 07:31:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232525AbhBCMbG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Feb 2021 07:31:06 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC467C0613D6
        for <linux-gpio@vger.kernel.org>; Wed,  3 Feb 2021 04:30:25 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id r12so35416338ejb.9
        for <linux-gpio@vger.kernel.org>; Wed, 03 Feb 2021 04:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=O1RxBM7003glKYocBA7/KIUKOzvg668ZSWARKeGdD/4=;
        b=GvKK6QwU/FkxGHTDireMwGmIioAccb0fCG6l0iKcAZaytuQ9aIqfSG5ymM58/mxzmD
         AjuOyIcDIp9Y5HErpyecFoZLgo6V12fn7rhyJI2F6TirfxSTi14VqoEt+rTgffqMSlMZ
         e+wVrMoFg0wuRE4Z8jsM4Q1N/ld+p/kaQG1FjNQLW8/gibLXmhh1jhAWVQh9PXhncPku
         KCVx5WAEIjA1IPmErGGlrENiOmSJHdZK22ZbWSVmZ3Xx8NRQf1lErQ7/65Txip2zBFYm
         F2+AXjrOrtwShyxccMga2Ep4QjSaSeeJuBKoIQ7IjDtEKlm/utJ9IEQpH4ppvdw3Hhac
         iBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=O1RxBM7003glKYocBA7/KIUKOzvg668ZSWARKeGdD/4=;
        b=RFuRKsIsQiR6KNDezYjbROopHYwEb+ytBp2yKYRw9x1KkzUbE0FIcCvUYv1rZgAWT3
         SYAbmd1D+hgRUswxfIa+gD653L0wNM1a7Qipr33QXQJajt+zdZQp9vDmWvofWOIghE1n
         YFTUDHz3K2+b3mhLEraKeePg+1UFsaEOV2ktv+CdVCJWpZpxWnhWDXRgxKevPl21/DS0
         /mGr59g5v0p/REbePqP5Axqb5R/B3meSXFJMeFzsIyiv9u301IxNOTtuFodOU2zoZXS8
         A1f3M6LZe31CbIcdr1RUqdfe+2r0Rer9GaIt9bLA7nHvh8ZRteyGc12xeGqDyk222wHj
         +wxg==
X-Gm-Message-State: AOAM533QFZwJdeRGZneRW1eJsoasCZnWcKGwZx5q1+gu7qL53WIv3OB7
        CkIocsUCE/G4IqJFLhmlkA00uY9GajOi813/PY/YUA==
X-Google-Smtp-Source: ABdhPJzQDu6i8rgAHOMPQhAGWx45wTECJfUhIg1+DvfjO7Jx9A/pqNHAus1OgznHuLSlmq1LLUDHV+F4+GBdjdh46u4=
X-Received: by 2002:a17:906:b042:: with SMTP id bj2mr2932615ejb.261.1612355422975;
 Wed, 03 Feb 2021 04:30:22 -0800 (PST)
MIME-Version: 1.0
References: <b60a6c6efc4c41641e82dd5f91d036b97378de6b.1612312770.git.jan.kundrat@cesnet.cz>
In-Reply-To: <b60a6c6efc4c41641e82dd5f91d036b97378de6b.1612312770.git.jan.kundrat@cesnet.cz>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 3 Feb 2021 13:30:12 +0100
Message-ID: <CAMRc=Mcsk6ixfAbJk9sJArrkGg5jnjZe_qw_wuCJ07ZDrdQN7A@mail.gmail.com>
Subject: Re: [libgpiod] bindings: cxx: fix building with clang's libc++
To:     =?UTF-8?B?SmFuIEt1bmRyw6F0?= <jan.kundrat@cesnet.cz>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 3, 2021 at 1:52 AM Jan Kundr=C3=A1t <jan.kundrat@cesnet.cz> wro=
te:
>
> This is what I get on clang 11 with libc++:
>
>  line.cpp:248:39: error: implicit instantiation of undefined template 'st=
d::__1::array<gpiod_line_event, 16>'
>          ::std::array<::gpiod_line_event, 16> event_buf;
>                                               ^
>  /nix/store/vk8ynr4hj2a8w7g1b9m8wknzj39iiv4x-libc++-11.0.1/include/c++/v1=
/__tuple:219:64: note: template is declared here
>  template <class _Tp, size_t _Size> struct _LIBCPP_TEMPLATE_VIS array;
>
> Signed-off-by: Jan Kundr=C3=A1t <jan.kundrat@cesnet.cz>
> ---
>  bindings/cxx/line.cpp | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git bindings/cxx/line.cpp bindings/cxx/line.cpp
> index bf4a3eb..9b66d1a 100644
> --- bindings/cxx/line.cpp
> +++ bindings/cxx/line.cpp
> @@ -6,6 +6,7 @@
>   */
>
>  #include <gpiod.hpp>
> +#include <array>
>  #include <map>
>  #include <system_error>
>
> --
> 2.29.0
>
>

Applied, thanks!

Bartosz
