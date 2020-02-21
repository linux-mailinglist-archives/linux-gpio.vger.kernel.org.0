Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 103421682CC
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2020 17:08:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728835AbgBUQIl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Feb 2020 11:08:41 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33827 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727213AbgBUQIk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Feb 2020 11:08:40 -0500
Received: by mail-lj1-f195.google.com with SMTP id x7so2755064ljc.1
        for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2020 08:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RkTsQTvfjgOEGdlDXKGCeeZxoa04rIy9ygJ3R4JduGw=;
        b=Yl4rYrff+zKVIc9yoeCBgHu0Hr6Lxdr2Dk+weltYHKGkpqyZwgJl2IO1NgO2i0vT/E
         99a5A1dgaz45Pjo84/pcasIWbjqjIkhY03aq+EbKkljQaPvu53PSnv8MEzWd5lTXHMO6
         ILy1pKyOIN8MEJYzd46PlFensSAb/peD4Pyzc4ZoFZxBo5atPVjDya8qF0JhhOx/I9uH
         H4VTjhsow4h49cwt3AvmwmV5/jMHvdy9OPRNCwK3mPh3pTOogHt5J/wFCgkfN4Z6so40
         qDYMC5mecGJY7L2h7znzdfQ3Jzp5HE4zgleSo1s22yfX5NZQo5mSlGfgtS+JqaLjPGOy
         +whQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RkTsQTvfjgOEGdlDXKGCeeZxoa04rIy9ygJ3R4JduGw=;
        b=pBo+OM+X2QLyQfsmuA2RrWWeWGYm7ThLORPCpt7UMt3AgcmOFI/GOWepXS+xzPGwJO
         4TeAJCR2VUrQ4AiPkWaKrie/2F3xrFYqzM00RsTg+iAWLON7HpD9js5dwWfVpFvBG/ll
         mXxXSy7F/fQPSvG31BDAYWb7kQvJtFCgd8dEOeInOE4grqsP6W5/Y72ZMvZZGNGzhfuW
         7GmFL1RAZE/YgTsaVQPCee93Kx++McEZdGl/CpLBdbBDTID54JYnu4HUnETXUuA9zK4e
         atp8rucvyGHp3E+0i0ZSW8K8FfXT3/wXvsvOyT0aipchXm07tKWgsCmT0XK21P3U1ix+
         jIGQ==
X-Gm-Message-State: APjAAAVngE/hat1DUnRV/jKq+RquCrgjbB1aOwrO0Cn/xJI+d5K1KJ/t
        wX0VWiLd46Mymyxn7Qy6YrRDVhJhNCe0l0EC6bj6Kg==
X-Google-Smtp-Source: APXvYqzjBTruiUzyd12hI2oewAEFW5wvp0x48B+Xz9xN6AHcyQ7rQQbPBXV6MVxQYYXX7uV28p+joU8wSXIlz+RTL/U=
X-Received: by 2002:a2e:7d0c:: with SMTP id y12mr23390889ljc.39.1582301318561;
 Fri, 21 Feb 2020 08:08:38 -0800 (PST)
MIME-Version: 1.0
References: <20200220130149.26283-1-geert+renesas@glider.be> <20200220130149.26283-2-geert+renesas@glider.be>
In-Reply-To: <20200220130149.26283-2-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Feb 2020 17:08:27 +0100
Message-ID: <CACRpkdbgsR1n1qj3HmQWcEjeDdN85N1Mw8kLOUAeDjESW36MDg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpio: of: Extract of_gpiochip_add_hog()
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 20, 2020 at 2:01 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Extract the code to add all GPIO hogs of a gpio-hog node into its own
> function, so it can be reused.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - No changes.

Patch applied with Frank's Review tag.

Yours,
Linus Walleij
