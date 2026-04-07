Return-Path: <linux-gpio+bounces-34788-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iA3jBMj91GnOzQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34788-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:51:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D843AEA63
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:51:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 40BD73009990
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 12:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1A1A3B47E2;
	Tue,  7 Apr 2026 12:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rc202MhO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B6TI42zg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775133B27EA
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 12:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775566277; cv=none; b=g7WouRzXLS+oNXJC/hUEXNtzUtu/b/8LTR7dCcZTpt0NVm6X2a5+MW8ljb9xQrYn60tO+fQ3nFnGunSbSX2B4iVzA/7hEthdJqqH1tZfTbgZ6yO1u6aggErzkMtUsON3fMa8IrSX+NAKh5MQ05p9Pi9Z2Ul6JzUgM/7Cpu6BFZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775566277; c=relaxed/simple;
	bh=Wq6LXYdx2C1zzSqMoL7jWO6u6UniK6JNpQLDne3Yyak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kFsGBKajOQBo+DNO/dwL3QkWnuOicnVvh1/2tz5G1tm9YJ/ZHKoYCOYRrWkmnHSH49O4Rk0Bud4z1r15XnhBqxEOOaNWWUYBgmzNJTgP/gWQyFn9/HAIfCz0MVa37oUebjz1hcgdPp1EpsalhpG5LD2wDVCzt8ZDOjz5T9euY1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rc202MhO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B6TI42zg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376wGOM1405882
	for <linux-gpio@vger.kernel.org>; Tue, 7 Apr 2026 12:51:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fF3dZFWgguBwYjDjSlQIf7MvlW2wxPdsZISTkOgIvkE=; b=Rc202MhO9kS/dmWg
	6nmcqxUYxXuiYnr3Tu1lNXDRS1fZJxiE8TJGUo9YIv25a5G3b0TW8gYTcAFRrlf6
	qX29lGs37z0Oi51RR3jcw4QmvwbPuj/6lgyPsm5lgSnGPiQzn3y6bfD1NpI+utRS
	k2ZY9/gcxKo4YkgPl/tBxqd9uZwE43dTWZcSeTaIIzs5zCzjwuuDUVSMkKPd7h0H
	5xc7SHIY5AAgz+4e77+Lb0aNp3NtQQ0KBZfeoeLNzAEg6hvjS2nEftNF3XS5LfYF
	KtPhConoQOAUS54NHIwU3CxZFGPce3xjE6Aw9uYgxFm6xLXQpFWFuCFR5mTDYqpp
	LSW0VQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmratr5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 12:51:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8d3bb62cd2bso1403768885a.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 05:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775566275; x=1776171075; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fF3dZFWgguBwYjDjSlQIf7MvlW2wxPdsZISTkOgIvkE=;
        b=B6TI42zgzpSzoagrVJC3A/qkaHD9jVxkvlgx5VLvw7+BawZ9t8oy2kffEr7Jup6oNw
         GKzqQpRcHnBaivcHyPPD1T5NBKIqXVET6g/hvxDO/4f3p69Xmo3VbVwcaaBfxTlJO8Js
         cO/S1Skt6AZTpUPalPAc6KPshIfDNXrfK7nN/xR1s04O42uxtfBreZwvtN9VFF9Xb6Cf
         dgoRg2KcA0r1KQ7U3AKqexYVLkaz2zjbxQlBuUuKggDa0ls20X5sgsz2mDvTKPup1jAj
         X/6wjFNzjXKhSpRRmFseIep3h8MQy/+XTFWHP8gYP7KbRAjZSItrIM9i1ahgmlHFi+Rf
         6www==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775566275; x=1776171075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fF3dZFWgguBwYjDjSlQIf7MvlW2wxPdsZISTkOgIvkE=;
        b=lmj3bwwuDEr3LwAUOVq0jkXZwYOZQITP4GsWDOa6m5OndWUayH2b69B9l6D2wF83aA
         57wEO0pYD38xJYeeQNvsBsR30Fv42QzYWt0e2h1kZj8NZuGMqfF2Zm13kthTlZ7YLODU
         D/ClHHjPjL+oeXlUqsNKMLBfDGJQzq1l2ff/kYeFvkIDnfx3cjgeiTuJjhntnCkKF1Va
         pWDirJitCm1bO77+knmM7v7B6O5R6iIRRnxdPXmDMkrvC+IXnHn+zlHkSKmF6ZnwjtuO
         ht7d0WdRsGe3R2+m67kSxNo2Tz0XaVmcU0yf46jBPYFaRTYZAz0KlknMftv8q8SRmD4C
         WE0g==
