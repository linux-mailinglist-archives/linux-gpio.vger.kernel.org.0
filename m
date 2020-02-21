Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E8ED1683C0
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2020 17:39:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbgBUQjd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Feb 2020 11:39:33 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:37432 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbgBUQjd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Feb 2020 11:39:33 -0500
Received: by mail-ot1-f67.google.com with SMTP id b3so2549338otp.4;
        Fri, 21 Feb 2020 08:39:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4BgZBtTDREnYAapVdHrqgQ9W3R4CTcWbIkMjaCPQlXs=;
        b=OtYArn7b/nkRDLsU6MJtdHuXrVCS57+t5xKnmjZc1aAyvZMNcfpQDbqke+UZGFcXk4
         Jp10UuhUW+gf1L09OhPuozowC5syNMyLyRc7NjTh92R90R71H0Tjh7Zdk2gP4MIktr2c
         38HGJYQy/g2zZJ3/yD1778BgMF0RwoZHxv//t4Jv+3oe6ZE+Z557UgC73tPqcZ4trcPH
         iGFDEGJu2Pzriss1lN+guU5ef/T5GktEmWJ5y0hDBxMEVCN5Wa2bz6kmMn5iUpLueOsp
         /oECd1o8SbfzSVBlB2eFlVAl8xPe9T3gnr4XrQ1UJ2oolLt0Z9AFN4N9LMAnv9+fg30x
         y9rw==
X-Gm-Message-State: APjAAAXFXDcylr10NymdJ9w5JiL+oKTb7Ro5CYSw+Qg4e1oWfz5ADTN1
        X9W5Qe9X7pnCTNOygpAhF9C86yly6AYvg5nPIH8=
X-Google-Smtp-Source: APXvYqyHdwKbUhPCfLeqiqCgnHSzlLvGxUb88yDmpTUxNb9KdZfgkLsmdvKxBtKDh+BkPpxepYgxvBCP9OOjR7Ep3ks=
X-Received: by 2002:a9d:dc1:: with SMTP id 59mr29016938ots.250.1582303170916;
 Fri, 21 Feb 2020 08:39:30 -0800 (PST)
MIME-Version: 1.0
References: <20200218151812.7816-1-geert+renesas@glider.be>
In-Reply-To: <20200218151812.7816-1-geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 Feb 2020 17:39:19 +0100
Message-ID: <CAMuHMdWo_JBpBeS72RkZBwuWyMhMj79=9ErFdXcLSqC2rOhJDg@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] gpio: Add GPIO Aggregator
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus and Bartosz,

On Tue, Feb 18, 2020 at 4:18 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> GPIO controllers are exported to userspace using /dev/gpiochip*
> character devices.  Access control to these devices is provided by
> standard UNIX file system permissions, on an all-or-nothing basis:
> either a GPIO controller is accessible for a user, or it is not.
> Currently no mechanism exists to control access to individual GPIOs.
>
> Hence this adds a GPIO driver to aggregate existing GPIOs, and expose
> them as a new gpiochip.  This is useful for implementing access control,
> and assigning a set of GPIOs to a specific user.  Furthermore, this
> simplifies and hardens exporting GPIOs to a virtual machine, as the VM
> can just grab the full GPIO controller, and no longer needs to care
> about which GPIOs to grab and which not, reducing the attack surface.

Do you have any more comments, before I respin and post v6?

Thanks, and have a niec weekend!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
