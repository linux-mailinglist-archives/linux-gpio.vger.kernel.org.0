Return-Path: <linux-gpio+bounces-35005-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6B9sCdv12GlJkAgAu9opvQ
	(envelope-from <linux-gpio+bounces-35005-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 15:06:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C29B83D7DBC
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 15:06:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D7983031E9F
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 13:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 083843112BC;
	Fri, 10 Apr 2026 13:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K0VAggTv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="azuVYomU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9982E542C
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 13:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775826307; cv=none; b=cvT9lXj8cKjSwD5PVSwtkqaXOecBDYPkIeHKU+4g1KLUxSoEpr+cNCgK/sHyUPsxXx9l+lCV3iQ6gvuzeJzcdfBbULsbbEPCPFEcQ7gJpXi447yuiJdHfIu7aayLTko3Vg2+SjXTLmjVq5RBEMxnkEvjdGKed8mbO3Do+I73zc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775826307; c=relaxed/simple;
	bh=vDjc8gfmGKQkQFut+z56nJiHddVoPx2o25I0xNC8pyg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZZ7vzfmSRDcedlqPL7AVn4oHlxfzn2kkh8VGLJHRkxePbvcbuQfBche/QW/tM3/jGfhNLuhsjAWq0eRTejRbjj6HJXe12RdPaZPoEHfDFLaRNYcU9RxsDQwKZTQjDV3/6BkxX1yxttc8dK0S17V408Kai8cPyw6gf2jTjKm7gws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K0VAggTv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=azuVYomU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63ABD9rF4147281
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 13:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PKGpOYEOt3kDvtmS3WtStq
	ecKftz6DotNJihv0NRd50=; b=K0VAggTvng9Bjs7Krsu/Hj5qU2wi1gGOJBqGOm
	EOWsnMVaG6ugA+XUngevVyd0c3+yABbD/bKvsDQYii1u9w+Qg4unoV92RmmORx67
	X8jnA5Fabn8k4bEFtUs9S4vbIjkM57ogA7ouBar5paF319V4t35y2l1F7H60GSKz
	KyQBIQN9iDRRvCfCi6PUbNCxH+FcGmF2idQeuKdQiYTMmysTK1lhQwM0vhYFM6xH
	ygO+QmkrKrhuIIfgKn1LclT8xgomXQOrE1VwW5O3xQptJ67+C17gJNBLU4Q0dFsx
	EkUL7ywjp2UWhq0t1Li8/FWMv7n4OveuLau6h0ErCbGl8q4A==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudghe70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 13:05:05 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-68826165bc9so1648867eaf.0
        for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 06:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775826304; x=1776431104; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PKGpOYEOt3kDvtmS3WtStqecKftz6DotNJihv0NRd50=;
        b=azuVYomUanXp2cmdFhB2faado9DfYu+YNZIiGMKUp9Y4EyLeWqyJjns9AidwZky54i
         gXH853cfUFuplySGoQ3wy7ennHt5bPzpxKccHBK5HDKpQI2/UE+Mi6nQr+a/ApctmdHW
         k3a73wy+u1Eb5sC7p0Qzc0NOoP4BZqK5jO4r4nbD0ghcxrYeLn6rAD3HAFmYpomiQFug
         bU/c3xNcayAX6c35zeNFq0t/ZXtj3BXKfJdq7M2BI+51pw9XUbZCD3pXdY4KCsr+mHl2
         6LIl0uqmUG082Y5IWhPc2gvlQ41HZ29sVEAK718e8+Itg1CXe5Z/eh+n8r7Y2zrd0CFP
         Qq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775826304; x=1776431104;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKGpOYEOt3kDvtmS3WtStqecKftz6DotNJihv0NRd50=;
        b=k5FVTKas7Jls//5fq9pLEn7R/86GomAzFzE8UQczRcjAJMDCoUkXB6PuFCRN3cd0k1
         r74wrSqBt0771PmXwPbYiTM7MVukdPgk+PxhGwm9ULdCqbrP0tqnzriSlVOi6JIGV315
         qvgE/z7K9NWN1ABJVrqkTLy6NdcGbL/n53w+k6uIj21YAGqnoWGHpPNBPDHhfHAneCdX
         FYbpQttrzR680cbr8frA/As866N8PrwCKuaqSbaJc5k9HnxC2W+Jc1xbfX+FDfQ4ygZW
         Lr67wjeXNIT1masa/w5vbPs5M+Ckvgbk0EU3Kal3BvfFas3+dB57lp0ql4e8/8f9cqSE
         Y0Ew==
X-Gm-Message-State: AOJu0YylL7DDn0h4ui2ztIU5cCCmFrUqrC75lwzsJg8dggL5oGGczILI
	nzLy2GU9FaweTFkSOlAGKq5LvOVVcCBxMV6TkxFVOiTy48/8ECiKj5bL6PnA+hqZ2GbszFugwwj
	oIUYFNgN87Xo+VTc1ap7Qmaliw0ZXr0FZluEVakjicandSf0iZjB8H3LTnmFsPhSN
X-Gm-Gg: AeBDieuzgl2OFCW4PRE0vK4cJdb92nrUuI8/jnrnVQxGXPxJTho4ABV1mm7QWadsLqI
	ecwV+1wFam18wYSAGVCUiFSJK8rSTTCbfSHKqFyLf5oaUSZdbNOmG4YHBdEZvdV0Sn8wjRGmB+2
	fb10a9tasQ+cRoh5X+h+cyTk3dmkPd3bzQy7r97cIaoSJr87z86W9lJQVkY1bLaHd26/jnbvbro
	TlV6I+My9HfW0LXkT4Whv/MrJTZpirsT1qgsIys+3a5KAVsqpQ9CXhApwPJ3y9lqtjmWOJFWFjj
	WNQtuV+QaqQwTVMw2pQgcN44s1hFHw1BIBV/ff/AlkIcI0biu9Fm2uSDquqzzVDbu4egRl/Wurk
	PDC8JKI70xOp1rWmtVgYr/7Dn6BtybxdLJaaad+W0RcdN
X-Received: by 2002:a05:6820:6008:b0:687:2d4e:8512 with SMTP id 006d021491bc7-68be86d04edmr832931eaf.49.1775826304338;
        Fri, 10 Apr 2026 06:05:04 -0700 (PDT)
X-Received: by 2002:a05:6820:6008:b0:687:2d4e:8512 with SMTP id 006d021491bc7-68be86d04edmr832894eaf.49.1775826303813;
        Fri, 10 Apr 2026 06:05:03 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63dec07esm7694865f8f.13.2026.04.10.06.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 06:05:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/4] pinctrl: More compile testing
