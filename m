Return-Path: <linux-gpio+bounces-35475-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHWpBhtH62lYKgAAu9opvQ
	(envelope-from <linux-gpio+bounces-35475-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 12:34:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB0445D246
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 12:34:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 747C43008C9F
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 10:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6939376466;
	Fri, 24 Apr 2026 10:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OHISf7a5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LYzurU61"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D3D3191CE
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 10:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777026746; cv=none; b=pgDKDyWfmar5tYCBZzqrTm9AzptdAQ5ZYRXzaMbwhITNkCxnsx/ai3tHQOMEOPRc4zPzRCos0RuTD6lFjIjh3k1n/Vrlbme56aVfXcPhaho8CAbcswlOw9x09NgN5C41aunpCyJCHFsq3zaHZfqnlgaT8/FaImmlGxhjpOlkTPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777026746; c=relaxed/simple;
	bh=T7WkAEnwuSu6CxqIu98ePaTAeo7wDvHto7Da/AI9ks0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UPfxIJqnpwUjIwZw6v36BPFo9c+wIJV0bHEGt/TClqnFZtNFW1woUrlFVsBSyN783CZwnGQd629aXvWfVSZUyScv8rBSMe1HosUb/lZdzKs/VuM0xcYRDb9dKwlgMaIjV9G8xhkNaFqn7EvpZhoyHu6MXvlNgDwRXTFdOXJXs6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OHISf7a5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LYzurU61; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O92Uah1533268
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 10:32:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MVkSXzb92ByoCC+6I5IaVA5g
	vdBKNRSIBMB9RsJNUwk=; b=OHISf7a5OP4oPZ8v0BkbcBY9uLx7WZiCTK6DFcIb
	K74x2NBOXT1b8n7eALuqhHok6adUl42I/V0sHEqhgZ41xTdAkntBCEhLLl7qSV45
	Pjdq7iu0/Su2CCYb5RoUU2BI5n5lVt9gmOlFbWX3rLqYZKvemru4mRLrFVYweaEr
	Oq85oxYPVydI9xNPJ8pFtf26r385bgb9CH9B0NK7X/4/cVXK6LkpQE2rBKrPWiQW
	nkFVjHdrLZJJneFPR8BI2bxeLq5W10xmq56VsLQu+6lyV2Cqc4ajkeXayBQLSX83
	b7PYQzyylVvh6Ax2I2Na0UE0nBMwtUMhVf0aOv0x2vu4bw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqr26kman-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 10:32:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e592e833aso77437261cf.2
        for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 03:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777026744; x=1777631544; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MVkSXzb92ByoCC+6I5IaVA5gvdBKNRSIBMB9RsJNUwk=;
        b=LYzurU61eqjRs6fu7Iao5ABTp/63cEjQuNz1MT8UNNGcJiGVYjrNvcyyltJJcxEUEe
         X3MEBTkYG5LjDuGnUlM+AKO1wx8AgDrW0xiogJuUMRwdkpNuCZfRKlK2eVCoc3tdJ4ij
         K4eEI0icSnflZhdxYB0NnKxj4+UnCmFn114sB4fzmgXG51vEZ27SJ8iHDGUHS/3naO9R
         P1U9ufF1kXlYuqOw52IaVjhpeXWsVCy37ODdKRcajRf/oPXwFxTh7/WKmob8IOA8sveN
         PR/twgCENFbkSQk/FBsuldk0XGBLTeSuZ6SanMElH7K/ffHVFgmF/jYYzFU+zECeklkA
         Ukfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777026744; x=1777631544;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MVkSXzb92ByoCC+6I5IaVA5gvdBKNRSIBMB9RsJNUwk=;
        b=pet1eIbvULVCdOpRX5DMsv81eJdRwlDwKVe9le6VHzDSeEXEREzBLoxbAkDcYqtjSX
         OP6YIEqKJWox9xnHSdfNCcIjZcgRjmLg9LrLorhR9bE9ci22bggeHdTorp1cGhWuDwVQ
         sxpiqPziusbbvcyzYKIiwYMR+xHheuQvzzsoBlMQH1CiF8T4UmwlLV2pr6TvOlAaKSA5
         9zvmhsEN84mBz42sKxMbtDa3BRjQudmQY7S4wWGIPAZW36dxOTXqkMRlPlfvAPXhLwZs
         f2w/aAbF88xy8hNhi2ZVXxiYHvH0RNJIKoezKwoAT0PYp3Ul7Ddn+Rv5Cl/khPF7VE+F
         pCvg==
X-Forwarded-Encrypted: i=1; AFNElJ/wVcZBP6D4LI9R91hXEAXhfe7bJ0Fsv+4tsFdaY3Eg0btif8vF0av/iHl/EjhCMeI0LcgAmcFNVDZ8@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrd4Twb7DUsLiuf4FI+Mo65AbhNgnB4deSnFcrKxL5h3lG8xHW
	vMgijI+nyVQTYlUL1IbSwahClPSuvcbQtASM3HvmRiLKzNNjvGcTEmjyYRr0tqxHxP9kEcRfFWY
	53tyGCn2Ocbt1eMlea1PiyisfYg7+sy76aGi4Bqd0IHTYV5nY7Hd/4PNAabLUbjIa
X-Gm-Gg: AeBDiet2tObmPxJqqWOPflE7kgVJtdqMrF5b3pdhfw7DHxocYujb4OkzWutRHuiOrlr
	yJID0YJ4UxBiMuMEySJ2JDLEMSpDXJ+eLtureTQ1d3xTHQ0RgljVjLOZoximIyJyTB9SGc9BNML
	idZjT5M++SQ+VJj1MYwYM1knWjfIzHZ0/LY3S9q6s3+FyF0V+2o9h7s+1FliULmH8lkYf1NkAXi
	k3f6f00z2BK863UGawwCo/AZZbyvwCQuzsiL0S0sakHd6n3i3gs8eiGO8zi1K6bymr3XD6iE3jl
	11cw0m0xlQ/LPJix3oThwWlCtJjqDEjXydQzlhoSu2AHg+xbrrANpcXvpKnoiVO3SEzKpsGYseF
	jTg7zMkdgwxWOpBr3IQnWNcReijp18ub1b+7/4NHrSEiPGrg=
X-Received: by 2002:ac8:7fc5:0:b0:50d:7c13:6b14 with SMTP id d75a77b69052e-50e36bcaa7fmr451953521cf.14.1777026743841;
        Fri, 24 Apr 2026 03:32:23 -0700 (PDT)
X-Received: by 2002:ac8:7fc5:0:b0:50d:7c13:6b14 with SMTP id d75a77b69052e-50e36bcaa7fmr451953131cf.14.1777026743372;
        Fri, 24 Apr 2026 03:32:23 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cc09b1sm59904989f8f.9.2026.04.24.03.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 03:32:22 -0700 (PDT)
Date: Fri, 24 Apr 2026 13:32:20 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] pinctrl: qcom: eliza: Split QUP1_SE4 lanes
Message-ID: <zdfkufie5chwqazms3sesgisvitwlwrupmkoqlfcvhpqemhqtq@7uj6qkth5noq>
References: <20260423-fix-eliza-pinctrl-v3-0-68b24893ae63@pm.me>
 <20260423-fix-eliza-pinctrl-v3-4-68b24893ae63@pm.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-fix-eliza-pinctrl-v3-4-68b24893ae63@pm.me>
