Return-Path: <linux-gpio+bounces-37371-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFhCIA5jEGphWwYAu9opvQ
	(envelope-from <linux-gpio+bounces-37371-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 16:07:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD405B5D6A
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 16:07:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 17E653074C70
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 13:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D90BB40F8EB;
	Fri, 22 May 2026 13:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TKXcVIyq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UiM3wKDZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC7F407CE9
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 13:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779457353; cv=none; b=ESjF+d33U+q6qMkSAXKlBljMrN5P42vY8lkRweppRvhyvxKj+QUTvYd98irtSIVztNGsvqqftazEBwYNMw4g+nMoaLXV3VdyI/nLy0I+8Z/wheX7jgiqQXe4csz1p0nbxl3TYMX5aGPjRxN22K5lyPCkToIIZysi81qXoeUFzlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779457353; c=relaxed/simple;
	bh=3QhdbY+CCYZtYCHfS+wbbbRFki/DhpgeGMwKpTuQGcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RN9/yk7N9g6bGgyx/TdduSvS5bhh43CDSbe5gYDmebulttjN2eT5OrW44G3knUAzI4hRRjnrVpHnvsg6Yq0nqasPC+9KUVFtA1dyXiGBf619kqqa8NZ+geqT1OsgUCkVvCbOwFvbocx1gP4gJvpubYz7TuW+tfAfsiNBcC1dvNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TKXcVIyq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UiM3wKDZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8agMQ399180
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 13:42:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oZTO0NLY/beCR07aLpL/t7D4AdbPlbOmoaxCvBeaC9Y=; b=TKXcVIyqojxyi7DU
	m3oRW6xbVxGvKzxSjnki7jpNDDy2uY03xTPOYfUrV6eVl79HdTFBM3P19044jnmo
	tvTirrbwaEkjZucysgl1CDu+G6h6WBm7WF4jAR12vKqs+/cTXfKZahAje8WSpWmJ
	Xifslaf4xYUQdmrZ8j+Hje7iPJNK9dV+9ILhmSdhN4d8zh3t3vvKApZzTPBtlU7S
	gFB6enDtTR6l09Zii88lryLnYc7mY5+jzhEWCBlV8CmGUeV5yFhJt1g+BVsqJo62
	ra5cJNLbwLlyYp5TylHmHrxd6UZjrgvrezf4gOIcHOaPwi9t4Y2DoAjnxSCJKxBj
	oHgUVQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea5p9vh5k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 13:42:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516cadacf92so32709591cf.2
        for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 06:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779457350; x=1780062150; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oZTO0NLY/beCR07aLpL/t7D4AdbPlbOmoaxCvBeaC9Y=;
        b=UiM3wKDZxjt0qtC2Ewm2S7OZpQiDt2w4dHKDMS7zH4VH1EONVU2qihYBr8U3fsf/f0
         0Pq24wgNtPlNhN+OVq/T+mLbnCEC9mP2AljoA9GTvidNQNGOwygRnJ9xt2gmBxjal3Ha
         UvMys3ztiDXyPUp24S6SwAgczk8k1Pghd94h/GkoBRZjUlfwAoXPj7Je3RfnwS58Qg2K
         4DubOkG+WdcEmHJAztU/2T+g2W2iN/xErsJq+rpJ/TIJO13H857YSayoovTMCDbBBigl
         qYYfCRqBf//n2BpeIViSqKOmwaYWMbcUs3elvGdnkwh0yyfSKt3qRQzW1oUmUjGiBzX+
         qa/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779457350; x=1780062150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oZTO0NLY/beCR07aLpL/t7D4AdbPlbOmoaxCvBeaC9Y=;
        b=TTsbz/Rx4aHjai/8SSsaIpKrO8NIxPFgIe9hJAIlXSoqZkKzj5piOJjgIOhNNzAzor
         YgeYD/VaXnLRi7C80qDaGWtiFOGx/1g0jP/yF8Hvwe5PA2cBK2SGFgm1vbI/VMP0MtRN
         7wl19H2kevYJuIu97h9WNyol5J6exXXYEiqKadwJZvB4Z/l+cJjSJ7nrGJgN6J27N6vY
         ZSlnXS9Nha4j0xRRsYFP/6QxqZYIr0NK9jphorqM/B1CAEHpUZGVEySUDyGyjaLJDOfe
         805WdbGaoUYzW44hSNXGj2gGfPyeTzZujuyKUgtOzj/qzA5wP+l+LaKTiIGJES00twsD
         ma3Q==
X-Forwarded-Encrypted: i=1; AFNElJ83aJ5SGzjKR2K+OKUj0Y1wtUG3WY0K85XSzEMuNxRUI6uNQXaN9d3QYiMJxsnVda/EIBZTAjId2dBl@vger.kernel.org
X-Gm-Message-State: AOJu0YyDIYrrynunEWIyY4VLguEEaVvgtUUg/8Q/xrv9BG6KA3/4dTh/
	xYtqM9TNxGTdpYW3tsvHEp/eK67tQknkPzR63TqGj5aXmY9hCsqOE5n7SHSRmAfu+o+sIrZZsDN
	/Fc21f+M80pf+n8w0U0Pq4KVHulEJhITw60dzBD1pafxMoso3nrNg5ytfPJtN3J9buzPMwiW4
X-Gm-Gg: Acq92OFT2+wcFt4iyjFKNMtaH+OT/+bA25rQxnl20zEEepBo+ZFGGMSBCE2BIo/zAuB
	COzxOH3CvuGkG6BZ0iQQNWzBXmviT7v4diQFg5WyB1o5ZwPxLm7d1/fkS9eqFaGgVDhVqhuGtJ6
	hGhaNlSCphxZqqAuHJY5WCpYa9iaquhoKNNHtCmsRMit88GgCXD71zdnjsZyTbxImid9sTwx+96
	m5zrRpgjAgT5h2PGvl8ifq+zJwgKq/+HdLjbFYCu6JdgUYrglPGb+/uvQ4TcCoqTq020I2+6/qn
	F5SKun7PAMNeNJC8tw4KqYAJxFbEWnNQez6zS639SWQEYa0UcuBV7d3WbRvp+rwQ1CzatJE5Zhc
	/vcz4hD5s7Wu/cGgD2pB1Zc+gM7cQSwzKsVFYDaeZqJKlN/8FNg==
X-Received: by 2002:a05:622a:5811:b0:50d:863d:b50e with SMTP id d75a77b69052e-516d429352amr56069721cf.3.1779457349560;
        Fri, 22 May 2026 06:42:29 -0700 (PDT)
X-Received: by 2002:a05:622a:5811:b0:50d:863d:b50e with SMTP id d75a77b69052e-516d429352amr56069251cf.3.1779457348978;
        Fri, 22 May 2026 06:42:28 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:2fa:6280:a48f:fb37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9f548sm4886546f8f.2.2026.05.22.06.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:42:28 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:42:17 +0200
Subject: [PATCH v3 2/3] kunit: provide kunit_platform_device_unregister()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-gpiolib-kunit-v3-2-b15fe6987430@oss.qualcomm.com>
References: <20260522-gpiolib-kunit-v3-0-b15fe6987430@oss.qualcomm.com>
In-Reply-To: <20260522-gpiolib-kunit-v3-0-b15fe6987430@oss.qualcomm.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2738;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=3QhdbY+CCYZtYCHfS+wbbbRFki/DhpgeGMwKpTuQGcQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqEF0+V3akSytsAqDiyBviKoNYvmGAXEDMYftgB
 jWSaXszSdyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahBdPgAKCRAFnS7L/zaE
 wyXWD/9lW6c8aNvbsPH3hxd+JqTM2UAC9fH8BVhbM/z/Gl2SrM0OJlO/ZyUE9542ABu/EYvHlRx
 HEpwVaCLMCEaNiD2ipPTYigMMouaMPBIVd5r3sPer/jIaAX1adFA7bnagHitgAxfx7AogZ5SJW/
 DBgsCtDLXI03hG/77TXhrVg0p8Py6wphtw/TO6sXuWNdpOpBz8Dt9EAHMb2W0OUCcGHteaoPJ4j
 NbJOvHFjP9ABt8dwXYY/MM2fDjffwL2+MduK62GMrzBycG6eFbLSKgIJznjSzqdnJhiXGGwFc0f
 Oh6RGPSCELIU/PUO/iWVEt/8c/RZnbZiIaFMbktTjZb/6dfCoGV8oQoo5rmUrFCoRYYWaECZtbK
 bRqAGf/FZWiU4/wtlvMRApxPaKjNp2G0vdkFqmSmDEHDQDvL4L/wDnkWZQb7dKBODcdvkdPgVeX
 T0ulkxK+RALChD+1i/cYKli7u5Y4tjxajAR2gf7DzDYoeqDBKYL2bz1M95B81W1rY4AeNbHnY+i
 WTto+oL2nQIh0nZaMq1Y0NntAMbM/O6hTfGIfbOJctTRg32RhsncSyJtosayUjYvkCUa22x6K9k
 FPeJsdxFRRu4SHtieD8tym9XmzpS+T4x1Qcpsv+P4Uuh/PfjM8JZIImFadBtyh78U6sJ/sXiraQ
 f0frZipWwDDt+iA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=DKm/JSNb c=1 sm=1 tr=0 ts=6a105d46 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=kmOvhMkJ8j3s7cJ8cD8A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: OynlgjzQh_8q1j9jjuGkVHDgsLDUsnnE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzNiBTYWx0ZWRfX1RbGxLxfwlAe
 5Inllue9TKkv38eq4bNyhIAiHlROUhmCAhFExGQbzd70VCUhRpxIMmseHrhdk7N7nh/Ljv/Y27a
 xjJ3AWbcT28mvJ1v+b+dVhi//DsVqsAHQzmXrJNjIoVV5gjIUsq8uhStTvAXhmBVoP9irm07yn7
 rlk3us22glIMYn1dFKOOMa5Aw275oya5ZVPY6DvLFq9YJ8u6V/Vpi4rDmF1Ub0oz9tn9vaDOjrh
 HYh13LAerDYyEvo1VVtwVeZbE9mGsS46tKqgAzI0fyKgYb/0WsdllVkS+TazpIlRiaGsxuK5y67
 siA7nxNKFNgMv+5FZPQUK5remVmGZTHbKuYMcBUrgB5u7XvTxwtk4cKRw/4+93Qdd8rM8dbmhfV
 a1KE+L4kL/JyO5v5Zlib55uu1QcLx8Mkwv5i3kNT3OjrZM1YZSuy2OnMyurW2eLcD+rjE/dCgDU
 5FWy4GrscuECkp6VsDA==
X-Proofpoint-ORIG-GUID: OynlgjzQh_8q1j9jjuGkVHDgsLDUsnnE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220136
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-37371-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[linux.dev,davidgow.net,gmail.com,kernel.org];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EAD405B5D6A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Tests may want to unregister a platform device as part of the test case
logic. Using the regular platform_device_register() with kunit
assertions may result in a platform device leak or otherwise requires
cumbersome error handling. Provide a function that unregisters a
kunit-managed platform device and drops the release action from the
test's list.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/kunit/platform_device.h |  2 ++
 lib/kunit/platform.c            | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/include/kunit/platform_device.h b/include/kunit/platform_device.h
index 8cad6e1c3e7efba862862b579089f2f317784a73..eee565d5d1d35c1d1bc82b45eb91d21d00c68428 100644
--- a/include/kunit/platform_device.h
+++ b/include/kunit/platform_device.h
@@ -14,6 +14,8 @@ int kunit_platform_device_add(struct kunit *test, struct platform_device *pdev);
 struct platform_device *
 kunit_platform_device_register_full(struct kunit *test,
 				    const struct platform_device_info *pdevinfo);
+void kunit_platform_device_unregister(struct kunit *test,
+				      struct platform_device *pdev);
 
 int kunit_platform_device_prepare_wait_for_probe(struct kunit *test,
 						 struct platform_device *pdev,
diff --git a/lib/kunit/platform.c b/lib/kunit/platform.c
index 583b50b538c79599ebbf33e261fe2e9ced35efa9..737758d710b2839fab29c5cbcf3bc5ba00e20094 100644
--- a/lib/kunit/platform.c
+++ b/lib/kunit/platform.c
@@ -161,6 +161,39 @@ kunit_platform_device_register_full(struct kunit *test,
 }
 EXPORT_SYMBOL_GPL(kunit_platform_device_register_full);
 
+static bool
+kunit_platform_device_add_match(struct kunit *test, struct kunit_resource *res,
+				void *match_data)
+{
+	struct platform_device *pdev = match_data;
+
+	return res->data == pdev && res->free == kunit_platform_device_add_exit;
+}
+
+/**
+ * kunit_platform_device_unregister() - Unregister a KUnit-managed platform device
+ * @test: test context
+ * @pdev: platform device to unregister
+ *
+ * Unregister a test-managed platform device and cancel its release action.
+ */
+void kunit_platform_device_unregister(struct kunit *test,
+				      struct platform_device *pdev)
+{
+	struct kunit_resource *res;
+
+	res = kunit_find_resource(test, kunit_platform_device_add_match, pdev);
+	if (res) {
+		res->free = NULL;
+		kunit_put_resource(res);
+	} else {
+		kunit_remove_action(test, platform_device_unregister_wrapper, pdev);
+	}
+
+	platform_device_unregister(pdev);
+}
+EXPORT_SYMBOL_GPL(kunit_platform_device_unregister);
+
 struct kunit_platform_device_probe_nb {
 	struct completion *x;
 	struct device *dev;

-- 
2.47.3


