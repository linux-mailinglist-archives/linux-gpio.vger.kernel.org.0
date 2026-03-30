Return-Path: <linux-gpio+bounces-34444-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJSiOCDFymmL/wUAu9opvQ
	(envelope-from <linux-gpio+bounces-34444-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 20:46:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 408A335FED2
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 20:46:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57289301E3EB
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 18:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CE593DFC62;
	Mon, 30 Mar 2026 18:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dy05irhr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H2hs5Eci"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1083DF009
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 18:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774896347; cv=none; b=fbsEb22FNRkG5PGFqbipYPBHrJmTfUK4RPfIYWSpU1slOqNuJCWQ/oATSiLbHItZpLBFzBKCN457iK2HhYrhRJ1awnzr5QvcpqHADzRGdr5a1RwEtm24ly1vAMp50LZntVg97WCcNDqsgHn6bEDZEZQPNJfKOe32GWsK77JiCH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774896347; c=relaxed/simple;
	bh=d/XTOWWqm0oWktvbWfuLO3lQrFQbiTUvkqPjUJxxsdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OQJGVnSGGmmlxlDANf69wYtgzTLAs9fABDkE2Rgv4/3PhpNy9lg8p8xHBuLNai6S/7tBl+tU5GpmUnjhV+Kh6xPWkcZE6m7QhXh8p5dH/KZypibGAlhRZQ75VmMGXiJsxKCjRmS/592xu8H7/E5xSiAce6TunyX/aczOWC1IMAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dy05irhr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H2hs5Eci; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UEOO4H1557499
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 18:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QGINkZ/CzxHJcm7+tFz+ACk2
	brf74z0Uya2Q4uJAxoM=; b=Dy05irhriU+J7yUhudsbZXn8tWmLa7wIUEuFnmMi
	aAYr4iErDkjDkTjU4zJGy4tFWxRnkiwufALHBYfiS8oEEhGx6EKQyW/fDZuOZDl+
	pqEqWtz5SGkHVLrosE29bceG+FmTXVzWZC89suVlhfnwu4oocRGGA5mTE8saeyVt
	IYk1BKkdSLX6kvHgCHZGwC2J1rrruxrCy2NBWbPCQNlY4OQPsltL7AuiYl3m8t/K
	E4IeQ+6gD+fOuvNQZUN5KcSQ3L/pXJ+Mbm/+wU3LlM30EcdvL3rJcp1gPBCEQp8i
	D6GQjiljUcx3JKDVBsmqH9+8ZkXJX336bpBqYxP/jSklLA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7twm12b8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 18:45:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093025ffecso152503451cf.0
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 11:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774896343; x=1775501143; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QGINkZ/CzxHJcm7+tFz+ACk2brf74z0Uya2Q4uJAxoM=;
        b=H2hs5EciGhuhI0Vpd8i6TlEVDXQ0hAp5STn6keQl1t3N4G1LUhj/l9+ceJScGGXOBa
         x/dYKpeoC4CywXiM9AEKw639wgXL0I36ZUksnDbJ8eY45cXnHKOk9/tyMYD9QSrF0B6u
         Sr5omh1fDuAwqrnhax4Fi/ZA01NDsUEkMswqDAQ4jpkRsNIiN2yM9bgnnFOyWPUoyu0d
         HBIT1GKdINuyOkCCoKTnt5hqDsxl091kGA6inGSVYhoovAX4jfUR1wWL5vuNJlrWPfpK
         Z4O67ozyv1tGV4G63y8iNvzNQFZST2x3rNzBK4Mli9TKF/bq8x0SCiH27dpfe5qnuxBv
         EINg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774896343; x=1775501143;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QGINkZ/CzxHJcm7+tFz+ACk2brf74z0Uya2Q4uJAxoM=;
        b=RrBpjmHio4bKl1XFvguecssJxR5+MWfdnniGjuE03TF8YKBuGf5GhanvezdInv77po
         jHJ085D3jnYx7Qgrtuap/Kr19xWlZc+kDK2KVRGw3RinPUf7Gik1+WiG8awWYikP28t3
         wcgEfnXE9bJF9uUbjKz222na0mbKtrqDz8bm/BuAwbf+R49g+7FDwEOf48gd+8FAqTu0
         1cVR/nm2PDOvMWxMLBlSw/9+sudz8rWy7i7wL69gk5Jz0Vdn01aznA9QBZTPsJFpSADF
         BMb2LJVgEn28/WsTn6jL/BJs8zFEDTQqXk+ocH3mpIObb2ptSiXYR2VwgcCaR3Ir9JEf
         7dPw==
X-Forwarded-Encrypted: i=1; AJvYcCX9SiEuypGbXLYBpVrUugVtqI6Qn8mhLCsFp2sVqYvZsIeuckyQ9p7f1d8tHgr7LtORShEZEt2LUUFZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwOcBCtTA+kEgi424Y7PdpwPIoZqhcirV8a1yegAuh09LqNhjKe
	p7Gj0aMc8akm1tKiP+b1twA/fCQQU0fwwOmb0uw+nACTmxzY4FFD6wJFXi6Uh0awLTEDMl4z1g1
	BRG/g+qbiQEJaHq8FDksDG6duPu+Nw97zh2DOSTGNvWtI//CI0NwlyQXfSLrAZLKr
X-Gm-Gg: ATEYQzx2CpnJTeiog6l1/bkgdGkXa5RAA3bt7VUI918IpvnKIwDiDjXdZIKsQd8T8I5
	sKGcVVUQsZlFbiWma0/OgLP5xINBDeGAVhKzeTicGm1WVkR6U9UCZYDrTF9xKqTicOyerij9t71
	u8ve/FYGgkcw5aiOUbbBozabOqBbuei1UCVG/fswGVE8C64PGjcQXaUWqaN+x6d77ExEM714MW0
	TDrOyV3BcLhoubCCbAfMduPwirLIHNqJuu1k5QifsJNrytTnA1b7kQFzzOZb5cfMfmCdEUFcx7+
	6y1FgSQnqNvOuvU3B0i9IdOnShmk+LlUNZ9wEm6SgIi0vdmCvRoC3zNjardUV39jXjLTRuzNtxz
	345p8QPiU8Oa0aG1h8Y6roXawI5Xh+6Qo2ZiFEDy2YC+dhoVeQnpIB97OSsSdcRuq3HiSm0b5qf
	rEn2n6JddDoCM/d7jaHTsPOgzezZKIAlv9dLM=
X-Received: by 2002:ac8:5710:0:b0:509:23c5:3291 with SMTP id d75a77b69052e-50ba39bae24mr174205121cf.65.1774896343240;
        Mon, 30 Mar 2026 11:45:43 -0700 (PDT)
X-Received: by 2002:ac8:5710:0:b0:509:23c5:3291 with SMTP id d75a77b69052e-50ba39bae24mr174204611cf.65.1774896342663;
        Mon, 30 Mar 2026 11:45:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1443f23sm1910487e87.42.2026.03.30.11.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 11:45:41 -0700 (PDT)
Date: Mon, 30 Mar 2026 21:45:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 3/5] pinctrl: qcom: add sdm670 lpi tlmm
Message-ID: <ctbz2i6k3ipqzvus7nmz4wu56dp6qiy6cqspl2tqybdcgv52fs@xqbiskjxxfqn>
References: <20260330164707.87441-1-mailingradian@gmail.com>
 <20260330164707.87441-4-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330164707.87441-4-mailingradian@gmail.com>
