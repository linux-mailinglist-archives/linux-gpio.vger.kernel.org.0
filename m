Return-Path: <linux-gpio+bounces-35333-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDbIDZQo6Gm3GAIAu9opvQ
	(envelope-from <linux-gpio+bounces-35333-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 03:47:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7106441273
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 03:46:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3ABEB3026626
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 01:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02CBB2F39CE;
	Wed, 22 Apr 2026 01:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QtwuHiCF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S8fuKRy0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908311A6802
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 01:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776822366; cv=none; b=RY2PcYh6DDV6/XgeIO/2WkELRcT4W8sHZYUvnZwMiBrvbCvxbCGAakvc1x3hqn4g3uuSTjb7Nsjok/mgRC28sLdUqPNqth8C5UwK0xvKg0B12LvuAvbalEZArEbqrIiOgYaAwFlmKrm2RdKS/MYMllr+goozUNo7cowiT7RzTyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776822366; c=relaxed/simple;
	bh=J4wTpoeaO9WLgzP8Jpje86KjuxOS1HQB4mEYRLZ+P/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LxlEfWIGlGD+67Ek5axBZgghFTiUDtOY1HOumucQX5VdHGLDwywueysbJ7+i0m8NfGzf6d0soA+M5EWF6sH6LtNAL77DChfT6ur12KaDdmgzpqD3/k/B4tm/WEDGmLp+XHwwot/x+YOizLWEw4goiKBvup1IqckR89pnOQ0p0DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QtwuHiCF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S8fuKRy0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIZr1g163911
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 01:46:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d6qcSACXlaQj5b1ggVkdYa0D
	KEGMgEtnXT9U+NqrGGo=; b=QtwuHiCFZuUERNAn1f54hVH34luiWnKIkv+1Xwoe
	zzLEiV9z5bww8oPa2bneh88dqsZ1XdLTVfcWKoXs5aYDLQou0Ll1U+G2HK3K3ZD1
	GUoddhDQLvIKoFsxd8W6W2nLc/HMReIsQSkkc8WadJFTaBB9QDtKAbw1gQWt72yq
	ROF6kj8wDGJ09Esfb/rCYzutUz7sh415P5MBLLnUvCqwE5Z5ON8d7ARnBiR6hJDm
	p0oR8JoK2ecq/FHElgc2X1YtuVFgDxX0/UzHp/zQEE7PdYilWwN/UEFFkxDWJFpb
	sKGXarwpsVtlk1ChsTMI24bzJMjVfvteOOoXnWQu02lxRQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenhh45f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 01:46:04 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ac9609d3d6so129701486d6.0
        for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2026 18:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776822364; x=1777427164; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d6qcSACXlaQj5b1ggVkdYa0DKEGMgEtnXT9U+NqrGGo=;
        b=S8fuKRy0fwvf6z9T9x0aZm9Z4QwpVH/fzjIcClf4BI7WvKcp21bKv1DAOO1uzPVC8D
         IVh3Vf9gsVHs95SgdpcN0jLfHnvbym73fbFodnCINa/VBG43R7AE4Dt/fowIHI01At+4
         5MjYIHyO/ngXOB/Grz1342pe+UqvWfC1nkyd7yL3tebhBjBuMdpcsQPxKThvy9OwfTFb
         ztZbwamQZZXRife8W9gbni9CEcWlkL7LGBePOE3pLje5gRjSW08CfWTdzP8yPR83wVAe
         kkNTmEzLXvXmlZoX6dj/YuKUdVhsWnzpEFdaOtL5mnaxcePIGQfvE3ui5xFwktR2BDeQ
         So4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776822364; x=1777427164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d6qcSACXlaQj5b1ggVkdYa0DKEGMgEtnXT9U+NqrGGo=;
        b=GUc48P4A69CjKLVdIgAcMBCBb6l5U3YLimlDb1hzAjZoNm4nufUCu7z+RR3IGc4wpi
         mxtYLA9ZDg9mCiH4HYyMC1ZNnE2IuKzIImiGC5E1ddLm5Ye7/TgP/52jgDQKz/lFkn76
         t6R/IF74INiaoAdCOu/8G5jDtZn9c8Wh6gFjxm9Ces2ebpgY6MVVnWn8wDPVH0S9CrPO
         3JCF3X1Agxwhp03S4A2dsig3KBVWYNCoxBEVG7UnkHQINir6r9DIKLGcuIYMNkLLMeaU
         gueAvHEUEmC/7nG1cpe02e4ZXqFD4HWMEQP4ld+heFZAoPZUpVrPZkyXrRDTuIqkXe/C
         /1lg==
X-Forwarded-Encrypted: i=1; AFNElJ8kMEeDNUUlhAxOWEP+205pER1QLr8JFPX0ctt2W/+Lexxh8Au3tYr7AzVG1gxIWn6xWxNjTAnm94vP@vger.kernel.org
X-Gm-Message-State: AOJu0YyIL/p3sqwRhRPdte348SFoZkbrAtqqs+f+vsdu8bJRQlBQOdad
	cHF5Ktbr/K8O1GWFG5Fufx4EHCpFUDfuVMvM3MCGii015GQjaRwWFUGVbabr0kIoDA+61RnTR7A
	31khPRUc/k1/8euZZLd96qqSC8d7i5mUBbwHyHOLYq18LVAmskbpgbmFIEfRkh2R9
X-Gm-Gg: AeBDieteOHb/tZL/wF1EnAR9HxVdJQMPimz6SmvPttlHofez9Uo8T3yQMMZk6Dvz8Cs
	Q9JXff1/6ocea2OKralYnSxndxtEnoKpEOxyxkG/eIBaOMyxrun+eIceshUcTvIDBM0Qw4UgRfi
	VEnZ/sEkW7GUPOtosAqTOX4WejQYcmneOoKPRNjGo/AOngGXcseblXozLafxQ+lyUKmMH0YZMDG
	/x6/CEST3Lr+M4daulf1tFJtO/AOXeumjWIa0RgEIs2zunP1fA/Ja0uFUlO0K9N/JuEVv+u0FLo
	13KyZQ07n5GVn9cbBzac/tl9P/i4Cx8c/aAp8bIb1vHq7nUqWyvShWNjthrGtc8eqJS4F1pngAd
	b6av607Ksb/vgj2mnheuOvavvCcB80J0Iy8QNAqQAUSyHnUW4RbtlR0CbvEWst2lhR9utbOH3VL
	Qcn/f8eQ085zS+9Q5dG6IhB8AMxD7obArl3W1baqkebaJkWg==
X-Received: by 2002:a05:622a:59c9:b0:50f:b790:96ae with SMTP id d75a77b69052e-50fb790a502mr69541661cf.22.1776822363763;
        Tue, 21 Apr 2026 18:46:03 -0700 (PDT)
X-Received: by 2002:a05:622a:59c9:b0:50f:b790:96ae with SMTP id d75a77b69052e-50fb790a502mr69541231cf.22.1776822363300;
        Tue, 21 Apr 2026 18:46:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc333sm4131426e87.24.2026.04.21.18.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 18:46:02 -0700 (PDT)
Date: Wed, 22 Apr 2026 04:45:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: contact@alex-min.fr
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev
Subject: Re: [PATCH 5/8] extcon: qcom-spmi-misc: Add PM8921 compatible
Message-ID: <g7gbtckydu2avjg2on2vx7iez6btgywfid4wxki7cvzovs5m5i@x6uo3ghjysp6>
References: <20260421-mainline-send-v1-sending-v1-0-bcb0857724de@alex-min.fr>
 <20260421-mainline-send-v1-sending-v1-5-bcb0857724de@alex-min.fr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421-mainline-send-v1-sending-v1-5-bcb0857724de@alex-min.fr>
X-Proofpoint-ORIG-GUID: hvX77nHP8182t8IkRNzwacyJt7W-67Xb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDAxNSBTYWx0ZWRfXxeZs9t+iWNG5
 rU6PN64RceeXoNWJVdXAhwmQZuV/rJro+hQca4rwBEnXq/vEQwXI2BkdoQioT6l1v2BBK42aWCF
 6x/PFyuu3m6XPchev9pwkptPURxv3yRmanaz9NKQeVkpFDBB1BhtCjSD4o6hdPDL4f6if6qjO5Q
 zBCR5Bz0gwr/xuL/z4vRqLhPcJAUg9PcJATSXW94B1ypiUkdZ5gkkcv6qRwkRf7B6BkyLOZZBtN
 DNzy3sBrQXJq/Hgp3UsFxFSvW7UjPLXY4WImODn/sVxslpVvJmBuhrL21O5SWndGcxMKwlx4SK5
 BUwBOFivoLxBTGFam8OAdAWqLn7RztxJ7EBis1YRuWEyl8uGqFNU6SGjv9mgBKInWy8tcllZBDw
 fXHigQJO/wV5ZSmUEqZijV7gd65wlKZLexSh13q9sCj3AHC+qNi1ZtHtOB6vjkjkMLDkTLKHrZc
 H2SjVPxixhXW8w/6y4Q==
X-Authority-Analysis: v=2.4 cv=WKJPmHsR c=1 sm=1 tr=0 ts=69e8285c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=yfR4zB2R5DhERghfh4QA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: hvX77nHP8182t8IkRNzwacyJt7W-67Xb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220015
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35333-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B7106441273
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 11:45:11AM +0200, Alexandre MINETTE via B4 Relay wrote:
> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> PM8921 exposes USB ID state through the same interrupt-based logic as
> PM8941, so it can use the existing Qualcomm PMIC misc extcon driver.
> 
> Add the PM8921 compatible so APQ8064 boards can describe USB ID
> detection through the PM8921 interrupt controller.
> 
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
> ---
>  drivers/extcon/extcon-qcom-spmi-misc.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

