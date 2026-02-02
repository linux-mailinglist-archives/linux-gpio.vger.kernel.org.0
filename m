Return-Path: <linux-gpio+bounces-31354-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDCFFLH9gGk6DgMAu9opvQ
	(envelope-from <linux-gpio+bounces-31354-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Feb 2026 20:40:33 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF55D096F
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Feb 2026 20:40:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8580C300BC53
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Feb 2026 19:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E4DF3081C2;
	Mon,  2 Feb 2026 19:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pt9aBDWc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eZsyQJYv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED8A3090D2
	for <linux-gpio@vger.kernel.org>; Mon,  2 Feb 2026 19:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770061181; cv=none; b=sZJAxfz9zkwjJ3xAUBcMqB5lFMczXHdaxt5CGuJaZr/Fzpk6g0kXv2cMRmoeVOj5yvmU54iB9wXVhqxxjL1H/RfPHfqYtqwiAOKZ1FCXeb1NQNfy9R+fXNF1WngmFD2zGJqOdz4TZCkF2WqBV39wRO/XL+iEQBodQYCpuXaDQaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770061181; c=relaxed/simple;
	bh=pt4kShmmoCd3mgoMo2uPMiVLNAM/T7idh2I97ecTmso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pjt67pPXwP2unPHumd29q0yNkTImPmHw4+vhBBGfDwXvlolfqHPMb5Z5DVj6NvD20arX3Y9RDhSCWmTXTpBs60tYWelV7M6yNl3/u/bQardua+E7sggpuwaTELzz6jo3veCgK6Ln9OTKq9CWuWCfgCoDdVifbGIANxM+GFiPymk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pt9aBDWc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eZsyQJYv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612JAXkC2261700
	for <linux-gpio@vger.kernel.org>; Mon, 2 Feb 2026 19:39:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Zk1ULsaiSOs9L7KZAkb1H21D
	x8Ea4YpAW8YrsTNEF04=; b=Pt9aBDWc/m5oCzFPiZ8cOjG2bdTuFcxUx5uHkmLw
	GksTBfw4IYO9+q2ChSSXqN3rrcHEVRtEEJycxEBTOemNszrCQLfrIsXVFDeMXiCu
	5hkWy0k3NEB4SZ5uxX+cJ/ycERvTqrZUdq0SFRal+Qz8ILPYmO7xiO9e9j2Sw+qs
	Ze92RoZvVwM0Rb6TeiI05rvElm8VkI/j3d2dkTebO4JuJP33Gg4U79ADMCN3UBXl
	xPizGyVCjY6wV732p1fMIpjmLG2Qu+euRqcAjic6FNUlhpK5znezAAIvhGhjeowc
	9z45SKFoQzMpZ8PCn75EhE7pQPzBkIwLgh0bJ4LVP7dODQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tmthk0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 02 Feb 2026 19:39:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70ed6c849so1231545085a.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 Feb 2026 11:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770061178; x=1770665978; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zk1ULsaiSOs9L7KZAkb1H21Dx8Ea4YpAW8YrsTNEF04=;
        b=eZsyQJYvzFCfkLjtritqDwVW5sY6+YsMZ5Dx/dTYyPDhRjGvfx7HfLd6NCjykHjTC+
         Pk2l7ddIo56W0dI7BH/LWuyDeliqDdMNuqwneHYDz6RfXDZ2qJ0p1Kz4A/0SzdWp5pKG
         8jIwfkbGeDe0XbfJtV2WDd1iWa9C1I/8KLI+5fRZMQ9YBUNAO4D46llR5mZqmHN73nyJ
         wgqdklHR225o2Glr2/Mz1tBhgugfXph5F1O7xfdcjjLdYvHWVMtLYm7y9qxH436UM3Cr
         FJMuztOsMx+uQv3+SCmyp4Acy8pTvebvvNhdIkA4YCJc5/1J6waEYzFdgTKP6i+ZTe24
         ey3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770061178; x=1770665978;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zk1ULsaiSOs9L7KZAkb1H21Dx8Ea4YpAW8YrsTNEF04=;
        b=agvFbqHtlcsIWWxp8KEIe0607blpwILMOyqK/CgvdwEtnCJEMK9apeM00alRLdNs/f
         OtqCNCROD/Ucb8QZ0dT6YH9mzirb55WQoCpKjasI7bo2SEUCn5cOmHRsc92mtIdYpGpa
         xq+GSSyMgz4wwITF0DjYeRaq65rQ7JZBCMUJk5E+wRd6JwksZKcQWv/jzk4mwhq+wYgB
         ov719SL3LXQDrN3ywr60rG2sCivl1qvjnBeSkoelymJeVzJgGvdMt27vb8uvKG8hT+rV
         KYlhpkkHSbcw4B0QxS7gFsitmcoQbBUxaIO85Hw5xVNeOxDwj3KJCIYREpn7NJibVuMc
         /tAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnldhykRIk41lFjfbA7eHeDtNqWBCyqlo9dKLdxBVYwzZEa2qPrceyCbMZxhlP49K/da2mo+oX/47c@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ/Ch64yjrMrhV+jVQK1AfM7fkH4ws4Y723ZjhWXDqTx2Pg2VO
	F/OYJCicEA2nlToGPe4wjBWwsIZafClDlQH2EeE48xosWprpaH6+ff/cL78wgTljS0YF23l3igV
	u5Zda/MN2zCP8P5ngI4gZ4Db1KwD5wygBOIQcKLX4upXu0O/AxBbflFMbASzTlN3K
X-Gm-Gg: AZuq6aJbub531hlmWpvhaFkhzEalg1QOi+ynlq2718XxZdGUHwiVcScnt8RtY2C+O4j
	27QOnDMby10J7vCeXzPQj8d19ZQ45YpGGfI/d6Z1RVrEdbnMcLkdpsGFOOiD/N/za8HK1kiY2wE
	RDPPU+4L03b3Nes4tBaItn3ZYX+3SPkyZttwHkOLUp2y1FTl31P1efLqAT9rFHr6NDkWQ5pumpx
	wjHxiV5bh4n7npyNGy9hyct/+zuhXyVr/BWeuZXNvJN/EiBumCc7KoXG3nGKSPe24iOXIipdjED
	hgTMlhUayYRnAQP+83DFc3s5qSlOmLT9Eyf/aGJh3Aua8OrWPiGyzfNPCzaAAzZYwCNRVyuN6w7
	ZebYJijyptmiq9RQ8gZf0oh3eMb7rieHykYbLtgb+IRlPEXI3qDvVtUWa/A23Xn+XDF0/RXGsiO
	B2sqNdI83IflQhco71DAxlIKI=
X-Received: by 2002:a05:620a:440b:b0:8a4:107a:6772 with SMTP id af79cd13be357-8c9eb32dfc5mr1640238685a.76.1770061177840;
        Mon, 02 Feb 2026 11:39:37 -0800 (PST)
X-Received: by 2002:a05:620a:440b:b0:8a4:107a:6772 with SMTP id af79cd13be357-8c9eb32dfc5mr1640234985a.76.1770061177333;
        Mon, 02 Feb 2026 11:39:37 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e0748993esm3734670e87.37.2026.02.02.11.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 11:39:36 -0800 (PST)
Date: Mon, 2 Feb 2026 21:39:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Jishnu Prakash <quic_jprakash@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC 3/8] pinctrl: qcom: Allow exposing reference clocks
 living in TLMM reg space
