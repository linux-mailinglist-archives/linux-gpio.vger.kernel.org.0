Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F28C3528E
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2019 00:09:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbfFDWJO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Jun 2019 18:09:14 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44466 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726399AbfFDWJO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Jun 2019 18:09:14 -0400
Received: by mail-pf1-f193.google.com with SMTP id t16so4704520pfe.11
        for <linux-gpio@vger.kernel.org>; Tue, 04 Jun 2019 15:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NGFWos9reZ21x+VPBWgjaST/llqX50Psvr0VLnDsejc=;
        b=LE3OjEH9gGdSD8HL7lZl/oU8JB8AiXuo0O9VefLwxFSrPzWA63vjBLqujXKByi2zHo
         EW8hrmDGrAVo+1FFiSO6D5l8GqZo+xaiPL1i23DAlGDzelL9ldMHJRRlsPlN26HhXZMV
         marf4yM/9clcphCztYfcrrJf4Y24XL4i4DvoBEx8Ibsvm+H7Bx90Gabs8cniguI8L5GN
         fKo/ejDhrSjivqMZcnaALrq0d8EiuYc5zsOdh+OE+P/9NWv9URNwckpzMLR0lmlAkZc+
         Qa5arISvb2yhpPXSTDY1s81jbncFzBIsZHb7kBrmj23EXebMO+H86+TiLegdgtF7xF3A
         iHOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NGFWos9reZ21x+VPBWgjaST/llqX50Psvr0VLnDsejc=;
        b=H1JwEWuWGNJb+d6Q7U2ab7zDJCCVHaBlGgjPdi7SUXsfGSW/M9Jbu7KDaW5S4xsNkO
         MnLcodMZ+joM3km8yYhr5+mWj4LpTavjbsvfxKwc8LEuNmsr6Qw1axyxkA9YqJGIasU9
         lJeh3xGANB1JtCryYTxCrEU1flvV1vmCrPJugEXnQCchHMP5tfXRIudWQx/vv8W4PzfV
         oGcHTdAaKRhIBgnnxsHmaAKP736d49pL/OqSFSqNO+IXntuiWLmHsiE4cI2OYXv9Cacv
         SdLf2su/+EgrJys0gA/ZDKUi13otECY5wg/QpwaCPfyDNn2dUlB3sI5wCKnunVZR5P/2
         +vLQ==
X-Gm-Message-State: APjAAAV9eDFbHLxKHrC0jtrFKinQnx+gW3U+/hN7EzT1iJE2aPm6rVAr
        cGzQQYgUYjYjT/6c8tUGHfUe7A==
X-Google-Smtp-Source: APXvYqz0k3aXvYp9vPgvRV/jmmcqPdGm62iQvQ+8caZbKxT6w3UTp/yE1RNEnvkaFlsMacIaHCfcaQ==
X-Received: by 2002:a62:2bc7:: with SMTP id r190mr5307624pfr.40.1559686153100;
        Tue, 04 Jun 2019 15:09:13 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j20sm15469801pff.183.2019.06.04.15.09.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jun 2019 15:09:12 -0700 (PDT)
Date:   Tue, 4 Jun 2019 15:09:10 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, Evan Green <evgreen@chromium.org>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sdm845-mtp: Specify UFS
 device-reset GPIO
Message-ID: <20190604220910.GA4814@minitux>
References: <20190604072001.9288-1-bjorn.andersson@linaro.org>
 <20190604072001.9288-4-bjorn.andersson@linaro.org>
 <5cf69ad2.1c69fb81.216a9.30f8@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5cf69ad2.1c69fb81.216a9.30f8@mx.google.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue 04 Jun 09:22 PDT 2019, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2019-06-04 00:20:01)
> > Specify the UFS device-reset gpio, so that the controller will issue a
> > reset of the UFS device.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> > index 2e78638eb73b..d116a0956a9c 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> > +++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> > @@ -388,6 +388,8 @@
> >  &ufs_mem_hc {
> >         status = "okay";
> >  
> > +       device-reset-gpios = <&tlmm 150 GPIO_ACTIVE_LOW>;
> > +
> 
> We had to do something similar on one particular brand of UFS that we had. I
> think it was an SK Hynix part that had trouble and wouldn't provision properly.
> Either way, we did this with a pinctrl toggle in the DTS where the "init" state
> has the UFS_RESET pin asserted and then "default" state has the pin deasserted.
> That was good enough to make this work.
> 

Thanks for pointing this out, I forgot to attribute these downstream
changes. I can see how this works, but I must say I find it quite
hackish.

The downstream solution seems to have evolved this into naming these
states and jumping between them (with the appropriate sleeps) during a
host reset as well.


But thanks for the confirmation that there's more than John's memory
that needs this.

Regards,
Bjorn

> 	&ufs_mem_hc {
> 		pinctrl-names = "init", "default";
> 		pinctrl-0 = <&ufs_dev_reset_assert>;
> 		pinctrl-1 = <&ufs_dev_reset_deassert>;
> 	};
> 
>         ufs_dev_reset_assert: ufs_dev_reset_assert {
>                 config {
>                         pins = "ufs_reset";
>                         bias-pull-down;         /* default: pull down */
>                         drive-strength = <8>;   /* default: 3.1 mA */
>                         output-low; /* active low reset */
>                 };
>         };
> 
>         ufs_dev_reset_deassert: ufs_dev_reset_deassert {
>                 config {
>                         pins = "ufs_reset";
>                         bias-pull-down;         /* default: pull down */
>                         drive-strength = <8>;
>                         output-high; /* active low reset */
>                 };
>         };
