Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E39D4C7FF2
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Mar 2022 02:03:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbiCABDl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Feb 2022 20:03:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231244AbiCABDj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Feb 2022 20:03:39 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE2307A99B
        for <linux-gpio@vger.kernel.org>; Mon, 28 Feb 2022 17:02:59 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id f37so24266433lfv.8
        for <linux-gpio@vger.kernel.org>; Mon, 28 Feb 2022 17:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q8NmAcmdqU26V8OH3cYuAlO8sk2yRxtmZWE3w58gSKE=;
        b=MKcB+oboBz5eIjBKGm5s3zVzKk8DOQZGjA7/z4rwsM0NpL91uMsgCG04CXKj6F1XIv
         14Hlb2vQWsXVHInjCCAvtjKzoYQPTTDOCMCVO5I6hBp6i/LKTHKe2j5+XGPPwZKc5qUW
         ezNp7Y8TrpCDsaoFABroafoi19z3NHRD2LkRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q8NmAcmdqU26V8OH3cYuAlO8sk2yRxtmZWE3w58gSKE=;
        b=vy8naBE00eoQJidhHHHvWlK3o+daM8HekHErcKFJh/y6himRidoGXZlfQt1+2tIvKN
         nHpgpzheD/Lmvso110FSYuBThui0T60jkeNTwD0CcxG2ASTkWfm3+3ZBgNcVFdBYBeEU
         LdV9RhoDCfCeZ1SpBWYEO8zK+uBi73Cf56oJawuzQs7C0uyYhqq0KLnsMpz6V7t+Iai8
         cdDRq7pxkJWa1LEH1OniOV4oMzjbkHzJK9ubQNzWXwjmlcwEvnAaLdoseimMMpC8Sv6X
         mNDduWwq68q24b7yhs9Tm+cK/PzAUPwiC2dxxpRa0oTn7SfbDpXVpefoBlNZicTPUGiq
         O6Vg==
X-Gm-Message-State: AOAM531OBoYkUxBQYX4Ynwp57I4CZqpQqvwwaDyiuYhp1EeLHfRYuEXx
        FmzWN9HgAyCjD1Rp6r/mk0q1T0Rl3tkk3jAHDdg=
X-Google-Smtp-Source: ABdhPJySoDoQMfh8y7k/zDpBR5skDkH3L+UzaOrl8DePfr5NkJFFGjjqtYB3JYGmJ2soHSXixfEXkQ==
X-Received: by 2002:a05:6512:44b:b0:443:7f20:3baa with SMTP id y11-20020a056512044b00b004437f203baamr14284090lfk.248.1646096578100;
        Mon, 28 Feb 2022 17:02:58 -0800 (PST)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id a21-20020a19f815000000b00444191b6c07sm1221918lff.80.2022.02.28.17.02.57
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Feb 2022 17:02:57 -0800 (PST)
Received: by mail-lj1-f177.google.com with SMTP id 29so19749430ljv.10
        for <linux-gpio@vger.kernel.org>; Mon, 28 Feb 2022 17:02:57 -0800 (PST)
X-Received: by 2002:a2e:924d:0:b0:246:370c:5618 with SMTP id
 v13-20020a2e924d000000b00246370c5618mr15672702ljg.358.1646096577046; Mon, 28
 Feb 2022 17:02:57 -0800 (PST)
MIME-Version: 1.0
References: <CACRpkdYM21hcH5d9rXyvjMPHQp429OZ1Zcy7uLU2tndoJcOmUQ@mail.gmail.com>
 <CAHk-=whg3eRY1nOJjHam+jORmVymU539CxhBUjp4=tGoFitotw@mail.gmail.com>
 <CACRpkdbWkm1WDY30qoGLEQba+G2cDEhT+M8nCdJbcD=ZQiu6uw@mail.gmail.com>
 <CAHk-=wjNdW6Tdei6+6OJy6jGqY=PCJ2TWFKpV+g0projUC1eag@mail.gmail.com> <CACRpkdY-8D8ZYy9VichQmJHTJCSskFs=e0qpbYssf7tED_9dLw@mail.gmail.com>
In-Reply-To: <CACRpkdY-8D8ZYy9VichQmJHTJCSskFs=e0qpbYssf7tED_9dLw@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 28 Feb 2022 17:02:40 -0800
X-Gmail-Original-Message-ID: <CAHk-=whcOPRHS-mWaCk3_anVPZheCbkE4E0dLWRD9YbiaTLAqA@mail.gmail.com>
Message-ID: <CAHk-=whcOPRHS-mWaCk3_anVPZheCbkE4E0dLWRD9YbiaTLAqA@mail.gmail.com>
Subject: Re: [GIT PULL] pin control fixes for the v5.17 series
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 28, 2022 at 2:50 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> I'll take these two:
>
> pinctrl-sunxi: sunxi_pinctrl_gpio_direction_in/output: use correct offset
> pinctrl: sunxi: Use unique lockdep classes for IRQs
>
> and put them into fixes, that should nail it.

Thanks. One down, two more of Guenter's reports to go. But iirc they
both at least had fixes pending too.

Let's hope they aren't in the wrong queue as well ;)

                Linus
