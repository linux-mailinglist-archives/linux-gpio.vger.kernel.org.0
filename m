Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E481DE45D
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2019 08:16:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbfJUGQB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Oct 2019 02:16:01 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39304 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbfJUGQB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Oct 2019 02:16:01 -0400
Received: by mail-pf1-f196.google.com with SMTP id v4so7728843pff.6
        for <linux-gpio@vger.kernel.org>; Sun, 20 Oct 2019 23:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=z8AislL9bBizOL/3zmH/pFdDSRFzv2U9ezQYDPpf/uY=;
        b=eG9C2g2A4PaRfDjkuUYycqvHLpwFwwXFoIHPEJB4S4aqUilQqRiRg5/brU94N70PeD
         +XbbwDmqAiX+M0nZWiPdZ0r1qUm3xvVo2fsi3TL1IMD9cwuZdQeu1BhWWWD3vazDac0O
         z1Buvm/bypyjVu5q4P3no2LuGvFRpIYNywAetJM8+Gu75G5kIkeStD/j2p7kWv+r2ji8
         911oMY2QK9mqZi22+AJOBF/2NTC59N97cofnI1NMRIOMHtRMcTjpRrZRIzalyGpKHNhp
         Gzw/APURFJ/dMAvGQ7oXi5ITYR04qndf6BcxFQOZ1srgtVPMKwqf58nuZdyTkeaSD2O+
         FPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=z8AislL9bBizOL/3zmH/pFdDSRFzv2U9ezQYDPpf/uY=;
        b=e0NGZ8y0yv0I2cxqhSn9mt3Yjj1ej5ktyImaA/TYKrPQ9cKDMFEYScLG0LNJeByXKV
         8XRg0MG17Gi9D+AIgtXgBixhItDYvVR8o2JbQKWere81fEE5wIVD/Ukau0WEVpfe5VND
         8ifMI4OtgROL2R5aFMUKi1ApDZWsOuJ74AREgvees39fLXBqYPa9Qw9He2LzEfW9FR3n
         bLoBqbnRyWSHsuL6mrhvlkweH2qVXOfAL2/8UJT7+E1P0gZwSrA2Z3oHNwBnsJwrtgBT
         WKxlDMa6dNUeDxIuG0cMQ8+jv9c9VBV098PyV28Ghk2WmlGYIe4RoaI9XPGxODdvR0+B
         gpVQ==
X-Gm-Message-State: APjAAAXk9IsA2SizhuBOpuCfcEB1soca+6j6NKc5DEDZqZfx0PG1PYbe
        L1u5qc15DuVUkuAEiJGn1gf8
X-Google-Smtp-Source: APXvYqzq3YMDZBcNbZq7GPKnRRFgy2SO4k0a07WKf/88S3YXLlZv9fCcV5ut+NIOUDsG42YN1kRNVQ==
X-Received: by 2002:a63:ea48:: with SMTP id l8mr24258354pgk.160.1571638560579;
        Sun, 20 Oct 2019 23:16:00 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2405:204:700f:8db6:2442:890f:ac37:8127])
        by smtp.gmail.com with ESMTPSA id a13sm16828601pfg.10.2019.10.20.23.15.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Oct 2019 23:15:59 -0700 (PDT)
Date:   Mon, 21 Oct 2019 11:45:51 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-unisoc@lists.infradead.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: gpio: Add devicetree binding for RDA
 Micro GPIO controller
Message-ID: <20191021061551.GA12001@Mani-XPS-13-9360>
References: <20191015173026.9962-1-manivannan.sadhasivam@linaro.org>
 <20191015173026.9962-2-manivannan.sadhasivam@linaro.org>
 <CACRpkdY3OC675EjZ4PYhYxnk1XWh4EO-a3JJBha2rdBttySUNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdY3OC675EjZ4PYhYxnk1XWh4EO-a3JJBha2rdBttySUNQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Wed, Oct 16, 2019 at 02:27:44PM +0200, Linus Walleij wrote:
> On Tue, Oct 15, 2019 at 7:30 PM Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> 
> > Add YAML devicetree binding for RDA Micro GPIO controller.
> >
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> First: this looks awesome to me,
> 
> Second: since this is kind of a first... could we move the standard GPIOchip
> YAML business into a generic gpiochip .yaml file?
> 
> We currently only have pl061-gpio.yaml and this would duplicate a lot
> of the stuff from that yaml file.
> 
> If you look at how
> display/panel/panel-common.yaml
> is used from say
> display/panel/ti,nspire.yaml
> 
> Could we do something similar and lift out all the generics from
> gpio-pl061.yaml to
> gpio-common.yaml
> and reference that also in the new binding?
> 
> If it seems hard, tell me and I can take a stab at it.
> 

Eventhough I really want to help you here, I'm running out of time
(and you know why). Let's consider merging this, and I'll come back at
it later.

Thanks,
Mani

> Yours,
> Linus Walleij
