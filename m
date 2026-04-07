Return-Path: <linux-gpio+bounces-34795-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GN9J9D91GnOzQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34795-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:51:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC3D3AEA78
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:51:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 247283003426
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 12:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB5D03B4EAD;
	Tue,  7 Apr 2026 12:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="alUurbFX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gL+6M3lz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635A73B388B
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 12:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775566286; cv=none; b=mamc7XCm0vTjgI1McU+9gGXeHIk7ujplOOMPvSGjXbEG7DLzGvN/iF+EP0LYvuNYYWsdsT05aypQO5WbhxoXc7mZo59j1ueYopW38Ph8nJODQYAojh1rOtfYm2P+inKWVeFQbCgUZ/xgNzFdXHrdeCsqDr/zFC62tbq9DiwIhDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775566286; c=relaxed/simple;
	bh=jWFvO3ds6WHSS03qLpBAv4z5ZvC4ZA1I1mbNefa7oVw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZQCpSXErG64+ZpIpIIUxRhAmIvx3Y9Qbl8cDu4TFlWZ0KUcc6Bv3rrxajk1Ow1Xpd55Q0evj4lEUlhCF/sEMYVj+Cx/38SxnzMU115vdAGowN1QX91b7C2JBW+5leiBvYg+Hr9QjXKGKjMURqk16FPBYgi78GjwlgiovASeYboQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=alUurbFX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gL+6M3lz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376vP2a4008704
	for <linux-gpio@vger.kernel.org>; Tue, 7 Apr 2026 12:51:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8m//UG8A5NdRA9BYkeLWw34DCeWGvFzzfjjmI6jBX2Q=; b=alUurbFXlUDvMj8i
	f9lK1uasv4kb8kbBpPQUy4wpcwWxDe5sqN2S1fASV4X/K6re9TqKvYNwuU5MVsHp
	krGHC7DYT6aT/yVFwm0X5caG07gTgHynIuddhM3AEjwP3zgYuvVmlqRx08ssVfdZ
	ghYYer6UxAguawtWVIHppxlITu65nbWgcqndO/Jf1VPg3UCAYBY0Vubs7r771kDe
	d/1iAdiis5czDyjZe5LJRzuOEQhhKyqXZ6mSSyP5tjK/KEWStu4aL/5ljN7k0zpZ
	jAwq5bupS3VwLzlvsB+9xtobpTCpDD5V0jOmIN16+QAtj9cUaPPGdThl4UyAG59z
	Eqbr2w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrktqbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 12:51:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d831e8083so44341861cf.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 05:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775566284; x=1776171084; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8m//UG8A5NdRA9BYkeLWw34DCeWGvFzzfjjmI6jBX2Q=;
        b=gL+6M3lzOOTLPzBQZ63XMtau+Ke2BOK9Xk78iOFh0ZBS3hJAoHw2jjYe4aBOoH4oK+
         7nTdyicpr8U+dWJFigOs220cDs7K0BvPVG1miIqje/fvoyY01xzjRkj7pYEzQ3mGwLyP
         soti77syT6TH9GYlgV45c5Lf8N1b+t9uHpNrFYvZ5AeYfzrrH/+QDMmkmPlxi9g2JnNH
         PjCVROfsskQpcrj45S2fbJz+XMqhzMEJ884yPr67z59sXFkatib42SvjEaWDkkuQw59o
         6Gz+mwugZqaMYwsDVzKGOYeZ/TzOVXZ3FPR7sfDvw29HpYR7HzeFwGOuFjx8qLgTHP3v
         l/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775566284; x=1776171084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8m//UG8A5NdRA9BYkeLWw34DCeWGvFzzfjjmI6jBX2Q=;
        b=SjIr82OtojwiIQJIMz+RM/uonKPWnUcJPAV2gWDWSQJgCr9AQt6/PZnmgM5mPoy43f
         5USRhWjJFgbWLw/PDxtTIW37XQYI6qcYMfbvTb522191P+TDiJxwPMF06LW3AfhGX5jz
         Lxgeaazd+YLWpfoxuiJ/vPxg4EPiQ8ZdoeGlho2mVsQFGqZTTdwiB6YfUIE4+jxywKix
         5l9/YLsqSbFQryC1cTw7XfbTzwskLbN6mYuAeKcoTDNSXQvqWitbOrONNyqXtvxMq9eK
         A1/rrYfr8leKry6rn+AHEvKnkIA/OeHMZaZrkomiKZh/fEBCanAGiwJ2KKyxgkOTFPgh
         COoA==
