Return-Path: <linux-gpio+bounces-31211-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OcOL7DTeWlCzwEAu9opvQ
	(envelope-from <linux-gpio+bounces-31211-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 10:15:28 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D40A09EB2B
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 10:15:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 74F163001F96
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 09:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3C054502A;
	Wed, 28 Jan 2026 09:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IOQmCH/u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d6+mjY1x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D90341065
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 09:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769591723; cv=none; b=iCNWmOUIQdhKGy6LICjNozoLP7VMuOLxacYclrEDUlEH9zPWk7ZdtxFVUgfUOp8tEMriDoNMDpDZgvOJjxg1QBc9lW28GjyEx8+2+JG49dwRpO4ljftl8/RhKHWkt+9GJJBcIcqbOK7hYPenvLybj4lBjnt25iMO/KQXjw62eWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769591723; c=relaxed/simple;
	bh=SLfzkaov8KsnXUhqe/CVgBaiPpdt+9ECMg5iTogKyN8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MBxSY07KOnEFW/vI1ARRFzsH67ZluLBUU7cakGzLqtXOcvHogJNYlNqlO6edP1Euc53NUoK5c+BttjrZ2gedFIWhzJx3ALGt46mwHGjXu/VyDdA2uoINpqbkVVOOKBjcqTIqCHskotKO7OYFrWlH3C8pVECAftDyyWxWf3EsiH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IOQmCH/u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d6+mjY1x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S929r4320331
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 09:15:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hhu5VGoYuY+2APKnCn4qVYkCFA/S4HA43b3PtaHWhkw=; b=IOQmCH/ufW4viTrX
	TaPxc6VZycFh8Rzoq5DgV4SGdIiSG0d75PmMyeNdZ980/H9M9Q0AorKl4QNSuDLm
	tZPLeF/asFbIJ/dLycpc4Yz8gxvmijVeoyQwHmTlQP9uo7ZaBc4a/w3fiYNJu3kg
	b8RMXx5UIr0hyRyGROHMa7Gz/LOJN4IJdLd1LzEKxjHXiWKjvbBLlpENOQq6GDgv
	MisyeA1ZYmBcRmqjwGAjgcYnf8LW/LAbKQzz6Gg5noeGM2lII7Iw5S37oNsX5OxW
	ZvU8H9UeSORzX0//N7Sp9beU7sNyPEEDAOaJ7rvXFqFK1UlJXPvy5hqsNEsCLTFU
	j5ycQA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by4sjt23y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 09:15:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6deddd7f7so1442101685a.3
        for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 01:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769591721; x=1770196521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhu5VGoYuY+2APKnCn4qVYkCFA/S4HA43b3PtaHWhkw=;
        b=d6+mjY1xlL3QLPUiW6slIKwHciHTywZHyS+NibacZenOmJWyWPV75tdFvCimapG09B
         xOb8+6ABOG9NJVYyA+njA3faYyWqkGuObeHadBOZHLm+7bkdl+/rP5zS5TFi5MQffTTv
         gqAZznCgye2pP8Y++wQkGCovByRIQ2CCcWEhpiwb+ZeKpTfihaD1SL14PGLfYMS4T8db
         v1U2OqyZ/TC4gOAHKsQf9zKUX2/EHVWUoRmnICszz1/e4w+hT6h3UBmM0paPr4o7aPF7
         KqX0vYlBWgFZI6O87Z32pM2B6/VqQhJ7yPNiBt96g4dX7gVtCS4z0hLR+z/4bBn/vudG
         cQgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769591721; x=1770196521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hhu5VGoYuY+2APKnCn4qVYkCFA/S4HA43b3PtaHWhkw=;
        b=P2v7Ft8pPmi4PtCRL2VSOx98BNz2MRGhZ1DTggvrjWgMpEjb6ZcGjGzpY7prligDGQ
         wr7kPz1CEYK/fpLAKfXlzlRsPSoIzcNjm1ZomXXOSrIrpCrwJSvdVVka673m6alrKG76
         ZMxhPMqahO95jAPz4o3ydk+TzlZRqpQnmSorqaL7uhaXMwknvlYQAg5DybRUN+wuQOlO
         tndHof0IDZProL9MtJARdqEWQeBYeadpL7bX65Y/fGFstdEvEsbzYB9kXAtM+HyfQBHn
         R0PkMSLM6VeVZMddBUPGaiSwRMge8uhRvd7ME5BrbfLUImctorBd5N9wjK7wR3r8ejzR
         OG9A==
X-Forwarded-Encrypted: i=1; AJvYcCX9xBAUgM6dnD8zosTF7S0ms/6GcVQad4+jGypOcTrDhY2334gfXEJxXnzQo2/03HpuygOustwXt91o@vger.kernel.org
X-Gm-Message-State: AOJu0YyzwfZfNwo1JK4vOaTuATGGPEp88dDTMEDNYSIECC8pos2EmqQW
	gHx1RBMQOYWJB5UUZpfQw6ECW9Y1oew5fFVgb21MSle0BX3V87hiBYNCfqjMUaAiURBiQ+1S+VD
	dEGrkNUAXAlDaiCI3qKmzMWPyLsBBAF7LTAHyV28Qw+gUZR7NhfOsZGUCETCVqELJ
X-Gm-Gg: AZuq6aJ3pPrKonzQiQEZYnYMPOBdLP4UyYgI8i6CH2nbr8sQfV8YpiMJjFwjQB7uYay
	Q+9LOrm0LsANKfjO9qvCWBdpNMHbKwdz7qFqDhdjtz5SxryfgCDr3jT57bixy30ZeiHKmoIuTGS
	0xVjUbS8IfOu7Jlh5yDL4pF8q7Trtov2YLVVx8AMcZM3qzZyLJ3hT8o5DoETPmnyG8GPWFyPeqM
	Mpd3IocQuPB/eNRoVSoSHM/T9xB5gQ15OVGhtAR5FHmi801pzoEeEq8S9Fn4+bcvg1svivIehYP
	Uk9vKniULad/9QYowJf8wrM9oKmvS6rhmwNyk7b/nEL6sGcmd+mOK0IQ+/uSAcw88UQu7AV568A
	nbaM+eIoVGkabiJVxbT3F6BWqwW2CteNC2LDJzg==
X-Received: by 2002:a05:620a:2844:b0:8c5:2e1b:7913 with SMTP id af79cd13be357-8c70b841f60mr586868185a.25.1769591720604;
        Wed, 28 Jan 2026 01:15:20 -0800 (PST)
X-Received: by 2002:a05:620a:2844:b0:8c5:2e1b:7913 with SMTP id af79cd13be357-8c70b841f60mr586866185a.25.1769591720177;
        Wed, 28 Jan 2026 01:15:20 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:6cbc:dfde:e62d:3195])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c4f3edsm114757505e9.15.2026.01.28.01.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 01:15:19 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org,
        Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Doug Berger <opendmb@gmail.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Christophe Leroy <chleroy@kernel.org>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH v2 0/3] gpio: brcmstb: Bug fixes and wake-up interrupt improvements
