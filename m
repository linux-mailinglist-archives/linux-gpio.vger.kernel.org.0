Return-Path: <linux-gpio+bounces-37183-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JoFAzJvDWp9xQUAu9opvQ
	(envelope-from <linux-gpio+bounces-37183-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 10:22:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 77342589A45
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 10:22:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 46B6A302E7EB
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 08:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D6A137CD20;
	Wed, 20 May 2026 08:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g4ClvOWx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f1nFRD6L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4F8375F62
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 08:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779265320; cv=none; b=tgIlpsx3i9sdGL/X3j1Dc9Zt7VbTSy8ScO4flEk+HZ5Qx/wkbkabItq6SKGmiCEzs1Dx7uv8Uir/B0rpU30DkiKM5DUodex8Af9cQUBlwgZMIdmSpFHYq8d4wVgkSWUmGoV6npQzRztv+1TzY33J6UkO5HTpHXoqhbvTSgr27AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779265320; c=relaxed/simple;
	bh=uHESdCJVaaqQg66ue1kgOmBIiQYfXseQnocX9sdF2/8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=llHXxBaSj2qYxZkuqjvpB7vUqKo0VZSLN2ZcqfShy4Y/VtnyWZRpeIcq3tFtwedERR4s2GG3UVatZna+XWA4jt1PnM7KsQEICmtQb9sRNog0Sgjv9a8N42OHsaV4PfA3GA8I1NjzIIMWXFRW2QXbynS/PXa/120bp40HlARXGeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g4ClvOWx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f1nFRD6L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K6smbQ1725496
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 08:21:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iRxXceYW+ye/57CGt2L8cc
	DYPJ39Z0WwwgijGkL+MEQ=; b=g4ClvOWxGa5tPdvG8FfhA6dJohFjguMrBwLGnp
	SAJjBj/uIRJD/KaIBcHE7QABzz7oqKlbRJW3RnSwxERUCGtV2vdSyrM0lTs9ps8u
	Ta5VrMzpiV53svCwg8dDzS+NuUNVcxmIQSjg8g5x4kmcKJOovOAoMC9IkTmirh6F
	amAjdaGQq4ZF8kHsdwRQzuYfJ/4uZCOw+lngawJTt0pixMaSukD7/9wqozc/K9TB
	0nlAjZLjFycZNU2xGRbbXMIZPpf7sIYJ3IM4VjZXm/7M2MCnxU7V34pz1HRECKOr
	4wBAzmDkDg0M0+Dm+5skWl2z7r/+gos3aXQWKClek9GxvqBQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3qkscn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 08:21:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51494d74d4bso123309291cf.1
        for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 01:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779265316; x=1779870116; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iRxXceYW+ye/57CGt2L8ccDYPJ39Z0WwwgijGkL+MEQ=;
        b=f1nFRD6LqZSN/Z+FJomN0IANhz5up8DQgJdyTirjmklslkrTJsYNzjJr5VJXCyr1pb
         Mm7PUbUru8St3bFBGqMz3oYE863PfyUSorx/CfAHaDxmbMsSr/bsb0aLRJILzSRIwhT+
         X0GO8uBVL51mCFi/0kBZfdMRgq5ZAXSWPYjTGe2kBhggg3oEWxJGAEWDX2vVEvZYRgCe
         WbY4cup0h9OpJPBOyJJ0yHsLp5HdlIXZBLXpYLkO7vmV/u5x/O63IoMZFB9QXgjrCaPQ
         ffk0L7/s4Kcxfr+bJGvJfZhaUJOjffWbq9jm4SVzSfUHwq1bHqH4XPyrNqqR0bA23FH+
         s/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779265316; x=1779870116;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iRxXceYW+ye/57CGt2L8ccDYPJ39Z0WwwgijGkL+MEQ=;
        b=Kfqu/omzGPY+RVZOeq39dpdgJcvZKOrNxcMvzQjYWGbn2wgnOHY7Qps9BZa/A6l0lY
         thl8GQ1fPH57sCFLBQ5soCtAeWW4/RmFvTVAD0eRDC9ocGoTGRFk2YgDoEiPmxvzOMyv
         u8Hv900pBufYut4wsLNxqhxnPUlwAruG+qB7675lt+xIRLZUb4iEVGqq8k+u/S19yYii
         e7fVKoJRQjT3uXgmr2tTlQd7DbcXUY9DzcUe3f/sR8kf3KI0IHsFvGMtEyxMnuZt5yJ2
         1pwldWqxXCJSIRDRMCTj/8hOuVo8qb6Z4qvlS1xr4KpcrCVRuZK2H+gv/BMs+N0vU2WY
         pq5Q==
X-Forwarded-Encrypted: i=1; AFNElJ/oJdaFC5nveWOyRLAYwftXQSv62HVDrSbNHqBANqQE/c2ClELnklgMFrv2almxrjvDxyV/3GH4gukR@vger.kernel.org
X-Gm-Message-State: AOJu0Yx00dza0sGpWgWDin2jCSmngUz5eRRYWUppkK+tBTNa74jQYXfO
	3pjASKBJNGGR1/UfWDS4xdlQGN0bejdh9HSkVpV+PKDI5qYL1sfvzePm7im/RWYbOQMCEhOePmY
	lAuFM7Kl2mih8+Zo3jeYbBrwmDbhBOTgpToEWAKcylTYqaYLhXX7N/gfmiBdrDhQJ
X-Gm-Gg: Acq92OF/IHLRmW9kMZbg5A0Nk4Zqe7+PqRkii8U867/8NJ2XsAriJrDiGMWJ7/PWRSx
	QL5GkmK4RwihN80PYdOJU+ir4WgDjeH8yUkZkpxzQ4ixn0W2gjZUIoPhIJWtcgnJAFVIpVlKKs+
	vdraZ2WeVxi4Bdkomiztb88oxupHWvM6Do20iPi44jrJdc/1joiNerJmUhhIr0KVryXhTKAJgqf
	7duzhhV1MWBTzKH4TYg0eDkwN0tL1J+ivv3n4AkcGqSVpkCiHhGQ+nSDApSJVmUPn2YYz6JfECC
	ihFh5+tstF2lm2Iyn/83i3SEsCs9Wf9IiYk1Z2AlhbY+FSYHToIcB5w/ZsBSElnho2fLhabZM8Q
	+QnTyTrE6RiqW8D1TkB/ggUniNjJs+fTqyXt1NZ00JhN9psih5RE=
X-Received: by 2002:ac8:6a12:0:b0:516:6749:4036 with SMTP id d75a77b69052e-5166749619bmr176111951cf.22.1779265316008;
        Wed, 20 May 2026 01:21:56 -0700 (PDT)
X-Received: by 2002:ac8:6a12:0:b0:516:6749:4036 with SMTP id d75a77b69052e-5166749619bmr176111741cf.22.1779265315540;
        Wed, 20 May 2026 01:21:55 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9ec3:885a:6d78:48d0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768072sm51518570f8f.5.2026.05.20.01.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:21:54 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/3] gpio: add kunit tests for GPIO core