X-Gm-Message-State: AOJu0YyHirZmTqfWowujD2Bh1+0ldr1pvGDmvPzkzOcJHAba3pdX5lHX
	pp59A5KLIGx9W4ex2xu0YayYxhhxRrjG92dSE8SlMwQ3E+2xOKwvmdElHmV+sBKa9Kank2nPgLR
	aby4tTx+6yZnUPCNupLGTs6770hqTJUAc79NfmAAHReTfWHIpySdpb99SNt+VSr/o
X-Gm-Gg: AeBDieto3K7RQTSdROr5W5+ozZRowztipQdE4yV1tm5l2xt08Khw/1LZmVQMhUlSKRB
	zgYZDF2Y+P16qetx2dkdMT27edExh/hHCjzUHr6AVkPwuELFmbbn9PV7I5RFm87/hkYeUkIPL7C
	vlWplYE5UCFV7bMtpY0WVGCIK+FtVBQL1zHU2kpcrVUyHUCIUIxKf0SmoShibhzJM8do/2EyuRb
	8+vVQfIthBwt0WmGkA/+7M+Txbcnwe4QnYfpJBE+ur0hYSGW1HNy85FBnVCTFkPI0Nl64jdQGHR
	ltxuzIApl89NUi8i4ehz+LfirUWUsGgbTtvPpfIiJmX7SXd6UE98XtgvI/77VQB3hZ5wgeVZJw6
	SkR0yMjfUfj4eDlBY3EmIODZmrs2E2/IptW3GyCzSXF6xir3RBik=
X-Received: by 2002:a05:622a:3:b0:50b:2876:586 with SMTP id d75a77b69052e-50d62b51055mr253990191cf.5.1775566283867;
        Tue, 07 Apr 2026 05:51:23 -0700 (PDT)
X-Received: by 2002:a05:622a:3:b0:50b:2876:586 with SMTP id d75a77b69052e-50d62b51055mr253989781cf.5.1775566283461;
        Tue, 07 Apr 2026 05:51:23 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:b36f:5370:5f91:2d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e83682fsm577526505e9.7.2026.04.07.05.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 05:51:22 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 14:49:59 +0200
Subject: [PATCH libgpiod 08/14] tools: fix an integer overflow bug in
 parse_period()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-treewide-fixes-v1-8-66c9744a56a3@oss.qualcomm.com>
