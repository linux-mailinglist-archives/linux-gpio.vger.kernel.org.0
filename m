Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 701F1550A1
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 15:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730852AbfFYNli (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 09:41:38 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:36550 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730342AbfFYNlh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 09:41:37 -0400
Received: by mail-lf1-f65.google.com with SMTP id q26so12699840lfc.3
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2019 06:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hi0/8bYjqAFsxFylK0sPwANTMLzKbpieHWOipiCepbc=;
        b=YX0XHLbnqTvHecDUEsHf2cQcIxiGjRpvVuPf3K6I2nOjqDyHUjCRiRM2KhRCFSz4dc
         jdgA8uvQG4FmSCLAiVcE1WNVIGzcvIO7h+JWhT2ligZmKd9RXQ3dZV1sq8cB2Tix1H8B
         pyiOpvrspb1BcQHcQHHDXasYHo1O1+4XI+bAa4d6i+/YAiEdYIwsLYB7wSBROHMfDq0l
         uLRD+rqFuZz/XrcYupi5NEo8vMWizHs/yL3sTuBe23fCqvVqyNvi/V8alquai5yXkq0y
         QxG6xe5OksDGrcynShMTOr4SVB5RyKPseteaVbzf0zHRK6g+6Sf5C02XchJBorlTG766
         nx5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hi0/8bYjqAFsxFylK0sPwANTMLzKbpieHWOipiCepbc=;
        b=gBPlGxsJKmvtD9PBUUCU8U2kHrmKWwf2n1EEdmEC2OGSRELIYgqjqo/k/588RhwUbU
         qU4Yd/DTkoVIGYVTgJrh9mnWXLUw38Cf4dSXzl03HYngUjAHGFR3W2hB0KZvqX78WImF
         N3h15Y4bOqAPsRVC16SBmwaRdqb25qKwmlPX8+1+uVr+1AAT8WzIydDvuJl+UoohkyHY
         bbqw89ib2cXHWF3ACY8w/l2IhsmYf5jbWMZo67MaU5DV2U90UjtwCiOnKLovihu4e6v2
         EBjpljjZO5nRXG8MbEdMHgEwpKIw+veV3pHczAafAleO4EHHFlHlBg1XjBFFiVBZ06gy
         +tmw==
X-Gm-Message-State: APjAAAWaSnhYKOKNayi8t4It+AmmtpG2ZwvlJlgTAuSzFEBYgZ0OI0AQ
        ZadymgscRXPy58jYY/7awQwm+t3bwqSlU/nb5XPrqA==
X-Google-Smtp-Source: APXvYqzx1Z/QquJ49/enTEN31EjPp2BpJUAn1r9Vj62+b7lPQGEAqbye3p7B9Q5kp03TucbcpAWmNTeGD4L0fmXrD1Q=
X-Received: by 2002:ac2:50c4:: with SMTP id h4mr25229033lfm.61.1561470095593;
 Tue, 25 Jun 2019 06:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190620183037.29652-1-alexandre.belloni@bootlin.com>
In-Reply-To: <20190620183037.29652-1-alexandre.belloni@bootlin.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 15:41:24 +0200
Message-ID: <CACRpkdY_jKdh0YcY7fDUx4ccctiEN6wvOsPDa_H=B7k3j9Seuw@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: ocelot: fix gpio direction for pins after 31
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 20, 2019 at 8:30 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:

> The third argument passed to REG is not the correct one and
> ocelot_gpio_set_direction is not working for pins after 31. Fix that by
> passing the pin number instead of the modulo 32 value.
>
> Fixes: da801ab56ad8 pinctrl: ocelot: add MSCC Jaguar2 support
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Patch applied.

Yours,
Linus Walleij
