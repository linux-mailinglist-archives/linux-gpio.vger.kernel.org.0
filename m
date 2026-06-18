Return-Path: <linux-gpio+bounces-38664-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IBDuJSqmM2q+EgYAu9opvQ
	(envelope-from <linux-gpio+bounces-38664-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 10:02:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FB569E4FC
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 10:02:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=e964duZn;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BibPVavU;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38664-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38664-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 57E983024953
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 08:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC1E03D9661;
	Thu, 18 Jun 2026 08:02:26 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB173D9024
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 08:02:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781769746; cv=none; b=pXjMzoK+jLFz9/knkAeQXg+yPnf0zTciqU08slE+SGJg4zXl+Sa6dBe/J6UwH4Nqj7o5qqpYVRUTYOj5KGuztlwT3QbAexQlQ1djUnn+IkPMNl4Ya1XzvVoUHpEW4V9ufcwxjsFPUVznftb6tV+ig5+bEav6fzd+tTthubnlHbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781769746; c=relaxed/simple;
	bh=ukAnbDogb87UP61Mar8GPMtMi/rqIRE+bHT4t5jxtuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z5/1gvYkz+IY8SLjITUZcle5akwfTi64hIL0UEX+kVuXsrfo6ZZniHFofb55qgZJfK9deHACtpo+owuB/Xe3HgNE1OsiPM/SAHxX/OFcd7AGV3H3Dn6iEoc5x3rYmaYKlE+HLspSffxU0mbp2virfyX3raD0hgUVK7v67Lfqsjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e964duZn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BibPVavU; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I67tVH3515323
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 08:02:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/N9uSRcFNdrxYby1iNTjX5385eR4TpZ5CgLI5Syc4ac=; b=e964duZnoQXUCwZi
	9qRLhXpCMsY9515ihE4qoLJPHYNCIBL6gWQnwJnthcXs/QfSjPuSjONklX2WsbJA
	l4pRoBTwlFZnvDX6ezYYco1GK32uTHXQgDagT+b96CnwgRVkeq2hsxEqO6z8u4y1
	P3MV3TlmcrzAl49uD/ARy7Cdo1VVs+i6VOLpsAvV0tTz/9NsYYkgy2R/kSCQ5VZg
	/P21ILcWJrd4O+/8rJxn88++eoQbPqnEkZIPLKwisKBCCwbW+Z4OKuJ+Ip4wQTuM
	I3ofbRvRMJO6XqAMlMeY6hCJzfl0cziaPfJTVq9yyFHowAa8EIr1TbRI79tW3J6V
	MzHnow==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev1wc283q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 08:02:21 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c9239a1dccso52694137.3
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 01:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781769741; x=1782374541; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/N9uSRcFNdrxYby1iNTjX5385eR4TpZ5CgLI5Syc4ac=;
        b=BibPVavUDd/MAPcIkrfAomwN8aQm3GlvnUAVJG+uFbjFUTK8+DcbPlpRwfuCC2Ujqk
         DYg4+pjUQ21WSt/+FbxwgND15ypmK8Hn79qMpvE0XVlT+f6/RbLg7D6ERLylGhH0MUYV
         M477LzdMbLAi+HVeVJSrACvJnm29ws8jQeQ4J8pcyP35VBn9pmrGVrT5i1j7+Pv7rTNc
         tcAFEfASLFv5msH1VxadLHBh12/TNnOMjFLjLiHBdw91rhSowL7CKBulG3cV7KyRruXt
         ICIWwABahtg3tDoXZrZo/bJ8NftCi3JZNuJLlDewlnkP1KdJOZehLQ6nEmek+M4uR0dE
         mKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781769741; x=1782374541;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/N9uSRcFNdrxYby1iNTjX5385eR4TpZ5CgLI5Syc4ac=;
        b=ShPUwAmR9Q+Oi4VSyR1cJrzN4Qd60HrSQyJ/lsTQXJbSZmedZrUs6kwNuT8JotBIEO
         YMgYeGk3D5pR9GLSfYbFjIP55SANPdLfPbJyURsbqWQ763AzsLbff1GnurwIyrQBSL3q
         yXMtS+/RY0NtT0CK2y67Gj3nq8fcwf13cEDNfoUBdYRnR6DBTz9D3h70pcb4OboOB+sv
         vzYFSBGvc3MPVJqWNRUiyQfb2Odb4TxEz5opEdGo0A6968HxEBQ+etP7o+OwivN9zlyr
         /H6yOl+6lG7bj+5WaAainDdpLPTiuLDwBCmjJlBZoVl5NMxZ3XS6xqMIEZ1BhqmBPK7v
         sx/A==
X-Forwarded-Encrypted: i=1; AFNElJ8EYst4GmNmWJIzE8C+Gp0DRjgjmZAh/XhjC2Od2jMxVCSGxDFc/NdQo5JILCmoD9JkFXONVUBcetzH@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4v7VaGQ/y7KkuYPAovfDxPRBfFrTaELUZh+Yk1uu1Qd8LzsJ/
	Kg13SG2wnbAsxTPMHzsz756FtlZczJVGOTacrzDUkVJK5Fm5POzgY4syHzyMayd7K8BzinQm96n
	QQn8AXkymILZiN8bIYDLgf1Toc2FWLD0pkVAIyU4PS3N1BRjYo0kd2r8eIOf4ZYiL
X-Gm-Gg: AfdE7cmACTejjnKm1g0bvSn2byWFc49fyvJsS8nQVIiU3Z2lVNfjMub1+uS78KJp0QO
	ScazatADf6Nn3L1c1q4cZ/ueI73uEMuLnK99QBK39hEbau/b3qCgWqhg7MNEep5yTFev9STO/y5
	kulXovWtMsmltbxc0D68908Al4OJqpbs6LUPlsstZbZmeqTD3pxFd8+ybwB30aEk3s1kSK6zFZ9
	JmpwmV94SqkG05fahZeEd763zdTgsLXMeWVoNJOyJ7CTQiGfxMiEXscai3Hl2twNopGGuTNvG59
	SxjrqbeTRV3VR+XYWEeSoM5DGVhyned8u6C5pLrje1swH9n1Maf0nNMa6Cuj4TUozNUV6aZU+gW
	p85c7Y5z/84ecXFTXX3f0RnMoDj4f6a5ww4E=
X-Received: by 2002:a05:6102:548c:b0:632:8717:e553 with SMTP id ada2fe7eead31-727d775fca4mr560341137.7.1781769741075;
        Thu, 18 Jun 2026 01:02:21 -0700 (PDT)
X-Received: by 2002:a05:6102:548c:b0:632:8717:e553 with SMTP id ada2fe7eead31-727d775fca4mr560331137.7.1781769740637;
        Thu, 18 Jun 2026 01:02:20 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb5223309sm907759866b.28.2026.06.18.01.02.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 01:02:19 -0700 (PDT)
Message-ID: <2978f55b-0b5c-4720-98ba-e14ef46b1169@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 10:02:17 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] irqchip/qcom-pdc: Differentiate between direct SPI
 and GPIO as SPI
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <20260616-hamoa_pdc_v3-v3-4-4d8e1504ea75@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616-hamoa_pdc_v3-v3-4-4d8e1504ea75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TMt1jVla c=1 sm=1 tr=0 ts=6a33a60d cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=NCwGtS5HQ1RdJiNybOgA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: AgZpSI26LeanQLj68b_R_ZqMxnV0xeeT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA3MSBTYWx0ZWRfX9GWah5aY2z8I
 3FNSX1vuv4aC0HpywB8tmuPITnZ8PpcpkJR3ZgCfebbdLNrpTSPslXmXXPtVZrdmLkQ44hrt4FS
 KXtG8PwZFfpXU5xTjwbnAMJdp4hicEg=
