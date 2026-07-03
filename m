Return-Path: <linux-gpio+bounces-39389-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qkPcM5VzR2qqYQAAu9opvQ
	(envelope-from <linux-gpio+bounces-39389-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 10:32:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3942E700179
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 10:32:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="djtBa/vJ";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VzPNInCs;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39389-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39389-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 939DB3055076
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2026 08:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 397712E7365;
	Fri,  3 Jul 2026 08:18:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72723064A9
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 08:18:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783066689; cv=none; b=JVZF/PEHHAxFZVQ44+Iy0LrwtwM6Jn5Da5purgn6wQDIawyS5ySDm5dTwOVfXSUIBAtLkCy8v3ZZR3afupzELDjhGvqmACWkXovLph794GT+MZWDMNk7HSoHfG1wbpvNcgFqkJv3WkzJ37x85HLUIzLRbrfiMxT5B2K87WSGaBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783066689; c=relaxed/simple;
	bh=4wTI19B8l1eezLivABuTjlzexz4XaVMwPllNRiTNtD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pYa05rY6ruVzSnDflrmI4+8BBf1F7th+1CFSzFWHK6p0L8sWxbqdHynELJESLnrM0yxa0pyl2cw5SqFSIBQo+iGUTQKTFkU5KDgj1edN2ijQMY5QCeesh09bCqtDcCYtcYRGqNT2FLaOW+qE7XXiLRhTBbDEV4J6RVXzg74IXOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=djtBa/vJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VzPNInCs; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6636gvFU3144217
	for <linux-gpio@vger.kernel.org>; Fri, 3 Jul 2026 08:18:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	23eKjFEM7rWU0A3xW//2WVDBSPpUqqI9TSb6c2Ke9xI=; b=djtBa/vJFNvQiElD
	VwvO1oykdeTaE2y7h+ZBq796eyB518uqRPOxCF71GDMWEX7Tw16Dy4w+GtW6Eb36
	BBlYQQgwJftLGngZbqhkri+KFVC+Vd6tO8h1pWkcLcjl+8uK1ZP/GazT2JNY/l1n
	EBBcGBA2OpXsQhO48vnzE5bZnBJNdWsvgBUTcPAwTXSHTttYRB949DcRyoV+OmPQ
	O5VMPePVK3jtXfLCfj7cg4PAslxv8/egeqGfC14/pIyPsroP9Qg4JEYln7myKsj7
	OiDY/hTwefF6/OWZs2iyDd9+ZNNTBLrUyDx4maYYXZgn6jp4UVJa55OUACF8dYQz
	YRrI2w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682brbe2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 03 Jul 2026 08:18:06 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38127ae6b99so610066a91.1
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jul 2026 01:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783066686; x=1783671486; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=23eKjFEM7rWU0A3xW//2WVDBSPpUqqI9TSb6c2Ke9xI=;
        b=VzPNInCsY1tw6ao2/JqQP4LJyHIGuRwr6Xdctnkdi137b4OZPqpKVggVt6TdFzyh7i
         X0lLcjwiDRHJGcp1iRdZwBoKlUl4shNG1ElUj5ho43qwvnx8RbPt+Zm1LUZVwvwV0pP9
         lZiGp5Co+wLLt+HFiDRVQ7mAPDFZCHhfhHa8PUpQ3MfyJts8iZH3V3dcoy/X0PURfvo7
         ID2PKHTQn21HoNeCOqQfsl48poyahL3DbY5F60JZyAFz31hXZpgdWbpS9xi7BRfg1BMK
         gKjv2NVK7Ecn+MOHs/+neYO4/eJJRFy23NUNoU8df+LpwCXWf7XbJMhhoHuEzkS+ndpD
         0O3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783066686; x=1783671486;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=23eKjFEM7rWU0A3xW//2WVDBSPpUqqI9TSb6c2Ke9xI=;
        b=jGgsqtyHxoHd95Z/b4NnZifiDZr5Skie/5n/4ZoRia6jYVlp52cY2iahEBylHlObrt
         IQ+pPFnfNrf2qnDSPqgJSs0hpcKwcS0teDh146Z7pvPm6XrmokVikYYKHcGB23WE+4ds
         qnsbkDDycGBTHfD+MVJ2vZJcDltat9uCXIVhOqQR+K/g1reaRy7nXIu+WZE8ihwcMzzZ
         wT8alkoUfzZfR5ocb/y93AsX7PY0g98ls+R4YnfLyMHeoTOpuI3ySqVtFsdXSKAlqB1D
         /WWtO4g+Phz84bFq8kZTH53d/2gMsq7DQYKDkTW3C0JrgvO/fZDvGhH1p+c0Y/aUxs4Z
         nbug==
X-Forwarded-Encrypted: i=1; AHgh+RrktGsJDBoy4KY3Z1Y58T2iQPmSwEce/eaWmfz5wMJCDDaHdzKQv/NBqrobiQEIA3tW7fNqH64vdnPl@vger.kernel.org
X-Gm-Message-State: AOJu0YwMjnIZpOhpdRGcz2jdjjw5nX71D0QC1Hs69S31U8zzgROS/lMC
	rEVtSj3UWQmuKSn53D0vrPenCBbkzkwRHPF5Y1LygIjwVe654f9M3S87yv9u/5M6vNCGK0YLqQc
	c8376spIbAzlzXi78UZ7uS+EKOlHN/FXIiKFdKLJztTWR3aFgukFQIVfvo+XyxJjjeuffOoii
X-Gm-Gg: AfdE7cmYmHHxBmLEi4TpN6hh1iezh4CNYfrVlxinv+STmd4FzU77SBSNyy+krDmdRFp
	n+m1qIlLdeKdao+E703PySQrZ08JTlGqlcFZJAhfLqdMboiIFQiDIEn43K5KS5M09bvkKfXUlyZ
	VbMw5hhgL55VuPPP2C8EsQSGOOzRmRtGmR9gnbjDx9gz+V3d5KxqezCiV3wm6qWF2bn0hWGWxWI
	ILZugmR8etgPyVLzOz2OV/g5zo3FD549w2/npbwLlshwAzBkdi+sJ5lvvhi8WysaaOez2W3fw9Y
	9PcInigkmE6issEuP4ewDfBUsVX+7jUk1We9ukMxdpRUaBI4u0opvvg480j4e3I9VQ1e/ckN+gW
	bYeTd8TMViW6IyJrqXvXcNjWSgjT0aaDS5u7YaVRN
X-Received: by 2002:a17:90b:528e:b0:380:9699:ae98 with SMTP id 98e67ed59e1d1-381120f7aeamr4282411a91.8.1783066686332;
        Fri, 03 Jul 2026 01:18:06 -0700 (PDT)
X-Received: by 2002:a17:90b:528e:b0:380:9699:ae98 with SMTP id 98e67ed59e1d1-381120f7aeamr4282382a91.8.1783066685900;
        Fri, 03 Jul 2026 01:18:05 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bbd221bsm18542336eec.22.2026.07.03.01.18.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 01:18:05 -0700 (PDT)
Message-ID: <9a28915a-bb1f-4ff7-a981-1cad6717dfa7@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 13:47:59 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] irqchip/qcom-pdc: Differentiate between direct SPI
 and GPIO as SPI