Message-ID: <xkndkbp6w7xh23wc4xd2yjakiic5kcwviwcgi3vq4quct2z4tu@m7dxfub5ike7>
References: <20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com>
 <20260202-topic-8750_tcsr-v1-3-cd7e6648c64f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202-topic-8750_tcsr-v1-3-cd7e6648c64f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Xb6EDY55 c=1 sm=1 tr=0 ts=6980fd7a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=2tca-NSePewhJHxpEWQA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Ab6gR31BpmYd8IQlj-AtEbeGXMIQcaCt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDE1MyBTYWx0ZWRfX9XAnOiiceKTp
 wX1IlNGsi6VB0ZxRAuF73ZgsO8sFVmZ7pmgG15Uta4pmop6ZtlHjmwl07NINb4tN3SgbU2wUkd5
 1+UQhjkNWhYxMLAaY4JcMwXDLAJC2dm0XLI900SFinw1mty1rlMtsJlQbXXMnbNJdOkHrIh65Op
 J5zkMpfoz/jo+bsOKxGT3uA5gdPMXdpLuoB9gjWQv3pDDK1CjPWgeBHDoI7cxLEypZodSsoOKU5
 DLRDMt8NTbOB5hzv2ZrWULdIiQMFHkU5sSwJC1JwwC538RgAg+mLqim+EvciR6wfr0MjTi3wjFn
 WV3kQewvrjsJG7YwjVpZ/expKnB+XMzHN0zMa/iHmGb5s+bte7nMB5iGg7PJ8o7ikEVCD9ZmsZq
 jaTsij6WZ56OU6HB4YSB+9PVajYAMUw/3s72rh9qXK3mGI5km0qnMGbeV7LZbFydXUfZQaBWXui
 SuR0OPgOR9HBD/Ku0xA==
