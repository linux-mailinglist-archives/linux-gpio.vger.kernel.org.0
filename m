Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFAA435877
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2019 10:23:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726716AbfFEIXd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Jun 2019 04:23:33 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40862 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726700AbfFEIXc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Jun 2019 04:23:32 -0400
Received: by mail-wm1-f65.google.com with SMTP id v19so1281182wmj.5
        for <linux-gpio@vger.kernel.org>; Wed, 05 Jun 2019 01:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=KB8B36tEhg7g9/5o0/vbeuwsLyG7Xckc2xGFAP6zc6U=;
        b=UqEtGE+iGLEv5a8+dhYUt/TpItZVF7YutlO2qMc8O+pmYdpG03c90Q518SSLMajSWX
         f40/pwGMGtZCV4kbgbWm0h1VBrWAX3B+JhWGEJIOiQNTAxpC6a0767jdQXd2NJSczqCn
         Rs9t3jhO9MHLwTczbKWos+GUz2T/hyu1HSM1lGIRsKGEHcChMtA2FgZodaGlisIRYavh
         73kSTJkBWr2HxbeHeJcnCdjbOB6Pjxpscko+f36AOaVmL1y652yazuLNBrB8XoqUiqb2
         YrzeXXMfW0z4uJDCH9Px7WTFnuY7s4VmVe8yBfYOi4IiJpYCUjXKiUTI5F+B+Q1eyAVc
         Ts+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=KB8B36tEhg7g9/5o0/vbeuwsLyG7Xckc2xGFAP6zc6U=;
        b=C9Q6RLygITdwYCemUdx25gE87MtCW3ZI2fC0wYG+RpXIj5zYKPPQmI9mqvoi3BzWvX
         FrceIqRMHYSZFwDBSm/GbDXBPkwW8G6apllJ8iMY1TDgozr3TzctCajck+3nOjHDMkb+
         aVnTfz2HHJXYo3Pk+SqpuvTQnsHqFylj6FygyspMOEwYT/j4oMUpVDziKf+DIO+Vn0wO
         V86BFLtJCnvHG+ZQa+jQtgXMTs+OfltZpr7RpcxIx7u/g14mBjK5SSttWrMTbA47MOvP
         2J9k2M+KBa9FnulG7FkIKzqY/fGGmTTqWnNxw60d5RM3AbBjn+Rg5GXlcsxEPHo6NeFL
         BtZg==
X-Gm-Message-State: APjAAAW3sX5Pgm2RzC2JqRpsMFZZxpJbe63CCTdAskzE/IkKsm6BlauE
        XVR968ZUJhjQcQX8jFnUBKPYVg==
X-Google-Smtp-Source: APXvYqyn7r2Og6MqHzF9tB1GS7hQSk2g0XHprHTvLKG654EdQDiLEPjf16VyH9JzBnK035IC2hV9qw==
X-Received: by 2002:a1c:f311:: with SMTP id q17mr20555885wmq.2.1559723010516;
        Wed, 05 Jun 2019 01:23:30 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id d2sm14874801wmb.9.2019.06.05.01.23.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jun 2019 01:23:29 -0700 (PDT)
Date:   Wed, 5 Jun 2019 09:23:27 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>, balbi@kernel.org,
        wsa+renesas@sang-engineering.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Brown <david.brown@linaro.org>, alokc@codeaurora.org,
        kramasub@codeaurora.org, linux-i2c <linux-i2c@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <andy.gross@linaro.org>,
        Jeffrey Hugo <jlhugo@gmail.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/8] i2c: i2c-qcom-geni: Signify successful driver probe
Message-ID: <20190605082327.GN4797@dell>
References: <20190604104455.8877-1-lee.jones@linaro.org>
 <20190604104455.8877-2-lee.jones@linaro.org>
 <20190605062020.GL22737@tuxbook-pro>
 <20190605071625.GK4797@dell>
 <CAKv+Gu_YcdePUkkCGdP5DC9rxCUAshgOzU32pViAp2CbmAaJuw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKv+Gu_YcdePUkkCGdP5DC9rxCUAshgOzU32pViAp2CbmAaJuw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 05 Jun 2019, Ard Biesheuvel wrote:

> On Wed, 5 Jun 2019 at 09:16, Lee Jones <lee.jones@linaro.org> wrote:
> >
> > On Tue, 04 Jun 2019, Bjorn Andersson wrote:
> >
> > > On Tue 04 Jun 03:44 PDT 2019, Lee Jones wrote:
> > >
> > > > The Qualcomm Geni I2C driver currently probes silently which can be
> > > > confusing when debugging potential issues.  Add a low level (INFO)
> > > > print when each I2C controller is successfully initially set-up.
> > > >
> > > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > > > ---
> > > >  drivers/i2c/busses/i2c-qcom-geni.c | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> > > > index 0fa93b448e8d..e27466d77767 100644
> > > > --- a/drivers/i2c/busses/i2c-qcom-geni.c
> > > > +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> > > > @@ -598,6 +598,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
> > > >             return ret;
> > > >     }
> > > >
> > > > +   dev_info(&pdev->dev, "Geni-I2C adaptor successfully added\n");
> > > > +
> > >
> > > I would prefer that we do not add such prints, as it would be to accept
> > > the downstream behaviour of spamming the log to the point where no one
> > > will ever look through it.
> >
> > We should be able to find a middle ground.  Spamming the log with all
> > sorts of device specific information/debug is obviously not
> > constructive, but a single liner to advertise that an important
> > device/controller has been successfully initialised is more helpful
> > than it is hinderous.
> >
> > This print was added due to the silent initialisation costing me
> > several hours of debugging ACPI device/driver code (albeit learning a
> > lot about ACPI as I go) just to find out that it was already doing the
> > right thing - just very quietly.
> >
> 
> I agree.
> 
> There are numerous EHCI drivers IIRC which, if compiled in,
> unconditionally print some blurb, whether you have the hardware or
> not, which is pretty annoying.
> 
> In this case, however, having a single line per successfully probed
> device (containing the dev_name and perhaps the MMIO base address or
> some other identifying feature) is pretty useful, and shouldn't be
> regarded as log spamming imo. dev_info() honours the 'quiet' kernel
> command line parameter, and so you will only see the message if you
> actually look at the log.

+999

This is exactly as I see it.

If people want a quiet log/fast boot-up times, they can request it.
Otherwise, it's far more useful to trade a second or two for
important information such as which devices are present/enabled on a
platform.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
