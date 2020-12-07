Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FBF42D1484
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 16:22:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725867AbgLGPTs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 10:19:48 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:35330 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbgLGPTs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2020 10:19:48 -0500
Received: by mail-lf1-f65.google.com with SMTP id a9so18633943lfh.2;
        Mon, 07 Dec 2020 07:19:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/d4yYvpK2xSoRvYeVyMB4NIPiLM0qkr1tclrLPCSHVo=;
        b=Gg+jEa2lx7I11okWk6pElSxzuxLxTUq1ILDV/BObJUP19hI55HY4+BWsKZRR82xcok
         DBSRWKuqC/Rx0oYuEavAFhjbLj1LfVOQZvcAlgDfmHq+N63Aymm+3z+7s7ZiJlkFAUR6
         +B6XyCErlEiDR8fITNRvHe+thvpZWcU5ZVCyrlpFbSI8sqyNwGTEboRkC4DPCABwIOku
         pHoOvJjMQFjY3Mr8o1y9koHdZdoSajmLptSPdCR0nGwImrbgTSf6CAZWHBosGXbATE1o
         atj+Luy/am9rx0iCzisivZcO08oz++zYT/XeFggUcbqQ4xlHnnmOD9wT2E+RP4xe43cB
         YaIg==
X-Gm-Message-State: AOAM530OrFkgEqusb05SiiQwj6GV2pUjLX5U+Aa1ciytwEeaY7yP5Xdd
        ZATy10IBVafRs7DamOuhTv61FdMFu8c3Rg==
X-Google-Smtp-Source: ABdhPJyFuIOa2xSLFQ4J+3+DDqDwZVtz8dVzC8i9GOFZcBWivwFL4lGpG8w8pw+/3K4aiooFTL3jhQ==
X-Received: by 2002:ac2:4c9a:: with SMTP id d26mr8578953lfl.427.1607354345663;
        Mon, 07 Dec 2020 07:19:05 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id l84sm663254lfd.75.2020.12.07.07.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 07:19:04 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kmIId-0003AE-PD; Mon, 07 Dec 2020 16:19:40 +0100
Date:   Mon, 7 Dec 2020 16:19:39 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel-team@android.com
Subject: Re: [PATCH 3/4] USB: serial: ftdi_sio: Log the CBUS GPIO validity
Message-ID: <X85IC5NvcWikXfZY@localhost>
References: <20201204164739.781812-1-maz@kernel.org>
 <20201204164739.781812-4-maz@kernel.org>
 <X848LXNv3GRmmSXA@localhost>
 <02b461244a33d5eb0620cfaa13c2b03e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02b461244a33d5eb0620cfaa13c2b03e@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 07, 2020 at 03:00:37PM +0000, Marc Zyngier wrote:
> On 2020-12-07 14:29, Johan Hovold wrote:
> > On Fri, Dec 04, 2020 at 04:47:38PM +0000, Marc Zyngier wrote:

> >> +	if (!bitmap_full(valid_mask, ngpios))
> >> +		dev_warn_once(&port->dev, "Consider using a tool such as ftx-prog 
> >> to enable GPIOs if required\n");
> >> +
> > 
> > And again, this is not something that belongs in the logs of just about
> > every system with an attached ftdi device.
> 
> Fine by me, this patch can be dropped without issue. After all,
> I now know how to deal with these chips.
> 
> > While not possible to combine with the valid_mask approach, this is
> > something which we could otherwise add to the request() callback for 
> > the
> > first request that fails due to the mux configuration.
> 
> That was Linus' initial suggestion. But I think a consistent user
> API is more important than free advise in the kernel log.

I tend to agree. So since your valid-mask approach clearly has some
merit in that it marks the lines in use when using the new cdev
interface, perhaps we should stick with that.

Johan