Date: Wed, 28 Jan 2026 10:15:17 +0100
Message-ID: <176959169745.11014.2711672747307592197.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260127214656.447333-1-florian.fainelli@broadcom.com>
References: <20260127214656.447333-1-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA3NSBTYWx0ZWRfX3rUAZrzgiFsy
 XrLOoTol/4Z8Vb820ATNWtJQArrHr8qTmO91qjV2RF9wpSm8KFx0N83rbDfLP5qDsaUVDTVS6aF
 HWmp8gpmkPYINiMU02mHKuNDrJSIW2ZBc3IFcitW6NQDlwvzXzZG6YLDM1dy3aSV9eaed6K9qYc
 D+1IyXlTQoq9XS4BXJLhlmO5eC49BmSA4R+AnU+L962R9au7bszkpR6f7ruXVqLCXhGv5bN2pZ/
 4ZDZq6BvdvWZ2z8nlpbBBQgiMYVKmNt/AdeVQ75pWE+S/5rb6nyohKsYVsea+4OysGnEhRV0Xje
 PSX8Qq2M7zc3jyF9b5KGnnIqQke0uPnUhGTfMrByYa5bYSqEcuN5YrkvOdYise+CvQ8vdU6v9B9
 6/0G0SEkYMn7dr0Xj9BKVAJrb8SnFS3zUTy0CBKWXhjqmY5ghwetz9PT3BoR7rurUtOPwrdOxqq
 oydPyk2Y6BayLililsg==
X-Proofpoint-ORIG-GUID: ZiSceCt4S4ilb2N8LN2FTzPCTYFgQkk_
X-Authority-Analysis: v=2.4 cv=KezfcAYD c=1 sm=1 tr=0 ts=6979d3a9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=05lQHlDK7r49ThUfEH8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: ZiSceCt4S4ilb2N8LN2FTzPCTYFgQkk_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_01,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280075
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,gmail.com,broadcom.com,kernel.org,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-31211-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D40A09EB2B
X-Rspamd-Action: no action


On Tue, 27 Jan 2026 13:46:53 -0800, Florian Fainelli wrote:
> This patch series corrects the HW interrupt to the bank mapping logic to
> be more robust and do not assume any particular order.
> 
> The last two patches improve the handling of early wake-up conditions
> and makes it more robust so we can use those during "s2idle".
> 
> Changes in v2:
> 
> [...]

I queued this up for fixes, the rest can wait until v7.0-rc1.

[1/3] gpio: brcmstb: correct hwirq to bank map
      https://git.kernel.org/brgl/c/b2cf569ed81e7574d4287eaf3b2c38690a934d34

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

