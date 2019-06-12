Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C10041F92
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2019 10:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730546AbfFLIrh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jun 2019 04:47:37 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:42833 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726731AbfFLIrh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jun 2019 04:47:37 -0400
Received: by mail-lf1-f65.google.com with SMTP id y13so11404653lfh.9
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2019 01:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RDFAFECTi9IJ8RIKoDmEwceaP3UeuNfuR779SQGAHFc=;
        b=XUCceScKU1nCUOlPsPT2oRmMzU1+T1rULa2vUKcAxy7KocMHhmZA5QZGx6Mpyns0zv
         vl2G0gxAyBN4OBk+CCDGlqek81ioUX/hZhzNsFDxz9s2invH6ywoTbtB/V6bUMDZjLjl
         fSm4cYsUXlFYeVQXo5MLfFQckGO8MNdfYK0HPFZaU8dY2xlyXALeqakhuNncXZueZPsR
         w3FuBnTO3ajCjnn70szMy1tJm/i52NiqhKBrChxlFbWs7fFjKPtWKnV6d1PdBe8UPuYi
         pjsNWPPqjLksxwBL1Pn0F+/G65nhOLuGWfRAvJ90rEaqn3bcati6XawLtZwbCAlq+Dle
         3kGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RDFAFECTi9IJ8RIKoDmEwceaP3UeuNfuR779SQGAHFc=;
        b=ajNDlNduJWsoBmWW2MbuCCDZTGpxltaf7g2AuGHAUcDmhS1wQ8ujBBcxJhU+HowSqd
         5+qYo8Cz6hyAC+m5QrKA17IlA8KVhUvKSG5WB3fTRltnu3Y3qT24qoFwsfqfbgBiMlfx
         ItOFcx5yaOKDobm/8i2bdht4LdyqU4apej2UmLTQhBHgSVkhNFfI2PIaCxGhwrY8jbqn
         5zFnTqevZCQU/y14T6ZGAxXnPk3OBNawyj65An7KBfGymLoClqYQyhDkpmoiLx10ZZga
         8tjKS4rT4mozWbUlKhF4+zyLSjog1ciVepec0ba1qLoC7NZS5zt/IsQjbeiRJjLGypZW
         dBEA==
X-Gm-Message-State: APjAAAX2SXh5779Q6m4MkveTdbxp51x4GHbS+tOi9i+QDYbouPxME0We
        JZ6VNti9F4AX8nQA1d7LZbXpqD5MTa8/JoksbIwQTA==
X-Google-Smtp-Source: APXvYqwfDjFlkCMYZFw/Bn7coNKAbnOhLBHhiftO+YMQniDmlCWBpk8GUtbDNqAT2f1P7cU3hOBHz5vqmnZqTrYtxjM=
X-Received: by 2002:ac2:4891:: with SMTP id x17mr5258785lfc.60.1560329255343;
 Wed, 12 Jun 2019 01:47:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190610171103.30903-1-grygorii.strashko@ti.com> <20190610171103.30903-8-grygorii.strashko@ti.com>
In-Reply-To: <20190610171103.30903-8-grygorii.strashko@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 12 Jun 2019 10:47:23 +0200
Message-ID: <CACRpkdYaropisZADA61LF_0aUmWzi44c7pQbEUV92r06Qu3m_w@mail.gmail.com>
Subject: Re: [PATCH-next 07/20] gpio: gpio-omap: simplify omap_gpio_get_direction()
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Russell King <rmk@arm.linux.org.uk>,
        Tony Lindgren <tony@atomide.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Russell King <rmk+kernel@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 10, 2019 at 7:12 PM Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> From: Russell King <rmk+kernel@armlinux.org.uk>
>
> Architectures are single-copy atomic, which means that simply reading
> a register is an inherently atomic operation.  There is no need to
> take a spinlock here.
>
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Patch applied.

This makes me wonder how many more instances we have
of this kind of mistake in the kernel :/ I guess it is mostly
harmless but it sure makes for massive code complexity.

I would sure like e.g. drivers/gpio/gpio-mmio.c to avoid
taking locks on architectures where this is not a problem
given it is used on a plethora of architectures.

Yours,
Linus Walleij
