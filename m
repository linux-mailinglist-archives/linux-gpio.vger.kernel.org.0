Return-Path: <linux-gpio+bounces-33349-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOtwFhUItGlvfwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33349-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 13:50:29 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C334428339D
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 13:50:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8586D326ED40
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 12:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C6037F8B2;
	Fri, 13 Mar 2026 12:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jF/YTrUP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dvON8raO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A8A37F745
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 12:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773406124; cv=none; b=S3wAPZ856PhRA/Wr6C7RPvmpowM/WH4JzYHQrc87DUUCH9kq0H0ngGKb9eldxaMuuM86JMUIt+CupB34xzJyTQmHIecDxefw2jI8enhOqkd7dhRkH6CMyWcZOWw9yXd4XEuM78n7uuBVXeq3FzYDKSKt7GGK9yXuHIfZ9t+v5rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773406124; c=relaxed/simple;
	bh=oA1HUDu7J0EzUYqIPlWjTJlNN1Lq2jBhBDyRPjpi30E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fng3VjGqhJ4tVXtXyKsSdTCuGBLUEKKxWL9XVKhtI4WdTVJ2yqFLgsGEAQILbGSFJg9kqWTz86SmX3eVBu2lEwpxDC1KeglRzfM0wnaD9M/ZDo5ukCwuaEAur/XOE2vGj/68JxZkHNa81L3GdYZ8zyWiwfnuzROn/wXNxW+OqpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jF/YTrUP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dvON8raO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D9TquN1499093
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 12:48:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4twYBG4FHMotPQHHXZ/srRQ1AVZ46K1zBaAlMYZgtHA=; b=jF/YTrUP03S30P6E
	WMkFd5KiR0wsCCuTuXzyM2xeJGBlBf4rSs5W3L5VWLZtHkh14Oc37tc8jSHQpI1d
	1pa/HmOY1rRsuxKnMiGXEtpU4sOYMTL9uvUJ/MQmIdB/XGx2TBhpr4QO9F5wFFD1
	1hTLFhK80eVCsBNp5d7+TzzAYIbRh209kO5jcsQZnBxpfzyiYbW+WAgfO8i8jy8b
	m7umfWKwjT5K/y+V5OzKdo8nymejCm6rANk/dZ2sPUYtMaloliSkV68ovywhWtuz
	oIX0FX/+IdFPisbzY9idHEmQ8jS5Yf3u1y/Md8ZoXvg/7LdKqRgaoKpFdL/3pgSQ
	aiwVcw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvg0hgkjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 12:48:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd84cfae34so93577185a.0
        for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 05:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773406121; x=1774010921; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4twYBG4FHMotPQHHXZ/srRQ1AVZ46K1zBaAlMYZgtHA=;
        b=dvON8raOUPiKITA4a/yGDuGVkts7XVMJlxJpVrpCmEIERVJuVxj0+WIf9e/HjTWler
         38YdBhVhLQMdqq3IWQD3XBl9PwrSafdnKM6+eEJZ03AcMgwZBCGZR+tA/FDXSeRiihLU
         vrTFrwqeyOXJO+9kX2aPhRYmDsTViBiDGOih6YMXA1PVv8dYGUAk7pRWasH1k3SdwPGX
         vWwx0/xgPyHCtczXowxmLe+zfjsoWojCgbE+DSuOWhZWQlUPcWSh9uLjr2IiD6falt8J
         gg2yR/vKcSd1gTKlDXCcmLcrCEeR1oSSNEGamenf97TUEQE6G/Sif93Lum5DNOGanS2Z
         yc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773406121; x=1774010921;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4twYBG4FHMotPQHHXZ/srRQ1AVZ46K1zBaAlMYZgtHA=;
        b=tEiLqwfo6C+t9jJNZ5Os1hD/CdnKcgpV1t0TE26OymV5isZzgryADM3ByWyL4uCEYZ
         k6litBDhXobUt7pp9aLng0b44I1YKGydrBWTzs19Q8og0k7yZ6Gcytbhh37M8MKQMPa8
         FI3GM+WkLLg8rHROaC0zSQtPWioxOi9mRr4+vFvvjbk5uTK6FNWRVs2uuf4AQWUM0zpB
         qRje3BlqWsBCHL2n2RrLJnGrY+g/aIvdC7roLGdUfKZmprXTNb8JPk/Og2gw6BjOhL0d
         x1aqrSGTqLauV/fCrPz7M2Q24TdvycE5Cou0Mo8P4nkEmTcZgGPPXQoGGu0FMVmSpnmP
         yONQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhQ0iBJukkB4RtVbGfr2w5v9MXNCWF38VQM9iEr1r0Hb/hqsL+D/E026zAJ925LcG1rctg382E0mnJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwOf93t/0A8XHctoaW74lp7uAMS6psq1nRDmUowW35cshojFJSr
	fwwCp/yZjQqzboby/7AUzsAtcyi4cf9W88Kf6NEVJzGIbEW7HepP/m3fgUucYX/m0aItIOLJNV/
	1hOnqr7gQGPETXxfd0j2UbhOTKRFwyS4cT/62CF63J1NRscai1tp1CoF8jU+qDa2H
