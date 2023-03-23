Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9BAD6C6BF0
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Mar 2023 16:10:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231994AbjCWPKb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Mar 2023 11:10:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232001AbjCWPK3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Mar 2023 11:10:29 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9B6C2917C
        for <linux-gpio@vger.kernel.org>; Thu, 23 Mar 2023 08:09:31 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id r187so1127693ybr.6
        for <linux-gpio@vger.kernel.org>; Thu, 23 Mar 2023 08:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679584162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8SnEIkXp6L+ALBjrOuJPKx5DH0o+AoDgTFps7+YyJMY=;
        b=zl+BlwzW7gPnSXkWxci5PjAwtOMOIIBrbHRSPehqkTU08JKV0J3Dg7CuwYpn/QR+m7
         VgXdUnhhr7PlYOQWpVs//ogptifERuorrA7eqdl+Dx0O0xBLngUdU0m1Qx5Zc1WjgFr+
         k96/sjQKwOHNE4WM041IXhQx0TZ2TF1GLmFUDcC9TTVj87q79wyO8LZGgbak7t6dz2xt
         d7CgWsr2Bn9ydUodD91x/vnStBtK8hcUsxgxBhWKQkgC4pD6UFhKu0/NGCtvvOC5Tvkf
         929X9zXzb36a8hNwm1Gx9I7E7nslleyKePEuqrJWPLxTyRUNCFg8w5uRFNVHiKaOPZa5
         UGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679584162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8SnEIkXp6L+ALBjrOuJPKx5DH0o+AoDgTFps7+YyJMY=;
        b=Vke0+W/++o+CAilAwuZSKB74CrkFGgQ6tDuFUdoNmnTQSx0Dz1Ys6c/slv2XJjgF3T
         LbT6WCgZyUbu2PPXE980VWbsW9iKJJHoiXw9FNY3ZLRWDwgIcv28/i9IdIAD8mQmwWjf
         2f8oO3UwUqPck6Rg28Q7YEVf+Tj+ILn0pZUkPqmd2Ux2W85pi/uKe5FsMxAPxkFjhQhz
         eguPiEbY2EshPYEr2gXWByVaqvO/7reh1wxsBwS07Qq7azht5UzcOcaRuhkEV3FrxuGu
         yFBeXy86qHZWEDyYdZ2lLm8P9WgBMy9/sJtzLb8dvV0hbR4Zsdwpv6XEuwvzDiLAOsl6
         614w==
X-Gm-Message-State: AAQBX9fbn4RrqtXF4HvNVoKgk0YPfawAAHybkYGN/EeLHAhtIC2XWYZY
        xe/Sfw7JF8qUgA/TPiGn/KYMRL/VRJxssobQphwfWA==
X-Google-Smtp-Source: AKy350Yv//HOf5AIR4M+neWRU2lB5L6X9r6OQSW7C8ZDiylvn6IzCqPJEyOwSMoTGkLfTT5EaxbodlJfcylOHiXrTRQ=
X-Received: by 2002:a05:6902:a93:b0:b23:4649:7ef3 with SMTP id
 cd19-20020a0569020a9300b00b2346497ef3mr2351019ybb.4.1679584162516; Thu, 23
 Mar 2023 08:09:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230323133656.679478-1-linus.walleij@linaro.org> <mvmfs9vwpma.fsf@linux-m68k.org>
In-Reply-To: <mvmfs9vwpma.fsf@linux-m68k.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Mar 2023 16:09:11 +0100
Message-ID: <CACRpkdZTKF7MU2Pp0x-sqGEo_rnyZ-GnGhxXhJjypAR3r+GQew@mail.gmail.com>
Subject: Re: [PATCH] m68k: Pass a pointer to virt_to_pfn() virt_to_page()
To:     Andreas Schwab <schwab@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 23, 2023 at 2:42=E2=80=AFPM Andreas Schwab <schwab@linux-m68k.o=
rg> wrote:
> On M=C3=A4r 23 2023, Linus Walleij wrote:
>
> > diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
> > index 911301224078..0a9bc8292f78 100644
> > --- a/arch/m68k/mm/motorola.c
> > +++ b/arch/m68k/mm/motorola.c
> > @@ -102,7 +102,7 @@ static struct list_head ptable_list[2] =3D {
> >       LIST_HEAD_INIT(ptable_list[1]),
> >  };
> >
> > -#define PD_PTABLE(page) ((ptable_desc *)&(virt_to_page(page)->lru))
> > +#define PD_PTABLE(page) ((ptable_desc *)&(virt_to_page((void *)page)->=
lru))
>
> That should probably get a pair of parens around the macro argument.

Ooops that's right. I'll fix.

Yours,
Linus Walleij
