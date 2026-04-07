Return-Path: <linux-gpio+bounces-34789-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJuLMsv91GnOzQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34789-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:51:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C27F63AEA6A
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:51:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A4E943003735
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 12:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E75973B47D6;
	Tue,  7 Apr 2026 12:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UJtnCSNL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ChnCjjMV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E4A3314D2
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 12:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775566278; cv=none; b=g3/TEJUtMX+MDm1hqn9cnjkNjrgkkajkx1DuKptaDVoKhYHWE40JNSunvkcr5HFCojrLKZhpPK483NOOCo80GkC1feAGf7at64Hm+bcC1/wQaaHUSfprTfU5lZg0YvdPuTf12YZA3bShXuv587bTQ0K+JXolk4MxtGjcy2DMa/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775566278; c=relaxed/simple;
	bh=DoUXTC9k5VXqLCjvoaCoPkjwC0zo8yPQHRZWc1yje10=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XxO74nFwG+pIMjBjYi+CV7oFUC1AeRwtSfDBUR3tOGxBS9IGxSxRF5ltaq1wpJqJ0Ou17efplUuPnAjd9V88dNYABoYwCnd6ONZXNjLiqiL59j/LVPlvUVBhlYaF2wZeE3bL9/F38oCxBm8G53+ux41KfoLKTtC9CEkczFPfQSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UJtnCSNL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ChnCjjMV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376vP2Z4008704
	for <linux-gpio@vger.kernel.org>; Tue, 7 Apr 2026 12:51:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rMBKsbcVSCJMTgeSGbmFXQN/Z20trfxhpDvVNXbIFhg=; b=UJtnCSNLWDiE6fnj
	JBx+L/h0nrTVP6xlJZnzxGP7GVmvVVkTjh7DE4ikD9T5QCJ57DhRGISaqbqpMvwB
	iwPndBYVjcfaH9pk+mdH7007LOxBp9EOpi0MHGNIthqf1b+TCcUS4hD2E4Nse5wv
	lrSbdLjyRrNemfy5gfqjJJPukLt7GqfNab0zrehL01N512FJ9zrus3B1v2ZydD/T
	7m7iu++x4LggeDrPUdjSg/HUjoKHG/CQ2LefLFfurNZZspMOLttal4su0Em/JnEL
	CI/smQzCtoRWdv08zrfHlKZh61BVh1Wi12eIpXlFyu7wHvw5KTEUWtMKQYC8ucRx
	cukS3A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrktqaw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 12:51:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b781542c1so109131381cf.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 05:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775566276; x=1776171076; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rMBKsbcVSCJMTgeSGbmFXQN/Z20trfxhpDvVNXbIFhg=;
        b=ChnCjjMVCkcIkwdUwpCSAL9bETI8ezbnyyrCMJQkEpWZairiTCs+IJTWlY3PNH12r+
         IFJ+BiFH54rVkkHTEsKmOZMdxqgqH/IK+ywxnnLn6D/tZ99xV4zPBJxL/437OkYIF2tk
         BwJObpYtN9JiUBrPdXdNUjux5jJW56WU5ieQuLujcet5AV1UD26QT1PiCIKjKGe0G+x4
         HRZw3YMMSpnCQfI+B/GLwE1/aXssfiMmFGCWOJyUAWWaZtgw8BJ2tGxqJFvPNjobMPeh
         C2BJxk3Z65YLQMqu40+LTy3bsCjH16lL4NLJR+dm6v6A8s7myRf4vikO/kh3MlkOrMyk
         UJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775566276; x=1776171076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rMBKsbcVSCJMTgeSGbmFXQN/Z20trfxhpDvVNXbIFhg=;
        b=NCjMk7GohRO7MAz/JQMW6dCAha6RDf6TTv+N/utcBLr9xlOqEgwCPoN5iQxEjGvunq
         ayw0DNtlFWjm6FjBtQClQNkg07QaMhJwaBhX+CKMy2Djzc/K+oX4ZM4k4oBE+kIfpoxb
         c0iVycVFAq3iYDt6IsqXwfRGkHKtXtV2EE8bLsXc4ArO4sZG+krnRurUNSOFPtCg06Hw
         Z6w0JljO0mCTE6tWekoTh4mLtfDSeIaq7asmJPDnvciplFVBNCiNjqucWegTeK2jYcwU
         fOyexrQZczOp2qJm+F3gTBaHn/DfMj4Qjd2QX5F5LYWkh1sEeXasUODpMzfq/DWQ4OTW
         wZVw==
