Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65FD7B0B29
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2019 11:20:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730580AbfILJT4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Sep 2019 05:19:56 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45295 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730469AbfILJTz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Sep 2019 05:19:55 -0400
Received: by mail-lj1-f194.google.com with SMTP id q64so12350533ljb.12
        for <linux-gpio@vger.kernel.org>; Thu, 12 Sep 2019 02:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XH1GfjgGx1T+lc8m5zbu9NzNgidrGg/qrkIcskPP3lg=;
        b=T7ayBP5Vg3v9cuGFY1vpXWdl1so9yzOWC4+NdMgT1Yyof6I60HEplDj+h14Dompc/R
         cYcNBYxpxhSi8OrjNPzMjqO2/zOmOWCpTkUp30qeG7/7dQkMPGzH1xjs/26WLVuazOxo
         IPNhsUEXA/4UnYjEBblr59PoK7VzRkxl2A4SIsOs2+aZESpbonNU+BiRQkbb9elPif7e
         +wtdeAnl8SbqPqIh9lSCPs0olpnwAFmcIFXbNJrBTLfNlxW9mX4xFL9K8TRIhT69omCG
         6NEN9Qvgwun9a6PEoEx7ohPPmxYN+6xvqyTH36HUprKEwgvCh+zgHk7KWP3+H/Ueub+o
         Bfdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XH1GfjgGx1T+lc8m5zbu9NzNgidrGg/qrkIcskPP3lg=;
        b=L5wfOku3qZoABwg3eQmFyIAlsJufa0Z7XaC3nQ+wZmmEOedah8hVH2GndOAGl5o9EM
         qYHs7u3pTDp3PMIqkIN1Id6sEzNukf4kXwCDDoZLWjmO/dj1Cyn1zIjlt6Y44CHXcZI2
         T8PLh8TuzznFZh6Gkv4hYs/+DXBdqcMt86tD5KV72q6sH5AWtkAfz/X8106xbUHG7Fs3
         KbY3y8XyZIiICDIORDKhT84nTT2m0qg700Tvv8O2NlaJdVea8QMJPG40RZNDLWqjNGeJ
         L7ci48glHEFGNIETBaiww089BOGDHFcVVJYAYyZTWjGyh3c3oJbj8O3ex70+QDZN61TE
         BCIw==
X-Gm-Message-State: APjAAAWhZyhntqJ3eZZF5EXh9w+LPNvHVcd27nJMJLgMML6mSs6mQuiZ
        P/TT3ugRJjcwH/pGM1NMCIihCxWgjTm7OezJzbKRaQ==
X-Google-Smtp-Source: APXvYqxhJXi/F3ipLiFiLbE8vRwdOajqhxR1cdEYstacX/ZQq77w/50Qgi/Gz2Y6qQIGp2R8NpUOibqCti14EmnW6H8=
X-Received: by 2002:a2e:7d15:: with SMTP id y21mr18815651ljc.28.1568279993947;
 Thu, 12 Sep 2019 02:19:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190910152855.111588-1-paul.kocialkowski@bootlin.com> <20190910152855.111588-2-paul.kocialkowski@bootlin.com>
In-Reply-To: <20190910152855.111588-2-paul.kocialkowski@bootlin.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Sep 2019 10:19:42 +0100
Message-ID: <CACRpkdYrTCnrW6-28+RhdMZ4cB5VcqG6T-5aABvvEgiZ3iri2Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: gpio: Add binding document for xylon logicvc-gpio
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 10, 2019 at 4:29 PM Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:

> The Xylon LogiCVC display controller exports some GPIOs, which are
> exposed as a dedicated driver.
>
> This introduces the associated device-tree bindings documentation.
>
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
(...)
> +The controller exposes GPIOs from the display and power control registers,
> +which are mapped by the driver as follows:
> +- GPIO[4:0] (display control) mapped to index 0-4
> +- EN_BLIGHT (power control) mapped to index 5
> +- EN_VDD (power control) mapped to index 6
> +- EN_VEE (power control) mapped to index 7
> +- V_EN (power control) mapped to index 8

This should be reflected in the gpio-line-names in the example
and in your device trees.

Yours,
Linus Walleij
