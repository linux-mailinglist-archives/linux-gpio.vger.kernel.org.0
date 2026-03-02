Return-Path: <linux-gpio+bounces-32368-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKApLixTpWkR9AUAu9opvQ
	(envelope-from <linux-gpio+bounces-32368-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 10:06:52 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDC11D53C0
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 10:06:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9520D303AA81
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2026 09:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EACDD38BF6D;
	Mon,  2 Mar 2026 09:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UTVOXK37";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="COYU8NaG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9623632AAA7
	for <linux-gpio@vger.kernel.org>; Mon,  2 Mar 2026 09:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772442279; cv=none; b=eaS+pgOpVAu0A7YjU5U2roelNqyPCP51Iqj6CFVfuDLFE/UCZhT9EHG334f03TxpDDIb2964bqf2/ZuT9JYOgZXW5zyKSKMvBe1i9KjhZis6LqpPwY5vcjc8tiixq0QZvi+gB9gVj7MUcZUuyAqQ34dstcCW2P1JE+8jAMk2D/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772442279; c=relaxed/simple;
	bh=U4r2n0lz3O+V1F8XN8YmLgRSA0p35bNqQFBHaDSotrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WA6XVSwO8/1TIrAw5i/NxVox4WcPv4sxGENlxZad+Qk23qFNz0ojW0qRfavfF8JbjZalA/6n2AIswj0567zTw/V6ERfCCo9a92EwIynDgGDi1Yr15LgPuEI+R2971S9V+H4VjUFdeF1l9VS7XAwP/mEbTZoFlRqvi1UnfIJy84M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UTVOXK37; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=COYU8NaG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6225ZVqq911398
	for <linux-gpio@vger.kernel.org>; Mon, 2 Mar 2026 09:04:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FrhrYT/cLETsAM6ji3b4r7HFHUvd7wmDGEQS1pl9cg4=; b=UTVOXK37Jd9GJ6kb
	BjtWhki9welP1sV06VxNGA/sI4i+0lGP4ZYv29kQbZwL0fuSu+ucYlnBPRlS56k6
	du86uaNU8j0Im2jqy+n3y0V3pXkaF6Hiwm8DhHegt0+iHqsxF+Fvvzh7/JiNRfAa
	o5e+FMukqFKq9oKeX+i0VwBWP1UBDzwFI0JJQlgvVdpusd2m25xDK5ZjeLH2/K4m
	OTHTkmMZTOEGvO/ZEeDpLGw0lzWBJMyyt/9hg482SiJn0JvW33NxAgjuP81ZCUiM
	z4yCQ17p30yW8d2X8VDyFEUOUrSSQVofdGAxG8tcn3qtxFzJ/82u3S6q3+vBdbc9
	MfDFiA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksfd4umg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 02 Mar 2026 09:04:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71500f274so422162285a.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 Mar 2026 01:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772442277; x=1773047077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FrhrYT/cLETsAM6ji3b4r7HFHUvd7wmDGEQS1pl9cg4=;
        b=COYU8NaG7OrBv99EhgUUTxbcx4JCxRL62bE0n0YrlcuC19KnNB35ON1WuIAqfAXtdK
         S2vIMtQs6slnhP9e2d1h2YmglVSq3XvPdV2TnC6Q/h1UDD0/oUy2nbPoZeeBk1a9PV8e
         IHgBfN94kBRmX1NH1Fwo7VMo0f3A8vBn+upcwx+gauFAVoy8if+aMZmX2Yprmgjq4PK2
         VayF9q0p0jIE7a94VBZc7UHHOfntNfMGBXNfoHbyauA4Ak3CkDknGCZ848doG2lx+YFt
         rwtOM3OZgklevDBan14Qd4ld3Mn/ohEF2bWtRRo2pbg3Dw2Z8I9K8S4Ej9eYMxzqVb6k
         edtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772442277; x=1773047077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FrhrYT/cLETsAM6ji3b4r7HFHUvd7wmDGEQS1pl9cg4=;
        b=I2qp7PZfRymhNKwnLoHEr00RNzpX7Vy0fStvFJSe2Ay2/t7h0ySxchRsA5nV6gBoDq
         HFQWCS7X+Hc9HtGdPtLpg107iYz63twkLO2XglAjKOllwwW8QoOTwkZKfGrp8AUe8l2L
         dnL3mKrQoEGrh3xe2zHspjWmoIl4ceX4ijoHHvO1iqtwBClpS/QMlzotghGJY7tgYqlt
         fdocWBntRmvlEUpWcJyOZXwgEv/4T6EzIhIO+fZch1vBRlDAJhRWFL7hXsd3BMJ8ekQU
         7a+7cbur1vX8GrowIIt6UuBy6xcfYcFTNyJ+FNJKBa1Wv7Rom5r576Utqx2UZocMhKpB
         dVIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXw7c2HQcSQWa/Ykzo1DF1XpL4IaHZOQmiF6QFEaHHY8aowFsPL5e8K1bWc4NnbU3lh/3YB0UCU1znn@vger.kernel.org
X-Gm-Message-State: AOJu0YwIPLvvV7gUrjIsRLRnanV0iTNQXA4mIkMvBUxe/U1X9BRN7Ikl
	/uZDvil4NRnSVlJz1wUGMzbYX5gR6/5sp9RrtQ3s2IU9dkF9Jfk/y8fFgFB/1n3jYcVTjphtrR5
	R7ryPlF29O5elxK3ouDsqrMw5cUxA0XwWDkVgAdvfeHPPxBQpmafRru8QNx25kKpI
X-Gm-Gg: ATEYQzyjJC6ZFvIJq3/x9TwumibgU8OL1mTIYcMqSNHoV4xhlZOoJjDlWEf+JpYlz9d
	DyzPc1vNM2Cu5K0hVaNV/8hd3H9SGP0awYOgxPAKsNDCXTW5e2mE3U4+SyCqmNs0bTYGGt8uFb2
	/LTrvloGqbFA4sFb0uTUJsr0omJv+TJ+BjOx+GlJuIv3KWMjTZhxiPb2xeFxOcMl7iq7VqWR95h
	juw+wBiXW2MJSudxE+1VkVDFaAKgw007xfIAN++CCnrBgLmb9eQ5Yvrc+2gKaNwmhEEPA/bfxN4
	v7pxYnJqBcjZeR3OBPIkG6G7SUyeW70Y4pEc9rmiXYNb+b6UQOHQxuQDnJEwSRZGTv99II1gdN+
	GX4OiJ4dh1wUwtk4oZZ0KO9hbHpAvYr0HP7zT7qebLpPeJoLL3A==
X-Received: by 2002:a05:620a:4891:b0:8a3:90c:55fb with SMTP id af79cd13be357-8cbc8e8493fmr1394382585a.20.1772442276689;
        Mon, 02 Mar 2026 01:04:36 -0800 (PST)
X-Received: by 2002:a05:620a:4891:b0:8a3:90c:55fb with SMTP id af79cd13be357-8cbc8e8493fmr1394380385a.20.1772442276208;
        Mon, 02 Mar 2026 01:04:36 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:31b0:507f:9cb:f026])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfec46dbsm125936835e9.30.2026.03.02.01.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 01:04:35 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: Timberdale: repair kernel-doc comments
