Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB5893638C
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2019 20:49:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726555AbfFEStr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Jun 2019 14:49:47 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36932 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726527AbfFEStq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Jun 2019 14:49:46 -0400
Received: by mail-wr1-f66.google.com with SMTP id v14so2885488wrr.4
        for <linux-gpio@vger.kernel.org>; Wed, 05 Jun 2019 11:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Fydr1IvWkVkzid+Y2c9d9epjwSMwkXEoLpbPP3duu6g=;
        b=zEJKSGDwkWmja24SuoSG0/GhNWhVB0NTB6KUOwzuixKacNH1MkdRfN4Ngt3y+WLMIp
         aCslUK4+4CF+ThC7NaOvB/iDkL+mdKF6ADpoMFuAacdi1GWjlNthODar6mzp5s+624B5
         UJxRnfUVEAxMSwmyYJvZWzclwt4g+PnBkt8sLzIAHMbxtMLHqQiY6NU+d8LrhQvVXGml
         InXoilY3MNIXL9EzadAwsfRDIGqwassxHYJwNfyYYXvWUMW2oXkckkCbkK5YhyKnWT2j
         nj3kMf+BfiOEdBPcsCKgoq4ReonBmf6RqnkNxEt7WGQlzJnjd7cQcqo51U0stqXCzCSg
         mc4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Fydr1IvWkVkzid+Y2c9d9epjwSMwkXEoLpbPP3duu6g=;
        b=KQREz4tqFnF5K14LF5S360NoYUv6H+JAJCxjPg2Nv5sJNqX3rz3PG5wHY92lznrSrX
         qT1SQsCBwBTGRIZ8GaDSpPcjWOvFAJly4sPzJpMwuJeQ25mx6RRs8xk0ZPKSV9uuThbO
         nx82JyEd62OuKnSCnNPjXTWIOMzqPSphufVLdmMoUowym8SOyw3dYKVxL2sltiFJR8nt
         s2ehlrmbOMu+09gjq64+lwKV4n1AgeSQjvq3qIZiTam7ljpdb9wTTH2m8eWr2eU5kfMK
         KdRnBnFex4hAwwdRDkx3mSyz4AYR5Eue8jsSQkIjvZl/E3nHx4Qf9wQFTi1VuStAm9AH
         9PDw==
X-Gm-Message-State: APjAAAVP077I4Rrwjr72i9Vb0y/evHhOxkJV3CJqbkb1VKY0wPiVrLx7
        dcJY4TTvfZtDQF6u1+cfyVPaaQ==
X-Google-Smtp-Source: APXvYqw+35EWc3ZT4bKVc2X4aWO6Q+WjMsFs/vEImJQxHpwstz9A3Ta5/2macrjRvIUbwUzb8lHfGA==
X-Received: by 2002:adf:ea92:: with SMTP id s18mr3874120wrm.257.1559760583946;
        Wed, 05 Jun 2019 11:49:43 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id h200sm29965448wme.11.2019.06.05.11.49.42
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jun 2019 11:49:43 -0700 (PDT)
Date:   Wed, 5 Jun 2019 19:49:41 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Johan Hovold <johan@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>, balbi@kernel.org,
        wsa+renesas@sang-engineering.com, gregkh@linuxfoundation.org,
        linus.walleij@linaro.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, david.brown@linaro.org,
        alokc@codeaurora.org, kramasub@codeaurora.org,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, andy.gross@linaro.org,
        jlhugo@gmail.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/8] i2c: i2c-qcom-geni: Signify successful driver probe
Message-ID: <20190605184941.GU4797@dell>
References: <20190604104455.8877-1-lee.jones@linaro.org>
 <20190604104455.8877-2-lee.jones@linaro.org>
 <20190605062020.GL22737@tuxbook-pro>
 <20190605071625.GK4797@dell>
 <20190605075656.GC29637@localhost>
 <20190605082047.GM4797@dell>
 <20190605083353.GD29637@localhost>
 <20190605084921.GQ4797@dell>
 <20190605085527.GE29637@localhost>
 <20190605141812.GA962@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190605141812.GA962@kunai>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 05 Jun 2019, Wolfram Sang wrote:

> 
> > To enable dynamic debugging in driver core you could use something like
> > 
> > 	CONFIG_CMDLINE="dyndbg=\"func really_probe =p\""
> > 
> > That gives you two printouts per successful probe, for example:
> > 
> > 	bus: 'usb-serial': really_probe: probing driver edgeport_ti_1 with device ttyUSB0
> > 	bus: 'usb-serial': really_probe: bound device ttyUSB0 to driver edgeport_ti_1
> 
> I agree that this scales much better than adding strings to every
> driver. Also, the driver core will report failed probes other than
> -ENODEV, or?
> 
> Regarding this patch, however, I don't care much. I'll let the driver
> maintainers decide.

I've downgraded this to dev_dbg() in v2.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
