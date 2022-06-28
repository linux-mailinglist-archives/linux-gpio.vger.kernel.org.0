Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4C1B55E8A2
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 18:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231414AbiF1OOl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jun 2022 10:14:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345249AbiF1OOk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jun 2022 10:14:40 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBF422EA01
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 07:14:39 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id x184so19699544ybg.12
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 07:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yRKsEKAbcC84O4kmV91KMhoX8vJB4xrqfQjGdGIO0i0=;
        b=ulakMtrzIO/z639ratWT8ml2sEdMQ9s98YlOcsymzYlmRWyHzMlqVS6P0cPv0nRTy6
         uN445dFN49VkwAVd6rRYjap/2ZOZBBp1WKobZCWPVDeumoY0ohoKe5oAUZgUT5oMNNTU
         UM60YkE46bWRbSPunjqfNzuxr1i9ngn/sQv903+GrruR0nRQJ7cBeeW/iq7+FMOHchLU
         //sAIvAp/YAgqMEt3Us8qB8UGa7ZU44y0de4Tg1VYNSJhyxyBof/E68jOq94yFF3gOGG
         syg7wjUa61hWvFqLPYONnc+QR22vAKOheV5a7EVhAcUAkY36aSlr6A5t5dJodtEV0hK+
         mKDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yRKsEKAbcC84O4kmV91KMhoX8vJB4xrqfQjGdGIO0i0=;
        b=p2UPRpnFrjrHEgj1z3cZ/qzM8JJRhg7AyOERTZEKKdZILO9YZbFHimP/hLyp3ZjHoe
         h5iltaw+5kShPMfoPL8+fZRWP3wOdNO0x1MCAHXuSw7beLZCBwZSH6S7Usucn516T32a
         Yykb6IjTfqgf/Nlg80RiLZqTtoxRLBo7mD0y091iz1KbWEQx3TCcSgc7s7h+tRAcr8qS
         4uLfT+d3UsZvB2KLn+dKUZlnDPYL5HVwZiGpbUCBjDds6DLZs9SK6Ps5WPQVyfqcwgab
         BcMVUVSL6FFi65mcxkauam8uK3j88buBVpCYw8h4NeiD0z9h1RLkoIxNohfhhYQ9u9xa
         xIIQ==
X-Gm-Message-State: AJIora+0iCTdltB37K1drtQy5fO/24D/syCMAC/LPiDEXTI8oDPRE4pV
        KZoizbjam7vBghGPdJmZOZYi/vUJUchUJRnC1uyNmaWbQ60=
X-Google-Smtp-Source: AGRyM1t1bAMh97Lo2R3gBPI7zO542FRzDkx6+JFfvFJvwPDKhHjKDaEHn6/9FUsxUZp3QIXmsmVG8IM8cJsRyUIp7Uo=
X-Received: by 2002:a25:1f57:0:b0:669:b6fa:167e with SMTP id
 f84-20020a251f57000000b00669b6fa167emr21092368ybf.295.1656425679084; Tue, 28
 Jun 2022 07:14:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220626235743.87821-1-linus.walleij@linaro.org> <20220627144457.esdwcma4wibtc2jm@notapiano>
In-Reply-To: <20220627144457.esdwcma4wibtc2jm@notapiano>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Jun 2022 16:14:26 +0200
Message-ID: <CACRpkdbBo4t34g9rhUSRquiRkHtQ_C62V_xAjtz1KLfLheef1Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: mt8192: Fix compile warnings
To:     =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@collabora.com>
Cc:     linux-gpio@vger.kernel.org, Guodong Liu <guodong.liu@mediatek.com>
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

On Mon, Jun 27, 2022 at 4:45 PM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
> On Mon, Jun 27, 2022 at 01:57:43AM +0200, Linus Walleij wrote:
> > After applying patches I get these warnings:
> >
> >   drivers/pinctrl/mediatek/pinctrl-mt8192.c:1302:56:
> >   warning: "/*" within comment [-Wcomment]
> >   drivers/pinctrl/mediatek/pinctrl-mt8192.c:1362:56:
> >   warning: "/*" within comment [-Wcomment]
> >
> > Something is wrong with the missing end-slashes. Add them.
> >
> > Cc: Guodong Liu <guodong.liu@mediatek.com>
> > Cc: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>
> Hi,
>
> yes, this issue was noticed during review [1], and fixed on the following
> version [2], but since the commit before the correction was applied, this=
 fix
> LGTM.
>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

Thanks, yeah the real problem is me lagging behind in reviewing
and applying patches and making mistakes like not seeing there
are newer patches in the front of the review queue...

Yours,
Linus Walleij
