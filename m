Return-Path: <linux-gpio+bounces-37068-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIcnGTkiC2omDwUAu9opvQ
	(envelope-from <linux-gpio+bounces-37068-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 16:29:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A392F56EC82
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 16:29:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5C1E13042713
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 14:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C488448BD36;
	Mon, 18 May 2026 14:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Da+yG5NC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PUPL3/zK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BBF48AE2D
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 14:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779113810; cv=none; b=c7f2MM5dOlYaKaJEI1D//wDZbuiUHyKkyVdQnFTe0uBSo0HHoMRiclYaAmHkEx+xjZb7FHiYpqyTtBmxC04qF9zBgpmjfBVnTM5qc2crX34sVNbeTozeYCDlSwQBT1Ue4kVHEq6hjHbHkF4Q5wkdZo3aaNRgG2SdCpqZkYHvT5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779113810; c=relaxed/simple;
	bh=t3GMhU5BiDcAMpoxPcbsowAatqnK8Fer8zJ7S43It88=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WD++D5l3JVmzmlugTtd3bWepioaPnMYGJTUiM4kXbTmpON2IcazCylLmiMcljU92lLMqHgob1TsIXJZoNy8vIVGtuv513FytqOgnDCcyz5xhNzlHQf4VOLu1q6AowfJ4i5IQUizB/hGXJvt0zlvOysGPtta7KNTez04omk84/iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Da+yG5NC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PUPL3/zK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IBHRcB2482391
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 14:16:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AeQ6mMjem3Bq4Th8eTbkEqzyisijnZHO8faMrAT7mEA=; b=Da+yG5NCap8TB4JT
	2bnORosKIegi+I0AUEo3iYC8rj19cnVvV3OQ9XM/jbmRt+KbicsWnojSfn+YGA1L
	N9DgnjeuZN008Zz7+4FAN6XapEGZ9sBlFAKsyxmZJA6VmehaeEBETLtZUILJPBkE
	uffATMLa+pbUBBo8tqLTLrNN0KuacdUgglEu/I415gQEvCHq5fA2tpJY8VXOM/aH
	y1UMAcXdNbKKARMitx3nR3N6MJRZgJdYJXhJlspbUSRVoPMSA8TuySfRitUGTH41
	3lwyjCQIioR/q0aYwyLybdMg4T8vS9MmIIV8blD539Z9hJtUunqpVdfkfl7LqL93
	+csZVg==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e81rvgnna-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 14:16:47 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-484ba8bc89aso2247169b6e.2
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 07:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779113807; x=1779718607; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AeQ6mMjem3Bq4Th8eTbkEqzyisijnZHO8faMrAT7mEA=;
        b=PUPL3/zKdcnfCJs4tkMOSGd4hweMz5xhAJyS9hj0uXOYAs2rGuYzagPGUiYdhOvptV
         OJcG20EjitIara5f420WtDHWQizbPNXY3AXQ6jOnzK6FdnFTtApRxKy//dFSzVRC175v
         xJmg0p5KfH+a6XK+JnLmLTXMT3U2Fs5g32amwhyV6PIGUx9zLUa+UuQ980y62nPNT8aO
         dYrY6RbqOXvJ5hg4IurLmRoL/nVGN/7S29xG0g87q3YfeEB7twu1djYhYxgp0dZKqKMa
         Qb/r+Q0rXdtJiSLk04IHgwPg5TiGWh2f+VuMDo+u24JOLvZ4UCU5MQMlycRadC0TtGER
         Ws/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779113807; x=1779718607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AeQ6mMjem3Bq4Th8eTbkEqzyisijnZHO8faMrAT7mEA=;
        b=i6/0AtVZ/3Vliu5i9XTzD6u+V+IXz8CyRc2Jix4VKKhL78pkDfHoc2k38k6Qavsmy1
         pmPuLZQ+yR32eJrXC1wRaMHhptz/e81cvi24OhIDCugwpdzukZty7kNnkMhDvtr+e5rU
         w3jxX4Hd/kLfOGpzDtN3EryxUtvOwexARr3KoHVTkqLPOwNxAWWl8PcnoDud1Gco3JsQ
         TYkuc7B9gMA9F2m1TKksUmx3WqPdLg+FylDi6hfKwF6A9BMy0XXcm6065I/+0OO1Kz2r
         EwUuwokoWB7K9AC6GpeZ1h2b0CiSu7nfjgZfqcqSSm9oWN4YInd+s13Berw9LRlYZ7nG
         FlxA==
X-Forwarded-Encrypted: i=1; AFNElJ9thLsEr1XxuTCgBv9LlpMSf+8FocxyqSy4Wk8UGo77uxlQA3JP48ZO3fCAkEGNMFrVP8HWzxlMqJl3@vger.kernel.org
X-Gm-Message-State: AOJu0YxuBzxxJS51pkDyfZTJNGEeW44H6gY3NTcVTkXJHao8dCY4e+NJ
	6dK8/OxIKI6rObKffoAFl4L8wdpFDWSXgVCTcSV5w4LX68m9YYUj7TLToqSCb3GiB+XnemYp3IA
	T0lLByTBL4VuJk9RWzvT9fHojzdiarInXO/x6MmttxBE5g7CNQZXB5OUJQ+jzlAH2
X-Gm-Gg: Acq92OE8R/eI4+4oeNmEWkALJbUTVvIb7LL43dd8K2XyiPAAcVIwJNxcY81T4ceJs+8
	1hdc4gSLOW8K1IAhUNMCI4TSEMYc3E8LNBlR/pcgUP8FLqc2v9Utyujmgx/XnfVS+ln+q6HYbXR
	iMo1EvRXfWjTb4lXe8R5aValMrB5bkBj7GyBCIz/Yscg+yChETIP+7qvogxKwOyDNYvxV8+x/5h
	diNJ7w7EF2NRhWEy9HdaGgaPZ1amwkYohawDvBpRNRp9OaWNAwh6Drs760jm6K2EOjj+VO2VpRR
	nB28PY1XMIG4Qt57BIrKA+A+JESZPr+K3BVMJcxgc6gF/qQ4vMGo8+WrzPDvx0ldr6rdt0HOh6t
	BwfQCSdAYH8enWRTQKf1lGKuM2L89Y4Xnt6tKFDaVvTAK2yjvAw==
X-Received: by 2002:a05:6808:1482:b0:479:d467:1a26 with SMTP id 5614622812f47-482e5bb9669mr9786611b6e.43.1779113806660;
        Mon, 18 May 2026 07:16:46 -0700 (PDT)
X-Received: by 2002:a05:6808:1482:b0:479:d467:1a26 with SMTP id 5614622812f47-482e5bb9669mr9786550b6e.43.1779113806228;
        Mon, 18 May 2026 07:16:46 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:1337:b6d0:456:372c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feaa2949asm119371225e9.1.2026.05.18.07.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:16:45 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 18 May 2026 16:16:29 +0200
Subject: [PATCH 1/2] kunit: provide kunit_platform_device_register_full()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-gpiolib-kunit-v1-1-131ec646c4df@oss.qualcomm.com>
References: <20260518-gpiolib-kunit-v1-0-131ec646c4df@oss.qualcomm.com>
In-Reply-To: <20260518-gpiolib-kunit-v1-0-131ec646c4df@oss.qualcomm.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2774;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=t3GMhU5BiDcAMpoxPcbsowAatqnK8Fer8zJ7S43It88=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqCx9IXqDK7+Xm8oAjrxbh18dmFPVeLVFeNZ+6i
 QWHES+2ImGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagsfSAAKCRAFnS7L/zaE
 w+QcEACUh7huTT6cP21wKtuQX/BpfJTQVM+DQerd+zTEzwF3+SaqgRHd6WyIPFtF6iBsbxkORiu
 cPQpfRdVWHuiicmE8h1ZrDKf8+zZF1jyzuUWnCbawdAxtBicaSLfv3u2LR2Tfa9zgltKU4rBxby
 EcoROfoH3oV+5VQjU9miAx/u8XRRgjguWZ6fJV4Wo/q+W6Oxih896GB7rulrOnH5r3Fg69wPvdl
 jOZ6YjC7R6ae2KOBAPjHHaLvlTLJCRURsc7Uv6AfDIb7oVrAzz75qKVPibxGycp2jDV47GbJVKj
 oOOf8iEpzzuTEUMFxKeS1+C96MeyqiAWGZPku/QWlledPKSl5dLQMekJVBrL8BWMp4zJ7ZpXvAR
 vuUqn5mGGQ+o1EuMWmzd7Iq+YLWhkFkbOhEatGVLNNyJ8BrVr3pcVVk0YBaZL2KsZ9TUjh4Meoo
 zQdWwz/XvRfdjvJ94eWWnBkW7aD6IfEo0Z0Q0GyQ/MgPm0j5cmkZE94b8OhrBIXXsnqoCET3eJr
 i7zIt6NYIl4sqpBTboSp7TdBopT44oPYC1Cfv13CpfOP3dFBEnFzVxUeOes0KT0iBS0VF/kmy+t
 /lly47e75lH5qrujZrNP8M3Egl12HvHrCiZEhMyA9HH2XoiSD8hCzxxS+91aaf2h8WWu9M+1BN7
 asIHj8bAjtU+Z5Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEzOSBTYWx0ZWRfX7nli9y8t3e+d
 hlXllx7j597/e69mtgRIpMCNYfOIUwcWRPqwLSMnNfUOfTD0fUW/IGl0cOviaaq0MV+7V0EdpBk
 0q2se+EDDXAcbRifDGyu1SPbRvqXRcDhZM0+rozP7z4mjhVKVrwvgJ5hQhDo8x+9VjPBFk1hVR/
 TWB0P5x/UBI1LI9fg01yuhwA72TLaVU+WgAW4IrBXDaXgNM7XRA2YPXYuat6z/70mqc4ubT8Qf7
 BLYyyz6ubjrF8A+JlpA3ib8qMPPv7khJieZKEvmRoScq5QTHln1ixqqWOMzX9dcKlwxcYZu0HT1
 5/2+teR1bnkHf1lNVzj7b9RuODKfveMWibL0jjhUyEwtnbaSBa0dBFamMLQUVaV//vaJhHiXuAX
 PQhQ/makG0MPv4cSclJzJb9tbnUWvrn7hUH3qdDtP4vX0dvGc+9HZkOsEz7Dnv60t8DdebebNcj
 iHo8AfXFhWLSHheHR5g==
X-Proofpoint-GUID: 1Fb7HMKRP1rppGaLhLF6Rcx4Nj6ethJC
X-Proofpoint-ORIG-GUID: 1Fb7HMKRP1rppGaLhLF6Rcx4Nj6ethJC
X-Authority-Analysis: v=2.4 cv=Lf0MLDfi c=1 sm=1 tr=0 ts=6a0b1f4f cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=3Mdbh2SI1NvihuWZMnwA:9 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180139
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37068-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[linux.dev,davidgow.net,gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A392F56EC82
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Provide a kunit-managed variant of platform_device_register_full().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/kunit/platform_device.h |  4 ++++
 lib/kunit/platform.c            | 31 +++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/include/kunit/platform_device.h b/include/kunit/platform_device.h
index f8236a8536f7ebcee6b0e00a7bd799a14b345c1b..8cad6e1c3e7efba862862b579089f2f317784a73 100644
--- a/include/kunit/platform_device.h
+++ b/include/kunit/platform_device.h
@@ -6,10 +6,14 @@ struct completion;
 struct kunit;
 struct platform_device;
 struct platform_driver;
+struct platform_device_info;
 
 struct platform_device *
 kunit_platform_device_alloc(struct kunit *test, const char *name, int id);
 int kunit_platform_device_add(struct kunit *test, struct platform_device *pdev);
+struct platform_device *
+kunit_platform_device_register_full(struct kunit *test,
+				    const struct platform_device_info *pdevinfo);
 
 int kunit_platform_device_prepare_wait_for_probe(struct kunit *test,
 						 struct platform_device *pdev,
diff --git a/lib/kunit/platform.c b/lib/kunit/platform.c
index 0b518de26065d65dac3bd49dd94a4b3e7ea0634b..583b50b538c79599ebbf33e261fe2e9ced35efa9 100644
--- a/lib/kunit/platform.c
+++ b/lib/kunit/platform.c
@@ -6,6 +6,7 @@
 #include <linux/completion.h>
 #include <linux/device/bus.h>
 #include <linux/device/driver.h>
+#include <linux/err.h>
 #include <linux/platform_device.h>
 
 #include <kunit/platform_device.h>
@@ -130,6 +131,36 @@ int kunit_platform_device_add(struct kunit *test, struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(kunit_platform_device_add);
 
+/**
+ * kunit_platform_device_register_full() - Register a KUnit test-managed platform
+ *                                         device described by platform device info
+ * @test: test context
+ * @pdevinfo: platform device information describing the new device
+ *
+ * Register a test-managed platform device. The device is unregistered when the
+ * test completes.
+ *
+ * Return: New platform device on success, IS_ERR() on error.
+ */
+struct platform_device *
+kunit_platform_device_register_full(struct kunit *test,
+				    const struct platform_device_info *pdevinfo)
+{
+	struct platform_device *pdev;
+	int ret;
+
+	pdev = platform_device_register_full(pdevinfo);
+	if (IS_ERR(pdev))
+		return pdev;
+
+	ret = kunit_add_action_or_reset(test, platform_device_unregister_wrapper, pdev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return pdev;
+}
+EXPORT_SYMBOL_GPL(kunit_platform_device_register_full);
+
 struct kunit_platform_device_probe_nb {
 	struct completion *x;
 	struct device *dev;

-- 
2.47.3


