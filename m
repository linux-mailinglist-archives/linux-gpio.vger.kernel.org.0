Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 187082D560C
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 10:05:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbgLJJEi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 04:04:38 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:44399 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725953AbgLJJEi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 04:04:38 -0500
Received: by mail-lf1-f66.google.com with SMTP id m25so7098020lfc.11;
        Thu, 10 Dec 2020 01:04:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3g/PlbOq96E099kgmLST992B1AZT0J96fn+u0TM9mng=;
        b=PWI0yePTw/E6TXKgfLwZ+qfbt4Ph3oukG81EdMMai5jEYP3FHikI39wwYNnVsiwFqT
         dJMLD2cmqZ1mRakIFlIl8R7MT3TOywvyTwZlUSg3tDRqFb5/1OvILi+EqwIcMXLMR605
         WSXGby6LscSJ1hl/mnnvDPRC68MxRIqB78cK3ZcXWlKJHq/Npv4nhOvpbKX1TriutAaZ
         C5nn+bLCCt9QTAsd6c3SmAdDkbLNJW96u+ypQSlStVmoGDsS15DCB8CTbVBM8af3uR3j
         oaC3sL/wW9tAT6VvWhaQ5FExTCbbjDcMat92uU/KsZbNO/XSNvmyn5D87q5FX9uwkxl/
         kXwg==
X-Gm-Message-State: AOAM530jV98ZBlqSkA8Uf2pCR1SLXNRDnZbPfUCFwlEx7yqCi9Aw1sK1
        35Vh1ZQNdlXTZt9iB6kPhFUxGm7GfclkyQ==
X-Google-Smtp-Source: ABdhPJzEKqC84s1D4PcuOfAAovvcwrOyiY4Y5N+Qozl9Z3CQbXNZ4/q49R6pR7R8PCmoCyWvh9EF2w==
X-Received: by 2002:a19:ecb:: with SMTP id 194mr1527898lfo.70.1607591035832;
        Thu, 10 Dec 2020 01:03:55 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id j20sm539444ljc.47.2020.12.10.01.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 01:03:55 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1knHsJ-0008A1-T6; Thu, 10 Dec 2020 10:04:36 +0100
Date:   Thu, 10 Dec 2020 10:04:35 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        patong.mxl@gmail.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Angelo Dureghello <angelo.dureghello@timesys.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v5 2/3] usb: serial: xr_serial: Add gpiochip support
Message-ID: <X9Hko/EkonmDx+Ay@localhost>
References: <20201122170822.21715-1-mani@kernel.org>
 <20201122170822.21715-3-mani@kernel.org>
 <CACRpkdbY-aZB1BAD=JkZAHA+OQvpH12AD3tLAp6Nf1hwr74s9A@mail.gmail.com>
 <X8ZmfbQp7/BGgxec@localhost>
 <CACRpkdZJdxqxUEQaKUHctHRSQAUpYZJtuxonwVd_ZFAsLBbKrA@mail.gmail.com>
 <X89OOUOG0x0SSxXA@localhost>
 <CACRpkdavm7GG8HdV1xk0W_b1EzUmvF0kKAGnp0u6t42NAWa9iA@mail.gmail.com>
 <X9DsWahl6UDwZwBn@localhost>
 <CACRpkdYm-j9QcK8hgNrC33KruWE17Q0F4+T=UanE7PCEZEtu6w@mail.gmail.com>
 <X9HiGaIzk4UaZG7i@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X9HiGaIzk4UaZG7i@localhost>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 10, 2020 at 09:53:45AM +0100, Johan Hovold wrote:
> On Wed, Dec 09, 2020 at 05:25:32PM +0100, Linus Walleij wrote:
> > On Wed, Dec 9, 2020 at 4:24 PM Johan Hovold <johan@kernel.org> wrote:

> > > So it sounds like there's nothing preventing per-chip-unique names in
> > > the rest of gpiolib and the new chardev interface then? Are the
> > > user-space libraries able to cope with it, etc?
> > 
> > Yes the documentation refers to libgpiod a very well maintained
> > library:
> > https://www.kernel.org/doc/html/latest/driver-api/gpio/using-gpio.html
> > https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/
> 
> Just did a super quick check and it seems libgpiod still assumes a flat
> name space. For example, gpiod_chip_find_line() returns only the first
> line found that matches a name. Shouldn't be impossible to extend, but
> just want to make sure this flat namespace assumption hasn't been to
> heavily relied upon.

That should have been gpiod_line_find() (which in turn uses the above
mentioned helper for per-chip lookups).

Johan