Date: Mon,  2 Mar 2026 10:04:33 +0100
Message-ID: <177244227073.8529.10314110661197870463.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260301014822.3133268-1-rdunlap@infradead.org>
References: <20260301014822.3133268-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Jyb7Q0JKcfiKB5IS9UQg0jXFP5989lXq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA3NyBTYWx0ZWRfXzAr4rjgkohS1
 YxkygOBHa1gJpJzw45LoEo58KgXuZUdWRlp5My0oCqHwEFesvwVW04WVs5a/bVLL3yDsVXhzJq8
 +soL9Wch66w9EMuxsVUnGdHYOGkZeLOnlAnjG7VJnpDZ8pZPrWk0ZfrdZx/A3dEJ1Tgp9GYMXVC
 EdVV8adHfH1sd6oTN9oenaaLZ715DGN0ImzWkAx1BI359wHhuaBlhxZwaDlHLnf1R6j4u9VbnU5
 93fCQP3F1OLlKrCFHguEJFjN7V3HBK9iGhBU+hdqfqyEtXGvWtnq6aiXTBAWlcUvocpF8cFZM7S
 m/sgw+2H6VEueqF8bJK1dYq+LSg9kKnGi8Asy+ren9rHL5FwVjOExskacmQbcFR4P8K9l1cZMux
 DKptBzwDcR+mqqVWdUerBLJIXiEXpLsl8fBaRbwAppA8KSSb1FYJLQhmDlJZjI9mPoOsq7sOWN2
 FXquHTJMKbiZAQOh4xw==
X-Authority-Analysis: v=2.4 cv=HKDO14tv c=1 sm=1 tr=0 ts=69a552a5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=OkUscjAJH_W4Cv3t73wA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Jyb7Q0JKcfiKB5IS9UQg0jXFP5989lXq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-32368-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1CDC11D53C0
X-Rspamd-Action: no action


On Sat, 28 Feb 2026 17:48:22 -0800, Randy Dunlap wrote:
> Use a ':' after struct member names to avoid kernel-doc warnings:
> 
> Warning: include/linux/timb_gpio.h:22 struct member 'gpio_base' not
>  described in 'timbgpio_platform_data'
> Warning: include/linux/timb_gpio.h:22 struct member 'nr_pins' not
>  described in 'timbgpio_platform_data'
> Warning: include/linux/timb_gpio.h:22 struct member 'irq_base' not
>  described in 'timbgpio_platform_data'
> 
> [...]

Applied, thanks!

[1/1] gpio: Timberdale: repair kernel-doc comments
      https://git.kernel.org/brgl/c/8a9ebe8c3ca4c5bdad8f010656f4c2155da589fd

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

