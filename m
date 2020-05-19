Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 323041D92F6
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2020 11:09:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726991AbgESJI7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 May 2020 05:08:59 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35590 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbgESJI7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 May 2020 05:08:59 -0400
Received: by mail-lj1-f196.google.com with SMTP id g4so12891011ljl.2;
        Tue, 19 May 2020 02:08:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xiI/2QpELAfEPK4120aiFmsf0pOoqkdkwGMn109PtZw=;
        b=q0WDAAtfr3kMy73LyGGBqna+41VW2WsZRnZdqjeUJMPvYmP+nx6YVLGpWm7feoNLUV
         qj6j+p5QA+fjKriSW/yV/daQi0EiL7U2uOkfJX6UVPBHmEVC5eMu1ajJHW6XTwKC4g0+
         U7rjNvLjuY2uyU1IwA3GqbrOzW2Uy5o29Y0e2jNZoUzkeRXmWu605L5It8p4PUiAmJg1
         SonASmPvEUBJlnc/iEyBn2kojnqJutzm7EYlw0kiDoYWPMJ1i+fv9nJQc7cLNFar4cOs
         d4yDd8pnSFH201DK0voh3LXCqV6tYqR44rxP5AzpAslo9WSEgmXV5cC4yx1lQIssJrai
         nzMA==
X-Gm-Message-State: AOAM532g7WkUQ4+hcC2zRiW3nyrsfhXvwZs72VuA93RRY7oVQNFAaQjk
        T6u4JdJgO7KQfnZxpDLPuCo=
X-Google-Smtp-Source: ABdhPJwIWR87RmvE2kNnZTkMBYdqnjzdIFQ6tkWYoYvaRJxpkDhoqsLt/Tgz+1V4uCm6Dz+BF3axmQ==
X-Received: by 2002:a05:651c:549:: with SMTP id q9mr13334606ljp.236.1589879335470;
        Tue, 19 May 2020 02:08:55 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id v126sm6236616lfa.50.2020.05.19.02.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 02:08:54 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jayF3-0001Yb-H8; Tue, 19 May 2020 11:08:53 +0200
Date:   Tue, 19 May 2020 11:08:53 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Manivannan Sadhasivam <mani@kernel.org>
Cc:     gregkh@linuxfoundation.org, johan@kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        patong.mxl@gmail.com, Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: serial: xr_serial: Add gpiochip support
Message-ID: <20200519090853.GC27787@localhost>
References: <20200428195651.6793-1-mani@kernel.org>
 <20200428195651.6793-3-mani@kernel.org>
 <20200429174727.GF6443@Mani-XPS-13-9360>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200429174727.GF6443@Mani-XPS-13-9360>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 29, 2020 at 11:17:27PM +0530, Manivannan Sadhasivam wrote:

> On Wed, Apr 29, 2020 at 01:26:51AM +0530, mani@kernel.org wrote:
> > From: Manivannan Sadhasivam <mani@kernel.org>
> > 
> > Add gpiochip support for Maxlinear/Exar USB to serial converter
> > for controlling the available gpios.
> > 
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: linux-gpio@vger.kernel.org
> > Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>

> >  static int xr_port_probe(struct usb_serial_port *port)
> >  {
> >  	struct usb_serial *serial = port->serial;
> > @@ -495,13 +678,14 @@ static int xr_port_probe(struct usb_serial_port *port)
> >  
> >  	usb_set_serial_port_data(port, port_priv);
> >  
> > -	return 0;
> > +	return xr_gpio_init(port);
> 
> Just realised that the gpiochip is registered for 2 interfaces exposed by
> this chip. This is due to the fact that this chip presents CDC-ACM model,
> so there are 2 interfaces (interrupt and bulk IN/OUT).
> 
> We shouldn't need gpiochip for interface 0. So what is the recommended way
> to filter that?

Your driver should only bind to the data interface, but also claim the
control interface (i.e. the reverse of what cdc-acm is doing).

This CDC model doesn't really fit the assumptions of usb-serial core,
but it might be doable. Try returning 1 from the attach callback for the
control interface so that core claims it but doesn't register a tty
device.

Johan
