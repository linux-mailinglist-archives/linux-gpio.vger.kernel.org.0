Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D49F441FCA
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2019 10:53:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436941AbfFLIx1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jun 2019 04:53:27 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:41207 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408036AbfFLIx0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jun 2019 04:53:26 -0400
Received: by mail-lj1-f196.google.com with SMTP id s21so14396608lji.8
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2019 01:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nIawAQGWbLfWKTC3QZLXfcvTQA4CewZ25jbyqgy97+M=;
        b=jIFxE+K9E+9sLfOXVhz7UhSXRSFRim36eS6PxLRxoAg84JEx1jh75jRvY3qyffVITd
         lydhSmYqeZuBdXFrUO2/Sgn8Xtg4PTAZ+FTUb017+ByPeoR19sawrC03KCTTpAFi2Yoz
         6L3AijeU2ipvMHlSkoZQpDNjNNy1e73Ao6OfLDP2mitZeLPhkISb2JCO6lmtDVhfqm8Q
         4lJ0ruYaDTrE1CSiwuTn0QeCCc6ZvMJxAmCHrI9RtTmj2w8YuhwVHeZALl3GP9YO3Zxi
         CUVQr73huP0KWf+XXV4eXtrMAML8vpFJJdDsZr5UJFb2i4zWu9LSo/FJtTTifNf7c6yW
         AAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nIawAQGWbLfWKTC3QZLXfcvTQA4CewZ25jbyqgy97+M=;
        b=jlPEkizLxQJoMo6NT2T0veOeycX4p4j0PlxO9BK23i8QSbbiELgQ0Why0CseJ+Okn7
         4j8YodSNhPx1vr3YXkiVxSXreogW+cPTaI2FjWbzM2xrWQi2sZNJzpmlW0/0R6TkwERQ
         cYLYo+oFBvPyFJsStp9fdbdObp6Z2Tue8VeITi83hXfjw+OgGdJZGrMyC+fEXA7oGB8h
         P/vT5JATMhlHfOgMtIqO/PrYKmKsVAXLH5oQU3a+Ug6704tSLeR06sanvIexw5K+MLFB
         lD5AOt6McdUZamQnqk45cPGj5iOVVMvskw+E54yFJA32BXS+4HWdtwK/nTU/lzSwX+fK
         OIGg==
X-Gm-Message-State: APjAAAUs1g9dIbni4Y51zGPLMno/msiQ0eqBvK/KeBf6xtPYSy+nSGPO
        9aOagF6Tmfph1d9Aq/zj4K1EuGrimWfujbT/gjGrIQ==
X-Google-Smtp-Source: APXvYqxNIIw9LCbyTcI5g6LaBsQRBR0wCq3T/j2cKTZRbhzfeQ43ACd8rs8QCnicFF7qmbfskgJqAyNjSj9WpNbJRTY=
X-Received: by 2002:a2e:9753:: with SMTP id f19mr3993428ljj.113.1560329604687;
 Wed, 12 Jun 2019 01:53:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190610171103.30903-1-grygorii.strashko@ti.com> <20190610171103.30903-13-grygorii.strashko@ti.com>
In-Reply-To: <20190610171103.30903-13-grygorii.strashko@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 12 Jun 2019 10:53:13 +0200
Message-ID: <CACRpkdamGnFfvmdd_-DMph+AYCjYjF4sF+YOEqKig3L7kn4dkw@mail.gmail.com>
Subject: Re: [PATCH-next 12/20] gpio: gpio-omap: simplify read-modify-write
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
> We already have a read-modify-write helper, but there's more that can
> be done with a read-modify-write helper if it returned the new value.
> Modify the existing helper to return the new value, and arrange for
> it to take one less argument by having the caller compute the register
> address.
>
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Patch applied.

Yours,
Linus Walleij
