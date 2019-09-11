Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17AC6AF9FC
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 12:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726696AbfIKKKQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 06:10:16 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:40599 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725616AbfIKKKQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Sep 2019 06:10:16 -0400
Received: by mail-lf1-f66.google.com with SMTP id w18so4052479lfk.7
        for <linux-gpio@vger.kernel.org>; Wed, 11 Sep 2019 03:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Fd44UJ2qp7SxlmPH92Hh2fZtRoYOa2yVKq8dtzIHoUY=;
        b=weAyWjo4quJcwmENKcNerNmyN+gz/QJ9hYm8rmn0/rQ4AF+hN9LftSYTgS3KxWM9dR
         tlgY+fTeAXsDs4FJRXwaCuDUUcOv2DWlkbSIIiob2peEB4Hnw81+IpJetrTGCEbx7O2I
         9Yl6U/Lfnxb4U4Jv1lwMercoCINucwno4J2A0Jf/rYQ26oAWmb4i8bR8Zl986fCF3crW
         ZNeQ+TUh0b9lN4q6SdlSC5UDgTPgH3z1QVTZQtYPrJHV4hgeFpDRZQD1+vDtcmyzoI6N
         2fCBXQEVf8qcPbNDTCxRpJQyxaAo2YjTtrJxGC033lysc/91IdDBTbwvU/a3KTj20yWw
         dR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fd44UJ2qp7SxlmPH92Hh2fZtRoYOa2yVKq8dtzIHoUY=;
        b=Lhg/pwtrZ3EnARJJw3OhnB47Bjz6rk1suD/WgHQTXqCf34VCgIPEkBfXCwRuboDhXp
         7sVTMRBOZdB4YJEHHKJ69kcrke0YKLSzaLJY6XX9C/RAA8fKc8zZxnvflCDGgNWcJ8RV
         Dg+yu9Mid0RIO43YauQeYm+L+U1gr5JPJGOPjTYIzJZt01u02CkFoGzukjjTy9AYgO5Y
         mvgzrEZTMYupE7rPjp7BcMvu5ufFPnDUrobqpWIjY+7nG3Oj/wJp/Jnb5r7VaP+B+atO
         fSyhyqCJY1oKP4JmD8M3b4mJ/YeC3fyIiwotV4Mc7DrLhiAjPjxucJsHRa5pqH13evqV
         pVtg==
X-Gm-Message-State: APjAAAUZoI+8JeJFfkNJD29U45r5LxySODippE+OqjsG+D4ZWkqdAkdh
        FQzGsbpurnRStMUB7mG2MYr6f02shdzBdPhh4K9nb0Y7NXDvXw==
X-Google-Smtp-Source: APXvYqxXrKv8m/NgHM1ig0qAYSi29B4YPdGe3bL55eGb9Rww2zvzQ3IpVfOta67Ay2PtbrLdxjwEiKNEmAnXzj6hqYE=
X-Received: by 2002:a19:48c3:: with SMTP id v186mr23663867lfa.141.1568196614289;
 Wed, 11 Sep 2019 03:10:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190906062644.13445-1-rashmica.g@gmail.com>
In-Reply-To: <20190906062644.13445-1-rashmica.g@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Sep 2019 11:10:02 +0100
Message-ID: <CACRpkda7WAZxUSjOXRj5Q1mSC0ZhYey2E9RkuX7p6Wcs_kXB=w@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] gpio/aspeed: Setup irqchip dynamically
To:     Rashmica Gupta <rashmica.g@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 6, 2019 at 7:26 AM Rashmica Gupta <rashmica.g@gmail.com> wrote:

> This is in preparation for adding ast2600 support. The ast2600 SoC
> requires two instances of the GPIO driver as it has two GPIO
> controllers. Each instance needs it's own irqchip.
>
> Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>

Patch applied with Joel's ACK, needed some fuzzing but
fixed it up.

Yours,
Linus Walleij
