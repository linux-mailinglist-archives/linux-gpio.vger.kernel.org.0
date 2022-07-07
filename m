Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E491F56A0FD
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jul 2022 13:19:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235303AbiGGLTS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Jul 2022 07:19:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230020AbiGGLTR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Jul 2022 07:19:17 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD2DB13CEF
        for <linux-gpio@vger.kernel.org>; Thu,  7 Jul 2022 04:19:16 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-2ef5380669cso166449487b3.9
        for <linux-gpio@vger.kernel.org>; Thu, 07 Jul 2022 04:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VvxqR2YjkAkhpO2mn7wnIMgnH5muBkn2KjHJkHBwJ4M=;
        b=G27hnhbqEpozKlhqKLrtCAjv82OR52ZxFVIc1rtzysUyjGTIFZJ22Hz36cA4h6Tkzw
         6OsFajsJuBuCHaPeZlRyQbiYumtUQpBLMKd5IjM8WPbD+9kLdew04+Yqmiu0PZP6CJZg
         /lGNjLp1AJjVvVgdsJzXUR/l+I64N+TXaYBJxIxPaYJitRium0SN2mbHOSURz3xln+Eg
         2EMyr7bCutxEks/LBZ3HtRkl/Tm9yqamh/lpEZ+iggDT1rYrmhuL0HQyeUolBSkV6PMO
         jKbqE/ApX1FpaE9KRJUoBBi/urjlIoEBtv+ZkFaOMIbI25UWWji3x8J0EmLchRNBmfVB
         2+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VvxqR2YjkAkhpO2mn7wnIMgnH5muBkn2KjHJkHBwJ4M=;
        b=TMOftOd0facsLIL1qHtsLUnB5kQL7p5/ryAKu35PMlLfJjH8uq0ym1AefyO8Iik182
         ez596XHlAYlKTbpdNer0DlkQJW5yTyqb7/cKHoFn8jzIF/IwKBuTbw9Z4qb23Ismy6mx
         slw22Xfmj7JzEtrtZ1/eYAE4XLlQYJuJdvEJPfoB5uQH+vUOHAvgiau1+ITnbryTcl1X
         MW1OnkafzjWreXjiSt1zv3XOnmQVCELTDyhcpMkLcojeqEJRAdmk3Lx0OXwRFp+/jMbJ
         wXXMDuu13LkbhHZT5T8YUYX5iHG9/naw8Eyo3frl0Orti+CBfeKEs78jdlDawqRYkvI/
         HmOw==
X-Gm-Message-State: AJIora/lOlyIzwDRLIZlVTmIWHxzNtueGar+FLJJPv27Z/fJshNlx6EC
        dqGbNbqG1nyN1AqxBKxUpdz/qd1+6/wPEja754LbbA==
X-Google-Smtp-Source: AGRyM1vGTv2O5NMNR7KotzClJ4xj25bceIP1C0NhvmuMrV5KcY2p9o4Jk5Ay/HNopsU6jIkiUAwGfAEc3qEGF9tkrac=
X-Received: by 2002:a81:a8d:0:b0:31c:cb2f:c805 with SMTP id
 135-20020a810a8d000000b0031ccb2fc805mr15369615ywk.118.1657192756039; Thu, 07
 Jul 2022 04:19:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220223174215.17838-1-a-m1@ti.com> <CACRpkdbj2B90-RE2XKQJ5qEj1hZQA-u=vUu2vpXwNqQLf_kaPg@mail.gmail.com>
 <e682175fcfc54217a6ed006270877f4d@ti.com> <ddc2b24e-37a3-4751-80b9-84b13606a703@ti.com>
In-Reply-To: <ddc2b24e-37a3-4751-80b9-84b13606a703@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Jul 2022 13:19:03 +0200
Message-ID: <CACRpkdZ7Kb0=7LHa13KJeZc2Kwb6z5kuH9nnHrk4p9OqB8+QgA@mail.gmail.com>
Subject: Re: [PATCH v5] dt-bindings: gpio: Convert TI TPIC2810 GPIO Controller
 bindings to YAML
To:     Vignesh Raghavendra <vigneshr@ti.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 7, 2022 at 7:19 AM Vignesh Raghavendra <vigneshr@ti.com> wrote:

> Hi Bartosz,
>
> On 05/05/22 14:28, M, Aparna wrote:
> > +Vignesh
> >
> > Ping. Can this be picked up for next merge cycle?
> >
> > On 15/03/22 06:31, Linus Walleij wrote:
> >> On Wed, Feb 23, 2022 at 6:42 PM Aparna M <a-m1@ti.com> wrote:
> >>
> >>> Convert gpio-tpic2810 bindings to yaml format and remove outdated
> >>> bindings in .txt format.
> >>>
> >>> Signed-off-by: Aparna M <a-m1@ti.com>
> >> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >>
> >> Yours,
> >> Linus Walleij
> >>
>
> Sorry, this patch has been around for sometime w/o any comments and has
> relevant R-bys. Wondering if this fell off the radar
>
> I believe patch would go via GPIO tree?

You need to use the right mail address to Bartosz so he can pick it up.

Bartosz: this seems to have fallen between the mail address cracks,
check it out.

Yours,
Linus Walleij
