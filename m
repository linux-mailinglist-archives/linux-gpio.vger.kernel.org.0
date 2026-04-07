Return-Path: <linux-gpio+bounces-34797-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4M5tGgH+1GnOzQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34797-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:52:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BFF3AEAE3
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:52:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DAD0530131DA
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 12:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B426A3B52E6;
	Tue,  7 Apr 2026 12:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KXyQg6Xa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AvIJvjg5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8013B388B
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 12:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775566289; cv=none; b=NVZ0tmSHsWBzqcVv6fKMouVlo+81S8uSKvuo9c8n2oYqXHxqPNb57VpQohpNuyYXjaTMHOetnWKlb6vmsqtAuxhTnaC6eJ2RrBFNRG/nGZ//Bs+JJhdzQtrWjtlRjkK1cFtzSBfWmeuMxhEwT8PmLzCN12qKyUIZdXbNjND5N6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775566289; c=relaxed/simple;
	bh=9d8OJqrSxYYIv/u1nBzR6PZ16gmQ1358LukXBIx6lqQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=psGiLCT9nFApRiSNfnWWKDHupvdjpUVpCkd/EQDR5U8/HoN9+xRn8NW0QLvNAmGVuHj9fMZ+ozWe9dmTMXZF1Uit1rsAMnotF3wriAALH9hHzJuhaUfrvJ3NKtoB2eIgtAv/Pkw6Du33+zq/d0F9LjBmSAM4Bp08//y6njm5TtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KXyQg6Xa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AvIJvjg5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637CPj0e2009319
	for <linux-gpio@vger.kernel.org>; Tue, 7 Apr 2026 12:51:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3r8sopyh31Qn+L423o2n6DHRja5P2jAxiswKbmons/Q=; b=KXyQg6Xahl37b8X8
	y7u5J6d0qmPJrMuQl9r3i03c9rUXFLajZOvghq7vCmlFbt3rIoU0rPS5sQMjVtLJ
	5m7lj+4iAKLUisTAuM8WoD6gMyEsxlYSb3OO5Mdx3HF1xv1PjZvGq04riC1J1jvC
	5ZJCTbIXJSy15w4klRymWqdTg/q6zVGqVsC5kCC8KQYww/dY9cjARa6Ay3PuPvT8
	7S/4ogjPMZ7TFtEKOcSXG5HNFajeWVcnh47Byuun8ihs6cDNbJD2zXEOVvtKrYC9
	dVokyYoRBCNiS+0n0mELFGi7eGDvNSbTn3ZMrsiAyZuSDjr1+GH8MWJ7FDv22uVC
	k4n0Zw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrrtry9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 12:51:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50da31af14cso19404241cf.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 05:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775566287; x=1776171087; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3r8sopyh31Qn+L423o2n6DHRja5P2jAxiswKbmons/Q=;
        b=AvIJvjg564NXLpByekZBVM8yMWblJRdhPDFQEBVVLFTs8yGaDGR3F2jRxuZ+LF8YWX
         B/lodcE9Uk6BuQXp7j3zb1N9lBJGPYLGSlBetZEa0JS4jeUg0U3fcwPeumctoBgf1F8d
         8qHePxr+oaMkoBp2RhuKrClZnoQ4VeMZv5zBdPpoAFyg1PZrEjNaQdLd/KTEDKd8TKnm
         tFEqICSp0k0HwhVeeEsLwGm8TkX7qJHhme9oqiDQ8nxvBbMPa4UKXgpK9D8QC8Kc3RDc
         KRgTxIQ2ZGb1b5ETeegJtNXzqD118jU2IJXSHGyJI5M0pJiKWxgK6Q6ASK+OwqSd54JM
         eevw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775566287; x=1776171087;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3r8sopyh31Qn+L423o2n6DHRja5P2jAxiswKbmons/Q=;
        b=eK4Hl51qrODGBJWBU/kvNV9oo5WE0DJz2y9yUkTeDEz6dVitU9VhGVXdIkeOaxM0gZ
         yh7mOBMi77aHv5AkSDuZNBYcFYbUhfpgDjyKT1BkU4V253NTp0j3W2TzbVcnqab6d8WM
         wwnpG9baT7T/VekQNba/v5lq6qixAfUQoJ2LwyYe5IdAiFeXu8B0IAN5zzL89V8DHlO6
         PJ6i2fMF8kKbxgizXr4iDgUyve+W53MklKugot+VqdeZL0jZYW2U66apJgAlLEGnOHLe
         S6IccQG0P334id7cz79w3OvL7mQXUgVgJmOVhOiyHy5/odukXEPCrbuHra/2Dt2QEGED
         uqvg==
