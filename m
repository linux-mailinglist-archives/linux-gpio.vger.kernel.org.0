Return-Path: <linux-gpio+bounces-37369-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LDNG89pEGqgXAYAu9opvQ
	(envelope-from <linux-gpio+bounces-37369-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 16:35:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F425B63B6
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 16:35:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1D8EC314BF23
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 13:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FFD040800A;
	Fri, 22 May 2026 13:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZMQhW5hL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jZ4Y5RcN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28712407CD7
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 13:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779457350; cv=none; b=sW2FPXGFqd4eIALDuG+arXzABPO9PbSVv05abga1MbDEWRV7UvkLwSGII66jmzjXFpmpihU5auo+ylx4trzbSNhNDuYx9mYoRmk8D/l0fUICenWyIoSWX1bujrE21GHaPog6dGHJHHEkB/GiSy36uW63i6KGIqq23yYeFDEYS3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779457350; c=relaxed/simple;
	bh=GJU+HeIPDrKpMoJwTBqmdjN1+wHbQmMQ1tafJVO0q+o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pxaCKxgfPP2yJXZNgUTD/fI9O9GdmObSr8w/BQPp697jqU1AUj4AQumR1KAbujlLk8mhNBXDjk2+2WhFWzz5QfAcr1EMQhXgJFDx85ibh0KBMjEtukEdQpipKzEQOBQj8wiBPV42wfKLe80QLFhJdhl+cCN4+mVVWCoSt9OobJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZMQhW5hL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jZ4Y5RcN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MA4HNm3947594
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 13:42:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6BVsDs/rDFNbuNfHuhEQst
	hfmm4qGh0YCf3lMG5UxzA=; b=ZMQhW5hLIeKGkKZnrVEolAx9EprSDSJBO4CKRb
	MIhB1zcE5jTzQtbFBuiyS+CJIVZsvLgyirrl7J0qC7ZxGPvrAR178oPPZ/XloBa8
	u0+aZif0coNeY3Pak4PI8fpLEob2CYKiHaF59c6IjxqJNUL8gQN0O5b5S9b0GrBx
	G6G4IWDx/0Gj3PGK3iT+CHLPHK6ccKYuHPCUxrfwRSAX6Rj6t1EvlF+heO5pcIBD
	gNnWvxptvOuoI/JqeC1ngBkPIKRIvohg4BTEllFf7AldmT3CB0Kl4Q2roYyEnW/3
	jaizR7Ps8wf3KFJ5OtS+d2wPRd7o41YElQ4/FcfDURXsz5yA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ean2ngqjr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 13:42:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516d191f2ccso27180391cf.2
        for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 06:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779457346; x=1780062146; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6BVsDs/rDFNbuNfHuhEQsthfmm4qGh0YCf3lMG5UxzA=;
        b=jZ4Y5RcNdJguDG3tbHPl4hfowQec04Wo/2AfRz+5JL04VkavM+pliR4JREaoX04ez/
         GGhTTRu3wifIcLdkTAQ4uK8xKJvdEaDmYzGg0s6Rb67zQUJILKEp5ydCAUJ7zgbX5FEX
         Q6hIMreCnbNk7WuuOd5eMRJn+YFh5VcsQXl8Cc7RH+jHTTDB3oqMBRiMzOWKCSDX6e3S
         +aq4ng8ZAXscbBXG9Lo+DHC22/Y7QqRvGZmGzNekUkBijCo7h0d01dMvaZmoF7ha5JV7
         DurKm4Rv4LquTvYOX13qdO99cHxYJEpCf1NskG1IutotlzVt6QO9v2ztU3aJj4j3fMGd
         PEYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779457346; x=1780062146;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6BVsDs/rDFNbuNfHuhEQsthfmm4qGh0YCf3lMG5UxzA=;
        b=JPlqGLkfykCtlcihAH4HF79AHrsOMVjkJdDaXWcsLVhJZTxovT43xG7N1Kbg5n6XVk
         WffsLoMgmvH0E0xs/ygFoSQ/ZrS3gtJ8WosLXmn4PZF56TcO0AMfnP3F7sM1a6hFXFOc
         GuEJLrOlCyy28VBEGlITdWURuTTJ791o+q8MjJloc5HcCFBmncV9oP8aKnJFyR39H1Er
         XUUmteqMEFz1LXOZYwruD7FjyyK9bfFYIChDsngwBRvqsWDYDFfL5TTR9vM9jTiqhxpn
         Vr0YSnaFt0Apa7ebn7hTsCMsQDVgbT0SVtZ6BIv1h21/5Q+bOizns7BCEFQnS0A1dUth
         ROew==
X-Forwarded-Encrypted: i=1; AFNElJ+KMr+pu7L3FCSA7qUu1ZONz9kBYPqE/BMx2++LNu2BILLFBsZ49MWGi4Xy2zic9jIsX2utUi8dj8RA@vger.kernel.org
X-Gm-Message-State: AOJu0YzhWgxJ/rUyM9n/m0SVULDvEKkzAXSYPkxp0DoOJYSeCoMBnaf8
	SVpUjOeF0hncUqhuUIJEuuUhec/nNdxwOXmbJ3iFXeLF3P17CWTHf3l8W7DIVVjMQ7BVlQqw5gK
	l5XOI08QyU1AkC2uSDifqC7jBhFx9QySDmW5P4YeKjwgSGGiHFDs8sUZncd01iHRf67D0VbjC
X-Gm-Gg: Acq92OFxoIit9bCnOvnUlgKfhllF5OchGSHSJ6/6wCYIPDD49UhEwaw89AlBW/Q/5C7
	gF7trFpB1ySnMtsB+C776Fx/gHkuV5syhoeaK3AzyWCRnhy5Bycuc4dONnTuFVVgHTuXptyBu5R
	HqvC/J/UHoBXCZowRspeScSPrwm/fhUqNfNTzR4QcXo82P2LGbwhO0S23OCt/bZ4aTay0kOXnAC
	I5zai9k49VVLm9B2mnV0dm4Ll44VeRR44G8741PDUIAMQlnTfaqCAKZRl8qw/IiWOqVRExwcLaz
	XANWlTJ4BzgZCyE6FLktnzVXi4P+DIH7DfTnUjNTc6+IDHZfX9mtYZHX3ecNiy3fAnbpow77Y1T
	pMY7/OemQGTf4MNoJe6WA+SZZZglgpkYYJqExpDaL1CB6tru0gFcCLdf1PQHz
X-Received: by 2002:a05:622a:30b:b0:516:da7e:e0be with SMTP id d75a77b69052e-516da7ee325mr20880181cf.57.1779457346230;
        Fri, 22 May 2026 06:42:26 -0700 (PDT)
X-Received: by 2002:a05:622a:30b:b0:516:da7e:e0be with SMTP id d75a77b69052e-516da7ee325mr20879741cf.57.1779457345776;
        Fri, 22 May 2026 06:42:25 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:2fa:6280:a48f:fb37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9f548sm4886546f8f.2.2026.05.22.06.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:42:25 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 0/3] gpio: add kunit tests for GPIO core
