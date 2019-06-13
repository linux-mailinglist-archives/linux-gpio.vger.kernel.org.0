Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD24443F26
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2019 17:55:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731561AbfFMPzR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Jun 2019 11:55:17 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39697 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731555AbfFMIw6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Jun 2019 04:52:58 -0400
Received: by mail-wm1-f65.google.com with SMTP id z23so9200731wma.4
        for <linux-gpio@vger.kernel.org>; Thu, 13 Jun 2019 01:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Lcs2ag+JWd9LLpjNoidl6yxCYy5aNsRikxLQuGKzVzU=;
        b=aThNGW7+I2PxRdhTNPV1LIhF0/5UJHVr6LSBQpWYfs9mymFpbdG0+eLwcuD+s8sSB5
         CHOJAEAIZTXTkJqs/TqV6VH1/6I6+rikSUTduZJCk79S8Hk9UfkJ1XfHzjMkHtKZs0tK
         ZlBBsvvs+mVji5Lwc21wIDSZNvTHmP3HB49j6W+heCALno3MD9xs+WEpPpN3zFjxXiOW
         O7iuKmnGS4AljVYDGrYPvT2Yi9OBB+FCXpttSSbyOBt8OTsYQ0IUGeJVZnFrz6QJFn6Q
         s8LeaL9BzwtyyXFLkJGfTsRJTTnS+kmZHtYyXuE97oWxfqxjy0Dx5PgKSMOvcQF8yleU
         B1qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Lcs2ag+JWd9LLpjNoidl6yxCYy5aNsRikxLQuGKzVzU=;
        b=qGN8hc+ILHSA7cUh9Y44aQVIYMkOj6moXzUULUlKcQcL/dMBqXTy+E43R+b9cuyImV
         GO9BVUuylPiJpFTUalVRdl7Tua0puajfo79Vk1DHc74AzpPYB6lMJEIPXjGrzxQNSzKH
         r+L+pONHhyhsaiUzF9d9IQPxuD/mfZBXw8MazCrfV4ZxtNdorndZQGMx9viUrcwM27wy
         XTDCVmLcGSvQkg3Bbl4Ws65Zsu8q6Ee3Kuy//62UjBMsNkhgqsSy2kSFDYS80JZK3GJ8
         ZDMBbZRThVkSHsl5dgcvPP0lm/BSK1/4bSQzsgrpqFHq16QrqXTf7UiWooLnr0g9kGFo
         ZsDQ==
X-Gm-Message-State: APjAAAVfdbd+66xsuWKyZKV3qnoTtZChZTWOkBdEIbbon6OZA+1zVXSm
        Y6cNWFQp0zb4k0+F6hcD850FXg==
X-Google-Smtp-Source: APXvYqybK0Nj/fHviz/pGDZHrRpbNts9oH2DSs1lQLgmXDT7aDSFDqouW7z3b4vqEk65dYuSlWyFoA==
X-Received: by 2002:a7b:c776:: with SMTP id x22mr2668542wmk.55.1560415976540;
        Thu, 13 Jun 2019 01:52:56 -0700 (PDT)
Received: from dell ([2.27.35.243])
        by smtp.gmail.com with ESMTPSA id c5sm1837184wma.19.2019.06.13.01.52.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 01:52:56 -0700 (PDT)
Date:   Thu, 13 Jun 2019 09:52:54 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     alokc@codeaurora.org, andy.gross@linaro.org,
        david.brown@linaro.org, wsa+renesas@sang-engineering.com,
        bjorn.andersson@linaro.org, linus.walleij@linaro.org,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        ard.biesheuvel@linaro.org, jlhugo@gmail.com,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/8] i2c: i2c-qcom-geni: Provide support for ACPI
Message-ID: <20190613085254.GA16364@dell>
References: <20190610084213.1052-1-lee.jones@linaro.org>
 <20190612103453.ccet2pneairnlpcc@ninjato>
 <20190612104011.GA4660@dell>
 <20190612104459.gvji3qxym5s4odfq@ninjato>
 <20190613085204.GF4660@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190613085204.GF4660@dell>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 13 Jun 2019, Lee Jones wrote:

> On Wed, 12 Jun 2019, Wolfram Sang wrote:
> 
> > 
> > > There are no cross-subsystem build dependencies on any of these
> > > patches.  The only reason they are bundled together in the same
> > > patch-set is for cross-subsystem visibility and understanding.
> > > 
> > > There is wide interest in these devices.
> > 
> > I see. That would have been a great cover-letter, Lee ;) Thanks for the
> > heads up!
> 
> :)
> 
> > > > Also, the current maintainer entry for this driver looks like:
> > > > 
> > > > drivers/i2c/busses/i2c-qcom-geni.c:
> > > >         Andy Gross <agross@kernel.org> (maintainer:ARM/QUALCOMM SUPPORT)
> > > >         David Brown <david.brown@linaro.org> (maintainer:ARM/QUALCOMM SUPPORT)
> > > >         Alok Chauhan <alokc@codeaurora.org> (supporter:QUALCOMM GENERIC INTERFACE I2C DRIVER)
> > > > 
> > > > I didn't hear from those people yet, would be great to have their acks.
> > > 
> > > I will see if I can rouse them from their slumber.
> > 
> > Please do. If they are not to reach, we probably need to update the
> > entry...
> 
> I contacted both of them.
> 
>  Andy doesn't touch anything that isn't QUP based (8994 and older).
> 
>  David doesn't deal with MSM platforms if Andy is available. 
> 
> So I guess the decision is yours.  Seeing at this patch is pretty
> trivial and has our ACPI expert's Ack, the decision shouldn't be a
> difficult one.

BTW, v4 has collected Acks and a cover-letter. :)

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
