Return-Path: <linux-gpio+bounces-19566-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC41AA7B70
	for <lists+linux-gpio@lfdr.de>; Fri,  2 May 2025 23:41:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5DB43B9FC0
	for <lists+linux-gpio@lfdr.de>; Fri,  2 May 2025 21:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12AF920B7FC;
	Fri,  2 May 2025 21:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DI7d8KDG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF5329408
	for <linux-gpio@vger.kernel.org>; Fri,  2 May 2025 21:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746222097; cv=none; b=HyUfUSJDGE9sOpy69XLk8sjI3knVS7Uu+3rV3HR75YW35gf+WJ/OzAICJgomNMUMVDLMwEr+Ok1iOmCp5yKByKmPibkPlVd5Hb6aztjEfwm4huriqF7bvX1O0BjZLqXcDexR8uKlZeONsNqSHFKi47zCC+OZ8j+dEEF/O2Qvb3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746222097; c=relaxed/simple;
	bh=WfnrA1p6UnOwRSCwn9I8xNbmK2iTuPFXqFSGc2dMMwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LVy/oRHVdQNPQF36ZwAIxA6QIjnzHd9HKVpo7WYXcfXjjOFoiH5ZmIawHH/jQrvZuQMFbW4jQ6ioGSSm8RSRxpekI4Ad9zuv5kW7isLONYCUAP+Rbzs41j8eD2MKHWMgppOTVm2YaGloJuOhEuA4+/hQzAEMB8UGqb1lVpjKL7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DI7d8KDG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542KAqgZ022452
	for <linux-gpio@vger.kernel.org>; Fri, 2 May 2025 21:41:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ui/Dd0dEB5SSlIr1fPAKd4W0TlzRZ0WZuFplX74RGEM=; b=DI7d8KDGBQDmlCwe
	KCJ9tU2P9Eb7KsOdZgPBIlnkd3oZBSvGdzSzt+QEAH/hLnTjuVX/9BVaSA9leYU3
	teahwl0K/kEKDAiKWk5TWClAw43/xXNM904BXP7p9TSZWbG3KhKOQXOvUrpJMSN+
	05bLHnBoI75v9TkcAmdrKOS9SSWjgwZ8+unKfrVeoDLVwRc4xkrUmKvDUNm7ZOQ/
	DH8g1V+o8C31VeZ8ASJHP1aq/lf+o2YKK57bLQPt0SE2LiP4dVnjQ2Bu3pBsAb1m
	b5TpjaNo6EOPXqNddM91p9SIqXiSuc5q7GnmE5fpZGi6F3sa/oPvSKF9BoKTohc6
	rbczrA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u4hge8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 02 May 2025 21:41:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-476b2179079so50841511cf.1
        for <linux-gpio@vger.kernel.org>; Fri, 02 May 2025 14:41:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746222093; x=1746826893;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ui/Dd0dEB5SSlIr1fPAKd4W0TlzRZ0WZuFplX74RGEM=;
        b=P9fQDiigj5AMe3cMwuDhnufbUMdPfH9emkte9xXtXAQdmhDvJJ8NJxukZumzvIv8xT
         j/JIax1RYhcTS3QadPh1i7HMICRUnT3YPW7CMaNMGT+LHGvwgeVhk4IcizqzfCKI22oz
         kPoBcTboPYAz3yOrQi7j3rJAUhW/mXvYH95ikLXgsi/aWYSr2WkY2FzadcbtTsqCwEHH
         9HSPQM3amhD2FbDCBIdA3HkCAwjQOh3pXQVHrr4mXhZHeVHuWu0ym0yozyn29w/rZ2yO
         IEzAlD7h/jJKBiGq25vy5bwaqoMofKqDPhS+CJDB3Pl5lQEqNGkT8/dJdfbWwNshT5dR
         iIrg==
X-Forwarded-Encrypted: i=1; AJvYcCUS/2mFnn+egK3yhOopuTPRY6RoTD/0aphJqV74pYLJf2rVvCxnz+QwyUS+lXKOiEcp45ZZZbqFlaIT@vger.kernel.org
X-Gm-Message-State: AOJu0YxdnWiptlDotnQzA/yaoh5ptHsZ71VWgywMMw7PpDMwLG2meU/M
	LeuCoIb9APEe1DsgcPRf2tLCLIDvOmFBet9oIsgXrJ0+9G28/S9vrq1i31x6yxaKQIUxUwovqZl
	8MrfTbubl6Bsqz8g1SyBnkHcf1VnQwe6m7BIbIlZWgFlHqQZ/LsHctZ45djyW
