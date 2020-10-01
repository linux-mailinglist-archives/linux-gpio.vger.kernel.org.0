Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D325427FAE8
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Oct 2020 09:58:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725921AbgJAH63 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Oct 2020 03:58:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731485AbgJAH62 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Oct 2020 03:58:28 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 646B3C0613E2
        for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2020 00:58:27 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id y4so3825907ljk.8
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2020 00:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I2RxhvY5NgmVXMLybhimHhtN1TXECVn5tQhd+CCxH3U=;
        b=urcHuUAyChlfg7tAIApcPZY1ihayP5HbBNn8FxBa1EbAIPwKxXi1CpulUJCx0v0fcC
         A6+zt2FWl1dwju9no8JrahYciPOnxelk9+PK4PZbJw5WxwWzYqYo27uO/IwGmDttgwBr
         kC9jRWEkmvN5VbSJN09VG+fYBrVAVb+3qW6fcXRZIWG8l2XQZBwEPjpKpnbw9eB7V6wW
         A2eg5WV6cxo6JaAdZrfF5/4S2/SU76V28aYVZtlLBTTnLu+Gsb0okQwMFIRdZByV7ld4
         HYhVNA1te63uYSpQzKSmRBFq9QH1ksYnbgE6Oghf4tLgTDElmmpCPxZ0XRT+8EB6hg+Q
         62Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I2RxhvY5NgmVXMLybhimHhtN1TXECVn5tQhd+CCxH3U=;
        b=FAIw27D5R1JcnZUFDW/0feVh3VNW1KvpA8LGEhfBhZ9oYvoXpouuT+Dv4MP90hiv67
         sUYI/rumnze40XNFVGLglBkIDkIaw+/zd9mNjIUCmzxRtl8jkJfjHBO/2Up5ZpcgMRrG
         NU56IL1r4YLo7CbNESUa6OTYPByENnE6253yAVCsF62fLpvczXVJwUSosIkOOutxsRH8
         n4vwswRte0NcTmITpq/3JxjgZGQwt4KkFYzXI2FG4DUOWCUo7eyi9VMnkFcu10N7iwS5
         M9Serw2SV4a8QfGVa69BdkaMFId+uX9CZBPXHfYEAv5wyEY5okIODb/Hj6zCBMDyl7wq
         1m6Q==
X-Gm-Message-State: AOAM532L0bDLwhCsriT+Hs0QAuDR1++jGZZBqDTh7PH/LPJoTuGQyuKc
        XU7eDBArLUmMGFB9DzsvPstz4/qxPCbfySI3aQKlyQ==
X-Google-Smtp-Source: ABdhPJxjRqz2yUHvCNFY6FBrV0pvSdM24cdpdLikgyWwKGbflyn3GYJWUChczn+03SJSBKMtngr1He4kzybB8WtYKfc=
X-Received: by 2002:a2e:a306:: with SMTP id l6mr2100470lje.286.1601539105709;
 Thu, 01 Oct 2020 00:58:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200821075452.1543610-1-enric.balletbo@collabora.com>
 <99821f85-9a38-7591-f982-872603b6ce8a@collabora.com> <CAGp9Lzq-15xjvSVaEJ=2o18o-8ESGWsHf-LNAXXwKfxu4V-0NQ@mail.gmail.com>
 <CACRpkdYPoZX1+rfJb925_+H6YXiwO26cKLpZae=_j=RQKGA0Wg@mail.gmail.com> <CAGp9LzqGwvxGF_bhuyGXu1R2516x=twv1j5e0Wx0EQ7GZ4b-yQ@mail.gmail.com>
In-Reply-To: <CAGp9LzqGwvxGF_bhuyGXu1R2516x=twv1j5e0Wx0EQ7GZ4b-yQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 1 Oct 2020 09:58:14 +0200
Message-ID: <CACRpkdYga6XttmMnQ6r--_7wtfebirY5Z58D6xhBkRRDrf98ZQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: mediatek: Free eint data on failure
To:     Sean Wang <sean.wang@kernel.org>
Cc:     Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        lkml <linux-kernel@vger.kernel.org>,
        Collabora Kernel ML <kernel@collabora.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Nicolas Boichat <drinkcat@chromium.org>, hsinyi@chromium.org,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 30, 2020 at 6:33 PM Sean Wang <sean.wang@kernel.org> wrote:
> On Wed, Sep 30, 2020 at 1:47 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Sun, Sep 27, 2020 at 7:57 PM Sean Wang <sean.wang@kernel.org> wrote:
> >
> > > v2 seems the same with v1 or I was missing something.
> > >
> > > I just thought we call devm_ioremap_release to explicitly to free
> > > resource when a certain failure occurs after
> > > devm_ioremap_resource?
> >
> > What is the semantics around mtk_build_eint()?
> >
>
> mtk_build_eint is to add external interrupt function to the
> corresponding bound pins.
> mtk pinctrl driver still can work (than means probe() successfully) to
> keep pinctrl functional even with there is an error in mtk_build_eint.
> So the patch is used to explicitly free those data on failure in
> mtk_build_eint to let unused data is being free:ed immediately.

OK then we need a v3 of this that will call *release
explicitly, indeed.

Thanks Sean!
Linus Walleij
