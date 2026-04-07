Return-Path: <linux-gpio+bounces-34791-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMWmDPn91GnOzQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34791-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:52:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6453AEACE
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:52:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1460303C4D6
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 12:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24C6E3B4E94;
	Tue,  7 Apr 2026 12:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="frSOAa8v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CCc2tuSN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3163B47D8
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 12:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775566280; cv=none; b=Bpvzxq3JIukZ7lnTc76nm44bYTCk6YFncK/6og3JFxPZJdAYvWvQnEd6c1GOKMGEqv8DmColpNEAHDcRg/WKjnDkFBWMwouv4gCjVytg3AWcI61RVaZWEcjnGLQUjbJNQLey+fly/FsdgVLy7sCxwLx2SbRmpjHrCnk+yyb7mvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775566280; c=relaxed/simple;
	bh=+NZ9iYWO4CliY+9ApLbnSgOd0B4wReUZbNetDBvz5dc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T0gSXsFFtMsnXvjvdNhelDkU1hww9fsRva+ulj+Xkqyaws8clUu2rdNZRnP1S5+Uhw7F+yXWOmad9POmK4EwbvTtOiGcWXYKCEtZgsCurEeLPMQNbLpdxCMSXsSpDe9JFC2uyfuVKqASTa1+HDamvzpw5UDeth5VRuZE+iuZaZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=frSOAa8v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CCc2tuSN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376RCKM3402372
	for <linux-gpio@vger.kernel.org>; Tue, 7 Apr 2026 12:51:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I5nTdcMftUu9a+A+qMXm4sbHiqgdJDraneoNfnE+UhA=; b=frSOAa8v5Hrei9AJ
	9j2wD4N4zQv1hg65fQ7onE5CH+H5AJ0n28KSzMi6CrSj8P8wbtAJr5QE/Tt/RPdB
	haVITBjDthijNJQakbuONqHlAg1zd0DhQD4bpywhOYBUsdQdGiKIkn9leglXKCPA
	oeyV4pQ4nB+MhE87+5H2eLO60TmnudEDye6ICuYFZIqn/7NPLqIAfmvjq7zUjUne
	SBGkMGgXK1uuwHAezDbYfbla7FiuCNbSrg37WaBeW42Ig0vdmlHhZAKaeoYLTpeg
	6l0emn4CaQouKCklmNfpTLnJU72fywkyj0Ab4lVETTpOUAlsJQBtZpO5n4AXmest
	Lc919Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrhtqxf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 12:51:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8e8c47a3so36447881cf.0
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 05:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775566278; x=1776171078; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I5nTdcMftUu9a+A+qMXm4sbHiqgdJDraneoNfnE+UhA=;
        b=CCc2tuSNOQKaHLR4KWXcjC1G8Fqjr/WrLwY9m8rT8RKzjdFLAvLKc0Sf3HdTTgwMvG
         k1Tm3Sa3LhBuWgl+yUCTdC32sMQQ0jrD8Zdk4rb2+tMH96l+z8wAumpiSSxHrLR+A2ko
         ZPN4dYZxRK1N/Bpj2KzaOxr9J+ZUwILH/YBe6D83kcGi+bXdQJ1QKgUl1ANiOBhEw4Ci
         WioUjMAJ2+8OfAygVazxA9bzFS0S4tK3e9NTR8t0dD5gIk3e/u5omkT4IXrsdiYcjRdB
         5V61O84juotnPG9D3VE1lUDLX5RyPXTttBJAwZY54k2R3prOqfbMDVpDN7ElnkGg+5Sn
         YQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775566278; x=1776171078;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I5nTdcMftUu9a+A+qMXm4sbHiqgdJDraneoNfnE+UhA=;
        b=lVVxp+kC44Bpc50+EyldgLhe7RFoltV0uM5kaFx13p6VQcTGXNWRmbcxAeikgrhY0L
         suq2Dw1z0rsenK7LLepQQFhd+VvOlu8spcgOtXKWqI4FdUtkcApque1SqtEUZDGzS3Wu
         S2umCIsvRFV9V5Nn/+ClbOPAhezMVNAmqXnXK0I4ql6jm81mRhTGq9bGC4zi8v9DRbW/
         IB0/9cLwRjDmSQWda3ancCwXISL8YeOxZ4vyC2uVu8WjnyhQqA7RytygtonW7UPbcGek
         GZ+15X4qYMMrrjKaGZ2Bb8tcCKFkKK+xaz6tyfMY/+eMsf/JDmWm/K1BdiIduVOqNeEc
         Oqlw==