X-Proofpoint-ORIG-GUID: AgZpSI26LeanQLj68b_R_ZqMxnV0xeeT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA3MSBTYWx0ZWRfX8yE7HGMPviO6
 83E5bcDJ31yA93UfM90l7HyOPnvr09gXal1fyAxBW8QX6h0lgdQDr3CmCeCuhnzoH7cpgQ50KTt
 ouMZR6amdd3cdqAN4GKJ6AgWOmgLGkStUzceAP1BH4ukOBN+X1/KkOJOhMYrwC1iAdbtSpc0s1v
 XxX2uBVCDeCo6SjYN3WQF+BfA9RQawVTab9Yo6pThNkf+xN9IUSXt3w14+MixIZIBUFSs6YJAj9
 f1nKsutDRkf3ez/GuLyoDpD7+MELvRlNcygsfOy5+o4gGOV8PMzIgivb6jbkoxnL3nm3TvRpNgX
 91eDu6T0juejn8TPURhL1j/Im2ogKoqlxgvNflx+kJjhnBKAOF7Ubor8cBgdo7W7F6LD6NI8Xun
 wQAJrfbZs9Tt98w52QcmRamtV7fwObOCvvFAN//L+ERpbJckazZ38ob01yEP9urdCWbKHy5bNvn
 mkKYcxauB00iZYKrFGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180071
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38664-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:maulik.shah@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D2FB569E4FC

On 6/16/26 11:25 AM, Maulik Shah wrote:
> Before commit 4dc70713dc24 ("irqchip/qcom-pdc: Kill non-wakeup irqdomain")
> there are separate domains for direct SPIs and GPIO used as SPIs. Separate
> domains can be useful in case irqchip want to differentiate both of them.
> Since commit unified both the domains there is no way to differentiate.
> 
> In preparation to add the second level interrupt controller support where
> GPIO interrupts get latched at PDC (but not direct SPIs) there is a need to
> differentiate between SPIs and GPIOs as SPIs. Reverting above commit do not
> seem a good option either which leads to waste of resources.
> 
> PDC HW have the IRQ_PARAM register telling number of direct SPIs and number
> of GPIOs as SPIs. Further PDC allocates direct SPIs at the beginning and
> all GPIOs as SPIs are allocated at the end. This information can be used in
> driver to differentiate them.
> 
> Add the support to read this register and keep this information in
> struct pdc_desc. Later change utilizes same.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

[...]

> +	irq_param = pdc_reg_read(pdc->regs->irq_param_reg, 0);
> +	pdc->num_spis = FIELD_GET(GENMASK(7, 0), irq_param);
> +	pdc->num_gpios = FIELD_GET(GENMASK(15, 8), irq_param);

num_gpios is not used in this series, please either drop it or
use it to limit the index in the following patches

Konrad

