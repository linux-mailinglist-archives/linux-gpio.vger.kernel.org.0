Return-Path: <linux-gpio+bounces-38195-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LTWXActAKGpTBAMAu9opvQ
	(envelope-from <linux-gpio+bounces-38195-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 18:35:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F386626F6
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 18:35:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=C1VDEKGF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=B7nmqvFs;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38195-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38195-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6963132455CD
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 15:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D8DB48C41D;
	Tue,  9 Jun 2026 15:39:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD7248C3F8
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jun 2026 15:39:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781019587; cv=none; b=ogzUAHrParkUM4BNoSLRd2c+w4horGmDWgZMhhK1c7SUQo3+g566hiXlIrAimaeNdIlm+S3ZanRhTcNGSMt3B9C5TFUZuL4ItYtEGtWOxeIpKXeROOwl2rpe7wKoEtaoMj4RD9GGbn/kBlkUeHd7CSolw7Ns3IGWnvFuSCLL9ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781019587; c=relaxed/simple;
	bh=wNUUUkKj6yruta7YOEgb0lTjKIbD2RzU8cqMHrzQHnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rOb+OxHjG3xndc0hXSgcFus/yAIfnOP+9mGJweZAtt9kx7mQA5TusW6F34hLLguigz3XAj0Nssu38AXbu2DUNU/W9C7CLWr+3hJhVmmbzeMsev0cA9Q9nwE1DdXQgvYToNEwP7SfxqErd99snjEvlWdA9Rywz/S2zW0yZeBt4PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C1VDEKGF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B7nmqvFs; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659CmLg72587951
	for <linux-gpio@vger.kernel.org>; Tue, 9 Jun 2026 15:39:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NGauZnHLbwJQHq56bTKypm+TXzDm6l3zoxaByt0WtSQ=; b=C1VDEKGFGSuZsv+c
	QYusNEU8WZoERwsGXZREsG1fTNAKH9GmQ+Ne8LRW0SPB+tkbZ7sPbtViDHby2Fnc
	lVcmpdE9+U5d740JHdl6TPlf3urHNfsbdp/0mUdVFmV7XhfuiwrSV3bpsUpBcGhJ
	yDsQU34hCeLWUiK3I6ToD6xrWLNI1RO1vEfz9qwfr7T9Qd8UzE1DRTqgNzLCGTTZ
	jeAI73zWxevzFsJRbAAVh7i7+Dtvn9+ZMEtskYnhncwdplnE30PEyqmy9rqWhXXg
	493g3ZVn+kz6ghAKu+Bs8YboDBE9I1n33nXTzKVdSiUxndicFQ9jg0jZuIpHgRUu
	BKrK4Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epee4j8ap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2026 15:39:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51775f7b2afso122395071cf.1
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2026 08:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781019585; x=1781624385; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NGauZnHLbwJQHq56bTKypm+TXzDm6l3zoxaByt0WtSQ=;
        b=B7nmqvFsVhq5wkGLaufnqmuHpWpbsi7USoby/rK0ZpWYCwho+2f+VZ01pUMajbIbli
         6PAPjXaAeQt3F7lxo1UoVMn4XlZ+/7yUh7HpGJUnA9LqfK3xz4Qk6wrFNLGwe1GZ53wd
         FOs/PQLLC/ajnpUVKibRFV50oJ/hTWRA02PlUUhJh2ecggFT7lj1cFY5y0x4XeSCoKsL
         k6koANrlA9x+pFtLdzKwo33RbnBqmQBTPYuhhEyTAYEgWUI/iPKS1akZOXOxch3pbnns
         3dMB0SGp4ymI6rXTIrIR2jZ8zpg7KEInp8QNYfGFalEmNHjd3WZytWrQa0pKu2+Qr/LH
         6zvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781019585; x=1781624385;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NGauZnHLbwJQHq56bTKypm+TXzDm6l3zoxaByt0WtSQ=;
        b=ZRGXfQnptawnPeYWP+VqSWN7l+pvOJaccJ0Xyp4GlXYDoD1Kz2v0X7px2nxvSbPs84
         NHHpAA0e9MBEqLBH0+z/OEZywvw5ZxBSOXaCeuL/i8uhPObV4LqmMfK2mPX1RYdhvFOD
         r1ucay/urI5vEncuwKB2ce8SkQH6kR+8I0rhqdJUSRfZpFNwPnV40IIsWAdAPzZpol4H
         58MS+vvww+u0ENfR2vtSKt4My1bv1E8h6GYch9fpkuF3qD6Q8q5xgqLJkO6PCmTanfe9
         /h+MdWzSL1EZBUG5W5O2EdQD1PO646pnSn5ummjwkfa8CKB/IgYEWGtrhBX/jUc75gRw
         Vihg==
X-Gm-Message-State: AOJu0YztoADZB+tS5nDZkJjdL3ezZqbukcSqxPxRvEfVAtVA013DnKNc
	bxosSIDDUjjDEoqNgM7UEAWmoAXTi96W6+6Cn0xwZhEknJ02EiZgjxW86+NNlZ6xhyTbZcVfKkk
	Jo5yE816S68Dpui3cxBdmFh8PbfJOIG/oh4qDj0JFRRG664AKf9wVEueHCD/JBYfn
X-Gm-Gg: Acq92OHRmPNlyslZlC6yzSQqKMTMgnL3JKZkIKuD8tG1wxNas8eYyzCuPex5VPrAZJV
	pX7jatM0PbYtrnRmDiBeGbVG3xqZLkPqVxsNivdr6o4T5rxN5TlJoE9Gt6WH/LXYl4TMON+D4F3
	CkXQiyhZQx2lv3VZp3eGM/eEhonvD2QGLR5h708TQlOHycdr0B3uGNd3+L6G7nZKpxX6PvNzebY
	z7sJfzqqVYSNxJXEtm6Dy1WBtkQ1+gEaYVypdwLBH1yhJC3lUghex0f2T7l9WOH2tmJAIs1T6cu
	6Cj3Qz7+Nc3W/bb3GV/xczCV//LgcaewF6kS4oEMVZMDkRk0gOiOL1h7H1ZnaeSpDxws3pGdAYd
	uez6aHwDwCyfOrqvhqHrqqqgtyaNdsxvep95Jx7VKaL8Du0uGwu+h6A/s3FFqew==
X-Received: by 2002:a05:622a:4885:b0:517:72df:787e with SMTP id d75a77b69052e-51798851507mr196795501cf.36.1781019585055;
        Tue, 09 Jun 2026 08:39:45 -0700 (PDT)
X-Received: by 2002:a05:622a:4885:b0:517:72df:787e with SMTP id d75a77b69052e-51798851507mr196794991cf.36.1781019584526;
        Tue, 09 Jun 2026 08:39:44 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.222.150])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3cc0f8sm485444665e9.8.2026.06.09.08.39.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 08:39:43 -0700 (PDT)
