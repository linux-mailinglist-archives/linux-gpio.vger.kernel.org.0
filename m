Return-Path: <linux-gpio+bounces-36471-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLmzKKDt/WlJkwAAu9opvQ
	(envelope-from <linux-gpio+bounces-36471-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 16:05:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FBC4F78C3
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 16:05:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 819F5302D973
	for <lists+linux-gpio@lfdr.de>; Fri,  8 May 2026 14:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29F6E3E5EFA;
	Fri,  8 May 2026 14:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A/sY6KHY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RAgxulmI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10641F427C
	for <linux-gpio@vger.kernel.org>; Fri,  8 May 2026 14:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778249026; cv=none; b=uM3aQU3y3EW1RWSI1XLjDJWWC13R/yESTBqW9JTW3tJk5P9fJY3Jh7gOmVlObvo+AjMnSG35t1j+VVHQsZ0Tjs66/tDNwlbYOFFA3zKK1JRgs7ZJW3RZiTZEfMenGgJFq/0IC+F2oUauA5w6n9XFKNx+P9AySZV4z/hZ8Y58VCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778249026; c=relaxed/simple;
	bh=tVLN9H4wXbxCspwoH2tS6QtKKtprn15Te8BRG+V6lVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Am09zOzKH1YAurzLIUtiNQualRXQRU0vGsLTizO7KbOPq25XJw69qHP+cUQEi7qtt0nHrv1wFkaRsFgafvOgkwHH3wTXI3KnoKmSbODmrUe9xHzY45RZPJ1UVKlZhIiX9rSNAvv4ENcYDdiv2+o+al/Jkum1dAxOSoIQclKOmJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A/sY6KHY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RAgxulmI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648BABCu2778219
	for <linux-gpio@vger.kernel.org>; Fri, 8 May 2026 14:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6PaLrzZ/Tau/BNFGUX9KOBZJHsqcYNs5C4hkDbabRvQ=; b=A/sY6KHYIFcKhS94
	NhiWomB1DvClA0fBtyGO6SgZcMfBuYQ50w+MPtem2yUW8HZxGwFdM22iBWMXYWEK
	SPLwfIZ7yqcelZQLTFFzBrIEfpTVEPX6pSmM8dQ0fLc77cdDpBzRCkgOnUQXs5xo
	hrvbnHXiC1I2Yf+kaO2ruFaVnrfojf4/+Rk9k5No29B4iwKmlAjb0mIp4lYGLjHK
	jMfMZHNnUXlr1+m3x4NrTHDxRXBgOprkfUICLIXLX2sj+tPP026KpsDia3MPJNCK
	C102f0AIeG6Q9UrWboM111YS23g0oJyYeng21kCsv3dqgcJYLEx5N+4tbmCl6Ftg
	KRL3NA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1285kgpg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 08 May 2026 14:03:45 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7def9da8485so551118a34.1
        for <linux-gpio@vger.kernel.org>; Fri, 08 May 2026 07:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778249024; x=1778853824; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6PaLrzZ/Tau/BNFGUX9KOBZJHsqcYNs5C4hkDbabRvQ=;
        b=RAgxulmIV9ITf0LZ0rgjIy+Y16/dkHdgdyAIufxSZKriKDoKOSsmzlbLh+ncsMyfio
         l+MkwJ/xTaIFblmmAnw5HzLRHeHxPnibebOXl+2N7NVvXFR3VK10pfFCWw4RlT2gYq1s
         5+eCTX5FmlTtX67Lx/eY+cTysulXK97B1iSDWTEbDH3N0BU3Sk5nZ67bny/eY6ssvwcS
         59Iq636N+RssjJhBRVfuZ0oD5jGmdv1YJZlIqUnUrcCruRlsvnORnrRN5pRlhc9/TR7p
         rVcUmGhMnJDaRalPmFgb3ngd0aailqCqqzWokZh2QlvE7/x8yJ3qvurDNQM0WxuSkXYM
         fzrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778249024; x=1778853824;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6PaLrzZ/Tau/BNFGUX9KOBZJHsqcYNs5C4hkDbabRvQ=;
        b=JL49nbM8bbR3AOJcNFGv8fXVgpM9uMHE5pe8veVGmHgJ0c8qiqi9R3Y8UZqnPCNHjB
         G6+m9ua3w5C7sZ8gdpbUOMoUI2qvU9B++KMnt7hkhB/QlRkn1v5CAv1uealDcPx7SHFj
         IUM2KkuOrYYGZAmTS3+Y5KwA3o9KlV2jFKvcpYbhu+K1aEerH6ysuUER7Dw9aM0HGpnf
         3i9SbpiDPDmH72DZ8ckSDkUVFoG8ERSfhoLPMP+MCZCmSniM0yBT3yv8L1mIPilBu7C9
         DS7psi796vgWDyb8i3XXjKCy84Th7LPoToo9Q8OO5lDACsP2PdyVaLpBM+JvAW7Tcyxv
         Hyog==
X-Forwarded-Encrypted: i=1; AFNElJ9ypT5OI9/E5yofjYY3y2ACuWeLc+sN7Al1YuxoE67is6DGLpDuswH47HtCZ8INy2ccqUWtZGOCPuoF@vger.kernel.org
X-Gm-Message-State: AOJu0YxHwr2aJ8RebL3/CX+uMxYTxa4bjaL0YU3EPAwN0wELkSMMze7R
	dhMDlZX8m+MkODbcqErDvf0XqjrI9Jpi2iE+Z6fil56EYUXwsCoBz6KL0KtqyD9avzXPrLdIVVM
	Jgi0k84SB7KfVeIsav1UL7A2msW+ZHnukpt40YtuNRTKzxPzZZqQZIoZk/FXUHPjj
X-Gm-Gg: AeBDiev1vq3u23uwyBQpZs3aB9tKRibXV2ysWuhVlLYoN/1V5R6kPmINz1vmikhTV/s
	nCdyU0wZQZyGcApHctlXIEEJRcf9uXYUdZjaP88BkdtB0nXndc4G3S1NKIMwLuWgKTN90yIVF8B
	oiYqz8x6D0Z4oi3QQfR6SfqIekvMv8ksPC6fxlLR/A94on+PMc9a0a+hpXJHaIH1f+bbloLnDl1
	/zBSMkgYVrBiKD69eh0c9VkgVyTex8PR+LQGPrhcTUiXzoXLvacZni9ZX2JujWXUEfiORZP04vk
	2c/bWID9QarvWXv3gF4SZyFQCHunpuOZ5HISHUBG1Wp696DJITDfYZNys1jm0T9UXNkcTMkAHZd
	6vjWxF2S8aSpszWtyyBCR7Qm6ESLKF4s/F4qgHwOeokYbszDfsmUN5TAmMuBLWMoTPUIcAW5Rf1
	B/KE4=
X-Received: by 2002:a05:6830:2b29:b0:7dc:c31e:7823 with SMTP id 46e09a7af769-7e1df018fc4mr4435651a34.4.1778249024144;
        Fri, 08 May 2026 07:03:44 -0700 (PDT)
X-Received: by 2002:a05:6830:2b29:b0:7dc:c31e:7823 with SMTP id 46e09a7af769-7e1df018fc4mr4435567a34.4.1778249023494;
        Fri, 08 May 2026 07:03:43 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac4358cedsm87169366b.47.2026.05.08.07.03.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 07:03:42 -0700 (PDT)
Message-ID: <01d6ea18-e022-41c7-a642-ac0321957923@oss.qualcomm.com>
Date: Fri, 8 May 2026 16:03:36 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 12/12] arm64: dts: qcom: qcs6490-rb3gen2: enable
 TC9564 with a single QCS8081 phy