X-Gm-Gg: ASbGnctq6tfO9CFVEo84PLVf3gY3LEVcY5pqhM9v6yTHQJP37DdgrC2p+HwH3B7XLz7
	VGIIocwObX1nulIB/uoyC4Z3tk/T1mfHARAqwYy96pkTnXAuXOCo/2010Un7TCe7nGXf71tSwwK
	9IKci/JBQ/D6MEi8H7/fUzR88/7fuoLQkA2ksjoJ4OsqXEv9twLJe4lWztFF85EAm9yzSFi5eEs
	mrnpLdSF++TgKZ6q1NdBurPv+nKO+0p/GfCy9khPI9xD140jhVQpE1IEjWN2kUmtGHdIOBXzzBS
	6AbRwTODxpIi/hAWqLkMuMF9kNGTzcdgb3zpJGVapCJbHcl5ctb0W9TVjwG3tPkcFhAv5R+d01I
	=
X-Received: by 2002:a05:622a:1dc5:b0:476:9847:7c6e with SMTP id d75a77b69052e-48c3164093bmr76384381cf.19.1746222093630;
        Fri, 02 May 2025 14:41:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGN4MItxhGJJTIJenI1KN9iK0AJaDd3wPAutq4tLjWHPCXPBWfuEPGy1JIdC/RwoLgB5fElLA==
X-Received: by 2002:a05:622a:1dc5:b0:476:9847:7c6e with SMTP id d75a77b69052e-48c3164093bmr76383921cf.19.1746222093161;
        Fri, 02 May 2025 14:41:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee00fsm501038e87.120.2025.05.02.14.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 14:41:32 -0700 (PDT)
Date: Sat, 3 May 2025 00:41:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Doug Anderson <dianders@chromium.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH v3 4/4] gpio: Hide valid_mask from direct assignments
Message-ID: <cupvce3ptuidmjpiwbzddv3err5m5antfwtdgvxlmamypdadnl@ii6occccx72h>
References: <cover.1741180097.git.mazziesaccount@gmail.com>
 <4547ca90d910d60cab3d56d864d59ddde47a5e93.1741180097.git.mazziesaccount@gmail.com>
 <CAD=FV=Vg8_ZOLgLoC4WhFPzhVsxXFC19NrF38W6cW_W_3nFjbw@mail.gmail.com>
 <944dab74-f431-41e1-b4d7-fddf25ffa147@gmail.com>
 <5add8ddd-fcc8-445d-9699-42c27df0e1c7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5add8ddd-fcc8-445d-9699-42c27df0e1c7@gmail.com>
X-Proofpoint-ORIG-GUID: w1mSM9X-31px7s2SlwonqMLXC9TaBvBI
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68153c0f cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=AmpY3L4ahEK_DQabhFQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE3NiBTYWx0ZWRfX2Uzm/H+t3M1x Lt1u/PiCLvbkonxIHrJ9xIp9a05g4kMa/ZbTG+h1wed/IEBh8Hkd8in6CW67p4yOK8Y9mNN5oJk qQ5N1JMMbvjfpv1QAK4Fi4gf1MJ3Ml0tqIRdEQSQjYLcEEdyCdrw+K34WGgJjJ3H2uMW068XNeG
 M2m95V5wUR3yCz9kjTDIV2FNUDvChRgh6m5RJ5BHqZ06Pt3Bg0UD1czAJnYUYixV5WftXDWmSI3 VmPdL3R6tX5snHPqozynilGVyLq8LssNAV3wKCusUPrs1YM5tVj+9gOmrk/JB0xoob04NC4RQJF kfXXZdHhEJPblS+Fk4X7wN5+JrdO7BYvi1Tlb7385l8vwvfQKbFSv7xopSnKOoG38DFZKzLFygB
 TL9UhCoNaNOmuVoX4PnNsqolyPJPyRrkAuPxT3yEB5r3keXLRyW6TpaFiAQ6C9oYEVUUsr4x