Date: Fri, 22 May 2026 15:42:15 +0200
Message-Id: <20260522-gpiolib-kunit-v3-0-b15fe6987430@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADddEGoC/23MTQ6CMBCG4auQri2hLVRw5T2Mi9IfmAgUW2g0h
 LtbcGOIm0neSb5nQV470B5dkgU5HcCDHWKwU4JkK4ZGY1CxEc0ozxjluBnBdlDjxzzAhNXZkLo
 ocmKMQHEzOm3gtXu3e+wW/GTde+cD2b5fqSDlQQoEZ5gwoiXPucyVuVrv0+csOmn7Po0HbWCgP
 wjNjgiNiJSVqllVlkSJP8i6rh+ILNPs9gAAAA==
X-Change-ID: 20260326-gpiolib-kunit-d7f1b5541ffa
To: Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1730;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=GJU+HeIPDrKpMoJwTBqmdjN1+wHbQmMQ1tafJVO0q+o=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqEF07NEtgtg9a0iGyecnOGM2OLAg9BTY8vI63i
 5VwZXE2hDiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahBdOwAKCRAFnS7L/zaE
 w94KD/90y+wuYTqq90pcL4tuOTLdrQhZjxf1SSCtmgDScecQWuu/i4vCqkXldRHS05WAXr96AjY
 2x4WLD+sgeE+XCIXOlkXg9zDbNs5Uv1DQtqHAVyMqlwk+xGk1RsG4SRsfYOB4YCtj/lYWA/LvAM
 Uc8YnC2LxhAb29W4dY0/sSBFZ/aLt4IWLk4AWwRnCFPrKrCFzpf6c+wOFifulv6mMLsD6a4PxKk
 TLQ4EqBUz8BMifQ1wcFZE7n14qCVbH8ydJ/kEPb8Fsdn2lxRAo72b3ogCOOQnYvVLTriIg28JWo
 hbkFnP0/7gLQ7Y5xhLqapypfzLwhsLg8zK2sCPwoVQfpKE3SRlyeAJKQno5bOozb51eWvaomoQ6
 GxAi+4NtjL723OwQGSrIBCuLs5c3Tt8bgKLNg88y5PwgS0GOehQFuWdV2QJc3fVsxpskrWyhw9m
 w/5cbI/bMmHqeUo+PqNbW59N5mb0n+4uXgeivETNuZ/Q9eehrNVRCVurHG9rqwSJaN20r6ODsQY
 5LJC/YW+vioEjoAsS7W5KMUQN3266JbfEzWIonGJD6A5dgGPO4wBpOcuEfQ5drRgqc+Rhbf2GsC
 6/vWKnDh1pNJ7jL1GsV4m+QmoNJ4TyjlZppguXbH3VPtCdvOOmHOHxBr0HvdyJXyPlEaGd8uK6r
 HgEHU5nMAVjHhYA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=XvDK/1F9 c=1 sm=1 tr=0 ts=6a105d43 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=MtzmdRDdlofpVA7LM9AA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: ID0ApQU5kfgsdK36Na7UCfY42X82T3Pa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzNiBTYWx0ZWRfX8s4FkS6zJsaN
 Vkid2Q3AfJLdoISjR2FnWXhPNP25Vo/ndRv9a5sVkRIYIIUArekdag/0rEXfcRehtQcMNGYUdaE
 bzWjZhm1PH2c/G4Psupoque31gBPJf75j6XJGaygjRnGhCTAYo0O9PsKyLI379bprBQR9Ws2t+g
 ZxCRto1URhZEsOnDq61KyvLxP7mNDC1z3MJNcsr0uoObRd+O2dn1avssElgDGvaldDW21v9S6d0
 4nbKeQGNVFdG7II1w3CX+d+Kz5xKA/FxRzK1I8emBUKskUmaa6HUVnA2dGsMRKM/9J7OlUiZpEF
 SNCSdc1XAKeR7f9NMd2PBvkHqMMbOOS3h6fN5ec6idjnDJ3tYP/EjX3NbbWCIXZWsFiVCdX4zZI
 4csC84Xd75/YKTASZJ2usvuQEgHy2RKvFiy8zIldwwC8mFHr5YGTe/vbhWDm+UP3RU3t6HzNmeb
 gARuqM7QEEYY7e/7oyQ==