To: Alex Elder <elder@riscstar.com>, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, maxime.chevallier@bootlin.com,
        rmk+kernel@armlinux.org.uk, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org, arnd@arndb.de,
        gregkh@linuxfoundation.org
Cc: Daniel Thompson <daniel@riscstar.com>, mohd.anwar@oss.qualcomm.com,
        a0987203069@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
        boon.khai.ng@altera.com, chenchuangyu@xiaomi.com,
        chenhuacai@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
        hkallweit1@gmail.com, inochiama@gmail.com, john.fastabend@gmail.com,
        julianbraha@gmail.com, livelycarpet87@gmail.com,
        matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
        prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
        rohan.g.thomas@altera.com, sdf@fomichev.me,
        siyanteng@cqsoftware.com.cn, weishangjuan@eswincomputing.com,
        wens@kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-13-elder@riscstar.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260501155421.3329862-13-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE0MiBTYWx0ZWRfX5CDRJpOq7JVm
 PuWlgOIpS40rrTccHhZzWf2uWZCpN/PV9wWP52tEmFsO/Nwo/M/ErH1WP/q4mz1cORAgVMByvMC
 ZCbT8pm3+t6xrT1qGpZ1GDS9SKavUUdSIat84v5h4omcEJXQMO8SiVnWCUPA0fcj2Zjg6ppNy0H
 o0eeH8COFXrx2vIVEF+C1Yh8KtQU+97D6Hkw046oaNN6bClSbRLMOYM3ReW4tlci3SnHQLsntas
 vYtktIwRqLifqKn3JjTD7zNShHWiJTihBTqVrCQlsOIAANCJyyRNfo5wV90LJVlWx8QYHe7urkx
 xlmdLjuhP2Sw6HR8QfHCvEwxOfTUkB+UMUUijxYo2thvUTEetBVcPs2BOBNnVM4m0MbqqZdx4Vq
 t7EWvBxirdEpkgH3QwNXY9gToTaDErmEVlyvElsT4ja/8/ccoBkUB9k2TdGacGKnEovD7YCQBef
 7ic3zoO9EVSty9vaU1w==
