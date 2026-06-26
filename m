Return-Path: <linux-gpio+bounces-39024-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EkTNAFFIPmpaCgkAu9opvQ
	(envelope-from <linux-gpio+bounces-39024-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 11:37:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4D16CBBE7
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 11:37:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NyyzrSOt;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GleCb3UX;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39024-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39024-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B4E4430060AC
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 09:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF93B3E9C2B;
	Fri, 26 Jun 2026 09:37:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7040A3EA949
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 09:37:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782466631; cv=none; b=QhjRulDBun/E4wZJ8rnh63UOFs6e3fBm38oijvgtwZmnNjkXPWxDo1dUnBW6XbfQ9vJByj76rJbpNzTpnm7QtS1DJQM9V0npKxMfaYcy1sVQpR4SplrH2HpUmJjAKNMlLkbmKZVWrSiNvBnTrf3JpjsiojY4Xt3i0ws/fhl4k8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782466631; c=relaxed/simple;
	bh=3+ZXiJt5ajdmE0Y3MAakY9tFlGNMaGGxC9FsvSeEz60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r55eVQvxKuePAHd8bg2qqruhqcE5DvTb9CzY9LwJIN2dcPikV3RybF7rA/Pp7oW73wUg9/eje1EhttEP2mR9BTkHF6e+NJ2KaGQP1JkDS4CVE4HRYC8NBdzlviuCl5ypJ620CLFBswUjW75oFVi/rYWwN4pibRmDAlLL+MsJuv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NyyzrSOt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GleCb3UX; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q6VM8S4193025
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 09:37:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7HS3lnS4us89tUlYdSsPb/5aTrbLRnBMu++e5q/BvKI=; b=NyyzrSOtrGFA31Dr
	tYERWkvayJiyRYyXt8mg3vyELI23EfRSli2TonXF86HYP1T5D4xWPO74/03Z628U
	1Lh7drXZfPvbt3lknhJ8/ub5FjXlRSrFnI1SeJQA9g3R+SfQtM170/+nATJ4+IWN
	K47b7MHiPhhB1Nakh8AENGBQhO4JDFxyZyrAxRVB95zMD8gSLxlDLjnyUGkshG36
	qcMxZXHvXpjacbBlfHcexhwHxPXk/MVIgGuQqPRPPGwFjmeFoOTX940hOpwgqSxq
	JNEpsG+kPLdvsLoB80NyYh4D6wqJwHai3O0aY0gm9X5jHBA/HXmjLFl+H4FQyXfB
	aCbtjA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fgdstmx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 09:37:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9205e6b0bcaso120137685a.1
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 02:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782466626; x=1783071426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7HS3lnS4us89tUlYdSsPb/5aTrbLRnBMu++e5q/BvKI=;
        b=GleCb3UXhd45s99f7yVLQmUEu1xBx6TtNspUnTKTbuwZzhJy5x22CpUeOALhfB+Iz0
         uGEbwfsS04khZXHe5B4DKrUtnzP0d9ssgusU9Ee4SIUIc7cnAiuIOiERYwJ2e3OMUP2E
         YSOGyzTWzDyfj4pucNlWr83XOyiilyR5Q9SKmqiVpSRU3GvqghcKRZLC3ULjoe0jpJkU
         HLYAwh8/TiwfHaotRtJqZYF/f+OF4FlHb9kqHFr8WCpjWHor0augvOj8QcJfTAPaNlnc
         Tr3ysAGOGCIXaCqyHqm6JP5GPBbexgJQIsecE7n2iWT8HY+Qw17FxFj+iCtNQPXCuNCY
         dFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782466626; x=1783071426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7HS3lnS4us89tUlYdSsPb/5aTrbLRnBMu++e5q/BvKI=;
        b=MvMxwLuoUqylEFCtDOIIN0AjWWUx8EZwhim7cLTTcQX6IxzHNX7x7D4E0okcpxRO6u
         /VEtMqMZmoSPq+b5rS5sbE/R78vNxnUtS5CgGyZ692Vu6iu+zFEvHJ4gGABWaAV0IbfY
         Ng2DGX0I07/wL8T686P2/tdJ0O4fW7ml2tvPJ1EZ5egM6uCJi0K3ZXiTXJvsuyMJiM3/
         4b98CuDjJD/JQAkNu+Ko/98xGczEEJRJ+Hu5lMnR02GXLe9yiaG/qi3jAWc+3Opwy5e3
         WuaXqrKnAWCCf2ZUvUvxa9Fjr5UIBdoQoxZywJXfJ8VMi0W3GcEzXSTkbMyrDMn9hDE1
         +4cA==
X-Forwarded-Encrypted: i=1; AFNElJ8zUaMDxkIfmq98ZJoFmJgQgZ3rMZG/32zKbr34WsIHxQctr24JBT5lZLZDqfxQpFYv2fteL1PTz5kY@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpe5arczgbc5/FyoINseQ89YZOybYoy7+/S5XqxsaBNmAwhuEz
	CdO0WACM7W0u93Ng3JEfZs4XTnj8g5EQzr9a6Av8kRBuJGm90+SCfeknyG3a2c4vinM5UTiUuY2
	G/dMUxiouEMvhhjnFM9r6b6AO6MZ1sL9vI2hN7kSYDzo6k53tlL01OAqo1MRJCapH
X-Gm-Gg: AfdE7cn1GD238MG0xJmsCFAeHKUxqSwCTyYK79oc4r6e3dklzsOAO54usI751i8gY7o
	jFSuC9/L5Q+LrgcpN8xToOkJJNw9EiSVt5rVdaNeDWIMf4TdXyJqlUwLcXtuQVuoTZgI+BOsGXf
	NkAhaevn6MIeZh/vdO6dISIUDYPTIppfF42UQiQuzrhwLuIjWAE1hLjBP4l7rA69jN2oRFdaZQY
	hqUN22IQDWrJVoTOhPD6faNs7OZ1rux4QLXIeqBLoNkoRC3DhHHEbMZt5SMqDdmSvSUihTcmaPV
	r5gMxlUjTE8pGVLWl3QeVSL1LG9kHEuuCgcUKuaYoFWbXsGz6GModo3TT9GyCHip+lbdKGfucl9
	PZJiFRUHwQENEXO5QO4qhCCDN2or6+38mqvWXKhY=
X-Received: by 2002:a05:620a:4487:b0:925:c160:f3a with SMTP id af79cd13be357-9293c121085mr922515085a.36.1782466626415;
        Fri, 26 Jun 2026 02:37:06 -0700 (PDT)
X-Received: by 2002:a05:620a:4487:b0:925:c160:f3a with SMTP id af79cd13be357-9293c121085mr922511685a.36.1782466625922;
        Fri, 26 Jun 2026 02:37:05 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:d8a4:9330:ebc2:b0c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926c291489sm33184815e9.2.2026.06.26.02.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 02:37:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Yuanjie Yang <quic_yuanjiey@quicinc.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: qcom: Avoid assigning unused private context in test cases
Date: Fri, 26 Jun 2026 11:37:01 +0200
Message-ID: <178246661653.12158.12258173453647424909.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260610-tlmm_test_changes-v2-1-f34536da4717@oss.qualcomm.com>
References: <20260610-tlmm_test_changes-v2-1-f34536da4717@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=API5kwXb c=1 sm=1 tr=0 ts=6a3e4843 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=BzM4oFbjeYHbzq8qZPgA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA3NiBTYWx0ZWRfXzIawkvgydYEG
 L7hc+HuevA+/LerJYP5gwz7fHZiNNPqTo5RKTzwQ5pevRYTNuFr596PWaBpEPBAwb2gZdBQDAmQ
 GcWQmy4sMa+t986VCyK+iAHBOoeBkdHVMvtgzFeHPd4D5PO/au5z2PjeriCCYDb1hVa6NXcN/TJ
 f7mfEMfefh2qaEMvIALhhJwtnf2SKZK9WlE4a51Zcbqr7blb9TtGKqUY3ti2pN+KAV7A4RGW5xx
 Ia/m6yu8WKNEWZUQq04cxeKbK40q9nN2VTAfT3T9cc2EwJJcyWdoPScWi/9541a0zgyXF6TpF1c
 86r4yRWmG0OnR8+j8XfmH+cBM14UepanMLdDJpXkNwVIwJPEbwbJ0u4W59/fIZiyD/BWXonh5B4
 xFu+g3jSK6C1lh862YB1HqxQ5sNwE7pFq8GQbV9U8QejwpuE+uQ1UhOhbakw+zpq8u8asgoSz1o
 CvuxuQzs4lMWb4aKi6w==
X-Proofpoint-ORIG-GUID: Mm3gsMsqxUvht6kkGBzK9IL1lwAsRxIT
X-Proofpoint-GUID: Mm3gsMsqxUvht6kkGBzK9IL1lwAsRxIT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA3NiBTYWx0ZWRfX+8dltAb2nwP5
 zXnSzw3frkhRXFYR0iRbldHr9oaVvsTaE+hIN1EyZNyt4+3HvO/1ye52qL/nm4VDQVRr53FYHxE
 sMbxYq+TSoBi8xKmcFTwnqZ4WdRySlg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260076
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39024-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:linusw@kernel.org,m:quic_yuanjiey@quicinc.com,m:sneh.mankad@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9E4D16CBBE7


On Wed, 10 Jun 2026 11:46:58 +0530, Sneh Mankad wrote:
> tlmm_test_rising_while_disabled() sets thread_op_remain to 10, but this
> variable is only used by the threaded IRQ handler to control the number
> of GPIO pin toggles. Since tlmm_test_rising_while_disabled() does not
> register a threaded IRQ handler, the assignment is never used.
> 
> Similarly, tlmm_test_high() and tlmm_test_low() set intr_op_remain to 9,
> but the variable is used to denote the IRQ handler the number of times
> GPIO signal has to be toggled from the hard IRQ handler.
> 
> [...]

Applied, thanks!

[1/1] pinctrl: qcom: Avoid assigning unused private context in test cases
      https://git.kernel.org/brgl/c/62a3aa000055efcc86483e8953775943513fe44d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