X-Proofpoint-GUID: Ab6gR31BpmYd8IQlj-AtEbeGXMIQcaCt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020153
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31354-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[init.name:url,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7CF55D096F
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 03:57:35PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Certain platforms (at least SM8750) had a number of registers
> (responsible for gating refclk output to various consumers) moved to
> TLMM. They're simple on/off toggles.
> 
> Expose them from the msm-pinctrl driver to allow for a reasonable DT
> representation.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 92 ++++++++++++++++++++++++++++++++++++++
>  drivers/pinctrl/qcom/pinctrl-msm.h | 14 ++++++
>  2 files changed, 106 insertions(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index e99871b90ab9..1a52431a8605 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -4,6 +4,7 @@
>   * Copyright (c) 2013, The Linux Foundation. All rights reserved.
>   */
>  
> +#include <linux/clk-provider.h>
>  #include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/gpio/driver.h>
> @@ -16,6 +17,7 @@
>  #include <linux/pm.h>
>  #include <linux/firmware/qcom/qcom_scm.h>
>  #include <linux/reboot.h>
> +#include <linux/regmap.h>
>  #include <linux/seq_file.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
> @@ -80,6 +82,7 @@ struct msm_pinctrl {
>  	const struct msm_pinctrl_soc_data *soc;
>  	void __iomem *regs[MAX_NR_TILES];
>  	u32 phys_base[MAX_NR_TILES];
> +	struct ref_clk ref_clks[];
>  };
>  
>  #define MSM_ACCESSOR(name) \
> @@ -1525,9 +1528,69 @@ SIMPLE_DEV_PM_OPS(msm_pinctrl_dev_pm_ops, msm_pinctrl_suspend,
>  
>  EXPORT_SYMBOL(msm_pinctrl_dev_pm_ops);
>  
> +static int clkref_enable(struct clk_hw *hw)
> +{
> +	struct ref_clk *rclk = container_of(hw, struct ref_clk, hw);
> +	u32 val;
> +
> +	regmap_write(rclk->regmap, rclk->init.offset, BIT(0));
> +	udelay(10);
> +
> +	regmap_read(rclk->regmap, rclk->init.offset, &val);
> +
> +	return (val & BIT(0)) ? 0 : -EINVAL;
> +}
> +
> +static void clkref_disable(struct clk_hw *hw)
> +{
> +	struct ref_clk *rclk = container_of(hw, struct ref_clk, hw);
> +
> +	regmap_write(rclk->regmap, rclk->init.offset, 0);
> +
> +	udelay(10);
> +}
> +
> +static int clkref_is_enabled(struct clk_hw *hw)
> +{
> +	struct ref_clk *rclk = container_of(hw, struct ref_clk, hw);
> +	u32 val;
> +
> +	regmap_read(rclk->regmap, rclk->init.offset, &val);
> +
> +	return !!val;
> +}
> +
> +static const struct clk_ops clkref_ops = {
> +	.enable = clkref_enable,
> +	.disable = clkref_disable,
> +	.is_enabled = clkref_is_enabled,
> +};
> +
> +static struct clk_hw *msm_pinctrl_clk_get(struct of_phandle_args *clkspec, void *data)
> +{
> +	struct msm_pinctrl *pctrl = data;
> +	u32 idx = clkspec->args[0];
> +
> +	if (idx >= pctrl->soc->num_ref_clks)
> +		return ERR_PTR(-EINVAL);
> +
> +	return &pctrl->ref_clks[idx].hw;
> +}
> +
> +static const struct clk_parent_data clkref_parent_data = {
> +	.index = 0, /* RPM(h) XO clock */
> +};
> +
> +static const struct regmap_config clkref_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +};
> +
>  int msm_pinctrl_probe(struct platform_device *pdev,
>  		      const struct msm_pinctrl_soc_data *soc_data)
>  {
> +	struct device *dev = &pdev->dev;
>  	const struct pinfunction *func;
>  	struct msm_pinctrl *pctrl;
>  	struct resource *res;
> @@ -1595,6 +1658,35 @@ int msm_pinctrl_probe(struct platform_device *pdev,
>  	if (ret)
>  		return ret;
>  
> +	if (soc_data->num_ref_clks) {
> +		struct regmap *regmap = devm_regmap_init_mmio(dev, pctrl->regs[0],
> +							      &clkref_regmap_config);
> +		if (IS_ERR(regmap))
> +			return PTR_ERR(regmap);
> +
> +		for (int i = 0; i < soc_data->num_ref_clks; i++) {
> +			struct clk_hw *hw = &pctrl->ref_clks[i].hw;
> +			struct clk_init_data init = { };
> +
> +			init.name = pctrl->soc->ref_clks[i]->name;
> +			init.parent_data = &clkref_parent_data;
> +			init.num_parents = 1;
> +			init.ops = &clkref_ops;
> +			hw->init = &init;
> +
> +			ret = devm_clk_hw_register(dev, hw);
> +			if (ret)
> +				return dev_err_probe(dev, ret, "Couldn't register clock %s\n",
> +						     init.name);
> +
> +			pctrl->ref_clks[i].regmap = regmap;

This will access beyond the end of the allocated chunk, because you
haven't extended pctrl allocation.

> +		}
> +
> +		ret = devm_of_clk_add_hw_provider(dev, msm_pinctrl_clk_get, pctrl);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Couldn't register clk provider\n");
> +	}
> +
>  	platform_set_drvdata(pdev, pctrl);
>  
>  	dev_dbg(&pdev->dev, "Probed Qualcomm pinctrl driver\n");
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
> index 4625fa5320a9..213cc789711d 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.h
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.h
> @@ -5,6 +5,7 @@
>  #ifndef __PINCTRL_MSM_H__
>  #define __PINCTRL_MSM_H__
>  
> +#include <linux/clk-provider.h>
>  #include <linux/pm.h>
>  #include <linux/types.h>
>  
> @@ -129,6 +130,17 @@ struct msm_gpio_wakeirq_map {
>  	unsigned int wakeirq;
>  };
>  
> +struct ref_clk_init_data {
> +	const char * const name;
> +	u32 offset;
> +};
> +
> +struct ref_clk {
> +	struct clk_hw hw;
> +	struct regmap *regmap;
> +	struct ref_clk_init_data init;
> +};
> +
>  /**
>   * struct msm_pinctrl_soc_data - Qualcomm pin controller driver configuration
>   * @pins:	    An array describing all pins the pin controller affects.
> @@ -170,6 +182,8 @@ struct msm_pinctrl_soc_data {
>  	bool wakeirq_dual_edge_errata;
>  	unsigned int gpio_func;
>  	unsigned int egpio_func;
> +	const struct ref_clk_init_data **ref_clks;
> +	unsigned int num_ref_clks;
>  };
>  
>  extern const struct dev_pm_ops msm_pinctrl_dev_pm_ops;
> 
> -- 
> 2.52.0
> 

-- 
With best wishes
Dmitry

