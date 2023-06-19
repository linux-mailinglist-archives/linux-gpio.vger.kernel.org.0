Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D698734C96
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jun 2023 09:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229909AbjFSHoY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Jun 2023 03:44:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbjFSHoF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jun 2023 03:44:05 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DE0410D4
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jun 2023 00:44:04 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-561b7729a12so63359637b3.1
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jun 2023 00:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687160643; x=1689752643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4rfqVV4RqiyGX+NOos9GrR72Yg9f5DCocdZ0hjpuxCI=;
        b=gF6aMplCSu2sOB/mOJCxQ+kgwIDeX4++gFbVg8o3++FKFxZxhjseSDRKtp0V3+ETzH
         gIvOqxvPQQ4rNj78kJ5ToXXifY3Q/rVRIUk70dFCzv/huIacWmtwcez5OG42CtXeP6Ve
         TWSTaLit3tdftYavzZKYvbwq9NmNxnNlJVonqXOiT2RvQYOBP0iMjAHjA6NCIRNkKkl/
         k/8rkYQuQbX1V0p/PrFsFF4vRF8wQafAqIs4blOT+GsztKb8knC05AamS5ncai+2rubY
         hGHwTW5TRyrwytELCOyoS0Hv24Co3KH3zpZQnCk4c5CnMG8ynVt3BJkI311WctPidttL
         wz5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687160643; x=1689752643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4rfqVV4RqiyGX+NOos9GrR72Yg9f5DCocdZ0hjpuxCI=;
        b=Zm+HPK2wqa402363uP16F1WRXqdcoVp5jPlI8+jAt9ZGMcoa+o9xRIXpvzLNYFTdHN
         ugXyVyY4TtxYlSofriH7HF9/wfJt/kWQf7TVJum2snjFmkwUHUVorNAYhf41nDIWWgOH
         BNOPfh86A9S8jmdpUjyYcClyvku5WsHnfDGZRAjUKy9PxpAhNftNHXdpCNgOZOu6pRq9
         PTKCl6//ngsTcix4tvs+ZSZJC8a9wV6Ye9WzlcpRiQbnZkzZwT9kjC/f0iBBAmCDWUTL
         Ssou/THm1uZ23UfcAKG3Hg55qSpPLe8IzPK3NmiCQKh2v2D00DcQsxAoLYImEANu/gNe
         U1Kw==
X-Gm-Message-State: AC+VfDwt3jAvKCkj8/63OaJJiyzy6auO4oWznQ8jLH51umf3cr5DHW+F
        4YQlsV+Uem7rWknIGwWXhb3J5NxI72+cYxOoe9yPuOFxi5n3xWoJ//Q=
X-Google-Smtp-Source: ACHHUZ5qjGTBy4mHzg1dwkSZg91R1AfLOxHyU9a5EkeZaRf8LL2IqGXOpAO0lxXoTlGKCj+FNAMPSmfmYAjCIH0+9As=
X-Received: by 2002:a25:6902:0:b0:bca:f08b:69ea with SMTP id
 e2-20020a256902000000b00bcaf08b69eamr5742162ybc.14.1687160643564; Mon, 19 Jun
 2023 00:44:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230616-fixes-gpiolib-irq-domain-v1-1-27fe870db961@kernel.org>
 <ZIxuExRypHsUejFI@smile.fi.intel.com> <4b55afe91d2a704c0229340c5ea4885e@walle.cc>
 <CAHp75VfJ4vB2yWY6rFQrRh3Sbz9bg-fgKXXH-_-YFHMHuM=ZLw@mail.gmail.com>
In-Reply-To: <CAHp75VfJ4vB2yWY6rFQrRh3Sbz9bg-fgKXXH-_-YFHMHuM=ZLw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 19 Jun 2023 09:43:52 +0200
Message-ID: <CACRpkdYsp4eTQE5=eqPqXuV_x=Xqaf7nWL+RVvqwVDaAmeTqqw@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Fix irq_domain resource tracking for gpiochip_irqchip_add_domain()
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Michael Walle <michael@walle.cc>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiawen Wu <jiawenwu@trustnetic.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jun 17, 2023 at 4:25=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Fri, Jun 16, 2023 at 9:02=E2=80=AFPM Michael Walle <michael@walle.cc> =
wrote:
> > Am 2023-06-16 16:13, schrieb Andy Shevchenko:
> > > On Fri, Jun 16, 2023 at 09:30:06AM +0200, Michael Walle wrote:
>
> ...
>
> > >>      /* Remove all IRQ mappings and delete the domain */
> > >> -    if (gc->irq.domain) {
> > >> +    if (!gc->irq.domain_is_ext && gc->irq.domain) {
> > >
> > > Looking at this, perhaps positive about allocation?
> > >
> > >       domain_is_allocated?
> >
> > I mean all domains are allocated ;)
> >
> > domain_is_allocated_externally? I'm bad with short and concise
> > names..
>
> Naming is one of the hardest problems in software...
> Your variant is long, but conscious. I dunno. Bart, Linus, do you have
> any ideas?

No, this name is fine. It is meant for human readers and they
will immediately understand.

Yours,
Linus Walleij
