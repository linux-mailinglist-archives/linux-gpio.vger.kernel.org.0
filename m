Return-Path: <linux-gpio+bounces-35410-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KG8/JFAE6mk/rQIAu9opvQ
	(envelope-from <linux-gpio+bounces-35410-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 13:36:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 317DB45159C
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 13:36:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2AA12300C014
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 11:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 103FD2E8B8A;
	Thu, 23 Apr 2026 11:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZgZfOxAj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Eo5nJ0HJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942AE3E5581
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 11:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776944202; cv=none; b=ZcdY6xEcZq8SaeZSrQJf/ia0hfRpWjG8eeaBxbK9PRP3yNxlSdc+xR8zLy9S4Qr3GCJpqmqOGePouxnPJNsiVhwF2ZbBVq9Wtkh8NFcWaX+u96hahoNb258XIc1Qni6/OKuOBpQWKL/NcZWmNxov8NqsSqrPqWDzkV3jat9Eza0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776944202; c=relaxed/simple;
	bh=ycCYcFDws687lzPHf4a7ZDQa8w8dkehTffSeJoBHKeY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qqL32PrDNcA9UnOwZ3MWHhx06uYDymlYURd448OhZ2Zx5Uw49NT1i61Js8eo1Dh3bJL2wnFmiEfNzWbuKyLr1pfzA00K8U0xEAOg24tUdeipZUubbbpJoksA7ztSy3BzUSU2dW6GIAK0ppGCwOJNKtZsVgJjSWbjwDPPE2hjoN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZgZfOxAj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eo5nJ0HJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8u4xo3769013
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 11:36:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C4IVUQBFdsEG3fN5g34uqrFUD35jsuqyNZ/138Z4VVw=; b=ZgZfOxAjPxVx5KBz
	M4gXrD1z8OdjWaxuRMaot0/RjOdVU1RYD/dM1HTr//hRHN+xF3/na5P2y6mrg90e
	YwgldGzrmoeJgyfeEEzINXBV/Z20joUkbIBPMq66Y2vw30egfAKkzKnBTumdOjdy
	vd8ecnk/zxAHGM4aL9YtFLmwLQlY0KcEvqiw4rLF38LnKidn1MdjsJAu7pXTo+mG
	KPQ/c1VPaiGvpw7IlBi0ejPtjBKDVOqawKr28ODDmB2pJwXA+sn0DJUF3kDm0R15
	nwEob8lA+70+zFhOFMqpo9Z2JmrBx/FsE9wYYOGIg2mD1y/0HESSSRc7U3tELC/u
	zNkHPw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1hq3m63-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 11:36:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8edcc885cd3so89965885a.2
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 04:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776944199; x=1777548999; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C4IVUQBFdsEG3fN5g34uqrFUD35jsuqyNZ/138Z4VVw=;
        b=Eo5nJ0HJBKnHrOR/uinb0nAGPzCLDRy8cyNOZIMJ4p3Dsi0dzy/sYNTHcV1Jqv8SxV
         3tapUhWzAfz5XkI2F/G8A4XWjeA7hE6J4lb6qdlsFUWX1MCd8evMQXp2mHX48tDoBWbJ
         60bpVud79Sy4m+2odkpSl3xnwaR6Fgm5y1iF6+cg7I42MOei9eT5VN1FUtU/o1I2Fe67
         /+OXS6z90Mp7ZzDFQ03kncYs2oau4j5OI9FWf66/WsOHRtx8+jskLNUxTfLqiqy1BFGG
         Bk0VzVm3GHyvbmfCMECyHG3UTRZWiBOUM0YvCHLtCFT5hEcLk+iu64gehT6WsYgrb5vN
         73pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776944199; x=1777548999;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C4IVUQBFdsEG3fN5g34uqrFUD35jsuqyNZ/138Z4VVw=;
        b=sWhRIlwRAY9KFfARFoDHRYIO0q318LdHFaVTOiQk8fj4UW3X5hZqOe3gPRtDObfdfC
         stLDJCnA42tQ+YvYUsv5u5aJeFmIXfveYy3HgOfvBEHIOKrO8QoPxlJyjRX8reMFCrZK
         wVxcgdMT2mriNFgUEUAwNOYKZ/l8RIrFQwYxE7Kn2KykOplXLkkUAx2IMt/sZx8XH/h9
         bZ4lrFfwFPDPKi7Xb5S9rGi9d+W+ME2uEMviEAXB02tw39mUmg2XHGy68UeyYogQ3Zj/
         bkoYaZ45DYkvVjaDSFyYTA2CpRLT6ZfQookgdGyisTtEJBbtDPNh6WY5qiw0jjfUVoQH
         nx/A==
X-Forwarded-Encrypted: i=1; AFNElJ8IigUGYs0bq6vHIF8j3yHH3q2hbC6+V4RMH0s4NbR0cS8Yu0OVFZzZleiWWjeRJFvfijoKY7hrkeDT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8/W9EWYtkddFL3MeLZO6MiaAWDKltDQEqlVGJ+02P6lgyNwNh
	qPTeSnC0tjiOZyNLN95gQ5FRq5LFDIXPVPtwIRJNjmu1dK3Kj8Eb+jsKljRm1U4uDoZofX6BQcU
	2rcPwd8sUqw1VAgEm6OUbNKAyDQVrt1uTPY/p6sBKTJTC3MEZ119138K6KqASoD98
X-Gm-Gg: AeBDiesCVuLJWVy7+j3Zf1VaGenOcs0gVlM21FiryimU6TP4hMOXmNFgQcWJVSHAByQ
	E/E8Q+DU47U9HqjpZ5dmCyLfhoH+5Qi9/FEJu0YhOG07URM9iv254vHS7NaJVlqVLoGcD0nxSXB
	VtPSaaQmxKo3UdB+Wf2R2/yalpXchOy1rca5BbJVwuZR9x5UwSF81JPeTxsFiB1U2iHd8HXBym4
	RFN+VuYwbW45Vx3C+VAtr32tijghnAmpjwBaoAj0C0huIrUgrfiLMiSMXs55QWwjGQVZ0od47P9
	c784cdjSiql9stJahBIh9f//wnIoh+C6QesF+70Mcu91BC2lUA5mF4/vlk+BKH3P7tEys+KKhnz
	jWUDKwcL6Eocg5dT/oyjg1fT9s+UyhYQ2N8yW27hrV/HGqTLUMJ1cuwWCWd/6TaitKY26+KCZHH
	Qubr7NzM3ESOFh2A==
X-Received: by 2002:ac8:5d53:0:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-50fb9a68ec7mr100777301cf.2.1776944198943;
        Thu, 23 Apr 2026 04:36:38 -0700 (PDT)
X-Received: by 2002:ac8:5d53:0:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-50fb9a68ec7mr100776841cf.2.1776944198503;
        Thu, 23 Apr 2026 04:36:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455533bdfsm648444466b.57.2026.04.23.04.36.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 04:36:37 -0700 (PDT)
Message-ID: <ce26e0f7-a07f-4e17-a790-fd4f230c7e90@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 13:36:33 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] ARM: dts: qcom: Add Samsung Galaxy S4
To: contact@alex-min.fr, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh
 <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev
