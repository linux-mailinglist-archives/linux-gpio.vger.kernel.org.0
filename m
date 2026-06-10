Return-Path: <linux-gpio+bounces-38227-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iVZwGnQgKWppRAMAu9opvQ
	(envelope-from <linux-gpio+bounces-38227-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 10:29:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 696C46672A1
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 10:29:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=o1kFWw51;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NfAkS5zR;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38227-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38227-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 331793094300
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 08:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81E343A6B8F;
	Wed, 10 Jun 2026 08:17:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743E139A7E1
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 08:17:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781079479; cv=none; b=k8usMUMyalxAe8d+2L3sv4kkG/Xjl902r7S0/mapGjx3Sh4J5zZAExp+DhOaCvrjZUOfmolyC1cztEpDHRWocmLszAzkUGq+7JEGlQGU+6xglxJ9B7x3LKpP+T1rQUFfxD/mYxG2mMb7Br0UbwFIZIPz4xE5jQC2mkvLwrsXyoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781079479; c=relaxed/simple;
	bh=ua4oCBMHWovh1U2nrh0ck8+JU0/8VJey05G1+ETTpTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xmzp0LSR8kHcqWupUzU/ZvM8rYeEnntLXWiyRfdYiauMnEhkt+ht0oup2ypCYUPm3quPIqvHdkKPYy4swVQ3rlHd9or/L3YDS2E+UHeojq4DjIEa6Xk9zCUqpRP6AXDDFhqQoD58DfhZQMzhkDknI24yK02VLYX6uwHbkQpCqwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o1kFWw51; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NfAkS5zR; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7i6B6991881
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 08:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wyz1qfOB2eWQ0JoiKqQ0zeXhArsoeEYRvieRQpOLvOo=; b=o1kFWw51NsdYCN2I
	2UbKSHJTd8lezvUuMw+gI9OuDy8TLZum/+n14tgf5+1x5ZWDUcA4TioqNYBiCwqe
	d8ACavAXt08GtLxKo78Sy3jgKFpxLDXad0jPY0+bfMq9LYAUzVdKb4VQN1C3tssW
	2zS8a4/aVjNro1CBKxP+QNXLKfbbKAsdncZIMx+zoSXIBRlBHW6zoP4cGl5vawvg
	kMW6Nc6hwMejNGDn1h8M3gRMn9ovZFO8rNThFmsZTDv8NH7DhuB1TVa+lriulg6J
	p5BX7wbik7GKy0PWLvv+sQqZxosUcFKtwO/AlCm97G17C+IeEX/Di0Z61Hlc8L2w
	5eHmwg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq1tg0ktb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 08:17:56 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8424aac207eso6354705b3a.0
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 01:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781079475; x=1781684275; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wyz1qfOB2eWQ0JoiKqQ0zeXhArsoeEYRvieRQpOLvOo=;
        b=NfAkS5zR4P0x/bjvbsO8ekhK3+UUaUtcNe8EVwZbk3knARk7BAoMzCfoqRi07x+oXR
         32zoC3hTZR/MyrdwvEiGsOc3yIz2EDY5BTwsOgWOZpf9YarnGSpNhHeUBKIow4WzeOCN
         VgJSoamtuz9+m09ngOoDohf4pC7/mGIq3ytXjBuz1ViJezOi0o3vf5lHe5N47QpoKVCx
         PLFYXJK+dNFsEVxQJShyVmxYMYnkdjbCQh87Fuss4ZSkFj3PPKfeFAJTh41fDx8x3Gxg
         icbTginq8ABNq67QYnA7jdjKs45twsDcKEKFMn1AvmdJjBx+DHD10Y5xeDQ/5lt9OZq/
         lgdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781079475; x=1781684275;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wyz1qfOB2eWQ0JoiKqQ0zeXhArsoeEYRvieRQpOLvOo=;
        b=oPIAj1ZjjBDWWYcrGDXB7pXcyvc0HGw9/jAIshEmX3dlx/i1QR9vU264PSdBuGhbpM
         evbM1tXVNzhRg1LwOMBXnjtutUPxU1MvBqetvxPcDSJYbjbtHzapBGYjW7gxPH0Ha5VV
         UJQb2eH6kiliPMY5uORxrN1q696oaAjSirsP4YicMyS6VeUnJRjpT2kYUvIiRSr6IxHm
         GjVV/WE+S3TltKQixGaa0z4Ro8r9tfEzWsBg9R4FOn4no/dKvNuBR3NASsityxYkYU94
         2iLkhHBCkNw8JhsxZESzPv6/SGBXeFyPF3A66xrgowBlz2ghorcJo8iuJscBgt9Kt9bv
         Vd6g==
X-Forwarded-Encrypted: i=1; AFNElJ8XQZbWlQX6FTbdrDwKtxH1Xr9PWbn0uxxFbSLsext3U624nTtPaY3d9kvakycgWRrb+r/Wez+ed+07@vger.kernel.org
X-Gm-Message-State: AOJu0YyEe50LJFvlMlliZxcnFj+Uyo9vDEmruQLWK4kgXiaOiqs4PUWs
	B40J8FLx96xz202+ZjxSyJKhEnbYBOjGN4mozC6DJjTWv5fccD3BKT/ktWk1g/JmQy6Ge93/3S5
	BLVceIB2/pf3v6D9kiYcPC9hD9lcFgQHXu5dGhBGQbS9wRU6moUKpNcUtASayApg0
X-Gm-Gg: Acq92OH6AisTq8LVTL/dl3v+T6DCmSqWRUdwqzCM9Rk5eGHlpZFK4NP83vIihgqkSFQ
	VaJ0Vwl6kCgst3ss66aShLFX7LLV+t32BS+drgm2cfOWUR70fuknObGAuf+jxes/O7bMXlmLtJK
	Lj22teYqBzNYkjme4Mz6D4FwRxcA36i4CgcmumfAqQw1+ckSJy78GeCs6tfiCN2zZgYgrXeSU8f
	lHPnbcndFMWrzXST91Qoy4DoIFjXXXlvsw2ycMLjrc8IB9Tqp3JOewdXvU91ylNLfDct8uA8krK
	S45hj9Aptgr/mPBeQBtjaFfrsTJ8mjuW8fm4YPzK573XVobjPEhYnXrvU6w4u2qCaDeZQtAzC59
	K8KEQYeVWUqRKgQ8dTfQyZBwcn1IYZYfRPmMFz7LjQy6Omi6KczcVQGU4Vq4U
X-Received: by 2002:a05:6a00:4390:b0:82c:d7c4:4c57 with SMTP id d2e1a72fcca58-842b0e73596mr25413131b3a.19.1781079475265;
        Wed, 10 Jun 2026 01:17:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:4390:b0:82c:d7c4:4c57 with SMTP id d2e1a72fcca58-842b0e73596mr25413097b3a.19.1781079474853;
        Wed, 10 Jun 2026 01:17:54 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828cf783sm24328211b3a.40.2026.06.10.01.17.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 01:17:54 -0700 (PDT)
Message-ID: <c3c16735-7605-4691-a977-b289b01bcf30@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 13:47:50 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] pinctrl: qcom: lpass-lpi: Switch to PM clock
 framework for runtime PM
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260522204644.4101640-1-ajay.nandam@oss.qualcomm.com>
 <20260522204644.4101640-3-ajay.nandam@oss.qualcomm.com>
 <7fce0440-7649-4bd3-b25e-00e2feaf6303@kernel.org>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <7fce0440-7649-4bd3-b25e-00e2feaf6303@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dGBOIsw2ONyV0QFhaxuqHl7XtBQ3IR05
