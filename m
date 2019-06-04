Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C6CA352B8
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2019 00:30:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbfFDWaa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Jun 2019 18:30:30 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:41819 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726488AbfFDWa3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Jun 2019 18:30:29 -0400
Received: by mail-pg1-f193.google.com with SMTP id 83so4358019pgg.8
        for <linux-gpio@vger.kernel.org>; Tue, 04 Jun 2019 15:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LmDCNIRDhs7DNH9NPW4xy+8J+i5MZl5x+uVtCFZTa5g=;
        b=sxVPDH4yKTfJRPnVkbZ54wQ58ysVL1hfzaDD4ECK1ZYB3PTci6r3+sjVoj2lHmW1pA
         AxyVgqJ30L6RACIMF0z+XOHSpGmMpm7vxX09D6iqPUVhLzQ5pqTNJ1h+ASZHtuiOp4/3
         G2UROw7Iuy2bKZ0EuE+MyGB8C//LUGCveyBYXkkvxzoCg+bM/M8/PZPCq548R2ehAOj9
         3xhPO+FITtygmugNozKr3AKWahz91BWyY+TCRv5Ktmbo+9zR+xPjsGJkYOKz+5Kuiipr
         WuxcpjbIEfEN/zxdK91N2P/Ked7QePfxQ/jtygOfuYTR1y4ygVj4KmOVD6ce5eEoPuuw
         FPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LmDCNIRDhs7DNH9NPW4xy+8J+i5MZl5x+uVtCFZTa5g=;
        b=ujwSLAYbUEz9PoijGDUcW0d/+vOoFHJL4Ip4I3fLwf1pwso3L/baVS2T044oLfQo91
         542cLUiwWE91iBal4PFYh3gg5bBhuR/8mLrR5rX0aw3rRXxpLQYGP945LBdUu66op7Eq
         HDtDCusck90CSS9wgn7ULhTgRZueHqlucB0CuFQJ9gmYptISwC79Yt8i4uNZz0AfPwrt
         y9QE7FAK5IFmB/mo6XmNuU4Li4dTwUl+KQpIjp9k0uVAIbfO1nlKkLhHTtk7+Aq9K2YO
         b7L0QVuNHxwWgfTlUP5nx0+iBCbDRiWVR3O4SpxRfIC1xP2QjDLySvCqgamsv769hKCI
         O08w==
X-Gm-Message-State: APjAAAUjCzSYGdgxqJcb21SGHB6yr/nLvlXoWBsUSUSceuHi0rU/Hhk0
        YUdHnrXD2hEwSs4i2b2A2iV3gQ==
X-Google-Smtp-Source: APXvYqzTEUN7udbEF/IQ5S4vaSRT5SZ53qYu6Xq5+iodypdDvCByZtaq5dCbtg4MhJ1JM8f0B77mJg==
X-Received: by 2002:a17:90a:c38a:: with SMTP id h10mr37802679pjt.112.1559687428923;
        Tue, 04 Jun 2019 15:30:28 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id u5sm16516107pgp.19.2019.06.04.15.30.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jun 2019 15:30:27 -0700 (PDT)
Date:   Tue, 4 Jun 2019 15:30:25 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     "Bean Huo (beanhuo)" <beanhuo@micron.com>
Cc:     Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
Subject: Re: [EXT] [PATCH 2/3] scsi: ufs: Allow resetting the UFS device
Message-ID: <20190604223025.GD4814@minitux>
References: <20190604072001.9288-1-bjorn.andersson@linaro.org>
 <20190604072001.9288-3-bjorn.andersson@linaro.org>
 <BN7PR08MB568450B1EC51ABAA2E426AC0DB150@BN7PR08MB5684.namprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN7PR08MB568450B1EC51ABAA2E426AC0DB150@BN7PR08MB5684.namprd08.prod.outlook.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue 04 Jun 01:13 PDT 2019, Bean Huo (beanhuo) wrote:
> >@@ -6159,6 +6179,9 @@ static int ufshcd_reset_and_restore(struct ufs_hba
> >*hba)
> > 	int retries = MAX_HOST_RESET_RETRIES;
> >
> > 	do {
> >+		/* Reset the attached device */
> >+		ufshcd_device_reset(hba);
> >+
> 
> what's problem you met, and you should reset UFS device here? could you give more info?
> 
> It is true that we don't reset UFS device in case of device fatal error. According to UFS host spec,
> Host should be device reset except that in addition to resetting UIC. But as so far,
> We didn't experience any problems result from this missing reset.
> 
> We have three UFS device reset ways.  Comparing to this hardware reset, 
> I prefer to use DME_ENDPOINTRESET.req software reset.
> 

Hi Bean,

Thanks for your questions. With some memories we see issues establishing
the link during bootup, so that's the purpose of issuing this reset.

Unfortunately the downstream Qualcomm patch [1] (which I should have
remembered to attribute), does not mention why the reset during host
controller reset is needed - but I'm fairly certain that this scenario
would be similar to the handover from bootloader to kernel that we do
see an issue with.


[1] https://source.codeaurora.org/quic/la/kernel/msm-4.4/commit/?h=msm-4.4&id=0c82737188e2d63a08196e078e411032dbbc3b89

Regards,
Bjorn
