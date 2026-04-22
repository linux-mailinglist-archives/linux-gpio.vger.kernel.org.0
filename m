Return-Path: <linux-gpio+bounces-35335-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKXTHjMp6Gm3GAIAu9opvQ
	(envelope-from <linux-gpio+bounces-35335-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 03:49:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAF644128B
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 03:49:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2567F3020939
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 01:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2307D2EB5BA;
	Wed, 22 Apr 2026 01:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ms8Cy+ly";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="itIgq8am"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2171EDA0F
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 01:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776822576; cv=none; b=bdfXl4fFewh0q6JVFu1A8YVCrxnxXwCMCKQUKSvglGG9lBdjpKhXKV9LHmAidgkDkSMeu7F4/8fADOvfFWmH7pxJP0FCEM0hroQMhvOqIBE/eIbrUFg5HpOPKjEkogoCn4K7VukiAWePEhP0dMHD87u5srEPAJ1MSW8yWer4dQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776822576; c=relaxed/simple;
	bh=+Wtn7wvNYHZYHKoX5jpV9Jp81OC6dD9Jr4VMinq3PGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K1M8YTtu59IqiezSalywbjrljF/ixK4IvdTtajWwWLZGjel7EEOgkvgOtipazomUvJVa3hhN1V407xUmd/xaKwmG1m/Te0vdHsIO47qmzImDjRJ+GRFTxVROrjkjQ9tjz57aA/0s9ZIe38EiZtSDfFbStJgIzQS9my8tXfOeW8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ms8Cy+ly; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=itIgq8am; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIZnps2965949
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 01:49:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hurFr09vNtmPRCEJnucpGA3f
	RhEigXPf8InOBEhGYnk=; b=Ms8Cy+lyTo8U8uLX2ZfLEM+kvoRgLHCEf6ouCKac
	vPQQn6FqXzvayAm96xM5z7MTjnYIsJojkmCvgUaj7XwVWc+zIU2SvYPKUk/TrJjj
	ZBYC6KG0jINAGs3Z2t95R45sQhGyEKUEslf4yHLcGDVrpO0l9IB0pOQTmN4o1RzS
	D+amClEcSUbvkr6OPQ6mQ50k11VcxIsCCjLwKUaiU7vDX5GIChkJ7R9EP6go6nFL
	AdtlLeIs55ybvZQs2pmfVK9m7DPcy39wvcwE3jhWs2DC9eM0vqOOfQ8xbv/Zzqtf
	vtU2Q8ISf17YTcQfKAKyQBvWSV0H3lQ3yJVWYqdL43onSQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfh4sk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 01:49:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50da529ff48so120382461cf.3
        for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2026 18:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776822574; x=1777427374; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hurFr09vNtmPRCEJnucpGA3fRhEigXPf8InOBEhGYnk=;
        b=itIgq8amY7a4wPD9GY0JelE+G8QoQXeG1wbRNyIJhEd0DK/u/FEd8qrZUaACqN6C1f
         ktLlX5zrcLAzjpzJo9bfZfBSerZ0+iA1zgZ422lpwDmKtdECofUuaktRqnPmJZZ8Ax+x
         f76fh9kOpZElnVSKG/ErLfDvPaqOZ99PuOGPn5yy4HPlvqgpDswxURHDQZ0tn0tSiJGd
         QtHyVTHzyFVMewGbP1X1i56CoVsCv0C6jsrRHCCg5qJKR8nHYx9H8v8X8y6RwPjT25Ar
         EKowb/Y6sYiI/uZg95A3Vxhl3fsRadjws7W5RmyW9U8hSkgPoA9kvJeOgdzDvdrdiP7e
         r14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776822574; x=1777427374;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hurFr09vNtmPRCEJnucpGA3fRhEigXPf8InOBEhGYnk=;
        b=I392vO+xZsR6cBXr+Kquv/goCOEO80cuYV+XkTe1MvLPKmC/89qQi5k3lAYQkGAmb6
         YxddDcahxCMmTP3ufeJ4ybYV1GCtJeXBHtuq1NiorTAr5K0ErgJYFE50Qdj4lQc+7lWU
         eAz4FueikaHB4Wq3QBnQEimkMnUU0MXE2S0ZQpkwKFcPE9i5IJYvnp0Vn2eTu01mcBQl
         Xh9ZXgXcUu/HVtm1i3fjmU5iyV1n3IRM7wGkKMzywBjY7FgC1v54QltatmTqvVviQZJQ
         rh7UobgcdFnm9EIw2sAeeDOUWjQ0L5mypYtRBxp3kkq3/S7zcflHHZrxOuFRnavLM3Dy
         7Ayw==
X-Forwarded-Encrypted: i=1; AFNElJ+9WL7/cxyeoIQAn7ijum4wmqkw7I2yLLomteb0HWW/E0rUgd0ivA5AMfQuA8wLjhGFrYMYzoehinsh@vger.kernel.org
X-Gm-Message-State: AOJu0YwRaKI+tDyARRpIRcaigjutQxxe+9gsyl6fLi8lPTe9m32Rw4Xh
	2aJfSAyfZIJC+hXsiuoJd0TduMaqCrRwhNcv+Wojq9f1mXyKm9c/m06AeA3N0vNB82jPc5Yif5P
	MGLTeukEfuN1J4o+VAAyBIiYn9qXWOxT6T3L1E+jnZFz9HG4v9rGkxyPIK1uoIAsb
X-Gm-Gg: AeBDieunFnxHtjfdms+efNbPitITZw5UDU/y0189AFB4kUFElq+YBhUKRoetohiO5gw
	AkWqz2bNQjoxvjubAA2PlfQLp+dmwgNeSMDSBoji7TBz90HIMkNTklv3+69LXNlGbpWy+WkIowu
	/khKxVciwjaxECAOBQTLIAE08iG2Zy3GYMfK4Am5ZwDLFpGs1pkio4Qzie2daNnU5L7rdbOU1PQ
	X6SjeUIRky9CLvGV/slkL3LuuzprzWRtHUY8gaE70SlU+YR0pp6z+VbXJAykm+LG2g6OJ7eXnDd
	0rzA3unx8zWTE1NtUEH6Gnjhv/UGobuuJXA0+TCdzVatpUn+074olJpIGGrl9GQZmTs+ajq8EOS
	I0awaP+lxbsls25IxL7GOPNy4B5HFQjn1/mICMoqXIEinLqoqGaiJn3yemDePmvB1Ut0xis+Fh7
	pGAtcFOHZDohYDlLdZCVAD9f8ZXxWolCeFQVepENB7kMHvFw==
X-Received: by 2002:a05:622a:11d5:b0:50f:b732:202c with SMTP id d75a77b69052e-50fb73225a9mr67301301cf.19.1776822574130;
        Tue, 21 Apr 2026 18:49:34 -0700 (PDT)
X-Received: by 2002:a05:622a:11d5:b0:50f:b732:202c with SMTP id d75a77b69052e-50fb73225a9mr67301061cf.19.1776822573662;
        Tue, 21 Apr 2026 18:49:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc25csm4072345e87.26.2026.04.21.18.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 18:49:32 -0700 (PDT)
Date: Wed, 22 Apr 2026 04:49:29 +0300
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
Subject: Re: [PATCH 7/8] ARM: dts: qcom: pm8921: Add USB ID extcon
Message-ID: <7cbmtdsq7iz54fkxckyfqgpkcz3yweg4rrfvo53vyxmraqj4kl@yrioxjdcxu6i>
References: <20260421-mainline-send-v1-sending-v1-0-bcb0857724de@alex-min.fr>
 <20260421-mainline-send-v1-sending-v1-7-bcb0857724de@alex-min.fr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421-mainline-send-v1-sending-v1-7-bcb0857724de@alex-min.fr>
X-Authority-Analysis: v=2.4 cv=Y6rIdBeN c=1 sm=1 tr=0 ts=69e8292f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=0w_FVvD09BqdKzzQVHwA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDAxNSBTYWx0ZWRfX0qf+vJVJaKUq
 1G6uQJU0/SbtPpeoAOnVirKPFYGpcfGgg4yqSq+D0b+fbmqySwLDdHzQ9xMZvobRsSAU22VswoP
 e5Vj6eCI969U0sYQ2sSLoS9SGGg9u27C2QNIBxsVuZTPIjKjPQ2Sl2XIfyuTPB/qKHWOXL9G8yk
 bsJ2x9/CSAD7UMocyFpl2AABJq5MJXWIkcK6mD2wO4HquRbIqyS6EIKTE2FXOpwTp7aQySoxhXq
 1ASFE3DgBU2ZHyFL2q1/tIUU0lZJLF+bMP3WpV+ES624ro+mcSZf60F1+f9DNEkywvcttxjLDjB
 AmL90187+eLxzA9nSHHOIwHkYS/V1dsmimIr49k57nESTf125UctPI2VuK2csxO1u8ILAY8yCyB
 Qb40Dep09ph+kicBgTU9XVnORxprWr3qWMsyZSH2JRHkTUJRd3+PxJUsfSkErTiuPLr8IlD+y+h
 h5H3gOT0pTKG4HCcm8A==
X-Proofpoint-GUID: 19tIwlD8YvHmdLxhU4G-iOJWwHWE3LP_
X-Proofpoint-ORIG-GUID: 19tIwlD8YvHmdLxhU4G-iOJWwHWE3LP_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220015
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35335-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1AAF644128B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 11:45:13AM +0200, Alexandre MINETTE via B4 Relay wrote:
> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> Add the PM8921 USB ID interrupt as a disabled extcon provider. Boards
> can enable it when their USB controller consumes the PMIC USB ID state
> for OTG role detection.
> 
> The interrupt corresponds to PM8921 USB_ID_IN, block 6 bit 1.
> 
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
> ---
>  arch/arm/boot/dts/qcom/pm8921.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/pm8921.dtsi b/arch/arm/boot/dts/qcom/pm8921.dtsi
> index 535cb6a2543f..935383d6a594 100644
> --- a/arch/arm/boot/dts/qcom/pm8921.dtsi
> +++ b/arch/arm/boot/dts/qcom/pm8921.dtsi
> @@ -41,6 +41,13 @@ rtc@11d {
>  			allow-set-time;
>  		};
>  
> +		usb_id: usb-detect {

Let's see if we can find register info... Anyway, if there is no reg, it
should be placed either before or after all the other nodes (to keep the
sort order).

> +			compatible = "qcom,pm8921-misc";
> +			interrupt-names = "usb_id";
> +			interrupts-extended = <&pm8921 49 IRQ_TYPE_EDGE_BOTH>;
> +			status = "disabled";
> +		};
> +
>  		pm8921_keypad: keypad@148 {
>  			compatible = "qcom,pm8921-keypad";
>  			reg = <0x148>;
> 
> -- 
> 2.43.0
> 
> 

-- 
With best wishes
Dmitry

