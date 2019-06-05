Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B57C3577D
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2019 09:16:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726427AbfFEHQa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Jun 2019 03:16:30 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46663 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726501AbfFEHQ3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Jun 2019 03:16:29 -0400
Received: by mail-wr1-f66.google.com with SMTP id n4so13041095wrw.13
        for <linux-gpio@vger.kernel.org>; Wed, 05 Jun 2019 00:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=/udEs/DSMdBXnEwnuIqEjlT7x+xDAFJnL1HjRExEQQg=;
        b=NTnAK5ivPW3NG54ALQr84FAP98eLWpfAnjNwgSTdDWVGUCJkvoZXEngeyiP4i4Hryl
         f1ZlA4+MkIwHVHdjKQEFg3QYh9Gl3E4p6v33gY6ZggJi4RoGzA0gGHT7ugiy8EPzE8aN
         WZR6Wt3LVuGgVX9eVTPcUXgbnJ9dff5a1vIO0I419hlvZw0Vi355TEqqW4xa3I+WEIDy
         0+GnWVFOuj8bgxlEwuhbDeBAHD7UYmMNVtKNeJLrV71BUS+R/0Cr6jCsmRQAdGi+5aWi
         8Cds9Pqkx+w2WCyGQ6gUPTVKyNiaBfx8TH9Z9YqwBu8Fg8ZvF5w/FCQPtb5fmuW3NgTj
         VWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=/udEs/DSMdBXnEwnuIqEjlT7x+xDAFJnL1HjRExEQQg=;
        b=hBtPUX7DZFR0KjkpViQdvP4H+8ckbA52/0IasFl1t6ZmyQ0GRTdBh4n8CebBPQjpeA
         ugTJwOQhcLeEpkdHx3YP3ALejLR+5BCrCYTks7JbSGjvK+ali+RPkervQTN4BXHb+36B
         tPOJv05PRwUa9e2G7MU8NFOFC5onKOdvd1IDljhpomXkelaQPGRgPGkGoXsS5M8ICYkD
         yLC3+i57iG0KoTXg002oQx4DL6RmqniXhYE2EMKGzNVvhVqme+7UDMZ+it7lmnrVtAg9
         hivPzwSFtivb2keGAeNL0Cxj173qqTiVpRNR4g07ZmzZbxanG2AfdeDv7rlsubxrQoLS
         FQBA==
X-Gm-Message-State: APjAAAVXyE++7SRmUdJf+YnmxWx3FcWceysuptFwY2SuqLwUPG/s9333
        QB753rLt+elF7Ymzz8F422gy2Q==
X-Google-Smtp-Source: APXvYqz9H7lT0gna4wU5EGIQbyq1C5dGS8hnYYVP15tsLXumj2S8AkD0vyjdO6QW78jgPUlRMocRLg==
X-Received: by 2002:adf:db8e:: with SMTP id u14mr25254849wri.190.1559718987824;
        Wed, 05 Jun 2019 00:16:27 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id 67sm33163938wmd.38.2019.06.05.00.16.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jun 2019 00:16:27 -0700 (PDT)
Date:   Wed, 5 Jun 2019 08:16:25 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     alokc@codeaurora.org, kramasub@codeaurora.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        wsa+renesas@sang-engineering.com, linus.walleij@linaro.org,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        jlhugo@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/8] i2c: i2c-qcom-geni: Signify successful driver probe
Message-ID: <20190605071625.GK4797@dell>
References: <20190604104455.8877-1-lee.jones@linaro.org>
 <20190604104455.8877-2-lee.jones@linaro.org>
 <20190605062020.GL22737@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190605062020.GL22737@tuxbook-pro>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 04 Jun 2019, Bjorn Andersson wrote:

> On Tue 04 Jun 03:44 PDT 2019, Lee Jones wrote:
> 
> > The Qualcomm Geni I2C driver currently probes silently which can be
> > confusing when debugging potential issues.  Add a low level (INFO)
> > print when each I2C controller is successfully initially set-up.
> > 
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  drivers/i2c/busses/i2c-qcom-geni.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> > index 0fa93b448e8d..e27466d77767 100644
> > --- a/drivers/i2c/busses/i2c-qcom-geni.c
> > +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> > @@ -598,6 +598,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
> >  		return ret;
> >  	}
> >  
> > +	dev_info(&pdev->dev, "Geni-I2C adaptor successfully added\n");
> > +
> 
> I would prefer that we do not add such prints, as it would be to accept
> the downstream behaviour of spamming the log to the point where no one
> will ever look through it.

We should be able to find a middle ground.  Spamming the log with all
sorts of device specific information/debug is obviously not
constructive, but a single liner to advertise that an important
device/controller has been successfully initialised is more helpful
than it is hinderous.

This print was added due to the silent initialisation costing me
several hours of debugging ACPI device/driver code (albeit learning a
lot about ACPI as I go) just to find out that it was already doing the
right thing - just very quietly.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
