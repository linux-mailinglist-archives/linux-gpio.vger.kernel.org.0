Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D336665352
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jul 2019 10:48:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727974AbfGKIsp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Jul 2019 04:48:45 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:37277 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725963AbfGKIso (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Jul 2019 04:48:44 -0400
Received: by mail-ot1-f65.google.com with SMTP id s20so5060519otp.4;
        Thu, 11 Jul 2019 01:48:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J1BTRqg67XXSfvgmNFOIpOtczOF1eVzxlxx4pnprNZA=;
        b=nKbdFla3X4xpDgHvXbdZNZt2d4MdeZmI7IWNJz0Sxe1hFubrGSsPM3JId3/ptv67ba
         rbsMXpkENpM5kK4KiG+mbvXV60C0YF7qLrVR6k/oAycBBP0H9giojT38KOSTdX6Z1y+f
         wHVCakj+EkHx2y6gEYTZ9zfmZ75AWn9IcRQ4Z0Wz1HdUH0JOYFeZiuQLj3Wcotqg1Mae
         COQse64/MVATzUyJQTZX6kMswrm4SOdR3Bxq5Mu0otNVHQbvapJIFJULr5WFgOuT9vqr
         C/gAnsuhrEKG8JzV+GSm6xY365uw1E7J6eNlwEuttlNcOOhPpN0IFUAqsBg54f5KOOYf
         U+wQ==
X-Gm-Message-State: APjAAAVDvwvr4GrbXbqZd2E0eCHzB5giq0dnI7bpfdlE8zi9pBJmpnTl
        HqZ+WV7C9/PVrYtwPWT9/+EdBbr2F92L53wciYc=
X-Google-Smtp-Source: APXvYqz1+IYt8MUEu6MIeuFXQ4Ts2re9Myf+njmhHhzmWTkFgoe6g/LcJpaEGs83Pujk0OMeRL7jjaXMr2nbos0pIDc=
X-Received: by 2002:a9d:7a90:: with SMTP id l16mr2480550otn.297.1562834924118;
 Thu, 11 Jul 2019 01:48:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190711082936.8706-1-brgl@bgdev.pl> <20190711082936.8706-2-brgl@bgdev.pl>
In-Reply-To: <20190711082936.8706-2-brgl@bgdev.pl>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 11 Jul 2019 10:48:33 +0200
Message-ID: <CAMuHMdUp3YMMzhYRBnHFDrf3w7GDK8HY5aAXdjVZ_oMd_n6xdQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: em: use a helper variable for &pdev->dev
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Phil Reid <preid@electromag.com.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 11, 2019 at 10:29 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Instead of always dereferencing &pdev->dev, just assign a helper local
> variable of type struct device * and use it where applicable.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
