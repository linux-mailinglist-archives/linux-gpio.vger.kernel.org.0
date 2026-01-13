Return-Path: <linux-gpio+bounces-30466-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD72D17A18
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 10:31:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AA5F73008CAA
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 09:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F15138B7B7;
	Tue, 13 Jan 2026 09:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j7I85VlR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZBLHZ/yK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05CF3815EF
	for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2026 09:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768296553; cv=none; b=fKV7hahsJdJO5XUORybl9VrG2ZCC03sGJB/FkcVVHagfbwg26LA1bHyYVTUenPp6TI46S6/xEcM/hdjhP6T86LY3LPAg6NxDm+JT937/Hmc2vlYSKm6co8UTL9gUCTn/T3jLtlacnXGRcZIVTP8DAb8w/ggSF7DplNoUbKkps4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768296553; c=relaxed/simple;
	bh=DAHAFNWZyYFAjBpbsxD4QMX4WetXqCzm0Mn/Fbnc/zw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dJgqq6iClTFaVb0Dx7IITp86mq9+/tdJ7Jd1ogoHFA5fgNzKBwse5FflYW7FuFAR5yHxP2tmnUSGM7KigfAAx5wZYUfKajTalZiswhQuxQSDH1/V9jOeKjuk32J6CfyTUDBHwJ6dbzBdL9944RXtPdD1xxyjpggw5r1HI9JYzwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j7I85VlR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZBLHZ/yK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5ncrN3735222
	for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2026 09:29:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Lx1UWyw31FhIvHxlUsfLk8uPfJMYRQgGEVO
	JTmwbuMo=; b=j7I85VlRkRqSj3w8hWI1McNksZgbhCsTg4wYvXOmiyYXnytm6Zt
	Bv8tfWOXtWc3K3A4bqa7a9d648Tas14ywJwBrLHAxthonwxGt2nt9bck1cOvljZ0
	GbK6ioO1eDICUQltXrpZOUupue5XJMNSXDJv9516aAVIbaUYakzOMOs+lyYUIA+F
	byDIxxlcS/oUFK1+rXIN6KCEvCJln+k11BWSpHhcrv/5cUU3VwEqWFdg9hGsx82+
	JdtTJ8c/97nQngq44G6u0qATA2/yCGqGR/RNExIW8rSznCuHNGGlhUle/ShkOfdB
	qdP5E1ziF8IOsNQCCTb2Mq67SzHLUFOxjzQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng878n63-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2026 09:29:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52c67f65cso13803085a.1
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2026 01:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768296548; x=1768901348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lx1UWyw31FhIvHxlUsfLk8uPfJMYRQgGEVOJTmwbuMo=;
        b=ZBLHZ/yK4Y8aTIyffifR3zSBcZfjjmS/h/qR9Uc2s2PidA7stAV3JEyn8W2zx+yeZA
         NZpcUT55PJIJ1YE4UulxUUfzV3dmIuJCqznD2eGSXWW7NevxoVxKtVG/cnCE/ykbpoP7
         mxopsYt6sp/qK5NFJJsIJBUq2Cg+VAAsTaxO+YzQ1roziI9j0P2QprWEJLBpXIxxvaYz
         u+COxZ/yFZLXtet9in9Ws28Swv/RIksCF3Nq/bfKbvUR0v3EfI8ELLYf+q1bWSUrrgk+
         M/d1tyr1Zwn7CMhBCT/kbJQuV/rkGODFH9x3qib4FMzbOolEm45Rb02ai/JVE626f46T
         YZdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768296548; x=1768901348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lx1UWyw31FhIvHxlUsfLk8uPfJMYRQgGEVOJTmwbuMo=;
        b=jTVmeIKvzu5LR6Lfi0k7ekFkZjT+zE62OjWKfOhDOFCrAvaPJhEeTaGR8jkVtoLsDp
         T0aPZ8XkITQiLtnUlTRV0gyqZJsn7frWdHmwX8c7OH/atvEMI2YXcMPAgamdeY9pC2xg
         FfA9FUdglBkithLxgr84p9E5noNw5hNpghz03nxcVrwPvP69Kfa6A0cXNbgOblpkn8MI
         /NPO1gQxSVNcGVSfOZJ/vcyKtko/A+HbypurbGzjzDrHZMe9PZ1G8FHFfo+a3rIXrbof
         gyFO2F2Y/qrh7OiKWuT0kIyzo5oqxLetiXeU4YSV8k8fjRcaR9tQmsBqH8Qk6DRlzSuY
         wuug==
X-Gm-Message-State: AOJu0Ywzk5uiFPT+c+p2l400TggumEj4T72+GBmWZjfFF6pDZqUD/M5h
	Wi6qR0ViETiNArg99UFFLYrlXBV/Lil+7zX7QWzXOU6cpe1t7Sp9pNdDvnSx/b8O2Pkw7H6v4bo
	hNAvo6aMo8oaj8L4C8awueoHRRnNiAWBlreFY/kxuUsh4MD4XUx/Mqam5txDKGU8E
