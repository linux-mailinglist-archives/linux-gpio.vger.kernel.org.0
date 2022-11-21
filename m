Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 007B3631B9A
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Nov 2022 09:37:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229909AbiKUIhP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Nov 2022 03:37:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbiKUIhO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Nov 2022 03:37:14 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 956381F2DF
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 00:37:12 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id l24so2613140edj.8
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 00:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/twC/ha76jEiNVmOM5ygah60xUtG/ONv2QvD8LyUHR8=;
        b=nSBCI7qcEXZMZy9n5XsZR2PvEFCeEWDrLwXXhHO23PsKyEBwla0aK8X/4NJvK6SGIv
         BBm2SDyRt9Nas/brh3CNJSdtC5xDv4fKs45a++pe9cp1gcQGsnC48HDou5lbgTALzH+C
         M7k8eulHknrjylWM83S5hPEIf7zce7oRkopuXJJ+OmuTzIst21IZIxp+1sJbs3NOKghK
         NfgX5txuH4aqusDYCFM9Kzjik6vuVV/v/dhliPgLay8MplwUZW6WbEt9YViL3SISBGZT
         pCbkB7vzr5ixcQ8isnnglqA/OQAt9nJVOA5Yqq8ZOLipS7MXzaRLkX0F6HO14Vr3A27r
         8bjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/twC/ha76jEiNVmOM5ygah60xUtG/ONv2QvD8LyUHR8=;
        b=G2iLn/De46/9JYPpK2A/UmdkCrm8qxXOsHJgcSwssIV73G3+uMPkMkP3UxA/Jl7m7F
         y9oThCZRIOYhpWgs7cJ+vaqllqYKspXlKUH18HvOgCHwnL4z+NhYmh29U6KWQULqdDW4
         AdjxzcLbAlSpU6oJmokmwVxFdzwBrrTOuv4XrNNGKTwKXhSAyucVvSZZHE1SnmBoD4OM
         dQx4YHCWocxDnN1MKzUd4vNiG85pPuicFcDfLiMqb5IoatZRThiUmWx4Djs548ENHXj6
         BfGm9S6YsaxqrnnylX0EHmDKrgBLzUUjiU1sfocJg0VPJqlpJZqw7bgJXiFxb5lYJvIR
         HfpA==
X-Gm-Message-State: ANoB5pmir42dlURvMY64GeK/oTd3NAkA5ArnohXDwQ6UU0Tp7OX73Fz+
        lrTOeQp0bqtCgfexxeOu0/mGsJLh3JI9BZ6kqR2/Bw==
X-Google-Smtp-Source: AA0mqf7H05bbHloVzMxMtfy6zpSK99wVNqcrzskS8PJRKysYmp6Z7Pu0/HvsVmzHLEI38tBbIW2VC0XE4rHZ6ihWALU=
X-Received: by 2002:aa7:d555:0:b0:464:6485:419b with SMTP id
 u21-20020aa7d555000000b004646485419bmr803045edr.382.1669019830478; Mon, 21
 Nov 2022 00:37:10 -0800 (PST)
MIME-Version: 1.0
References: <20220905145555.674800-1-etienne.carriere@linaro.org> <b7ee82ac-1e64-45d9-8b30-5b697e36ad1f@app.fastmail.com>
In-Reply-To: <b7ee82ac-1e64-45d9-8b30-5b697e36ad1f@app.fastmail.com>
From:   Etienne Carriere <etienne.carriere@linaro.org>
Date:   Mon, 21 Nov 2022 09:36:59 +0100
Message-ID: <CAN5uoS90ONkgZSsyP-dPHyO6SMCxH0yJ2vHaQ82G8jv0Og12rQ@mail.gmail.com>
Subject: Re: [PATCH v3] dt-binding: gpio: publish binding IDs under dual license
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, Stephen Warren <swarren@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Andrew and all,

On Mon, 21 Nov 2022 at 01:24, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Tue, 6 Sep 2022, at 00:25, Etienne Carriere wrote:
> > Changes gpio.h DT binding header file to be published under GPLv2 or
> > BSD-2-Clause license terms. This change allows this GPIO generic
> > bindings header file to be used in software components as bootloaders
> > and OSes that are not published under GPLv2 terms.
> >
> > All contributors to gpio.h file in copy.
> >
> > Cc: Stephen Warren <swarren@nvidia.com>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Laxman Dewangan <ldewangan@nvidia.com>
> > Cc: Andrew Jeffery <andrew@aj.id.au>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Cc: Nuno S=C3=A1 <nuno.sa@analog.com>
> > Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> >
> > Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
>
> Acked-by: Andrew Jeffery <andrew@aj.id.au>
>
> Apologies for the delay, it took me a bit to find the right people to tal=
k to.

Thanks a lot for closing looking at this change.
I think all contributors now have acked it.

Regards,
Etienne

>
> Andrew
