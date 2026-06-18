Return-Path: <linux-gpio+bounces-38671-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iHuJIyuxM2qAFAYAu9opvQ
	(envelope-from <linux-gpio+bounces-38671-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 10:49:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 066FC69E95E
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 10:49:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="K7/9yTiB";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eLaoBEDe;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38671-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38671-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 43C8130780CF
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 08:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B87B3B71DE;
	Thu, 18 Jun 2026 08:49:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97173B4EAB
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 08:49:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781772555; cv=none; b=sxMx4x9bVqbc8DbPfKNc0+X85nCbqlNN2z7wPuraYOmdunyBN9RpvfuiMCtUVgZqB3ROGkbDBG/XObDCoOMGGqGD89YIUWmnt10UaNVCoQErUpSaup0YOgvqbdAXjovdgqmexE7XHp41xB6EPVpexk4/1wrLwr+rJIcDyb71mBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781772555; c=relaxed/simple;
	bh=vwZ3ox+S8EieIsKYJeZmQbcya6G6wNYQsljtLPXCGxg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SBOc/PGE0voJHMUR2wX9bNlmONF4UUuvhYU6LMdBiEHPiN1H9OJZ8Q4cVgk9gluePVJ/mbLTnrKXMzNtlZ6yZBCKXi+c7/ctitL+jDeFXrg7calqkKmXlMoL4pVVM1NcknRV3iuKXVyT2jAeyTcwRBYfd2Y8IK+eN89fCdB9Lfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K7/9yTiB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eLaoBEDe; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8G1oG1157426
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 08:49:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+bHBfnOAx1pzFWwgZXfmA4+mbnnhL+GXgdNbrmQVFYI=; b=K7/9yTiBl5cqHQg5
	fvVraopTRGu2bBf6exdrN6Q7F9Fewv2IYgq2+73Jjjit2s9x5kQtkAt4wsxSL0E5
	RmAwUof+CnqpAOVBuQx5P71IDfIrK4eGaza1dGlDUYlpY/vYvXj7C3mRNSeDexNG
	XrtdMpLDxPJt9I5XhfTNRO+si8a+LumH2ska9EZNN4339ySmmwcAoV+f8S89yXgF
	TdcmVzq0gHX8+yCEGvLrK0JiFuDdoFXunCj9w473ozI1NnK4n/kPDU3MEOs2jL3c
	qxdZyGf4ZtqbkCjdg7HPuCHOzvk0rCIzJLmGGRNP7EggezpZxXWuJClP1r8stgm6
	Mz/WjA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev19a2kqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 08:49:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915a547f4b3so19347285a.3
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 01:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781772553; x=1782377353; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+bHBfnOAx1pzFWwgZXfmA4+mbnnhL+GXgdNbrmQVFYI=;
        b=eLaoBEDe1w4x6U2m/1h+ntxHFwnG6AZwiB/Cgdkq12aC6TvFE6V2JAXXqXpAOGJ9M0
         5tBrSKytprmobrr/gct5dddaywFh1Jd5BeWd/Xxev2BgaBN1ZWBZ70bCCYAO07xiSxuW
         RpmNd7QHGzCQjUdvGQOfhrZXNYDczsQb9S+jvLzyMtfBRfJ2zYcj7PonXVfKMjAQHysX
         3+arkQ2UpssZltjpo65Q3j5+fNeEUvf5/E46LnrKZSyx4pp7XZgH0bw7k247hXqwFN7e
         c8QdfO3LGSZjbM0aMCeUdRgFyV7kZFWjCEVe+A3T2MWD3QWvwu3yosXEP+c4KExtML53
         ufww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781772553; x=1782377353;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+bHBfnOAx1pzFWwgZXfmA4+mbnnhL+GXgdNbrmQVFYI=;
        b=bRp4K+DcLio9My9McjuA40GjI1rF/6P/DZ0fYLakYZPpCX/CVPj6wJo+uA/75aZHHe
         3TfhZ/BMXaRun6GhbLU8l/oiwaPmdtILtzL+02CgQPD/l2d9+a2/6I69l1DqrkM1VnF/
         +94+2PgxngdvP0DumdCsaGTqWvhfbzDGHubysztjOhq/rxHI7udjoa8Nou6zuu6h5qe0
         margGjXROngMna2CafjKC24fPfuwifKmaFcrdeMK0ABD0HWE6wYkTPqZvd8eOIt/7hJh
         zc1nbM49WXzj9YCePgmmCpTybRt047n0im3sgiQFKfWGD34oP2Yg8cyfDJVFv3UunoJu
         P7uw==
X-Forwarded-Encrypted: i=1; AFNElJ/9SWoVhEPPbF1ZhHQuMiMxClaBK7jdek+Hp9HesyfE3nTmRAzjZP1dgVVppBGb1Dk1PzTXMpwaG0GM@vger.kernel.org
X-Gm-Message-State: AOJu0YwMIj5Ayl/WhIJJMDyLGg/+wNGUzjtY27pTXOyBWry2VLlNa09U
	+veRH4/3yWv8b3xtzz5tonXOkx3kwBcctdxrGifB7TtN1LIRAZoFCkRvxsK4bG9TOo0NF35dNA8
	nU0mEOijKBxE8sNGaEjOhuwAYl8KB1r6chVy1pEfXAwNkK8/6ZSe0DKCTdDxwOhnZ
X-Gm-Gg: Acq92OGR+3YrmV9fR+sR9MG4cbdQXthAODKOCVLa22AvORfR58pcsZ6PKqbGLwB8Yab
	bXahpuo7bgB6ilqPisJZIzq+LFzGczwswBcgl8SYnMfori4VsCMbCPG7crkidDQwYPtaTGWYqU3
	1sxty8Rm6dK140+C1/mH6+ZYAgMUkzCxkb1RbXGnTEr93yGHa4Ts2uR6adtw0OfJlKni+vvAAm1
	g1pzBhQf4q8DvRbYrZXHWah5onG+Nz3LFyXHZ2NjoI6MlriD9UIxfx5fs7xmkYNGYhQE1fBcdM2
	PgtITk0Vpob8pd4Xb8gjEUdMxC6oqZnXwcVJpSqsece8xHwfZlg1PToDuav3aQCbWZpUT4IpVgP
	00uV49KOcozlW7yEkhFTldCkeHl1V4DBFTBE=
X-Received: by 2002:a05:620a:3910:b0:915:fad5:9096 with SMTP id af79cd13be357-91f2ba5e3bbmr276506185a.7.1781772552902;
        Thu, 18 Jun 2026 01:49:12 -0700 (PDT)
X-Received: by 2002:a05:620a:3910:b0:915:fad5:9096 with SMTP id af79cd13be357-91f2ba5e3bbmr276503885a.7.1781772552496;
        Thu, 18 Jun 2026 01:49:12 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4b22544sm897196166b.14.2026.06.18.01.49.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 01:49:11 -0700 (PDT)
Message-ID: <d9e778ea-8a67-4576-9c96-9cfd859a266a@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 10:49:08 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] pinctrl: qcom: Unconditionally mark gpio as wakeup
 enable
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
References: <20260616-enable_wakeup_capable_gpios-v3-1-fb59647d89cb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616-enable_wakeup_capable_gpios-v3-1-fb59647d89cb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YbmNIQRf c=1 sm=1 tr=0 ts=6a33b109 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=rd1qytcpxr8NqP3Khf4A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA4MCBTYWx0ZWRfX7eN7LP+9ZL3S
 uURYXpsrVUOdurT4eT/Q3mOcdXrOmPD0YP1Ovpu3XwuQiCd9Va84dWDhgSl+wSJgKj86tD1XbV6
 OMj/G/7WcGqeTwYNwjzSpv7Gdw8Dfjs=