References: <20260421-mainline-send-v1-sending-v1-0-bcb0857724de@alex-min.fr>
 <20260421-mainline-send-v1-sending-v1-8-bcb0857724de@alex-min.fr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260421-mainline-send-v1-sending-v1-8-bcb0857724de@alex-min.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDExNSBTYWx0ZWRfX+oGqXNj3srnt
 qJ0dJtTMLhG5o7/axRh9ZDFDd6Lo0JXZySR9C6KlLfwx6NKkgte7IWzJU2x6dJWKbtMz42mF55+
 AECsda1zdJuCucNtE0Nqn0AAYyWNQqORFnMcMIWHfjHikRedhLljugmWt1TKBJjS5qjQsSfYiKs
 w3yWBCoGabqGz9ThQLwH9orz56gIFLET47LEBOY6qPfrH1lp84TDUto2qoV0e17yyNbAWfWrW2E
 gbm/w7L9jZZOYPJXWY+HxgWvTyxh/ijF5rPnHvhkf6BBjVlyyhI80vWtG4o9SD4uD7+u0fDotNF
 EJ1u/T+Y4Vl58FJ6oEWbdRrxr6RbseLNXaltkvonHI0hfM+LOUHwMw+P/kMnAGTZIvZT/4FCuZx
 XJTyON+MAam+65MklH9ol9wvexIoumGXLHALY2bdz6LnJLbft++Ygzbj0hYteYygu2GYcQp4a3l
 urLMclzJV8IhkaPU2Sw==
X-Proofpoint-ORIG-GUID: aEpHcKXhzYzXLhq6yuLvPm_ZGpDDYDM2
X-Proofpoint-GUID: aEpHcKXhzYzXLhq6yuLvPm_ZGpDDYDM2
X-Authority-Analysis: v=2.4 cv=TJt1jVla c=1 sm=1 tr=0 ts=69ea0447 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7luhnmdphBsOXQ2kz_0A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230115
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35410-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,alex-min.fr:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 317DB45159C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/21/26 11:45 AM, Alexandre MINETTE via B4 Relay wrote:
> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> Add a device tree for the Samsung Galaxy S4, codenamed jflte.
> 
> This has been tested on a Samsung Galaxy S4 GT-I9505. The initial support
> covers UART, USB peripheral mode with USB networking, the front LED and
> the physical buttons.
> 
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
> ---

[...]

> +	i2c-muic {
> +		compatible = "i2c-gpio";
> +		sda-gpios = <&tlmm_pinmux 22 GPIO_ACTIVE_HIGH>;
> +		scl-gpios = <&tlmm_pinmux 23 GPIO_ACTIVE_HIGH>;

Is this not GSBI2?

[...]

> +	i2c-led {
> +		compatible = "i2c-gpio";
> +		sda-gpios = <&tlmm_pinmux 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		scl-gpios = <&tlmm_pinmux 7 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;

Likewise, GSBI3

[...]

> +&riva {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&riva_wlan_pin_a>, <&riva_bt_pin_a>, <&riva_fm_pin_a>;

pinctrl-n
pinctrl-names

in this order please, file-wide

[...]

> +&usb1 {
> +	dr_mode = "otg";
> +	extcon = <&muic>, <&usb_id>;
> +	status = "okay";

Nit: please keep a \n before status

looks fairly good otherwise

Konrad

