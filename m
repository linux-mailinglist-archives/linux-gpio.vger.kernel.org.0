Return-Path: <linux-gpio+bounces-36529-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id xZ/NKIK6AWqZjAEAu9opvQ
	(envelope-from <linux-gpio+bounces-36529-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 13:16:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EEB50C957
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 13:16:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AACBA301FA89
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 11:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4E9B36D9EA;
	Mon, 11 May 2026 11:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LLdIbn39";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dxsNUPlI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828DF3659E8
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 11:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778498155; cv=none; b=JsJHKaaY0BryAN4q2GAy/XRk/Xg0s27NJEWhD2iNQXXGZxiBbHBh8tEjuwk/j0T7DtEU/+AR6qTZzgRVABss9I9Ay+suc+Rfo0W5phLczqI5OneoNHDcwQzIP1eZSHsx9XVS7rdJhUfVE7Q+Fy27cO/8qxEOY5fPtQWUN6bv0ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778498155; c=relaxed/simple;
	bh=2vhBwfOlW/5YUXCzD1Mbz7MDJbEKjW8n8KkP5mo4oAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qBt7PwakoY5OcLtUFdTZ3qQ2sgQrd3oSsszjfGOaMr/LypwOrSXPqyGx5pSNzs9PZ4GKR4hRVzyThJ0808uNfVLcJAOgQFU2wHnjLsjQYz1c9LDWgtJO+U1GIuGdbh2Q5NFkBAlF2AmZhqc5vII6mrDlAVPrDJrWyBrO90bIC4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LLdIbn39; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dxsNUPlI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B7GxQa619380
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 11:15:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ve9WFM2tNoer0MUn5RmOwI+WgJIer6qBOBq
	GvqMaQRk=; b=LLdIbn39Ae3zdRbw5NM6fqNSlDz6xJEcGnccra1VkbV6jcdCPge
	tjkf/wTf699QbW77MrM/Q71plz+kwK4Q+FG4tIRPHjhFbY/NZM48qtP8EywudQNw
	n7dH1X9ApLc5u7+wc3GcBe6P36e0XTDJ+Eje8sx27ImYw4NHtl6Ca4nliLcbEh09
	XQYg0WSZwevwpGryLkMVvcusKufZdc4uYhqQdw9woAe86lL2jNlG9isb+UuZp4uM
	J1dsY5RsJ/G9hSZorz3obdZFR0ni93i2CDf0xJE+ZnfO106eN+G1EcN/ES0db8F+
	eltXqBjBo3JsS0Q40AVxtLl+mFsWh71KRuw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e2dksuyha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 11:15:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51009190feeso74144091cf.2
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 04:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778498153; x=1779102953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ve9WFM2tNoer0MUn5RmOwI+WgJIer6qBOBqGvqMaQRk=;
        b=dxsNUPlI/31spLHM/kmW7M12My3Ax+0LDo5gzSfvb2JOOtv3BdATJUX560HMlBbx1P
         erudRRrIZgLSvjSxm/5wfiKixKNQ2IgO25ALakwKfPmQ6mCHZ0MYcZVYgSqroz2rUlYU
         QyX+jcouxv+ttz0nzDTK/ob6MDhraDe4EehsjK155Mt0DwSWf/9+1qCrlA+wmK1dK+JR
         6z/+I5u4eCG7l2b/aG3T0yoFr8+KBz7eZk3z+612yYTHLGANBrmPoPBvNM26JPpoMulm
         Etb00MZlN3ZM0JosW8L23Iej4FCHZSAUtDrXIS9sDhPS5LkZPndMEnyLRatwKaFDZitq
         7/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778498153; x=1779102953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ve9WFM2tNoer0MUn5RmOwI+WgJIer6qBOBqGvqMaQRk=;
        b=SaxjEvi9tmgkMhp5DOyJIqSZuaOCYV0kEbiFFT0hEF8qAEI/iy4wykKhfH1P4ZDZqx
         +jz6ulQVJGriJiUPHApCXgHuhFs6QUXadB/eryj78KIxTWxsKwwRvYKBxh+EBJ/WM93b
         4LrqId2GVQjJ+OpxNJI9ybfAkVxrJ4NFYNYmjqV+d2azoTPU+b9jV1QSq0zYVQxKfyfb
         CBrRpi7juGVlheUswZKwkV16QD5QCgA5qV2gDbNO9iBpHvpITycgUfcfDnyngSX/NioD
         CRhI21y8gNY+NOulG0cx7SAVRNuQnbvInXG5GmdDrAZZYwLCdp9K2Ob4hzsgxbce9fgJ
         V2gQ==
X-Gm-Message-State: AOJu0YyUlnPNg/gdj1RC5GvwPxdhgui/R2lqYBUxiLI0fcsknT9V2h0T
	o/woK+rek4YZ14q8p/2EKqUQrM6rK0wGBTYjhIz00EWpdQU3f+nAKzAJ5AzS1V0M2Vteb390Qgl
	r3ROkIPw/Oerz2sOuTRVkpmMXJwB7GqFrJx2MfttLkHlUTP1BBf6UvYvAwRXkWVcU
X-Gm-Gg: Acq92OEv96lSFNDFWu3LR7xBxovjXdrSb9TdOyC9fcGqiVjqohK1nmjCvnMmMQEgCY+
	cIwLq96//BxeR2JyYcw0eeGPdWzose9wua/Kg9JB+NBKJWi5UCOAsJxIe5wo3DTdLpd7jixW9Wc
	T30pMa2pWHNAZT839j1lkRxSK792ryw6mUFYcKso4DrWavDmrKd+jUhqcGG2VvYtHjk/fvjEfhx
	LCbGZmpbd436KmHI+MbLyYjblqpp9V2NGDnC/10cBYBuIUJ0MjCqUH/O1cV7KyP9FQTl9tN58nl
	5RNGBVOcKTDNnwsklsWBBWmXEHJt2bOHkXPvTqJvzla+vuZCeh+jA8w08xgEG6GtIvirR/TFcQN
	QpI9/FN84DVMMnmsh1vk+GjQOvkIlMC2SkEAdzbSmQoIK78KCBQ==
X-Received: by 2002:a05:622a:180b:b0:50d:7f60:6231 with SMTP id d75a77b69052e-514a0a572e6mr140327501cf.21.1778498152513;
        Mon, 11 May 2026 04:15:52 -0700 (PDT)
X-Received: by 2002:a05:622a:180b:b0:50d:7f60:6231 with SMTP id d75a77b69052e-514a0a572e6mr140325861cf.21.1778498149809;
        Mon, 11 May 2026 04:15:49 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:63bd:c2f9:cedb:aa32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e7e45ff89sm124035075e9.8.2026.05.11.04.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 04:15:49 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH libgpiod] bindings: python: don't decref objects on PyList_SetItem() failure
