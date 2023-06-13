Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70F1B72DC0B
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jun 2023 10:09:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233400AbjFMII6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Jun 2023 04:08:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230183AbjFMII6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jun 2023 04:08:58 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21437E79
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2023 01:08:57 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-51458e3af68so8847354a12.2
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2023 01:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686643735; x=1689235735;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hdc6d7zgNl57PxUUQZ7ZEljd/uW8T8JcZHjwOQDCD00=;
        b=ivEOCul2GhNbkuVhUTj3fWDugMuqKk7kFR2rFRCQhNPzY2pwtbX0LZzCQ/crsmJcZ7
         umPLeL3FL0+HpdXCYFIyc2kALSoDWzpurmUm/J5T7wrkb/Lw3dPwWyVKj26Ya5/knwK/
         3y+GkOL6fBaQcZbhOwB9NXMMqCmEy2KhD0gbLx+vECkeve2aH6mrHmyawuQOl971BJ0Z
         8E3Ct+SyRU/AuIBPDDDWdlXZcHDN9FRC57r4ln4+8whZ8pdp//cAML6PbbqVCcjbkuws
         ccGjpp3PdWR5GpPU87OW+g1pHZkIQZNgBqNbuaM/jBhdHXyfLpveePCKHoBx6a2+YAn2
         ho+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686643735; x=1689235735;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hdc6d7zgNl57PxUUQZ7ZEljd/uW8T8JcZHjwOQDCD00=;
        b=bl8Q96ALY2dU5P6gfsuaJGCE2FdHXSe/v8RBbuouYn9CMltVLc7n7tAnvlebKFjyv3
         wuC7T95SC2IKiwp1+pFPwtoMj0EnGLqApSd6M1XDcTvTMcj7M7SS3jhRFC4dhRScX2L4
         vDtmNiIIYuLvVCMrbryBLot/QltE0tXSQTVMRq5bpDbnCgFS4CUF9Xj+zzxpGOFxaA4m
         ZA9TN/kZ1i6b5DwjhzC9HgCBd0b7UxksXxkvaEx4DNrQUy4ORI3vM5Ib0DxiJHAarVxE
         0UkAn7S9vdmckEOwc5XQOG85v4DMkDg2cDwfeH/PtR3uHBdL0wSwjtq1OTLzmljFMCGf
         pFrQ==
X-Gm-Message-State: AC+VfDw1wNj+yiSbrWFeZMDIiFoPb1qkXqR4exrRKCYPWz2tfT11je+r
        2hSB7z+9RGFMy9uY23v29JX2Cg==
X-Google-Smtp-Source: ACHHUZ6oe+4iIj09UrakSrmNTNrPpGF+SpTqmuOowckqAzswIt6IPqUJIiX1LPVIQc358KTbJLKnvw==
X-Received: by 2002:aa7:cd6f:0:b0:514:a110:6bed with SMTP id ca15-20020aa7cd6f000000b00514a1106bedmr7173651edb.27.1686643735596;
        Tue, 13 Jun 2023 01:08:55 -0700 (PDT)
Received: from localhost (i5C7407C8.versanet.de. [92.116.7.200])
        by smtp.gmail.com with ESMTPSA id w13-20020a056402070d00b00518337f4453sm3059164edx.75.2023.06.13.01.08.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 01:08:55 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Tue, 13 Jun 2023 10:08:54 +0200
Message-Id: <CTBDAYTI8VKS.3LFOCLUNYQWRU@fedora>
Subject: Re: [libgpiod][PATCH] bindings: rust: add missing license and
 copyright boilerplate
Cc:     "Bartosz Golaszewski" <brgl@bgdev.pl>,
        "Kent Gibson" <warthog618@gmail.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
        <linux-gpio@vger.kernel.org>
To:     "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>,
        "Viresh Kumar" <viresh.kumar@linaro.org>
From:   "Erik Schilling" <erik.schilling@linaro.org>
X-Mailer: aerc 0.14.0
References: <20230613072643.105576-1-brgl@bgdev.pl>
 <20230613072817.s4zcdkvtkqownkvu@vireshk-i7>
 <CACMJSeu97ftDjarB8830_5tvvGbqRJ-84X1NpFTC3KdFu4DWVg@mail.gmail.com>
In-Reply-To: <CACMJSeu97ftDjarB8830_5tvvGbqRJ-84X1NpFTC3KdFu4DWVg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue Jun 13, 2023 at 9:30 AM CEST, Bartosz Golaszewski wrote:
> > On 13-06-23, 09:26, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Make reuse happy again by adding appropriate license and copyright in=
fo.
> > >
> > > Fixes: 1f8085953086 ("bindings: rust: build against pkg-config info")
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > ---
> > >  bindings/rust/libgpiod-sys/wrapper.h | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/bindings/rust/libgpiod-sys/wrapper.h b/bindings/rust/lib=
gpiod-sys/wrapper.h
> > > index 8a8bd41..e5cdfa0 100644
> > > --- a/bindings/rust/libgpiod-sys/wrapper.h
> > > +++ b/bindings/rust/libgpiod-sys/wrapper.h
> > > @@ -1 +1,5 @@
> > > +// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
> > > +// SPDX-FileCopyrightText: 2023 Linaro Ltd.
> > > +// SPDX-FileCopyrightText: 2023 Erik Schilling <erik.schilling@linar=
o.org>
> > > +
> > >  #include <gpiod.h>
>
> Ah C headers should use /* */ comments for SPDX stuff. I'll fix it
> when applying.
>
> Bart

Acked-by: Erik Schilling <erik.schilling@linaro.org>

- Erik
