Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82D424EB1A7
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Mar 2022 18:16:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236648AbiC2QRh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Mar 2022 12:17:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237751AbiC2QRg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Mar 2022 12:17:36 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BFA318DAA2
        for <linux-gpio@vger.kernel.org>; Tue, 29 Mar 2022 09:15:53 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-2e6ceb45174so149418677b3.8
        for <linux-gpio@vger.kernel.org>; Tue, 29 Mar 2022 09:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Oj3LhvxsfdYjQAWu5HO23F+mCaTs2lII7o9YCixwaWA=;
        b=HzfngFMEXBXvCHnMwHp+dggcV6DxbJLeam8plzIQRFsLo9S8NRl2yE0rRBc+s7bZHs
         uTuWhQxg2BiiyheB9Fy5Vu4inqHVui22DvH2XtzGr+c67FgBmkqwrxtYHTKgxZdJyp2l
         IRagftbVPIQ9BYDyD8DMZmgHiMZ0Pm4LvxqG278mF/8O3gRhBQr0Pndfa2LLe16kV/fi
         AfOLuoGwfHkmh9F/rG/UByTselg/AElU2FIZu+THWfecvvuE51wZwVB5quPoGlBl8i4Q
         89Vy+N1Vnny1/xeqxJNXWM3JeQjHtClhjyfzEXKFOHD5CGS7+FRRShDS9CD8GLVCRlhw
         uquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Oj3LhvxsfdYjQAWu5HO23F+mCaTs2lII7o9YCixwaWA=;
        b=GpY2hhavaoSsAcBkj7OE7xunQ+kj4KQUibPI+ahdA4jxwxX5Rr5Ot7dkp15uXjoDc3
         PxThrT3F21FeJnPAoGWd1Ac1tbyrff3cLBZcURd3qj6tmX0ipfMfFU5poDESS8doEzgO
         TYPPSOflGaycja34aDHGkZotNFAz/mrV1gsQUHbTlKJi71u9v3DJTUssjRc0TSyPeFr7
         whixsDPM3vL+O0rVrFEVFTzZeEx8Wl5xO4OK0YgOVM9DO1iOtiulXJjlda9wDQbHeCfZ
         W/RBNo4hGoIDpQmCZYI/bsVYAweE/EB9B9GgG0CUC7NUioExJJICdRb17hWSXOZBnXSF
         6yJg==
X-Gm-Message-State: AOAM5300jfgCVs71NVQ7XOUPfK35ZXFxB564kmK63jJtBcJc/938J2zY
        w2r63kaEktSG3N6U/TQUw/A+QKNU2gi0V48+Td5ucg==
X-Google-Smtp-Source: ABdhPJziFrWCXAZoa8A7mDFKLwjo2AZ2hD2pL04hRMq789vu2P5kiu/LrgWGFGSC2CHKoJ53fSDXa/PSZhxZLwSLEIo=
X-Received: by 2002:a81:d542:0:b0:2e5:c060:a0ac with SMTP id
 l2-20020a81d542000000b002e5c060a0acmr31389155ywj.118.1648570552012; Tue, 29
 Mar 2022 09:15:52 -0700 (PDT)
MIME-Version: 1.0
References: <CACRpkdZ_Jr3OzfoOpSSsAJMy1Oe_=zD861jouDzCVD-BQ6yZMg@mail.gmail.com>
 <CAHk-=whzqAB6kfHUcX2uhfPnNiWJRq=UmeA1TbgGi3XA+57j3w@mail.gmail.com>
 <YkIqyb6lhn5uU2jb@latitude> <CAHk-=wjxvNGEUUN5fj203KJL8qXK3jv359Ketc-HJMJU9wN6KA@mail.gmail.com>
In-Reply-To: <CAHk-=wjxvNGEUUN5fj203KJL8qXK3jv359Ketc-HJMJU9wN6KA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 29 Mar 2022 18:15:40 +0200
Message-ID: <CACRpkdZxme+YYfXzq3T0hKdZA3JF86jPeiH=tzmK-p+3L2ZyJw@mail.gmail.com>
Subject: Re: [GIT PULL] pin control bulk changes for v5.18
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Kees Cook <keescook@chromium.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 28, 2022 at 11:41 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Mon, Mar 28, 2022 at 2:38 PM Jonathan Neusch=C3=A4fer
> <j.neuschaefer@gmx.net> wrote:
> >
> > It was =E2=80=94 but when it was noticed, the fix went through the IRQ =
tree, on
> > top of a refactoring that happened there (the switch to generic_handle_=
domain_irq):
> >
> > https://lore.kernel.org/lkml/164751044707.389.16417510835118111853.tip-=
bot2@tip-bot2/
>
> Ok, that ends up at least being identical to what I did, so thats' good.

Ah thanks for hashing this out both of you, I got a bit sweaty there since =
I
spent the first week in the merge window trying to hash out issues in this
driver.

I suppose there will be a different interesting merge conflict with the IRQ
tree now but the solution should be obvious I hope.

Yours,
Linus Walleij