X-Proofpoint-GUID: w1mSM9X-31px7s2SlwonqMLXC9TaBvBI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_04,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020176

On Sun, Apr 13, 2025 at 11:51:29AM +0300, Matti Vaittinen wrote:
> On 13/04/2025 11:08, Matti Vaittinen wrote:
> > Hi Doug,
> > 
> > On 13/04/2025 02:00, Doug Anderson wrote:
> > > Hi,
> > > 
> > > On Wed, Mar 5, 2025 at 5:23 AM Matti Vaittinen
> > > <mazziesaccount@gmail.com> wrote:
> > > > 
> > > > The valid_mask member of the struct gpio_chip is unconditionally written
> > > > by the GPIO core at driver registration. Current documentation does not
> > > > mention this but just says the valid_mask is used if it's not NULL. This
> > > > lured me to try populating it directly in the GPIO driver probe instead
> > > > of using the init_valid_mask() callback. It took some retries with
> > > > different bitmaps and eventually a bit of code-reading to understand why
> > > > the valid_mask was not obeyed. I could've avoided this trial and
> > > > error if
> > > > the valid_mask was hidden in the struct gpio_device instead of being a
> > > > visible member of the struct gpio_chip.
> > > > 
> > > > Help the next developer who decides to directly populate the valid_mask
> > > > in struct gpio_chip by hiding the valid_mask in struct gpio_device and
> > > > keep it internal to the GPIO core.
> > > > 
> > > > Suggested-by: Linus Walleij <linus.walleij@linaro.org>
> > > > Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> > > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > > > ---
> > > > Revision history:
> > > > v2 => v3:
> > > >   - Rebase to gpio/for-next
> > > > v1 => v2:
> > > >   - Hide the valid_mask instead of documenting it as internal to GPIO
> > > >     core as suggested by Linus W.
> > > > https://lore.kernel.org/all/Z71qphikHPGB0Yuv@mva-rohm/
> > > > ---
> > > >   drivers/gpio/gpiolib.c      | 16 ++++++++--------
> > > >   drivers/gpio/gpiolib.h      |  3 +++
> > > >   include/linux/gpio/driver.h |  8 --------
> > > >   3 files changed, 11 insertions(+), 16 deletions(-)
> > > 
> > > FWIW, I've found that this patch is crashing me at bootup on my
> > > sc7180-trogdor board. The problem is pretty obvious in gdb.
> > > "gc->gpiodev" is NULL in gpiochip_line_is_valid().
> > 
> > Thanks for debugging this! I find this odd. It seems to me the pinctrl-
> > msm.c is calling the gpiochip_add_data() for the chip, in the
> > msm_gpio_init() - which is called from the msm_pinctrl_probe().
> > 
> > The gpiochip_add_data() should go to the gpiochip_add_data_with_key() -
> > where the gpiodev should be allocated and set.
> > 
> > I don't spot any successful code path where the gpiodev was not allocated.
> > 
> > > 
> > > 0xffff80008066c760 in gpiochip_line_is_valid (gc=0xffff000083223890,
> > > offset=offset@entry=66) at drivers/gpio/gpiolib.c:746
> > > 746             if (likely(!gc->gpiodev->valid_mask))
> > > (gdb) bt
> > > #0  0xffff80008066c760 in gpiochip_line_is_valid
> > > (gc=0xffff000083223890, offset=offset@entry=66) at
> > > drivers/gpio/gpiolib.c:746
> > > #1  0xffff800080666338 in msm_pinmux_request (pctldev=<optimized out>,
> > 
> > Ah, but now I see the call comes from the pinmux. Looking at the
> > msm_pinctrl_probe() - the pincontroller is registered before the gpio.
> > Maybe, with unlucky timing, the request happens right after registering
> > the pinctrl - but before registering the gpios.
> > 
> > This, I think, can be a bug even before this change (because the
> > valid_mask is not initialized prior the gpio registration) - but this
> > change now made it obvious.
> > 
> > I see the probe is actually an exported function, and there are mentions
> > about ACPI support etc. I don't really know if there are valid cases
> > where the pincontroller should be usable without the gpiochip. If this
> > is the case, the unconditional call to the gpiochip_line_is_valid() from
> > the msm_pinmux_request() smells wrong.
> > 
> > I am not sure about the right fix. One could try:
> > 
> > @@ -1568,6 +1568,10 @@ int msm_pinctrl_probe(struct platform_device *pdev,
> >          if (pctrl->irq < 0)
> >                  return pctrl->irq;
> > 
> > +       ret = msm_gpio_init(pctrl);
> > +       if (ret)
> > +               return ret;
> > +
> >          pctrl->desc.owner = THIS_MODULE;
> >          pctrl->desc.pctlops = &msm_pinctrl_ops;
> >          pctrl->desc.pmxops = &msm_pinmux_ops;
> > @@ -1582,10 +1586,6 @@ int msm_pinctrl_probe(struct platform_device *pdev,
> >                  return PTR_ERR(pctrl->pctrl);
> >          }
> > 
> > -       ret = msm_gpio_init(pctrl);
> > -       if (ret)
> > -               return ret;
> > -
> >          platform_set_drvdata(pdev, pctrl);
> > 
> >          dev_dbg(&pdev->dev, "Probed Qualcomm pinctrl driver\n")
> > 
> > but I am not at all this is the fix we're looking after. I wonder if
> > Krzysztof has any suggestions? (Seeing he has been authoring some
> > changes here :] )

