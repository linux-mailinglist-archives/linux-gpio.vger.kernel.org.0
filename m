Return-Path: <linux-gpio+bounces-37354-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLe2Aow8EGroVAYAu9opvQ
	(envelope-from <linux-gpio+bounces-37354-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 13:22:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CD92F5B2ED0
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 13:22:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1622306504D
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 11:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 097C03D5C23;
	Fri, 22 May 2026 11:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LKW2bwIt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cFov2Xfn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BB43D0BFC
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 11:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779448553; cv=none; b=XCU0rU3hTifqPOtAqRgC/2MEavW55UFQWNOF2024BnbvnESuv4IQWUL0gVu3NEMl3/60i3T0iRby6oh14o2B3TBv9SmRs4JBCVi3pZgDAVSt15Y+cfE0HZQqW4GdWeYCGxjOIRqAwqcixFNjvXRaMw/FaBfihy3DCl4QwsdObIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779448553; c=relaxed/simple;
	bh=jJ2OehmY96vwBL5lAQ6i28QyH/j5cQxIMHe0BJmG520=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k4hy9S+KCRDtQovE1vy081nzZnqDAt95UWtigP6JkdOsyloX9kBCWwb4YGkLKDX8SVx9hG7amRxovNlhOnLhu6PNVXLFLFj8e8BcM3N8UM6D59eFRbLu7f+PgB97O6Z/ZXCh1zInL9mGM63Gi3aJw+32UIwd1xVZGgoWpTKmejw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LKW2bwIt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cFov2Xfn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MA1nnT312832
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 11:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TNFqR3PagcCZH+qIwcxLNM7C+7IFAWYrIDD2ovzZPwU=; b=LKW2bwIteh/HEN5x
	mdRT0JBb6oItRpscKiIKRJLZEdtsNyBgh8BcbVeE1y4XxZxomTUhp1GLhX0oAKtv
	m0M2wzaQPpGDYLRJKmlpNM/Pu738A3D9rCQCxFMB2PFj4DJUnDXieavmfw7O7xCW
	UbNDz31Eca7XEeuw59kHYlAFhVtLMUKDsvHO8w7Zm1/QvMex8tKOimMbWAe67fWR
	vWTuarZ40MH8kjRqcN2K1mNkR1o732mOossmi6kyZudXyrd3zXdmgNnDsvR5LCJG
	IC1U2dxo9n2a+kx/QBMNUFHXL4be2ddxbDe2dpTtY+LPigbgrT33bVmEED5MPp3i
	NaxtSA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea8833hpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 11:15:51 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56f6e373ba0so643507e0c.2
        for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 04:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779448551; x=1780053351; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TNFqR3PagcCZH+qIwcxLNM7C+7IFAWYrIDD2ovzZPwU=;
        b=cFov2XfnxGTJoroDrRTLH0JyDnZIYJsTIlyhnnHUnUKYyBvdp+RugqkzxFH0JrmS6Y
         hi82KOmPKfhFkP86hRvMlgCUlWAhMDSFs9U3WUF/+LHrwRk46j+JEo2MnpjdisbH95tV
         NEoZ0A66o2XSDTTnQzrGn+Pf9+tB34IOTpPhY8pyYD8Ei5rjbKYAmRpOgALsnZtwS8Vy
         c+aom9Cn0enHcd6OIlEpBdrK7xQMNBtMGK5fLGbZK0muADXLcylrq/wFElOU4oUPiZDl
         53IG7VSYFXbXw3Lmase8/l4Jw7AoPFqD0mFh5659z0eCDDfnuELUKPlQxKEgEm0CMhfY
         LaXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779448551; x=1780053351;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TNFqR3PagcCZH+qIwcxLNM7C+7IFAWYrIDD2ovzZPwU=;
        b=OzY0RwCtY8MY97NeioR7TwGB2idDhi8n/dNOQEs6jjD3VNKbibzn3+6Wt0NdpYsxCv
         CFAWKJ0SFwML2201xdkm4LXm6+ybxxwG2T1xATXG7HTcqxAsyZeK+1yqGUDxBvfEijWG
         3NXDNaTiLpNZzyeXIHvaxUzWTEsJQhuqvdgZuP5ra5cGnH0J7xgJQ2I3ezD0m5evB28n
         iSQzha10vM2Tym5K8FrIOcPkL6KwZawp3e2+j5vUlDRTgVAff/+UQvpl5sSaY2S6QOsm
         kPp9PL3FwVMBAiaJcZL9kRpdgjUFz+9TL7c6CIiupGuYzPx2Bekryky6v44nNp9uyezg
         57wA==
X-Forwarded-Encrypted: i=1; AFNElJ/OMKEwZM3rRbikjw64p7fbPBywX9I61JpWfGtFF94Xc7oi2AShGmPSYsS82Ha/Z1TyvmOKMH6pySv7@vger.kernel.org
X-Gm-Message-State: AOJu0YwL1e/mNluO0FjloMSru+t/ZOo52AznwHMfpB59uky/Gks6CTxv
	s2ACeGdhxwhdHYXcNR2UWt6Ypyc0heNQRsJh/2KwRjQDnflT86kaIIaUHt1201dlDtVPUe9mJST
	DYFMWozLLSPG31lf9xrWCIJBQIgBDvQf9lSAVJG0vL7IcVB4Qdc2uUQywmFtgUnvA
X-Gm-Gg: Acq92OEFNZ8tAYaftAHwK4/6GRivB0dxGhwNfpjP8e7wCAB5csxpEgqQsh0B+YYGxY6
	DXq7q081QTsVMbpaCksgn8fmhfUGODDk5hgHYxMeysEaBnMxVmqgiGp9rl32fWPsR/nU7CXHPk3
	mwlHNJN59sJacX0LRrhG6vY3S3sNr+9+PUCdHpCkdFvwI8UtmKQqQXSLAKAo3MOM6IWd8Cvvg9m
	sHIRYuOsDcdi23o0Y8l+5ljjnFfpP2Uj5WTs47a8wSo8XlDPfPZnR6OrRw8zu7dM2ZaT7Fgyf0g
	PM6VBP4eUTwZBSJc6pnty6cUhH4xIOrL5s6RsKMQYWlX9aAiKoRXxoVLE1m98KtdyScMF2KqzWW
	4PzWQ53hUVMUHJOBE/nd4HZXuXPyPbAf5ltIaWsK9WDceew==
X-Received: by 2002:a05:6122:6846:10b0:575:2300:9f54 with SMTP id 71dfb90a1353d-5865e98ed7dmr513930e0c.1.1779448551026;
        Fri, 22 May 2026 04:15:51 -0700 (PDT)
X-Received: by 2002:a05:6122:6846:10b0:575:2300:9f54 with SMTP id 71dfb90a1353d-5865e98ed7dmr513915e0c.1.1779448550495;
        Fri, 22 May 2026 04:15:50 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b9f503e1sm582668a12.7.2026.05.22.04.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 04:15:48 -0700 (PDT)
Message-ID: <40413c01-117a-4333-a8de-f4cc9934dd50@oss.qualcomm.com>
Date: Fri, 22 May 2026 13:15:45 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] pinctrl: qcom: lpass-lpi: Switch to PM clock
 framework for runtime PM
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260513140009.3841770-1-ajay.nandam@oss.qualcomm.com>
 <20260513140009.3841770-3-ajay.nandam@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260513140009.3841770-3-ajay.nandam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDExMiBTYWx0ZWRfX6Z+j1IU8hXo7
 IohVtz06qbtq3sR+3/VDUb9G4FhF0Eqfc3Virsz0lSdMNFF5sQaHNDHGSrJj4mDNSvEjFBUx/H6
 X657EYg/QPNt1W3SPu0IjvXQvLqdiebuhMmd2fb7i5scMvqoqMcT0srIKjSqZIdwCkx27zIW0Fx
 EvrpUgkoQ7CLNWSLj9sXpnwo4dxYdFuJzIOjfXDXOucBv1rEeaAvhJuS4UKB5smZ6NB01Cam8XZ
 3RzynDUE8cWtbc1HvjU8s6VF0ukhLEU+A0KL9/TThBEdBn7VoXBcRiUd+msKQqieC6o2HEuNIiS
 RaFOqcxdFhetlyPIBn9W5YmatkrT0T50IZVhFCR6+aj9p9nSWrbT9dUJrxhHuCjPY2HrhcE6sBy
 v/KbAIyTFvrEH6oBqNfmzu81i8/iyR458uSBjccQPPbCySLznarH8hthX5YBlsrr1TvrtFOk3zD
 RKTxdZX2qnLomBOUZWA==