Date: Mon, 11 May 2026 13:15:37 +0200
Message-ID: <20260511111538.60844-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: EjHGXavPCJYljb8SRhNL1NSewtKCr0wU
X-Authority-Analysis: v=2.4 cv=d93FDxjE c=1 sm=1 tr=0 ts=6a01ba69 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=trj4e-p4T7LK0LLqwNUA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: EjHGXavPCJYljb8SRhNL1NSewtKCr0wU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEyNSBTYWx0ZWRfXxNnxeNzHrpk3
 NOLUURkcFs2CjFhhsxRELlswnW571P9QRyb7zzpm7hjXWoZlnjVHr/Q2jNsNAPmVV1DwYgRjkd8
 ovlUXILQ90ki25y0LXLkxLAY2zAHMOEd5Kkx+4CLsXxiPuMBBZ4dGkhBtw+dgbiLlCmat5fE44G
 jtQe1szEYStv6orbsTkNnL4g4Ai9Haccrl1cR096XGsmyg+6Ok+0HA00DGUCdRxotDzIwPTmAJ7
 Muk3PujUj316L4P21OD8XEJ8WA7PbP/SOFb8xo1Qvx62CM/MW9ffr3LT0whYq1jyAgBHEqDOCk3
 fztGOXd/9jf3f1Aa+Y0Wfo9qlUTeBmLvyh9zmKOUWmOO8QllcM2Nb6g0oDFBHmjDlKVvtVxyMoh
 HmD0M0qBbBex4Qp2yN0vkiGmWx1nCgYRGm3Zi5poSbwrOoYGJqFXr4xCBPU5mvDDG/YuYr2h4kD
 v65DBGqYmgKIDREdPlg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110125
X-Rspamd-Queue-Id: 22EEB50C957
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36529-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.998];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

PyList_SetItem() steals the reference to the object we want to add
regardless of whether it succeeds or fails. Don't decrease the reference
count of the object we failed to add in error path.

Fixes: b7ba732e6a93 ("treewide: libgpiod v2 implementation")
Closes: https://github.com/brgl/libgpiod/issues/187
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 bindings/python/gpiod/ext/request.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/bindings/python/gpiod/ext/request.c b/bindings/python/gpiod/ext/request.c
index 46e07ae..7ba3dde 100644
--- a/bindings/python/gpiod/ext/request.c
+++ b/bindings/python/gpiod/ext/request.c
@@ -81,7 +81,6 @@ static PyObject *request_offsets(request_object *self, void *Py_UNUSED(ignored))
 
 		ret = PyList_SetItem(lines, i, line);
 		if (ret) {
-			Py_DECREF(line);
 			Py_DECREF(lines);
 			PyMem_Free(offsets);
 			return NULL;
@@ -194,7 +193,6 @@ static PyObject *request_get_values(request_object *self, PyObject *args)
 
 		ret = PyList_SetItem(values, pos, val);
 		if (ret) {
-			Py_DECREF(val);
 			Py_DECREF(type);
 			return NULL;
 		}
@@ -335,7 +333,6 @@ static PyObject *request_read_edge_events(request_object *self, PyObject *args)
 
 		ret = PyList_SetItem(events, i, event_obj);
 		if (ret) {
-			Py_DECREF(event_obj);
 			Py_DECREF(events);
 			Py_DECREF(type);
 			return NULL;
-- 
2.47.3