To: Thomas Gleixner <tglx@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <20260616-hamoa_pdc_v3-v3-4-4d8e1504ea75@oss.qualcomm.com>
 <87h5mkqdmz.ffs@fw13>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <87h5mkqdmz.ffs@fw13>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA3OCBTYWx0ZWRfX95ZMKNNGZPR/
 yLpd1471TvLRlMlNO+w8ujH2exlCcyIcgl4l58O5qPwM7srhXAsuSwuN59K4RhU7+rt9oden8QF
 n2m+YGbCq8NVeHIcw2pSNedm58tnjUVMyx4Sk/8fAhLYwm84Uk3WAy8VW+iPTYFB0NL5cAeIVDT
 GP2F897NiuNZ12vW2ksnFBCrgcnMorKpq1MHA5xZ7a1SPAKMHiCOwWrjNFbix9UMlvLeQPz6+qD
 mKyoOynPOjPNYS25hb2ag2vOeCjqY2uc1G8QTp5DabVemLV/F+fkKLyO78gGXmQ9Gt1ggT102dn
 BVF4iHnbYdKWAdLt+q/bL76rV3ZofaG+wb4YyhgSkJMk15UEmuR+f3LI6yDMfkkjMAoXOCP2l4i
 U46fmgNp3OAaYlsvwi/M1py0hvueJN9ikqwQIb18qbhbLnZRu1yKCAHNERUaMGM9seiKR2dzCBb
 RGG7Ij06MDb1GhsIcSA==
X-Proofpoint-ORIG-GUID: DccByhXILwM1ZHGVLo6pGjl_ISyytcOj
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a47703e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=FlpyNqKR0XVUcDgMYHQA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA3OCBTYWx0ZWRfX+loGD2wLSBrk
 VfhyG1cJg6yviHMeHyyk+KPiWZvRz/y4Cmj6K3VQnATksn8NmnNww46N4Q0bsnKnnADqFRVLhch
 xcFK6bJMciPBFcWTjEEZH+RmBX2+om4=
X-Proofpoint-GUID: DccByhXILwM1ZHGVLo6pGjl_ISyytcOj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030078
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39389-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3942E700179



On 6/30/2026 8:27 PM, Thomas Gleixner wrote:
> On Tue, Jun 16 2026 at 14:55, Maulik Shah wrote:
>> Before commit 4dc70713dc24 ("irqchip/qcom-pdc: Kill non-wakeup irqdomain")
>> there are separate domains for direct SPIs and GPIO used as SPIs. Separate
> 
> s/are/were/

Sure. I will update in v4.

> 
>> domains can be useful in case irqchip want to differentiate both of them.
> 
> the irqchip wants

Sure. I will update in v4.

> 
>> Since commit unified both the domains there is no way to differentiate.
> 
> Since the commit.

Sure. I will update in v4.

> 
>> In preparation to add the second level interrupt controller support where
>> GPIO interrupts get latched at PDC (but not direct SPIs) there is a need to
>> differentiate between SPIs and GPIOs as SPIs. Reverting above commit do not
> 
> does not

Sure. I will update in v4.

> 
>> seem a good option either which leads to waste of resources.
> 
> 'either which leads' is not a parseable sentence.
> 

Sure. I will update in v4.

Thanks,
Maulik

