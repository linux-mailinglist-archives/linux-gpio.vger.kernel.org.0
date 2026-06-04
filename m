Return-Path: <linux-gpio+bounces-37924-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fe96FNYuIWoHAQEAu9opvQ
	(envelope-from <linux-gpio+bounces-37924-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 09:52:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C39DA63DC48
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 09:52:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YXnu+OlH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=a8LzWCVW;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37924-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37924-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D4E883099643
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2026 07:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 635D03CF04E;
	Thu,  4 Jun 2026 07:48:31 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB0E37D137
	for <linux-gpio@vger.kernel.org>; Thu,  4 Jun 2026 07:48:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780559311; cv=none; b=CMp6Exq4SRfKpF5Iug6rDIRuYPHa/jEOj4w4Atj+4AjW+RvWw1J18OHFSJXBDxri4/o9hTjSheN2YUO1ipbchm6lsLHUPHVuWf94rHT3Ca4MgQLrF8+llRtvR3wx4F1jksE3Rk2+V1zvnzUTqzQht5lU4m53iqj8SD2mA+oichM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780559311; c=relaxed/simple;
	bh=/6RZPzN1IzaQEaCHYPiV3knFvpN239e6OylNanwTlyM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U0cRUokeXuAtW6GDF0Of9hplJ9No7G3s8R5dqfCP4jQH+qTLIiWeFbRWU0EAWaJCrjXSr1IndgDe1Ipq+hJvRYnaTfDch6mfcYaKcbXwR0V4rNE+Hv/LujC7ApN48aHoVlZLdxpZ0dQSYk9yHTjO802fBHFBhMJnp8mQCuzsXfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YXnu+OlH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a8LzWCVW; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65437kZ32368067
	for <linux-gpio@vger.kernel.org>; Thu, 4 Jun 2026 07:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hm4+OxRRlOKCiIFB3haTD1V70syL11l+4mGEqiIWzmo=; b=YXnu+OlH3YJfUbvK
	Je2MMt595N+4cvDijaCac6WCChDpIVgAv1jtAp69akHjiU2OJpdJsx8qiGBWuINT
	qWtgtqltYsDSRSJz/VUP0T6z0ip59W8tD7mUu3ECfGflh9fOuH3zr4vBFGtkbGkK
	M9CsKSflPLRa5gIJgjqwYddpAksUAITg9bg4aVehBwl+sJbs24yUaV/ULF1AYYRC
	oRCaqJe+X0NPM2LKFg55qWQa86skD8pSeDcMzRR0/5aI5+jAROcnPIchpwwaCQgc
	305wk1UbSidKhLyGIRgwIDNdQIG+2WHDDJyxdbj2/BGg87y29+dqzJeDUNO4V4Sy
	oukeyw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj3gmmcv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 07:48:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51749fb465fso9230921cf.0
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 00:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780559308; x=1781164108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hm4+OxRRlOKCiIFB3haTD1V70syL11l+4mGEqiIWzmo=;
        b=a8LzWCVWL7eWz+MFt8dNgz5fEd1NTqRvcUKJYcdhsOj7kH8H2QlPbBlrEgUD2Ia1Kk
         J8DNravA/97/idaimqQnbKZYLzeDTdDaRpVL8itfXdqGbysHWaAlNxXSyQWrgSBMBpYz
         umQa7T9zhsJ6rUnXWSzy22EhpP2nnpZ8IwacrdmpdbbCId6i3Tnw9bnWtvQT8HRkzFZi
         E33UbaSEd811eARUUgPrQsAPgM7KK2d570eEVewA2GeNGD+p/Ic/g9tzhUUcDelKzwc+
         e1wpoVSCG4ee4lz61wRcvEJ7mxf/+oQuSVfDtVOoZWZYYML8TAwTt7q67k4SOO2t54Oc
         qc8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780559308; x=1781164108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hm4+OxRRlOKCiIFB3haTD1V70syL11l+4mGEqiIWzmo=;
        b=sc/HwcVHq8fwsZGjN8hQWAuImMwe7CMjMTrWkMLvasY7C2M8Ew9CEPmQTXOLKyMEN6
         JwsavRwK8UKQvBBjtDba+jKoxMbMB4JoFlf/psFhcUc9g+I66PRvE+yIHMXsJ3frv8w/
         WWNiRfrGWhmSERMSC4krbwTtYT2mwbdA7KPbAfD12hIOT9tHSZzCx9e00kMyfG4Eieyr
         UQimfA1n+WOYRL4wTQlRKQVJdlXAop81i+5l0UPHK2m7aPUEvt0jwo2GZXQWE0v5cnAS
         xa1/y2UhySP9lA+lDc8HmmfFWsH9m7bpN/O4LXsxFxcxpslFvjpfpPNQCnAOYkCP03vh
         jjig==
X-Forwarded-Encrypted: i=1; AFNElJ/gNH2Cnr7qKdYhOWM5EsVsqsyilIExxwZiy8OZyZNP72ramFX8k0dIYDZIlUqqhEByX4x9kBsCgKwx@vger.kernel.org
X-Gm-Message-State: AOJu0YyEFtQCqR97Xd/79NbFPJpHN5tBponN9qc4S2pT2EYZZOQ627pa
	gle961bBGTnYCEiggPvKaXrQ4S365sDm2kkcoRPvhh3CHbidWfu3JVVe+bW9CUpO9Bt3DFca5ue
	3/ijIgooItbyYhewVgzqI0n31L5z+f8ou1/YUHjPJQjOj14aGIvo/OZmTj17fG/ey
X-Gm-Gg: Acq92OE62Tz9nIZfYtHi1papvuqwoAmwOT/KuooShSsV1628HLE6doyuxsoiO24Qke6
	fDOqTzViPi3VKSCKcwGFyY8JjTIayEIN0XAla5NbuJF++qQQIBuxEO/hlLNBRxW7P3vwVWTaPpm
	wolwItJpHgQVrYbH//yXesMJY2yeIopa0GtzqpDhPUpkUARyUILcYhaS2eZGjgG4ndVCyFCQjQO
	uUsS0SNd45BLPqsgDPKqHEdhEh8EbokKItnKeAGTiwpbZ2qF02lflOR3EBVsOSa/UIGuSJYmM0g
	2dUduMnkZ6oNq7viNZuFsxC4eeNXAAowBakPrntGzBffkEf7vuP5J0+GABgn43//mPjORY+/8+/
	SaBumo3GIaOzX5+xyDte9eex4vCCk9DJwe+LjojiJb/iJGVkS/2IpGwT+mB46WK9Twqt/lw9dTq
	OK+NkdSiU=
X-Received: by 2002:a05:622a:6106:b0:517:6804:1fb3 with SMTP id d75a77b69052e-51778633114mr110134791cf.18.1780559308121;
        Thu, 04 Jun 2026 00:48:28 -0700 (PDT)
X-Received: by 2002:a05:622a:6106:b0:517:6804:1fb3 with SMTP id d75a77b69052e-51778633114mr110134471cf.18.1780559307617;
        Thu, 04 Jun 2026 00:48:27 -0700 (PDT)
Received: from brgl-qcom.local (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b7d6b990sm71092725e9.2.2026.06.04.00.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 00:48:26 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 09:47:49 +0200
Subject: [PATCH libgpiod v2 06/15] bindings: cxx: fix consumer string in
 line_info stream operator
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-pre-2-3-fixes-v2-6-781bcaf47475@oss.qualcomm.com>
References: <20260604-pre-2-3-fixes-v2-0-781bcaf47475@oss.qualcomm.com>
In-Reply-To: <20260604-pre-2-3-fixes-v2-0-781bcaf47475@oss.qualcomm.com>
To: Kent Gibson <warthog618@gmail.com>, Erik Wierich <erik@riscstar.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Fazio <vfazio@xes-inc.com>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3034;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/6RZPzN1IzaQEaCHYPiV3knFvpN239e6OylNanwTlyM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqIS2wEvWr1XjKFiYHfkPyFfMw5CqC3FCfEFqVv
 CnUu10K4zSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaiEtsAAKCRAFnS7L/zaE
 w6enD/9cjd8k9iYidSMssEL9fwtlffTN9ZjPVagmPS1HdR07jcZyOR06J0SuofLK0G9gnTL+aGZ
 gknpcS0XFLv/4M33KWSJkiXci2c7mjIQTj4sIHg/g1/N8RXD3cTpWXucqV0qr0MyRYaishr1nkU
 3Zrt6THiVwkezy6yBk+5tYPrLoks2kOemFFu7+KWdn08aiKG9U6urEUp0yZ29hBPs29RC20SqYb
 qbALXW9fiu5XlWXeq6TSBVNLrLfvP0+KV/2XUO6E2Eldjd1gwuEFOXy+NsMfLx+mfmbXnFVHcB8
 1ARNjHIBIoSVDJdByNB1aSNFZJgPnG0oxBv0UgbE4lcyemknkITLwa6abNFHkhCKcXmFwvdU/QI
 4hWBctpfrHDsUpEwqyyuILL1oMsDeLcH2nS1q4CD8v617NJhKnAzeIqNP3R1u6u8OATvjqjT+Se
 CNSq81KeKL8F1W6sMIVtLtQSPR2CxUwaSycDCPhRIumMh4Y+eh8JytoJNIFw9TyZ5aJbqFTspcx
 5Pekmnf4c/wWniEqZbqXIMXvmITSGMzHEpt4Dtt4GNnfBhi4Y0wXZrIj/+0zzllaXAIgsiH8qia
 es+39pLJY9CdsslVxZMnU7lofppy/06Dp+Sgjrhk83epO49lxN21+vQdrW2ydY1N5Z3YA4lDNzD
 b7YSNCdom6IHCOg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA3NSBTYWx0ZWRfX5sqPQelkhq33
 B7oYDi+lUCybHibLwFIFT2aIVbl7y/qAj5duuNFmBbtAbeKLzqddnzGdQn7ni9WvyKoJ/rgToMG
 Z1R+8Y+OG6cBGyx0OFqV+qMk4YN5A0ync2HFazsJKwyfkRBuRrDK5g4Upy0SrvB9hD6pXLxHVk3
 +DumvqTp3LdXQhnDDxgl8RUgz0m+AR87LeYv5RHEYMk4JIzvz4+vhYhy714EfKw2Fi1Jo87Gcg/
 FWeYhqZfV+BiFA1YGSqLFy5fAMsmYvJ2AwY89nZzG/5NEtHN6sqhPfXuuDcTfNCVJsJxDEphOkq
 R4aZqQIBLgFYpLzvQMfzxD3dk1TiZGhp4E5ymbDo6WNZVPLcnZ9HExElvIraIjDiNxmmrizBN5p
 UJZq7avddfzIcukJ8Horr0dyq5Kz/beO6FfndDsO3I6YDhL8R3KDJy238symJ5r7q1cavZDIZJe
 W7mZmmbiEi7KV7NiemQ==
X-Proofpoint-GUID: OgNFrBVOjDg_9Du8CuC82Hm3tjtZE6ab
X-Proofpoint-ORIG-GUID: OgNFrBVOjDg_9Du8CuC82Hm3tjtZE6ab
X-Authority-Analysis: v=2.4 cv=UvhT8ewB c=1 sm=1 tr=0 ts=6a212dcc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=aBIYUfOEhgoR9egqXYNcqA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=3W9sBVhNAAAA:8 a=EUspDBNiAAAA:8 a=EQ7G9fe1HMCsNUibp98A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=38sOm0jhF1M2KuwyeTFR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37924-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: C39DA63DC48

The consumer field in operator<< for line_info was using info.name()
instead of info.consumer() when building the quoted consumer string.
As a result any non-empty consumer would be printed as the line name,
not the actual consumer string.

Fixes: b7ba732e6a93 ("treewide: libgpiod v2 implementation")
Assisted-by: Claude Sonnet 4.6
Acked-by: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 bindings/cxx/line-info.cpp              | 2 +-
 bindings/cxx/tests/tests-info-event.cpp | 2 +-
 bindings/cxx/tests/tests-line-info.cpp  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/bindings/cxx/line-info.cpp b/bindings/cxx/line-info.cpp
index 2117f68ccb4db6d510152e7e3fe40200fcf9fd1f..5e55a5fa8f18d698514d80f3e3891c091e5332bf 100644
--- a/bindings/cxx/line-info.cpp
+++ b/bindings/cxx/line-info.cpp
@@ -166,7 +166,7 @@ GPIOD_CXX_API ::std::ostream& operator<<(::std::ostream& out, const line_info& i
 	::std::string name, consumer;
 
 	name = info.name().empty() ? "unnamed" : ::std::string("'") + info.name() + "'";
-	consumer = info.consumer().empty() ? "unused" : ::std::string("'") + info.name() + "'";
+	consumer = info.consumer().empty() ? "unused" : ::std::string("'") + info.consumer() + "'";
 
 	out << "gpiod::line_info(offset=" << info.offset() <<
 	       ", name=" << name <<
diff --git a/bindings/cxx/tests/tests-info-event.cpp b/bindings/cxx/tests/tests-info-event.cpp
index f7ae309c24981d74202de3a98d297371438f7717..b4054ec08a51debd3ad4d4cbf316555ea059f487 100644
--- a/bindings/cxx/tests/tests-info-event.cpp
+++ b/bindings/cxx/tests/tests-info-event.cpp
@@ -215,7 +215,7 @@ TEST_CASE("info_event stream insertion operator works", "[info-event][line-info]
 	buf << event;
 
 	expected << "gpiod::info_event\\(event_type='LINE_REQUESTED', timestamp=[1-9][0-9]+, " <<
-		    "line_info=gpiod::line_info\\(offset=0, name=unnamed, used=true, consumer='', " <<
+		    "line_info=gpiod::line_info\\(offset=0, name=unnamed, used=true, consumer='\\?', " <<
 		    "direction=INPUT, active_low=false, bias=UNKNOWN, drive=PUSH_PULL, " <<
 		    "edge_detection=NONE, event_clock=MONOTONIC, debounced=false\\)\\)";
 
diff --git a/bindings/cxx/tests/tests-line-info.cpp b/bindings/cxx/tests/tests-line-info.cpp
index 8589da3c6e22adc80208a206898e40b5b5fdedb0..ff8415cf6c6c9a6aad4310096be2b58fc2323843 100644
--- a/bindings/cxx/tests/tests-line-info.cpp
+++ b/bindings/cxx/tests/tests-line-info.cpp
@@ -147,7 +147,7 @@ TEST_CASE("line_info stream insertion operator works")
 	auto info = chip.get_line_info(0);
 
 	REQUIRE_THAT(info, stringify_matcher<::gpiod::line_info>(
-		"gpiod::line_info(offset=0, name='foo', used=true, consumer='foo', direction=OUTPUT, "
+		"gpiod::line_info(offset=0, name='foo', used=true, consumer='hogger', direction=OUTPUT, "
 		"active_low=false, bias=UNKNOWN, drive=PUSH_PULL, edge_detection=NONE, event_clock=MONOTONIC, debounced=false)"));
 }
 

-- 
2.47.3


