Return-Path: <linux-gpio+bounces-10534-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E79D988F46
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Sep 2024 14:52:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FDD61C20BC4
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Sep 2024 12:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 137A1187874;
	Sat, 28 Sep 2024 12:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NkGQkPs7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D8F1DFF7;
	Sat, 28 Sep 2024 12:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727527949; cv=none; b=XBubpen5lkLN8WQQ0/4ZOMQtbGgUu7r24Qp/PSNnU9RHtWh6Y7zusiiDZR58DNyv0xWKk3NTD8oDH3Dgt9l9doJrn2AFc5gBBHMttZdM5TnPCj2LD0PgabjMOn9UgqhK+Lk91MuEHxF7zPPa2jFHoe1GuhjZfY0K8cLXmfhiw+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727527949; c=relaxed/simple;
	bh=H5ibH/r4YFnOCG32zsle3EVBJw2lq2in0PRpXUiecxs=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=juDTYWd2zFD2jV7I9qJUdntcrIR/JEp6nV5rwkCde+EK+QxwHq12cqMZCAEVkYXNi8Sptjq1d46TXM2iOH30M00SRqFMfxTX0JyFCexB5y5Ud6oxFpHYJWaWLVFId98YKh8VBVuOKOi+UjPSmy9iP3+rNX0nmvMeJCa/LSwRYJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NkGQkPs7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48SBQr51014204;
	Sat, 28 Sep 2024 12:52:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wNNSvZVRPc0+vE/TtgxNZ33a
	fzOq2PwUdP45a/DwAak=; b=NkGQkPs79GMyb/jadifOqo8EZ3oabVFS2DbCooYh
	hZeIgOcCcSBIFd7EQ3S+8vweODX9wbTrYsE5leGAebNqVFHuiC70k8ojJMYUhs3Z
	yXSprADUFio/GpozsFBFcRWs0GyN2Ci78Pbk62kEsjOew1Ooz4h6rnuwE51SOS4W
	5dmDpv6PpKd3Wds5uqa5DPu7CCsVc5iPYu76XWAS7Xm4qKRUN1oivM4Z8K4hQhld
	GMWUxvxH7z46bIbcj5OvVUt/NEvnTioN7rAYUzCOC7iUjGEVSsFubcI4LUMcSxPA
	QLhiS7gEBiL/NhsdbLyHQ5+BvCGrh6FegAAEnEVz+9mNoA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41xajf8ky0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 28 Sep 2024 12:52:25 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48SCqO7m025805
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 28 Sep 2024 12:52:24 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sat, 28 Sep 2024 05:52:22 -0700
Date: Sat, 28 Sep 2024 18:22:08 +0530
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: Wasim Nazir <quic_wasimn@quicinc.com>
CC: Linus Walleij <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] pinmux: Use sequential access to access desc->pinmux
 data
Message-ID: <Zvf7+Ll7sIwiYVsv@hu-mojha-hyd.qualcomm.com>
References: <20240927174206.602651-1-quic_mojha@quicinc.com>
 <20240927174206.602651-1-quic_mojha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240927174206.602651-1-quic_mojha@quicinc.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: __kLfjYYh9th95zXrweMj0akW-4jErIN
X-Proofpoint-ORIG-GUID: __kLfjYYh9th95zXrweMj0akW-4jErIN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409280097

On Sat, Sep 28, 2024 at 01:57:41AM +0530, Wasim Nazir wrote:

Hi Wasim,

Thanks for the review, there looks to be problem with your email client
while replying, please fix.

Please find my reply inline..

