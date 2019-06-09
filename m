Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F48D3AC06
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Jun 2019 23:29:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729386AbfFIV3R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 9 Jun 2019 17:29:17 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42284 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729217AbfFIV3R (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 9 Jun 2019 17:29:17 -0400
Received: by mail-lj1-f195.google.com with SMTP id t28so6103902lje.9
        for <linux-gpio@vger.kernel.org>; Sun, 09 Jun 2019 14:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KlrRIE/V5p97wscV0kE0tjEI2tlj1dGG4/jhRhsQRG0=;
        b=SOfnaOissSEz9PzQM9mMat56H+3dTOhDdmHyybdevIOxcr2JCQbgWnlzcNKHngS1ar
         6lN1VKkdZ7yRsOEp3hxL2mmnVB3bx7Bt3fbe68ItUxhUV/h8lH5jvN09txUIAd9HBDLE
         yOOfbglZUGy7zp+pLIy/Ti6rWwE+usRIvmnTmud3sfwtqzQKUHMYKqjtVmg24PXE3Mzm
         Pn8DnWXEw80qJN5Q6DxN+u/Wp9UeLNygpfrvD8EfJ4LhF+F6T8+6uT45UEmVss0EEoUa
         W/2popw6Ssix8aXzr8GK94RxD4Jtw8n9CeKclonaMsYy5s2V9HHbVhzr9bM+3qkt66Qj
         Iwng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KlrRIE/V5p97wscV0kE0tjEI2tlj1dGG4/jhRhsQRG0=;
        b=uOehgB3KX4p0NHABJeMl5S/C8PFAnGN5XDyYlpHf9ZWagHhfc/xFm7vq05VtsvYrxi
         eILYD7o2MbfJnGnCKp43StF93HuBCQuajLQS+DUjAgIOYnmXzaVgIJaRLD1ls8EwyaIi
         ek9xVDk9pNsspyMII5EmejDYqc/qBAgY0jiyqlczxmhdj+xbOCkmlVsKN2dB7Vno+V1P
         7OO3FXjvop4mOFIZn5QhFsgLLVpHTqGpqhZXzzFB0f+BpMi+qbdft4wUaFb8X1s+mFBD
         mQiNX+D6HcAawROtZlxFjsN/ztMLCqx7dCRC6VlHckOn3sxRJd4r6yAamfFCKZlpefvT
         XvcA==
X-Gm-Message-State: APjAAAX6PoTWdZVWOkpxTb6EkBGWxO8rnIowjraLZkaxX7cZvWoQ5O07
        aCTkATO4ZMzQkR34Uu6FgoNAI/WhaVo+nIwxBqHgFg==
X-Google-Smtp-Source: APXvYqwD8jFnBTiQeRvhyH1OObx2r8DdreQqyuGuLnn7YPW7qYYuahnntAMr1MNIp51bnR6Kfl+SJrOrjoX25IWmQoQ=
X-Received: by 2002:a2e:8902:: with SMTP id d2mr34580225lji.94.1560115755209;
 Sun, 09 Jun 2019 14:29:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190609180621.7607-1-martin.blumenstingl@googlemail.com>
 <20190609180621.7607-3-martin.blumenstingl@googlemail.com>
 <20190609203828.GA8247@lunn.ch> <CAFBinCA1xp5+77DhYMFjX31D3DsaU7d9EqFkWbn+UFFx5LSqEw@mail.gmail.com>
In-Reply-To: <CAFBinCA1xp5+77DhYMFjX31D3DsaU7d9EqFkWbn+UFFx5LSqEw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 9 Jun 2019 23:29:08 +0200
Message-ID: <CACRpkdZ4n+nCip-uoqbDvQeT0ZpJUfHVnp-D8qCSKfgJEapM7w@mail.gmail.com>
Subject: Re: [RFC next v1 2/5] gpio: of: parse stmmac PHY reset line specific
 active-low property
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     Andrew Lunn <andrew@lunn.ch>, netdev <netdev@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Giuseppe CAVALLARO <peppe.cavallaro@st.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jun 9, 2019 at 11:21 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> my understanding that of_gpio_flags_quirks (which I'm touching with
> this patch) is supposed to manage similar quirks to what we have in
> stmmac (it also contains some regulator and MMC quirks too).
> however, that's exactly the reason why I decided to mark this as RFC -
> so I'm eager to hear Linus comments on this

The idea with the quirks in gpiolib-of.c is to make device drivers simpler,
and phase them over to ignoring quirks for mistakes done in the early
days of DT standardization. This feature of the gpiolib API is supposed
to make it "narrow and deep": make the generic case simple
and handle any hardware description languages (DT or ACPI or
board files) and quirks (mostly historical) under the hood. Especially
drivers should not need to worry about polarity inversion instead just
grab a GPIO descriptor and play away with it, asserting it as
1 and deasserting it as 0 whether that is the right polarity or not,
the gpiolib should keep track of polarity no matter how that is described,
even with historical weird bools like "snps,active-low" etc.

So I think you are probably doing the right thing here.
This patch is:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
