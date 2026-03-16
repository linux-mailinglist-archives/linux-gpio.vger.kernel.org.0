Return-Path: <linux-gpio+bounces-33527-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJx3BSMLuGkWYQEAu9opvQ
	(envelope-from <linux-gpio+bounces-33527-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 14:52:35 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BECA29ACA8
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 14:52:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2389030152C3
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 13:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A419397E62;
	Mon, 16 Mar 2026 13:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O/fLv8Zq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GuRYIiAy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7DB221265
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 13:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773669148; cv=none; b=Y55IL7AJSp0sE0qKghCQ7gyIBhXUhU2Pn9RJYsSx+Q9Fz/Ga5Bh6t/0DxJutep0Enbp5O5X8MNmZ+Ao8p0B9GGVMwnINI96bU9lHgg9cGsN9CNagLO9hU0ut2FzpkmU8194uR+MnURGwaKlUzd9Lt/IheGJUwAHP++xNhrWBCek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773669148; c=relaxed/simple;
	bh=ou7reqT/wcXjiO1qmnl2tBuKhN8/ZKlH3/7gf6NTwIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rfwoTBkLMaOzHyZ86Lpv+8VkomMCGwtJa9s59QQ52tsr9Kkw2/x1Pxqu8gTbGAZbiKVfv21tLpzGM3svSqrsoqjeQ4bvI3eCqqdMLE9hsGTGoBLaVRQcvD0LrDIsJydgNjLayhw6f4s0lvlMn4gNRUQQE6L8vaeZ0ZRfH8OJ1sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O/fLv8Zq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GuRYIiAy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GBm7Yw1066909
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 13:52:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FS95DuGwePcn08gkmGxg19
	H9i98Hxg0lazfyqBhiI0c=; b=O/fLv8Zq6ise1gJ0eNAlShhniCueXU+zt92UXS
	bzi/UkZivRExwVytghfZAS05EQNVKphNNCDn5I8CyO8oYkCKiRdGSfQKMMN1znYy
	+BuVKTUpzvJOqtZwokx7EmJibINJQLrsQ+qv5l5Ngsk/LxmebnYABF6ckcZ4kKSn
	C8Ol5aq76q04++DCf+Rr4hFkTAxLkhc6+nZtcgAgGgIBosgxPGn25cbAIQi3DvUF
	9x1RGT3At7iNV7dIorBAUqrTazyHAz9bstVwRpciDmXsusd2LEBtCU6BDMdF9Aj/
	kmKfbBv8Oj9qAu+Lv2/jwemxt4RsMX89WggQZnKWWfQR8VNQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw027e387-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 13:52:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd849cd562so3064134785a.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 06:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773669145; x=1774273945; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FS95DuGwePcn08gkmGxg19H9i98Hxg0lazfyqBhiI0c=;
        b=GuRYIiAy9QEysR39fsHh9aPCRXuS87eTKE76DsW5G7bLsUT3clrqYdicOk0Jx0WCgP
         yCy8ArRx58s+s0V1dTZ8EvNb+Pr8WtrpNSc5L/PpjcaEQycs6ZnVqR0cfDuXJ6Q/0EL7
         Mog6Og98F/sJBNthdGqFWprR06eoQwKq1jCp4QUCV8FjS1xBIPOQpHlVkeqP2oowLPxd
         Pnn1fe0Y2S+DrjDc+F+6pkXXHjCaMEt7pupSptZ2i+PvxgePylYg5Cc4TijceUdWnW+2
         R1HcpgYh2W7kIFNKf4n5Q8tgotetbivkwDRzGDcA4fvE3mwU+GmXSFAC9nNwN0RK07Qg
         Dxdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773669145; x=1774273945;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FS95DuGwePcn08gkmGxg19H9i98Hxg0lazfyqBhiI0c=;
        b=TD3RQtaSQeRtKmhODXb/c2stvwSwLkc/5RFOwwx1pykR0xDbaZm5nKhgb4fC9PjGmG
         4Vk3ph1zDtPaXHFKRI/SXZza2zx5Ng45cfXkzf/MXO0n1LCkERRDiP9b0c87kRl+w1DG
         aGQID9Y8v49DiIWwOMwy0GHe5KDC54xezks0/KXKaB2AioyR/MYaFzmfNcu2bEf76Ick
         ddJA7bnkkE8Q5pPlshb0SWAChGa3eL2sUd2WusDReQnU4+scoHh6P0P+sTYd52LTdMX9
         6Xk3J/3ZNTbLTR5RThbDb2uomlEZEY9Ax1Pec1rZ+WeMSdI2RxTryteMfa42Yjx8bdop
         dmMA==
X-Gm-Message-State: AOJu0YwAwfOkPcxGu2TNHJQWg7jMEiFXPhoZVdKa8R0h+Yi8R/k6GCtK
	kv87oQwjavSGKKUTZxOyhZLws47llL3xV5i4ry1fw7mBKa3NpjeIz3f9pzWDdEJ0voy08fTWwZ3
	0LMvqNtrzYt4QFSIEBMDCKp35dfxzGCj0dTiavObjWnwE53xYg5HcFfu5Vjv3wcA7
X-Gm-Gg: ATEYQzxSJbre3ne03daSQoRmKwP/WoPAvUbNHY/lRzYL6dw2l5JTNYtoiB35+Rajs57
	POwFa2FnJDNTJAeOnRY+2zGTM1e/IajhuQXZOFfu4yGuRAMSDXCYLCh4jS0fWLGPe32x3lBSfTK
	90SyKXjn6eEKaCBD0sNlzxIB5Kk5q6u5CK0dVo9Z05UpRaeMRKBhfVxY+mRvmF0bKsEVktu4Wkh
	7BGSrhXALKWFtSh1PRN1+KGUaAqXGJ2xatZSI4tRSi0b7QWfui37RwMTxQegN2Vgs3MWTFT3kfW
	Zw83t/s0GM1RLoJZ9d2OJE8Vd+3iUG1wz9WgZpUDumXl4GebWkqKaiCyonoV9a3sigN0n5sHLwB
	4XJBbrFsRhXP3J3ZoAo3pVnwTgsb8WlL61n0QKMbKaikth2Pfr30=
X-Received: by 2002:a05:620a:40d3:b0:8cd:8e8c:2054 with SMTP id af79cd13be357-8cdb5b5f310mr1712208185a.47.1773669145051;
        Mon, 16 Mar 2026 06:52:25 -0700 (PDT)
X-Received: by 2002:a05:620a:40d3:b0:8cd:8e8c:2054 with SMTP id af79cd13be357-8cdb5b5f310mr1712204885a.47.1773669144529;
        Mon, 16 Mar 2026 06:52:24 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:45fe:3ba6:f90:d951])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b66dedfsm437147575e9.12.2026.03.16.06.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 06:52:23 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 14:52:17 +0100