> From: Mukesh Ojha <quic_mojha@quicinc.com>
> 
> When two client of the same gpio call pinctrl_select_state() for the
> same functionality, we are seeing NULL pointer issue while accessing
> desc->mux_owner.
> 
> Let's say two processes A, B executing in pin_request() for the same pin
> and process A updates the desc->mux_usecount but not yet updated the
> desc->mux_owner while process B see the desc->mux_usecount which got
> updated by A path and further executes strcmp and while accessing
> desc->mux_owner it crashes with NULL pointer.
> 
> Serialize the access to mux related setting with a spin lock.
> 
> 	cpu0 (process A)			cpu1(process B)
> 
> pinctrl_select_state() {		  pinctrl_select_state() {
>   pin_request() {				pin_request() {
>   ...
> 						 ....
>     } else {
>          desc->mux_usecount++;
>     						desc->mux_usecount && strcmp(desc->mux_owner, owner)) {
> 
>          if (desc->mux_usecount > 1)
>                return 0;
>          desc->mux_owner = owner;
> 
>   }						}
> 
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---
> Changes in v2:
>  - Used scoped_guard and renamed lock name as per suggestion from Linus.W .
> 
>  drivers/pinctrl/core.c   |   3 +
>  drivers/pinctrl/core.h   |   2 +
>  drivers/pinctrl/pinmux.c | 150 +++++++++++++++++++++------------------
>  3 files changed, 86 insertions(+), 69 deletions(-)
> 
> diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
> index 4061890a1748..b00911421cf5 100644
> --- a/drivers/pinctrl/core.c
> +++ b/drivers/pinctrl/core.c
> @@ -220,6 +220,9 @@ static int pinctrl_register_one_pin(struct pinctrl_dev *pctldev,
>  
>  	/* Set owner */
>  	pindesc->pctldev = pctldev;
> +#ifdef CONFIG_PINMUX
> +	spin_lock_init(&pindesc->mux_lock);
> +#endif
>  
>  	/* Copy basic pin info */
>  	if (pin->name) {
> diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
> index 4e07707d2435..179e01dfacc2 100644
> --- a/drivers/pinctrl/core.h
> +++ b/drivers/pinctrl/core.h
> @@ -12,6 +12,7 @@
>  #include <linux/list.h>
>  #include <linux/mutex.h>
>  #include <linux/radix-tree.h>
> +#include <linux/spinlock.h>
>  #include <linux/types.h>
>  
>  #include <linux/pinctrl/machine.h>
> @@ -177,6 +178,7 @@ struct pin_desc {
>  	const char *mux_owner;
>  	const struct pinctrl_setting_mux *mux_setting;
>  	const char *gpio_owner;
> +	spinlock_t mux_lock;
>  #endif
>  };
>  
> diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
> index 02033ea1c643..e4d535aabbb6 100644
> --- a/drivers/pinctrl/pinmux.c
> +++ b/drivers/pinctrl/pinmux.c
> @@ -14,6 +14,7 @@
>  
>  #include <linux/array_size.h>
>  #include <linux/ctype.h>
> +#include <linux/cleanup.h>
>  #include <linux/debugfs.h>
>  #include <linux/device.h>
>  #include <linux/err.h>
> @@ -127,29 +128,31 @@ static int pin_request(struct pinctrl_dev *pctldev,
>  	dev_dbg(pctldev->dev, "request pin %d (%s) for %s\n",
>  		pin, desc->name, owner);
>  
> -	if ((!gpio_range || ops->strict) &&
> -	    desc->mux_usecount && strcmp(desc->mux_owner, owner)) {
> -		dev_err(pctldev->dev,
> -			"pin %s already requested by %s; cannot claim for %s\n",
> -			desc->name, desc->mux_owner, owner);
> -		goto out;
> -	}
> +	scoped_guard(spinlock_irqsave, &desc->mux_lock) {
> > Any reason to use spinlock_irqsave and not mutex ? If spinlock is needed
> > can we guard only the mux variables and exclude the printk
> > as the same lock is used with pin_show API too.

Good point, using spinlock_irqsave can make things worse and this can
stuck while writing log to console.

I remember now, why i did this,
v3: https://lore.kernel.org/lkml/20231225082305.12343-1-quic_aiquny@quicinc.com/

Later same patch in v4 was causing sleep while atomic issue.,
https://lore.kernel.org/lkml/8376074.NyiUUSuA9g@steina-w/

I better be correcting this to mutex here, should also have to increase
the range of this lock to cover mux-setting as well.
> 
> > Moreover, is the mux_usecount variable in pinmux_can_be_used_for_gpio()
> > needed guarding ?

It's a miss, thanks.,

> +		if ((!gpio_range || ops->strict) &&
> +		     desc->mux_usecount && strcmp(desc->mux_owner, owner)) {
> +			dev_err(pctldev->dev,
> +				"pin %s already requested by %s; cannot claim for %s\n",
> +				desc->name, desc->mux_owner, owner);
> +			goto out;
> +		}
>  
> -	if ((gpio_range || ops->strict) && desc->gpio_owner) {
> -		dev_err(pctldev->dev,
> -			"pin %s already requested by %s; cannot claim for %s\n",
> -			desc->name, desc->gpio_owner, owner);
> -		goto out;
> -	}
> +		if ((gpio_range || ops->strict) && desc->gpio_owner) {
> +			dev_err(pctldev->dev,
> +				"pin %s already requested by %s; cannot claim for %s\n",
> +				desc->name, desc->gpio_owner, owner);
> +			goto out;
> +		}
>  
> -	if (gpio_range) {
> -		desc->gpio_owner = owner;
> -	} else {
> -		desc->mux_usecount++;
> -		if (desc->mux_usecount > 1)
> -			return 0;
> +		if (gpio_range) {
> +			desc->gpio_owner = owner;
> +		} else {
> +			desc->mux_usecount++;
> +			if (desc->mux_usecount > 1)
> +				return 0;
>  
> -		desc->mux_owner = owner;
> +			desc->mux_owner = owner;
> +		}
>  	}
>  
>  	/* Let each pin increase references to this module */
> @@ -178,12 +181,14 @@ static int pin_request(struct pinctrl_dev *pctldev,
>  
>  out_free_pin:
>  	if (status) {
> -		if (gpio_range) {
> -			desc->gpio_owner = NULL;
> -		} else {
> -			desc->mux_usecount--;
> -			if (!desc->mux_usecount)
> -				desc->mux_owner = NULL;
> +		scoped_guard(spinlock_irqsave, &desc->mux_lock) {
> +			if (gpio_range) {
> +				desc->gpio_owner = NULL;
> +			} else {
> +				desc->mux_usecount--;
> +				if (!desc->mux_usecount)
> +					desc->mux_owner = NULL;
> +			}
>  		}
>  	}
>  out:
> @@ -223,11 +228,13 @@ static const char *pin_free(struct pinctrl_dev *pctldev, int pin,
>  		/*
>  		 * A pin should not be freed more times than allocated.
>  		 */
> -		if (WARN_ON(!desc->mux_usecount))
> -			return NULL;
> -		desc->mux_usecount--;
> -		if (desc->mux_usecount)
> -			return NULL;
> +		scoped_guard(spinlock_irqsave, &desc->mux_lock) {
> +			if (WARN_ON(!desc->mux_usecount))
> +				return NULL;
> +			desc->mux_usecount--;
> +			if (desc->mux_usecount)
> +				return NULL;
> +		}
>  	}
>  
>  	/*
> @@ -239,13 +246,15 @@ static const char *pin_free(struct pinctrl_dev *pctldev, int pin,
>  	else if (ops->free)
>  		ops->free(pctldev, pin);
>  
> -	if (gpio_range) {
> -		owner = desc->gpio_owner;
> -		desc->gpio_owner = NULL;
> -	} else {
> -		owner = desc->mux_owner;
> -		desc->mux_owner = NULL;
> -		desc->mux_setting = NULL;
> +	scoped_guard(spinlock_irqsave, &desc->mux_lock) {
> +		if (gpio_range) {
> +			owner = desc->gpio_owner;
> +			desc->gpio_owner = NULL;
> +		} else {
> +			owner = desc->mux_owner;
> +			desc->mux_owner = NULL;
> +			desc->mux_setting = NULL;
> +		}
>  	}
>  
>  	module_put(pctldev->owner);
> @@ -608,40 +617,43 @@ static int pinmux_pins_show(struct seq_file *s, void *what)
>  		if (desc == NULL)
>  			continue;
>  
> -		if (desc->mux_owner &&
> -		    !strcmp(desc->mux_owner, pinctrl_dev_get_name(pctldev)))
> -			is_hog = true;
> -
> -		if (pmxops->strict) {
> -			if (desc->mux_owner)
> -				seq_printf(s, "pin %d (%s): device %s%s",
> -					   pin, desc->name, desc->mux_owner,
> +		scoped_guard(spinlock_irqsave, &desc->mux_lock) {
> +			if (desc->mux_owner &&
> +			    !strcmp(desc->mux_owner, pinctrl_dev_get_name(pctldev)))
> +				is_hog = true;
> +
> +			if (pmxops->strict) {
> +				if (desc->mux_owner)
> +					seq_printf(s, "pin %d (%s): device %s%s",
> +						   pin, desc->name, desc->mux_owner,
> +						   is_hog ? " (HOG)" : "");
> +				else if (desc->gpio_owner)
> +					seq_printf(s, "pin %d (%s): GPIO %s",
> +						   pin, desc->name, desc->gpio_owner);
> +				else
> +					seq_printf(s, "pin %d (%s): UNCLAIMED",
> +						   pin, desc->name);
> +			} else {
> +				/* For non-strict controllers */
> +				seq_printf(s, "pin %d (%s): %s %s%s", pin, desc->name,
> +					   desc->mux_owner ? desc->mux_owner
> +					   : "(MUX UNCLAIMED)",
> +					   desc->gpio_owner ? desc->gpio_owner
> +					   : "(GPIO UNCLAIMED)",
>  					   is_hog ? " (HOG)" : "");
> -			else if (desc->gpio_owner)
> -				seq_printf(s, "pin %d (%s): GPIO %s",
> -					   pin, desc->name, desc->gpio_owner);
> +			}
> +
> +			/* If mux: print function+group claiming the pin */
> +			if (desc->mux_setting)
> +				seq_printf(s, " function %s group %s\n",
> +					   pmxops->get_function_name(pctldev,
> +						desc->mux_setting->func),
> +					   pctlops->get_group_name(pctldev,
> +						desc->mux_setting->group));
>  			else
> -				seq_printf(s, "pin %d (%s): UNCLAIMED",
> -					   pin, desc->name);
> -		} else {
> -			/* For non-strict controllers */
> -			seq_printf(s, "pin %d (%s): %s %s%s", pin, desc->name,
> -				   desc->mux_owner ? desc->mux_owner
> -				   : "(MUX UNCLAIMED)",
> -				   desc->gpio_owner ? desc->gpio_owner
> -				   : "(GPIO UNCLAIMED)",
> -				   is_hog ? " (HOG)" : "");
> -		}
> +				seq_putc(s, '\n');
>  
> -		/* If mux: print function+group claiming the pin */
> -		if (desc->mux_setting)
> -			seq_printf(s, " function %s group %s\n",
> -				   pmxops->get_function_name(pctldev,
> -					desc->mux_setting->func),
> -				   pctlops->get_group_name(pctldev,
> -					desc->mux_setting->group));
> -		else
> -			seq_putc(s, '\n');
> +		}
> > Since we are introducing a lock, do we need to guard mux-settings too ?

Yes, we should, I would need to take care at other places as well.

-Mukesh
>  	}
>  
>  	mutex_unlock(&pctldev->mutex);
> 
> -- 
> 2.34.1
> 
> 

