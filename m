Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE5A27B0205
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Sep 2023 12:41:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230434AbjI0KlA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Sep 2023 06:41:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230326AbjI0Kk6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Sep 2023 06:40:58 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6FD413A
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 03:40:55 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-d81d09d883dso12227053276.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 03:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695811255; x=1696416055; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6nYXLxAB1G3fPQuWQuND+i8jMgLXF7y81yFurBOx7Q4=;
        b=wyGfay+QSY+gKpC7//UNrF/yxgRA+HMHdA8aK73rZLGYrXKb8XLfmMWdnoSJfDRwsm
         qrscbWDaMJVAb0CrDJQ9Xwz5J72p++RrH19iVCqMDIA1D2eHBBJ+soi3RFCWJsUvGgcY
         aQTmlJYFx/+1j52BQxF2aTCCaMa7yklSbXNrINDQ67MK29m7lHpvViB/b5VqIyD9f4Ym
         qhlK7RWdf5jg9gvtOQ3sFRSc9SW0A63xxNvhfoB0QiGaewy+b2DBQ7XdlUe4Z4QAYrnl
         DSMjE3jO/9wAnicaWsrO/CovPnQRGIim5kUKhsRfshVYoatVaum33Mv/ShNuu8RAkrgw
         8Lnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695811255; x=1696416055;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6nYXLxAB1G3fPQuWQuND+i8jMgLXF7y81yFurBOx7Q4=;
        b=cuhCfZQ6W1JgaKdRsnqNj43DuMoFNiuOTD+GSa037i28GeF5vZhBlmT3ZwEXhmLxqT
         1TfoDpufu7Fwd+S3G86uc3bv27Efb5XRhE45rdS4sYsqBAB+VC30tf9EcuL9T8uvNlkb
         7fy0JnSLeLCZAJG5sWTfpNczxrdM7EF6pN8RGjIqbIBmfBYMYo+6FWsE6rPivuP9XFcz
         utJvGAF7ZtZ2SCSae29rz4l0n5QBNkHZfVKtPrqAYoG13+IwyJA8NMCpU42COWS36wIf
         fkWly0vGnk4goBrYjTSVv2M5jd9z06CGjnWH9tJUVkHLZTrQ0PO2EmFer9pL2BVRmMTu
         XDIA==
X-Gm-Message-State: AOJu0YwEGFWp1ShIRnRrgGujhv/ugikvIu6eRzlWrByStrC3OwHonwDL
        niWu5Ovx5e7Ux5IgvuQegLnUYR9t86p/V8qymoCnrd8SbKqv68/F
X-Google-Smtp-Source: AGHT+IGmun0NZIJ3+bBsQ7jBRBeKX3tnz5U8pzUprEmhy+ptbeVeqez+29jxHbg6q2orBUPijpNbYnhB12LG7S+EtJs=
X-Received: by 2002:a25:ac1e:0:b0:d81:6344:540b with SMTP id
 w30-20020a25ac1e000000b00d816344540bmr1617296ybi.45.1695811254940; Wed, 27
 Sep 2023 03:40:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230925030647.40283-1-andrew@codeconstruct.com.au>
 <CAPDyKFrFxYxSTa=z2VnCk4m_d-wEgd17wBokzyNCCRLtSUnFKw@mail.gmail.com> <7a7d5a7f19fc793f157508fec7fbc09ca8c4cc4b.camel@codeconstruct.com.au>
In-Reply-To: <7a7d5a7f19fc793f157508fec7fbc09ca8c4cc4b.camel@codeconstruct.com.au>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 27 Sep 2023 12:40:18 +0200
Message-ID: <CAPDyKFquBkoA2NN7MLwkOeAsykUfp9q3RrbdnAFNNkErEiseMg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: aspeed: Update Andrew's email address
To:     Andrew Jeffery <andrew@codeconstruct.com.au>
Cc:     joel@jms.id.au, andrew@aj.id.au, linux-aspeed@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 27 Sept 2023 at 01:22, Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Tue, 2023-09-26 at 17:03 +0200, Ulf Hansson wrote:
> > On Mon, 25 Sept 2023 at 05:07, Andrew Jeffery
> > <andrew@codeconstruct.com.au> wrote:
> > >
> > > I've changed employers, have company email that deals with patch-based
> > > workflows without too much of a headache, and am trying to steer some
> > > content out of my personal mail.
> > >
> > > Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> >
> > I guess it doesn't really matter what tree this gets funneled through,
> > so I decided to pick this up via my mmc tree.
> >
> > So, applied for next, thanks!
>
> Ah, thanks for being so prompt! However, Joel has sent a PR to Arnd
> with the patch:
>
> https://lore.kernel.org/all/CACPK8Xc+D=YBc2Dhk-6-gOuvKN0xGgZYNop6oJVa=VNgaEYOHw@mail.gmail.com/
>
> I thought I'd left a note under the fold asking Joel to do that so
> people knew how it would get into the tree, but that clearly isn't the
> case. Sorry about that, I must have rolled the patch off again after I
> put the note into the original.

Np, I have dropped the patch from my tree now.

[...]

Kind regards
Uffe
