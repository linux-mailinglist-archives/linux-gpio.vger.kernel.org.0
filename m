Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EB8B285BF5
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Oct 2020 11:39:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727147AbgJGJjr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Oct 2020 05:39:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726218AbgJGJjr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Oct 2020 05:39:47 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB994C061755
        for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2020 02:39:45 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id f21so1287651ljh.7
        for <linux-gpio@vger.kernel.org>; Wed, 07 Oct 2020 02:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4IgT5KtGu5dip50wkhPI6u3Yi97OLnIXQ1ISUG7M+wc=;
        b=NhPmxdo/3Oyye5vIcthjlPxCRJv2w8dX5uUoSIzBFmVRcjNReWxAYDLzF6v2uAwJvJ
         CsNnO928yknyCwRu95tpeNHIXmH6l5WEqpxBaNGelK8oYsWCi+1p8ehN9qSCWG1KVJxx
         w0leUzlfiiE4qgS7ctDnOL03A3zKOmeCfM0X7IcGfywaKsLklczjYoDz+RI6MHqiCwjG
         Y6YFpq0q9WMlyezKBnEFY1FcmGFfjospdZwQnKb+9EUXBmsWuaIkEX+PRYk4iVqmlxE3
         F7ymYsr5xyYglqdLLvO239NESdeAIyCSS1jBRl+X6dDir/5UOqCZVLV30Wed7oG/SQwU
         YqWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4IgT5KtGu5dip50wkhPI6u3Yi97OLnIXQ1ISUG7M+wc=;
        b=s5CkI2tguTr3DpWN+heaqhyW4V208LKoSpUMnjpxSg2fCZfkX9a9dPWRW/DweMWKoT
         2f74YNlGUXoxUnQgRElmlJUmaCLk5fYaR66hg5ZUCtdok8JxPjpON80/D5OYM+rvFFuu
         ISiBXrPSbEPycR8Rz2BBEnoGE2GQ0aBrgY3zM8XP2+XOkNlK+J62zxGoRK7d4XBq3bsU
         uMtn0GEjKRmrokj1MekHcEucvpgUgM6kblbpsNDy/Co848t4Vd6Th0FXmcphemAVklhi
         JmXzcPiMK2ygPzTiueNplh8Bzy7QggJeRkapSoDNKfHSlQgIU+7IWQDA6XfXORoRPQSG
         ob4g==
X-Gm-Message-State: AOAM531oDU7HGggSSWJFOONY2Sm2LVvKF1CN1v2kfWH9EtRh7jnt/pH4
        SaoNeLTdjXOqctszIkbCBp/Pa99I014F2SGuIVj5DA==
X-Google-Smtp-Source: ABdhPJya641dhYKw144lSEaPhfxgpquEEVobwkOb93GmXgJBOK9vRJsfy5R4tVndJrSAtU63Mh/K+tYArwZmzP8ZJVU=
X-Received: by 2002:a2e:a177:: with SMTP id u23mr836748ljl.104.1602063584162;
 Wed, 07 Oct 2020 02:39:44 -0700 (PDT)
MIME-Version: 1.0
References: <20201005095622.73616-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20201005095622.73616-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 7 Oct 2020 11:39:33 +0200
Message-ID: <CACRpkdbtZVRk6TeHLgtPvix2AmrR+auwfqs8gFyW5P3eLGCy0w@mail.gmail.com>
Subject: Re: [PATCH v1] gpiolib: Update header block in gpiolib-cdev.h
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 5, 2020 at 11:56 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The dev_t is defined in types.h while struct gpio_device forward declaration
> is missed. Take into account above and update header block in gpiolib-cdev.h.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied with some fuzzing, thanks Andy!

Yours,
Linus Walleij