X-Gm-Message-State: AOJu0Yw5y2Td+3rwoDN1Tq+52Y9B6RN2upipKr8P+7+JgaWX/WCoSe2G
	us+05dyDSXWpYMA5kxDCL/GqHDHUNBwXVN/bL/1mHSPIERHhazO6BoNqKJIOl+wgiXBuqogB46e
	uAqTxe/3LDAez6XS9YvYWfEluQZ6Aaz4vw182TkKAF7WThhbwcg03J6wwbNhq65cxQgfyhSnz
X-Gm-Gg: AeBDiet8upCdYhq9O1C4aVpH+c+OoHoSJZDxo2T+Qygog2RXy+btTCJvxLV6esqzdgS
	XoxUfBQMytGHLxl3nSstZCk1gqhwzSXeCLBlds+awJIUk6fCuWQG92jA2SYMKbV4mmOGy1x0imb
	aELhCB4lnd+Ln6SpQUb3mQkXlCLCVvs82kGlF+TAM5c+S6ovZj8hSsGY+u+3L2PY5TFZ1Q5GfZf
	bHgZJL08r8QtkApdKwsLugy/7uaPhhk7mYmak+ga0WU+mEIcowJJ/BGSHaH3HgZUQmWShwbIcFU
	1vWIfT1TEWqzfeHm9v74h9QSRSveqUOVuF0GwN7THOZzWr/rjvSGcnbFkDjtvHuehBTNoE5PGCT
	YeRNchdO4JQidwRmpB4wp4CrgwS6JIqtR13VKeMPwW/QDIt1ejyI=
X-Received: by 2002:ac8:7c56:0:b0:50d:7e7d:6061 with SMTP id d75a77b69052e-50d7e7d8129mr187392711cf.63.1775566275873;
        Tue, 07 Apr 2026 05:51:15 -0700 (PDT)
X-Received: by 2002:ac8:7c56:0:b0:50d:7e7d:6061 with SMTP id d75a77b69052e-50d7e7d8129mr187392151cf.63.1775566275379;
        Tue, 07 Apr 2026 05:51:15 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:b36f:5370:5f91:2d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e83682fsm577526505e9.7.2026.04.07.05.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 05:51:14 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 14:49:53 +0200