X-Proofpoint-GUID: STD4qBHtaNRZR7Xd3QpRZ2K9daLZxSg2
X-Proofpoint-ORIG-GUID: STD4qBHtaNRZR7Xd3QpRZ2K9daLZxSg2
X-Authority-Analysis: v=2.4 cv=LsSiDHdc c=1 sm=1 tr=0 ts=6a103ae7 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=sKMSgL6xGKzgxZtRr_wA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220112
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-37354-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CD92F5B2ED0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/13/26 4:00 PM, Ajay Kumar Nandam wrote:
> Convert the LPASS LPI pinctrl driver to use the PM clock framework for
> runtime power management.
> 
> This allows the LPASS LPI pinctrl driver to drop clock votes when idle,
> improves power efficiency on platforms using LPASS LPI island mode, and
> aligns the driver with common runtime PM patterns used across Qualcomm
> LPASS subsystems.
> 
> Guard GPIO register read/write helpers and slew-rate register programming
> with synchronous runtime PM calls so the device is active during MMIO
> operations whenever autosuspend is enabled.
> 
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---

Looks good now, couple of style nits since I asked for another revision:

[...]

> @@ -107,8 +118,8 @@ static int lpi_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
>  {
>  	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
>  	const struct lpi_pingroup *g = &pctrl->data->groups[group];
> -	u32 val;
> -	int i, pin = g->pin;
> +	u32 val, io_val;
> +	int i, pin = g->pin, ret;

reverse-Christmas-tree ordering would be neat

[...]

>  	u32p_replace_bits(&val, i, LPI_GPIO_FUNCTION_MASK);
> -	lpi_gpio_write(pctrl, pin, LPI_GPIO_CFG_REG, val);
> -	mutex_unlock(&pctrl->lock);
> -
> -	return 0;
> +	return lpi_gpio_write(pctrl, pin, LPI_GPIO_CFG_REG, val);

A \n before return statements is customary


>  }
>  
>  static const struct pinmux_ops lpi_gpio_pinmux_ops = {
> @@ -162,11 +178,15 @@ static int lpi_config_get(struct pinctrl_dev *pctldev,
>  	unsigned int param = pinconf_to_config_param(*config);
>  	struct lpi_pinctrl *state = dev_get_drvdata(pctldev->dev);
>  	unsigned int arg = 0;
> +	int ret;
>  	int is_out;
>  	int pull;
>  	u32 ctl_reg;

ditto

[...]

> @@ -206,7 +226,7 @@ static int lpi_config_set_slew_rate(struct lpi_pinctrl *pctrl,
>  {
>  	unsigned long sval;
>  	void __iomem *reg;
> -	int slew_offset;
> +	int slew_offset, ret;

ditto


[...]

> diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> index 750f410311a8..a61df10d46cb 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c

As noted, please move to patch1

Konrad