Date: Wed, 20 May 2026 10:21:41 +0200
Message-Id: <20260520-gpiolib-kunit-v2-0-cc9db39881da@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABVvDWoC/13MQQ6CMBCF4auQWVvClFKNK+9hWJTSwkSg2EKjI
 dzdijs3k/yTvG+DYDyZANdsA28iBXJTCn7KQPdq6gyjNjXwgsui5JJ1M7mBGvZYJ1pYe7bYVJV
 AaxWkzeyNpdfh3evUPYXF+ffBR/x+f1KFlz8pIisYlmi0FFKL1t5cCPlzVYN245inA/W+7x+Ms
 ZIjsQAAAA==
X-Change-ID: 20260326-gpiolib-kunit-d7f1b5541ffa
To: Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1398;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=uHESdCJVaaqQg66ue1kgOmBIiQYfXseQnocX9sdF2/8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDW8XRdthSXfCvaUNx81dJCc6HxagYtdhk7aja
 /0Dq7VBx/GJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag1vFwAKCRAFnS7L/zaE
 w+N0D/sG9HuyWscNV+wZX06V2tHtmL805A2Ro2BPfHee1KakifTi4Ln3i5yLMrDGdQKyfv61ByP
 UB8p6kMe2opqGvV3kiCTkTLOzH4mECxeBuFmP8xfhWLaEEkehnuDV2YQf9WZddw3qD3j3BghuSN
 RAaxzlVDbaDTl8zh2TGSU4UF71KqTftmWk+UvCEvOSjidnFqyw0XYglWWQOkxSpBNiQ9GIVhRkZ
 h1df17deRJOt4ZTjsa/yqYmcQyTK9tlH3VHxPl/6nnnHBAQMIif815cEfEp9TppxgGdM98Llw3w
 yChp/L2+zAlqt2hnVLL1FxWtA8CHqetmEje3WfiyViVFmxBvq0iH3uVKVl61oDSCJaMDRbWVEVE
 P4GWsucgF2p2/G2AnsfDuS+VRPfa7x1NR/Lw6IbXo9DY3jiH41RUcjUnQk2DYxpJGDK0Og3XsBh
 xO2jvLc69CSrMjdk7tUd/qk/w+MKSMOGPN41MVvK2zUaocfqJmNFhaMsH6uLJ7eB8Mtny39+vKh
 i6TyG/vzu0iyI3EBuMyxLrOyljkZSglZ43FBmfTZDltIAF2QftrjRVoJv8MLb4k6Wp8mg5yH3S6
 VuGGy5L6HbCdJ1BNnS4QDWOF0pujw+L3pqc/+bUvUwbHgv82b3IjdOyi96eAW2CD2PzEfbDQ3Oc
 S4QJXYFyA5XEKcw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA3OSBTYWx0ZWRfXzZHP1RGOgrkL
 ROimaGegCT0B1Uw965qx1AZR6KFmsgMDEPj99vEWQS/fPExxFw9IKmSKXEE+OA8SjOQx7yi/snq
 FD32Uhv8DJ0160E7o/n7DtR+CdfKJeoAxd7n4xd05eBopH2HFNSnGHdMQlZhBi8j0fuGsxpvrgr
 SyJbxWGspMk8O/7gZxnT/Og7YuaopZIvv51aFrgUqV7H12BQ+6sH/r1UnguvLtdBoF8cJtAqYHE
 g8g4C+EcGDi/PHzzldLucfJO2r/Sl1BgeueEXcb7hKNEsdt8G3HLRirdYpRpnsxVOdBLbDlmhRk
 CO1XYY5oDt36eZIij7rgBH3G9zy/AoyVgQr/baqhGfwLc7OnkekB1yhrnaWNFyrCF7ZvNXsZsVV
 HEdkyndPd6AeIa1Mz5JOiUMroE592mjlFIXnt/PwntUfnvftgUDTQKIAl3/C72w+A8V+hOI3oli
 9hmTf57MzHec6xkAqTw==
