Return-Path: <linux-gpio+bounces-37919-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uSPRCM0uIWoDAQEAu9opvQ
	(envelope-from <linux-gpio+bounces-37919-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 09:52:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D9E63DC3E
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 09:52:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Q1uW5FUq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZlmqlJZ9;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37919-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37919-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E6B4230956DF
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2026 07:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D693AD537;
	Thu,  4 Jun 2026 07:48:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043EC316197
	for <linux-gpio@vger.kernel.org>; Thu,  4 Jun 2026 07:48:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780559298; cv=none; b=NKp/QyYQlQJwpTVwn43YEJD6K06r3cXyN00HnIDWvnMHxgnDNK6PsR74jYs28bC08UxuWOTLEpqxvumX6pLsmMxYeBgM7OvbdtHQHupqp1ZFKfSmOjbMqU/vZuSpxbpq69tQIkp6/UAm4nDHB7/vjdOOQhcAthQrzvzsyOovWRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780559298; c=relaxed/simple;
	bh=gnepXkYccxdF9wmboz3M5qq6g5M46lRaIr1cHRFGKAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YwFS+fC4waX6KeFU2/tlbgHFvfrgYyqsPqG+G+VzNOxSK85HVtzLRKg/sRT6L0KJIa3NCMwa4/A38x/+DYGresMa7uWwLmhKey9m1ztZlAiFLO3uDfipl2pUwtdSMfazyJ/0Lufkw++pybkHE8pJ/GWXCAp1xQ38AJpQTOJ5yPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q1uW5FUq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZlmqlJZ9; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6543xm7A1993560
	for <linux-gpio@vger.kernel.org>; Thu, 4 Jun 2026 07:48:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PBjqVTIZCb69LJ0X+k0gL4SwV8e5nKNrUhrNnUm3JYg=; b=Q1uW5FUq4gpj9sMH
	2aBCV9KWDudjRzVGWiX4NZSZbbuJBjiVAMJZQL9WpWAlQUxPkfjxOuamhXTr1iRD
	6jBla8CtivHU5BnTop8jdPP1aw15iByqeTLDTsIaxVWiMW9OrBhJardiSv1Z2UxZ
	6pnOBmlL/etzQLjd7+ioWV6Igwq+1SKaZh/UE2KJF9Sb+G+GR75Ml/NZgGS/kb0o
	Ntiz6/x9DG20VKNLOQXSdOhFN+VXqJ8z0ClOaQ8YWRi9C9ZCBTZabStcOI2+KiHO
	T7fcONOmq0bCR9alvsLPHTFryXUn88U+ImP7db5jKOQBtFGdHq3mfvqi7gFUMOn/
	T6K4nQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejs8ptj9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 07:48:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5178444b752so10170701cf.3
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 00:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780559295; x=1781164095; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PBjqVTIZCb69LJ0X+k0gL4SwV8e5nKNrUhrNnUm3JYg=;
        b=ZlmqlJZ9I7WPRK1C2Hli0+eLDkqKuOfM9KzddgO6fvNnWndbA0ZoA51TUuk2F0TqqP
         I6rJ3C47Vm9Yktk3yGBdd2SoFZDgfSpyy6TA0ZFtSrj5iSCAzECLJ5tLdDC1mRzV8Qk9
         1GDeaTIA2v26QWZ3G+XctGhtLkpW+60GiLz69kG4EnoAU70MpUhsY6mfVL1H6maZnOyt
         0dLHhfRkpppK5Mk28WFnCqxhIkfCuPLfDalYij4iQB2ZZ2cwInCxb+6dZi1ssw5eQhFM
         3un/RU+r2JRy+p5LcOl1O4aglFt6Jauhnr/FSO/Hk6S2Fhh/STmM/7pbtaT/99enBS+N
         7P1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780559295; x=1781164095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PBjqVTIZCb69LJ0X+k0gL4SwV8e5nKNrUhrNnUm3JYg=;
        b=P4McIKRjhQJa95Uh0ZJ8+z1a+4gQlQToXT+h2b/xvWeHCXMMPwxJtyzWrdrk/9yEzS
         kztb6vIuvaKgomCyKHRPd4RUZ49eEPmpN4/Fg95eUaOD73QCgotC0uFqtutNEbG28tep
         uw1DvWZ1H/Gd9cXhhJk/gIkCAaGykWiXJ8G1/HSbOcAKaj1du+UHTSXuD/4rFxk23kPp
         MeVeRznnW0/F+J38Y39kCeldVAobU8sOaIVFyzAynCkWoKZRm2RTwj2IVQ1SKrhqfUs3
         u3TcdhA9bpsqTk8bYmX8sV+p3m3W9MNBfE1uSsgENQjoCnPpo4EvvKIqhFypxgxSdOai
         MLYw==
X-Forwarded-Encrypted: i=1; AFNElJ+oJ7Njxq4nzNFU6kjtN5I6Uq5ZdLhL/6IGRdIZNVTaKrtbu7auEIBAkLNpd/aKi4iMobz4UqLvqSh9@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd6mpdXcv3OWW5HM9Fm2Tcrvlo/rClVuhjefvAVpUR3KN5k0k1
	DGlC54kugXSBCS+JD9HROwN4EvitFMp9JTLZOtrf6du0EW++06AGL/9aNS2Bjo+wbatSu6+H6cH
	nRIJdjxGxlzt7tVUGvXbqIYAEBQ8uvKF2CvLLj0lbWuqtnNprCHXlJ1J2iorGESdK
X-Gm-Gg: Acq92OHZofIGyehVJKoREs2Ubf0b9YJtetkYtjmwR0do/gunDfBz5gI1IOK8/lhAyI1
	9eD4bIq8pU3IbjfanNklRWExQQKUfZ9DRu/RzXCVR+3Cpos5r8UAw1zelCkoAlzkbRzjcl8wmun
	kNaQsEfL7J8XwO8MhAGX/klOE6X4QcN5hjMdh9Af2sx4Y1ruyjPxcQb/NRMvS+OXva+EFRKYLaz
	p60tCcu6c44h2BM4dbrCqFaICCLX0n+32hM/SY3CCqaalsm90rrdROiIaZKutZJ99kLhjEDJ2Z2
	Z7FOCE8USXuNDLx0xxlu7FgDdStaIVkP0LXjJvYxFF89uHeLwSu9L+zeWTIg1B8i9P0t6lNO3qp
	JzNSsZyH/YPryBcTmHKlC6hw1SRYnG+m/0xe2XcorIaKtizCLc6wgdxmHpRMtTaEE/CP96wAArv
	pQ7WvXLQ0=
X-Received: by 2002:ac8:641:0:b0:50f:c1d4:d9e1 with SMTP id d75a77b69052e-51778725774mr73238781cf.38.1780559294235;
        Thu, 04 Jun 2026 00:48:14 -0700 (PDT)
X-Received: by 2002:ac8:641:0:b0:50f:c1d4:d9e1 with SMTP id d75a77b69052e-51778725774mr73238651cf.38.1780559293876;
        Thu, 04 Jun 2026 00:48:13 -0700 (PDT)
Received: from brgl-qcom.local (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b7d6b990sm71092725e9.2.2026.06.04.00.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 00:48:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 09:47:44 +0200
Subject: [PATCH libgpiod v2 01/15] core: fix signed/unsigned type mismatch
 in gpiod_line_request_get_value()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-pre-2-3-fixes-v2-1-781bcaf47475@oss.qualcomm.com>
References: <20260604-pre-2-3-fixes-v2-0-781bcaf47475@oss.qualcomm.com>
In-Reply-To: <20260604-pre-2-3-fixes-v2-0-781bcaf47475@oss.qualcomm.com>
To: Kent Gibson <warthog618@gmail.com>, Erik Wierich <erik@riscstar.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Fazio <vfazio@xes-inc.com>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1150;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=gnepXkYccxdF9wmboz3M5qq6g5M46lRaIr1cHRFGKAs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqIS2qvb4nupCvcspADVAXCs7LgjTG5FUN4aINm
 WFjhFY1Gk6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaiEtqgAKCRAFnS7L/zaE
 wyaRD/9uFJ1oDBttcv/0X+Kooee9Bi2YDqO60TKP1dKobNT05auuzXYGYnxnk9VogQtngLfHsxG
 smimFLMtDRe9OloowJNkQ7ts/4GAoGY8QZ3cekyyw/iMN1xHfpZzOGaMuDhck/pJVBejYHfJ9ct
 JkkcVek1W3b646sfsedXr0whG+Zx0n5RtOTTVXHial1GCG2IiyzfMHoC88zJFeNJiC+cdAkpCnp
 Di2rq3dTu7WWStFuDYeTWqTVsqSQ3pXMMByr18hNPm4M7pU4oi79Oh0PNRWrZRcA5gYCOqWnTO6
 QR5ab1ls42fUDf3Yz+4FzwVg/bCly1c2ZpXXxrHrcF0SFzEm/GHNVJp20V6FkBjW9UvGVbGuiNg
 i7aZQLCHGa+W7J7yc0Cimj4UkW8wVfHMjTz4zYXE/Cxw/kexpBxwsSTjUlt6Gw1+DEoqHrFykyb
 A+YAcPvBnH3Cm+LoJOIZRnAEE78IumfoWZNZ1/1uQidF7Z9gTG8jgzKqd+wniBpe1wmr97coUhH
 ycaY8mea8mcc+ag4TL9G463RC6Lp8DEEY9YKf1AxEJhxaGPCOHwc3VC4nYi6xsIo/j7h5dlYiJd
 s2znrpnrPM2xVgDeu4zj2MoESmizcnm1SMUnCklrorw2bqghEeRvSJQOUs9VQJhIt4NV+7oBhFN
 FWeg2qkDpdgSCJQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: o9lKPhUbzd_ybTqB2eGDazjgBikXmUBf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA3NSBTYWx0ZWRfX/A8KGpOK4+AZ
 /pJ03SIapQ7fOgf0ADeUknUszbX6i5fgPPi94vcc/Lg6dEhlVX836rUyWXnMq66EsGJaPn8za+c
 G4AjazCajvWmbKcfwdoUdEphWT8hke0MmIM4TpNwsLy5ESAubUgrtUduJi9zlqSGa0tn1UKlhYG
 GKhTknwR7p6hQSKUs8M7Yqg8B/6/TDYh6EBCnN2VLlUaZ6ljMbWdEdox/Mahqsuq9t+UlZwFUB8
 1LAsrx7ETpXSb8dON1NzzMyigA6dedHIWyeceQJGlOmqDIDasEvgNOUsrn3NekD3A8jkCgjz70+
 TLQ1OF1/EkJGDi1OWuWDNm6LirSLrKlq3kTje6bWFQhC5ru4onIF/9xHLjn+Id0AgP9I61dueq4
 2c5iNT5dK0R+IEmau5owlssUFMku8n2iw8vjudd17n0YiXfUlxPN+SBHgOmA1/TP08dyxqX00zA
 jUwiDLnMtxX7fle+87g==
X-Authority-Analysis: v=2.4 cv=E779Y6dl c=1 sm=1 tr=0 ts=6a212dbf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=aBIYUfOEhgoR9egqXYNcqA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=3W9sBVhNAAAA:8 a=EUspDBNiAAAA:8 a=AkmSCQ0dM_fKXMyayTEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=38sOm0jhF1M2KuwyeTFR:22
X-Proofpoint-GUID: o9lKPhUbzd_ybTqB2eGDazjgBikXmUBf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37919-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:warthog618@gmail.com,m:erik@riscstar.com,m:viresh.kumar@linaro.org,m:vfazio@xes-inc.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xes-inc.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,riscstar.com,linaro.org,xes-inc.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B8D9E63DC3E

The local variable used to store the return value of
gpiod_line_request_get_values_subset() was declared as unsigned int
while the function returns int (-1 on error). The check for the error
condition worked by accident because assigning -1 to an unsigned type
produces UINT_MAX, which is non-zero, but using the wrong type is
misleading and technically invoking implementation-defined behaviour.
Use int throughout.

Fixes: b7ba732e6a93 ("treewide: libgpiod v2 implementation")
Assisted-by: Claude Sonnet 4.6
Acked-by: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 lib/line-request.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/line-request.c b/lib/line-request.c
index 2d41d96aeffed731b5039565672ebf894317a2a7..32ab9aec1f38f387a6624ed61246e58d6f162cf0 100644
--- a/lib/line-request.c
+++ b/lib/line-request.c
@@ -99,7 +99,7 @@ gpiod_line_request_get_value(struct gpiod_line_request *request,
 			     unsigned int offset)
 {
 	enum gpiod_line_value val;
-	unsigned int ret;
+	int ret;
 
 	assert(request);
 

-- 
2.47.3