Subject: [PATCH] gpio: shared: call gpio_chip::of_xlate() if set
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-gpio-shared-xlate-v1-1-0ce07a1362d2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABALuGkC/x3MQQqAIBBA0avIrBtQI4uuEi3EJh2IEo0QwrsnL
 d/i/xcyJaYMs3gh0cOZr7NBdQJcsKcn5K0ZtNRG9sqgj3xhDjbRhuWwN+EoJ2cG5awbdmhdTLR
 z+Z/LWusHHkxn8mMAAAA=
X-Change-ID: 20260316-gpio-shared-xlate-708c651cac5f
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jon Hunter <jonathanh@nvidia.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4369;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ou7reqT/wcXjiO1qmnl2tBuKhN8/ZKlH3/7gf6NTwIk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpuAsSK9AKCYOcqtpoP4ZrbqOo9FLeV/BjO0QlY
 fu715pOSbqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabgLEgAKCRAFnS7L/zaE
 w8I9EACLGrAwk33e9D9LoGKvEPaprt6zOon1cBPqlwuHE6TMsGJwI/sJS0v0wcfywT16kUTAg1x
 6fd557MHZUwkhsCxdGXAkAKLqplVKUjOPh30+cOT6kGkIoOoX5i849vr4WqFcdGtxQSdDLQXsF8
 aaL5HZg4SaA9Zp7XbryAhKK/7G1rTo/0ztloivWXKOON0vKOdT7TsWDrGQqd22gxZT9AQdDtTlf
 J64lXnVTiy30TIDG4j+wYLgTSwByA/M9oh1AJydJyV+SMPzl1Z4CZ2Hlf5STFrWywiLLzqWiZDP
 RQAU0lM6LVFNM32vF6cDanTyzdE1BjLPx2y5yab6jrOw8If81X9LCRczYV1nc0TH2wNry0GZPF1
 64Qn3BiH9siBJyLaoF0ygfC4WK+kBLIfpUTB1AkTOlnYRKiPuDOTFp1Jn85tdDfpcO3WAFfvjBJ
 0F+geIHRDDf3Mo8cvOhuyULO3YmmSYeCLIc1vemCZB21IDyR4yikiBA+tW4EXCADkP6NQaqWSj3
 EIxCo6xKG1z5c9bBn/CVdhf/hBi3p2pVlHOE3S1zyhEVyQOE4yCVb/8wQalB7Dm01uFnwgpSNnl
 A8/+lXdQcydHRXW6y85eAhXsHttFjYORO46K7mC27SIzKJ9OctvMcG/jp9Z6bthl0Hp4yzwWJU+
 3+cCihe9m58EVfA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: stTipqPUKnBiNTS9nZpnU5R_BELZcsWk
