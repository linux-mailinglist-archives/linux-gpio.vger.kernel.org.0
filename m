Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B3352D3EAC
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 10:28:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729211AbgLIJZy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 04:25:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729208AbgLIJZy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 04:25:54 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AA34C061793
        for <linux-gpio@vger.kernel.org>; Wed,  9 Dec 2020 01:25:13 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id e7so1415781ljg.10
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2020 01:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cYe73lfxXwG2IaSLFmhdyJ4xOtphHHnm36rAnzqmiOo=;
        b=jt2hDRgS1ZGHz9+htM37Vtc/8gKqxO5FaBCUdCXPTon1+bm4Z1ZBXMFoOIU5mRiIiV
         cMNqUt9dYhIRLayDICE8ee1srKMkmhM1bbzuQE0cdAJMJd93nMtPpXFVyEuFCRxw5ddy
         3PxF0C2ThjnO+2Z5J0w4J422RxHmhjlzZAwKvzdV931t0o9BybZKbapI3i1cia44L5HO
         rY/jZQwcIP8Xc4S/IomEZdDxcdeOQPQwRC3LeKLquRV/E1YMNj6QwJihhLfhztVST0sp
         EfrndnjMdlLyTCM/KsLO730oVIpaj/pjMU9coRmjTrizeQOykNM1terH42IA65cMwYsA
         HVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cYe73lfxXwG2IaSLFmhdyJ4xOtphHHnm36rAnzqmiOo=;
        b=OjoipT0zwloZ4ZpaRBfikZ4FcCSi/hK1rotEIMBuQJHHeFHdpLWVfomUIJ6xoa8BXL
         VSN/ZSEl4K5DiPBhUxRfOIJ6T7tezAd+BkNxPn2NpFrrFCjbLQphaJrDHIJPL0xdbM2I
         z5zUmuWXT7/4k23vGm+gWTGBFf8gcsiQC0YNtdr1TI6XxCwzgZpXHY0bQdFWtkRg+Xtl
         YWBLBwOH0XOz8ktdgPPcY/c86Ju0Vnhg1HwQ/gqvTcv2AMQri1l2vXefLCaE5XxXfILe
         v3UVSJLhc4oV5AMwFDNAs74ti2Xr4HF7O8ZfB4Y9KAadLta4hea0G7PMD+KCEjRrv+RU
         oSow==
X-Gm-Message-State: AOAM533z8KkV02oTJq0F2CATh39LqHYAt1Uxe4+Ui2NWgNU6y18ieZhh
        xFDvxwKblgym4z53N0lvXNJdZ+IT0lED3PUtPbab9A==
X-Google-Smtp-Source: ABdhPJxyIsnewKjo4ALm9vwM1lKCSFgLErkUx6KRJXVrplD7lgYlsKlPeaqyagO2ZpoaXjHaZ/p5virECuxHrVyx21I=
X-Received: by 2002:a05:651c:29c:: with SMTP id b28mr703944ljo.368.1607505911969;
 Wed, 09 Dec 2020 01:25:11 -0800 (PST)
MIME-Version: 1.0
References: <20201204164739.781812-1-maz@kernel.org> <20201204164739.781812-2-maz@kernel.org>
In-Reply-To: <20201204164739.781812-2-maz@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Dec 2020 10:25:01 +0100
Message-ID: <CACRpkdb6AH6RGDenAXTofwTRvZcJp1cg6gXxC26MuXL7EPDtwg@mail.gmail.com>
Subject: Re: [PATCH 1/4] gpiolib: cdev: Flag invalid GPIOs as used
To:     Marc Zyngier <maz@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-usb <linux-usb@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 4, 2020 at 5:47 PM Marc Zyngier <maz@kernel.org> wrote:

> When reporting the state of a GPIO to userspace, we never check
> for the actual validity of the line, meaning we report invalid
> lines as being usable. A subsequent request will fail though,
> which is an inconsistent behaviour from a userspace perspective.
>
> Instead, let's check for the validity of the line and report it
> as used if it is invalid. This allows a tool such as gpioinfo
> to report something sensible:
>
> gpiochip3 - 4 lines:
>         line   0:      unnamed       unused   input  active-high
>         line   1:      unnamed       kernel   input  active-high [used]
>         line   2:      unnamed       kernel   input  active-high [used]
>         line   3:      unnamed       unused   input  active-high
>
> In this example, lines 1 and 2 are invalid, and cannot be used by
> userspace.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

This makes sense, so patch applied (unless Bartosz tells me
otherwise, then I'll pull it out again).

Yours,
Linus Walleij
