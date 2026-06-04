Return-Path: <linux-gpio+bounces-37932-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /PSSCPwuIWoZAQEAu9opvQ
	(envelope-from <linux-gpio+bounces-37932-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 09:53:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D8363DC73
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 09:53:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=B7a7Wa2W;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ORWQ6iVU;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37932-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37932-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CA96230AD5FA
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2026 07:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C43043DB317;
	Thu,  4 Jun 2026 07:48:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7B437BE74
	for <linux-gpio@vger.kernel.org>; Thu,  4 Jun 2026 07:48:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780559328; cv=none; b=gUCcR66jDtIZViMLF5oCG4qXWi6OEmzk3S8Cq+wTJ7zMAACS68qU0dxEG/J+VJU0+rEa6DYq3gbbQBtfn1E2aYkfYlarJb9zPe3uYcAKkC/eWRx0zT+cn9S3GrGzrkK6D6P88ZWodN19dacA8s9s+p7Gvt+sFqzhEjiknmyNskQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780559328; c=relaxed/simple;
	bh=fjmD7CYWVmMUqdUjTEPYBfpca4HR48wawELbjz30OUE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FkK6WYnmunMXJ4w3hw0xvF65JytbnZ3Tn7FEkAScGGDieQSumip7B/flD3BJ6t39qnh7L8SxwDdFFDAF3p6hgU4b/ZGwQF0NSQOkvwrwusR77nGVgOzwZ7aYa/QfJEQh4Sn4ya1fvXlvJLkW7z2X/XyvEEEiGlUbCfl72/89mA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B7a7Wa2W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ORWQ6iVU; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65419ECl141860
	for <linux-gpio@vger.kernel.org>; Thu, 4 Jun 2026 07:48:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y7QL2k3hX9vZe41PgEP/ootRqWc50k++sc0f7SujpCI=; b=B7a7Wa2W/ym6c7iP
	HcIFmUgFaWzaSxBWLVOwvkWdCJkLpcAAbVxDJRKjnafz6LN5b8Da7Kt5MWuaxuoI
	UQMFXKFSBL26S4blaLgVozJPMcbg/OK2RqI4xZelnYOSFUZ3DC8nPbombYTMeKGl
	OnHAmy+ys5Mpfp9RbNKyacfL3k+25QSPicxqJrj3HCFuBYO7gTceB9K+VqO0SdLJ
	KuBEkA91rkKLtsHnyICP1Q4fqgVV6yx06t8nJbfptiwUbhXfHSdZ01AUZKDTwvZy
	INhfMOhQhedCMKkdc1gqJuVoGLPhucKdsbZSuP+Cs3zE77fQyV5GC+s4w7jU98ZV
	xPA3VQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejyen97dp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 07:48:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-516d1a8a6c8so4242261cf.2
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 00:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780559326; x=1781164126; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y7QL2k3hX9vZe41PgEP/ootRqWc50k++sc0f7SujpCI=;
        b=ORWQ6iVU1lF9AfA3Hh542gSK0+A7gEi7Iv/zDb1vJKeTkNCXJDyvzj86gIbwTEOkZd
         mbPvXY6zYVkwD1lC61XuzuJ3o6I+WMnS2Qfsy5GJR0oUA2lea5MYe2mERsEOEmiHlEPo
         pPIWPYWOOtcJKOfTbIAUjicRSd7Nx+bUZ4sGos288tZGYCpU5CmgsNY2YX6vCncfU21P
         XizQg1Y/jvDOkmTzhOZolkvNCYrO147v35+fmtJ6/M4HJ4udQFRTgowWhfxez1LhoqSb
         eD1S21vJJnW23j9oGzxsthBnJsQZ77raQo1FrOhmClVMr3LjhQGYILZwfvDLq/05LCgX
         xMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780559326; x=1781164126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y7QL2k3hX9vZe41PgEP/ootRqWc50k++sc0f7SujpCI=;
        b=N1l8jL6kSz3yxweshtoZF1ydckfd2ucu3wbvn/OpZAKMJsb2f71opNcwdDi2TjnFX0
         N5xhN8OvsQkSfn4PDU/dOhhyIqCdIPSz+/YdH6tm9bij0YF5O3vNXb38IG603F5aD5PR
         4VzuMxdWXLiyLA7gz7KxnOG6duFIGXj2OfsYjyQjWslbDhNGYiGAPqK+Z8PwnLrJT9d1
         DtX/fKc9pmG6ZZPXCBHDZONn6GuCdmqz+uUWQTmC0O5L+9ZD2KTpk0FGfyD8kai9nIKA
         J3bPpAsckThqkXv/y2+VKqrCqF+tn+yLxBTeKGrkjHECoTze5fW8KvYmbbdG6H2YYYd5
         +CkQ==
X-Forwarded-Encrypted: i=1; AFNElJ+tcuFVdein480oGMj/Y8ff69vUVNvCCQZAZ3lDwM1pzs9wrXvUbtsiUIYCrQv/9dGfsdWv+J27/ofj@vger.kernel.org
X-Gm-Message-State: AOJu0YydzlNZQI+ws1HteopK3HoLngDQaxj3daFuq6UQvTiR7aZBxzKD
	KIum96Yj17tHQK9ZvgmvnbIZtjKQY+wTkn6Y5V1eH4dBDATjEa+Mw4tWzgL1l8VBSghjFL6qzOz
	vQQqdWuqZ6lECaKs5ct8G0WSQgTJT9tuD9hkijKyMmJjGszDyzVRnJqwiesyjCezw
X-Gm-Gg: Acq92OHy6cE3i5Qh7NE5u39cGPpeAVOgOxjRchD86HgCqX/XHAHcuypUB1F13Mu7TL+
	l6lkZEJSnkNLt7szT7WrcvioRVrXQsRubW6d0pLBT3Yg1xNFURHPQayAhcUnvu14/KZFesq3umy
	fl7cFxuDRic8WSwAmSWbm1Z8K/A/04bFv/T279Ds/+7LeJgZSqN8XcvDbXRh4gx9H7AHRT32Feg
	RqeyZFxsFMisoYJEeworH77upfU41C9QTuB47x/xI9zDr3EZx9F0naKZydBAFkAkdxshWVmN9gl
	of2zHLHR2UjLswal1FxwQZrZbdpT7cr/U26AUBVhQqq5BEy2F/AMFuwinlz09d8+zcdUuHHtPmE
	2yb6U9hIhWksGPiydbbwIXl/peLh4bGgda2WePJloDdlaKWu5UGoLQ7yDRUbhgnzau3PAszsOvU
	TKbkQImPk=
X-Received: by 2002:a05:622a:5ca:b0:517:8353:3492 with SMTP id d75a77b69052e-51783533e53mr62402931cf.27.1780559325761;
        Thu, 04 Jun 2026 00:48:45 -0700 (PDT)
X-Received: by 2002:a05:622a:5ca:b0:517:8353:3492 with SMTP id d75a77b69052e-51783533e53mr62402681cf.27.1780559325298;
        Thu, 04 Jun 2026 00:48:45 -0700 (PDT)
Received: from brgl-qcom.local (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b7d6b990sm71092725e9.2.2026.06.04.00.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 00:48:44 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 09:47:57 +0200
Subject: [PATCH libgpiod v2 14/15] bindings: python: release the GIL in
 chip_get_info()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-pre-2-3-fixes-v2-14-781bcaf47475@oss.qualcomm.com>
References: <20260604-pre-2-3-fixes-v2-0-781bcaf47475@oss.qualcomm.com>
In-Reply-To: <20260604-pre-2-3-fixes-v2-0-781bcaf47475@oss.qualcomm.com>
To: Kent Gibson <warthog618@gmail.com>, Erik Wierich <erik@riscstar.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Fazio <vfazio@xes-inc.com>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=fjmD7CYWVmMUqdUjTEPYBfpca4HR48wawELbjz30OUE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqIS22RnOoxyOkDkYebQHHOpRps9/zWI23m2Nas
 kTPKY3yxeSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaiEttgAKCRAFnS7L/zaE
 w4MBD/9K2oH3qrJoqAyHqVKTHfmDxLXiTqvCm79iydMfAs0kmb/xuVHP6ExjFpmOujyKcWmqOk8
 wun5pOE/GvkiBzRjIVYXPNNba0dElhd9J6NBapJGOe65ySyV0z6Xf8q39pZ/O2DzgEreNYhjrZO
 IU3j3vHAoxq2Y7bvapF8H0WJGyx1fG04wL7X4SOTkhsQx76aQOrm0/Cgacu4zCvsKMekPa47uAS
 +NGYloPEhdzZDyvK70UMR+FHhy1VTD54lmxiwTWxZBZmZBlJcnNQnCjUCIYCBP5DR2ItUSdqC3h
 4V90jtAe8D+Nwov9MjtfeDKGKVHz9PLaKlCu1aEKRkwgtOGwEkc0HDGtmqW3xPJlc4HZZL7HHfT
 KKIJ7nP8zC7h7rEUh0Ag7UDq6g4qsY8YicR1df9qEo5+scszz5Dp5+lQSJlj6vHJGBmlqX7N/t8
 2AFuwLEO3qOn/JeDjBC7BEr8/yXMX7e/b1SO9FxRduLja75iPLgrAgnB4HDUh/tP+42f476gjAD
 glVwyeaDnTJg4ehAD7zyYQYFiyAfqBYfmMQzEx2LeD/8CAMAdjeC/yWvuTm3BhXf9vPTagJpC7O
 4hpZxQuE5fn9HfwMX8Udzz4G9JlMSgEMOayF5h7sBTmIeYhR2ZuQbwO9XcjYYTKqujpmw3DL6FP
 XwRdn4SmugrAJEA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=JaSMa0KV c=1 sm=1 tr=0 ts=6a212dde cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=aBIYUfOEhgoR9egqXYNcqA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Q-x0xO2OB8hDhkSs30YA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: zQ-pvbuK_WZUatXeGtN29igE-Xo8NUZy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA3NSBTYWx0ZWRfX8YcHZm9B/8hl
 K+VXbfnWLSIKwdXxzTeY6JqAAI5T2JwqKyD3x3FFE5zCTwckFy6XdAcDgGN6q/7JOPOgqnG5Yyr
 SKXmzPDKOTB3pPumnRCMDTUZHHKK9m+hXj9DWRmUWcA2CIywYchUWuU84hap4rS36mySJ/MuOaG
 JOn3qXEdsKuwPBqqQ5CHCM5h14O5ELsECV4GC8VhYPfmcXLXQ1KueISiMsvmQGHPGbbH81CmEAN
 c14od64yXtvft5qLu0HH2EWiCW+/rkSe1mtiq89lBfhSR94fOhVaO41GIaG7pN/Dk4yLBgK1hBp
 q7+h56Y48MJd6DKn2OQAwXYpEoELC47DtPnE1gzBY0d6l0oK2/Botn9vUs8VaEys1Ic4DLVaaHt
 TUBGmcAYqveiw2FIh3UvNQuu9ARlKWtwvvRs3avXqjvB/vBadfPa4CJQzNQPYZ5+alTc4AL5mK0
 fLlSRIxMiteAKzxVXqA==
X-Proofpoint-GUID: zQ-pvbuK_WZUatXeGtN29igE-Xo8NUZy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37932-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:warthog618@gmail.com,m:erik@riscstar.com,m:viresh.kumar@linaro.org,m:vfazio@xes-inc.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,riscstar.com,linaro.org,xes-inc.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: C4D8363DC73

Other methods that call into the C library (chip_get_line_info,
chip_watch_line_info, etc.) properly release the GIL with
Py_BEGIN_ALLOW_THREADS/Py_END_ALLOW_THREADS, but chip_get_info() was
missed. Add the missing GIL release for consistency and to avoid
blocking other Python threads during the ioctl.

Fixes: b7ba732e6a93 ("treewide: libgpiod v2 implementation")
Assisted-by: Claude Opus 4.6
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 bindings/python/gpiod/ext/chip.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/bindings/python/gpiod/ext/chip.c b/bindings/python/gpiod/ext/chip.c
index 4d96dd80d7e7dc8683b836e5d9bdb84fc49dd76c..e5f53b34d30b3e71d7f528f47e60375faafc08af 100644
--- a/bindings/python/gpiod/ext/chip.c
+++ b/bindings/python/gpiod/ext/chip.c
@@ -85,7 +85,9 @@ static PyObject *chip_get_info(chip_object *self, PyObject *Py_UNUSED(ignored))
 	if (!type)
 		return NULL;
 
+	Py_BEGIN_ALLOW_THREADS;
 	info = gpiod_chip_get_info(self->chip);
+	Py_END_ALLOW_THREADS;
 	if (!info) {
 		Py_DECREF(type);
 		return PyErr_SetFromErrno(PyExc_OSError);

-- 
2.47.3