X-Proofpoint-ORIG-GUID: stTipqPUKnBiNTS9nZpnU5R_BELZcsWk
X-Authority-Analysis: v=2.4 cv=AqXjHe9P c=1 sm=1 tr=0 ts=69b80b19 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8 a=hgUgvgRoQYGt6P0yErkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEwNCBTYWx0ZWRfX0W6IcQsxwvEb
 +FIXkObljG+LM5wdJzu0HMN2YIPk4/8KKJDvodqOoOG570Hx8+vAphDCpU5H+NoweuRQdvCerGf
 OcuScv0zXS0nRwKuC8M50g+LWfk4aIx28dl9vmHkvkLUZu0noZvA9pIQ9xRTOfHOKKV92vm9NSa
 cKwerHQOaLhAOdyBhWkCjkGmejtxAIEp/g1Kr8L+2fFjBdE5m1x7Ap75jXIgbL0g7oBx2/uAmw+
 4P7hLzSyYPhzFpTUfKtJldCy8HdUUeDUw7cb2YwJZhOXbZnJjL2O9b/nPWIyvM3rvAsXmJxkGsB
 30QQatq/w/XFUAVMXirXi7yru+bbXoogWUnQclHVEk3kmVzTQaB9AYHKl3CBjNMSYQhuhH84b9n
 +K1U5YB3PFBV2H6MxElxCOmWsaR6iWijbdInvI7tvEpo8/gEh+lT950cdJTfC8yoGstKMhxonlh
 4ycigFfJ+Lh0Jf6UqeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160104
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33527-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,nvidia.com:email];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1BECA29ACA8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

OF-based GPIO controller drivers may provide a translation function that
calculates the real chip offset from whatever devicetree sources
provide. We need to take this into account in the shared GPIO management
and call of_xlate() if it's provided and adjust the entry->offset we
initially set when scanning the tree.

To that end: modify the shared GPIO API to take the GPIO chip as
argument on setup (to avoid having to rcu_dereference() it from the GPIO
device) and protect the access to entry->offset with the existing lock.

Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
Reported-by: Jon Hunter <jonathanh@nvidia.com>
Closes: https://lore.kernel.org/all/921ba8ce-b18e-4a99-966d-c763d22081e2@nvidia.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 27 ++++++++++++++++++++++++++-
 drivers/gpio/gpiolib-shared.h |  4 ++--
 drivers/gpio/gpiolib.c        |  2 +-
 3 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 17a7128b6bd9bf6023deccee50b2453caebe3d9a..3a8db9bf456daaf021d3c691677a90fc6da15889 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -506,8 +506,9 @@ static void gpio_shared_remove_adev(struct auxiliary_device *adev)
 	auxiliary_device_uninit(adev);
 }
 
