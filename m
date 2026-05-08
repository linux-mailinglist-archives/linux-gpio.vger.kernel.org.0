Return-Path: <linux-gpio+bounces-36468-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDLtHLzp/WkPkgAAu9opvQ
	(envelope-from <linux-gpio+bounces-36468-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 15:48:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C45144F750D
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 15:48:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 138033063239
	for <lists+linux-gpio@lfdr.de>; Fri,  8 May 2026 13:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EAA83803DB;
	Fri,  8 May 2026 13:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="op5jTyhE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="amnqz/6D"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE563E1226
	for <linux-gpio@vger.kernel.org>; Fri,  8 May 2026 13:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778247663; cv=none; b=d2/5F1FQyz22pEa2fG2R2tcBooXKJolkeSAfdcpAq2UdMysAqXM6/NKoioOwMXYJ+wG8EWlqHR06Ae1XBjBkxx4EB8HXULYDFZw5WIy9RWf6WbcnulXlcSuGDupWtYTwctARE5yRQOuIm80HQpKZKqm0X+EKgvXj62/AlwPdFHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778247663; c=relaxed/simple;
	bh=GsrsjJfrmd1hi8mZlxFpPo0t8Qi+/KDd3IEbRtHDkF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rtIW7FVKwhPCA8bJ5Ob1eMBgNlh4bIv+6JsMcBmuvz7qtli5q9OpelyNRZrNavQh+gDXTzLzx4aexQDdInktdEWDGll1EB7CVmB8FSc6Nh9cXNbOs7QtEO6NGr2pi+yQc0dMxLBN9y4a5UTAYk9osjcszxM1wqq/MgycNVG4j/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=op5jTyhE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=amnqz/6D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648DGOEk258107
	for <linux-gpio@vger.kernel.org>; Fri, 8 May 2026 13:41:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ew1QykUYMfqGkPhQAGD7yJTCSOwC3LlUxyKWVUGR5Q4=; b=op5jTyhE13GTQYNh
	1MOtVe3Un2yeycXmJ/2DQEIdlc/8mC4UYJ2cBDPBuwpfZ8lHTqLkIIQB66p/qzBA
	sFTfKqkRXDec8uOTdilorJMQXQcyuHTHWae14oC1I5vnqjcuGAzeq3xOpmO+OduX
	GNcIdBeuauOve18aaCjSJ9wiOsOWDRqWjg14VuRmYMxgiCBAjb+A5/TAx3DGRnsY
	0d0+02oy+cvZudRYRtq1Pe2zuSwAxAHZrNj/wrI/PSQA3oUdb72x9rdnlKWkcY31
	qFC+w7N0YJ6KXXm0zFe87AgOuHihon0JuOu0SG8EBQjGbAQ5PCDUTiLdQrtBuBNM
	h2WIXw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1auehhpp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 08 May 2026 13:41:00 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95192ee0b2bso118932241.2
        for <linux-gpio@vger.kernel.org>; Fri, 08 May 2026 06:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778247660; x=1778852460; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ew1QykUYMfqGkPhQAGD7yJTCSOwC3LlUxyKWVUGR5Q4=;
        b=amnqz/6DEKcw5uRNryOKIZWOUHMLsrIHky3/kxEnxjRV/sZ6JfwoRVNqPq/nmTV+hn
         k7dPXwSNmROHwmNMDWKX2iu3r3tPdiG6GnWlwSnXeaKMLiCBs1mxK2B4nIQQmDWHA9Yn
         /KtpQbeQ3o3x/DK7spDTJQFyTElzU0oc6imbRx3tFHZnCG/gdbwCF96faS+Pn9ZHjiDc
         Gx7dx9z6Db9pbQLKCN8ajg94IobK0u724DoZMljBlYI48s7NDCFJ7BInSyoETmifc3CC
         Y3kXJTPYLUo5gm4DKd9xEtFhntX5fgfHc2l9Glas4/JahsSuezjujLL5NC1ZZ+jYULPM
         n+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778247660; x=1778852460;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ew1QykUYMfqGkPhQAGD7yJTCSOwC3LlUxyKWVUGR5Q4=;
        b=Fh0BAeHQ6eObfrtN3ACI2XxgBWb60v3NvgeU3HwBorDI7v4PEkAHbZMP81IvKKrUSz
         kQgV52GoeuHYj9FPSDu1C4MEnrxpHK7FUWHdbcDTbN5s9w/E3wSUFaRdvJhxU7HIMqJe
         1+PJg9gPWDA41/uUpABuT7bG5HemxWn/mQ0N5r9wrKX1Ox+RBA0EZHA9vhkJC9b1QVrv
         GpZSwqmDciEKCjDxyA7571+tF+3FZgRdTCIwA3JiZY2WUcCfRNyR1KQO6TaYKizEYvQ5
         /G5uJwF2bxBYTOVvmlVP5UAh7xp86EfarMvkXFv3L0pwt5sJjfps38fNS19Ho61cMFty
         +akw==
X-Forwarded-Encrypted: i=1; AFNElJ9smTaQXXxglIcGdj+zIQVtu8qZhKf5Qfqc6QpLkHP39wqFbHDiSmlhwtjPkgNzVWspWfmj/46cnx6C@vger.kernel.org
X-Gm-Message-State: AOJu0YwD8uLHGE+F4Gw5LoDwgER97ET4vroVlyQKAfn8rJlCjaTjfwT6
	b0KElsyOurnBsKkwfTvBIPWqH2pmDqJRbVAuZ4FxSls2+kG2qfSobo9WAVbUV6261EMLTlH5iCf
	EJvshz/ju4liGOlKWdiXhMM1U8+eVer6yf/KyONAvPHPLORh8E6j/RnnAuv344rBU
X-Gm-Gg: Acq92OFMTbARC2HxlsnG3LINr3DWsWVAtrxVfUV3Ny3Fw/Q2+e8RimrceGiifbyogNb
	mDu3HgxlVUNF6wRLNoGmJ61rIA6+bEF5J5hQv3O+xIRwiAapsSLF3foiqkXc08gWeA9A9MhKaTu
	ZAXpvmrrYSUw3dj+waBLU1dA5fr285LfmKIpx1NismwAQm3lQ+ejgYihdHwS0oLcaGi9dQPI2mD
	cZeMFpGDZscwHuTs2GOk+fU5SeTlcbfWazjvtzzcMOLR+i8PQ2A0TGxc1Te0VmFb4eAOZ2oeY0V
	r35DuvZqU+xHwvVHyro6ugn7vGf6iHiiL5eTvPFBc7LfsMcfQtVjLqLKrGDawvBN4EKxAfKnTMD
	qn6kOwxepLYNUnIavdI/TC8KZ56urU+62XNzr6xL4TVUjAsJVQcnKFt861gfOQk8UVXAvo4D7DJ
	EPLPI=
X-Received: by 2002:a05:6102:4425:b0:62f:fed:d334 with SMTP id ada2fe7eead31-630f8fc748amr2947901137.4.1778247660072;
        Fri, 08 May 2026 06:41:00 -0700 (PDT)
X-Received: by 2002:a05:6102:4425:b0:62f:fed:d334 with SMTP id ada2fe7eead31-630f8fc748amr2947891137.4.1778247659555;
        Fri, 08 May 2026 06:40:59 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac3a7f89fsm80509266b.29.2026.05.08.06.40.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 06:40:58 -0700 (PDT)
Message-ID: <b2e69a76-e484-4b48-a0a6-89279e597da1@oss.qualcomm.com>
Date: Fri, 8 May 2026 15:40:56 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] pinctrl: qcom: lpass-lpi: Switch to PM clock
 framework for runtime PM
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260508113636.3561383-1-ajay.nandam@oss.qualcomm.com>
 <20260508113636.3561383-3-ajay.nandam@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260508113636.3561383-3-ajay.nandam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE0MSBTYWx0ZWRfX6pNeYJ6vcavZ
 f3z1NU5vin9dsDiQBKkPm4zVbY9bcW2twFd5ui5/IKTTPo1YFG6Q5QLbi0TeuD9VRwmA+RLl87n
 7Fdr4zJW+rsw04eHS9XpxIRmRvayg2I3vPu7VoniJnEEE7GQ5EhkZYVRZtGdPA+un8uwQ8nTX4U
 VfgbJKmT2LsTFcqOOKUQreSxhQgckPlrBrzFpZ5Jfemv+MTvSe2FXm3BWaaXWCUHoEKK5yOuF8Q
 ftN4gwlxoa1KgtegSu8h686aSW2qwhj2ZHjpscgWYeEi5DtCz5m4P9egcpLX7Aj9k1upLH0It1c
 fsfBPGI18mGccJn1fUhamRyezVGwvLTTqK5mV5Dp15G4AYFAHxQT6YZrDDRRbAcJmWM/b0IqCLR
 cNcDL5Ur5yVYDBDqNtPUT/UppxqPPG/5B86lqbUbXavgOeRKU8YFxlUc5opPeLyn1HShcTOxMCt
 f1+ExmLx4Pa4XBXVoww==
