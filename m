Return-Path: <linux-gpio+bounces-38591-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sMYABVtTMWpcgwUAu9opvQ
	(envelope-from <linux-gpio+bounces-38591-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 15:44:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C75C6900E7
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 15:44:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=feQ7zRwA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=U8yKl3lH;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38591-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38591-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C865B3015184
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 13:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF6B533689C;
	Tue, 16 Jun 2026 13:44:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D045330B2D
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 13:44:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781617486; cv=none; b=svJR8ElrI+A6+AThxvckPRTyRY2QB+3yj20+ygCXJ8kodAZqEC3//eoE4ySRIe4lBoItA8rng1wMh0pJIL+m4YjTVVPZC3/pkuvS84lkTcJPH7kRSnTtbleb6SNpJ8JleFMhucZ5isb8y+lsyjMfyeLzEBVDxInJPnfAwVqpDfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781617486; c=relaxed/simple;
	bh=MLdvzML03SyOkOB7+j8x/KwF1q6LqD2pr07MzjC8lg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gqkjIGi+ebT+udSgrki+vzNz2Ddvsp6ZKhPhje51rHjO3SG9xMkEgzGDKu75eOpY5JiCpxci0qCbbUiPIwpp00NpzJcHWD9kMhSrgFS6+1ip8s8UEqMczIKN/hACAJTyEt6m3cZuP9SvcnFXIa+8OfS20LfR9blddrLfwYEWY1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=feQ7zRwA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U8yKl3lH; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GABRlL3224489
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 13:44:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iixkY389mAB2UaF1VSSM5bVQjcg6VPpOWNUV9qcsNVI=; b=feQ7zRwAMEddcd4H
	Lcmq5zSB9PqBMYRlTFwlGk6Dxysq9QlKdvGtg8x4g/sEmSrWYSp3V/rZALkl3sl/
	9VLI4xck3XUTxbvC1el8tSrqcd8JZhv0iG+vJWysvOJLytyHYWlj+w21Mi+Hh1o2
	l/BzfKtri7oZ9h/XFJI8J+N8uXgjJbPnLJMTHSPc75i2b8AJ6jl+1hF7B12Gfdv8
	PnKchu7Ua0lSrwfC1bRckqy3AU3POK/AznKkM6rBRqzBCpS3Vd5Wvv+pO8xV5nEi
	9OkrBqkjdzFj43JARTZ7IYPvFrIqvUD04z6I+8HFLLyqMvU/l9zPiM7/+bdxarMR
	ztwCfA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1ysskqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 13:44:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915ccc2d4d2so101476885a.1
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 06:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781617484; x=1782222284; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iixkY389mAB2UaF1VSSM5bVQjcg6VPpOWNUV9qcsNVI=;
        b=U8yKl3lH2JwnsrcQgftm/KPcihl2woH8r5/dTrMshXZPIQv8k+Zh879FEAssjEUnNh
         gpqh7R2PdQ3MYCR4bfZgWqers1qItVg0EYcx5scBvxMjaH32ioUvCV4JP4h4yA3rg1dt
         3zDU2PgxS1yT4OmVu8Ghr2wTZazAacXhkbaHnp77fY+4luT7SOW8MZek0CHTKE0aG/dY
         5j/U4rOIJWx7LMUCPyyTODYT4+TkmWZ5JrdY/gtZAvyfg+QejuBF0mdYLc+SRQwP9lik
         6SCVF79bySbLl3mTKlGuli0TFjPYTnMgW/gv4rvioDD/GeyHBwSQYvCgK8sYvT823cFE
         3jKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781617484; x=1782222284;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iixkY389mAB2UaF1VSSM5bVQjcg6VPpOWNUV9qcsNVI=;
        b=khTHco/0u/yXsJkqhjA6WGyxllV4/cCLV91I3z0kt8F3yPsSDhXWXS0QueraSVTqyB
         tgjmGS4xMGtZIEAap+o70lrFQTKtA1UmH+TMh3vkncLah64YQuvJUyuaO5m41d/3nvij
         t1NNSHEvI3FiN1A5f39691H+b0k+3XCkulJZQEWJePJ17zyibloiAgScdvLTFk5vhvc8
         y6/CvIJhe8+BwzuVGlTyMdtHWXp3yLYa4c4SojeztdC6qJhFxFvDphOH8Ucri6+Pw/Af
         h2/MiBc9+gJK0uTkw8aQuxL3WuPjODV3xw7J+1tg8zFIhfvsCmt2H+ViB2CVDnfoCn8g
         v47A==
X-Forwarded-Encrypted: i=1; AFNElJ+PTHMH9VoX7fSqtoTLGSZiWtco3kfTc+JjNqmVjkD47sewwfbt16keDS4O35ubMBlHP1pSZ5OtIDsc@vger.kernel.org
X-Gm-Message-State: AOJu0YxSJhwDw8LCEiIVKlkgtG9LT4qRf52/Rpt8Evlrvn/gznDUAPm1
	SC26slTsRb2A+fyiFsXPVku8jGLPiIOumsCTwxrDkdM6bMhRkvniqpv+fi1Kx/J5FOzU09KYcQn
	D6zvt1Wr/UscnIaThwq0DkoNXLg5/XynYGs9wxGZ2QYlPbjnCOQwSUlY7uOU96o3i
X-Gm-Gg: Acq92OEQ5jT8D/K5eJ1DjKssvjAdd52Q05jgbR9z/gGyhRn+Mz003gwcV0pyIgBz4yY
	BA7CkoZPcZSjvHwyd0uxRlwei2keO7KFjnxYVZJHluRk+Me3vFhb0Q9mj003w4fNb1OW19ZlVHn
	zpFpTGcQAY9bbItIxdg9ckb0G3//E+pnFvEe1TM2C8lRMLqbPmWc08+qyWuJcyx38bgT786fAXJ
	zFKZc9dwFw9V+Jgv6fHJZPfyUKFqXekCjyiLiIc4ISqahJmuyr3kMGXAER4t/Cwk3DWzYfHFIb8
	qjCCN7UeBCqeWYuSkOkMQmWjJ2UobgY2g5lAsXlAmYGZaYYl/JIJtKumqr+j6nXh5Er9VxFcO/F
	MmhHJ8EctoD9p+nHNNQdyO3RKT2CELZ72JXnlNSLR/DpbOQ==
X-Received: by 2002:a05:620a:27c7:b0:8f1:9e59:2208 with SMTP id af79cd13be357-9161bc90a8dmr1715605085a.4.1781617483871;
        Tue, 16 Jun 2026 06:44:43 -0700 (PDT)
X-Received: by 2002:a05:620a:27c7:b0:8f1:9e59:2208 with SMTP id af79cd13be357-9161bc90a8dmr1715598385a.4.1781617483275;
        Tue, 16 Jun 2026 06:44:43 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937919b4c4sm4970469a12.6.2026.06.16.06.44.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 06:44:42 -0700 (PDT)
Message-ID: <cad4fc84-953a-4f68-ae74-864574256088@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 15:44:39 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] pinctrl: qcom: Register functions before enabling
 pinctrl
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
        Rob Clark <robin.clark@oss.qualcomm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260609-mainline-send-v1-sending-v4-0-83768fbf404d@alex-min.fr>
 <20260609-mainline-send-v1-sending-v4-2-83768fbf404d@alex-min.fr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-mainline-send-v1-sending-v4-2-83768fbf404d@alex-min.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: o-ZpgvpwpGDwBJktNG-_5D6rwtrIH7Op
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE0MCBTYWx0ZWRfX3kCg2Tlxl07P
 Z9nKRJdhIe766xQfXFOrDhe7XS2DqdNPcIaOq4UeHrbmCoEZJH2vA3tKm6KdP0iGUeVyf0okqNy
 HRVTwrJTA8Uv8DSVn+9jsrTkslifOxw=