Date: Fri, 10 Apr 2026 15:04:55 +0200
Message-Id: <20260410-pinctrl-testing-v1-0-6f708c855867@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHf12GkC/yXMQQqDMBBG4avIrBuYiIj2KuJC418dKVEyUQTx7
 qZ2+S3eO0kRBErv7KSAXVQWn2BfGbmp8yOMDMmUc15yYdms4l0MXxOhUfxoLGPoUNVFyUypWgM
 +cjzHpv1bt36Gi78NXdcNRSeqV3MAAAA=
X-Change-ID: 20260410-pinctrl-testing-10edae894600
To: Linus Walleij <linusw@kernel.org>,
        =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, Joel Stanley <joel@jms.id.au>,
        linux-realtek-soc@lists.infradead.org,
        James Tai <james.tai@realtek.com>,
        Yu-Chun Lin <eleanor.lin@realtek.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vDjc8gfmGKQkQFut+z56nJiHddVoPx2o25I0xNC8pyg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp2PV4TynGFLj/eYUtYaShlZW8le3GXFJG8zScl
 s03NytuS46JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadj1eAAKCRDBN2bmhouD
 13IvEACGTEmnt+40yLlzVQAlkKhO6gro2lzbOp/zQK3xju3EqgEcoaCkKYxlO3SUnvROj0YS9Zc
 cSZ1x8EjbI0bl7vuR0UaaBz5xzXK4mUVMEzatb8BpbinER/75UBVHe/4hIGVBmY7B/EN310UxQS
 jzhx8XU8OKHfFiPvhLSrv7VKrvRnvZlsUFWWGYVgNdf0mEaZDovPMaMRtq9DzSLDmEV1B+YTDR5
 uyT5fpgbRSr6GeZ9iCfOlH/sORehIiUHTdzH5M2mUl6WSGjxfgDvoSDT6+ua4PjMieLBumpu+ot
 ROa3ds4QHoab6obHagcuygOSQJNokGUTVJxh9hAcE6MarHk69vghzuNWkBv9tinT5IHRMo+XcG2
 Hg7/vqmHQHjOv+rc4ohh5Ek/eSodSv4EbgLbJUL+ml9aCF0uLzQRXW+UWNxEXU77vCG0Q0oeQpR
 g+J4k4U5V9XcM/ckVK309HSyWSULVO4L5wZDWLsgbSpoctAcF7slx0zz3WQfIJrwbhC1W5ytbpU
 ar+NY0CskxlF7OqHMWxRYPkclXqnqvmYuqEIj5aSYBRt5W78tvQBJM4mYQeca1laoaSYn8bzHKG
 Xd56WGAO/VGsSYbCCTYl3XCoM30G2j8UGUfsiPegRWluD+vRvuRTF2QB8V5HX7lywkeAUpSFQ9U
 g6+8QDMa98j76lg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: HP2KOcQGZsMd2ybbCHFrXk3_BX7wtQVl
