Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 373787B7C58
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Oct 2023 11:38:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242053AbjJDJiC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Oct 2023 05:38:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242028AbjJDJiC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Oct 2023 05:38:02 -0400
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com [IPv6:2607:f8b0:4864:20::a2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C031B4
        for <linux-gpio@vger.kernel.org>; Wed,  4 Oct 2023 02:37:58 -0700 (PDT)
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-49d6bd3610cso807131e0c.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Oct 2023 02:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696412277; x=1697017077; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bT1NL+RH1NnZjMvV14RFbCtpPeCz5w6b4T3cUHv+RuY=;
        b=fJj3uNpHG4fVItPtsbqAi3QOZc4YoZ8CMagIef6NAaa7to/MqWLuhMdJiqe6Nrcifk
         tJS890XUmRjX04/qd+EgCj43A+P3JrlrUPgFeJk9yy9PDvW9Yg6/gVce2JzZUV3Pr9Ja
         KzTZ9Zmsh0bldFmAT2FfrzvntjvzDq5+/0OKYhyUS0qKnOWhvl96FT8U2EPK4mY8rxGo
         ZVZq9o276vNbt3+gyL+oLmxlRBUL3+Xvx5kuO9wFL1pUd+uYqUa/znZvo4Akr9f8htSV
         RyP5Y0r4K10PuGd7vbC3Ma4WwqYvn59t/fjjOAVIyY72oqS+SkCiU/mfKV5X89DaOpIM
         M9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696412277; x=1697017077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bT1NL+RH1NnZjMvV14RFbCtpPeCz5w6b4T3cUHv+RuY=;
        b=UUGxWm2e4SOjE+uPs35hMwd0Sf+CfaHxoaTpP2b77WdaUqyoVb7LHmv+mCDKlW/skU
         5yOkt1Vz/Xw6ppSaIo35++s5Dp64Kb/ni+ilaODMVvKZSAeHa0f5yHwsiJQ3llaGVBwp
         aFheYNPyG1uVpYjS1MnF43wQWctVzZ0L8PkiUBOtkMvv7IVucNiY2NgjhRBregAAQ4yO
         HbYesAlFidomO6OX1JM2LpJNVpdu96mEIbEhkqcmsBGxZTcCfawVgjATHop3cBAHDaR7
         XlOej91d5b9AKWJe28DhbWsCoOPcTlGlnyfN9NkEP6Ew1NrHbo78mWCIlmlEigMZF/OQ
         xpeQ==
X-Gm-Message-State: AOJu0Yw6FNzFk5qtCpo3bQ02Sc25NXRTG/NUNh5A48P4nPtdNBR6UQdj
        9zaudnWY6/C4C1YCyHRgKhuhAJpG8QAxNgd303df4dtW7EHKwX05
X-Google-Smtp-Source: AGHT+IGSX2cfUGe6+7oiiOcP8dW+JKcprSYzpzwEYdC1+GqkdriUQXiTTmtAE3fRWUqC8ejRF2mJFHYJHgdMLdoB2AI=
X-Received: by 2002:a1f:4f86:0:b0:49a:9146:ec02 with SMTP id
 d128-20020a1f4f86000000b0049a9146ec02mr1513489vkb.1.1696412277258; Wed, 04
 Oct 2023 02:37:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230912-omap-mpuio-base-v1-1-290d9bd24b23@linaro.org> <20230926070953.GV5285@atomide.com>
In-Reply-To: <20230926070953.GV5285@atomide.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 4 Oct 2023 11:37:46 +0200
Message-ID: <CAMRc=MfPmtFoKAs9p1bcwNyWquXWrQZeUJ8TQ4UQ7CmYpRjiaQ@mail.gmail.com>
Subject: Re: [PATCH] OMAP/gpio: drop MPUIO static base
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 26, 2023 at 9:09=E2=80=AFAM Tony Lindgren <tony@atomide.com> wr=
ote:
>
> * Linus Walleij <linus.walleij@linaro.org> [230912 08:45]:
> > The OMAP GPIO driver hardcodes the MPIO chip base, but there
> > is no point: we have already moved all consumers over to using
> > descriptor look-ups.
> >
> > Drop the MPUIO GPIO base and use dynamic assignment.
> >
> > Root out the unused instances of the OMAP_MPUIO() macro and
> > delete the unused OMAP_GPIO_IS_MPUIO() macro.
> >
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> > Maybe Bartosz can merge this into the GPIO tree with Tony's
> > et al blessing?
>
> Best to wait for Tested-by from Aaro on this one.
>
> As far as I'm concerned, good to see this:
>
> Reviewed-by: Tony Lindgren <tony@atomide.com>

Patch applied, thanks!

Bart
