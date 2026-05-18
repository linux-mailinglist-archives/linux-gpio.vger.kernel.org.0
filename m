Return-Path: <linux-gpio+bounces-37067-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFNmEhIiC2reDgUAu9opvQ
	(envelope-from <linux-gpio+bounces-37067-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 16:28:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B82D56EC20
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 16:28:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 86B18303CE89
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 14:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A8C148AE3A;
	Mon, 18 May 2026 14:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NoI31mAd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KgDJVJS7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57C348A2D8
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 14:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779113808; cv=none; b=cxCxppWoHpfJlTKrmuijub+5yj5065AU2EzIk5Z8J8ONfF5IE5wOK3t2BkRUy1Ct+oYsTSttv5Fd1Bi0P1ZBpsuU5qZpVtCigXKToYooLuF1Vht9eBqutN7H9blMFF99izgHIt5OEU2jkCkJN5N2CRK+4DdgNPlv2ilsR14CtIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779113808; c=relaxed/simple;
	bh=Edd8Loy9LT03pLD/2li4NPnBeF+14xrJKrAhxzpnHK4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uXJh0WMkynZta7vCiow97rOS88QHvsTUSPQWg/ZIzKcmt3Oq1xn+92TH1lW5ek2xknyrGpF/3mQGQtte+8DyLYsHFrCs6Md+aqA3UtytdxXYaFuR2HDixZ6haQqjbi0eS+Zno9YlUhNWDfjXWDvqJ6KolJy51sdFfooI3zbBnx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NoI31mAd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KgDJVJS7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IBwOBk1251996
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 14:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=n03IPwQ5AgDSCSatTOhfNg
	VzATjRS9KB7SNuggiIM4E=; b=NoI31mAdR3Y5gLTRM6ZBvXhghViNECLAEDVDlM
	VVhPswQPDitrgD01PtvSWp2l2p9prKCS2HFoXU5yT51Tm0SwN3ndy91XbtPPRQ+E
	1O23GA9TeuFvH+T1OPVMQC8nwsTvxUMzRVGrpnuLhKMGAt08S5/a3BrVwqAZHTBm
	wOduuMgOYfnrb3U/p9jLEo2SGH8iOrXBD6+bVAF/TByFdaZF0M78Y7uX3yW278Jj
	dawkDV+gehoT0cRn7yFPdN08VNb6MqFNecx0fzF5XNzlT2BMvWt4eWP7zKhwMsGL
	Ch9Z8xWhX6UhgBXGiwfKOB+n5GNW/PSWRLcUsWHICFhiNUwg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82c0ghh2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 14:16:45 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7dbd4fe0e15so7116715a34.3
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 07:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779113805; x=1779718605; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n03IPwQ5AgDSCSatTOhfNgVzATjRS9KB7SNuggiIM4E=;
        b=KgDJVJS7u01plqZSNlu7kQl2a9yTEo05bm3vgQeFlicGEL5uCL8aO/5/vxzrKo1UE+
         GQ4Xgod9y2fXQe2MzEGJJvAPMwI0qxTkAVTan/GGsywM6ND6fnaJoPQEfnK8zu3n9JWK
         b4+WdwVKNi8WgSbrAFjnNmAFdFhR+mdr8D0xPfX5Jl9PZ3zynTp0qFmuUhtRheTm/szs
         zbXA+4M56nr9RQ68T4vm0Bdgt4J/3zX1jYol9MVe90cpkdRkRlhV9SYkFJvbZJU3S9Mz
         VY5uZRQbpYZnpk/8GGVHwhO+g10sfSLw8XGhUy4f8Sv1bBsoV0C7+A+LHILda6i18eer
         wIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779113805; x=1779718605;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n03IPwQ5AgDSCSatTOhfNgVzATjRS9KB7SNuggiIM4E=;
        b=EnZvMeJHUhAHiB2BWDMtfBPW563MDsb5yTFl3YBfjSZsaRl4qh4salPoQdfUGezQcA
         91ZYN4Q+v4k990lU0QAB8SDDgXX6MrCdeppwnA/KT1DKKcyNxa45scIGo+vEWbT00+xf
         qvY0w1eZGN8WpMv41kldg94Zp+MEHGQ3f51wzKepgrwlzeQyJt53y5fABjlkmPJILeB0
         Kkv1dGc5NC6f9GhQj6L6RzOaxe/wAPDKW1fF5LZWWik6RLD/WZ7hvkdQLpYkQG0eIVmr
         eeMgIB0VrGjSs1Qz/V2mS1kwlyt4MLHmI/TCXfubGwwj/3n3fbzGYepAKSOG9MV4Q2oi
         fDNg==
X-Forwarded-Encrypted: i=1; AFNElJ854gZwKMn7GJHhMiw+VlKbVcMpg4j0f5zRhDVe6R7jucB8pVxVFj+nmSueNjhSAqV8wL/Ss7/3L6X2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6U1N9776v3EgCXSPQM+BHas9iaAPPNglievjf96rIriVCqsF2
	iceU/L/45+KIeSEBFnI3tQp1/knIebGck1cbQSj4SoQwxldFZys/ofNf6TXaCFFQncoPWtprzlt
	inVODwggLyFOgMBdITcq2MsHI+N3L+z2dzXCDqhZnJEANwlN109RJqxLTYhb/UnaK
X-Gm-Gg: Acq92OFo42VALevU95Qi9UvDAWsK7pCcSbM4CbqtWaSKEqU54CfH+meJgr0s1AgM9wy
	smS3/h1YHS0UBqU6EfVuXNE0V+rblT8gtPa0EM1f0A4GfgLPhYXjIghjM9XczpfaXjyNcMdoJdK
	fvt+4Kw75bkWglKVq9iWri3lZCymXPMInbS0xgSzn8wgqHHXkiSrL7SuvieDXpX89CvuZ2fF7AY
	/g1faSnvaZHrHQY6pU4OlidWil9gLy7GRqLuZjFcFGnO4YxbVAY4Be2tiFjzIMUkeisBVnt3d5q
	HO2u4swFQu5f8mF2gdRqowfEmxtlEGHTV5EOuYORlfA9tLKNDQTQU0N+Juw5JO31DVGymydwtSM
	k/sg6nbzxzYzIk5ygfbD9z/UXDrbxLnxEyBGnODWRtRaJaadf5g==
X-Received: by 2002:a05:6830:6312:b0:7d7:4639:43ee with SMTP id 46e09a7af769-7e4ea071964mr11106760a34.3.1779113805155;
        Mon, 18 May 2026 07:16:45 -0700 (PDT)
X-Received: by 2002:a05:6830:6312:b0:7d7:4639:43ee with SMTP id 46e09a7af769-7e4ea071964mr11106710a34.3.1779113804694;
        Mon, 18 May 2026 07:16:44 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:1337:b6d0:456:372c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feaa2949asm119371225e9.1.2026.05.18.07.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:16:43 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/2] gpio: add kunit tests for GPIO core