X-Authority-Analysis: v=2.4 cv=IJoPywvG c=1 sm=1 tr=0 ts=69cac4d8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=NJrbL9JRX9UYfUS_aBgA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: ChV8mt6CB_HyBEXhswS2tOdzYOj2Iqm5
X-Proofpoint-ORIG-GUID: ChV8mt6CB_HyBEXhswS2tOdzYOj2Iqm5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE1NiBTYWx0ZWRfX8sV5fwHS/EGV
 ZaHbJxhFuJaWc0OFv+9L2XHoyRQYBv017yAe+wWecBzIxEL/g5X1vwEDLQNhNxn5r7NK+zo2YDF
 lM3xT6x2M5K+239ESr1Pbk3Nfei0cnsrWMiAYGEmoMCyOOvku76YBR54HOt6ykRNxCO36RrNuXH
 KTJtkZd3EaCVLk1HXDtO/1hDlE6oD6uIvR59b3CCpFO9s85HbTKZzOw5FUWOtodlbk18+E74wrR
 4SS1jH67/Ry8pJUwcfXdsmWXRUB1UiZHBDt5yKBFWbH6i4rXfGrm3fOD3xHxrzUmIQgkfaCaLvL
 DpdyZC/O1zdd4PjN4i5qxn+CaUxZjKaWeRBtZSapwNX9/0v4FCkHPCeLETVrusqBMPursxyMtom
 O0ufI9P6UCoSSCN/RF/CNy7Cjw5JkAv5vEHp/ZQNP6T6af9ry0a73YX/CW4UVAaj1VM9Sh+BsBn
 FqM2jEroDO5L5OKhyzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300156
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34444-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 408A335FED2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 12:47:05PM -0400, Richard Acayan wrote:
> The Snapdragon 670 has an Low-Power Island (LPI) TLMM for configuring
> pins related to audio. Add the driver for this.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/Kconfig                  |  10 ++
>  drivers/pinctrl/qcom/Makefile                 |   1 +
>  .../pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c   | 166 ++++++++++++++++++
>  3 files changed, 177 insertions(+)
>  create mode 100644 drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