Message-ID: <504b860c-d9cf-4ce2-9db9-54167d1a26f7@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 17:39:42 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pinctrl: tegra: PINCTRL_TEGRA264 should depend on
 ARCH_TEGRA
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Prathamesh Shete <pshete@nvidia.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
References: <0643b689f0f4a453d31183d9f598a6f53574ecbc.1781017599.git.geert+renesas@glider.be>
 <1a90a36a1f939406bdac6ac84c8f0b3ddf313bd5.1781017599.git.geert+renesas@glider.be>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <1a90a36a1f939406bdac6ac84c8f0b3ddf313bd5.1781017599.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PIs/P/qC c=1 sm=1 tr=0 ts=6a2833c1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=jO6dYz2E5lbJ9Xj+xBc9tQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=cm0b6EE1srAZbXlzdSkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: n9joyG3rW7cW2YwHvOc1POdyS58vQTvS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0OCBTYWx0ZWRfX3KtJw0wJipjN
 a5jH0h28u/rsNvoUwNFsL0YaYlacXMqWpyiBeULkxeQ+G0lchrLfSCyK8j9bBlGkxQXzLQOoxu0
 SXtFcQfWRyDAnZD1hCvy+/6GLIwezHwsyyivTUzayUFMa39maQT9FnBSJMX0/QmsF2WDb9/T4cH
 1eeep8EKJntIzCsjZsBxFU2F0xp1+xSyqPD+N5S2tw+0j4aiXBIjdYvMo7/h/RkAyoGJeTCDpRo
 ROMC+hN0PsQUOIvivaeLOnsCgf/S4BcuM4oMCTa7xZea+/w9DK6jWNMaE0Cd24VdXvvrjyQOuP3
 1AZkbhp/8Z5sOgaMSihDwN+EhvwPVlXatU4/jlBkNVoRedNjJtyt3kaNa6bvxXwamAr/NQP7VB4
 jTwxy1W2X4Jml8AeUkeNfKNVI0dc0n0wZ7c1QVHdswVc3s4NKI+h19FeCRILhXxpz0iLfE7ZVrO
 FDuobUtIJCoCbvSPo2A==
X-Proofpoint-ORIG-GUID: n9joyG3rW7cW2YwHvOc1POdyS58vQTvS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090148
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-38195-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:pshete@nvidia.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:linusw@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:geert@glider.be,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F2F386626F6

On 09/06/2026 17:08, Geert Uytterhoeven wrote:
> The NVIDIA Tegra264 MAIN, AON, and UPHY pin controllers are only present
> on NVIDIA Tegra264 SoCs.  Hence add a dependency on ARCH_TEGRA, to
> prevent asking the user about this driver when configuring a kernel
> without NVIDIA Tegra SoC support.
> 
> Fixes: c98506206912dd0d ("pinctrl: tegra: Add Tegra264 pinmux driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/pinctrl/tegra/Kconfig | 1 +
>  1 file changed, 1 insertion(+)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