X-Proofpoint-GUID: a5mTpm4638I2FMnHG1YAaZYoqHwP8RDf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA4MCBTYWx0ZWRfX4n4Oqjy1P4Ca
 KjrMp/sZyFeINTKYdbGfe1jMybd93Tx0G6x/4L7a0KIhUFjra2NC7DLnHETHPfp96v+uK/XoX98
 r0TNEs4QYtKxJE32Vd9tBu53u4W6A87YeTz+95ibzkEPxNhGEU4iB/az8hJ7ytB0AIxQPuQjjih
 0GX0Wc1bVC8QvvSZDf8UL8bU/QAjcwSh0NTruYQI47gtPhAA9UtFixNT17XOSkOg5a9gXL1j2LV
 TVVu7/WQ+NelCgy6z53M2QgUuMjkd/Bk8zHaANAHga1WSrLTJ5XC+LzdiaEF9g9ml1ysR7GFAQE
 13dc4cA4S5fVrf6OtPd8udth0jMRA5IbkHwLd+uD5zCUzm2mGIHn9B8x/aDF/YJRk6+ZnFvqM9C
 9E+KRIl2tGbvLiSQuVXgG509OTpMv2dUFp8IE4IDwD+vdCKwjtvyje30dohcWo/g6uUaACbEtqn
 kT9RMTFYsX1V9MSw75g==
X-Proofpoint-ORIG-GUID: a5mTpm4638I2FMnHG1YAaZYoqHwP8RDf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180080
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-38671-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:sneh.mankad@oss.qualcomm.com,m:andersson@kernel.org,m:linusw@kernel.org,m:neil.armstrong@linaro.org,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:maulik.shah@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 066FC69E95E

On 6/16/26 1:54 PM, Sneh Mankad wrote:
> GPIO interrupts that are wakeup capable need to be forwarded to wakeup
> capable parent irqchip. This is done via writing to it's wakeup_enable bit.
> 
> Currently the bit is set only for PDC irqchip by checking skip_wake_irqs.
> skip_wake_irqs is set to differentiate between parent irqchips MPM and
> PDC. It is set when the parent irqchip is PDC to inform pinctrl about
> skipping the IRQ setting up at TLMM.
> 
> However, the functionality to forward GPIO interrupts during SoC low
> power mode is needed regardless of which parent irqchip it is.
> Without the functionality it is impossible for MPM irqchip to detect the
> GPIO interrupt during SoC low power mode since for MPM irqchip the
> skip_wake_irqs is always false.

This is a much better commit message, thank you!

One question remains - should we set skip_wake_irqs for MPM too?

My understanding is that no, since the MPM HW is simpler and doesn't
have a register for acking IRQs, so we need to do it from the recipient
(TLMM). Is that right?

Konrad