X-Proofpoint-GUID: zfj46zf19gZ4DXGWiuc-S6eUhq9Wt2MI
X-Proofpoint-ORIG-GUID: zfj46zf19gZ4DXGWiuc-S6eUhq9Wt2MI
X-Authority-Analysis: v=2.4 cv=NKblPU6g c=1 sm=1 tr=0 ts=69fded41 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=ee_2aqc6AAAA:8 a=lW0hg0oAPnnF6MRRTAsA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080142
X-Rspamd-Queue-Id: 04FBC4F78C3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,kernel.org,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-36471-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,riscstar.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,checkpatch.pl:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[50];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/1/26 5:54 PM, Alex Elder wrote:
> From: Daniel Thompson <daniel@riscstar.com>
> 
> The QCS6490 RB3Gen2 includes a Toshiba TC9564 (a.k.a. Qualcomm QPS615).
> TC9564 is an twin Ethernet-AVB/TSN bridge with an integrated PCIe switch.
> 
> There are multiple builds of RB3Gen2 with components included/excluded.
> That means whether or not there is a phy attached to eMAC0 depends on
> the exact board. However all versions include a TC9564 combined with a
> single QCS8081 attached to eMAC1.
> 
> Add properties to the existing PCI nodes to describe how the TC9564 and
> QCS8081 are connected to each other (and to the host SoC).
> 
> (Note: "pci1179,0220" is documented in the "net/toshiba,tc956x-dwmac.yaml"
> binding, but checkpatch.pl doesn't recognize that.)

This should probably go under the --- line

[...]

> +	qep_1p8: regulator-qep-1p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "qep_1p8";
> +		gpio = <&pm7325_gpios 8 GPIO_ACTIVE_HIGH>;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		enable-active-high;
> +		regulator-always-on;
> +	};

If I'm reading the schematics right, this is only required for the PHY
- is it collapsible, or does it really need to be a-on?

[...]

> +	qep_irq_pin: qep-irq-state {
> +		pins = "gpio101";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;

There's no pull-up onboard, should we use the on-chip one?

Konrad