X-Gm-Gg: AY/fxX48xMCW+UkM37+A3iPRwjwB9R2jF4n4jrWL/6ivNPiQGX5KjGmaHGLSN0bsLOj
	3c2KHv5mzfuurxcClmO+lsvmJk7O0vhMJczABSQTaP653ibVmBTUAyGaKO4CalQ8EfD4ozKWRQf
	OFPxsly/GUWRp1Tur64/+25xNKGulZDOBqy7Wmc1PqCd0JWL9Z/QhggnW2qnmyRIqZFmJEkxzjB
	smUd/v2WSBTNNnHqkAoSFEtI0HpW162oUvg+ssbgbTh3nbdigmi6KQaGARnVf9hq3pQmguBLWvu
	os1NRxj63bV4hXpHFyevubZamgyW270X0wpwmSrgJcrTKkAzWsCKg/TxkKmmll4nPZ9WhbmMwB3
	P7fvEm8rz8coY1lcxnxR3Xkk0/xQhPOOOVE9l1mc=
X-Received: by 2002:a05:620a:7106:b0:8c0:e5ad:adcc with SMTP id af79cd13be357-8c38942eb97mr2829456585a.89.1768296548633;
        Tue, 13 Jan 2026 01:29:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHgVAn4PY4YYJQsnyqjMlpBC7wIh1AdPbhFcgEIqq1oCgE7bGnJABDn9vx6wPzdIDWoDzzw8Q==
X-Received: by 2002:a05:620a:7106:b0:8c0:e5ad:adcc with SMTP id af79cd13be357-8c38942eb97mr2829454785a.89.1768296548210;
        Tue, 13 Jan 2026 01:29:08 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:fe8e:52b0:d65c:dc04])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dad8bsm43651306f8f.8.2026.01.13.01.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 01:29:07 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Pierre Gramme <pgramme@gmail.com>
Subject: [PATCH libgpiod] bindings: python: add missing Py_None reference increment
Date: Tue, 13 Jan 2026 10:28:52 +0100
Message-ID: <20260113092852.42573-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA3OSBTYWx0ZWRfX8qG9FIct7U4p
 o2Ejjjx+8Uyi1WRTKytSRyrsyOH5hSQ+3qrWgGdEPRzUpSiz0I1xDnJlrga0daJ4W/d80Ou+ISo
 QF7lPjAmPbwBfsECG8BQ/eN4ZQ9D2mnu3aNM6vrscKmnUIimn8qCyr0QIE+fdG4CTTNe4oVTYHR
 67ozC3Pnc2a/44cqfZXVSnTasRXpGx/4rA0bFhvdBP3wHQX2tj8ag4TieknXfUBgh3siBvjphgR
 T5TZuQdOoRbiKxLx9vf707QAoSjtJiUePraS/pzoKy47mJnYtinkhgfMeaxfZrA2L96zWFUTTYw
 Z+kNLD66Lh9qjSQz1pLiht+g0gT2aRE9/oUB7c8CP544sn4YE+4/15NHJ39kAurqM+Z33R3X0ot
 3qld9l/Lkd7ft97D8af1hbDCKgggMIaaV7hsFuJIr9UjxDYlXbFS1sdFvkU9I+rmPZlF9Ngsvyr
 V9PULdOES+ysoDhxtIg==
X-Proofpoint-ORIG-GUID: _eojmX0hnYHgzHNjf8kCd8cwRsDTjp-h
X-Authority-Analysis: v=2.4 cv=IOEPywvG c=1 sm=1 tr=0 ts=69661065 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=BhkvsmOTUjFouZkCY5IA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: _eojmX0hnYHgzHNjf8kCd8cwRsDTjp-h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130079

For lines with no name, chip_get_line_name() returns Py_None but does
not increment its reference count. Do it enough times and the following
error will occur with cpython before v3.12:

  Fatal Python error: none_dealloc: deallocating None: bug likely caused by a refcount error in a C extension

Add the missing Py_INCREF(). It's safe to do even on python >= v3.12 as
Py_INCREF() has no effect on immortal objects in more recent versions.

Fixes: 0c0993569c54 ("bindings: python: ext: add ability to query line name")
Reported-by: Pierre Gramme <pgramme@gmail.com>
Closes: https://github.com/brgl/libgpiod/issues/166
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 bindings/python/gpiod/ext/chip.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/bindings/python/gpiod/ext/chip.c b/bindings/python/gpiod/ext/chip.c
index 98435d9..53c4b80 100644
--- a/bindings/python/gpiod/ext/chip.c
+++ b/bindings/python/gpiod/ext/chip.c
@@ -166,7 +166,12 @@ static PyObject *chip_get_line_name(chip_object *self, PyObject *args)
 		return Py_gpiod_SetErrFromErrno();
 
 	name = gpiod_line_info_get_name(info);
-	line_name = (name == NULL) ? Py_None : PyUnicode_FromString(name);
+	if (!name) {
+		Py_INCREF(Py_None);
+		line_name = Py_None;
+	} else {
+		line_name = PyUnicode_FromString(name);
+	}
 
 	gpiod_line_info_free(info);
 
-- 
2.47.3


