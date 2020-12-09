Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84F942D4571
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 16:31:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729702AbgLIPbS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 10:31:18 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:41441 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726555AbgLIPbS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 10:31:18 -0500
Received: by mail-lj1-f195.google.com with SMTP id f11so2838309ljm.8;
        Wed, 09 Dec 2020 07:31:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TGmJfop0poAU5I2zMh4LF9CytL92M/ZbRIts/6La8S8=;
        b=O+hro+BhSrULCa0sGCaEacrQbXV4ZoPAUHSb0wg+FM5ZsonOiBZGmDdt8+y8f2pLSO
         EqACZRogA8xsa9QGBPxRu0An79VRAmXhExcWlYkFcOxDhIzeGpHEILxYmJDBv7NRMmPZ
         WNBzbIdE9cO2OdL+oE904GUMk7mmlcxYxiNkP/noKHhallQ7lwYglXmVcmhzQcakuZ54
         0TUawDxAqYCexxl+TlTM7nRD3FHFnOPJHHP08vom7UziPaxTPOJo3ClkBUtzC7sP4UnD
         sM6R0bB5PZSZp/YxLSJgcrohHGyRDyl1Y3kR0GwalxSScpXlaK6vH1ThMTj0UOXAbcSt
         Q3zA==
X-Gm-Message-State: AOAM530MVrEty4fO+1c9lgBHECBZlmimYcD7flSOtckTY7dk5QUUOlY7
        0baIfWomZiyOOfCf27+TqwE=
X-Google-Smtp-Source: ABdhPJzvCEsXNgtdPAfi+q1QYxF873m6Him6AopB6fOxqG4qytxYpPRsRFLTa2231EvbJuGH7UnXWg==
X-Received: by 2002:a2e:88d6:: with SMTP id a22mr1323029ljk.150.1607527835523;
        Wed, 09 Dec 2020 07:30:35 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id b5sm206311lfg.13.2020.12.09.07.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 07:30:34 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kn1Qy-0005YD-7s; Wed, 09 Dec 2020 16:31:16 +0100
Date:   Wed, 9 Dec 2020 16:31:16 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Manivannan Sadhasivam <mani@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Johan Hovold <johan@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        patong.mxl@gmail.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Angelo Dureghello <angelo.dureghello@timesys.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v5 2/3] usb: serial: xr_serial: Add gpiochip support
Message-ID: <X9DtxFgrkFIUIzyv@localhost>
References: <20201122170822.21715-1-mani@kernel.org>
 <20201122170822.21715-3-mani@kernel.org>
 <CACRpkdbY-aZB1BAD=JkZAHA+OQvpH12AD3tLAp6Nf1hwr74s9A@mail.gmail.com>
 <X8ZmfbQp7/BGgxec@localhost>
 <CACRpkdZJdxqxUEQaKUHctHRSQAUpYZJtuxonwVd_ZFAsLBbKrA@mail.gmail.com>
 <X89OOUOG0x0SSxXA@localhost>
 <CACRpkdavm7GG8HdV1xk0W_b1EzUmvF0kKAGnp0u6t42NAWa9iA@mail.gmail.com>
 <20201208125250.GB9925@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201208125250.GB9925@work>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 08, 2020 at 06:22:50PM +0530, Manivannan Sadhasivam wrote:
> On Tue, Dec 08, 2020 at 01:41:52PM +0100, Linus Walleij wrote:
> > On Tue, Dec 8, 2020 at 10:57 AM Johan Hovold <johan@kernel.org> wrote:

> > I think if this driver already has unique line-names per-gpiochip
> > we could actually make it depend on !GPIO_SYSFS and
> > just add the names.
> 
> Sure thing.
> 
> Johan, if you are okay with this I can resubmit incorporating Linus's
> suggestion.

Let's wait a bit with adding the names.

That can possibly be done as a follow-up too even if removing GPIO_SYSFS
support later is not ideal in case that's the path chosen (we'd have a
similar problem with the existing USB-serial GPIO implementations though).

Johan