X-Proofpoint-GUID: 5TduLS0V7zK1D14bb_xAVuK4aoasvm8q
X-Proofpoint-ORIG-GUID: 5TduLS0V7zK1D14bb_xAVuK4aoasvm8q
X-Authority-Analysis: v=2.4 cv=fcydDUQF c=1 sm=1 tr=0 ts=69fde7ec cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=taKbEZwsV8UQGDR8iwEA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080141
X-Rspamd-Queue-Id: C45144F750D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36468-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/8/26 1:36 PM, Ajay Kumar Nandam wrote:
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

[...]

>  	for (i = 0; i < g->nfuncs; i++) {
>  		if (g->funcs[i] == function)
> @@ -119,7 +133,9 @@ static int lpi_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
>  		return -EINVAL;
>  
>  	mutex_lock(&pctrl->lock);
> -	val = lpi_gpio_read(pctrl, pin, LPI_GPIO_CFG_REG);
> +	ret = lpi_gpio_read(pctrl, pin, LPI_GPIO_CFG_REG, &val);
> +	if (ret)
> +		goto unlock;

Please remove the mutex_unlock/goto calls and replace the
mutex_lock with guard(mutex)(&pctrl->lock) instead. This will use
the scoped cleanup mechanism and let you simply return directly,
shrinking the diff

[...]

> +	pm_runtime_set_autosuspend_delay(dev, 100);
> +	pm_runtime_use_autosuspend(dev);
> +	devm_pm_runtime_enable(dev);

devm_pm_runtime_enable() can fail, please check its return code

nota bene pm_runtime_put_autosuspend() also can, but it's much less of
a problem

I gave this patchset a spin on 8280 CRD and seems to work fine, nice!

Konrad