Subject: [PATCH libgpiod 02/14] bindings: python: remove duplicated edge
 detection setting
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-treewide-fixes-v1-2-66c9744a56a3@oss.qualcomm.com>
References: <20260407-treewide-fixes-v1-0-66c9744a56a3@oss.qualcomm.com>
In-Reply-To: <20260407-treewide-fixes-v1-0-66c9744a56a3@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Kent Gibson <warthog618@gmail.com>, 4fqr <4fqr@proton.me>,
        Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1103;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DoUXTC9k5VXqLCjvoaCoPkjwC0zo8yPQHRZWc1yje10=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp1P20Fky5BXrKBEZcCHsBZBh4Y5XSu+z+fxF1H
 5Z8pIH6eXuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCadT9tAAKCRAFnS7L/zaE
 w9SkEAC05APXxKLguxtKf+6HY0TBKmwaE7TY0YVIc60HOBM8VffhU25/TW1obJAwtst2wfPS3wv
 YqEgVqfj1br/RfaYNOZjL1K1Zu4osJ1ZRvuGJiJaWDrt28zo7OMyv3aYTzmYHC+pZ99I0YXQCoH
 /EVpF5K/eucLhR2ebzpdHzRb++VamsrzoQjBhxxteiZWW8Xf1bpKRvJ5XgZyuCzEEFrX6uwQLRD
 WIt8tnBk/szor5wvGc66+AQOCZAoP9Gls2g8Fsi9EFPtgnfMIsT8wDqt+K2hUokFIQgDLUHEPQD
 /U3ChESiJCUmc1Jd0eAPO/+hjfFL342hX1usO5IqMs9T0Q010tXui+ZXOdZvUZFB9R6tREnfkgW
 r9SSBmDFLGu6Kr8MfN3l/6GFPQUUvGHAfwp+4bU22H4xuUCeFH6onhS+Art23ivnOCS8rUPlbs9
 Z8SyNnw3zZAzNxy+rwnf/fsMwIxlQu0lue5mndPrXACMg0M7qdH+yw4RgObl3PEqrnF2XiJicb6
 zORaxW+E1q6qIUJkB8T9XNYjXt47td8aTpCdoe05zfMsB/ccHUNdxA6kfBc2RCDbnJ+wC7dQakS
 /nlRRqt/uoQ6v9VVhTwah2ur0rPPc30EUJaIkJG1+vCL6OtH6Bjy0BskKYYbGvj0Vg4uAUvSBCP
 uauyTROVuS8NznA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Rrz16imK c=1 sm=1 tr=0 ts=69d4fdc4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=UrN_ANBvoMBBuDu02pIA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: B0Ay4wZ9gMw1K5bDjxifezCwfLaS09aW
X-Proofpoint-GUID: B0Ay4wZ9gMw1K5bDjxifezCwfLaS09aW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyMCBTYWx0ZWRfX7VwNkUxd3AfW
 MQiywnOVW11VdyHLq6z9NiZ41hsT3nWyQmKCPMjg8gsDjH0xVfh6RVHXeU8tjDamvp+s+MVAwdg
 XTcsxPBxv0S4mt3fmWOx5Wo0RTiq8k+MdUBhRBlpwTzgCsniV5K3Gtl37/41ILP1ItoCG9w9K9w
 dWsBEShTuL2LKSGe9oEzWs0nGt0ROMGqeThsDd3wnZ+Hr1UHkTWBg8807rDFd/qcq3/alF9VosR
 UpnDo2PuJKvctRHKnlqcv8isBVzwzRD/B9Q+Vi60Qopz2jmduZVmSepScGrSxXxZhVRKYRXP+51
 FknnNkvzu+W1QVdMLS8rxeE8exwU6GwyzWB00MckNV403KkGm9mukCVhPWoVTd8Ksu4OeqBIw2d
 jtbFBWKLD7ILQ0iWN0+7KoWFgtY/qf2oOlXvIMvmntTrNgMnZ+VhIy7yzJEyAv69sWoQm5M+zco
 2m2Sb7qE7fm6PcSYpVA==
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-34789-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,proton.me:email];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C27F63AEA6A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In line_settings_init() we call gpiod_line_settings_set_edge_detection()
twice unnecessarily. Remove the second call.

Fixes: b7ba732e6a93 ("treewide: libgpiod v2 implementation")
Reported-by: 4fqr <4fqr@proton.me>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 bindings/python/gpiod/ext/line-settings.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/bindings/python/gpiod/ext/line-settings.c b/bindings/python/gpiod/ext/line-settings.c
index 650235e11997cc0042c53cd91d6909a043b29e29..550d0935905dd312128bcae7887c0392a4d0d13a 100644
--- a/bindings/python/gpiod/ext/line-settings.c
+++ b/bindings/python/gpiod/ext/line-settings.c
@@ -70,10 +70,6 @@ line_settings_init(line_settings_object *self, PyObject *args, PyObject *kwargs)
 	gpiod_line_settings_set_debounce_period_us(self->settings,
 						   debounce_period);
 
-	ret = gpiod_line_settings_set_edge_detection(self->settings, edge);
-	if (ret)
-		return set_error();
-
 	ret = gpiod_line_settings_set_output_value(self->settings,
 						   output_value);
 	if (ret)

-- 
2.47.3


