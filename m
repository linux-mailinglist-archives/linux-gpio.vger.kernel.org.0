Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E04D79DA87
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 23:04:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235658AbjILVEs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Sep 2023 17:04:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234038AbjILVEr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Sep 2023 17:04:47 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8BB710D3
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 14:04:43 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-d8032efa2bfso374250276.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 14:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694552683; x=1695157483; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vn/+r9lrRj3XCF0f1OgbLrVWHe/dDEBlspgHejgs8pM=;
        b=fMSSJ0qri0r5tAepnqQqd83GYy4wwjiPil6XH8Lcz5rDe7THJjuwVDmS3VSI9xwaQw
         hKBdCjxsQjkQrpHhHykDYLJMs5aCE1i9kI896wS9gUWWV2Ys/W3OAAAhXOoowqWQsYJl
         vs5kiLrExDpQR9Anh8X6v2M6vf0HyN6kbIyMN4EYjAQv0/2BD2KfIlSlOaDiFYvqzexa
         Ur3BAb+BIyttYH5T9gDHSKAIVOro/ACb01bC1BmFMNrPucJiLSDeZWnxzMlgcO6malur
         ObhVsB6oU2SBB/6KI3GNwj+Bw28kV6KJ2JsyWpm4Zwh517kUgj9//UfslK+7jQCFNrWl
         CNUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694552683; x=1695157483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vn/+r9lrRj3XCF0f1OgbLrVWHe/dDEBlspgHejgs8pM=;
        b=urkyi+d+063baIh+Gd+W9O95P3RQqS5iIVmqJJhf0ZBJYMmcQTC7prkw1r04A9PFfG
         TQ0SliPXRxMiivehR2FVC9dlMJWKtjHp7NUAQvvBGfrk58d0+VoSAKri+3GTTkXHL/Jy
         Hb6UNBN/SR0Glhhd+UafcY29l5EORPXt76D2PydP+GySkfoWHFqim982ikZHkqKgEs4C
         ACWWiwL9F98JlYZiJ0YNoHCFle9wB60Ca5bvAdL7JlBe3+YGQVOi44lrH+WI3KZKMGm2
         PAmsiV9x70FtxxdiDHENeAQ/oogyZlXYl8TE004MTG1OTG9YHm4rdq+6ZrrBRsxI5xOc
         Xd3A==
X-Gm-Message-State: AOJu0YxMZdTxxEmCqo+pQhnd1D6b/ZDHNx0K622FZyds/HV5zQ4hWbCs
        vMUN2jp89jvDzzVfwLs2u2Ot9zcUCm5TUPStwhMhMw==
X-Google-Smtp-Source: AGHT+IGQDuLaoE4eOyZT+Z8hNNsgfwvWorKJwQ3GNnopbwgh3VM6Y+HWcMTMFBMaepKaqB0s4OiEEYQ95/LJVmcUlZY=
X-Received: by 2002:a25:aa6f:0:b0:d78:414d:1910 with SMTP id
 s102-20020a25aa6f000000b00d78414d1910mr4091514ybi.25.1694552683091; Tue, 12
 Sep 2023 14:04:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230912081527.208499-1-herve.codina@bootlin.com>
 <20230912101505.225899-1-herve.codina@bootlin.com> <CACRpkdbxdMZt4E1SF1v9as-jw=TpvS1mk2TQqAgywMBLbKaNoA@mail.gmail.com>
 <71761f94-14ea-4e2a-a079-c74dfa32387a@sirena.org.uk>
In-Reply-To: <71761f94-14ea-4e2a-a079-c74dfa32387a@sirena.org.uk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 12 Sep 2023 23:04:24 +0200
Message-ID: <CACRpkdbZK8GUgOcLA2D=7nDejK9cT=bxwP+HcC0GOKr-0yCJ4w@mail.gmail.com>
Subject: Re: [PATCH v5 28/31] pinctrl: Add support for the Lantic PEF2256 pinmux
To:     Mark Brown <broonie@kernel.org>
Cc:     Herve Codina <herve.codina@bootlin.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
        Simon Horman <horms@kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 12, 2023 at 4:31=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
> On Tue, Sep 12, 2023 at 01:04:56PM +0200, Linus Walleij wrote:
> > On Tue, Sep 12, 2023 at 12:15=E2=80=AFPM Herve Codina <herve.codina@boo=
tlin.com> wrote:
>
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +/*
>
> > I think SPDX mandates that you start the tag with C99 comments
>
> > // SPDX-License-Identifier: GPL-2.0-only
>
> Not for headers, they should use C style since they might be included in
> contexts where C++ isn't supported.

Oh right. Thanks Mark!

Yours,
Linus Walleij