References: <20260407-treewide-fixes-v1-0-66c9744a56a3@oss.qualcomm.com>
In-Reply-To: <20260407-treewide-fixes-v1-0-66c9744a56a3@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Kent Gibson <warthog618@gmail.com>, 4fqr <4fqr@proton.me>,
        Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=924;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=jWFvO3ds6WHSS03qLpBAv4z5ZvC4ZA1I1mbNefa7oVw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp1P2696xENUGxzSi6Q1i569OUQvcdnjodF+5uO
 6+dQaGrNRCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCadT9ugAKCRAFnS7L/zaE
 w9kvD/9gzv64O2Hfvky2D5MkBqhS3rIM/1giG8XBRVwi8CAFYuh0b4isDESreArhTadsKaxpE4p
 VkuSoVZKD73474nDCx4Whpy7Hnx3LvKElbKa1zjq3+vOApOPC95/6WaN5VYwz3OuSJOXaRD+hZP
 WJn0w98Ms4DeNtSrFTrFB+oTLUF0b89WY7HlkpLy0xnpC/fLngoOG127o8cVhhGhh+d10cQqvr1
 mTbpMXway9l0UbZ9P3090Lj1rG0vMZTw1ElK6w2w+fa5IVV+/qp85OFjelog2CwLeR9mTonfA9g
 RXp2r/581Cnr7k7Xcx+nF2Y1Cy7fpvu+yi4JeMJH8Vxvud3d4WuQTLyZm9UX1WS/+6o0yTZJFAs
 2kJzNlfLZFPXaCwkiQienpIEGpTFl6nuQsR/DZtjd0OrBFXy4ACt2DoyAJ/KsqtblIPuSMfovko
 9Fxt1eo4OoA9LUjliHsa0mJ93qlGcVJNObmSzcug5viBRnCzT4OJCz7tuCI5XFj8jqoebXX+1za
 GpCgD4TvzWT5viq8aYLhHWS7BojNsPGS6RnJIHoJE8dMqlXbFfFY1x5IBF2973YvU93DyKhHO6t
 fscsdbD1S7Oc329DnLitTWWniuLYvLeQTPzUJr3Lkahx2FuHSRetQjDG8VkX24Y8pkW0sh1jgpF
 meMLsWXphCcosNA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Rrz16imK c=1 sm=1 tr=0 ts=69d4fdcc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=OukjycU9b2i9HsgDL5QA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: hYwZb5vApyViM6Sta5E2lZmL8EYrAkEe
X-Proofpoint-GUID: hYwZb5vApyViM6Sta5E2lZmL8EYrAkEe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyMCBTYWx0ZWRfX7vSv/6FT4JL5
 S7kqqZo11N4PRjqpVQtf0AcQvm3XrMKfMZd/Inzp1DTyWg/8JLhrIOedtLN66B9r18XsVKRyZ/d
 2cnzewkX/FCqsbH20vNpGMEVbeC11rTdX91T0rMjE1k/JNlasiZCF86itMI2qTA0ZQHsqdoXFcP
 pBMd+p3wE+cYXjvZMNKxJluNKe1wd6gWU44KJahfXUnbw5JzQeWzv1mfiNp9yYkmCG5IA5j5tIC
 nt56Yfh1oI4KWvny523BMZT/mnfGOQYx80e5TRrFBIwgmeiqDXaa90iWQs3WDNwxtX/ylkjH6DF
 hbG7y1RDKRrxPlht4K7Q47HaqJQQ8iR4M1ShQJvXS1xTxjHWp8tUIcHU51qHvbXwa9MBXlzLQ5I
 UixiXhxoRXVt6vi+i814DqIOhTo3UQ1/DLboE6IIyUPKT7o9TnSvsAHGBHf0l9vGmw3uqVXaZKm
 OhCvDbCR29OetZ6v6jA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070120
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-34795-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,proton.me:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4EC3D3AEA78
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

If p * m exceeds ULLONG_MAX, the result wraps modulo 2^64. The wrapped
value may be less than LLONG_MAX, passing the guard and returning
a completely wrong period value. Check the overflow before the
multiplication.

Fixes: 8ffb6489286f ("tools: line name focussed rework")
Reported-by: 4fqr <4fqr@proton.me>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 tools/tools-common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/tools-common.c b/tools/tools-common.c
index 79950dd7cf968503548c8091bba4135b90ec821f..497c6ff0cbe3160c10903b24e98de142024a3833 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -151,9 +151,9 @@ long long parse_period(const char *option)
 		m = 1000;
 	}
 
-	p *= m;
-	if (*end != '\0' || p > LLONG_MAX)
+	if (m != 0 && p > ULLONG_MAX / m)
 		return -1;
+	p *= m;
 
 	return p;
 }

-- 
2.47.3