X-Gm-Gg: ATEYQzz20/lTSe/b40hGBlMzUtZM8UOMWIVn/lvMsSJhvEhLxCksxnPLe77LRBZaHcP
	YGtUx+2++iU+QA9tNPlpWPBEDKO9ajUkguK3nukHKBxzCDUISMaxpca/bNFI38aqRLXpnL+x+nP
	vBRqoJ/bZ00G/1husjk+ABOw3oa4XmWrcHE1htRDHE8GUODu61+O9U7X+XFnLRULye1v8+I8S96
	2VMEM9POByKdQ7Ik6/kqjJ34JZqyRii4QYsJnx9xp2ViCdCjnKjTt2KKfcACzHTgLx70ouvRKCA
	+KaI1vlSyZqKhI30qPYVHZf0i98+NJlLocxKVGhBvATWTOQQwhXHdzbef06mcVsanFVZM2/pWgU
	SeAIBoB375zRUXIoee2dmbHUvzZTh0s3Tb9qxZr400uf0zCel4jps87uCFVusMbotCE8klDRJL5
	zbKsE=
X-Received: by 2002:a05:620a:45a7:b0:8cd:933f:d8f6 with SMTP id af79cd13be357-8cdb5a55831mr325141785a.2.1773406120922;
        Fri, 13 Mar 2026 05:48:40 -0700 (PDT)
X-Received: by 2002:a05:620a:45a7:b0:8cd:933f:d8f6 with SMTP id af79cd13be357-8cdb5a55831mr325138985a.2.1773406120424;
        Fri, 13 Mar 2026 05:48:40 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cbf4879sm43253766b.17.2026.03.13.05.48.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 05:48:39 -0700 (PDT)
Message-ID: <6e33daf1-bb90-47d8-955c-12ccdd30ebce@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 13:48:36 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] arm64: dts: qcom: add IPQ5210 SoC and rdp504 board
 support
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
 <20260311-ipq5210_boot_to_shell-v1-8-fe857d68d698@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260311-ipq5210_boot_to_shell-v1-8-fe857d68d698@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T6eBjvKQ c=1 sm=1 tr=0 ts=69b407a9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=tSUffcc-zHVOQOONd6kA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: n_oprP0zXmOsPzlLxFAHUtTB-FQ8_-j5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwMiBTYWx0ZWRfX2rrMH8irtndz
 AiCErQuX2Qyi4JoBqyV4t+Jl2MNJfjVuiwPCGk/z4YLdt/FPtb2w4Ul7wonGYOn1b/nzvqMkM5v
 kTR18tAYjweK2zk20NiHZFnGN8WRCwgUErQCpxgMSGcZ7DYS4wmwb/f6tpmWZu/4qa5gjaG8HRr
 B8XxHc2aUbQkTpKwhOXo/fwAHyW6Mzx6zPTr0pb0whpl0QTtb7126biIo3Om0Cbr8mwdWIqZj3e
 6O9OWXBT+Uq5qYvcaKEg9RAx33pihXUzBI+DKdpF6Fn9t4v1xZEJMWn6lTZ/MilC6xTuCdRMHuW
 pQX9QfPef6SQQrx/5U4lOLWUl+y1y9rTaPmBQqkru968lCUWpwXFATtGAdurlEg2j9ypiU5/H6e
 GJ/ElUwF4muPd41mJ/QUaK+38fkN/ADoPmeUA30TXBxE+83v0RZLgCySyzR8vr1xyQHCF6N9Rmb
 lWlzyu6o5k4751f77KQ==
