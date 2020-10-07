Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC787285BF8
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Oct 2020 11:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbgJGJm7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Oct 2020 05:42:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726218AbgJGJm6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Oct 2020 05:42:58 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70032C061755
        for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2020 02:42:58 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id a7so458554lfk.9
        for <linux-gpio@vger.kernel.org>; Wed, 07 Oct 2020 02:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vrGYakr7L9oOr7WPMW9+1Ce9GLRFUwBOVfahjcfLOwg=;
        b=sO2p50KyRxmZfIitVF/wSwrj0sL+ah6gEa/bMhBMmYY2EgwCvAXhNYeqYFsHtuqeNG
         txVhx6Iix6d8+mJzhf1H3PNKdk5DqIqbiR1uqFL7QOFQfvueeO6UH/uQj5IW4uoeP/0V
         Ik1OIuahTjMVuScNxMRV0nS7m3NKkX0CRXHzJpNbR12/S7jmHsxBfZhtEmkWsVsFie0r
         mKF46zMM3YKbIn6cvDTFwI2WhmJr5/ungGCTwoq5E1W9DvFN0UHX17Yh8LBeJsFWSDkK
         RGPLWu0AD0o8bzuyZonvnnMEMMXdccrezm1f6QDbB3E6juaFXWAUNaVJyRkwkZbBOJFy
         h3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vrGYakr7L9oOr7WPMW9+1Ce9GLRFUwBOVfahjcfLOwg=;
        b=h9BS2379YFAeBFHKl2ksqw3ryLtoOSxIlZ/2+7MD4mXUKiYu9ucsM3NxRZ2Iqi5A0Z
         ZNNFFJlqJPudcbJThptdJg/5y0uSBredQkzjIc2E/nYM7I4GMeOWjvRuWQlKUoRfjvln
         riXSHZKTDnxljMh1/vbxU1wMkJ6y8+DNZLl7DLK8HrHgDB5XEUZhQCprbu1Xv3G683Dw
         Yb6inzHogRIBV6Hcd1S6SHdZkhHe31q9/JnJuy1yBzjwzIs0yhOEOikzwkkQZ+fON8K4
         +uZVG1Sez5qiX2sWtsd3A3PWhu0XmRLEQi/C5R3HGppyL88VPTETA+obmMwg72rEm2ce
         DLGQ==
X-Gm-Message-State: AOAM533YZAa9JKwkHUlzupQfY7mAlW6Tbp+gW/mo5wGT5weqUJ6SpD0z
        1wgh6sg9XIWso2BJj16SwYCfCyCecrMYtbTYXBk++Q==
X-Google-Smtp-Source: ABdhPJzjmL9X3l4LIt9HX9Ek0e41ijnPh135/HoB98ZXjGOIF5lJ6iCk5EdKqqSLaql/IiETcd8pqlE76uskFENzfmk=
X-Received: by 2002:ac2:483b:: with SMTP id 27mr627531lft.441.1602063776906;
 Wed, 07 Oct 2020 02:42:56 -0700 (PDT)
MIME-Version: 1.0
References: <20201005131044.87276-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20201005131044.87276-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 7 Oct 2020 11:42:46 +0200
Message-ID: <CACRpkdbvxdjxfNFzvPD+h_KqH=QVt3R4xSNGpJpb2nUrBKX5Hg@mail.gmail.com>
Subject: Re: [PATCH v1] gpiolib: Disable compat ->read() code in UML case
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 5, 2020 at 3:11 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> It appears that UML (arch/um) has no compat.h header defined and hence
> can't compile a recently provided piece of code in GPIO library.
>
> Disable compat ->read() code in UML case to avoid compilation errors.
>
> While at it, use pattern which is already being used in the kernel elsewhere.
>
> Fixes: 5ad284ab3a01 ("gpiolib: Fix line event handling in syscall compatible mode")
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied for fixes.

Yours,
Linus Walleij