X-Gm-Message-State: AOJu0YyrVKY4WK2qVg35TXpVLabXC3hfdcsjiE6vASC20jZG5wrwSbBq
	UpNsXm7yqA8vBirhhJFLotfDQ44yofqli9BFLLuGImks56AgwEn46Kqaok6T/GduiISY5Kk+mfP
	0N9nPnASuqmpeGEmkZGMJ0JOkeTqM5keZQ2iVdcdkyuo8WRZbA5oy+sjydvQWZtKs
X-Gm-Gg: AeBDiesPBtf/S52LiA4j4CNT7k8632xjSqEh1danDcCb4PdSn3Kdm730IzQ1M0Ym/8H
	vTMrI9cnlHykjO52ojpCKa7af1zgbrkljmjn0r6wAKtk5lZnxl4sxW0WaN0Dxt9EQmtjRgGidE1
	LaC3DwqqHfGzoDy6W+b2FbSmJUMpp7P86xtKQPkbaqMIL4aqabAXF/HMexfWHMwVeQc8uzbuM1/
	GwJDlY9U14NUCCM5f5SlxiZJH7mpULc/c6dr1rq+NqWeU77CdmPM+Xi6NctE2lk7SguqiPo01t/
	lrnICnq3wta2YTPQWZj4xbH3iVTK7CrryixVu8ZfN83f2Oid8MqN42iXZ9M/nVRIEu2+cc3Hn3Q
	oTiwvzGbBENNMduL69aR29LiGEeNDbGnXc1bqslsKFpEhVAGwadU=
X-Received: by 2002:ac8:7fc5:0:b0:50d:7f81:55ff with SMTP id d75a77b69052e-50d7f81587emr175939061cf.32.1775566274639;
        Tue, 07 Apr 2026 05:51:14 -0700 (PDT)
X-Received: by 2002:ac8:7fc5:0:b0:50d:7f81:55ff with SMTP id d75a77b69052e-50d7f81587emr175938581cf.32.1775566274165;
        Tue, 07 Apr 2026 05:51:14 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:b36f:5370:5f91:2d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e83682fsm577526505e9.7.2026.04.07.05.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 05:51:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 14:49:52 +0200
Subject: [PATCH libgpiod 01/14] bindings: python: fix heap-buffer overflow
 bugs on setting/getting values
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-treewide-fixes-v1-1-66c9744a56a3@oss.qualcomm.com>
References: <20260407-treewide-fixes-v1-0-66c9744a56a3@oss.qualcomm.com>
In-Reply-To: <20260407-treewide-fixes-v1-0-66c9744a56a3@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Kent Gibson <warthog618@gmail.com>, 4fqr <4fqr@proton.me>,
        Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3233;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Wq6LXYdx2C1zzSqMoL7jWO6u6UniK6JNpQLDne3Yyak=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp1P2z7GamdiXQ7z6G59BkyuVULCfGwV4cF5OPx
 HOD2SklRC2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCadT9swAKCRAFnS7L/zaE
 w82BD/0Y21tBzoezBYu6Gx9XLFKLEYwCuZNwIbZWBH28Oz8GEPCMBFELai4w9PjGQIYMmL0KhiS
 CgN+LZvo5NLxeT46Fugt5j5RmZQHFrhCle0QTJ7FfYMRWBPAer5ur/eICNIt3zKBhHNq/vaVXVM
 aStYATRFYuGg55/nCua6wdIHZdYrgZUSe1rLepp/dOBuf4wC3Jc4tlQMk/6dHCBq9mNZruwSx5h
 mzsVVRZ0xzySfELjnHBaB9ZTfTMZMCRzI8e/Py2qZaRVjHDW76nEWxdsBNvdUbSzlvytv/sMAxG
 0Qie8sLvNsscW2G1uDhHAv6v3EksTPCjQX3FopsANc2IkcvCg1/wlXk8RxV087AhKeEtWUL3m6J
 Ij/GLxqh46D21eIde+nt+CILkvUn1HsvBzwt1MwWObOKQGBsz7hACRgM/ZM1VmkiBEFPAIkbhgE
 kc6KNgJ8yIr/TtyqqoO6iJasrAUbGRMyx2AwGdqtI9q0kT4B/8i5a4BvXv0luI8tuPlwJ1h+3T+
 +SIK6XW1S6RIXXs4I0mTY4yQyoeFq8AYeKZmoo0PUWgwAJ4AU1B0F7zRXzdTKSnQGY4u+5h0XNg
 6Za1IhaOXyJD33ZWWHUbwor8MYP9bT6XAzR62ZbEqiG+ePDKJjvg8A8+VshS6HjXJvgNkCCN1dW
 1OtZRMWufaKGOLQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 5UbOPHY83oet54MuSIOhU118n3JucA5d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyMCBTYWx0ZWRfX2F5kVlO5XeKe
 Xuv3djw9zP9gfxohWKO4HBt5de5dXaiAB642NQgEmODfZZDs8OPF6gGLmit2Wjy9hxbRN2QGopi
 fg7tnmaoA7B3uZN77M7+KyrU8M91fC0wPn7Ry616FmT0PiruzQQxNBmZys2JXRlgG3NYl1ekGH6
 DUoeiA8oPQFoVhSOBw6PuBVZbfxs72NQr5TzrYGelfFuykop4kDjyj4TBEHnqjZRNWA03lEdTI2
 B7736qbH8SZl9R5zkgZBsqgIIwnZyf6kU0gAM6rQNQvHerhJqz3oOleds2LJvsAqnUFUHzfDmZA
 HC11OzUkxbwsDvfL4lbfumwj/4McRLKettVA0HwbE1MqSRPu3FB+hcM121kouSHTwLENE/cRrj7
 ie8VR8BIdV0ce9VDZlDkT+8nbnZ4m66v+6X2knXve7ZMgqYgZg+JjXsx03BIoVkOBSsPF1PLDeH
 vvqfHP63cIsU9TTdfew==