-int gpio_device_setup_shared(struct gpio_device *gdev)
+int gpiochip_setup_shared(struct gpio_chip *gc)
 {
+	struct gpio_device *gdev = gc->gpiodev;
 	struct gpio_shared_entry *entry;
 	struct gpio_shared_ref *ref;
 	struct gpio_desc *desc;
@@ -532,12 +533,34 @@ int gpio_device_setup_shared(struct gpio_device *gdev)
 	 * exposing shared pins. Find them and create the proxy devices.
 	 */
 	list_for_each_entry(entry, &gpio_shared_list, list) {
+		guard(mutex)(&entry->lock);
+
 		if (!device_match_fwnode(&gdev->dev, entry->fwnode))
 			continue;
 
 		if (list_count_nodes(&entry->refs) <= 1)
 			continue;
 
+#if IS_ENABLED(CONFIG_OF)
+		if (is_of_node(entry->fwnode) && gc->of_xlate) {
+			/*
+			 * This is the earliest that we can tranlate the
+			 * devicetree offset to the chip offset.
+			 */
+			struct of_phandle_args gpiospec = { };
+
+			gpiospec.np = to_of_node(entry->fwnode);
+			gpiospec.args_count = 2;
+			gpiospec.args[0] = entry->offset;
+
+			ret = gc->of_xlate(gc, &gpiospec, NULL);
+			if (ret < 0)
+				return ret;
+
+			entry->offset = ret;
+		}
+#endif /* CONFIG_OF */
+
 		desc = &gdev->descs[entry->offset];
 
 		__set_bit(GPIOD_FLAG_SHARED, &desc->flags);
@@ -575,6 +598,8 @@ void gpio_device_teardown_shared(struct gpio_device *gdev)
 	struct gpio_shared_ref *ref;
 
 	list_for_each_entry(entry, &gpio_shared_list, list) {
+		guard(mutex)(&entry->lock);
+
 		if (!device_match_fwnode(&gdev->dev, entry->fwnode))
 			continue;
 
diff --git a/drivers/gpio/gpiolib-shared.h b/drivers/gpio/gpiolib-shared.h
index 40568ef7364ccbf08b7f583e279a7d5b572af477..e11e260e1f590c46c5e575d3bb8f3b5a2240892d 100644
--- a/drivers/gpio/gpiolib-shared.h
+++ b/drivers/gpio/gpiolib-shared.h
@@ -14,14 +14,14 @@ struct device;
 
 #if IS_ENABLED(CONFIG_GPIO_SHARED)
 
-int gpio_device_setup_shared(struct gpio_device *gdev);
+int gpiochip_setup_shared(struct gpio_chip *gc);
 void gpio_device_teardown_shared(struct gpio_device *gdev);
 int gpio_shared_add_proxy_lookup(struct device *consumer, const char *con_id,
 				 unsigned long lflags);
 
 #else
 
-static inline int gpio_device_setup_shared(struct gpio_device *gdev)
+static inline int gpiochip_setup_shared(struct gpio_chip *gc)
 {
 	return 0;
 }
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 6e000ad58a11f7e3de85d8a0630150368acc53ce..1777efe1a986c941da464da92255c261f27a5a6b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1223,7 +1223,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	if (ret)
 		goto err_remove_irqchip_mask;
 
-	ret = gpio_device_setup_shared(gdev);
+	ret = gpiochip_setup_shared(gc);
 	if (ret)
 		goto err_remove_irqchip;
 

---
base-commit: eadf2995ab7c8158bf694304d41e49cada263277
change-id: 20260316-gpio-shared-xlate-708c651cac5f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


