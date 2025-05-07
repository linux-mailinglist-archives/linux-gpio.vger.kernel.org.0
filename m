Return-Path: <linux-gpio+bounces-19716-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0B7AAD24B
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 02:30:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B91691B686AE
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 00:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C8C411CA9;
	Wed,  7 May 2025 00:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I6mJUPiS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B57D4A35
	for <linux-gpio@vger.kernel.org>; Wed,  7 May 2025 00:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746577823; cv=none; b=c141cFR4XdCT3g2+EdTFKCFY5z6k/b/NMVoVblgYxDvFO7LYgqSFMNs8Ei2Uk2xm/IjbrLM8nOm+51JPDyBlrOljgfj2pUhiMjePm/MpfaUQZIqcPCMgh7xjPmcAoFgx1ltH35ZlVbV5P2XHzgEYY0HvB4h91bLSXtbSgg5BGR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746577823; c=relaxed/simple;
	bh=ZBge7jMBgNPb3mHQNiyPpffxlphyMxP+LJ+R76AC2U0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gKEZenrpM/qo5AA7DsNHcsYaW1GtUyDsTJmKH7g1LdvhE7fOVzk6+LyB/y4FFJFNb9O/S9Y7MxEGOYoWIcUsnJREf8EywdICxs4lhPfqcXm7bNbZvGnTzLFRydx1374xX4hb+ZHQ4w7HIttL1/q7oE0Gp+IfgQMXKuFiAvNm7us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I6mJUPiS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546G3RKh010215
	for <linux-gpio@vger.kernel.org>; Wed, 7 May 2025 00:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U6czlrWo7n/eCpa71Z14BBOF
	9eOHw4aaoez+mTmbCkU=; b=I6mJUPiSD9yGGzA5QoKTy/CIvOfDbFnY0fr753Ac
	vvcvMhAoG4ViJ/OzKXKyqWugovwu7mQvjjsWoT+62+tC5DBbDJllecM1PBXYbO2n
	FAmz3DqkKaBplnCs+jFWwiO3LCbam3y4D4GglqBymEwaOiO9vMucAlPGOsOk3xXT
	waoaNLLjMNIZILQzkrc1Y22Hv1ZOsYpemquhlNLrd/bRwHNyb2nDH0uv8yfaOL0v
	MasDLZMaVIbBImfD4GTawp/yOxA2+NI/ZYL8aGMwqiYLAlVTu+IKn/M/46+4DFdu
	pgJrK4yVpZ5RUiBgiY0UaEvWW4sbKnAJBsUf05FcA8pJzw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46fnm1h3uq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 07 May 2025 00:30:21 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8feffbe08so150483856d6.0
        for <linux-gpio@vger.kernel.org>; Tue, 06 May 2025 17:30:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746577820; x=1747182620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6czlrWo7n/eCpa71Z14BBOF9eOHw4aaoez+mTmbCkU=;
        b=jM+9hsgvmdPm5FVjPHT30Yy/UYhgq0n5fVD1JXfzmeiRGCpNrRXp78cLxqJ/oBCvZk
         EcEA/KAQ56GqjSYMjryUNIai/GxLfBhUmWDPY0fN9UaERY5MhxQxcm/xB6iEg/Yy2VRn
         6u/utFlNTyxDETSxmZ/a7PcQd2CkOGZuhD3yyRayYwdFhbnXZ2X7f3RgwJjqpggn04o/
         FTIxfOom99qgxmGmEwY++bqCpG6SXYzUf6I2Kb+ASk4hgwLcTznciMpRGq4XsbrfUKwh
         +cvlc5t3v+RrFnor6lOUDn/WXJ6l9WgytDMQ7msR+gAD9we9xio5GUwvwTv4ENykzm8w
         kQGg==
X-Forwarded-Encrypted: i=1; AJvYcCWg3mjWlGZ4EnejKP7zAWLZw26P71HY3avcGwsxzdxFVrQQ+bqYKEu1eVQmr9aWLSamGAk/kwYuKcoa@vger.kernel.org
X-Gm-Message-State: AOJu0YyJOG2I/H6WNjeSHGHEsFGf2WBp4aRPrA26SgY9+oMR3mCVWmcK
	mIm3A+nIm2l0IKykX/5ATUgsLSpcqOb+gj+bbqimuwHJRJBqWtltsxW/wNWas8WQ5lF+hfF6Y1Z
	C3l59ZXoSte95xpdxM/gjp0k3bhPb5yM5YpCLmTJYUzYGLtizxTX7VajRuuPv
X-Gm-Gg: ASbGncsIh/5I4Q/ue1Q6EGXgdQIbmehQ0o20JDhzrMN79b2ORBGPx55r090iM70fUbw
	dKb/A/435rrnSWBhdnSf0vc5CRWJkkzBUdrBOTpqLBNnxgaX0tXBI0MIW//mvYq3vCRaot9y6Sv
	XKJsyk3tTdKYFLSJyrX1XNbcZm3xpgk07RD3X9VOPq/OR4X8i46y1uMNxtpZQDDJRYax5G4N0PP
	MIhY7kYuZ4xz5OgkikcZ6jowl74DubAF6mK2arjWWmmpTxVGPiiTBdE3RnTgWSGqOrYbY7k9K21
	+5zmNcj26Ct/RfiCg7sCnxXyfWJY7519yB83kMKTn5BWKo+ezeWQ7Zt04pKkQJBqJ8zowsLM7TU
	=
X-Received: by 2002:ad4:5768:0:b0:6ef:cc6:953a with SMTP id 6a1803df08f44-6f542a06093mr16546746d6.12.1746577820360;
        Tue, 06 May 2025 17:30:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWm5XgjPTDMCnhvnoYdEiVxjS3Tf90qt6dPg5mitG5DK13+TYZY++IA7Ni8CuMYo239uk+0g==
