Return-Path: <linux-gpio+bounces-33306-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EM7BMol1s2mwWgAAu9opvQ
	(envelope-from <linux-gpio+bounces-33306-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 03:25:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3056527CB46
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 03:25:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 233D1312F026
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 02:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 003B933EAE6;
	Fri, 13 Mar 2026 02:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C7Dh8YyK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mks4/mP/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9EB33FE0F
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 02:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773368579; cv=none; b=b3TdOg2SOKMp0PZfLNkqiF1EmwllWxex1prTz/VOLLajJVw+k4fVTlXa++v5X8LwOEM3md8LRUoUH47WvKdZLZr6X7jEwkJRmAo6U8YgUQ//E+NjI2Uo9VF1Uh2+7Hqd+Qmso8W/X/KZRENN6npMakZ31v69L8MS3S2u2GYKKJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773368579; c=relaxed/simple;
	bh=EUS8ihCC0jldgkzrUQt7usOvsJ64CfXdeDnPzei1SiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UoZFAi5WqlNXF1AiqptE6CqATfz9zGInOMM2PQ6e3XIpUcCtNKzInDuB4ZOB7dD6/6mPPt7Cxl+vRYI7HyKjiQQ1KKWqrh1LQOWD6m5EAW2kufN+LVaeh2H9YboNMi+vQHmY5YFYyDW6IBjDPv5pW/f1KN++Vf0hko+EeNdzTMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C7Dh8YyK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mks4/mP/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CIsP1k587637
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 02:22:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ronbY7L826A/RmtJnsLIWNKj
	PKfv0DFhMEDzBi+iAcg=; b=C7Dh8YyKfLiGt68TcG/P1WksYpAmtjKr95K9/zqY
	EJ8PDu2ovOVL1Rs7czEfBlgpVUDN74DJ5op9/WevVFwUvYQQppq73y9b8rI+odnT
	6CjOLSh0vEobdMIXecRHIXpTfA/CMYxukYjNIajLlBPyDFYv0eoGrgWtot0w49gH
	Zcw4B+IxOqv+qmJTwGSKCXmUar1excLgHJYjQsBLXQqVjL/HH8wMdeVcZcMinIIT
	dBz3Hq0g0jbWvPvynLoFB3q2J2+gulWDH12YJGx2WFtrFAKJlxYgdBa7wL97ctJ2
	3AlXJwwosmzqda3zkTef9yX7rLlNmlVr3vUifyieLe3Wzg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh5q45tp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 02:22:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd98d96382so229261285a.0
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 19:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773368575; x=1773973375; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ronbY7L826A/RmtJnsLIWNKjPKfv0DFhMEDzBi+iAcg=;
        b=Mks4/mP/2FEc7aL+2SegNAK3ZftgknPn639HqhpW+wuzfS06hA7EUMplF//gKAtEKT
         2lBqasEZSXaMqXdbctpTJInUOzwu9nHZ570BMvlOgjOl+qo6hcO+vHa8EFpEtSJbucMK
         tOhzEJsCMQi8mcYmU77tQFT/qrzFCn/I30F1MjRf2/epj44ycpZtLEfxp6cnQnMtccvm
         gYXqmI6fGbfIpekKnjUQhfbHRti/9fG/YOUnHnAySFguX+Gnzsj1xsNg/iFr8aVhPBVN
         /uzDA8gbX9zg0aQ5qkRDTHPSb8QXGvW0uA/G6FjYHLRJJAIBeCyPTv0KaeNBTJ8KU563
         OGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773368575; x=1773973375;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ronbY7L826A/RmtJnsLIWNKjPKfv0DFhMEDzBi+iAcg=;
        b=sx2d8LAmL8SOAxQjFwfT4lB+Jeltb1Wua0kEPTHcu64c4aBIsGvu8DhtC4gYNVpaKP
         6uAk04nz8u6VTZ9qtaUfkbAv/5zHtQjtSi7gjG8K+C6JLhMv+K7M0U2j63+XLYsO5o7C
         gCgvkoPEjV7Jl3ERxFNAQ43M2Uge42Hyjk00vOww5quQ0YiM7Dkj+YulIRLg8SdjfJZs
         HjgWlK492RNpdzeINTNApTKVA/pUta+GXN1yXpMSt5qczqvXCipM544Lo5KC+c/Jle67
         l6rCjQNKBEf9F5KP6n8IDHJ3m9W6D/V0MFzNQM92yztNGxOFFuYereAkdfNjBjUAqxht
         ZQlg==
X-Forwarded-Encrypted: i=1; AJvYcCVdr/6DQAug7/BBHqZvy9tIUxwmO1utCVmVqkKLfNhrJRyc4YE6MfnK8CXWbGTj39KJ3yf9KSrqU90u@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4L6urQrtEzq7XbM7tGdbYH8g0HIxFb0JeV7mxHRovxLjw4fR+
	gCq3LW7rVSjc+9fsm6AuYHhHuiCn9ZocAPu+/guGePVmAMx0v004A4dwg2WqSLcW0IXDHRu+ztG
	CKdj9gRE/AYdKVjCkJT4FWpFsVlcd7fk/EL7WeuyHIKxkq7yAw2ytDVLRHIKoBGaS
X-Gm-Gg: ATEYQzyH2E3PVDFPgDSxV51mQKFK7Q6ZheLYgtSlJgRY3K8GypciVZ73/rNOCV8U0cN
	tZFtxBm6/qbOGUhHP6VnVe+XPvA5rIXBjHV0/hJ22Ejd2IUWev0uEyE47y91BKZ3KWCbU2YqgYr
	ENptPrFnYhJyChmrsxHKXYmNQ2owkXtffkJ155M7s1R1R8kParRkBT6aNhdD4vk7KLqaDLh604o
	Ol5zgUje7Ptnu3bFlSVlp5r1bhhalnPhuvxvzbXVgDc3VyuD+lnxpRK7NZw3tuEU81vtIxOCODM
	/kuzXv5Xttv83uarVhkzLI7udlQwUELtz17WVbiw27CKedY8Cez3P82HFvKnYzzJak/vjCt9ErH
	xHUjKd59+QnZ4+fCko5tCr/ggMq5JiafjKl5hSyYKTCL7PkubM99yy2HuAUoniEurl9EhWXY9X+
	nRxa/EPp+t5TLvODFfcFMT5Pg3lwUyJuDooC4=
X-Received: by 2002:a05:620a:4443:b0:8cd:8320:3368 with SMTP id af79cd13be357-8cdb5a551c2mr271113885a.32.1773368574918;
        Thu, 12 Mar 2026 19:22:54 -0700 (PDT)
X-Received: by 2002:a05:620a:4443:b0:8cd:8320:3368 with SMTP id af79cd13be357-8cdb5a551c2mr271112185a.32.1773368574354;
        Thu, 12 Mar 2026 19:22:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d83f9dsm13047751fa.10.2026.03.12.19.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 19:22:52 -0700 (PDT)
Date: Fri, 13 Mar 2026 04:22:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: Re: [PATCH 3/5] irqchip/qcom-pdc: Configure PDC to pass through mode
Message-ID: <eizcoxjnjgbobjwndnq7gewqnynnm2o2aqhh4muposgnhhagaf@tnomg2p4uj27>
References: <20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com>
 <20260312-hamoa_pdc-v1-3-760c8593ce50@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312-hamoa_pdc-v1-3-760c8593ce50@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: IiBBKPz1FE_qjjm8r9ss2l636mbKz-VD
X-Authority-Analysis: v=2.4 cv=CIUnnBrD c=1 sm=1 tr=0 ts=69b37500 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=U6JMhTfLYnJ_8UpLpkYA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: IiBBKPz1FE_qjjm8r9ss2l636mbKz-VD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDAxOCBTYWx0ZWRfX8AAUcO/8iNEn
 1BZTAlMTiljDjYHEyDC1fSQHvsQK7NiybfxGTHYLu1jsXMJLwoDnfzBditB7EsT8WUZrGv4UV8H
 Zr8UtTF8X7wiCSF6klyb51Ldhy88nLt7XR9CQMlpOdtGaT37ub2USubZGBYI5bKTxsTNxBc7V5B
 h+Pgfxtcm58L+cG18e2kg1TxLApclWmpWYsdOro1uer7hmPtYI5c+iojKhdkafwwAKi0kN5R2Y2
 RhVjCSp3cPaqSiQCqufp2qHWmCRF5B6F/uLNe2D28IggbN5HukmNF6hn+P/x2gcF6/I3aA1ivNV
 i4DpbXIHldVbLVJOXGHXr52IiZrPlxJLSQUGu6qGO4NRD/HoMCaCDVvYrTiWC+KdtU3D0VXP6dl
 eolePtyx/HPYNuHtcWwaCrZMGS2907gjmmdff5JxPFuUTchQo+x4SNyRuSonXFVq8VFcy94H+4T
 Pnov8nftYkRptRRzvmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130018
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33306-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 3056527CB46
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 09:26:37PM +0530, Maulik Shah wrote:
> There are two modes PDC irqchip supports pass through mode and secondary
> controller mode.

Can't parse this, excuse me.

> 
> All PDC irqchip supports pass through mode in which both Direct SPIs and
> GPIO IRQs (as SPIs) are sent to GIC without latching at PDC.
> 
> Newer PDCs (v3.0 onwards) also support additional secondary controller mode

It would help to mention the platforms, not everybody has the core docs.

> where PDC latches GPIO IRQs and sends to GIC as level type IRQ. Direct SPIs
> still works same as pass through mode without latching at PDC even in
> secondary controller mode.
> 
> All the SoCs so far default uses pass through mode with the exception of

Is it something that must be configured by the bootloaders?

> x1e. x1e PDC may be set to secondary controller mode for builds on CRD
> boards whereas it may be set to pass through mode for IoT-EVK.
> 
> There is no way to read which current mode it is set to and make PDC work
> in respective mode as the read access is not opened up for non secure
> world. There is though write access opened up via SCM write API to set the
> mode.

What are going to loose? The ability to latch the wakeup sources on the
CRD?

> Configure PDC mode to pass through mode for all x1e based boards via SCM
> write.

Would it make sense to always use the secondary mode instead?

> 
> Co-developed-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  drivers/irqchip/Kconfig    |   1 +
>  drivers/irqchip/qcom-pdc.c | 119 +++++++++++++++++++++++++++++++++++++++++----
>  2 files changed, 111 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index 83d333f8bf63d78827800e0de724f81e6aa2f1df..89caddf6e5c569a0e867cda1838c870b967fb13d 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -505,6 +505,7 @@ config GOLDFISH_PIC
>  config QCOM_PDC
>  	tristate "QCOM PDC"
>  	depends on ARCH_QCOM
> +	depends on QCOM_AOSS_QMP
>  	select IRQ_DOMAIN_HIERARCHY
>  	help
>  	  Power Domain Controller driver to manage and configure wakeup
> diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
> index 32b77fa93f730416edf120710bcdcdce33fa39a7..051700d672471c092e8cda4d7f5aa6d2032157f7 100644
> --- a/drivers/irqchip/qcom-pdc.c
> +++ b/drivers/irqchip/qcom-pdc.c
> @@ -19,6 +19,8 @@
>  #include <linux/spinlock.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
> +#include <linux/firmware/qcom/qcom_scm.h>
> +#include <linux/soc/qcom/qcom_aoss.h>
>  
>  #define PDC_MAX_GPIO_IRQS	256
>  #define PDC_DRV_OFFSET		0x10000
> @@ -26,9 +28,11 @@
>  /* Valid only on HW version < 3.2 */
>  #define IRQ_ENABLE_BANK		0x10
>  #define IRQ_ENABLE_BANK_MAX	(IRQ_ENABLE_BANK + BITS_TO_BYTES(PDC_MAX_GPIO_IRQS))
> +#define IRQ_i_CFG_IRQ_MASK_3_0	3
>  #define IRQ_i_CFG		0x110
>  
>  /* Valid only on HW version >= 3.2 */
> +#define IRQ_i_CFG_IRQ_MASK_3_2	4
>  #define IRQ_i_CFG_IRQ_ENABLE	3
>  
>  #define IRQ_i_CFG_TYPE_MASK	GENMASK(2, 0)
> @@ -36,8 +40,11 @@
>  #define PDC_VERSION_REG		0x1000
>  
>  /* Notable PDC versions */
> +#define PDC_VERSION_3_0		0x30000
>  #define PDC_VERSION_3_2		0x30200
>  
> +#define PDC_PASS_THROUGH_MODE	0
> +
>  struct pdc_pin_region {
>  	u32 pin_base;
>  	u32 parent_base;
> @@ -97,6 +104,33 @@ static void pdc_x1e_irq_enable_write(u32 bank, u32 enable)
>  	pdc_base_reg_write(base, IRQ_ENABLE_BANK, bank, enable);
>  }
>  
> +/*
> + * The new mask bit controls whether the interrupt is to be forwarded to the
> + * parent GIC in secondary controller mode. Writing the mask is do not care
> + * when the PDC is set to pass through mode.
> + *
> + * As linux only makes so far make use of pass through mode set all IRQs
> + * masked during probe.
> + */
> +static void __pdc_mask_intr(int pin_out, bool mask)
> +{
> +	unsigned long irq_cfg;
> +	int mask_bit;
> +
> +	/* Mask bit available from v3.0 */
> +	if (pdc_version < PDC_VERSION_3_0)
> +		return;
> +
> +	if (pdc_version < PDC_VERSION_3_2)
> +		mask_bit = IRQ_i_CFG_IRQ_MASK_3_0;
> +	else
> +		mask_bit = IRQ_i_CFG_IRQ_MASK_3_2;
> +
> +	irq_cfg = pdc_reg_read(IRQ_i_CFG, pin_out);
> +	__assign_bit(mask_bit, &irq_cfg, mask);
> +	pdc_reg_write(IRQ_i_CFG, pin_out, irq_cfg);
> +}
> +
>  static void __pdc_enable_intr(int pin_out, bool on)
>  {
>  	unsigned long enable;
> @@ -312,7 +346,6 @@ static const struct irq_domain_ops qcom_pdc_ops = {
>  static int pdc_setup_pin_mapping(struct device_node *np)
>  {
>  	int ret, n, i;
> -
>  	n = of_property_count_elems_of_size(np, "qcom,pdc-ranges", sizeof(u32));
>  	if (n <= 0 || n % 3)
>  		return -EINVAL;
> @@ -341,8 +374,10 @@ static int pdc_setup_pin_mapping(struct device_node *np)
>  		if (ret)
>  			return ret;
>  
> -		for (i = 0; i < pdc_region[n].cnt; i++)
> +		for (i = 0; i < pdc_region[n].cnt; i++) {
>  			__pdc_enable_intr(i + pdc_region[n].pin_base, 0);
> +			__pdc_mask_intr(i + pdc_region[n].pin_base, true);
> +		}
>  	}
>  
>  	return 0;
> @@ -352,10 +387,13 @@ static int pdc_setup_pin_mapping(struct device_node *np)
>  
>  static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *parent)
>  {
> +	static const char buf[64] = "{class: cx_mol, res: cx, val: mol}";
> +	unsigned int domain_flag = IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP;
>  	struct irq_domain *parent_domain, *pdc_domain;
>  	struct device_node *node = pdev->dev.of_node;
>  	resource_size_t res_size;
>  	struct resource res;
> +	struct qmp *pdc_qmp;
>  	int ret;
>  
>  	/* compat with old sm8150 DT which had very small region for PDC */
> @@ -366,6 +404,13 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
>  	if (res_size > resource_size(&res))
>  		pr_warn("%pOF: invalid reg size, please fix DT\n", node);
>  
> +	pdc_base = ioremap(res.start, res_size);
> +	if (!pdc_base) {
> +		pr_err("%pOF: unable to map PDC registers\n", node);
> +		ret = -ENXIO;
> +		goto fail;
> +	}
> +
>  	/*
>  	 * PDC has multiple DRV regions, each one provides the same set of
>  	 * registers for a particular client in the system. Due to a hardware
> @@ -382,15 +427,71 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
>  		}
>  
>  		pdc_x1e_quirk = true;
> -	}
>  
> -	pdc_base = ioremap(res.start, res_size);
> -	if (!pdc_base) {
> -		pr_err("%pOF: unable to map PDC registers\n", node);
> -		ret = -ENXIO;
> -		goto fail;
> +		/*
> +		 * There are two modes PDC irqchip can work in
> +		 *	- pass through mode
> +		 *	- secondary controller mode
> +		 *
> +		 * All PDC irqchip supports pass through mode in which both
> +		 * Direct SPIs and GPIO IRQs (as SPIs) are sent to GIC
> +		 * without latching at PDC.
> +		 *
> +		 * Newer PDCs (v3.0 onwards) also support additional
> +		 * secondary controller mode where PDC latches GPIO IRQs
> +		 * and sends to GIC as level type IRQ. Direct SPIs still
> +		 * works same as pass through mode without latching at PDC
> +		 * even in secondary controller mode.

I'd say, there is no need to duplicate the commit message.

> +		 *
> +		 * All the SoCs so far default uses pass through mode with
> +		 * the exception of x1e.
> +		 *
> +		 * x1e modes:
> +		 *
> +		 * x1e PDC may be set to secondary controller mode for
> +		 * builds on CRD boards whereas it may be set to pass
> +		 * through mode for IoT-EVK boards.
> +		 *
> +		 * There is no way to read which current mode it is set to
> +		 * and make PDC work in respective mode as the read access
> +		 * is not opened up for non secure world. There is though
> +		 * write access opened up via SCM write API to set the mode.
> +		 *
> +		 * Configure PDC mode to pass through mode for all x1e based
> +		 * boards.
> +		 *
> +		 * For successful write:
> +		 *	- Nothing more to be done
> +		 *
> +		 * For unsuccessful write:

Why would it fail?

> +		 *	- Inform TLMM to monitor GPIO IRQs (same as MPM)
> +		 *	- Prevent SoC low power mode (CxPC) as PDC is not
> +		 *	  monitoring GPIO IRQs which may be needed to wake
> +		 *	  the SoC from low power mode.

This doesn't quite match the description of "latches the GPIO IRQs".

> +		 */
> +		ret = of_address_to_resource(node, 2, &res);
> +		if (ret) {
> +			domain_flag = IRQ_DOMAIN_FLAG_QCOM_MPM_WAKEUP;
> +			goto skip_scm_write;
> +		}
> +
> +		ret = qcom_scm_io_writel(res.start, PDC_PASS_THROUGH_MODE);
> +		if (ret) {
> +			pdc_qmp = qmp_get(&pdev->dev);
> +			if (IS_ERR(pdc_qmp)) {
> +				ret = PTR_ERR(pdc_qmp);
> +				goto fail;
> +			} else {
> +				ret = qmp_send(pdc_qmp, buf, sizeof(buf));
> +				qmp_put(pdc_qmp);
> +				if (ret)
> +					goto fail;
> +			}
> +			domain_flag = IRQ_DOMAIN_FLAG_QCOM_MPM_WAKEUP;
> +		}
>  	}
>  
> +skip_scm_write:
>  	pdc_version = pdc_reg_read(PDC_VERSION_REG, 0);
>  
>  	parent_domain = irq_find_host(parent);
> @@ -407,7 +508,7 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
>  	}
>  
>  	pdc_domain = irq_domain_create_hierarchy(parent_domain,
> -					IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP,
> +					domain_flag,
>  					PDC_MAX_GPIO_IRQS,
>  					of_fwnode_handle(node),
>  					&qcom_pdc_ops, NULL);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

