Return-Path: <linux-gpio+bounces-34125-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id LVtENs3Dw2kpuAQAu9opvQ
	(envelope-from <linux-gpio+bounces-34125-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 12:15:25 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AA6323BD9
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 12:15:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F180C3038F41
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 11:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D733C8720;
	Wed, 25 Mar 2026 11:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UG4w89mZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SqU801np"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC943C3BFE
	for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 11:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436811; cv=none; b=QBSNBoYrmLAGkU6+G6HOGxg3VTjftjlQmXgirxEmpnK7AIIhRmiNj1nv4ohC962kivift3gfYhrqA0t1Hl3O622FAUW5C4u7nF1lWmKr7j9Dw/crPmwA0AE43ih4l+UEyuYE2o9hjbdOsGHFQB6cmcryamlHYW+CYNS6tIIAxAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436811; c=relaxed/simple;
	bh=+lOYzTnO906o+OM4BjFEcqsuBb9EgOPvHQcpAdhs1c8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=I3SwpngS+I7XcKNDqHj5G4C7iGBZsJyCPL2jItt3h0Etvght5us+GTficldj6dd5yGrz1tuskZFjG6gItAB5pphH6r+zPQurfu7N9+0wVfwar35Enpoh0rAsdP+A8ylVNWTlC3DofXCMdyVRHQSmAypA+mj77wGGcASQOX8bm+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UG4w89mZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SqU801np; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P7kD6a2276760
	for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 11:06:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FtunU3L/j4WL0R0kP+04qh
	aEQH5xAAZVxnxjK/pxLz0=; b=UG4w89mZGU5RYEi0bKwpg44Qw7l8a6awj71gYc
	gWrkWxlvm76n9sicZCzsYAM5odjUJ7pdCWufCKE0N/Z5YIvcy09DlFHV3THKNWBd
	yPP25jhkiA3uwxAia3mtsRX0BDiCTu9jLti+2k1HNBKGzSQXviMNO/PazxyBr/hm
	UyE1j0mmBm0Sj1w4hN6uhQT4CNU/PKLY2Ys7RrmsJL51nz4ERoN6xRk4xTARCde6
	kkTyb3dQMuflwhctIURSJS/xFCCfhsfUsqCZUBKidXg38FvLs4nlMjwXfnQgdW2o
	9rQN6sT6r80WPOZaoLf/xG8nqOUsfQUhKsbYbue8Wh0jbcNw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d40ratttc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 11:06:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b52a2d70cso158878351cf.3
        for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 04:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774436808; x=1775041608; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FtunU3L/j4WL0R0kP+04qhaEQH5xAAZVxnxjK/pxLz0=;
        b=SqU801npvp/4NqRWVEaFpSrBT4jscYO2uYv45kNWD1Ez1KfyVR5we2/mr7g7qvGXRO
         NtNfHlMwdjBmkginigTWUyhkZ4Sa+HD5pKhfw4iowsDAIx4u4JyA8FkoIwBRFD7FzuKp
         B+GSAXsDpu/xf3xzFeMS917V/pHTRD0iMxN9eP863hiupZhdH/kOVpfypqF6ftUDMFGB
         R1lajbSiDKZjKPd6hnLELuGLmczY25rNaPTQ2OE2FZS6KCsGQ6rl89zsL0bSlBDjXKyt
         gtVMz2YaH4+YU/7Dgxa86GPLhN7mJPlbGeIx3yc8h5xdELzgjiEkfuCHkB/5PEQhzS4w
         qH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774436808; x=1775041608;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FtunU3L/j4WL0R0kP+04qhaEQH5xAAZVxnxjK/pxLz0=;
        b=pYuIsGTufz7nc9tVB/NI/v/Boy4rIj9HDwanxT2fqAmXq14Oe6aANVbOPB24ubZvEX
         XsEww4DoSVxGUlurCeW0oe8VQP3qubeS0499xq9GMqiYXnp8kepctHmJ6VRXZKbgFYzn
         Pk/AIk+1M6khttsoqquAtcn3T6AQfkNme3g4HKyI1uAG+HakNITsgegskJcL3vaknkYv
         6SK4tzzUSdGcJdXXhaVcYM2y1rkHUnCLqM8jOH+dDsidx5Ao5Fbgk9hzjAyDHegRA4Wg
         1wyne5lZX4Ns8ptQZVsEe9HP0yZcyflh9LeH+qREvzZLQ7ke6C1NoY+qmjm2dZsikTJK
         X78w==
X-Gm-Message-State: AOJu0YwHtZj0oeMGkFVVBg+BVwP3RbZnYVOErt+4JUtIlBQkfisalTGR
	m6ud69jYvRT5v7Apu05G9wM8GgCaKOTIFwzAwMnICpOLOxkc5C2L8Wwf1OxQx5HqDWerbJZ5HIC
	YQb/SV+Y75Id3larYekDyZv/7OhArvPK59h2ajPOwkeGovPCWKEp+/GLX3M536Anw
X-Gm-Gg: ATEYQzyCAMJLfJ0wW/NrdtpEPfPl3nmKQoxiT74jEC8XyybXgDzDbzWzY3bqjyom5dc
	H13Ug/SoqEKPxLeKbVot7Hn1nBCxGOQ0gJ7uIEHZsr3CtC+IAU78221wH5b+Z9QNaCIK2fdNrkv
	C4uz4E39DLxYH6wiYCxGRR6x4fL2i0Pm+3L7UAyGx6xDe+/cDY9Svyq9i4dSGfljM9eFj+Z42Bm
	qMnI6ihdGTBvgD7Yb/vgLWrg8z3i94YxQ/lyQg18+Hmk/1k9ioNaxh1U3kmSIEjeGvDbQOHfXBI
	G+x2DTul3Lqs2Kun2b+omH0u5ghmkJJDiwphNhKla8gbGUnXzheH9IKxOfF6KNwIENR7FlyUIBc
	qZ85OUtb4L9lqKrxKYY9LY+47PyyVnJB7s64iw6PGIns+XHMDjkVr
X-Received: by 2002:ac8:5c94:0:b0:509:127d:ee06 with SMTP id d75a77b69052e-50b80e68559mr41728621cf.58.1774436808335;
        Wed, 25 Mar 2026 04:06:48 -0700 (PDT)
X-Received: by 2002:ac8:5c94:0:b0:509:127d:ee06 with SMTP id d75a77b69052e-50b80e68559mr41728021cf.58.1774436807818;
        Wed, 25 Mar 2026 04:06:47 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:7116:95af:5a1a:58c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487172f916asm26526415e9.5.2026.03.25.04.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:06:47 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 12:06:38 +0100
Subject: [PATCH] gpio: shared: shorten the critical section in
 gpiochip_setup_shared()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-gpio-shared-deadlock-v1-1-e4e7a5319e95@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAL3Bw2kC/x3MQQqAIBBA0avIrBvIiSS6SrQwnWooVBQiiO6et
 HyL/x8onIULjOqBzJcUiaFCNwrcbsPGKL4aqCXTdtTjliRi2W1mj56tP6M7cDGdIbKDcayhpin
 zKve/neb3/QCBe3DhZgAAAA==
X-Change-ID: 20260325-gpio-shared-deadlock-b63622a86ce1
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3682;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+lOYzTnO906o+OM4BjFEcqsuBb9EgOPvHQcpAdhs1c8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpw8HC/nq2GsTJFBdQw5vT9/CCE/2+H3/G6Pi3s
 XLVyhww+B2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacPBwgAKCRAFnS7L/zaE
 wwYnD/49VU8b6T2tpWjeZTcT4414CZ5GkBya2x2xRQMIIyJGE5IOk9vOi7Ve4J/IXjJa6jY8PkN
 5izOrruMyHLEYFA+4c9GU7n1oyeEVYot/6Fu+zscTpqQT49GLVk0nTdzns6h25aRJLu+2IadDNN
 iLC9lDXH1zeBLlflzARUfb4D1ylNp/uqiU/T2h8wDb/OSDZO6LCEcV3ZuEPrJmZ03FpOFDf2iKn
 rCIFfOahDXP0AbKA/siLH/6lknHARYc6YqgR/ASJKt4tXRHqtfncxf+oBLWNAXdELsj7HX/8U3J
 sjKKFEz4LTd2X9hJoCpH7qz4ArRme4ycfgi+XNGWgBxXdGgLCwXC5AAxstkt/SvHd8/0Y+SMyX6
 KJerxWID7mbTyJIJDflzRTLvBDhvJU1w0F35YpeUtagv6OPPaEj8QY0K/wRwHgUSyvZXwF71Nbr
 /tF16uhHcrxZ6NIx6Lh3MPPVgDGa0TLkv0taGBJ60KCTNjAQ834qMJrKqbf11Jw+1op9b7aYmgo
 9tAdUFS425zmLdqj0i10eyYCS5EoeEecGMYjvW5tu2OMsTbYiI2KbU4899OwSfXFD4P+pqMni2Z
 FF6y4ElMmZd2IuFKoTNKpFDzFfHzhl9SEYtMGbO5wRRBWqWBbm6Iq+gfScZ3buYmDrw0AH/76xM
 GF9GgH2cSY1sNng==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Jvr8bc4C c=1 sm=1 tr=0 ts=69c3c1c9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=yl17Z3i23zXCwgwor4gA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: ORJrO6J1M7MmkVJVTtnyGMINsKaHn-4Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3OSBTYWx0ZWRfX9kFQqDBqnmr5
 ev/5XqCzFiHZemOy75FcsYtpsFydbkfAlYUgYo8x74crr/8ZG97GtuL0ETHFjzEw/i7CQLPnmyQ
 jWCJnWHhXAobnC4TxLLAdlEy6lF+eeR+GBmNbZSlbrIryjtuwH2pqsa4uWAXGD41VlGxAoR+Flp
 1dYMmxj/y0/0vsmbovy9L4Vf68ParRvUk0fBOHH4kO1AKWYYgk46W/8vbYJcZvxFEcRMvwAaK9U
 y3a9Rtzv+RhO0R7I3NlDTVftsRvgzvqB/4UNrLHg/p407h4ya0lfZFautjAqCS7qKW0wW1TZ6qE
 gF+bBHsedujFOYtrvEgXyv2QaJYpOTmft9jT8LmJ/5VOPE/p/NAKwJBEOg2PMl20vOzczMTlORR
 dN2nRtisOj6YTVDt9jgV5vhgccxmwsBnXx9ijWynqaKcgt/5W0By7ZWbDNX6OHyle1uR36Z/ZCu
 xoUOWM7vyUL0tODjDYQ==
X-Proofpoint-GUID: ORJrO6J1M7MmkVJVTtnyGMINsKaHn-4Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250079
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gpiospec.np:url];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34125-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 06AA6323BD9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit 710abda58055 ("gpio: shared: call gpio_chip::of_xlate() if set")
introduced a critical section around the adjustmenet of entry->offset.
However this may cause a deadlock if we create the auxiliary shared
proxy devices with this lock taken. We only need to protect
entry->offset while it's read/written so shorten the critical section
and release the lock before creating the proxy device as the field in
question is no longer accessed at this point.

