Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3662672C882
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jun 2023 16:29:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232954AbjFLO31 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Jun 2023 10:29:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233409AbjFLO3K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Jun 2023 10:29:10 -0400
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com [IPv6:2607:f8b0:4864:20::a33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AFBD49E8
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 07:27:04 -0700 (PDT)
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-464f8a20c05so1195818e0c.1
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 07:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686580017; x=1689172017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/bxMrW8vM1AhIQW11K//c/bT39TFwr35g5g0VwOqygM=;
        b=Z9LbE3o5o9i+eqYfZV5WFtWILsSg9OdjrrWG013BdkA3bM9XOxzWE6TeRmcKWa/SVI
         gCd6HSRCe/kJfREcuHQKvD/hyo72gh3GIWLFoUyxnXRR+VpnaY6fjaPoODOPOp+l2fsI
         aDmOy7mZkNge5dE0xRe2wyguOfbUDkdiOo410C8/jTQRa0zOgtjNkZujY8jUq+KnykUx
         TvLHpVc+uZKunTHM2JmYgHq3vL8TIHf3CoHk4uMsHruH8DD1Ow9rc2pw43heOnouyzkp
         FR6rrVtznHFuwW4sAUprFaUwgRT6h0TP8oZ5NjKDO9kap5gmpUTo87m9fWmxXo3KKqru
         UNCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686580017; x=1689172017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/bxMrW8vM1AhIQW11K//c/bT39TFwr35g5g0VwOqygM=;
        b=ezYdqyreE7bvzKVcduxbosn79e8xlCYVHdEtas0xnTybGhQgw6YDlMAks3CVn28d2y
         iC1jNI3FpWu0ccE+kjErZvKVgJeUeFVv2dZUoK/MA7o5jewgtDiqprcoPEKss/4S7Gcm
         D35pigXg+26gt1DxziWWnvXEx/BUvhMrfAvZCu/Ysl2mD6TCG5gr1yduSyTvdhsVN4dW
         z+b+HcaT1m2gT69U+ctOKvuvxNIQzGHUdR2mQztF1r9Q8aKjK7hcK+lY3dhY0FlTf2fG
         9iin7PC7cw32Po3gwbcQG8TN16YjgknA5TtwieO+ZUn2UViw8tk5hpbfBF26HPbM+d9C
         34sw==
X-Gm-Message-State: AC+VfDzs70ZHUtbysHsryakPQ/BfetTCPXZkg0tiqoZYHXEZ77ev7jaZ
        HtEJNxYNcXU8IgPfSypNm5NKcG00r+c2dfzUOCQWBXLGD8Im4/lEYHo=
X-Google-Smtp-Source: ACHHUZ46EVm9gagxgbHptqRG1A3lcpRCWvTIGspZU6cDaWMgb4kHE+xZnOpofNF5QK9NV9TkJ8G3JkC6j14BhLV0Hz8=
X-Received: by 2002:a67:f705:0:b0:439:31ec:8602 with SMTP id
 m5-20020a67f705000000b0043931ec8602mr2836956vso.27.1686580017575; Mon, 12 Jun
 2023 07:26:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230609153607.133379-1-warthog618@gmail.com> <20230609153607.133379-2-warthog618@gmail.com>
 <ZIOJM-CgPrfKtIFC@surfacebook>
In-Reply-To: <ZIOJM-CgPrfKtIFC@surfacebook>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 12 Jun 2023 16:26:46 +0200
Message-ID: <CAMRc=MeYRKpoU8TaOGnYCqrBy2BdxfNPKhorUx=5rkRNNC7dkg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 1/2] bindings: python: examples: fix potential
 glitch in gpioset.py
To:     andy.shevchenko@gmail.com
Cc:     Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 9, 2023 at 10:19=E2=80=AFPM <andy.shevchenko@gmail.com> wrote:
>
> Fri, Jun 09, 2023 at 11:36:06PM +0800, Kent Gibson kirjoitti:
> > gpioset.py requests lines without setting their output value, and so
> > sets them all inactive, and subsequently sets them to their requested
> > value.  This can result in glitches on lines which were active and
> > are set active.
> >
> > As this is example code, it is also important to demonstrate that the
> > output value can be set by the request itself.
> >
> > Request the lines with the correct output values set in the request
> > itself.
>
> Do we need a comment in the code to specify this?
>
> ...
>
> > +    config =3D dict([(l, settings(v)) for (l, v) in lvs])
>
> Aren't [] not needed?
>

This is a list comprehension used to create the dictionary. Think:

>>> config =3D dict([(1, 2), (3, 4)])
>>> config
{1: 2, 3: 4}

Bart

> --
> With Best Regards,
> Andy Shevchenko
>
>