X-Proofpoint-GUID: n_oprP0zXmOsPzlLxFAHUtTB-FQ8_-j5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130102
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33349-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,qualcomm.com:dkim,qualcomm.com:email,1ac0000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,1a84000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,pengutronix.de,linaro.org,gmail.com,gurudas.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C334428339D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/11/26 10:45 AM, Kathiravan Thirumoorthy wrote:
> Add initial device tree support for the Qualcomm IPQ5210 SoC and
> rdp504 board.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile           |   1 +
>  arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts |  93 +++++++++
>  arch/arm64/boot/dts/qcom/ipq5210.dtsi       | 304 ++++++++++++++++++++++++++++
>  3 files changed, 398 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 02921a495b2cbabcbacc74fbbb99eafe1f6478ac..e7748af640cccffa5c83ec82c37aa441444c2b13 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -22,6 +22,7 @@ hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-el2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= ipq5210-rdp504.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp441.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp442.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp468.dtb
> diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..3d95939785bc5bd4f510e2f992f0a1e80848c8de
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
> @@ -0,0 +1,93 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +
> +#include "ipq5210.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. IPQ5210 RDP504";
> +	compatible = "qcom,ipq5210-rdp504", "qcom,ipq5210";
> +
> +	aliases {
> +		serial0 = &uart1;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0";
> +	};
> +
> +	soc@0 {
> +		qupv3: geniqup@1ac0000 {
> +			status = "okay";
> +
> +			uart1: serial@1a84000 {

Please define this in the SoC DTSI and enable it via a &uart1 {} reference
from the board DT

[...]

> +		xo: xo {

"xo_board" is the convention in other DTs

[...]

> +		L2_0: l2-cache {

labels must apparently be lowercase nowadays

> +			compatible = "cache";
> +			cache-level = <0x2>;

= <2>


> +			cache-unified;
> +		};
> +	};
> +
> +	firmware {
> +		optee {
> +			compatible = "linaro,optee-tz";
> +			method = "smc";
> +		};
> +
> +		scm {
> +			compatible = "qcom,scm-ipq5210", "qcom,scm";
> +		};

OP-TEE *and* SCM? What does the former do?

[...]

> +	soc@0 {
> +		compatible = "simple-bus";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges = <0 0 0 0 0x10 0>;

should dma-ranges also be 36-bit?

[...]

> +		qupv3: geniqup@1ac0000 {
> +			compatible = "qcom,geni-se-qup";
> +			reg = <0x0 0x01ac0000 0x0 0x2000>;
> +			clocks = <&gcc GCC_QUPV3_AHB_MST_CLK>,
> +				 <&gcc GCC_QUPV3_AHB_SLV_CLK>;
> +			clock-names = "m-ahb", "s-ahb";
> +			ranges;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +
> +			status = "disabled";

I see there's only a single QUP wrapper - therefore I'm going to assume
there will never be a SoC where this needs to be disabled

[...]

> +
> +			uart1: serial@1a84000 {
> +				compatible = "qcom,geni-debug-uart";
> +				reg = <0x0 0x01a84000 0x0 0x4000>;
> +				clocks = <&gcc GCC_QUPV3_WRAP_SE1_CLK>;
> +				clock-names = "se";
> +				interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
> +				status = "disabled";

Please uniformly keep a \n before status, file-wide

Konrad

