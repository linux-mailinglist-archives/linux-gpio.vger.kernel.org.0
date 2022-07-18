Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6EC4578444
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jul 2022 15:49:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234893AbiGRNt6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jul 2022 09:49:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234228AbiGRNt5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jul 2022 09:49:57 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C13A710E3
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 06:49:55 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id t3so15413475edd.0
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 06:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mwJEIiWxIdKoQNjurmQkm0yRpas5vKctk+tgDdWZHg4=;
        b=Gjxbqc37suGvvKcHdZyHQkOP8g119z1gSFJflPbtTCFzR9iE6HFFGWRrpz6K27LwnT
         apnZ9Rk4pX8i6+leqCU2usrcIA480qpyz4E/eIIqmQ+EYlcVTcMHTft5LvFUFBYlAcf5
         +gCKzS9ROx1o7gcEKo9o784V2Lat5+3G5LbO63+arMwpTeg5wzdhdUEfSZcQXKLzFNaB
         Qv1/Eo0Jjxvc4Mv+gcSd7q4Wb4hYCg5uF0qbiHQPaAnhJQu83DrF60tUKYwa5xhcsp/g
         Y8WDu1/xOAXYLS2zIhZnizRodimK+894CAk8G80UElcJjv74ijWK1249znI8Ic+S+RsI
         +v/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mwJEIiWxIdKoQNjurmQkm0yRpas5vKctk+tgDdWZHg4=;
        b=3WSq5MHA2E6BwAFbP4bg+DxcoCxi5uIw4EyWky3rjg69YZOFGPqWfCgU6rF79XQ0eQ
         mq+2kEzW82AtvEEHu4r5adaYF+Z6ez5GHnXtL2t4IGAWUtGY4Mn3TpPNSDQml7izoe4q
         WhpRsJM96s+mWSyd+yY6h1Z9EDRJa564dH6RIN2mwjucqD+DZxVcXNCr9OBqcXNmm3tI
         rR1MeueWiJZTrnNuC9iapiNR99oodrlfhvpQTnmlJxwDV6Cf6ucEhXdxvY8e2Xqa6MF/
         WBwYKzO3FKW1qJ1W2YrrQ1HVBBmVlQcVvBWk16fXLjuuNcZ5LmnBgYiVgB6nVVGiVWqu
         55Eg==
X-Gm-Message-State: AJIora/gAOx7hriX3FdtXdE29hbgL7+yG4LufuI730fkZOzo8D28tvx0
        ArGLxZO0IOsxYFh6OhPw8NM9oyib26tXz7OPyheHtA==
X-Google-Smtp-Source: AGRyM1tVEZUfZAQ2xPekThxcM44EpBdVLVw3tbPugsbSOypyq4ohvMeUJcCd/qgm2IpP7UrCYRhZL698NHXOpUgyCgs=
X-Received: by 2002:a05:6402:26c3:b0:43a:a846:b2c1 with SMTP id
 x3-20020a05640226c300b0043aa846b2c1mr37575469edd.133.1658152194230; Mon, 18
 Jul 2022 06:49:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220713131421.1527179-1-nuno.sa@analog.com> <20220713131421.1527179-4-nuno.sa@analog.com>
 <CACRpkdbitDErSCMbKFe0yZB63+uTGwt5ROMbEV_iAPck_RN7sg@mail.gmail.com> <8461b72ae951e4311952052c467fb1275ff9e58a.camel@gmail.com>
In-Reply-To: <8461b72ae951e4311952052c467fb1275ff9e58a.camel@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 Jul 2022 15:49:42 +0200
Message-ID: <CACRpkdZDkgM-qVNfQOqdHewqM8aP-dj9hwYaBJu+q0K4Gh2Yug@mail.gmail.com>
Subject: Re: [PATCH 3/4] gpiolib: acpi: support bias pull disable
To:     =?UTF-8?B?TnVubyBTw6E=?= <noname.nuno@gmail.com>
Cc:     =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
        linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Frank Rowand <frowand.list@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>
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

On Mon, Jul 18, 2022 at 12:48 PM Nuno S=C3=A1 <noname.nuno@gmail.com> wrote=
:
> On Mon, 2022-07-18 at 12:32 +0200, Linus Walleij wrote:
> > On Wed, Jul 13, 2022 at 3:13 PM Nuno S=C3=A1 <nuno.sa@analog.com> wrote=
:
> >
> > > On top of looking at PULL_UP and PULL_DOWN flags, also look at
> > > PULL_DISABLE and set the appropriate GPIO flag. The GPIO core will
> > > then
> > > pass down this to controllers that support it.
> > >
> > > Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
> >
> > Do we have a semantic check that PULLDOWN and PULLUP
> > is not used in combination with NOPULL here?
> >
> > (We should also be checking that PULLDOWN and PULLUP
> > are not used simultaneously but that is an unrelated thing.)
>
> I did extended this check:
>
> https://elixir.bootlin.com/linux/v5.19-rc7/source/drivers/gpio/gpiolib.c#=
L3948
>
> on patch 1 to make sure that PULLDOWN and PULLUP are not used with
> NOPULL. Is this what you have in mind or is it something else?

Excellent, thanks! That is exactly what we need, sorry for not being
able to keep all floating patches in my head :D

Yours,
Linus Walleij
