Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 126EE6BAD52
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Mar 2023 11:15:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231986AbjCOKPe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Mar 2023 06:15:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231987AbjCOKPd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Mar 2023 06:15:33 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55DAE2472F
        for <linux-gpio@vger.kernel.org>; Wed, 15 Mar 2023 03:14:57 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id p203so11426416ybb.13
        for <linux-gpio@vger.kernel.org>; Wed, 15 Mar 2023 03:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678875295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PuHAtbYWTW6xbphRQ0UVmubUbbrmzEvZg9EDtKN2tX0=;
        b=hw5X+lY7q6R/R1JcozeqwndOrE/2ThrtZi4MMpN2mGEgFSDgTs2VZBFL3LUo9GUWoB
         vpYsGHy3sc0+XzT7mnQFb1wa5x/BnslBPny/8knjjZ/51WXoQBmYXnv6WqqyAGjQ3qys
         IT3yE1Khe0tflDtqilUsYwTfXrYOt1sCyay5HPCs2Rk8oxdWsFsRDYC4aPsvL77+nW7H
         hAJHZH0ITFjPAxoFhKLWu5UqbgP8umfTCjnl0Z50sae+iuOEFBVfpxIE8916HSQyWyh7
         gVKXAasnwhLsztlUzJNxl/kg+xUSJIQ91m01XzrCgYzuQIOewgEeqSbOr9lh9ukBGQad
         SkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678875295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PuHAtbYWTW6xbphRQ0UVmubUbbrmzEvZg9EDtKN2tX0=;
        b=Ad13/EB/hM33F7DpypqrVeJUcgXaEB1AuAI3uX2X4O+QBK/UFZ3EbOmk1TIm1PAF1U
         Toq06jVdy2g+p7BZAmU/4dd+WfSbfRpR4Uq8Ip69TQkcHTwa9LTxNDONH819G4LvNz1Y
         ii3hW1b/DlZ+X8F/nd7h4H7137GA7kQdr6Sqr0MQ6VIDJfThGyddCF6ztEsKsizx2LXy
         9lT+WL6rFvyZ5zMEwyKPpZCLO4h3HlYdR4wAYjF1MdDANApHgnR9i0X2XWAxN6zKlEyo
         02M0FHE8uy2apgLTY4nnLGuH4xFARi9TwBqenwNRydgzJurb66bpXyOAEO8/krOttgj/
         Qutw==
X-Gm-Message-State: AO0yUKU0uTvjcjVqACVZCAm2Dr+7PkLJDIKcFdi741IhCCiLQEAqFpZA
        W/tLzrTWv5PE/qPgEmEO344JE7gBChJLSquNVv/lxA==
X-Google-Smtp-Source: AK7set+rPVJh1mommx+MiSZXhKbPtqCHgOXsenWEXVmlojgyvLjXuIW6mpbV5LyWvVilu4vm1oHMYIbVcuq9QY++rAw=
X-Received: by 2002:a5b:c7:0:b0:b3b:d433:b063 with SMTP id d7-20020a5b00c7000000b00b3bd433b063mr3089486ybp.4.1678875294928;
 Wed, 15 Mar 2023 03:14:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1677515341.git.william.gray@linaro.org> <CACRpkdbAMQ0OAMnxuyf6gMFu8qJakmT=WvRzBTXavXFmnJ9ObA@mail.gmail.com>
 <CAMRc=Mem3TsNM5coFLKAFQ74Rk4vvXLscuBhWoR-G6mLtxaSPQ@mail.gmail.com>
In-Reply-To: <CAMRc=Mem3TsNM5coFLKAFQ74Rk4vvXLscuBhWoR-G6mLtxaSPQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 15 Mar 2023 11:14:43 +0100
Message-ID: <CACRpkda2_WNAWZLH3nOZe=gzArMxAdO6XD3R42i6RTrvNZNPjQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Migrate IDIO-16 GPIO drivers to regmap API
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     broonie@kernel.org,
        William Breathitt Gray <william.gray@linaro.org>,
        andriy.shevchenko@linux.intel.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 15, 2023 at 11:02=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
> On Mon, Mar 6, 2023 at 3:13=E2=80=AFPM Linus Walleij <linus.walleij@linar=
o.org> wrote:
> >
> > On Mon, Feb 27, 2023 at 5:54 PM William Breathitt Gray
> > <william.gray@linaro.org> wrote:
> >
> > This looks good to me.
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > Bartosz, of you merge this you can drop the corresponding
> > patches to immutable irqchip conversion for these chips
> > that I will be posting shortly (currently on the build servers).
> >
> > Yours,
> > Linus Walleij
>
> Mark, can you provide me with an immutable tag for the regmap tree
> containing commit 1/6 from this series, please?

I think there will be a conflict with the immutable irq_chip patches
that are merged, but maybe the conflict isn't that bad so you can
resolve it while applying.

Yours,
Linus Walleij
