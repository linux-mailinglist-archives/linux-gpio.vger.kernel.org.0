Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E57BA973C9
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2019 09:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727206AbfHUHqJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Aug 2019 03:46:09 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:42036 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726224AbfHUHqJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Aug 2019 03:46:09 -0400
Received: by mail-oi1-f196.google.com with SMTP id o6so894030oic.9
        for <linux-gpio@vger.kernel.org>; Wed, 21 Aug 2019 00:46:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SdD2LwlvMnpHdKh4iXEY3zt9jqjFRxplZ+70PsaEpMk=;
        b=gZDMDGRE1M15fvsR4sQIb96pRrU5K7ubSAlF73vscJejXP068kzDNaTVCVSPielbgo
         iNpriEXPRF7IIBjn+A9lsi0Pff43eizNbh2jU0mt1nOV05erF+aJ81V/jObOxtiI1Pnm
         9z/WTT6tONfs5ZZjns2mou6f3cyc3UuW3aPbxsfetAFZhfe9JhVbDvl1bHpje0uTfafY
         wZBrZ4o4+2qimymtvoo2q+3FHgNlyiDCGfI6R8L35Lsnbba2FtZjbh5MEVwY6F8/ZbIt
         lpX/VFzWuBqB7dvHe/4qGk6WvqPVeDMbQsPxdO4+TqOAVLP2VffmH739u5g7GBn2gzfj
         kFrw==
X-Gm-Message-State: APjAAAXfo7WduaQ9ZSS9jXDMqSPvwRGteWvjmEgRoliJdKWa8nrNdC9T
        3axtG0fs4ugYZf9DcncUBgmmLjmmlvkIbWBDvPg=
X-Google-Smtp-Source: APXvYqwWp35N6ciYQTvT6v+dUMueSbx3OBxP2xVsHd3b1dw4sNvDo80DqWzjiiZZmzP2FooiBalvhxlM2SRZ90vABqo=
X-Received: by 2002:a54:4618:: with SMTP id p24mr2715497oip.148.1566373568208;
 Wed, 21 Aug 2019 00:46:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190820135955.14391-1-linus.walleij@linaro.org> <20190820135955.14391-2-linus.walleij@linaro.org>
In-Reply-To: <20190820135955.14391-2-linus.walleij@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 21 Aug 2019 09:45:57 +0200
Message-ID: <CAMuHMdUQxPLozVPJD5vdCokeuD+AaRmZ-MjwUccGnrVJp5P0iQ@mail.gmail.com>
Subject: Re: [PATCH 2/2 v3] pinctrl: rza2: Include the appropriate headers
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 20, 2019 at 4:00 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> This driver is implementing a GPIO driver so include
> <linux/gpio/driver.h> and not the legacy API <linux/gpio.h>.
> When testing it turns out it also relies on implicit
> inclusion of <linux/io.h> (readw etc) so make sure to
> include that as well.
>
> Cc: Chris Brandt <chris.brandt@renesas.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v5.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
