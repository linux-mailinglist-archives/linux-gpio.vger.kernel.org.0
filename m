Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 608473066E0
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 22:58:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234162AbhA0Vzq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jan 2021 16:55:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234402AbhA0Vzo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jan 2021 16:55:44 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D1E6C0613D6
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jan 2021 13:55:04 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id t8so3898666ljk.10
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jan 2021 13:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XXrtCyCjYsLyQB5J5HVNKZC2dJFTtjHISSLSn1Pu5nw=;
        b=nEiBaXMx+39kTkBJIH2ehcKIGphFLcY49T+9/BZ1X2sFWUpKoligjubX0wwHVO4LLi
         7NOGEmOdLwxER5zkv29LIUb0/1hsrNmS6g1KM7yMlxW+qeZIHCIFaX4xW8xKCoMfYQha
         FBY8teYnKkZECrKVYbrPSb+hm7+urPwRc4SbRei9JqET8A+Mit0hdNV4RiRdDh5ba4rr
         cwStutQD/2+eaC6ZeyHWzgiD9hr2GazsvhykPy4jjhyFhvjbO5w1IaK4DSu+aCuXfukf
         hz2bknfL1f2kdwe28WJJQuz5Yr4sFSodVdyO9E0yLyoWOIN8GTZuBwmWKdr3JDwczGf6
         r1ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XXrtCyCjYsLyQB5J5HVNKZC2dJFTtjHISSLSn1Pu5nw=;
        b=qQB3RcutdTTI6cc0Cq2Gr6loKyuzfPnskLZ+jNVZnI8agqMMh6H8KOWlER7T6hnB+a
         8pPCHSGcyv1R4/TSkf7PBkzzBuoN/rh4QvMXC5NOLbZ73AR3XhSam4HHJ0G6SM8BqK/x
         LDERy+8mlGOFCtxtiDWD2EmuYjOD/sUS+gzcxLRdWfT9b5XwO+hxrIHJlYzEegUcY5mX
         d6PjGfPTEAAj8efZib+pzjaH3GfmWml60FTQcECrzbsZpFKtqjbXZI9ygQbXaBGMhiSJ
         NyhIH2J8NrfpwIIX4PjCa47n8xxLgefkdPdB0S3z5vpcYJsKRMR1X1S8ygyejLvsjC5E
         43Aw==
X-Gm-Message-State: AOAM530u1Ej4MyIDhigsXZZykMze7y7FEyaheKikjaKs5himsT1CZTS6
        9O4VrnpykAjqb91cXrLnMQEaG6wzW0WPhSpmoc/T0w==
X-Google-Smtp-Source: ABdhPJxLT9lSak4xY2i/k7POK3Rl/Ji4L2FrI7CKy6oLRSaOHVNrh5TdryYiwuVa0F2etxzBLk/6pAfaJWIG2WjmegA=
X-Received: by 2002:a2e:8ec3:: with SMTP id e3mr6405043ljl.467.1611784502902;
 Wed, 27 Jan 2021 13:55:02 -0800 (PST)
MIME-Version: 1.0
References: <20201228150052.2633-1-nikita.shubin@maquefel.me> <20210127104617.1173-1-nikita.shubin@maquefel.me>
In-Reply-To: <20210127104617.1173-1-nikita.shubin@maquefel.me>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 27 Jan 2021 22:54:52 +0100
Message-ID: <CACRpkdYPYua-NuxVC7aBxJtLYFEECL-60jr4pYgK4=fd5Mb-6g@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] gpio: ep93xx: fixes series patch
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 27, 2021 at 11:46 AM Nikita Shubin
<nikita.shubin@maquefel.me> wrote:

> Series of patches to fix ep93xx gpio driver to make IRQ's working.
>
> The following are fix patches (these are enough to get gpio-ep93xx
> working with modern kernel):

I see that there is a strange level of attention to patches to this
platform!

Since you fix all my mistakes made in converting this driver
in the past I will just say:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

For all of them.

There are some nitpicks from the reviewers to fix up but
overall this looks very very good.

Yours,
Linus Walleij
