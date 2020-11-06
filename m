Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83CB22A9741
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Nov 2020 14:53:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727342AbgKFNxZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Nov 2020 08:53:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727214AbgKFNxZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Nov 2020 08:53:25 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE76CC0613CF
        for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2020 05:53:24 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id u18so2010912lfd.9
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2020 05:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kgd58OKz3xKCiH4sNOWCiCla4i0MOJ0fyUJOBA6OIeA=;
        b=K63Hk9E9xzDXcGBUjEERLcpVxb5kkHWbmfqcnj+QpruvKE08dY5Dm7sBZ1d++psZjo
         XnAKo9yTUy/qEfRXAixwksvO7i4YVsgHkC4bymKeftnhyxOEIKv03AwMd26RzlcSwQ4a
         8zgtRhr70xQml3qG06HN7FE42mFh7yz+9Z7CmLV7xP1ofrpD/2+Z6JWfM+aMKuYf27cd
         X1++uGr7c9OiJCFMEdPbeN+W+7PYWOQUF1TCq8ZEVb+zV1oej4Keqy9x3l9XsezLr1Y4
         v+VEd94LEnDkGLtw3okvlR0E+AcENzeSrohUuULhn1zB7S9J4yPDxrWSvfVu9Yu/4X4r
         Dy2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kgd58OKz3xKCiH4sNOWCiCla4i0MOJ0fyUJOBA6OIeA=;
        b=WiZeTeOMcUFDJXDkCGFVx9v/sk8Zcp+4PE9lp2VAtarwjYC4uPvcKxVHygU5ZN3Rih
         gdzzxEB2GGjovGgRgo5NtxJMMZc12eqxs25OC5718iq5otxq7D+fnkz7HfwHLdhsV+Hb
         +vM4HJ70qRKY5HmW3LeoDCEVTcN7FhfAUkdGDS2gM63zfmffx/8tSzploV6YM6XWllSe
         tFIRDcAPXIeZtU0ZdUQ6DsQ0ZnTrzG9BBzEZ11vkFsQx4qDhcgX990859WDLuXCFRGxV
         XX1n4P0mSA7WwxWDws7yOd2seOdWxqzLc9DSoX4O2Run/g1vTOn7p8utMLFZocXh7Cvv
         tlEg==
X-Gm-Message-State: AOAM530JgQc8WEC0UMM4Vjyu5MYjqlmXLr0fu6VLSnXU1NNCMQ1P/u/E
        9XxvH7LI0mKFLXYCs+2Lp2G725tnz5o+fU6WArJD0Q==
X-Google-Smtp-Source: ABdhPJx8bt2iO0VzjU0DLSaeJ6uti5mLTFS+a8taGhFKi0ROczyGSjhAfQoWFUXEN5uuDRRYxN56vQQMrGxhJ/xabK8=
X-Received: by 2002:a05:6512:3225:: with SMTP id f5mr891116lfe.441.1604670803121;
 Fri, 06 Nov 2020 05:53:23 -0800 (PST)
MIME-Version: 1.0
References: <20201102191722.81502-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20201102191722.81502-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 6 Nov 2020 14:53:12 +0100
Message-ID: <CACRpkda-kiURXfFeU+3yu3q=gEXZe6ZEEKn6E_RrB1QQ++bffQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] gpiolib: acpi: pin configuration fixes
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jamie McClymont <jamie@kwiius.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 2, 2020 at 8:17 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> I think the best way is to collect tags from GPIO maintainers and I
> can incorporate this into our Intel pin control branch which I will
> share with you as PR against GPIO and pin control subsystems.
>
> I'm also all ears for alternatives.

Acked-by: Linus Walleij <linus.walleij@linaro.org>

However I definitely trust you on any changes to gpiolib-acpi.c
so if you want a definitive formal control over that I do not mind
if you list yourself as maintainer of this file. I would
definitely pull any GPIO-ACPI-stuff from you without any
hesitation anyways.

Yours,
Linus Walleij
