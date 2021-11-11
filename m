Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6844F44DC86
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Nov 2021 21:31:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231919AbhKKUep (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Nov 2021 15:34:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbhKKUep (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Nov 2021 15:34:45 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88D10C061766
        for <linux-gpio@vger.kernel.org>; Thu, 11 Nov 2021 12:31:55 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id q25so8154727oiw.0
        for <linux-gpio@vger.kernel.org>; Thu, 11 Nov 2021 12:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UbyzGu3N0WG7w9a548DYe86BOPNj4uEfZNAhmdT33UU=;
        b=FbLSf0Z6YvJ3bQWiFHND2pElxVlQ9IWrax5XKJ1ehwffexys/MBTQoc7C3URclEpVa
         mpRQAaJMzuppbUY5dAN9eEgA6coQQNJeASZ1gG5aaPTIMkFCsyHxoMGni+IBQZRv+RSg
         A3VregAuKJNZULaIcTTylTN+/kolCtEoZR0OhR+FNradtzUvjthGLj+1urAV6jkVmpGi
         amNR8C5FSVDtJN+HrbeYbms1cLV7uOcT+BNyBTOdql8h3+AIxxJrhj/4sT4Pf5arPltg
         7KqsgKlVR4PyFqd+IMnDcLWnhzHFjxcu5czPN2GrnNE2D3a2YSEMysqYRhb7EKeLpxl3
         tzUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UbyzGu3N0WG7w9a548DYe86BOPNj4uEfZNAhmdT33UU=;
        b=01jjw/dPJ7soSM5L+JkxQBpRrJP1QKatAwPHi393YsAWf14tjMvO+STgAY8yJHZOlb
         i5eIFLZdPqvcHCU5tfQADI68/uMuWe58a35qpaVF2uXOtekuvMMZFKaqlnXE1eaVfD/o
         T2cXE6sqb+bmiCER5PooBgWFKVHc3ReuhjoAESECCEC4ZQ317a3VFps5dxpgC7/vpXxe
         Z+jPeJt5Q2aZGTo4UNjug26i3O7sP54x6y+4rY/1EqMR2lmMp511N+2sR1iYEHxLjUF+
         qx84b2t9A2J8AtZXT6ah+MxnLvGFfyzSDFb/DSyVzb+IxzZFTPiyRGAhiaTwnZVYWWxZ
         437w==
X-Gm-Message-State: AOAM533F+iGSLq8kJNZbYQ9L2fLodZKcmtqwnyCqanjoOSqxMYL3mXJ2
        dYh/5REIWhhXo34sPQtJDD6cXEIhuTjh7LcMrCHHaw==
X-Google-Smtp-Source: ABdhPJxmIHWrFPEygsIUhcXRMfVgLnn0WRIXb3HRTWJDJnpws25W1kOso2NAuizh0Dk5vPUNPOxsEo0j8EYQYsUd5y0=
X-Received: by 2002:a54:4791:: with SMTP id o17mr8692071oic.114.1636662714953;
 Thu, 11 Nov 2021 12:31:54 -0800 (PST)
MIME-Version: 1.0
References: <20211111202506.19459-1-brgl@bgdev.pl> <20211111202506.19459-2-brgl@bgdev.pl>
In-Reply-To: <20211111202506.19459-2-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 11 Nov 2021 21:31:43 +0100
Message-ID: <CACRpkdaLt5Ra2S8h=8N6ek6r6aYXxg1e8WD76eP8JSau721Xew@mail.gmail.com>
Subject: Re: [PATCH RFC 2/2] gpiolib: check the 'ngpios' property in core
 gpiolib code
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 11, 2021 at 9:25 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> Several drivers read the 'ngpios' device property on their own, but
> since it's defined as a standard GPIO property in the device tree bindings
> anyway, it's a good candidate for generalization. If the driver didn't
> set its gc->ngpio, try to read the 'ngpios' property from the GPIO
> device's firmware node before bailing out.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Nice!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