X-Authority-Analysis: v=2.4 cv=N9cZ0W9B c=1 sm=1 tr=0 ts=6a0d6f24 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=MtzmdRDdlofpVA7LM9AA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: wmpiegS5-vbEB3uJafbWU61P5Gw8fNb6
X-Proofpoint-ORIG-GUID: wmpiegS5-vbEB3uJafbWU61P5Gw8fNb6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200079
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37183-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux.dev,davidgow.net,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 77342589A45
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds a first batch of kunit tests for GPIO core. I intend to
gradually add more coverage for functionalities that can't really be
tested from user-space with the existing kernel selftests or libgpiod
tests.

Merging strategy: with an Ack from kunit maintainers, this can go
through the GPIO tree for v7.2.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Remove cases of kunit killing a thread on test failure with device lock
  taken
- Fix a platform device leak on test failure
- New patch: provide kunit_platform_device_unregister()
- Link to v1: https://patch.msgid.link/20260518-gpiolib-kunit-v1-0-131ec646c4df@oss.qualcomm.com

---
Bartosz Golaszewski (3):
      kunit: provide kunit_platform_device_register_full()
      kunit: provide kunit_platform_device_unregister()
      gpio: add kunit test cases for the GPIO subsystem

 drivers/gpio/Kconfig            |   8 +
 drivers/gpio/Makefile           |   1 +
 drivers/gpio/gpiolib-kunit.c    | 358 ++++++++++++++++++++++++++++++++++++++++
 include/kunit/platform_device.h |   6 +
 lib/kunit/platform.c            |  46 ++++++
 5 files changed, 419 insertions(+)
---
base-commit: 80dd246accce631c328ea43294e53b2b2dd2aa32
change-id: 20260326-gpiolib-kunit-d7f1b5541ffa

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


