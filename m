Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA57621FFF0
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2020 23:24:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726803AbgGNVWH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jul 2020 17:22:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:60156 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726446AbgGNVWH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Jul 2020 17:22:07 -0400
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2602020672;
        Tue, 14 Jul 2020 21:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594761726;
        bh=6/0IFBrDgN+8wgO5IPBg2OK08s8EFa0Q0s+1t2jxIEs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Sqzwq+M5qpINY3ryeYqbJKyXKbAfIJSZjsraIgJPuiqrGAuJpiBqLzfQo3WpAvhJZ
         jOW2QLniw0o4eNZKWk3W1tI86QqhdJrP2ncgcJpONrvdoqrYB+QaIOoRsN0I/RsY8T
         cYrwxlMH2yk4Vsl3vD1NceN08Itf58/UoCS9FEE8=
Received: by mail-io1-f45.google.com with SMTP id l1so18878533ioh.5;
        Tue, 14 Jul 2020 14:22:06 -0700 (PDT)
X-Gm-Message-State: AOAM533Al84/iLTV9Bc/Qn8CuPx5LIPS0Yz86ZNs75RVe6BBI5C4hbQS
        9Bz0zkR6PKZcurTE6XHBcetd2ct8MFxwLLO0OtY=
X-Google-Smtp-Source: ABdhPJy0DEpJHLK/adZGJZAoEd8jIax+T8YXVVxEHDKQdp5sYGZQlXtfKHcAQCFkmg6Nt6kNwA/KOq+Tu4mzedsh8hw=
X-Received: by 2002:a05:6638:250f:: with SMTP id v15mr8038942jat.97.1594761725616;
 Tue, 14 Jul 2020 14:22:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200713144930.1034632-1-lee.jones@linaro.org> <20200713144930.1034632-11-lee.jones@linaro.org>
In-Reply-To: <20200713144930.1034632-11-lee.jones@linaro.org>
From:   Sean Wang <sean.wang@kernel.org>
Date:   Tue, 14 Jul 2020 14:21:54 -0700
X-Gmail-Original-Message-ID: <CAGp9LzoQVPPPgoBVYeLTuTsWjS_Ug48wjTDh=Pk3KWdpFrLiaQ@mail.gmail.com>
Message-ID: <CAGp9LzoQVPPPgoBVYeLTuTsWjS_Ug48wjTDh=Pk3KWdpFrLiaQ@mail.gmail.com>
Subject: Re: [PATCH 10/25] pinctrl: mediatek: pinctrl-mtk-common-v2: Mark
 'mtk_default_register_base_names' as __maybe_unused
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 13, 2020 at 7:49 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Not all sourcefiles which end up including pinctrl-mtk-common-v2.h make u=
se
> of 'mtk_default_register_base_names' and there is nowhere we can place th=
e
> definition to void the need for __maybe_unused except its own headerfile,
> which seems like overkill.  So instead we tell the compiler that it's oka=
y
> for it to be unused by some of the consumers.
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  In file included from drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:1=
9:
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h:83:27: warning: =E2=80=
=98mtk_default_register_base_names=E2=80=99 defined but not used [-Wunused-=
const-variable=3D]
>  83 | static const char const mtk_default_register_base_names[] =3D {
>  | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  In file included from drivers/pinctrl/mediatek/pinctrl-moore.h:25,
>  from drivers/pinctrl/mediatek/pinctrl-moore.c:12:
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h:83:27: warning: =E2=80=
=98mtk_default_register_base_names=E2=80=99 defined but not used [-Wunused-=
const-variable=3D]
>  83 | static const char const mtk_default_register_base_names[] =3D {
>  | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  In file included from drivers/pinctrl/mediatek/pinctrl-paris.h:27,
>  from drivers/pinctrl/mediatek/pinctrl-paris.c:15:
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h:83:27: warning: =E2=80=
=98mtk_default_register_base_names=E2=80=99 defined but not used [-Wunused-=
const-variable=3D]
>  83 | static const char const mtk_default_register_base_names[] =3D {
>  | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  In file included from drivers/pinctrl/mediatek/pinctrl-paris.h:27,
>  from drivers/pinctrl/mediatek/pinctrl-mtk-mt6797.h:15,
>  from drivers/pinctrl/mediatek/pinctrl-mt6797.c:13:
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h:83:27: warning: =E2=80=
=98mtk_default_register_base_names=E2=80=99 defined but not used [-Wunused-=
const-variable=3D]
>  83 | static const char const mtk_default_register_base_names[] =3D {
>  | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  In file included from drivers/pinctrl/mediatek/pinctrl-paris.h:27,
>  from drivers/pinctrl/mediatek/pinctrl-mtk-mt8183.h:12,
>  from drivers/pinctrl/mediatek/pinctrl-mt8183.c:9:
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h:83:27: warning: =E2=80=
=98mtk_default_register_base_names=E2=80=99 defined but not used [-Wunused-=
const-variable=3D]
>  83 | static const char const mtk_default_register_base_names[] =3D {
>  | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  In file included from drivers/pinctrl/mediatek/pinctrl-paris.h:27,
>  from drivers/pinctrl/mediatek/pinctrl-mtk-mt6765.h:12,
>  from drivers/pinctrl/mediatek/pinctrl-mt6765.c:10:
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h:83:27: warning: =E2=80=
=98mtk_default_register_base_names=E2=80=99 defined but not used [-Wunused-=
const-variable=3D]
>  83 | static const char const mtk_default_register_base_names[] =3D {
>  | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Cc: Sean Wang <sean.wang@kernel.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: linux-mediatek@lists.infradead.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Those MediaTek SoCs with multiple register bases wouldn't refer to the arra=
y
Acked-by: Sean Wang <sean.wang@kernel.org>

> ---
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h | 2 +-
