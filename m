Return-Path: <linux-gpio+bounces-35086-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4B8WHCDg3GnrXgkAu9opvQ
	(envelope-from <linux-gpio+bounces-35086-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 14:22:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D59DC3EBDAF
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 14:22:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D59B300A12B
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 12:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB86F3C3C19;
	Mon, 13 Apr 2026 12:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bmsNJqHi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cJ33NCZc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662223C3C02
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 12:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776082971; cv=none; b=bhO4mIO2++X6gU4L39n4RPZwFjZICnVHq9IPjEA0AoXQh8ovsBgaG6hEQrIGwGthFjq/oi68lfzb2fVo/rvvdLVP5Czlz6OhV6lJpa+YCQMdg9cSKK+IRrh3dji+mv2AJdDrk2YZS/GtaSlLGgnkv68r4AeDAUDC/pAMAXLHbDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776082971; c=relaxed/simple;
	bh=3UqR7swdMvCcPHTT39/aAXx6UV8Z4Xgc3WBV8HE31ig=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eYTn7khOT+juM5XEdYRwvODrQA196A4qQQC28QdqD1OWlX+HwmFiqlK53t00cjD+ssSIKhGckTbN0fxg4t0/tlbnx+IsyUFieM8SOXLfaYoChJFWo/ShgSdBQbFovzRypItlsUVds4+o4FQTzTLNedFdPep72OraoAJ0FmpB7E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bmsNJqHi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cJ33NCZc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D7XFxw2811968
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 12:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=XTAror31TtggiM0Bv1Rl5s0N8dZaL64hH/7
	kH3+cR98=; b=bmsNJqHiDZP6bcBr9mh43mnco/kvVy56lj7nQxz/Z3EoGZXeCBR
	HoCF2tEtu4I31yHUnOQ4gBKeRpW8ZDcF+QY17MUQM6OiAm16YcTPQfEO2WzCE5Ya
	B0j6hjbSRUmT9v75jMw5L4uF99r6KUGeZiFrpBX0ddwp38f80MfIHwD7flf3JDGC
	UU8DsUh7AEBrlsgPgs+VKgwvITJLAQC15ebt1HJIP/UBDS/pwBEvIfDtrH3LcDYD
	lPbz7KAdANECn9SDMoPASUr9KX6busTBjcXLC2WvOcYTyeWI545fvc4TqeWz3ESM
	LXWYOdsNojkivhCjeAF7ldKZyz4np5HNSOg==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffk6n7tk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 12:22:49 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7af89eabe49so60440857b3.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 05:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776082969; x=1776687769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XTAror31TtggiM0Bv1Rl5s0N8dZaL64hH/7kH3+cR98=;
        b=cJ33NCZcCnkTrtR46e+e+cEdhiID+yrs6YckXBpySsv7Eio9KUZKJ5k8laCVQsGnKY
         Q1o2KkwALwdEDaF3yGy3xNTIS1YF/LXkZn2npXG4dtFsaIQ1WQXMEggRGOSEi/GREsju
         13Rx9vDfeqpEN1FcLZdGkPezCOT7sB0oT3hM41/iR3cc0LY1O9PvwEiGzx67sJgCpIcN
         r5ppyNcARu4+BX4no9jcWZD2yaX3Y3PiKgz5+hYGEMGrvJTPl23WiX9kdeolVn8qX3To
         AhcbxTK5n79NO2lvLR436z2Q5tNLenqRCC2+x0PEmOhDBQ39mFOlY1PJNVY4pODJh7ZA
         3nHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776082969; x=1776687769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XTAror31TtggiM0Bv1Rl5s0N8dZaL64hH/7kH3+cR98=;
        b=sCgEK3fK6maeTnIZDnPGGGH8At+FZYSk8THirqN88lNEz16WfQUH8cyjEnsl/MVWkC
         Rtksbf/JVAH6NusbHo4YwZ25E4W1ptYU94EGPWkET3Rlk7xNFZ3wII6O1vH7c81mrplF
         2qR8xb3Sm2RYqCMim45fqDed7oz88AJ8qiYL3o7RySN74GYQXB19Qc3Uc5glmCqAZpjs
         +F7WAwOjYxzE3sGbVAcWlCKpTHErGzAF4hklqKjASlCuV67BGpaWKKdN/Owd0lB/DJkJ
         FQFCfcx5VxIwCes9mKSFMgpXZ6QnZp2ebxSPYNHDHQ9N1XUH8R4BjVr10v1zPggoZr2P
         dOmA==
X-Forwarded-Encrypted: i=1; AFNElJ8oBGJfdBWjGssbNVL1r1ikf4KlHv4ibyfGHbtpXVfekoPCRuWGMdA7a41nEuYllAZoRLnHeFQeLM8c@vger.kernel.org
X-Gm-Message-State: AOJu0YyBLclSn7JQylqtKgRkHASFq2vJG4ig+JH5xG6BDnwI2qg9WIRq
	Vj4IL20RcVOiBrMQSYA4mhHpSICFAJLLXgczqDnWV+bFl3c8LXlgc0FDopHjV/oE7kDZiqlnuLV
	WWpX/fRb1NJYgbyOAHZY5SpfOg2WX8k5P5RZgallsclSGU/gjPOI8c5+h6e+JDNsY
X-Gm-Gg: AeBDietFwAr4lWdopwl+1zdDEdDWgY9dCjiapkrhREagzkbSkfiLUVuqGEFORB473Fx
	N3wYSb4XntZsP+ZqGUdfqtTTHrjuIIf7xJwfU+mEJxJYwzqbcURn6JKc6HlBWbyFnKfAyXT5CYf
	Gz/Ae4mRBqXSfVF3y8mr3SjVetFTmLAHsv2XdGfX8f60q8BNgcaghR/cReQZnIVDs9OpqnT5INM
	7q93xNUbtHS+j7ckpcRE7irms66iZtK/jo43oua5rmcqSl0KkiOBbTQPTzZrtSc/NyNtk8rlGrV
	trNfEqZe7VfGRzIF81g9DKVfZ0C8Jt+DAuBe/cySwrb8ntUUWJnXvdfdvQsto1+pzXgxp7jKvPL
	l0HhXvrZt3GVNfYbH6i1HHVEF/DZvh7M2650LktIdF/wTFrt+Yg==
X-Received: by 2002:a05:690c:6e0e:b0:7a1:6dd9:14dc with SMTP id 00721157ae682-7af6fde9b40mr143042397b3.17.1776082968588;
        Mon, 13 Apr 2026 05:22:48 -0700 (PDT)
X-Received: by 2002:a05:690c:6e0e:b0:7a1:6dd9:14dc with SMTP id 00721157ae682-7af6fde9b40mr143042057b3.17.1776082968053;
        Mon, 13 Apr 2026 05:22:48 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7af400eb1fasm50781657b3.44.2026.04.13.05.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 05:22:47 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com
Subject: [PATCH v1 0/3] pinctrl: qcom: lpass-lpi: PM clock framework cleanup and fixes
Date: Mon, 13 Apr 2026 17:52:30 +0530
Message-Id: <20260413122233.375945-1-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEyMiBTYWx0ZWRfX9Vv/ce9op1Cz
 bHt9PQMusFm42jCOghgqZWzQ14Y+YrX6tgtgQWcGlA7NotA2Y0AHukWb/M5kBL0BlYL0ARiJQyP
 OAVpoYETwwwk+/yXyk25ZefjukhQ34DchXTj+ik4p48c6Lnp99eFKCD+mhnS7lt0eDOfocNRnk2
 OJgCXV4SsditaSMd3wAX2fRRp2eJar0+YenUVL5bIPbRA2wv62FX6Z4KEMPKaXb/wOW/DbYVZJF
 khyhpGcCgd+eWJWxy54c2SqrWo167nfvW6gReUEKj9wGdhqBemSKTldhUF34ZmQFDBQ61NcIkpi
 F30mZ7dk5RLQ29W5t2SZ5TsiTDUZLMkY5lyQ6Pt3KGaEBePkdYlG+XJxi8iZbeB0cIU67dmt42I
 qNcNHyUmadF6AJuWRXCLVnCTQpg04+/sySoumYlbx9E6DplYnhSHADQZWZzIo/WSjvYuVdcnpjc
 iOlvIJb+Z4xbLCnj2zA==
X-Authority-Analysis: v=2.4 cv=YM2vDxGx c=1 sm=1 tr=0 ts=69dce019 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=UNhQibLAgM_7-mQvFMwA:9
 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-GUID: 4cV8JIFjZsa4gTA8uVNuYJjc_cUnbw1X
X-Proofpoint-ORIG-GUID: 4cV8JIFjZsa4gTA8uVNuYJjc_cUnbw1X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130122
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35086-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D59DC3EBDAF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series updates the Qualcomm LPASS LPI pinctrl driver to use the
generic PM clock framework and fixes clock handling around GPIO register
access.

The changes ensure clocks are resumed before register access and
properly suspended afterward, avoiding unsafe register reads when the
device is runtime suspended.

Ajay Kumar Nandam (3):
  pinctrl: qcom: lpass-lpi: Switch to PM clock framework for runtime PM
  pinctrl: qcom: lpass-lpi: Fix GPIO register access helper return types
  pinctrl: qcom: lpass-lpi: Resume clocks for GPIO access

 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c      | 120 +++++++++++++-----
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h      |   2 +
 .../pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c   |   5 +
 3 files changed, 97 insertions(+), 30 deletions(-)


base-commit: 66672af7a095d89f082c5327f3b15bc2f93d558e
-- 
2.34.1


