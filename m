Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22E607B79CF
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Oct 2023 10:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232824AbjJDIMg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Oct 2023 04:12:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232788AbjJDIMg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Oct 2023 04:12:36 -0400
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC064A6
        for <linux-gpio@vger.kernel.org>; Wed,  4 Oct 2023 01:12:32 -0700 (PDT)
Received: by mail-vs1-xe2c.google.com with SMTP id ada2fe7eead31-452863742f3so929101137.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Oct 2023 01:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696407152; x=1697011952; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/mSb+SIJ1kznY7Jji6Vr2AJRvHPkHGWmS9RZs4FnxRA=;
        b=QUyuH5A6/gWrhvnEBSFipLbJe9XXiZkO4a5I9t8vgRnLs4rRuKlP1JpZ4xw1ayzgiO
         +23tteumyfNCijHkbaZ5nCelHCnD0mPMkuxOyFgbyQ2Yefs0DDL3SBvmRYuGD9qjf2EM
         gxutl7ReOLEoGtqH3s2dqs3f3ksurR9DuzhPCfgjFIvoQHloEJvRsbEGBxCvjJzhG3MV
         qMpuEgIK4dH2XjVy+1zNPRHMQpdNJ7O5RgmO7fFoBDnt9sClGGuiqo6jKzwPVNybjKpi
         E0VQnWpPoB45m3KmkB0sxxnrnGCgSoDZLrTFnLGaLCSZHXHbRWFV3nZEhx7dB10FpQH1
         jMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696407152; x=1697011952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/mSb+SIJ1kznY7Jji6Vr2AJRvHPkHGWmS9RZs4FnxRA=;
        b=kBt70Qpb2I3XWfICUXaVeaAqw4Efd6qCfoFPRJOnyctnHFkKiO3LctraZi4ZKTxNNl
         +ICfeI6b0EbWlXjmvBmdvkVS9oQPhmwEnwD9X3HKNdqxG9zLsE3He+EaDWew+kkMz0FI
         KU/4SqJX3eTK6xE5l+guq9BxcWFM7E+E1kxT6KktpyllQyY+e+Dtc4RrJ2GhjX26q20q
         n/x7Y90O1Lm4hp3E2InysnDlcaWd0yIjFk6YOlmGPzDkJfX+L8cfA+CpAp5DMNOb2FBE
         U2vv7Yval5b0T/Sn3YcC+D1y53oSU15MCrue9vcfzehewMcUBjWSfBIqo3UOrkBdEzmk
         oWUg==
X-Gm-Message-State: AOJu0YwNJmzerKgzljlkVECGLtF2nn09jhtE5HSBsCzH8gellCMRJy/Y
        zNIJsplQ7GCzRCdBcuLtT+frpt9N5H+MoxlqFCmw4Q==
X-Google-Smtp-Source: AGHT+IGrYgDVrxDoJMZJVhHVecsbpjwYyRMPanYYZQkNEn6NEyoB0KCjHZhQaLxV5l8xsEO72zVxSlFYG3tXVGQD3xE=
X-Received: by 2002:a67:f9c4:0:b0:452:8ce2:5149 with SMTP id
 c4-20020a67f9c4000000b004528ce25149mr1417255vsq.12.1696407151799; Wed, 04 Oct
 2023 01:12:31 -0700 (PDT)
MIME-Version: 1.0
References: <20231003145114.21637-1-brgl@bgdev.pl> <CACRpkdY03QUkHcmyfTTfvVFbmNujW3qg5GcNJ-=8zj_zvGqDeg@mail.gmail.com>
In-Reply-To: <CACRpkdY03QUkHcmyfTTfvVFbmNujW3qg5GcNJ-=8zj_zvGqDeg@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 4 Oct 2023 10:12:20 +0200
Message-ID: <CAMRc=Md7QKYqRaytw2xG8hqTmEDmZGxFfDyGZqoE96h-CvmJcw@mail.gmail.com>
Subject: Re: [PATCH 00/36] pinctrl: don't use GPIOLIB global numberspace in helpers
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 3, 2023 at 11:51=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Tue, Oct 3, 2023 at 4:51=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > We have a set of pinctrl helpers for GPIOLIB drivers that take a number
> > from the global GPIO numberspace as argument. We are trying to get rid
> > of this global numbering. Let's rework these helpers to use the
> > recommended gpio_chip + controller-relative offset instead.
> >
> > This work is split into phases: first let's introduce the new variants
> > of the helpers. Next: let's convert all users one-by-one for easier
> > review. Finally let's remove the old helpers and rename the new variant=
s
> > to take the place of the old ones.
>
> Almost too good attention to process here, I hope you used some
> tooling and didn't do all this by hand...
>
> I reviewed it by applying the lot with b4 on a branch off
> my devel branch, and
>
> git diff devel..HEAD
>
> which shows what the goal of the patches is and since the
> kernel clearly looks better after than before the patches:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Or I can just merge this branch into my devel (for v6.7)
> branch, and offer you the same as immutable.
> Which is my plan.
>

I'll need to send a v2 because there was an issue with one of the stub
declarations and I think we should let it rest on the list for a week
but eventually I think you should just pick up the entire series and
if anything new for the GPIO tree conflicts then we can deal with
immutable tags.

What is your view on Andy's and Kent's issues with the _new() name
suffix? My argument is that it's just temporary and will be gone once
you apply the entire series. Bikeshedding about a temp name is just
unnecessary churn and _new() is as good as anything else.

Bart

> Shall I just do it?
>
> Yours,
> Linus Walleij
