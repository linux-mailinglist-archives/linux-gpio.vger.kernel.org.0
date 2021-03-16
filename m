Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B360533D06D
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Mar 2021 10:20:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235962AbhCPJUT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Mar 2021 05:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233947AbhCPJTw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Mar 2021 05:19:52 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7B3AC061756
        for <linux-gpio@vger.kernel.org>; Tue, 16 Mar 2021 02:19:51 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id ci14so70745934ejc.7
        for <linux-gpio@vger.kernel.org>; Tue, 16 Mar 2021 02:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DsUSpB8KDvtU13MPXxsrI2J60oAo4P7Zo1BswYf49H8=;
        b=n3LpybRdzBx3JkWI3ww+k1ZW6NkdEzVVKho+bqJP7BEn8aG31SpiqpY4oQDzo24Lnl
         fQ69/9S1RmvTGUJaZXrFbkfR/ysKsuS5vxma9pjbXMwD5ddieo0VlDWXMiKvERwYCJyS
         h+ZVzmeh0vWFc2LbEpO2en8Ko9vxP9R7Mesd7jeuxyVqpdcCVEZNw+Pr0yJXg6itc7hG
         ARu76Mq+jS47ijP5BxoT7bxQaNIyq65RCJ40aJQUgeYHjVuEPkLDVZwof4hgJB8IG1m1
         wrlIoXN0h6X2/ho9Fv1BITk5Yc98a3eoknPVFrX09BKtuBO/qLFJoTTlhfU93Ihg95kE
         6RbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DsUSpB8KDvtU13MPXxsrI2J60oAo4P7Zo1BswYf49H8=;
        b=SQf0dndXpGtChURttVD3GgfeKqPgi8go9ixQ/d5oUsSao9iFY7UbkdoW55ozaj3eVA
         WJuU8+1Ul0BUpmmjWKheTSbPj0Ybe4tjGiz+e6vf2TuizJHXEA+ZDV+9kyE7TSYI/fne
         Gy8xdjrDI2EYS3hD16hQjcd+ntbvNhu/Irl3NInVWTqsTrKu02Jf2N7RINtf3D8OiuBi
         oW2EcNuLJrvwAWGBbIrYiojWCaM4gf9jODHrSLY7PRQz98iKtxqd/28/IkzB67MQFbBD
         SVimyKFh4Z/F/H1UCP9+9ED+Q1CGkQ5MS/XjagOiPD21VVlkVYYmiCIdYYn6Ej4kgMja
         7Chg==
X-Gm-Message-State: AOAM5318txvEOjXtwnCvICecNfxpsRLig+4aRWNVqRDl51pdzQCdfCzt
        lJ2ESyME6oaMLTemP983rBB1DNCwvzvUbSD7LlQQww==
X-Google-Smtp-Source: ABdhPJxpYCGs9E/hD51b7pHyDupv7cHxR5PbU7+97K6ag9/hhSDx2FgE566Nd4y4ic1WjtPU10hvJ9mRt7hsKse0shw=
X-Received: by 2002:a17:906:398a:: with SMTP id h10mr28914545eje.155.1615886390324;
 Tue, 16 Mar 2021 02:19:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210315184430.17755-1-andriy.shevchenko@linux.intel.com> <YE+sMiNxOHxFsilv@smile.fi.intel.com>
In-Reply-To: <YE+sMiNxOHxFsilv@smile.fi.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 16 Mar 2021 10:19:39 +0100
Message-ID: <CAMpxmJWPPXNQpanQ=0bAVToidi3zkX9FfoZtX5hUU4W03vQP=A@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Assign fwnode to parent's if no primary
 one provided
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 15, 2021 at 7:49 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Mar 15, 2021 at 08:44:30PM +0200, Andy Shevchenko wrote:
> > In case when the properties are supplied in the secondary fwnode
> > (for example, built-in device properties) the fwnode pointer left
> > unassigned. This makes unable to retrieve them.
> >
> > Assign fwnode to parent's if no primary one provided.
>
> Bart, I missed to add you as a Reporter, feel free to do that or tell me I'll
> send a v2.
>

No need, I added myself.

> > Fixes: 7cba1a4d5e16 ("gpiolib: generalize devprop_gpiochip_set_names() for device properties")
> > Fixes: 2afa97e9868f ("gpiolib: Read "gpio-line-names" from a firmware node")
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> Side note: The patch done in this way to avoid conflicts with the future
> (for-next) code once it will be in upstream (v5.12-rcX).
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Tested-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Thanks for debugging this! Applied!

Bartosz
