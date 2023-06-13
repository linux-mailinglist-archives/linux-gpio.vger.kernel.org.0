Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D68272DCA1
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jun 2023 10:37:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241405AbjFMIhU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Jun 2023 04:37:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241456AbjFMIhP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jun 2023 04:37:15 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F14F19AE
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2023 01:37:08 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f8cc042ea9so2765525e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2023 01:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686645427; x=1689237427;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5zJEoPPrWaPQe2o/sOBJPvP/Vbn9cvZQ+Hz6RwLAU14=;
        b=l3rb9Z2p+TUBWwDg9k5ZUDjgENhgz/60+X32UO3KaMB3Ue7Itq+it6kTBI1hVkdWkd
         Ck6alcdW/M10DNBv7gwqDk1LYqoalNtQl6Yq8sIfGEApwVoDWf6JVf84figmYvfpEnsK
         n/HbYuboeWYN6md5YM6SxeWUDAv35cisfN1zrkwkXtLaBl3rbL9u3D0R0PicH0MLZtlh
         Lv+96Bku4IQom3R41J9VQOeh5bW5GvInewf0o2AzMaIG4NFtCKZvP+radCdS4t1oqWQg
         k7d4/01aRuSWvOcpllBDkvfDeC0zTrAGHqBse+TQ7iek0fixwV66pyeXlThYyp+NQk8W
         RYBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686645427; x=1689237427;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5zJEoPPrWaPQe2o/sOBJPvP/Vbn9cvZQ+Hz6RwLAU14=;
        b=MJYFd2A5cyQZdEnIQXB2p4yi89MzVbHp0UKYIYg0ZEPp6IiMVnn+bAWKZBupaac0m+
         RaGh6zX/GMC6lsAbC1LtH6Y/j/U6HCvjuYKw8YGD3bHxFOeZTOHKg83uCHuijOiGsWc0
         28PFqk2sA+J8zILpJuJI3AHiTgwwvQgu2D3csgL21TKQYJrDX9gKwyZg3FzxeLjPxwzi
         61FkiSGkU2pbLVgVtXRsGx/sPpK0mLIQ7QYZH/xSZLvSQ7atZ4MH6LIZQsBvXe/y7Zhs
         aK2gRHWFTs6mkGSDvl6Yte+JSgPKBUPxsXHSNBcWR5yb+LwboE7hx6iJwpfbZeFuMNY7
         iDVg==
X-Gm-Message-State: AC+VfDzACjZbIKTvfbbM1Y6om1Dcqx2MKTjlhUjtZuT18hPu9vO7S8Gm
        BsgirVGG7mK6WmmPtSArG6gZkw==
X-Google-Smtp-Source: ACHHUZ4an74OBtZpGGMhJzkNNYFfX0j8l4D815nZHC6M7bVBOVtx5/eErmFBntytcG+scBirONAIiw==
X-Received: by 2002:a1c:4b14:0:b0:3f7:f2d0:b8fc with SMTP id y20-20020a1c4b14000000b003f7f2d0b8fcmr7497966wma.34.1686645426582;
        Tue, 13 Jun 2023 01:37:06 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x25-20020a05600c21d900b003f60faa4612sm13706447wmj.22.2023.06.13.01.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 01:37:04 -0700 (PDT)
Date:   Tue, 13 Jun 2023 11:37:00 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "GONG, Ruiqi" <gongruiqi@huaweicloud.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, gongruiqi1@huawei.com,
        linux-sparse@vger.kernel.org
Subject: Re: [PATCH] pinctrl: renesas: remove checker warnings: x | !y
Message-ID: <869dd27f-7046-486a-83a0-acd489565083@kadam.mountain>
References: <20230613021643.3330661-1-gongruiqi@huaweicloud.com>
 <CAMuHMdXGG2xu+nXJt6CSTfV6aM=U=hMW+DiDgP3RhOw8+O8y=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXGG2xu+nXJt6CSTfV6aM=U=hMW+DiDgP3RhOw8+O8y=A@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 13, 2023 at 09:38:20AM +0200, Geert Uytterhoeven wrote:
> Hi Gong,
> 
> On Tue, Jun 13, 2023 at 4:13 AM GONG, Ruiqi <gongruiqi@huaweicloud.com> wrote:
> > Eliminate the following Sparse reports when building with C=1:
> >
> > drivers/pinctrl/renesas/pinctrl-rzn1.c:187:52: warning: dubious: x | !y
> > drivers/pinctrl/renesas/pinctrl-rzn1.c:193:52: warning: dubious: x | !y
> >
> > Signed-off-by: GONG, Ruiqi <gongruiqi@huaweicloud.com>
> 
> Thanks for your patch!
> 
> Looks like sparse needs to be taught the "|" is not used in a boolean
> context here?
> 

I've spent some time exploring how these bugs look like but it was years
ago so I have forgotten the details.  I think the main issue is when the
! is on the left.

Bug:	if (!x & 0xf) {
Fixed:	if (!(x & 0xf)) {

Or less commonly:

Bug:	if (!x > y) {
Fixed:	if (x <= y) {

Originally Sparse used to only warn about !x & y...  I feel like Josh
maybe got a bit over enthusiastic in changing it to warn about
everything.  But that was in 2008 and we're only noticing now so maybe
it's fine.

The other bug that we see is mixing up logical and bitwise negation
but those bugs are harder to separate from good code.

> > --- a/drivers/pinctrl/renesas/pinctrl-rzn1.c
> > +++ b/drivers/pinctrl/renesas/pinctrl-rzn1.c
> > @@ -184,13 +184,15 @@ static void rzn1_hw_set_lock(struct rzn1_pinctrl *ipctl, u8 lock, u8 value)
> >          * address | 1.
> >          */
> >         if (lock & LOCK_LEVEL1) {
> > -               u32 val = ipctl->lev1_protect_phys | !(value & LOCK_LEVEL1);
> > +               u32 val = ipctl->lev1_protect_phys |
> > +                       (value & LOCK_LEVEL1 ? 0 : 1);

To me this code is more confusing than the original code because I
struggle to remember if & has higher precedence that ?: (It does.  The
code is fine).  But Cppcheck also thinks the code is confusing and will
print a warning:

style: Clarify calculation precedence for '&' and '?'. [clarifyCalculation]

You would think adding another set of parentheses would silence the
sparse warning but it doesn't:

		u32 val = ipctl->lev1_protect_phys | (!(value & LOCK_LEVEL1));

regards,
dan carpenter