Date: Mon, 18 May 2026 16:16:28 +0200
Message-Id: <20260518-gpiolib-kunit-v1-0-131ec646c4df@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADwfC2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyMz3fSCzPyczCTd7NK8zBLdFPM0wyRTUxPDtLREJaCegqLUtMwKsHn
 RsbW1AEiWt1NfAAAA
X-Change-ID: 20260326-gpiolib-kunit-d7f1b5541ffa
To: Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1031;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Edd8Loy9LT03pLD/2li4NPnBeF+14xrJKrAhxzpnHK4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqCx9Db+8eE7GKXbl7wZRJ/T6B66/kgynFPXG/c
 pMFP7A27zSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagsfQwAKCRAFnS7L/zaE
 wy4BD/4ma6qQ45geCLg7W4rwuUqqk9lEJ1qpl1o0R73mDzooB2gRO+l1ncZWJ/BwMsWU8/MKYAb
 xYRBx6H4Urd8C12caM+ld8jTIsKSY9qPMGEsBZ1n1+u/rHgJixvZqWSRVf0e4SqSCopWSmsbuZP
 m8vxUPnidZYmTmdDOjroaecoj+iQWyhu3ufZU8+7T0s5pB70plpqf1abmwHXKB0l6rCLHpTw843
 gOkGrcTQa/IjS8s3BJ1ncR0GWTmTri9c+9m2AzQfWRKFDsdkqWeSbJ/3ljZpAsyI4xHkSyQK+T0
 wb4aHTrtQhwjurENZkLfxIuUhNkzsmTKGr/SN3+QjhAk+Im6/+bI/4GImhkFCAWlm5bpwdnVXVF
 tA/9W4lQtwDZKysJhdwJ4qJMmavyEqBXJkONPeROzVoy+jXfQtlt1pJVACU7PZhLuTrfNayDYVT
 rn3p+6ouVYzvaOGk3sRXOWyhwWa58oV0aAN6LsB5/qJP6BqA0Wk2yFDyXwRXEMi4JsLgV3ujKji
 iXIMQJSpqUUKrwl8alRf5iHHaLvTfmjdGte6jg71cb6u+Z8objk1m83AqhmlYuthfQKTR/ZJvkP
 FRDNmL3oBZZCBe1KRmpBUtc5pCqsi1HhCbgdbi32QYuIs53qubPPnOg3eQfClA4nzJTtC5AYGa2
 HJecO7pL7AvHT1g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEzOSBTYWx0ZWRfXxYFwC9HcZNhx
 kfb33tpBhtF6Bb3JD+6PnpGZg81uOr+gsvFR0QxpI7iQ1Sq0KLdvaSflMlskG0qYgDnl9qvOmrU
 Bl3bIxR1ptHLhLV/9/Z700pvVURh3ae5MA64Ox134aCjzf1uX0GwTIfr49sR5KtvuI7fJ1qGgqd
 84o7NNLOLMYrp4FsS7tUF6Xdv4pqZtu4Ezwtwqh2SbydfAqsx3iqg4ZmiL5Bvxhp6PKTyyVsGfP
 Yc6cdrszVRrqhDOcY91tcGIO0ddHci4MfhaSDIAVXolkOjof4WorgoOgDfPtGHl/UMVi8QhzlK9
 NT4gyRgjbqGi6xm9eTMKWvUFfkwhG9uU9eheM4gEJjLIfif4PS3p+2X4n1hzKtXplrUCtOXpQdH
 xsEtBa9WTWOEUy62SFpC/rtn+lw9ZxU4TQKcQPa80XpVDSKZj+6BmmMtAghzC/yumdnlCdhwtCV
 sS+eRHycpLEJmPCEitQ==
X-Authority-Analysis: v=2.4 cv=A5Jc+aWG c=1 sm=1 tr=0 ts=6a0b1f4e cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=MtzmdRDdlofpVA7LM9AA:9 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: hJhe4S6VGSSE0pKBSX9ZjwB7DRMMiEuP
X-Proofpoint-ORIG-GUID: hJhe4S6VGSSE0pKBSX9ZjwB7DRMMiEuP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
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
	TAGGED_FROM(0.00)[bounces-37067-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[linux.dev,davidgow.net,gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 4B82D56EC20
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
Bartosz Golaszewski (2):
      kunit: provide kunit_platform_device_register_full()
      gpio: add kunit test cases for the GPIO subsystem

 drivers/gpio/Kconfig            |   8 +
 drivers/gpio/Makefile           |   1 +
 drivers/gpio/gpiolib-kunit.c    | 354 ++++++++++++++++++++++++++++++++++++++++
 include/kunit/platform_device.h |   4 +
 lib/kunit/platform.c            |  31 ++++
 5 files changed, 398 insertions(+)
---
base-commit: 4a1989fb6514ca2a4b157ff4700bdcc8bdd9a978
change-id: 20260326-gpiolib-kunit-d7f1b5541ffa

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