X-Proofpoint-ORIG-GUID: ID0ApQU5kfgsdK36Na7UCfY42X82T3Pa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220136
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37369-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux.dev,davidgow.net,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 69F425B63B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds a first batch of kunit tests for GPIO core. I intend to
gradually add more coverage for functionalities that can't really be
tested from user-space with the existing kernel selftests or libgpiod
tests.

Merging strategy: with an Ack from kunit maintainers, this can go
through the GPIO tree for v7.2.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v3:
- Make kunit_platform_device_unregister() handle both cases of platform
  devices created with kunit_platform_device_alloc() +
  kunit_platform_device_add() and kunit_platform_device_register_full()
  (sashiko)
- Link to v2: https://patch.msgid.link/20260520-gpiolib-kunit-v2-0-cc9db39881da@oss.qualcomm.com

Changes in v2:
- Remove cases of kunit killing a thread on test failure with device lock
  taken
- Fix a platform device leak on test failure
- New patch: provide kunit_platform_device_unregister()
- Link to v1: https://patch.msgid.link/20260518-gpiolib-kunit-v1-0-131ec646c4df@oss.qualcomm.com

---
Bartosz Golaszewski (3):
      kunit: provide kunit_platform_device_register_full()
      kunit: provide kunit_platform_device_unregister()
      gpio: add kunit test cases for the GPIO subsystem

 drivers/gpio/Kconfig            |   8 +
 drivers/gpio/Makefile           |   1 +
 drivers/gpio/gpiolib-kunit.c    | 358 ++++++++++++++++++++++++++++++++++++++++
 include/kunit/platform_device.h |   6 +
 lib/kunit/platform.c            |  64 +++++++
 5 files changed, 437 insertions(+)
---
base-commit: 80dd246accce631c328ea43294e53b2b2dd2aa32
change-id: 20260326-gpiolib-kunit-d7f1b5541ffa

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