Fixes: 710abda58055 ("gpio: shared: call gpio_chip::of_xlate() if set")
Reported-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 56 +++++++++++++++++++++----------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index e257212fa5e3df249de0d06eebdb2165ae734ebc..e02d6b93a4ab42b197f0fd64e4854a303f54f140 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -533,48 +533,48 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 	 * exposing shared pins. Find them and create the proxy devices.
 	 */
 	list_for_each_entry(entry, &gpio_shared_list, list) {
-		guard(mutex)(&entry->lock);
-
 		if (!device_match_fwnode(&gdev->dev, entry->fwnode))
 			continue;
 
 		if (list_count_nodes(&entry->refs) <= 1)
 			continue;
 
+		scoped_guard(mutex, &entry->lock) {
 #if IS_ENABLED(CONFIG_OF)
-		if (is_of_node(entry->fwnode) && gc->of_xlate) {
-			/*
-			 * This is the earliest that we can tranlate the
-			 * devicetree offset to the chip offset.
-			 */
-			struct of_phandle_args gpiospec = { };
+			if (is_of_node(entry->fwnode) && gc->of_xlate) {
+				/*
+				 * This is the earliest that we can tranlate the
+				 * devicetree offset to the chip offset.
+				 */
+				struct of_phandle_args gpiospec = { };
 
-			gpiospec.np = to_of_node(entry->fwnode);
-			gpiospec.args_count = 2;
-			gpiospec.args[0] = entry->offset;
+				gpiospec.np = to_of_node(entry->fwnode);
+				gpiospec.args_count = 2;
+				gpiospec.args[0] = entry->offset;
 
-			ret = gc->of_xlate(gc, &gpiospec, NULL);
-			if (ret < 0)
-				return ret;
+				ret = gc->of_xlate(gc, &gpiospec, NULL);
+				if (ret < 0)
+					return ret;
 
-			entry->offset = ret;
-		}
+				entry->offset = ret;
+			}
 #endif /* CONFIG_OF */
 
-		desc = &gdev->descs[entry->offset];
+			desc = &gdev->descs[entry->offset];
 
-		__set_bit(GPIOD_FLAG_SHARED, &desc->flags);
-		/*
-		 * Shared GPIOs are not requested via the normal path. Make
-		 * them inaccessible to anyone even before we register the
-		 * chip.
-		 */
-		ret = gpiod_request_commit(desc, "shared");
-		if (ret)
-			return ret;
+			__set_bit(GPIOD_FLAG_SHARED, &desc->flags);
+			/*
+			 * Shared GPIOs are not requested via the normal path. Make
+			 * them inaccessible to anyone even before we register the
+			 * chip.
+			 */
+			ret = gpiod_request_commit(desc, "shared");
+			if (ret)
+				return ret;
 
-		pr_debug("GPIO %u owned by %s is shared by multiple consumers\n",
-			 entry->offset, gpio_device_get_label(gdev));
+			pr_debug("GPIO %u owned by %s is shared by multiple consumers\n",
+				 entry->offset, gpio_device_get_label(gdev));
+		}
 
 		list_for_each_entry(ref, &entry->refs, list) {
 			pr_debug("Setting up a shared GPIO entry for %s (con_id: '%s')\n",

---
base-commit: 85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
change-id: 20260325-gpio-shared-deadlock-b63622a86ce1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