X-Authority-Analysis: v=2.4 cv=dLmWXuZb c=1 sm=1 tr=0 ts=6a291db4 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Qe6B47XUAAAA:8 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=1m74azz6ZWac8Rq_qFoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=QWPKR-PWjQKaio0naagv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA3NyBTYWx0ZWRfXzs3hchY4hCZ0
 PhNo6gkBWPPOlMQyDJt5O6U9fxBY78PZtMiuPgJM21nZpOAxgCXx1hMks8829MNvfj45AUeYugw
 xlwJ7ij0QwYp+pJzHiuKO/qTWy6h2uczSta9A0ggE/hD6SW0f5Fx2qa0idB/r9w9f4vbD+A94q2
 4fUFijP90Rthb59XNeXsCr+xlnjD8KFEBMhDGAE6b+T77yPPXg4KsYXVM4zjaUw3EjpLRIzcPpU
 Quu/b9MfA9gZfSuP1uV5L7FNhpH9KJq0Mzz83FJjgoX1zEP3OD4EFHLaL3+ZHPcI/BjMt7EnhpC
 BK0PZ97Vmw0MCgPHcflQuR6kOgotKO5m9z2UBPWzstvF7f1ty1PSayre3VwHkQvKmPXY3BrobaQ
 FlGNOXVcdeawGuUwp2+S2Lmba6v+2wNDeVzgmtFnthdMUJIEizzZbpKb4dHJOHpu+lX9AcTn4fQ
 Fz+SKetLbRylD+RPj6A==
X-Proofpoint-ORIG-GUID: dGBOIsw2ONyV0QFhaxuqHl7XtBQ3IR05
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100077
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-38227-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,krzk.eu:url,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 696C46672A1



On 6/10/2026 11:48 AM, Krzysztof Kozlowski wrote:
> On 22/05/2026 22:46, Ajay Kumar Nandam wrote:
>> Convert the LPASS LPI pinctrl driver to use the PM clock framework for
>> runtime power management.
>>
>> This allows the LPASS LPI pinctrl driver to drop clock votes when idle,
>> improves power efficiency on platforms using LPASS LPI island mode, and
>> aligns the driver with common runtime PM patterns used across Qualcomm
>> LPASS subsystems.
>>
>> Guard GPIO register read/write helpers and slew-rate register programming
>> with synchronous runtime PM calls so the device is active during MMIO
>> operations whenever autosuspend is enabled.
>>
>> Make PINCTRL_LPASS_LPI depend on PM_CLK, since this patch introduces
>> direct PM clock API use in the shared core.
>>
>> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
>> ---
>>   drivers/pinctrl/qcom/Kconfig             |   1 +
>>   drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 144 +++++++++++++++--------
>>   2 files changed, 99 insertions(+), 46 deletions(-)
>>
> 
> 
> It looks this introduces new build warnings:
> https://krzk.eu/#/builders/151/builds/303/steps/11/logs/stdio
> 
> Which you might have been notified about more than two weeks ago:
> https://lore.kernel.org/all/202605241040.1av35pgK-lkp@intel.com/
> 
> Best regards,
> Krzysztof



Hi Krzysztof,

Thanks for the report.

You're right — this was introduced by the runtime PM refactor, and the
unused lpi_gpio_write() was also reported earlier by the Intel CI.

I've addressed this with a follow-up fix removing the unused helper:
https://lore.kernel.org/all/20260610080809.2588640-1-ajay.nandam@oss.qualcomm.com/


> 


