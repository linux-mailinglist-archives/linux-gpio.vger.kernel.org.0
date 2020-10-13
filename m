Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C39FF28C8FB
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Oct 2020 09:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389450AbgJMHI5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Oct 2020 03:08:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730003AbgJMHI5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Oct 2020 03:08:57 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4194C0613D0
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2020 00:08:55 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id r4so13457321ioh.0
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2020 00:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zBzBGMm2WZCq4BIF81gt7ByYqWbU6zSuzpQltCXzCdU=;
        b=YMOzUs7HPk7wcOuYqWJbTLoSiZhbxru2Mw0vkzn5zdTc4tC0iIIlw0RKyrbY3hcAgD
         OKZwzJ3dJcrhQQRkDigkcHOcizwMemsCjTJCd9cIv0Ak6IYe0gKL48GfCbhYsc9tzIkQ
         7jP3+8ogq4T4pmYtJPDyVwGXNJZ/Ci0m6aB/BW9dqaRkH0rNhxvvbXKs5rN0wAJ/BSTH
         RGLC0QXTKQacH/yMTqLORLmddvZovUkcy47NCll3qrXfChdaj/ze1Ron1NpNUjTndVJy
         32Y9Jagq/Sq2oiV0CX6Deel9luYuYHhKxvEVM1D8fLa29bysgoliiAtyCnrjz6GhQWHS
         jchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zBzBGMm2WZCq4BIF81gt7ByYqWbU6zSuzpQltCXzCdU=;
        b=HFsTZuxNE5ZCQdVPEfK52Abj+L41Q18oszEje2oCqy9W9Cl/8Iph/7vDRxzEXkWPlz
         P3XyeB6IdViX3vjtvn8OzeYXzHsIK4eKQUJUgZOammd3FSlecfHusJr/qoRawqsXU3m8
         JoCOGoQxQhLweYk+uzXcsLrizYCqhHbsex2sFGf+m+RkeZ75xjG005XRYrSMRPWTdN+S
         qpgLn6CJ6gpUqlgPk5lospDUvqe1OGTZE249J4W0MuMU4ubHR6QFXMHisSXIFr0aEkIY
         8gN7Frt9S7I5gMjzN2w7IhCn3d9v7YacO/5NcxHqz0fYFeBEhs2yyrGCAcst1zyGLYva
         mz4w==
X-Gm-Message-State: AOAM530LCNJlep503pHczXSiizXJAKqWgXNugNS/sIA7FcX3kSBZsRVN
        GVmiZektnXLfPbyQkNnv2vuLv3vDEQ2LtN4ktQK1tQ==
X-Google-Smtp-Source: ABdhPJzf6ZBpzoKoD4SI1nHPPWuYdt3I+D+N5pfrHqlyysQyeVps94AUBy5ozoy+slqePPLoJRVVpK9O3z4bfCMH2vk=
X-Received: by 2002:a02:c80a:: with SMTP id p10mr13829446jao.114.1602572934763;
 Tue, 13 Oct 2020 00:08:54 -0700 (PDT)
MIME-Version: 1.0
References: <20201002063148.32667-1-warthog618@gmail.com>
In-Reply-To: <20201002063148.32667-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 13 Oct 2020 09:08:44 +0200
Message-ID: <CAMRc=Md51g2-3PvQV_BA-qFJ=iDHqQELyMLx18yLR2LDQOCNHw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] core: Basic port to uAPI v2
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 2, 2020 at 8:32 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> Port existing implementation from GPIO uAPI v1 to v2.
> The libgpiod external interface remains unchanged, only the internal
> implementation switches from uAPI v1 to v2.
>
> This is a minimal port - uAPI v2 features are only used where it
> simplifies the implementation, specifically multiple events on a bulk can
> now be handled directly by the kernel in a single v2 line request rather
> than being emulated by multiple v1 event requests.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---

Hi Kent!

I just noticed that this broke the tests in Python and C++ bindings.
Something to do with the RISING and FALLING edge values and how
they're translated in the bindings, it seems. Let me know if you'd
have time to take a look at it and see if it's something obvious.
Otherwise I'll investigate that tomorrow.

Bartosz