X-Gm-Message-State: AOJu0Yy8lKEta74JYz15Cp12s4JkWNDqPDoUzZmmFbnLO1wQimF3/s9o
	bYNSzlj/ippUbmEu5yOckPpTrGxFpeTLXNZyuCkB3NMUg2cQIAcoG8ouDQFBnjjA5HsO48lKozD
	7KVKvyfYxpp04YswU5FhgXO1p6N09XTlxULQiEL1BWuWknhEFjbu0KcSR1lU5STbS
X-Gm-Gg: AeBDiescvDyMK5oxbWGadq+wLnru2ucr7+xqePrPZ640zxu0uEZqIUTBbSlc5XE15nm
	MMs5U2w+9o1hn5alm2fMftpfbEv8v9nx2W7SnPAHrxPHHouKmflbkbA7yEjNqHe4ZhlkCo7vFAj
	rUtlIscbWeOaa02XTJTwwhw9jS1ojrcU6X5r4BZDlwMLmBqfTcGHiz3cLPLn6nTFSGp9YZ8qH1l
	YsgG76+0DB4g7lMEgcveztumoFy6bXj6nbgsFM9TsSiBydg5ZOPWq8hfrZMwqf8LJV24puuNoCD
	sSz/HsqLD8Zlp3ckQaBw+F92/EGGACrygvTwlhFdlo58pjeOkPw1hbZHXB/SFB6bQgAmsoRCEUs
	/24Dd5dGJT3CLkyxCz404GwKQ88mMokgclfPiuDniVHXVojwMA3Y=
X-Received: by 2002:a05:622a:5c89:b0:509:2618:cefb with SMTP id d75a77b69052e-50d62cc031cmr252904311cf.38.1775566278234;
        Tue, 07 Apr 2026 05:51:18 -0700 (PDT)
X-Received: by 2002:a05:622a:5c89:b0:509:2618:cefb with SMTP id d75a77b69052e-50d62cc031cmr252903911cf.38.1775566277845;
        Tue, 07 Apr 2026 05:51:17 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:b36f:5370:5f91:2d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e83682fsm577526505e9.7.2026.04.07.05.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 05:51:17 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 14:49:55 +0200
Subject: [PATCH libgpiod 04/14] core: fix parameter type in
 gpiod_line_mask_test_bit()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-treewide-fixes-v1-4-66c9744a56a3@oss.qualcomm.com>
