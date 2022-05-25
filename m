Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCE4A5336A4
	for <lists+linux-gpio@lfdr.de>; Wed, 25 May 2022 08:06:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231764AbiEYGGK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 May 2022 02:06:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242413AbiEYGGK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 May 2022 02:06:10 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA7542DE6
        for <linux-gpio@vger.kernel.org>; Tue, 24 May 2022 23:06:08 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id j10so10857332lfe.12
        for <linux-gpio@vger.kernel.org>; Tue, 24 May 2022 23:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s8dbXTgieoRzOZDO+kJL70xnS8IdT/yv0bOjo90ikJM=;
        b=rHwbvdxqjkZCMYBjfJmE8ybI4IjIs//RAi5/+ffGE+kuBXG9e0w7w8BWOaO+vYmQ17
         SK4FKl8PTYsf4sT/luSl5S7oEcPjZjS16rudp3wPrWYwCskg6tMdIVbuMTgbG9s5jTKH
         D9qkdxL+/mubXQai47tgWsJYv+ooHpw0VKj1pRT/xRHBHQSYsPo8AZeF/D03rL67GgFJ
         D5hJdJuAMgDxXsdP5kf1Pwwgm51+cMK2vWSKFmRc6Kic7FB6hVVlan6btYa9PZWYIx7V
         cZcg8mbx9spG8PTjw9NU9Mk3I/XaYH7JoyqXBLlPTB1ahtNOR7xDk3Zo+zXZdImrReqr
         1eKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s8dbXTgieoRzOZDO+kJL70xnS8IdT/yv0bOjo90ikJM=;
        b=GKeGXAiFSgTxQuI0Zycs3xWlyVROnDhlPczSSVHLF7M9CD9/3X+eE+7UXmzp0RXrpA
         ldvRhS30Cp+umqC0eOvqa5oXfGIpEVv+NLXwLMc/UzTUbyCKtR4u0PvNjedpxoomO+/k
         ePu4mOeIuVsPi6NBBSY0eHsENeCSXBcBACTtk75Fg4XdnAElEbhI/L9ijHJzlnXP/Nxr
         lSD+E+4lpWiSr42Lf4T2d97xTfczk53K8u80rSzeHHEKsCbstZifIUDgC5LAjPMS6fDR
         aeeAlKLUnBLLZF4BtIOFRB4sjzpRZa68X0P0N5EF+CLE+ZyBNTvOVgXotPimHoY/L8bQ
         cCBQ==
X-Gm-Message-State: AOAM5315e2rnsu3sS1A+ZVlRdRRABcj4nzMqayzOM4R7y1daXfkz26cQ
        gPGG5pSnt2sTootqnwdLUoFewCYQ69INbgS+YP+hag==
X-Google-Smtp-Source: ABdhPJy3/3+G6gA1ap7knUbDT/XfZVQOf1iuHzChHAuk/PtwbeKGxdarxOP0gZi6BQ2NoZs4JoyHAwsINPIZ0J5dP7o=
X-Received: by 2002:a05:6512:104c:b0:478:6b83:f75a with SMTP id
 c12-20020a056512104c00b004786b83f75amr11312112lfb.563.1653458766992; Tue, 24
 May 2022 23:06:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220524074007.2792445-1-Basavaraj.Natikar@amd.com>
 <20220524074007.2792445-2-Basavaraj.Natikar@amd.com> <CAHp75VfQgzMF7gZ+_NHpE5jb3EF8mOEjCr6DrghN2xyrTwKK7w@mail.gmail.com>
In-Reply-To: <CAHp75VfQgzMF7gZ+_NHpE5jb3EF8mOEjCr6DrghN2xyrTwKK7w@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 25 May 2022 08:05:54 +0200
Message-ID: <CACRpkdYQ1++WQEFa7tUAX3_B=-fb43UEU6AXyYgHZJhH73DQWw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] pinctrl: amd: Define and use PINCTRL_GRP
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 24, 2022 at 4:39 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Tue, May 24, 2022 at 10:13 AM Basavaraj Natikar
> <Basavaraj.Natikar@amd.com> wrote:
> >
> > AMD pingroup can be extended to support multi-function pins.
> > Hence define and use PINCTRL_GRP to manage and represent
> > larger number of pingroups inline.
>
> This is good idea, but please make it available for all pin control
> drivers, since the data structure like
>
>   pingroup {
>     *name;
>     *pins;
>     npins;
>   }
>
> is used in many drivers.
>
> That said, I think the AMD_ prefix will be misleading in this case.

Aha you mean like a utility macro? That's useful, don't know where to put it
though, include/linux/pinctrl/pinmux.h?

Yours,
Linus Walleij