X-Proofpoint-ORIG-GUID: JM9dGpHdDqypNjLeHKE_1H62uEXXuXrp
X-Authority-Analysis: v=2.4 cv=QLhYgALL c=1 sm=1 tr=0 ts=69eb46b8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=27t9AhEcw4iSZbU8vf0A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: JM9dGpHdDqypNjLeHKE_1H62uEXXuXrp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA5OSBTYWx0ZWRfXyXQx4SPRguIV
 HJhVH8OrTtmzLQbt+UhBLiQ87sV6wV8lokUbNNaWuAa6ToCRU9JBl5SZQY7B6sO/CJBsCv2/G1/
 jdiMR0DJv8VTcBk3WVKu8m1UA8T6TPXlcWkNVmbqRmb6IC0EGcZwulgs2zFba7oN8L/lI5p8ZfU
 LhQr3ceXESwqxgkw9zrElIalIuUobhkKnNJF6UxeSfK/d9FNPdSnmHwCkERzoqIbc+D96kMGBiZ
 r0d2azN5Tl7LXnN2YuDSMroDaoO/aYiPiJGPQn4/XJhJh15txUj9qIozIlil9S1Eqz4ASnDLcqS
 K/8td4Qykb8PrLIuEmz0KzM3htphzY7vajjG36Mz/fxDzeeStXrM7HoL1MZUdf06Su3uRfgFBi9
 7ZpuNIsNHEl0FMwGi6j46sRJXMOpUXrZTI/CWi28MyTcLYISYvByHW7+E0xuvKtOXpQHHoRWybo
 x6CJVuo/yXdle7yEriw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240099
X-Rspamd-Queue-Id: 5DB0445D246
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35475-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,pm.me:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 26-04-23 04:43:46, Alexander Koskovich wrote:
> QUP1_SE4 shares GPIO_36 & GPIO_37 for both L0/L1 and L3/L2 so the
> function name cannot be the same or the alternate function cannot
> be selected.
> 
> Split them up into individual lane functions so boards can specify.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