X-Proofpoint-ORIG-GUID: o-ZpgvpwpGDwBJktNG-_5D6rwtrIH7Op
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE0MCBTYWx0ZWRfXyMu5nW8WW3IY
 WASSKcpMd12I5dXK7JxVwtHS/rGm5NarVZsCfGHx543z9SKav+n2sdgK+InBWL7XGJwSopkjtXv
 4yU2ihw5AB4ty6yzlD/IiEv/Mzhk0b/EzElpb20sDWTU8g97fMc0sZiovtkE2k+1ZQKynXfmd5Q
 CIqZ54P6ToLpRiqIIGX/m+TSj5btUMcbdC2jDnO8O3AeIlIKVIZccMJGzgrw6Wf4JI+yIT9+CnW
 4KJYpeUTil7JSt1xW1DrbMb8vtEyVJO5Q///LqGdceEDGJLltgxpX8aRDBjRqAxcdt0HDzhTLj0
 02Beb+dgYvnWdmGh6D6EFwiaYikvWl+ecj6W6mtZPm9M6np56hmYVuZj/GNhFmR3twQMIktNqfS
 oRUie8wrJLIvxMTrUrveIupGCh8TR1uMXM4U+RuzVt7C0h3cX4G+PAXqn4oXj7FN0DIiq6PymEf
 8eXImRjUzijHAZFwtTw==
X-Authority-Analysis: v=2.4 cv=JJcLdcKb c=1 sm=1 tr=0 ts=6a31534c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=lq5VANsAAuRygiiSL6QA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160140
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38591-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:contact@alex-min.fr,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:myungjoo.ham@samsung.com,m:cw00.choi@samsung.com,m:linux@gurudas.dev,m:linusw@kernel.org,m:robin.clark@oss.qualcomm.com,m:kees@kernel.org,m:tony.luck@intel.com,m:gpiccoli@igalia.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:phone-devel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0C75C6900E7

On 6/9/26 10:13 AM, Alexandre MINETTE via B4 Relay wrote:
> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> pinctrl consumers can request states while the pinctrl core enables the
> controller. On Qualcomm pinctrl drivers this can happen before the SoC
> function list has been registered, which leaves the function table
> incomplete during state lookup.
> 
> On APQ8064 this can fail while claiming pinctrl hogs:
> 
>    apq8064-pinctrl 800000.pinctrl: invalid function ps_hold in map table
>    apq8064-pinctrl 800000.pinctrl: error claiming hogs: -22
>    apq8064-pinctrl 800000.pinctrl: could not claim hogs: -22
> 
> Register Qualcomm pinctrl with devm_pinctrl_register_and_init(), add the
> SoC pin functions, and only then enable the pinctrl device.
> 
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