I think a correct fix for the pinctrl-msm driver would to use
devm_pinctrl_register_and_init() and then pinctrl_enable() after
registering GPIO chip, I'm going to submit a relevant patch. However I
can't stop but notice that pinctrl-msm is not unique in the pattern of
simply calling [devm_]pinctrl_register() and then registering a GPIO
chip. This patch makes this pattern much more fragile.

> 
> +Björn
> 
> > Yours,
> >      -- Matti
> > 
> > 
> > > offset=66) at drivers/pinctrl/qcom/pinctrl-msm.c:152
> > > #2  0xffff800080662314 in pin_request (pctldev=0xffff000082686ac0,
> > > pin=66, owner=0xffff000082c02790 "3500000.pinctrl", gpio_range=0x0)
> > >      at drivers/pinctrl/pinmux.c:176
> > > #3  0xffff800080662900 in pinmux_enable_setting
> > > (setting=0xffff000082684b40) at drivers/pinctrl/pinmux.c:445
> > > #4  0xffff80008065fd54 in pinctrl_commit_state (p=0xffff000083a07520,
> > > state=0xffff000082684a40) at drivers/pinctrl/core.c:1300
> > > #5  0xffff8000806605bc in pinctrl_select_state (p=0xffff000083223890,
> > > p@entry=0xffff000082686ac0, state=0x42) at drivers/pinctrl/core.c:1381
> > > #6  pinctrl_claim_hogs (pctldev=0xffff000082686ac0) at
> > > drivers/pinctrl/core.c:2136
> > > #7  pinctrl_enable (pctldev=0xffff000082686ac0) at drivers/pinctrl/
> > > core.c:2156
> > > #8  0xffff800080660814 in pinctrl_register
> > > (pctldesc=0xffff000083223a90, dev=0xffff000081406410,
> > > driver_data=0xffff000083223880) at drivers/pinctrl/core.c:2193
> > > #9  0xffff800080660df4 in devm_pinctrl_register
> > > (dev=0xffff000081406410, pctldesc=0xffff000083223a90,
> > > driver_data=0xffff000083223880) at drivers/pinctrl/core.c:2313
> > > #10 0xffff8000806657b4 in msm_pinctrl_probe (pdev=0xffff000081406400,
> > > soc_data=<optimized out>) at drivers/pinctrl/qcom/pinctrl-msm.c:1579
> > > #11 0xffff80008066afcc in sc7180_pinctrl_probe
> > > (pdev=0xffff000083223890) at
> > > drivers/pinctrl/qcom/pinctrl-sc7180.c:1147
> > > #12 0xffff80008089583c in platform_probe (_dev=0xffff000081406410) at
> > > drivers/base/platform.c:1404
> > > 
> > > (gdb) print gc->gpiodev
> > > $1 = (struct gpio_device *) 0x0
> > > 
> > > -Doug
> > 
> 

-- 
With best wishes
Dmitry