References: <20260407-treewide-fixes-v1-0-66c9744a56a3@oss.qualcomm.com>
In-Reply-To: <20260407-treewide-fixes-v1-0-66c9744a56a3@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Kent Gibson <warthog618@gmail.com>, 4fqr <4fqr@proton.me>,
        Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1766;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+NZ9iYWO4CliY+9ApLbnSgOd0B4wReUZbNetDBvz5dc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp1P2220m7r/66fsJujOsKIG4VCwpW7Zn6C6735
 7SZpp35slmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCadT9tgAKCRAFnS7L/zaE
 w9lOEACkkoavo90Y2gbW2HpELP8loWLMB2HEyU0Q5EBB8pwcSTmLTplHCCa+yK4c7B5wG/u+ldq
 H0+T9SXH/0+XjGhwaw3EQ4hqovifjpKX5JxeUUVN7c1aUet8wrOdmYXD7YeH2ZXyXVZMZ8oU+Ff
 QEn+Snaa+aNncfeB81Ey7WI8GllcV8IkRAHGyix3oqAtrMzgG06ggoA62vZfbthaTKfeqTDC5Pf
 xVJWmaMmJvXyS5cBAHFvL2aHWrVrISiwotuSpod/y9HYhGGeFGnplIl1vXzsu4rZpv+u4o5aWQw
 Qp66OrHvqWIpuO7nXGJ+nVbOmBhxcAhBM+E4BCwn/r6sUNX2DYlJUhQbRWNzjZ6GJGmO9BXc1ti
 dKNwBiI1LySmQN9HIzPXbusJ29nHX+0M0q/IK/Wdu+uNkFwM0yFYEWvmydT1VLhBASGTaXUHb6U
 rO4S/5PApAGwrCsNTYFNb8+sZ9sq7MU8PYkxEk4PDZuDAOuC4VnynJxoVi1dMtKvuFO1aQhCTDA
 PilmPZtZ7KoKpXEDafpMpXo1/mWgi+RJ+tF73Jkil+b0aB9F0XqgeF3GSmP1IikZ7y50CmwU3kY
 UpzzsDeE1fDrwSCLtPtB15ikU7mGEKS/iV2pd3KBMuYY7yAUj0ByrQA/BNkfd9PLRI21hvDfAoL
 ABnB/oxqltkdtMw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyMCBTYWx0ZWRfX+RVtScGWRgMQ
 cR4EIcNVp/hjYS8Kit53tMzZUYNvX91kuPvoagNCM6tf+XR9CWE6hRvV2y9rjecJSf8GhO9eKdk
 rh22xrbvp3ax6BxV5QbyOcf72S2nUdqihSUnt5VvQpaZDSMuSgsvkecJSXWnuQLueKl73c95OoV
 puN6KD4w/8CYxg5fhi3UMH7KXE3vHsQAOSTJWIsRHiFmNdKn825n3qc2mAs4x6wd5KUCpLaGTwQ
 vDhyNm7WB4QZyboYmTP9rIg2prxJYcv+VosIvLCLX8SDGbb8aC4WiABTuSRu1oBkeV/Om9rDjC0
 hOp2oOOMdt1PwmAIC7e8Q0f/K81xRslyF6Wx8Pc1BnXDdpCUiZD0B1M1AM6ImYMaiTTz0S/fiDY
 MgsF3NbNxwFl53PXe7Mb5iwwiN/5+I8aoSm9iyEenaW0yhgf1c3I3FHwEyghgmq7MirSo6nZAZk
 uF2ovFHnT7W9ekG2beQ==
X-Proofpoint-GUID: oEEClKFxhp22U76b7_s335AgZQ2DkpFx
X-Authority-Analysis: v=2.4 cv=XPUAjwhE c=1 sm=1 tr=0 ts=69d4fdc6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=C7zo6o5BiNti6Iwtyq8A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: oEEClKFxhp22U76b7_s335AgZQ2DkpFx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070120
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-34791-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,proton.me:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,proton.me,xes-inc.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8C6453AEACE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Unlike other bit helpers, gpiod_line_mask_test_bit() takes a signed
integer as argument defining the bit to test. Shifting a value by a count
that is negative or >= the width of the promoted type is undefined
behavior. Make the type consistent with other helpers even though all
current callers are safe as they use variables of size_t as argument to
this function.

Fixes: b7ba732e6a93 ("treewide: libgpiod v2 implementation")
Reported-by: 4fqr <4fqr@proton.me>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 lib/internal.c | 2 +-
 lib/internal.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/internal.c b/lib/internal.c
index 56cb8b9b44b6a81735b40b5a191631a00e0e8638..50d3df94444d622fb125ceb07ac40ca84d944a0c 100644
--- a/lib/internal.c
+++ b/lib/internal.c
@@ -139,7 +139,7 @@ void gpiod_line_mask_zero(uint64_t *mask)
 	*mask = 0ULL;
 }
 
-bool gpiod_line_mask_test_bit(const uint64_t *mask, int nr)
+bool gpiod_line_mask_test_bit(const uint64_t *mask, unsigned int nr)
 {
 	return *mask & (1ULL << nr);
 }
diff --git a/lib/internal.h b/lib/internal.h
index 420fbdda5ec05f2453842bd03ba093104934e556..12899bb85f9e674071c176cf195af81ebd849738 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -41,7 +41,7 @@ int gpiod_set_output_value(enum gpiod_line_value in,
 int gpiod_ioctl(int fd, unsigned long request, void *arg);
 
 void gpiod_line_mask_zero(uint64_t *mask);
-bool gpiod_line_mask_test_bit(const uint64_t *mask, int nr);
+bool gpiod_line_mask_test_bit(const uint64_t *mask, unsigned int nr);
 void gpiod_line_mask_set_bit(uint64_t *mask, unsigned int nr);
 void gpiod_line_mask_assign_bit(uint64_t *mask, unsigned int nr, bool value);
 

-- 
2.47.3


