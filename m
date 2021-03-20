Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82E10342C50
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Mar 2021 12:38:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbhCTLiV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 20 Mar 2021 07:38:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbhCTLiQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Mar 2021 07:38:16 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65CD0C0613EE
        for <linux-gpio@vger.kernel.org>; Sat, 20 Mar 2021 04:38:16 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 184so15076907ljf.9
        for <linux-gpio@vger.kernel.org>; Sat, 20 Mar 2021 04:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kpNq+4pzC9q8PqJhkJv2XRb1wrmskPmzcnX1wwKvIT4=;
        b=usugGJstphxXID2U3mOQ0opUCwdg/eCHLAtS59XDR8tr3xP4kZJtMMR0DrqiFbW6mZ
         BbckAuDWNuz4KbRLDestCcqT8Uez7tzJLs3cwOfMLdwRXZsl7SibDBzirk2IQpxekq61
         /1QsQsXGlPQCx2dOSloA4aUDIYozO+iw6KrlI5M8yeiFs7qryv3HcqriKXyrq/4EumRg
         l/+GL0zfhGgQtURUrW75R1gFnJPspwWqYqyt9UVBfhyO4nJMyX/Sv27EqiGlzWull2St
         yuH9eYED9+/Acl2/IA4GACeD2tlkq04pmCkJl+RObkCDqUMklXKnGJGd+VyRHyzvZcko
         jpUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kpNq+4pzC9q8PqJhkJv2XRb1wrmskPmzcnX1wwKvIT4=;
        b=reC8TPTy0unFmvmyI2sA3uDb7IYWjoC63E+UIqGBwtrtbovPOwvf3Bjvh411i0C19p
         coJXtjNFhMazCcUHyYklu3ix3uxa4w6FqkOg4LMYIfDTY2fBmOfb5Asm7I/J51RctnIa
         tM0rsZs9MyDlE+/gsQeVL8l0nqc/iH+vbTN30Ss1ZInz35FthWbfHyj3RTN5jRtRTIye
         LcG6KRQAOfdOYb/8TcceyWz1vzZyibJWQvM0gNZ0ycx4wZKeONXH70kyzI2J798YGC4S
         DJOWzTzn5NwCAz5Hfm5BTiYFfQfrzOW5ROOXk4rSEzd/KKVv6i7EK/yn/FJQY16CU+Zi
         Xj5w==
X-Gm-Message-State: AOAM533jGGjmwQnF6iCLNQauxDwxFglajMeR84ZmsYsuwezBZ59seATY
        vqK2q0nnzaA9aHHO8liarSQ1YAHhAiStlqb4iw9k4Q==
X-Google-Smtp-Source: ABdhPJyph+35e/m+iaGdkuTx9JEupeD2nzqVohDvenngcwRbROO6Pk1TaZAWccwtj4OtmgFGBBO29aVwIAewWbg4Yhc=
X-Received: by 2002:a2e:700a:: with SMTP id l10mr3571819ljc.368.1616240294278;
 Sat, 20 Mar 2021 04:38:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210315114214.3096-1-noltari@gmail.com> <CACRpkdYdHgP7QNWco4aN1G-GaRjOd2Y=_fkxv4zOKsQtXtpqfg@mail.gmail.com>
 <34672AEE-B28E-4B07-BFDA-8DF2F20FD410@gmail.com>
In-Reply-To: <34672AEE-B28E-4B07-BFDA-8DF2F20FD410@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 20 Mar 2021 12:38:03 +0100
Message-ID: <CACRpkdbKtjNjC57_m9+3BTex6XmjUrsYN8NkMiCxPt37s3pv-A@mail.gmail.com>
Subject: Re: [PATCH v7 00/22] pinctrl: add BCM63XX pincontrol support
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 17, 2021 at 12:20 PM =C3=81lvaro Fern=C3=A1ndez Rojas
<noltari@gmail.com> wrote:

> I appreciate that, but I=E2=80=99m having a hard time in understanding wh=
at
> Rob wants and since there are no examples available on most of the
> stuff he=E2=80=99s requesting this is really frustrating...

I am sorry that the situation can be stressful.

This is not Rob's fault, at least it's also mine.

The real problem we have is lack of hardware people
reviewing hardware descriptions, to put it simple.
As reviewers we get a bit confused, then we try to make
a mind map of the hardware as most driver developers do,
but as we are not chip designers we will make
mistakes and get confused and there will be a bit
of back-and-forth and inconsistencies.

The bindings have very high ambitions (to describe all
hardware) but it's a bit like food: the less you know
about how it's produced, the better the taste.
In fact it is a best effort and involves a bit of guesswork
and group effort and you are part of the group effort
now :)

Yours,
Linus Walleij
