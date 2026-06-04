Return-Path: <linux-gpio+bounces-37930-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eIA9JwwuIWrFAAEAu9opvQ
	(envelope-from <linux-gpio+bounces-37930-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 09:49:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FE763DBBA
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 09:49:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VZBoUlQ8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Z2Z8U+/q";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37930-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37930-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4F0C6301C191
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2026 07:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B52213DEFE4;
	Thu,  4 Jun 2026 07:48:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6180E3DEAD6
	for <linux-gpio@vger.kernel.org>; Thu,  4 Jun 2026 07:48:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780559322; cv=none; b=sT3k6YI8WXYalv0FwACLX+u3KIygLw0xIAz+ffFpbR0Q2yZXnXeiZFu6rgKjzMLFzIIGzHwJLjnp08ZJtsxcvAhI3GRzKe6DGkZSV5G+L+V5tdWYQ/gKd8AVL7NrUmKOUAn5Jym009v/XikAJiDHP2Udam6PnRcNEJJCwMYg7lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780559322; c=relaxed/simple;
	bh=Bx4DJGgH1kt2iAdMO6i5y9BftRXX2UdupHb7yaHkHTI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HlZkJHN3j77v1w/ieDWjLaX0wJd9IOjSxY6nM9YP0foNO2ZmnwRej7MG2qTY8B0Pmev0MSodTq50SBoCBqDCbvWPiZL9Wwm8+1s6STeB/PXf6oz3wUjbXNnUBsNwFrp0/dl1vz3cK8565tfWJjcyni9E0HuQLXz1nYQkmvIJsHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VZBoUlQ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z2Z8U+/q; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6540nxPa313682
	for <linux-gpio@vger.kernel.org>; Thu, 4 Jun 2026 07:48:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fIQzKUbh7gUqojZ2nrps3yJrZrDCCzEv1j2+zRlbwMo=; b=VZBoUlQ8uSwsF5IA
	Ml40LVciv5XZbAuMZLq9y6dqQ64TT/X7kGgpo+aDlM6fRdWYK2VRDszKr6JSkGdk
	X395HFqDvQsor5xRE4/6zqGC9tLVpKestSNNZmCZ6IU1Phkn1Vbt5wUsmjaexJq3
	eLb7xH8RllPH5+t9TZ6c5yeMO5Tb0NAxvhTvgrPkthkIBGgwNwFVcU/1F/i8/tt8
	6lw5OoztgTm9KZT/NDaMUzGei8E80MnIrFLTXPNLrS3JgQSl2SeIKfPlP9pfgX7L
	NUqK1JMHNgk7dNNWQ0ukzPLpJO2vU9T3oGWM8QedVf2o5+66XuUoEVcWxUbqf4NN
	PYCB8Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejy5v1988-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 07:48:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517615db531so12447141cf.1
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 00:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780559320; x=1781164120; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fIQzKUbh7gUqojZ2nrps3yJrZrDCCzEv1j2+zRlbwMo=;
        b=Z2Z8U+/q63fVrHltfX6dIfwB3R92ffu+bEE99NWr9dFnXMEHZlPkOcebikN2xpI7S9
         6eMY4ggsTZrMZAM/6oIPNOjduDn51M6U6Ficlur5bcbhmz/X6qbCNyFz8RXZeTDRimDA
         ZloF01IjiJlVyL/teMlfOdzZT5TakCMfvUDtOomdCb4WiwKP63zxPf8RMjjSbyHM9fLy
         KnFp95Fx1gzYYBxFgDZ6EQ7fndQD2DnL2TbFhOQZ8gWSNsNWOGgFWZrbUsSyfqu9hrai
         /TzW03pRopmlrjJtSK74HrvvzVxQLIhiic8cmLNjCwKQrvGIvMfAvmL50PoB4c5aIgGw
         g/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780559320; x=1781164120;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fIQzKUbh7gUqojZ2nrps3yJrZrDCCzEv1j2+zRlbwMo=;
        b=LqGPjAk5jEpsIxhWEhEO2eKUak91tC7VsbACFGdEsSy7pMHktWgTASmx1d4uKXHkms
         3m1fPdvmF+k1t3Vop8+Sb5ubhuIK+vqoyQf9iDBvMsVaY2WtdnDZfw6676CwwG2YobP1
         mImdH7RAEPMKO+mCX1tAzVQSZJ//KWX0uC+U7vas9q4M0CH92c9VuWkGQXl5ZcMUFMgr
         l5DSABi7ozVLJ8KZ3dwb2oZBzMlX2pAYx2mlLYxhctfy2sF7u1ljk9GVljDew4kEFdWv
         nPPHXFTZejXLpvq7SJlNthCaAJi0Uj0C70UezyRxhmFoPt+nt3aW2ddi73vwdcUz12NQ
         4iYQ==
X-Forwarded-Encrypted: i=1; AFNElJ9cnUxICJC04VMDrY4eQaG0BkboCMXWhAe2Pe7XwclLepE9fsS5BZG/uwQsB1pNqRWOQZDfwD9+PJ1a@vger.kernel.org
X-Gm-Message-State: AOJu0YyE5Q5nrn4sKXRtAJTKphwKY2MEwYP03mv5BpZjv5Kru0IVIcT+
	4WRivgi0aD4wCFmoLoGa7e4SH8w0zhqmXyHPwHIRYr8iBPHLwWvGm55bc7Bi1l1dSuKNWbYrH96
	GDJ4vmclVRawvzzK3SXfZagJ3YvX71ZsB0KxnmDZUFNyILcf95kJ+XK+7MewK8IzW
X-Gm-Gg: Acq92OGw/mOlYWNIXztT6OMxUavSiV3DjsIhX4btFGRWh1uE5QiYYrg18aWktW82Jue
	HOnSbM0GisiRg27Q0zxqPgDFeSWklEboW+qPzGVuB4slnQBFWvx1b+9lcMEPB+38QQbfzRspocZ
	iCeMfsU40YUSUweHhu5O0uhExcolPNBLRD33hbf7g29bw9Qpec4QIj3ygpChjnjCrhQj1n4trZo
	u+NWrXvmg1iPN3wsUxhIt5pkpGvu39kDUtjsq3s7Pwyay//Rl1cydhEMBXoXqn3ZbkZnUOmM2Cn
	Bx/wUlemSy6g4kBjY+Nk2HzCbYd+eolLVjZW0ocTZCRE2I+1mGnCCldmZ/VyixT07BRjEMjCHjE
	JZ4pKeumWPOa+gPE+qhAWPzcx9rFzLkdNqKBStvVBYg0xy9crVHKzMC+dJTAwoI55yqxj8WyAMS
	28qfALBAo=
X-Received: by 2002:a05:622a:6113:b0:516:df5b:4338 with SMTP id d75a77b69052e-517786fe3aamr97651161cf.28.1780559319817;
        Thu, 04 Jun 2026 00:48:39 -0700 (PDT)
X-Received: by 2002:a05:622a:6113:b0:516:df5b:4338 with SMTP id d75a77b69052e-517786fe3aamr97651021cf.28.1780559319484;
        Thu, 04 Jun 2026 00:48:39 -0700 (PDT)
Received: from brgl-qcom.local (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b7d6b990sm71092725e9.2.2026.06.04.00.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 00:48:38 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 09:47:55 +0200
Subject: [PATCH libgpiod v2 12/15] bindings: python: check for errors after
 PyIter_Next() in request_get_values
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-pre-2-3-fixes-v2-12-781bcaf47475@oss.qualcomm.com>
References: <20260604-pre-2-3-fixes-v2-0-781bcaf47475@oss.qualcomm.com>
In-Reply-To: <20260604-pre-2-3-fixes-v2-0-781bcaf47475@oss.qualcomm.com>
To: Kent Gibson <warthog618@gmail.com>, Erik Wierich <erik@riscstar.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Fazio <vfazio@xes-inc.com>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1048;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Bx4DJGgH1kt2iAdMO6i5y9BftRXX2UdupHb7yaHkHTI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqIS21Tw+irqFWEXcgUj/newK8SKviQZ+EXDHnH
 A8j6eYt+r2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaiEttQAKCRAFnS7L/zaE
 w+FtD/0eu8SNjo9HYoh/r16gwmrTVTlSoNMGVKubNrPXG1KTd/wzCxKeeduL2IVQeQmuJ9qgla5
 l/IV2is1qB2QH9SnqEdEZqOY0BryBoZ/kFi1yBEhcX8aRiaz8kdOE7VxWrVtxEg5bpNN2YQfVjk
 fiks1HerbPwzqmAWIjaCPjJNo3QeN4yTzSReLc7gYaiCzcfr4DMDh6hwv4stKtVhEuSbkiPvFRH
 PA5L8QrbBxa7SXTZ/4dLbUO+R55crwDrUpYYQ1GIBzR6d2jCSkuqkcIXW6Z0dkQg/6N4qFIv10g
 FwyBE5Ok0CvjbMvvvjibvv7fzrU1qwMBKJO51IQ3jPE3kTz4ix6tBNnFQtvNnlvSwcPDI1wBxmZ
 NSWXbZqqab01JMX/RVwFtAgAzc10xiXQHnwZSRxhSWGM/0ji9DcSCREMLdDIIC3kPdL5c0p7EV4
 lFZqj2MlLPfCmND/bKKpXag5aVB6Blyu62zycQX9z8U2MzdfHJhlmH69f54mtcGo7//NJ7FU7zD
 1gkvYOkUG8xHqWqHNy4DTOlDwhdhjt0+e5m1ZqMd9feTMs0cNFNuSI4+Dq7bSAXOFiZj4qgcVmP
 QV8yWRjVCywKLlWGl1sCu85teZjfKzb4l8zp2BGBMxq0iMZ91cNAPrMQKOjvJ+vCWA42fhLH0/N
 UHuyUBsI0S422uQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA3NSBTYWx0ZWRfXzvkvmlZoF2fb
 5gkoJCeF53vq2yeqN3XWdQX7kws8oBaVg73UuFOdjD6r2i5Al/5p31S4kvIQDXKZkKSDBZjW03+
 hsVICEmnogqFPTtFslM+PYpefEShIkEJnHHq26qsl8eo/MqK94bEmRjk7/nvi/MfONR4148yr6y
 eMnvuyJaPHNCxnJpMel2UcpgqvqchfZj8A3pmhEGIbu0xPb+57PXSxlsjC9V+yKECKq5b7ba4eZ
 bW+FhOPeDYgQQyI91BhcnddLt8FkyYmC9qiHR+3CY4tTkItzF3iGXzU28wjSKyzJvqakqiGazLl
 5qRVKkRsYk3I4pt2wneHCCMzgAyAztDmyYbT2dz/Xj3XWdstMTx2ciaeGr8urvZ03yrt1MjcSbB
 Yyt0FI3Y7KBaWt1/EtXI/yKIJl4aKymM3qnQHd6BZvTrCORZlS3L8qtl/Rmcde674MeRiyNfFiV
 K3/rwARbx9DZ68mAOWw==
X-Proofpoint-ORIG-GUID: 1J5gxwM4DNBqjOLgVf6g1_Z2lQ2_VpkH
X-Authority-Analysis: v=2.4 cv=afRRWxot c=1 sm=1 tr=0 ts=6a212dd8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=aBIYUfOEhgoR9egqXYNcqA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=FAUPNU62ln0xYUfGZxAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 1J5gxwM4DNBqjOLgVf6g1_Z2lQ2_VpkH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37930-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:warthog618@gmail.com,m:erik@riscstar.com,m:viresh.kumar@linaro.org,m:vfazio@xes-inc.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com,riscstar.com,linaro.org,xes-inc.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: 97FE763DBBA

PyIter_Next() returns NULL both at end-of-iteration and when an exception
is raised. The code breaks out of the loop without checking
PyErr_Occurred(), potentially swallowing Python exceptions and continuing
with a partially filled buffer.

Add the missing error check.

Fixes: b7ba732e6a93 ("treewide: libgpiod v2 implementation")
Assisted-by: Claude Opus 4.6
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 bindings/python/gpiod/ext/request.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/bindings/python/gpiod/ext/request.c b/bindings/python/gpiod/ext/request.c
index 7ba3dde8421f05dc43be854dc4dc9e63aa93bad2..1da25f2f525c1b3559f1b4e282a8c6ac717c6a01 100644
--- a/bindings/python/gpiod/ext/request.c
+++ b/bindings/python/gpiod/ext/request.c
@@ -160,6 +160,8 @@ static PyObject *request_get_values(request_object *self, PyObject *args)
 		next = PyIter_Next(iter);
 		if (!next) {
 			Py_DECREF(iter);
+			if (PyErr_Occurred())
+				return NULL;
 			break;
 		}
 

-- 
2.47.3


