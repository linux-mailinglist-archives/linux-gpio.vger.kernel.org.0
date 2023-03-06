Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07EF26AD283
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Mar 2023 00:08:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230037AbjCFXIK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Mar 2023 18:08:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229899AbjCFXIJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Mar 2023 18:08:09 -0500
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 806A32CC45
        for <linux-gpio@vger.kernel.org>; Mon,  6 Mar 2023 15:08:07 -0800 (PST)
Received: by mail-yb1-xb36.google.com with SMTP id x12so9824333ybt.7
        for <linux-gpio@vger.kernel.org>; Mon, 06 Mar 2023 15:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678144086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJWNmiAqmMOlquXl+tYVU4J1Zj2biLWfltfnZaEEZEE=;
        b=SPHrevpiyj2EYs8L5vGjWF9+U1wOVedHn/ohQPSRTRfH2ix0ldVVSmbnyOPTHKK8+D
         CrmmLmkb+n2Zc0QDeGZn32rnCczFdqNbbbfIaVPMCIU/pBd43/aZHhMQSAs1sHUr688E
         C0R/jrWgkOvpPY0m+FrzoXt/zaOpdj1eChht/LmHZkmdE51wElVFTqW7TKFqh819kHEH
         XB72kdy1VE5wBYAnrO5TTXC9WHmWlluXmDqXZI+QKj1rTS8p/ES/df4MBasOj7/lqv2S
         sB/3D3+k0i5OuFcyFfogr/AwXX1eMJ+c0guST1GFAXT/2NlN+jMfuxIxsBhusq7d7dAu
         uMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678144086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xJWNmiAqmMOlquXl+tYVU4J1Zj2biLWfltfnZaEEZEE=;
        b=Npj5H8UjsFkW/BMYDDFQAT2bAOvLIDbFGybwDTxwKt85nA0bdhk7qOhNpkXw3gnZ/G
         A5u3O2nplHcBzgM1dIduyJ0O/judeB8gfYlG+Dqfh8uiXYqTN6MKcR41YFNrFkHbRRpU
         w58IIiUNSrzXqro6CjT1bkfKQD5nuPBmU30721HZTcnS4Gj4mwm8lCRJEO1iJbYPPMZ6
         b3OYIYhcYAVzd92kE5w4oSIDz8pptiHPiolOwyLQcPc1XLhq2KBiUqaKe5wyGJO5EyLU
         i3ISGvsohkSi9kgVTWwzMFZqzyVqEkwI3kzBuvIhneCqEmuV3prfjZzZcQlG2RzWB1wh
         OV6Q==
X-Gm-Message-State: AO0yUKUk0RX/zmNNoetDlbjmOEJ7IYKfa+Hn2j2fkE3S9D3jykma8sqp
        RRZk3/Cs/NYt8d8GB95mcxaVi3xt5t5vMhGb7KLhbQ==
X-Google-Smtp-Source: AK7set/r262v9/zoBcT5r5ZLxxh2LiNIhyA7qgBq09jU2JtYL4H83jbraOkZ49WuZDPD1Lu/NfmrieyzNMUNtjnjHG0=
X-Received: by 2002:a25:8b8f:0:b0:906:307b:1449 with SMTP id
 j15-20020a258b8f000000b00906307b1449mr7385460ybl.5.1678144086697; Mon, 06 Mar
 2023 15:08:06 -0800 (PST)
MIME-Version: 1.0
References: <20230226205319.1013332-1-dario.binacchi@amarulasolutions.com> <CAMRc=MdoMPROUVeu3m9Jx+-5deRMC9jm+zbGBQ=OdHaLApmJ-g@mail.gmail.com>
In-Reply-To: <CAMRc=MdoMPROUVeu3m9Jx+-5deRMC9jm+zbGBQ=OdHaLApmJ-g@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Mar 2023 00:07:55 +0100
Message-ID: <CACRpkdYV3mHNYvBg1nf+12Q2XZH_g4iTrA2YB1SVQ=ROriRRgg@mail.gmail.com>
Subject: Re: [PATCH] gpio: mxc: use dynamic allocation of base
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc:     Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 6, 2023 at 11:03=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> On Sun, Feb 26, 2023 at 9:53=E2=80=AFPM Dario Binacchi
> <dario.binacchi@amarulasolutions.com> wrote:
> >
> > Since commit 502df79b860563d7 ("gpiolib: Warn on drivers still using st=
atic
> > gpiobase allocation"), one or more warnings are printed during boot on
> > systems where static allocation of GPIO base is used:
> >
> > [    1.611480] gpio gpiochip0: Static allocation of GPIO base is deprec=
ated, use dynamic allocation.
> > [    1.622893] gpio gpiochip1: Static allocation of GPIO base is deprec=
ated, use dynamic allocation.
> > [    1.633272] gpio gpiochip2: Static allocation of GPIO base is deprec=
ated, use dynamic allocation.
> > [    1.643388] gpio gpiochip3: Static allocation of GPIO base is deprec=
ated, use dynamic allocation.
> > [    1.653474] gpio gpiochip4: Static allocation of GPIO base is deprec=
ated, use dynamic allocation.
(...)
> Linus,
>
> I'm afraid we'll need to do something about this warning, because
> we're getting the same patch for like 4th time already...

OK what about reverting
commit 502df79b860563d79143be7a1453c2b3224cd836
"gpiolib: Warn on drivers still using static gpiobase allocation"

Until we have less drivers with static allocations?

In a way it is good that it is fixed, but it's not good if you get
snowed under by patches and discussions about this.

Yours,
Linus Walleij
