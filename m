Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DBA06EA675
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Apr 2023 11:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231859AbjDUJCa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Apr 2023 05:02:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231639AbjDUJBv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Apr 2023 05:01:51 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAACFAD03
        for <linux-gpio@vger.kernel.org>; Fri, 21 Apr 2023 02:01:50 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-552a6357d02so16079197b3.3
        for <linux-gpio@vger.kernel.org>; Fri, 21 Apr 2023 02:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682067710; x=1684659710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ToiPBpdAxjCAxJF43AfJp/Rj688Pj2Ypepz4NjUUUyA=;
        b=kTXBCu2GE4qEhmJpnKtdAEx1qmHXBKyAnZ61GYEm/IWOs4DWlkAixPBwuPZ5rbt3wE
         JG/pGKL4+oldgpFcDvxS/TM9JSQz7BrzzalblEv9i2F0bsQRKYM525neJQO99ZFG5b0G
         ilQq6xyo1s25/g43zUvxSxaXQcgqnFWjeHrQbKO5xEmAFm1ru2iraErCeLRIu6Rgcgil
         PA6SVPKFjY6Ea4IOEK1JQOdPapfkCKNjsQw9a0dgf5YhX7bcjAzM3CRGSZlGWtCRotAj
         axtuC7KsfD7qnTFvpKStU3Eu9eAeARlbtlqpMVzC9CkV6/WqtJSMHVq2OaIR3YSFJkeg
         PTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682067710; x=1684659710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ToiPBpdAxjCAxJF43AfJp/Rj688Pj2Ypepz4NjUUUyA=;
        b=UdWg/F8RuCo6nxrNp3ucrpoHPMyxQdSgXdvOnKIeh18zvYIlCEeTjmk5HqrIzLSLjA
         dOi8cloDqh+C3hlQl16+rNgsbGvdJscH85JBx+bryUsXatyN2oDpmNdkk1K1INDOkSPh
         2JpCsfBxuAqbKZtNzTa6XHpbtWX/lE+XBV2vYFNxCEiu5jsj7I+916wzLRCQ2agaUCUQ
         boEjzkP/Ww/79KSWlLrKO7LIEXf1Tp0XMx1mlmdc54bGLkOe1h8xfO8uO9giBpZdQ7gV
         O9Q6psF8+HWu9Q4fzKyX4bLdRlH2yE8T3sjiMJKOMiuKAL/vGoRp8XFGE48CYnoUksfJ
         72uQ==
X-Gm-Message-State: AAQBX9d6VyU2BCtfjTbcz/d/N/QOATj23DyKE0DoTWvPibVqMtx2C/NC
        Jfbomd8HmPLWFIPpzPOXVDJXyO3oveT1w/b6UGCang==
X-Google-Smtp-Source: AKy350a8QRB/T8UI+klrD0gYXZ1RkUVOHetcDghs325st8nf7xoBuLJAj3nzqydGEOqKTeFIcs85oNWJHo2bkkUjbc4=
X-Received: by 2002:a0d:d98f:0:b0:541:7193:e136 with SMTP id
 b137-20020a0dd98f000000b005417193e136mr1321292ywe.23.1682067710104; Fri, 21
 Apr 2023 02:01:50 -0700 (PDT)
MIME-Version: 1.0
References: <4302b66b-ca20-0f19-d2aa-ee8661118863@xs4all.nl>
In-Reply-To: <4302b66b-ca20-0f19-d2aa-ee8661118863@xs4all.nl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Apr 2023 11:01:39 +0200
Message-ID: <CACRpkdaorkV73hAEcnXHLV2WpGfPmnqnHy6mdo7=9wVGtH4zXA@mail.gmail.com>
Subject: Re: [PATCHv2] pinctrl-bcm2835.c: fix race condition when setting gpio dir
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-rpi-kernel@lists.infradead.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 20, 2023 at 2:47=E2=80=AFPM Hans Verkuil <hverkuil-cisco@xs4all=
.nl> wrote:

> In the past setting the pin direction called pinctrl_gpio_direction()
> which uses a mutex to serialize this. That was changed to set the
> direction directly in the pin controller driver, but that lost the
> serialization mechanism. Since the direction of multiple pins are in
> the same register you can have a race condition, something that was
> in fact observed with the cec-gpio driver.
>
> Add a new spinlock to serialize writing to the FSEL registers.
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Fixes: 1a4541b68e25 ("pinctrl-bcm2835: don't call pinctrl_gpio_direction(=
)")

I just applied this patch now so it can go in with the rest of the patches
for the merge window. I don't especially fancy having to immediately
start a fixes branch before I've even sent the bulk of patches to Torvalds.

Yours,
Linus Walleij