X-Proofpoint-GUID: HP2KOcQGZsMd2ybbCHFrXk3_BX7wtQVl
X-Authority-Analysis: v=2.4 cv=H/brBeYi c=1 sm=1 tr=0 ts=69d8f581 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=X4zHBGs9HBKMUBQ9IvMA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDEyMiBTYWx0ZWRfXwyWkE1PH6LVn
 UbCrZ9vEm7br6Cd57MgzTTB7q9DakQNlg1jgfgLbgKJfjNpG4a0D6T+ZcPN6eKZtJaU4K3+uMsO
 Pg6s8XFqUmh2mIHVmB8e53/+nZ0xnuwlCW8cZGTZY79JRYGaF7WXkXXDP2MaXZBlicw43OKagnS
 RCMifmReU9bq0A1rc53VIkN+2NqwB039jJg+eZWAWYGgPo6OA0U4pwFRsU0DshGAWZRJfvBJZ/r
 RnkOQREjVxisRVngBGqWRzL8zCePny3ZGJLk1Dq8E5ma8BCXT97K2iJpMJLJxhvv91B2bTlCRyd
 uvxf8oLVUi01dHHMeRzqvriCOONAYiksyjErWm4QdGncXWhqtxe5JudP3UGxOgPy5k8hZ/QSJCS
 UG6pk/q+RBR+e/sN7Sm42xaC+yquIt3pYmVTS3VCJWFdyc026q2w353a8kWcfqZd+YZ+51Dlwbs
 NF8nBaCUwPYBcupkNAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100122
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35005-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C29B83D7DBC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Follows https://lore.kernel.org/r/20260410103005.163128-2-krzysztof.kozlowski@oss.qualcomm.com/
but should not depend on it anyhow.

More compile testing means better bot coverage. Plus having ||
COMPILE_TEST and obj-CONFIG_ARCH_FOO is kind of pointless.

I built these on arm, arm64, i386, x86_64, sparc, m68k, s390, riscv and
powerpc. Branch is pushed also to LKP, so more build tests will follow.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      pinctrl: realtek: Enable compile testing
      pinctrl: aspeed: Enable compile testing outside of ARCH_ASPEED
      pinctrl: vt8500: Enable compile testing
      ARM: realtek: MAINTAINERS: Include pin controller drivers

 MAINTAINERS                     |  1 +
 drivers/pinctrl/Makefile        |  6 +++---
 drivers/pinctrl/realtek/Kconfig | 12 ++++++------
 drivers/pinctrl/vt8500/Kconfig  | 13 +++++++------
 4 files changed, 17 insertions(+), 15 deletions(-)
---
base-commit: a53c56fc5daedea57de51c02ede0b48f055fd8b3
change-id: 20260410-pinctrl-testing-10edae894600

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


