Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7ADE48FA00
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Jan 2022 01:38:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233980AbiAPAio (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 15 Jan 2022 19:38:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232733AbiAPAio (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 15 Jan 2022 19:38:44 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 072C8C061574
        for <linux-gpio@vger.kernel.org>; Sat, 15 Jan 2022 16:38:43 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id w188so18018581oib.7
        for <linux-gpio@vger.kernel.org>; Sat, 15 Jan 2022 16:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Xq1STW/9GWXWNpMTgrEANORa+fFhQI5P1Xh1Ux8Ap7E=;
        b=S/WGipPOi+aDaNKPU2W8GTv/m3kK9LmuVfzsLaYXeLm0+2aUx9j3qiGyVfnNb86HO3
         uAu0/PqIedCkjPsAzuAB0DDPRocf48Qd+VQTKcHpEiopVFbzn/oep4vkXBhjpTncDTJ1
         NoySbok2W+5d3+E+3fxBMoYkxu7mXLgkEyyNTRZpCeXhvk89K9Ztsg4k0GUyM2r//Kzo
         LuvjlYorZ///4oXPV2ZQZLIt/pHCuKmkW/+jrE/j6V3Y7GOCDJc83dJDAepj1kqKVPjg
         psuJTy94gVNyOqb6HeCRzEgRpuRhokAs4WxDs1kuWyH7Ck0J1fQck9SoDFxoW9K/4VPB
         +xJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Xq1STW/9GWXWNpMTgrEANORa+fFhQI5P1Xh1Ux8Ap7E=;
        b=HGWNwHNalxcr0zAKD76JV/Td8spzUaw0a7PnU8zZLhChM4YpeNWSGSXYKkFah9OPqB
         bQkmrJQw2fHG6HGNozSVNpbWwTbYebS1PMxBugxMTjgxpCK/J3RE+KRdiDT5VjvhhNkl
         P2wJeg4uSz7LD1Jim3ywiY9YHNnb3lCt1Gl8YVi28L4SkuoibFcqaaxtyt6zJ2RXcZ/Q
         fsBuVJcxydOXcSgq7oXlWzopcT1cH78xW5Y1Uh7JH2VmNIUbrsJp+OQX+KY3m6MoC5Q+
         AwfTKIYDVkByaGWz+7JA48dmQwZ0ZdRGuUDRp437iD1IO7gcYioKiEt5qnfgrkl/7hk8
         R7ow==
X-Gm-Message-State: AOAM532Hv1a2YCGnCbeBl1A50tjJq6F1Zfxc51QSDxGrmN0iCsc0YqOt
        xqnpl2vRWrEOeGyGXYlfkpx+5m8vU4xDJY4mYHJDzQ==
X-Google-Smtp-Source: ABdhPJz42hl7ypfOI7dDD092Ja9BAFGUUKC1+kMjBppzuKHX4HH94KrnMiQemb4kuGpj7lBiKnd/mFuhjgCZnQx/J0w=
X-Received: by 2002:a05:6808:2097:: with SMTP id s23mr8315616oiw.132.1642293523401;
 Sat, 15 Jan 2022 16:38:43 -0800 (PST)
MIME-Version: 1.0
References: <20220109173000.1242703-1-j.neuschaefer@gmx.net>
In-Reply-To: <20220109173000.1242703-1-j.neuschaefer@gmx.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 16 Jan 2022 01:38:32 +0100
Message-ID: <CACRpkdY+Jdn_Yr4BpuXssTn=6wjDPm9mMgz3yrjVGw8=UzKbzQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] Nuvoton WPCM450 pinctrl and GPIO driver
To:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, openbmc@lists.ozlabs.org,
        Tomer Maimon <tmaimon77@gmail.com>,
        Joel Stanley <joel@jms.id.au>, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jan 9, 2022 at 6:34 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:

> This is version 4 of the WPCM450 pinctrl/GPIO driver patchset,
> with some small, (hopefully) final improvements and cleanups
> (see patches 4 and 5).

It looks good to me, but I'd like some confirmation that Andy
is happy with it.

> I'm targetting 5.18, it's now too close to the 5.17 merge window anyway.

Could you rebase it on v5.17-rc and resend it once that comes out?
It would help me a lot to have a known good baseline.

Thanks!
Linus Walleij
