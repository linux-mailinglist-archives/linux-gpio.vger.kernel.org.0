Return-Path: <linux-gpio+bounces-35476-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOXxHFBK62kfKwAAu9opvQ
	(envelope-from <linux-gpio+bounces-35476-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 12:47:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B54B45D5B3
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 12:47:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9ECF303CE3E
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 10:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 085D8391E49;
	Fri, 24 Apr 2026 10:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OkjPmKeZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GhJLAtlh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A69F390CB8
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 10:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777027529; cv=none; b=J35Pi1i92hEXJMwU9BZtXq8SSIV4aUDqBN8DXNdlgnTIFd+KGOFlJgOpHRefmgWoa73qauptKgnNusrCqeV8QhkgFQEBYGnlDK8IGzG8vFMSft6fDx3GEf55Kef8n0aNywTiUiKXocX7FTTLZlP1hhU9O4hG2fmMCPrPXvl5pkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777027529; c=relaxed/simple;
	bh=OnzGzcqNY+ArADqz4SnmiPYbRzsG9LBv1JybDtwFAvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RmstaUivHbDHnpkOB0+9JhGB9OdnQckYr8YsvLJQwY7ZkFqVRvzrHkWuz/J1UJAeXhMnfyY8wkLE+JGcnIQSZBrWvxMtfJItjQJL84p50GnhYQjy6YM+3O3QriCmZyOnWG8VD1fvacHOWCsw1UjLHym4yvGvpo5l7KPmZ3McJIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OkjPmKeZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GhJLAtlh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63OAfkb81959136
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 10:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7eXC+Vvh1qI0aXe+adcCnpHa7mHRMAm7stQmrq1bj9Q=; b=OkjPmKeZh+bJGatv
	LPW5N9Q8BVgqBkX/Tbliwcl2mCwKO2ek52J3z3rJi3DuOAm2RQndSxQL50j2bCNK
	mOHkQrQhpvgU2cReoDtKuekLUJo85LlJz0BR04qYnK8W+CqK3ER6jitRDmM5CYa/
	jruCtDZpOxh2VVTt9NO4KOCpQKYyWEoplJm3JcndlEuWtvTqtyFmF9uSGZf8DFi0
	rpninchS1CgTDCoQtdxTkNaYI9vgfoQAQvOsQKFJ8pOkcvwr4ygYpZFk54YTWc1V
	iUOptEVp2RV4enz0KkqLvqTnWMxQtdYIwUj6KNe+Pw0eobaJa1H+nEs7ySuBLVxZ
	03h5HA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr2nrh94p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 10:45:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8d59968444aso228071385a.3
        for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 03:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777027527; x=1777632327; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7eXC+Vvh1qI0aXe+adcCnpHa7mHRMAm7stQmrq1bj9Q=;
        b=GhJLAtlhhzS2WSt1QUG8PErNE2bUnp0lH/q2AVMCqmU1Jx0docu2FHw1qnFVt7PPvd
         5BuxfUj+Ig+X8STbVcDXY1xP6UpKUGHNoLpt4x7O+2HOn0L1Cqt05XHXQEs2EU74/XzY
         /e/xDE7hmJAeH6JfUrlXn8esttz7YL8sDwAgErCwhZRDGANobC0o+yYG8tjdj2xdYHv5
         Y+yDrS5jlp/nSV4b4ya6R8lAlyb4OShvfBbfOEd5zoK8tB3c6XzCT7z04eTv4Q53yFjs
         uHQmAgzI4cw4fuX1JCIP754Kn6nKNGU8q700C9Air++3j0ghnIc3189tGp2zrJT8Idk4
         NdwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777027527; x=1777632327;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7eXC+Vvh1qI0aXe+adcCnpHa7mHRMAm7stQmrq1bj9Q=;
        b=A9x2jgYR2CqDQWoNmKpjUrPnGb9L592UbITZ6hDvg1rQJC56U68jIqDFWLuL4YCElV
         Rza1WNOxEma/lXGaave2gcj3WknQ2Xo+tB1af72Dnc6v1eGSELWpCz0kLhSLIAlcF91w
         YFzBJPJWXp5mqPZZIjbOuVgAmuVyOd9XwtV+vVmyTJHv5fmDVEHyYZb9k7+OVLrtpHT9
         f28Rpml4yrh4p6UL4tZfLY8dYKcHuZiSzLIK9Nwb37mfVMv0Pf+5Q6Xo0sCX3tt2F+HP
         QzDX2iaB2D4TEKhGN1ioC25x1CvhtjDZ7X40G8jfAKCCb3GQffrgr4XpHprOG1hfZs+M
         O9Rg==
X-Forwarded-Encrypted: i=1; AFNElJ+rbJgfEPzknAyYh4yqdWVhlCnTfTRL5Vu6KLNZH36p2WXddkO0bbUGRam+h7o+5zRXobIA3iXjGIJp@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0lskwWWeUswyKRDPV7krsS2aPaKoGFOnBxEXhDH08iNuffDCe
	V+W790eXqt/d6OWayk1Z6rPd5zTCXcjKcVHQGVaPIe0VQcqQttj0G0v69IVp6ZXWTaAmMH8b2MY
	oObVPUz3deanpWtV7bFHXzBzzyFQ990CJoW0+fSoxnOviBAfE7OaxOLG69rsqg1w3
X-Gm-Gg: AeBDiesZLoZ3MYdTaAkxA1+n5X7XxLIgypgGQbOCXOZCR6q7AAF11srizl+XNh8QQRM
	LyEqsvoLYJrHYehgLQysNlV6GsbmBHAhfMelkw2lJyVhb3KgVIEr6R3koYeU4hbNLP9SlH65U/W
	Jv9pCmvs9dPcjXcNiOq7yUNySzmBrct+/NiAcJtIJB9QtrbkXo4Ew6yrMHzIGnNb3WS/G4iYRqN
	erKqEcKcbF/mSaC2ej9WiSasEqlBP/kqHqR2Q2K5vHe6tyabuJRargXUZIwC+jsXAAhabsa2Qap
	T4IhPsxq5E2kl0b7MeBW8V+LhcZjNlpQT12gawiloEBE+Q+LKfcAbqU4YyBUVpZ5HOiakYN2u2E
	tINq5kzuyTlwLmcQgiHgu1z8izV3zs4CfG1lCaHPfaMWieM3i1eIBdaKlaL0dNgVPKaj/ZuPp0+
	ACcbjgqUK7SDD/AQ==
X-Received: by 2002:a05:620a:4114:b0:8f0:7516:da94 with SMTP id af79cd13be357-8f07516e2aamr868767785a.1.1777027526981;
        Fri, 24 Apr 2026 03:45:26 -0700 (PDT)
X-Received: by 2002:a05:620a:4114:b0:8f0:7516:da94 with SMTP id af79cd13be357-8f07516e2aamr868765485a.1.1777027526447;
        Fri, 24 Apr 2026 03:45:26 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d69708sm4772555a12.28.2026.04.24.03.45.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 03:45:25 -0700 (PDT)
Message-ID: <c6a06641-c345-4e65-9fec-7f2d4367710a@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 12:45:23 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] pinctrl: qcom: eliza: Split QUP lane mirror
 alternates
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260423-fix-eliza-pinctrl-v3-0-68b24893ae63@pm.me>
 <20260423-fix-eliza-pinctrl-v3-3-68b24893ae63@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260423-fix-eliza-pinctrl-v3-3-68b24893ae63@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDEwMSBTYWx0ZWRfXwiCu2pAhtXmz
 eHk+e/MNtYoI9t5llZjatgpQkgpEEVLTXsxzf4VgW4T+lyXK+iI1HlpiZArTA6Rf8wQmbA/shlv
 G3bYQI+nJ/CP6J9tUmUnGTLdek4KWnwqI0z5UlqBQL5B9pFkKBl4mkPzpB4JVsBLvewTtGLzdmp
 lBd13Wpr0nk9E5QNYW3iggLSBSl7nz3yoE48l2aia3DLrNFqBaN6serTh8agCOtCsXDoNwMm+mA
 pvlDsVMYlUIyEAqtOQh4bZUanXayqTqpDcbCALtTN7QiAfxZjyHbRsfsk/8Sk+EceEJCaSY0qsW
 56sTQ9G2Sa2SwfjyZnhoWjzOxv8O358MYQ3G9B104dGbTI7Hkw2vqrwr632h+0iAc8QWjpQBjvR
 xn6CaM67DjrIaOax1zrnb4lgjOKizVJQa3Uxu1lrDx/6INck1Mq76DdbbwHqRKNZZjOXOpN2JyR
 Zq4u80FrBnG8qbCm5yA==
X-Authority-Analysis: v=2.4 cv=UqpT8ewB c=1 sm=1 tr=0 ts=69eb49c7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=j-nvzvvU1SLIUX5pO48A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: SptmSEaBo56aRZY6ioVoZEqkSAWTVx8J
X-Proofpoint-GUID: SptmSEaBo56aRZY6ioVoZEqkSAWTVx8J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240101
X-Rspamd-Queue-Id: 0B54B45D5B3
X-Rspamd-Action: no action
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
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pm.me:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35476-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/23/26 6:43 AM, Alexander Koskovich wrote:
> Several QUP lanes have MIRA/MIRB mirror routings which are collapsed
> under a single function name (e.g. qup1_se6).
> 
> This is an issue because it means there are multiple functions defined
> for a given pin that share the same name:
> 
> [42] = PINGROUP(42, qup1_se6, qup1_se2, qup1_se6...
> 
> So when you select pin 42 and request function qup1_se6, it will select
> the first instance of it in this group, which just happens to be
> QUP1_SE6_L2, making the second instance (QUP1_SE6_L1_MIRA) effectively
> unreachable.
> 
> Split each of these lanes that has an alternative GPIO into their own
> function so they can actually be selected, following the pattern seen
> in pinctrl-sm8550.c.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