X-Gm-Message-State: AOJu0Yzl3UGXDX7CYz5zmMI8sabpJfH1+2z+QJ0TrULI6+tTIS92UZaI
	g9VVQYZXsFhOZ1EZPNBzWzxEn6jpaCYEzJlurmSKoBobwyfgENeoMQhWLVCMNHOgch08btRxEL+
	m9Q5EB1+Rel+K+T63VShcxwrchqnKbzmfvZiCetBIG2SgX2fQAxTU25bbhYHwIL8UBH22mWI1
X-Gm-Gg: AeBDieuQ1yiNHN8Qav4Cm965AwCWX2EnAivhNwzdgEW4ynhVTx1OTrBHs7S5ZKDRlyK
	N3CRAKE+4pCieEuAuNOgZY5H5eUKbJVcZwsTcYDWHG25tchA0zlVNEeHH/KalfMPcuFNOdEmOlQ
	SbBWfN+pSlRXAmVLeVGJ7ML8zHu9AsJ2VDG84dzjx6SKDihyhWXM4KWEFHQevMI+5h+wk/KrayV
	/lak3E31/GM+OjBJzWnPvEQWM4Qrdfvb+Q0ipl9qrdkBfP57VGIKNbnwaFz7DUh5BHvJvDKswXi
	gCl6s1I37OQP91BO1OgnR0X+Y3uibNfFLhz32OX28fdatpKWX30zu7/bm2tlzSla372sdh5K0U2
	j3IhIHkRQ3rMbaU399majInPzE2D6vPJHl0YfceixCQwXo6fo3Z8=
X-Received: by 2002:a05:622a:14cc:b0:50d:aae1:7070 with SMTP id d75a77b69052e-50daba8350amr10737271cf.48.1775566286744;
        Tue, 07 Apr 2026 05:51:26 -0700 (PDT)
X-Received: by 2002:a05:622a:14cc:b0:50d:aae1:7070 with SMTP id d75a77b69052e-50daba8350amr10736881cf.48.1775566286288;
        Tue, 07 Apr 2026 05:51:26 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:b36f:5370:5f91:2d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e83682fsm577526505e9.7.2026.04.07.05.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 05:51:25 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 14:50:01 +0200
Subject: [PATCH libgpiod 10/14] tools: gpionotify: add the missing return
 value check for calloc()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-treewide-fixes-v1-10-66c9744a56a3@oss.qualcomm.com>