X-Proofpoint-GUID: 5UbOPHY83oet54MuSIOhU118n3JucA5d
X-Authority-Analysis: v=2.4 cv=D/d37PRj c=1 sm=1 tr=0 ts=69d4fdc3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=swoMWPR3S6byrfW0xi8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070120
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-34788-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,proton.me:email];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 79D843AEA63
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The C extension methods request_set_values() and request_get_values()
iterate over a caller-supplied sequence and write offsets/values into
pre-allocated buffers self->offsets and self->values, without checking
the write index.

If the user tries to read values for more lines than they previously
requested, we overflow the buffers.

Add appropriate bounds checks and implement test cases for this issue.

Fixes: b7ba732e6a93 ("treewide: libgpiod v2 implementation")
Reported-by: 4fqr <4fqr@proton.me>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 bindings/python/gpiod/ext/request.c         | 12 ++++++++++++
 bindings/python/tests/tests_line_request.py | 22 ++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/bindings/python/gpiod/ext/request.c b/bindings/python/gpiod/ext/request.c
index 997e6fcc65662f48b6767c89ec59cc12bc70b103..9acf828aec8c27cbed2767b76270e308b895147b 100644
--- a/bindings/python/gpiod/ext/request.c
+++ b/bindings/python/gpiod/ext/request.c
@@ -149,6 +149,12 @@ static PyObject *request_get_values(request_object *self, PyObject *args)
 	if (num_offsets < 0)
 		return NULL;
 
+	if (num_offsets > (Py_ssize_t)self->num_lines) {
+		PyErr_SetString(PyExc_ValueError,
+				"number of offsets exceeds the number of requested lines");
+		return NULL;
+	}
+
 	iter = PyObject_GetIter(offsets);
 	if (!iter)
 		return NULL;
@@ -212,6 +218,12 @@ static PyObject *request_set_values(request_object *self, PyObject *args)
 	if (!ret)
 		return NULL;
 
+	if (PyObject_Size(values) > (Py_ssize_t)self->num_lines) {
+		PyErr_SetString(PyExc_ValueError,
+				"number of offsets exceeds the number of requested lines");
+		return NULL;
+	}
+
 	clear_buffers(self);
 
 	/* Note: pos may not be contiguous. */
diff --git a/bindings/python/tests/tests_line_request.py b/bindings/python/tests/tests_line_request.py
index 8cb0f2c05d916f0641769b8c386d2a6e708896e3..bc85eba0ba358c39fbaca6677739e02ea7cc4fcd 100644
--- a/bindings/python/tests/tests_line_request.py
+++ b/bindings/python/tests/tests_line_request.py
@@ -676,6 +676,28 @@ class LineRequestSurvivesParentChip(TestCase):
         req.release()
 
 
+class UsingMoreLinesThanRequestedNotAllowed(TestCase):
+    def setUp(self) -> None:
+        self.sim = gpiosim.Chip(num_lines=4)
+
+    def tearDown(self) -> None:
+        del self.sim
+
+    def test_line_get_more_values_than_requested_lines(self) -> None:
+        with gpiod.request_lines(
+            self.sim.dev_path, config={0: gpiod.LineSettings(direction=Direction.INPUT)}
+        ) as req:
+            with self.assertRaises(ValueError):
+                req.get_values(list(range(64)))
+
+    def test_line_set_more_values_than_requested_lines(self) -> None:
+        with gpiod.request_lines(
+            self.sim.dev_path, config={0: gpiod.LineSettings(direction=Direction.OUTPUT)}
+        ) as req:
+            with self.assertRaises(ValueError):
+                req.set_values({i: Value.ACTIVE for i in range(64)})
+
+
 class LineRequestStringRepresentation(TestCase):
     def setUp(self) -> None:
         self.sim = gpiosim.Chip(num_lines=8)

-- 
2.47.3


