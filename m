Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36A5F38748D
	for <lists+linux-gpio@lfdr.de>; Tue, 18 May 2021 11:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242344AbhERJD6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 May 2021 05:03:58 -0400
Received: from smtp-32-i2.italiaonline.it ([213.209.12.32]:49497 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1347641AbhERJD5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 18 May 2021 05:03:57 -0400
X-Greylist: delayed 306 seconds by postgrey-1.27 at vger.kernel.org; Tue, 18 May 2021 05:03:57 EDT
Received: from oxapps-11-062.iol.local ([10.101.8.72])
        by smtp-32.iol.local with ESMTPA
        id ivbalS4jHBc6YivbalyXMh; Tue, 18 May 2021 11:01:34 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1621328494; bh=dCjsQAfcFLyylyqtLv7TqgGQj6to6Y+JT7pvXc9F4+Q=;
        h=From;
        b=kRE7WFmZjbFYRkbvZWfGZLIz41Kg+Dd0HWB5UXKAdNI2gX6YCMkQTjVDGs2ckoIqR
         ULOO1CqfFgBT6ZZJi4iMTYmnfwx47/pJL2yJPgOMh3tmZfoS7augDcAR9JqhcWR3ey
         hRodECv1slQJ3cGE7D3f4lMVcT7fCoTj+KxeZczw+wJA11cgwQuvEq6czVDf77JHO/
         IzHrYgdAFniaI0kEvjar4fb4kEPRFHC09Cvs9oEIO9BqnwCBKXBnnnqSspflJ+7/bX
         +nzDFX4mKoREqDryLW18hfMRQoNb7SUhBdJ4p5Ygxfo08cDMvDtlWpUYZUYB4coH0/
         7FEISW99oEmUA==
X-CNFS-Analysis: v=2.4 cv=B6l8bMhM c=1 sm=1 tr=0 ts=60a3826e cx=a_exe
 a=ArCppHiS2LX9rvfu7+HyXQ==:117 a=C-c6dMTymFoA:10 a=IkcTkHD0fZMA:10
 a=vesc6bHxzc4A:10 a=2KMo9-giAAAA:8 a=KpX_iGQJn2wPZywkGhQA:9 a=QEXdDO2ut3YA:10
 a=UeCTMeHK7YUBiLmz_SX7:22
Date:   Tue, 18 May 2021 11:01:34 +0200 (CEST)
From:   Dario Binacchi <dariobin@libero.it>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-kernel@vger.kernel.org,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-omap@vger.kernel.org
Message-ID: <2040526232.153231.1621328494564@mail1.libero.it>
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
X-Originating-IP: 185.33.57.41
X-Originating-Client: open-xchange-appsuite
x-libjamsun: q/hUXHlUwh+9tn5dDm21/ongciy3C3ZO
x-libjamv: UVlXRZ3VyHE=
X-CMAE-Envelope: MS4xfNGA8rsVkMTJ+iguaKDKNS72UlJRmS33n9u1M6eJ5DOYVyJ3pHhfKSfAMjnvBoDZyPQTIV+f2j7wZPwLdHdYqPte0bB9v4HrktHeDkCvlzQha//OlGpV
 VMf+shAgq+/pJCW1v2jc/s9Kd3zVQrOC4DRcjnCr9C6xHVvvXy0qPiPgL0heiF7lv8p6hN4nFEIdTmz/EwDl5eLtDpEwmGv1CmcIr5lSLOlr87xVeStcT8Z4
 08DaytR0l4PVtiX5K8fyYoTKxvw5Qsb74dpa/1cqghLUqgcSINOxJiiVWqmC3BQkBubrvtiLRMybnLM+nuR5q38mFGYN+NlfLeIXTAAfdCuamejSxk7NA2nl
 4SGJJ5U2VPIMqet538yq0WIenOT0BtpCht4p7fDj1RE7DVprgw/04Iw1cZeWpRg7fl43HC7T1ROgEKZYhU/eDXY8sXPq5A==
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
> 
> Or if there is such a patch floating around, I was not in Cc :)

I'll add a documentation patch and CC you.

Thanks and regards,
Dario

> 
> Regards,
> 
> Tony
