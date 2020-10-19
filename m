Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE982292833
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Oct 2020 15:31:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728279AbgJSNb2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Oct 2020 09:31:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727952AbgJSNb2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Oct 2020 09:31:28 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6F37C0613CE
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2020 06:31:26 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id 77so14190911lfl.2
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2020 06:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vOHmADPW6L8ZyIj8xIGGqFaJ9+fBQ83U7ISfm1VHp6k=;
        b=IZywwtXWlvPbvx2n9k5WUVYtzfBfoJ7tK6XWSoN4Z3AcsBXJc1NPgZ0qgYZiuXCJ5W
         KQxKuQ9Q4TGx9D2akW8GZh2OySpk4trcI9XWz7Imj9pfcpdWHGcN5ZZNKPN1x18IZ2l6
         OgdTTjDkxOy3CXzEBnF3mrhWCrrw3HXksOXbDVzanW9h7nhfyPIw5xlcpFR49C9J+BkH
         lxzRGW0fkykeYR38Jv6Ao6S6TOyH6+6sJTyqHbxTH2FD7dLnN+EK/xXY9p9BLFulIMU6
         BUXt8qsWMXRL1yEA+deoPwm83mZpGjpd6zbuwXfVKEHcOOJFeEAsA15Wizd3fL+bsh0K
         5aDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vOHmADPW6L8ZyIj8xIGGqFaJ9+fBQ83U7ISfm1VHp6k=;
        b=SYYvSYMpmD6j3MVp2d4TNkSk0W3gXzUdcDCuZUwRQh9ysd9/ZOrZDsP3smyBqNKTrk
         qEGoqZNeMunANr5q5x9k87qzR5+3C3tO/gIGqfeL6GazUJYcGXO4PJMm74QfgAEEO8a8
         ZL5JDzKjL7BMPb8Jf7T3c1Z+QwURY1nSZUadImK8nZJ01HIlGQpP7YI0AbSe2b5NysxP
         wtTp3f60imYR6RIR0c4+cbSEmDfxL30sAHQPhluoRhG+hLGBjTcd7NZIitFqE8IqeeGt
         o7L4J+i1WSew5rl+oLSdcoC5NckkrYjyvfHO0vNoP3wJNKJuC1JDCx8I5vPlZAOCyPo0
         sz4g==
X-Gm-Message-State: AOAM530eg5W1lp7aK7MGIXAUpHQqkxghvgyI8+O2C5G5DwNtH8C1542S
        s2TvzasVcV46QJaCtdkA+JdBVG77sVK+XWuh1ukFMA==
X-Google-Smtp-Source: ABdhPJyoiP7K8QsStbsxm5jaXzs+ugwnd58Pok5owwo3j6e0enmOUMyXLLSGUdZ/TmGxnesViY0/tVq7wU8W1bTlQcU=
X-Received: by 2002:a19:191:: with SMTP id 139mr5312534lfb.502.1603114285241;
 Mon, 19 Oct 2020 06:31:25 -0700 (PDT)
MIME-Version: 1.0
References: <20201014103315.82662-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20201014103315.82662-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 19 Oct 2020 15:31:14 +0200
Message-ID: <CACRpkdZ+3DTM6gTcV-i00VAv0iWutYftdF6JsRw=YZ_uwGrGUg@mail.gmail.com>
Subject: Re: [PATCH v3] gpiolib: Switch to use compat_need_64bit_alignment_fixup()
 helper
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 14, 2020 at 12:33 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Use the new compat_need_64bit_alignment_fixup() helper to avoid
> ugly ifdeffery in IOCTL compatibility code.
>
> Depends-on: 527c412519eb ("compat: add a compat_need_64bit_alignment_fixup() helper")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Tested-by: Kent Gibson <warthog618@gmail.com>
> ---
> v3: reworded commit message (Kent), added Tb tag (Kent), dropped extra Dep-on

So much cleaner like this. Patch applied.

Yours,
Linus Walleij