X-Received: by 2002:ad4:5768:0:b0:6ef:cc6:953a with SMTP id 6a1803df08f44-6f542a06093mr16546406d6.12.1746577820007;
        Tue, 06 May 2025 17:30:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f6915sm2175431e87.231.2025.05.06.17.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 17:30:19 -0700 (PDT)
Date: Wed, 7 May 2025 03:30:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Josh Cartwright <joshc@codeaurora.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Doug Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] pinctrl: qcom: switch to devm_gpiochip_add_data()
Message-ID: <mz6kajh7jkn5ly77rah2yxefgferlbpn2zngzeifgaoh5h4k57@iqojnv73sp4b>
References: <20250503-pinctrl-msm-fix-v1-0-da9b7f6408f4@oss.qualcomm.com>
 <20250503-pinctrl-msm-fix-v1-3-da9b7f6408f4@oss.qualcomm.com>
 <CACMJSesbNz1Q5S4EDDk_O+oUfw8c6MQdovUAA_q2EZzuG2+i4Q@mail.gmail.com>
 <CACMJSeuRDNo6Si+U-ACCgGnmW5H=D7Bcf32hqxxaLObt+_geew@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACMJSeuRDNo6Si+U-ACCgGnmW5H=D7Bcf32hqxxaLObt+_geew@mail.gmail.com>
X-Proofpoint-GUID: 6f8UKVtXVPZp2Df24y77CuFWt-0nYpsh
X-Proofpoint-ORIG-GUID: 6f8UKVtXVPZp2Df24y77CuFWt-0nYpsh
X-Authority-Analysis: v=2.4 cv=bLkWIO+Z c=1 sm=1 tr=0 ts=681aa99d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=m-dU8d_lu5hDCtaHrWIA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDAwMyBTYWx0ZWRfX2znONtKu60De
 uQnwLxktziiI/Na+a06fLJ3RcMNEFXF+vO4hbIRqVyzLPVkz+DpvfRRv/Ep+AyeB1W+AMbpqQGm
 IaBw2MC75ZFVo3J8098qEA7z+U58gnsdlRcP+6l9k0fV6r5JQEmbBLNe6pRyIKf0b23hbrPMY0Y
 5lrsIhXBqTHqHtJdQIEuoH4UuJDra/3DEA9EOBLZ7RRmxJbuPN9dXQl2XNT5ntaEJNxfXGS5d54
 nB9fOd7JoyLB6APS6BYWFacmocN3qwDNHO2Xr7oVHiJQLxrUHbsbntqrPleZh2gx5B1hDG7H02j
 9WlYBiP5vBAda/L/YrXRb+YNS9cVmNRx4eJHSN08XFnXhRWGKj21lNZB8ZW9jSNp8h64izPwmOm
 8JaPClGe47GsgNBDHRseO9Jdm+cNHYkV7RwtQZPOO0K5MBbZGithje/3q4RcSuYCh05hpWTB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_09,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070003

On Tue, May 06, 2025 at 07:23:10PM +0200, Bartosz Golaszewski wrote:
> On Tue, 6 May 2025 at 19:18, Bartosz Golaszewski
> <bartosz.golaszewski@linaro.org> wrote:
> >
> > On Sat, 3 May 2025 at 07:32, Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > In order to simplify cleanup actions, use devres-enabled version of
> > > gpiochip_add_data().
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > ---
> > >  drivers/pinctrl/qcom/pinctrl-msm.c | 6 +-----
> > >  1 file changed, 1 insertion(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> > > index 88dd462516c76d58b43d49accbddeea38af8f1ec..b2e8f7b3f3e3d5d232b2bd60e5cace62b21ffb03 100644
> > > --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> > > +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> > > @@ -1449,7 +1449,7 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
> > >         girq->handler = handle_bad_irq;
> > >         girq->parents[0] = pctrl->irq;
> > >
> > > -       ret = gpiochip_add_data(&pctrl->chip, pctrl);
> > > +       ret = devm_gpiochip_add_data(pctrl->dev, &pctrl->chip, pctrl);
> > >         if (ret) {
> > >                 dev_err(pctrl->dev, "Failed register gpiochip\n");
> > >                 return ret;
> > > @@ -1470,7 +1470,6 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
> > >                         dev_name(pctrl->dev), 0, 0, chip->ngpio);
> > >                 if (ret) {
> > >                         dev_err(pctrl->dev, "Failed to add pin range\n");
> > > -                       gpiochip_remove(&pctrl->chip);
> > >                         return ret;
> > >                 }
> > >         }
> > > @@ -1608,9 +1607,6 @@ EXPORT_SYMBOL(msm_pinctrl_probe);
> > >
> > >  void msm_pinctrl_remove(struct platform_device *pdev)
> > >  {
> > > -       struct msm_pinctrl *pctrl = platform_get_drvdata(pdev);
> > > -
> > > -       gpiochip_remove(&pctrl->chip);
> > >  }
> > >  EXPORT_SYMBOL(msm_pinctrl_remove);
> > >
> > >
> > > --
> > > 2.39.5
> > >
> >
> > If you're at it then why not remove this function here and the
> > callback assignment throughout the pinctrl/qcom/ directory?
> >
> > Bart
> 
> Ah, it's in the next patch. I'd make it one commit though, no reason
> to split it IMO.

Up to you, but from my POV it's cleaner this way: first patch removes
the contents, second one removes the function. Otherwise it's too easy
to loose the functional changes (of gpiochip_remove() removal) in the
noise of updating all the platform files.

If you wish, I can add a note to the commit message telling that the
actual function will be dropped in the next commit.

-- 
With best wishes
Dmitry

