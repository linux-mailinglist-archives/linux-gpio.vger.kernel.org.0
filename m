Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93A59337050
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Mar 2021 11:43:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232227AbhCKKnN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Mar 2021 05:43:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232224AbhCKKml (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Mar 2021 05:42:41 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE623C061574;
        Thu, 11 Mar 2021 02:42:40 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id d23so6793267plq.2;
        Thu, 11 Mar 2021 02:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gIYOMYOKVo+mGI0uXGsSplZ/o4gRCgxMr3FfOW9mCVo=;
        b=tFGfT19FBFVyyK3VQA4Wq7SpOr38r2IGnV+qwMcK4MsVW4cU7+StpniuRufqxRD4lt
         FlHYF6oNxGEmCPZ33aEbzkOgGsL6UVmvvQSDNB+utQ60/RUrWSePFy5+tVzPgWrQNN8x
         euwzsttAPS6k0b7vebnjOCwpC2ffNox5S8TEyyJWpTHwQurDCZsey3QvCUD7bM70RM0B
         8xYgtwE3b7VBEpGMD/32n0gKK0dw+lSvJ0qPxlibrMnuruBg8cZXgziweSPtkefDHsC1
         gOu70GU7hzLtqtMBCk/zB6J8J1HQr82JeJelXPCc7AzNC6SwyhVRqUm9LLvKhSGNzwMB
         r8wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gIYOMYOKVo+mGI0uXGsSplZ/o4gRCgxMr3FfOW9mCVo=;
        b=ONAv1r+uNvliR66LKk/R92XReP+xicU4y0Xb8iaPcSRFK3DSqR4x76BmZcFeHiFh6j
         lRcKgZZAQ9WmIUtwuNrL2U4JfrrrUMsBMQ3c00WHUGS6VTbwAKWxIANitSZwh9N7yomV
         Qkgf45YvizVXpyjM+sIt0p7Lo8AgzMJi7+0Kw7zYHl4W6upghB40T1m1Qc6lnKRZ2u+y
         LJ2lVD2XakWHaESCx8x0z+KTsZiA/mK/Q+xOdujFZv86rfpyP6y1Yb+uaF1a8Nw3dp2q
         JaVvhP6/O6WxAX1Ah7SiyUnZTT551WqkmYXNFxNrIBNemXyvNT1vrjtnXfWsJssDrkoP
         +bGg==
X-Gm-Message-State: AOAM531sNJ8UMvIpgqX+Tz1Et9Q1SLUFzclszvxcbT88CHAbFS6P/6aj
        oI9Xp3VJaB2JCiMLcG75xO2K5PjIcv9ZRvBy+Wg=
X-Google-Smtp-Source: ABdhPJzWoP6XUS/TeIQwbRQ3c0qtQADY6wEUfpkbZ9HBzQWiD0PdI2WY+R/Tq2+whLln3VZBvC8NB6PQb3ClOlNb/X0=
X-Received: by 2002:a17:90a:b311:: with SMTP id d17mr1271593pjr.228.1615459360370;
 Thu, 11 Mar 2021 02:42:40 -0800 (PST)
MIME-Version: 1.0
References: <20210208222203.22335-1-info@metux.net> <20210208222203.22335-8-info@metux.net>
 <CACRpkdb5R+VQrv0QuKa+EYmAMkodRpyv4fV1QCWQ+vcEyd0sZQ@mail.gmail.com> <acae5f9a-1cc8-46e1-2b3b-c806679ef062@metux.net>
In-Reply-To: <acae5f9a-1cc8-46e1-2b3b-c806679ef062@metux.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 11 Mar 2021 12:42:24 +0200
Message-ID: <CAHp75VeWW__18hwK+-uEibpzLpehD4h=QCnTbKOc-2GbkMB0TA@mail.gmail.com>
Subject: Re: [RFC PATCH 07/12] gpio: amd-fch: add oftree probing support
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 11, 2021 at 12:20 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:
> On 01.03.21 15:51, Linus Walleij wrote:

> > I don't know what the idea is with this but register are not normally defined
> > in the DTS files. The registers are determined from the compatible value.
>
> The idea is basically replacing the pdata struct by oftree node.
> (subsequent patches in this queue use this by doing the board setup via
> compiled-in dtb, instead of the currently hardcoded tables).

You are a bit late. We have built-in device properties (and
corresponding API, which recently becomes swnode) which aims exactly
this.


-- 
With Best Regards,
Andy Shevchenko