References: <20260407-treewide-fixes-v1-0-66c9744a56a3@oss.qualcomm.com>
In-Reply-To: <20260407-treewide-fixes-v1-0-66c9744a56a3@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Kent Gibson <warthog618@gmail.com>, 4fqr <4fqr@proton.me>,
        Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=861;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9d8OJqrSxYYIv/u1nBzR6PZ16gmQ1358LukXBIx6lqQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp1P28dkYxYzDc06g8/45xsog6X522Ni//Ys1Pi
 SxhqtsBksuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCadT9vAAKCRAFnS7L/zaE
 w73AD/9uaqSo3X/WZ9Id4LejUzuIjAxl0e6hrw8lWHKVC4eUBpfmh9MI5F8kmx6NnwT4UpFvdDg
 xhrdLXzVtH0T8eIeR0Uwb7zxCXbC2HAx5+hQMwdqyYONXauFOytqBIDto8e6HJCH9EaSqkDtH2I
 HEQXnqpLBsjq9NR7+LDDMk5lStqxn86siLeOurKcLSpBAyxdAFehZUnobEqVaWNY1cXjSVyc1W+
 tGroeMVd0+zkirOaW6xBdI2Uz/bW18HB73Wd1Lp6PoaJrhe7GBi0C7UsQDbQ3sCkgWBQzdiqDtd
 kqQTOvkcY5Mn7xoGzpQMBLo4n1sOA1FGwhMt1vXhBUACB8JLawSv+5WaVeYG0FlXITNzbL79ahX
 apP4ZILdkvPePv2/Pu+vgcIMiEKNyCd70Xs7CAcNCoJNZVjZgG/uNRCD8h6C97iwYjyL5VgEqJm
 VfQ0sSQLMSvpFkwyB4radgZIE5NHo3Pz2Ul+8YOx5MzzL7m/1jyMm3LKHJB11/Fmo3sgRrnRg7T
 OVfBnwLRyoqamaF6QXM8LPLjAoDlYJlJFEP/5IIl3jtOBuewRWOzbj+722DAnIWBTGMkoaVkFVe
 tE3A1CldCYeYcTCWEBO+tOSqh9U4QC0E/tFJo0x6Z7ChL82j4agNFikWWVG6PrwTeBM1sDsHm02
 c3QbTfU3kZRgdtA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyMCBTYWx0ZWRfXyCKf/ifQGTRd
 dnKH6dfLRzC2f9xqisMYNDZl/DxBj3S5C9W1Euu+CAkZ9hmqSjGYvyfxwj4eArBeu71cTwA4lpU
 KLgKNP/5HA8RqIJwunssQp2tZUX4amvHOH3+8lnre9A5kG0jEo5i9BZNMfPA/7K/Lq6A+wonr2c
 r6QXp+uyWiVjIYYxuMN2rKLKj2MQn36VIEGiDnzw/axKxhL+AJQUy4PVkfpqLxTpSKvVX0i3gg9
 gDK7hb+4I3VP+8MYcSkfbmQ6ZR/hMbWZnQIg16IyzpnkXV3l/Zy7LXuCwdzBhjBjkR/YI5xtI9Y
 jJqOrzGXyvo9iaHDznCFSu/2llzE1u7OVLZhf0S/TDHoD+ZRRpLE4GvvWmFSIaGhTKBRelamPY0
 TQMzM4FRvhexJ/ob6/Wq3UKFGtB42PJkRuUZJ+bfGoe29s14FM/k1voILVyRUg1953yXbby9oGZ
 7XnNOYJ9k9zg/WAvPMw==
X-Proofpoint-GUID: yT9j15XTgWMtwMS8WKVT-Wa4zjiHAFcl
X-Proofpoint-ORIG-GUID: yT9j15XTgWMtwMS8WKVT-Wa4zjiHAFcl
X-Authority-Analysis: v=2.4 cv=LquiDHdc c=1 sm=1 tr=0 ts=69d4fdcf cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=_4KU4tQvaJJiIwEE_TAA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070120
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-34797-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B8BFF3AEAE3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

We're checking the return value of calloc() for pollfds but not for
chips. Add the missing check.

Fixes: 5f194b001ae6 ("tools: add gpionotify")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 tools/gpionotify.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/gpionotify.c b/tools/gpionotify.c
index b8759573db711e4cf449c8ccc9f43d2b4c7785ae..c8c835dc970c5bd0d2eb1836470f6f6bfc2edcd2 100644
--- a/tools/gpionotify.c
+++ b/tools/gpionotify.c
@@ -396,7 +396,7 @@ int main(int argc, char **argv)
 	validate_resolution(resolver, cfg.chip_id);
 	chips = calloc(resolver->num_chips, sizeof(*chips));
 	pollfds = calloc(resolver->num_chips, sizeof(*pollfds));
-	if (!pollfds)
+	if (!pollfds || !chips)
 		die("out of memory");
 
 	for (i = 0; i < resolver->num_chips; i++) {

-- 
2.47.3


