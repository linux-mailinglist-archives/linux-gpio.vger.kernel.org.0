Return-Path: <linux-gpio+bounces-33307-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLpjOdV2s2mwWgAAu9opvQ
	(envelope-from <linux-gpio+bounces-33307-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 03:30:45 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6095E27CC04
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 03:30:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 722C9303EFA0
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 02:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F9393093B5;
	Fri, 13 Mar 2026 02:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cpuW1Zbu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fFcmXUpU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D60332638
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 02:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773369031; cv=none; b=giM20sQjUmPY9C3xmGUnU4puAUMh9QpAVjtILNFUCUTCWlv10GmQuksp9iA09/+RUzYqd5SBlUvfR7VEv6fOxcuRT6eNgosJGrmUeib28CfqQ3ayd/vLZt6cw6YE1HBqclhI313ICmSYIo49MMWZeTTAGBkBFzi7mLhpw/7xOV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773369031; c=relaxed/simple;
	bh=1mtvmne0tmxkO3D2a/M0/PRV2aYePIwwey0xdsi8mGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OhOchccppPL0RRZjUQq3at7IjHDKk4s6TRTs38Vsk7WWLt9um6qcxSbPsSjU51UvrXocPCyRxZ4/q+c48+/amqtJvrVoDOwfoFMP6+/ERBimOl8PulXXnp+xETH9SvCFpFK9zFSlKPikVWumMn0fs0PvOswjXTcRElFNfc23LjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cpuW1Zbu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fFcmXUpU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CLZ1rH2786951
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 02:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8rF3pgw9E7TZJDepMMXR1Wf/
	wF3jxsQj25ywibbe0Vg=; b=cpuW1ZbuYYNmgaYb9x6Z1YyB9AXFDlKYhEZ/+0ij
	vhB71mPGLZ3GRBX1J980fZSimZGydS9yg/sAqhKrWqOuQb5dbUYJBjZ6AeiTi2Ha
	oj/n3qaXjhJaWZrT5oozUg/b2SlHSrRFfB2xBMRyG2nGCQqsOiHBTwXGMznFvCqg
	Xnc345cu8b5yaI1odBcBBB7w8fEN+uD3p3lvbQBe6oM2kFZngo0ChDKR8GyBUwja
	CCrtcO9N7tkGg0f9v0EMZ1qZVoZ859/yzpdnbS2A9YZOfwLSkKYGtbpRlzkqIWbz
	u4GmIrD45eoq1zapfiskMHXvuEsaqQ9lKLuB5RgOFneZ9g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh54v43r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 02:30:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd98d96382so229585285a.0
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 19:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773369026; x=1773973826; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8rF3pgw9E7TZJDepMMXR1Wf/wF3jxsQj25ywibbe0Vg=;
        b=fFcmXUpUDzpbFW2zJM8sgNC0I7BwBMzvCmGTTNFAlTiXrNTIp5vGP4L8P6+rs2kbos
         VkSxfK8RLSkcLafoNlEXMO2UaoSnGd7Oa0x5PxK+Ct9n0xL6RGh5YEsXgmd+Bu9dwvar
         veimUcpjisgKpeYJBeBf7sg4XKrl9RLJVapa8V3el1ERDawB+3CkCBlfkIR1O2aq6HOl
         cZWIShi0OiBwtgODWKkbCwkLc1icGAlbmd3NgoPm4EoYYZx22+PHAHp3+G9nYYWMUY+a
         ekX2IGtcmyz/Sixc/6yAMisa9aEHgg8q8CqxOeidUxK90fxnEUwlWuYM+MgrXguCWH22
         FS9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773369026; x=1773973826;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8rF3pgw9E7TZJDepMMXR1Wf/wF3jxsQj25ywibbe0Vg=;
        b=XQXC4EkI8m8wTIUql+3W0Vnf7Uh9omNhtpxOdYtdbUL7oQJGsGtXqQsuqY3IulU9JJ
         VgAo5vFmEGTxH9t4C7IbgwIluRJR3NtK0pJq5vsK8i5LzLEXWdZ5RJQ4XeAprg3itx0Y
         JtB+teOWot3te8IX043Bc44EJXcWO9XU/T4YlR/hsFuOQNHuRtIoMfmuxTWTkLPovaIe
         Tw4oEkit7K0CqFfU8HAc7tzG+A0BW63KFEz8hBTw5HHtlaICWPQbQoz12CwkUeO9pFwl
         7ept2YPhOVnshiPcwuHe7zlZ4oEO+H/GsvDbznXIetnXFuzkbIRvQt30R0OnEVCCBIP/
         z5Mw==
X-Forwarded-Encrypted: i=1; AJvYcCU4Biu/j6e5ycGtHSI2ylAnVoyuANh0C0qrIHluZzdayfE9zlv1y2Fo357YylixsujaLbTWZDIm1E8T@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh90ENMA2LnxyqqX2vS50bBWH75fyNFaWh88bJBdBGdQ4YNrZQ
	G3xJExpd5vVrPrKaLQy+8ESAb/XPKMlD6lj/3GEj60eZwPvYFbtA2KWZ+wBOixnjCh+as9LseOW
	P5OPCybcl6f5fwbRcerb47VkWUp5DnJrAa0OhpUfTMhjUvMb7uc+uGz5mLEUPBYC2
X-Gm-Gg: ATEYQzwUDCbgoi+8zDRuLXtUQ+UqrwR/SD3bd2rmPbhZBu3qPzQa4/jMqqIQX2loTDv
	ekRQ2gKMZZSjqjUVSoJWL7+N14Lcoako49CcZdPLbvT0kGn5N53KbrilyK89dyNFnv+QOmppYJk
	Vih8MQTSEHrIXN2XJHr2yyWrtCvJBzAmln390p9FrDjPWfrY7dpGRRzlNMQcYI8qp7aoJminBp8
	u18gYaOPO0CbzIm5Vs0DjAhDGKzrlBSBh5TWWpygqx6rWNdO7enQt1sqZ0OIWMR/sgccchY8m8+
	eYOlGxw38e502qGXfM1oBtr4rHUqHR6UfY92v1kG+ffBGW3igM1mgeGf6odAEQOTOxKwqfPnqVK
	I9MXWC467H7Jln4+NGh2ZODW35ex0qDwSxowWFZk4j+dLrsD0v6p2dseLbK0ozXacfh7219dDzK
	cfxYVIYyCkAJYqxPdFhhxrH/f3xfew5bbVLBE=
X-Received: by 2002:a05:620a:40c2:b0:8cd:8751:2b1d with SMTP id af79cd13be357-8cdb59ec19fmr296165685a.5.1773369021059;
        Thu, 12 Mar 2026 19:30:21 -0700 (PDT)
X-Received: by 2002:a05:620a:40c2:b0:8cd:8751:2b1d with SMTP id af79cd13be357-8cdb59ec19fmr296162385a.5.1773369020499;
        Thu, 12 Mar 2026 19:30:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156162b82sm1268902e87.56.2026.03.12.19.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 19:30:19 -0700 (PDT)
Date: Fri, 13 Mar 2026 04:30:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: Re: [PATCH 4/5] arm64: dts: qcom: x1e80100: Add deepest idle state
Message-ID: <5iego6aoed32zjkbs67tfyi4df6almzain7fxcgll374maazyy@w6icqysf7oft>
References: <20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com>
 <20260312-hamoa_pdc-v1-4-760c8593ce50@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312-hamoa_pdc-v1-4-760c8593ce50@oss.qualcomm.com>
X-Proofpoint-GUID: 6rnmB3_1YHhqn4z0Nq_qDQ84doy2H0Ac
X-Authority-Analysis: v=2.4 cv=BNG+bVQG c=1 sm=1 tr=0 ts=69b376c2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=1HwcBtEQVsHtarQ3u4UA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 6rnmB3_1YHhqn4z0Nq_qDQ84doy2H0Ac
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDAxOSBTYWx0ZWRfX8zFWJWe9b+8s
 YSHI7vg404GrDaXT+oPoTY9+6w+GemOPsvole+ZwY6APvSRjZMRN7iabNelIn1gVOoZdD3X2dvJ
 pRoeoHMNGmipZGBOU8GqH3Nz8e+geG1bTtOIL4mQTTNwmgkaUQBeaW2GgtX5cbP9L0iwJJS2cA3
 Cs0DxSaZO72GENB5eoCCmGjoI71Py039akkRmIAhdWTh3xibjpGrIW4MOubsp0WKzWMqR9tiegK
 aCQUeus33wENgxeB2X6EzOpsioBQFbj1/9IRkYo59oJ/btg9t9RH1NsrvUXILEpzJk9VpQ5uw3D
 dazSzyS5I45RCnFIltCAW7eYLv/i7umt0VyIkPGSCSZU73U6k+WN506znE4i3i0/KEery+Cqoil
 qPlTz+PcyXGuV4ezSqGx5Dsgof1fexc7TgrWeGsNWEX7qpbWVXw3jRr9kGqoAuhRdyZ8WMCfAvQ
 rsLGDIY042WPk20/t8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130019
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33307-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,af00000:email,oss.qualcomm.com:dkim,b220000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6095E27CC04
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 09:26:38PM +0530, Maulik Shah wrote:
> Add deepest idle state along with pdc config reg to make GPIO IRQs work
> as wakeup capable interrupts in deepest idle state.
> 
> Add QMP handle to allow PDC device to place a SoC level low power mode
> restriction.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index ebecf43e0d462c431540257e299e3ace054901fd..8f560fd140661ad720fec979eabe3ca8ffb34273 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -290,6 +290,14 @@ cluster_cl5: cluster-sleep-1 {
>  				exit-latency-us = <4000>;
>  				min-residency-us = <7000>;
>  			};
> +
> +			domain_ss3: domain-sleep-0 {
> +				compatible = "domain-idle-state";
> +				arm,psci-suspend-param = <0x0200c354>;
> +				entry-latency-us = <2800>;
> +				exit-latency-us = <4400>;
> +				min-residency-us = <9000>;
> +			};
>  		};
>  	};
>  
> @@ -447,7 +455,7 @@ cluster_pd2: power-domain-cpu-cluster2 {
>  
>  		system_pd: power-domain-system {
>  			#power-domain-cells = <0>;
> -			/* TODO: system-wide idle states */
> +			domain-idle-states = <&domain_ss3>;
>  		};
>  	};
>  
> @@ -6013,8 +6021,10 @@ dispcc: clock-controller@af00000 {
>  
>  		pdc: interrupt-controller@b220000 {
>  			compatible = "qcom,x1e80100-pdc", "qcom,pdc";
> -			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
> -
> +			reg = <0 0x0b220000 0 0x30000>,

As you are touching these lines, 0x0 instead of just 0, please.

> +			      <0 0x174000f0 0 0x64>,
> +			      <0 0x0b2045e8 0 0x4>;
> +			qcom,qmp = <&aoss_qmp>;
>  			qcom,pdc-ranges = <0 480 42>, <42 251 5>,
>  					  <47 522 52>, <99 609 32>,
>  					  <131 717 12>, <143 816 19>;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

