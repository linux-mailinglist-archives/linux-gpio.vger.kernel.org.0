Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EA26114875
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2019 22:06:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729892AbfLEVG4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Dec 2019 16:06:56 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:42505 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729145AbfLEVG4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Dec 2019 16:06:56 -0500
Received: by mail-ot1-f65.google.com with SMTP id 66so3890328otd.9;
        Thu, 05 Dec 2019 13:06:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kfZJgMdMZnEWqYp4l6MRhDa+lgrmX+5UPFpYfdvrZFQ=;
        b=SoZxAsjeHAmoEf4nNdWHdNcH1eSxQGcAMlZkojEugsfwFP+PMHN/5fG+rRd+a6QsrN
         UZ2nSGHtgB7j38V6j9TPs0jIXrA+Q5OOtGsGzONxVQ+ynCqo2IadyilFgPosg3/gOxdf
         3VEQNi8ZiUF0J5ebBwjKwSVnI1m2V/fb8mcJFHJJz5VZSTeZbTV0nOK1nLiSW1ghecYD
         /flwLufgKqBJxGPODZgph7WUClg+7YA1/B3cJsgJ2UGN4Qxyfg9Ma3+VFf8vsxZlveMq
         0WbZLwUoPFak+8xVRRFjNI2Gvm8RxNzKG0Q3uoWlDgAn4m8Ds/4u1RwXhKM2C0/9CGja
         C50A==
X-Gm-Message-State: APjAAAVKlfEd2gTkmkWLBWw8xtEUxm7kwBuU/TsAzv72M3BjbzhHMyv2
        7TT0vK57ZYd3gRo5ej7OQA==
X-Google-Smtp-Source: APXvYqz+giNRZ8MeXlmxtPAkMj15JPvC0Xm4AbR1+kfJ6wADHeXGxnfrjZfPcXGkJATVHVwmwkF53w==
X-Received: by 2002:a9d:75c7:: with SMTP id c7mr2839523otl.181.1575580014993;
        Thu, 05 Dec 2019 13:06:54 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r25sm3819723otk.22.2019.12.05.13.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2019 13:06:54 -0800 (PST)
Date:   Thu, 5 Dec 2019 15:06:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 4/7] dt-bindings: gpio: Add gpio-repeater bindings
Message-ID: <20191205210653.GA29969@bogus>
References: <20191127084253.16356-1-geert+renesas@glider.be>
 <20191127084253.16356-5-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191127084253.16356-5-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 27, 2019 at 09:42:50AM +0100, Geert Uytterhoeven wrote:
> Add Device Tree bindings for a GPIO repeater, with optional translation
> of physical signal properties.  This is useful for describing explicitly
> the presence of e.g. an inverter on a GPIO line, and was inspired by the
> non-YAML gpio-inverter bindings by Harish Jenny K N
> <harish_kandiga@mentor.com>[1].
> 
> Note that this is different from a GPIO Nexus Node[2], which cannot do
> physical signal property translation.

It can't? Why not? The point of the passthru mask is to not do 
translation of flags, but without it you are always doing translation of 
cells.

> 
> While an inverter can be described implicitly by exchanging the
> GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW flags, this has its limitations.
> Each GPIO line has only a single GPIO_ACTIVE_* flag, but applies to both
> th provider and consumer sides:
>   1. The GPIO provider (controller) looks at the flags to know the
>      polarity, so it can translate between logical (active/not active)
>      and physical (high/low) signal levels.
>   2. While the signal polarity is usually fixed on the GPIO consumer
>      side (e.g. an LED is tied to either the supply voltage or GND),
>      it may be configurable on some devices, and both sides need to
>      agree.  Hence the GPIO_ACTIVE_* flag as seen by the consumer must
>      match the actual polarity.
>      There exists a similar issue with interrupt flags, where both the
>      interrupt controller and the device generating the interrupt need
>      to agree, which breaks in the presence of a physical inverter not
>      described in DT (see e.g. [3]).

Adding an inverted flag as I've suggested would also solve this issue.

> 
> [1] "[PATCH V4 2/2] gpio: inverter: document the inverter bindings"
>     https://lore.kernel.org/linux-gpio/1561699236-18620-3-git-send-email-harish_kandiga@mentor.com/
> 
> [2] Devicetree Specification v0.3-rc2, Section 2.5
>     https://github.com/devicetree-org/devicetree-specification/releases/tag/v0.3-rc2
> 
> [3] "[PATCH] wlcore/wl18xx: Add invert-irq OF property for physically
>     inverted IRQ"
>     https://lore.kernel.org/linux-renesas-soc/20190607172958.20745-1-erosca@de.adit-jv.com/
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
