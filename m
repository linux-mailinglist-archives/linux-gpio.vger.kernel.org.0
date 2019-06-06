Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBEC036D2D
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2019 09:17:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbfFFHRn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Jun 2019 03:17:43 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43085 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbfFFHRn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Jun 2019 03:17:43 -0400
Received: by mail-pf1-f194.google.com with SMTP id i189so920498pfg.10
        for <linux-gpio@vger.kernel.org>; Thu, 06 Jun 2019 00:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hcWZk37MluweMWQW5kURRUWLOOrFjT2oPnVPPLPHyMo=;
        b=O3e+gR3QjxlY+TukOifhxUhwrU3NQR9N60NyUoUy2uHUzeQ5KzKmm22cgKDvq9AaJa
         HBGqpO0VEYMp0+DsxlKagVVxBG5mngX5vhbyuBCbFEc64bWcpGSZDbONnglt4HCdyMTT
         gAHr9JUL56oourAFBSHRUZ9hJubAKsm7DjmHYvMrHhbisgdNMH1KQPc6GjAxwEudVouO
         pIGF8m/RYSGkUtvnQN1fVj/L+5Vo8t7aUAykze+iK61/eKcNXTCaWI9ACCLz8IPMvXGu
         RYrFpq+7LQ5/u4AA76LNdgSRPpHxDsxfDMtgnN3FfsGb5M9viJKACY2o0B8cEH2hfUAa
         rbWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hcWZk37MluweMWQW5kURRUWLOOrFjT2oPnVPPLPHyMo=;
        b=rSWIYfxThf+NBLHsC5g63J/5pdb6EoSEg3ubMW2ywSvDTjchRsrF9usMZ4vYbDtbOn
         L4n/t3gH5eymEd6d4QCY75nJeCK3aVvjeoRK+sKTrW65H2l/apOYC9jJUYsDLnwyCw/5
         sCM2bm/ZhmXCn932vRe47NZwcVzhcfoIrCzgi1TinJQKMKbHoxLmrG/B5vsaECqwX+t/
         FESx1nzDegahYmbr84AJCH3ugkQPGKF2VTlKYWzYF7wNPHBsd32tSJrsJtLlgpzoDjNe
         0CXmj8bSue7YemAVyL8yaM5SPBBSxu+Q8JagZe2o2Q4oX+jn0duPFCuAbo6pAWdRdLaJ
         oi+w==
X-Gm-Message-State: APjAAAUgbccnZ/if4WYHMB3Sy69DzUtN8qcfI/LufzEyh3Q4twpsqpe3
        iG3O8SMbLBesnBSbrnw3K1b3zg==
X-Google-Smtp-Source: APXvYqwJj7EcN4AJ9SENmqHf4hWfVQH6OLhC5JBuOCIoK19YSarjdumJo7ny/lpvNb23GM0WxHXIZg==
X-Received: by 2002:a17:90a:3ae8:: with SMTP id b95mr13710133pjc.68.1559805462753;
        Thu, 06 Jun 2019 00:17:42 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b4sm1058689pfd.120.2019.06.06.00.17.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Jun 2019 00:17:42 -0700 (PDT)
Date:   Thu, 6 Jun 2019 00:18:28 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Avri Altman <Avri.Altman@wdc.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] scsi: ufs: Allow resetting the UFS device
Message-ID: <20190606071828.GS22737@tuxbook-pro>
References: <20190606010249.3538-1-bjorn.andersson@linaro.org>
 <20190606010249.3538-3-bjorn.andersson@linaro.org>
 <SN6PR04MB4925FC3F1001326AA218DF21FC170@SN6PR04MB4925.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN6PR04MB4925FC3F1001326AA218DF21FC170@SN6PR04MB4925.namprd04.prod.outlook.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed 05 Jun 23:36 PDT 2019, Avri Altman wrote:

> 
> >  static int ufshcd_hba_init(struct ufs_hba *hba)
> >  {
> >  	int err;
> > @@ -7425,9 +7460,15 @@ static int ufshcd_hba_init(struct ufs_hba *hba)
> >  	if (err)
> >  		goto out_disable_vreg;
> > 
> > +	err = ufshcd_init_device_reset(hba);
> > +	if (err)
> > +		goto out_disable_variant;
> > +
> >  	hba->is_powered = true;
> >  	goto out;
> > 
> > +out_disable_variant:
> > +	ufshcd_vops_setup_regulators(hba, false);
> Is this necessary?
> ufshcd_vops_setup_regulators() was just called as part of ufshcd_variant_hba_init
> 

Yes, so my attempt here is to reverse the enablement of the vops
regulators (hence passing false). But looking at it again I see that we
should also do ufshcd_vops_exit(), so the right thing to call here is
ufshcd_variant_hba_exit().

PS. This initialization sequence should really be rewritten to first
acquire all resources and then turn them on. This mixes init/setup
sequence is really hard to reason about.

Regards,
Bjorn
