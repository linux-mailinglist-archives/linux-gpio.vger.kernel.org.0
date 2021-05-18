Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE7C738813E
	for <lists+linux-gpio@lfdr.de>; Tue, 18 May 2021 22:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236273AbhERUUq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 May 2021 16:20:46 -0400
Received: from smtp-16-i2.italiaonline.it ([213.209.12.16]:45327 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236400AbhERUUp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 18 May 2021 16:20:45 -0400
Received: from oxapps-35-162.iol.local ([10.101.8.208])
        by smtp-16.iol.local with ESMTPA
        id j6BYlAGVOf2ANj6BYlp5F5; Tue, 18 May 2021 22:19:25 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1621369165; bh=XVkFxo7ZKGNtFNrYhiClXGixHnfMmxA8+YV87zyDpmA=;
        h=From;
        b=VqSY8/2wMIs+fZtNamtICQJHs1qOYzAszVobwZKjrNm89NBDOB+mhiB9EGDjwnRqF
         d6Jz3d2bD3eIQpA5e/6lA53MGX8fOIiaEvY+5vMyh19ap7QXGne4wkTUsADTYIt4Ti
         9a5U77elb1KnZHPUpK/3xcypD9XvRXmMmQhoRdNfU4VyCwEoFhBqspUBiHn1wlx4+J
         gFgwArH+lXL4hzbCCXsJWEvtw7LMmzZ1Uw0+gg7o4z8SfolIuCjTnula19ZK0dFSr/
         YNhlsnaYCIFrmHKmPrKFsPcnJHLddbsPHs8r4RtV4f7nIxXzjO1AmNFozhZlJobQjr
         cv8Q0HBK59yZQ==
X-CNFS-Analysis: v=2.4 cv=Adt0o1bG c=1 sm=1 tr=0 ts=60a4214d cx=a_exe
 a=OCAZjQWm+uh9gf1btJle/A==:117 a=VYA5D5F8Gk0A:10 a=IkcTkHD0fZMA:10
 a=4ehuGOvBq5EA:10 a=2KMo9-giAAAA:8 a=KpX_iGQJn2wPZywkGhQA:9 a=QEXdDO2ut3YA:10
 a=UeCTMeHK7YUBiLmz_SX7:22
Date:   Tue, 18 May 2021 22:19:24 +0200 (CEST)
From:   Dario Binacchi <dariobin@libero.it>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-kernel@vger.kernel.org,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-omap@vger.kernel.org
Message-ID: <1573333464.184266.1621369164919@mail1.libero.it>
In-Reply-To: <YKNZ0A7umnk4LwKU@atomide.com>
References: <20210514163818.12178-1-dariobin@libero.it>
 <YKNZ0A7umnk4LwKU@atomide.com>
Subject: Re: [PATCH] pinctrl: single: config: enable the pin's input
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.3-Rev34
X-Originating-IP: 95.244.94.151
X-Originating-Client: open-xchange-appsuite
x-libjamsun: u3Vr1NmJGlSn2wGsKv1MD0oU2EQpEehm
x-libjamv: GvOt3+Fyat8=
X-CMAE-Envelope: MS4xfCUfRbZ4GNf2gdmc2/DrsRAzGKXJfN+R5Xa8rxeRTbEqPTtIjK0l9tqEPcDdHPTZfmCRA2nCSXsGSDS94vTFbGf5atyRU2de+0BQ/aE8AhRb75fceVdV
 1h4+22o9rTeNaII+CWVhKrxiCfuc/2Y3AsRnOwcyoFi1wtPV3ydjjezTECspprFN93E5hvsIrEl+GAzUTVplqi2qnRLBP5Ew7Ny6qLKAiadO0KC073cJoMxv
 LN+ZDEvrG8GeRFZoU2S4S60+D31DTcAWEJvcPwRT9pSi6asFuD9MlTro75Jf+in6+L7bVSfvAsc2ABN7eIfNAF8Le147MiemA/PpIu7NtQTvKntar1rNrDf5
 rxIJrrXLn5Sfnfc1w9mSKkzxxIDEI1Bm+uUbeV0GraSmJV2GFi1uzH56G1Grm5LfQR7HUJSMMZ4ccNmS54X4ZJQO3quDlg==
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Tony,

> Il 18/05/2021 08:08 Tony Lindgren <tony@atomide.com> ha scritto:
> 
>  
> * Dario Binacchi <dariobin@libero.it> [210514 16:38]:
> > It enables / disables the input buffer. As explained in the description
> > of 'enum pin_config_param' this does not affect the pin's ability to
> > drive output.
> > 
> > Signed-off-by: Dario Binacchi <dariobin@libero.it>
> > ---
> > 
> >  drivers/pinctrl/pinctrl-single.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
> > index 2c9c9835f375..4e7cdb9ee855 100644
> > --- a/drivers/pinctrl/pinctrl-single.c
> > +++ b/drivers/pinctrl/pinctrl-single.c
> > @@ -534,6 +534,7 @@ static int pcs_pinconf_get(struct pinctrl_dev *pctldev,
> >  		case PIN_CONFIG_DRIVE_STRENGTH:
> >  		case PIN_CONFIG_SLEW_RATE:
> >  		case PIN_CONFIG_MODE_LOW_POWER:
> > +		case PIN_CONFIG_INPUT_ENABLE:
> >  		default:
> >  			*config = data;
> >  			break;
> > @@ -572,6 +573,7 @@ static int pcs_pinconf_set(struct pinctrl_dev *pctldev,
> >  			case PIN_CONFIG_DRIVE_STRENGTH:
> >  			case PIN_CONFIG_SLEW_RATE:
> >  			case PIN_CONFIG_MODE_LOW_POWER:
> > +			case PIN_CONFIG_INPUT_ENABLE:
> >  				shift = ffs(func->conf[i].mask) - 1;
> >  				data &= ~func->conf[i].mask;
> >  				data |= (arg << shift) & func->conf[i].mask;
> > @@ -918,6 +920,7 @@ static int pcs_parse_pinconf(struct pcs_device *pcs, struct device_node *np,
> >  	static const struct pcs_conf_type prop2[] = {
> >  		{ "pinctrl-single,drive-strength", PIN_CONFIG_DRIVE_STRENGTH, },
> >  		{ "pinctrl-single,slew-rate", PIN_CONFIG_SLEW_RATE, },
> > +		{ "pinctrl-single,input-enable", PIN_CONFIG_INPUT_ENABLE, },
> >  		{ "pinctrl-single,input-schmitt", PIN_CONFIG_INPUT_SCHMITT, },
> >  		{ "pinctrl-single,low-power-mode", PIN_CONFIG_MODE_LOW_POWER, },
> >  	};
> 
> Looks OK to me if this works for Linus W. You need another patch to
> update the binding though:
> 
> Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml

I think the Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml file 
does not need to be updated. 
The 'input-enable' property is already documented.

Thanks and regards,
Dario
> 
> Or if there is such a patch floating around, I was not in Cc :)
> 
> Regards,
> 
> Tony
