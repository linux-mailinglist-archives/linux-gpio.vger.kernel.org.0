Return-Path: <linux-gpio+bounces-33837-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGlqK3sjvGkptQIAu9opvQ
	(envelope-from <linux-gpio+bounces-33837-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 17:25:31 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F98B2CEC36
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 17:25:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8772632E45F2
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 16:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA7B73ED138;
	Thu, 19 Mar 2026 16:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DszeeWBC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I8Q6TG5J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD4E3EC2E1
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 16:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773936686; cv=none; b=VRPAmbOOM7Hutl5HgKoKBMFRphb5nDDmOggQFVkHntNmCdF52kJzJJMw+pxZmIXcJl06VkhdY2FQ4hHqqPNUwXz4ROXY2OUT1X8EFSASq8aSXU8OmzWT0va2bSYIdYGTT5qEc61aPIRMRsPVWHW9pXWDcn+U88C/wIaO1QgA5Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773936686; c=relaxed/simple;
	bh=SuFvkZu0w4R7ZzUnSsrxLWH1/5TACM1SQa5YDDmP2pQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DKg6HBjZpZmND1cO8gBYJrbq0uJLmyiMJjxOBdUVxpRoaCmLopSBQjMTE0wj539qVkn1amQt25MSHi9zgCk7m1ZtAo+IfVHH1RVpcHZ20bPyiF+SToOTm+ayIf7HnybOmYw3JfIflkAz4l8WFZFhEifEWFfc2CZCCgPd1lyi6Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DszeeWBC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I8Q6TG5J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JEVFgs3368474
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 16:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tv1Us6Me9dZWqbW6Qkx0ocwvvBPp2uJQA7v4bCY1YUA=; b=DszeeWBCmzfanmtx
	RG1/RqCTbFw8muaPbkeUckuNOKHIrNvd3i+Y4crLPS7+Xs12CXgQ2nLNROho2PiH
	zCuYTmpUXqRWu4YRECceT9nF0BVqqg3xOF+TYWdHoJ+MpNYzE0YW4xHASEEND34i
	ziIl2UB3A/tfTQ9xTKXgI/CIE+J37tsueZMzGRimjiAAmCkNfWnHRzyJdKFeL9Cp
	d2XyxuYIg5Afmp0W1nqXPakZyyzlIieToeKtvo5jeRP4h+VzNcWfkh+5sNAwTobg
	EkW6pokLRzn6bhU7NRHv2414lFFFiiwOhcohEcI2dR1m/hTUgW70dl5O9QoZCY8u
	ndEaPA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d00f9kvtm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 16:11:19 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5f934f736d4so1553142137.1
        for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 09:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773936678; x=1774541478; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tv1Us6Me9dZWqbW6Qkx0ocwvvBPp2uJQA7v4bCY1YUA=;
        b=I8Q6TG5JjZtgTbc0zvMwy3A95fo+gH5vFmHk2CpBl2V8HrXKBoWD72mAQqRK4MrG/j
         5Tdqhpbn8WVUnRZaIBTIH64lVO7vlKj2aAvqJHihBVk2XSXtQiuMz/dY8Ng/PEmucHAY
         fBn0Qnh8jQVJQNglirmrgmKr3P+4ZhSyNi4zh29Cx/DR9m6C5RJovrRnjYVN/8KKTMOl
         sLgWfHgWUrdSRtZuxsXhnbkidq10ZFAAVSK+kXP+14WVssXwCFmUOblEjsH+vkius433
         kELklGfj1hF628VrGvN17Zgv780BLDiPYj4TeUOnaKAHBy3sHjUWvjQ2bxMRhbVq854O
         +dBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773936678; x=1774541478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tv1Us6Me9dZWqbW6Qkx0ocwvvBPp2uJQA7v4bCY1YUA=;
        b=d+b4mA94NYElu8A0Nmsw2abLndnR50W7QV5/NGnF6KK8+vuDB42JlmqM/Gqz0wGbgk
         BnIkH3KXf12q+ms/gdb7RDpdEBO1940yGlih///V9ueht7hFi5L39IJ5UZGxGue6j5Xb
         fTKxZFwWe62th7YK3ADKj/G8fGTbNMJ/2wPOkSZbuAXVoQu12Sb2kGBly8RGwYMN01e5
         32FiATOjeH9Z2te48YVG0L9meIapghrPFIGH/oAB8WWQsK7MMNG/YxmVTgYEfBhPlWu2
         F+3JSI6yb5t6CW8yJZtCBALWADDQTvPN2SFg45thJHoJ5uQ4R5xHOVOJAFcGZy+4tTu1
         bUfA==
X-Forwarded-Encrypted: i=1; AJvYcCWYAjMSdUfWUD3dMfpet9Ul+cy+l9h5IptZdBfozMhmm47XHtJExE2cL8EXbbVhPQoE1HnihrqB8cft@vger.kernel.org
X-Gm-Message-State: AOJu0YzQNSliQVNLCoKbvqrKHBl3IoPlQEOmiqhirpq7p42Jgw4kmRf+
	y43IyWVKZs8OFtsdgBkxlJtzJ7fDWRcp5zx1feH8ob/HkTd3W6iYkdUJj7OvWxk5pCVoHBOiHpe
	sxVidDYAseq7kUg69LppOOLm7BOOOeiqtNLwDNYQakg6liqovRJx0q3wcgilOBNvC
X-Gm-Gg: ATEYQzzJkqU5BM6jwUXTooMXl3ECYLdGLDFshlahqbcmPxjv+tw7X1rYYaL2z0ogiHA
	NM8jPnhqklBprblbF2Bg9Oamt6hf33tME4tg3KuFJwN35HRudpdaM6UlC07iACGnZgGY9VPcnzK
	o0HoTDKZyMtiZDAe/mQGIvrM+CKpVavOA/X+zr2aV9qbef25etBHbo/4IXVU3upV6R+7unGatvY
	kW2Fe2LxYZOpt22K9n2+P9uwtWv8fTxCkHch26maWvvM1Erk3YNhdbXCApBwQvXfpnuDHd80Zjo
	y6E4JNJKqDB6DP9QKnOzLnkA1qIvz7XJkDCAiFvq69HVk6NCKtIFrZcaWjbncv091RS/By2PIRc
	cfD9YjRyf5TpMU6H9gnmmhuLydQRSxpz72sz/7zfm/FlL6uARC8Kd
X-Received: by 2002:a05:6102:5a94:b0:5ff:cee8:6620 with SMTP id ada2fe7eead31-602aeb00f67mr62191137.11.1773936677981;
        Thu, 19 Mar 2026 09:11:17 -0700 (PDT)
X-Received: by 2002:a05:6102:5a94:b0:5ff:cee8:6620 with SMTP id ada2fe7eead31-602aeb00f67mr62154137.11.1773936677349;
        Thu, 19 Mar 2026 09:11:17 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9d74:8015:408c:d719])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4e5495csm83756915e9.2.2026.03.19.09.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 09:11:16 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 17:10:57 +0100
Subject: [PATCH 4/4] platform/x86: x86-android-tablets: enable fwnode
 matching of GPIO chips
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-baytrail-real-swnode-v1-4-75f2264ae49f@oss.qualcomm.com>
References: <20260319-baytrail-real-swnode-v1-0-75f2264ae49f@oss.qualcomm.com>
In-Reply-To: <20260319-baytrail-real-swnode-v1-0-75f2264ae49f@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=22246;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SuFvkZu0w4R7ZzUnSsrxLWH1/5TACM1SQa5YDDmP2pQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpvCAZqsPSbGlNA08Bmjvo7tguYTpJ3MBsT9gi7
 WdBlY7rnW6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabwgGQAKCRAFnS7L/zaE
 w5HMD/4nPduMHiU5usi6yhd/1uO76BKKIsYlKSwqbpX0o/68w74F/x0YE6tNrusj9Iig5D43miG
 bzkjIa45nCuHiggYdwV55ZkBDpmd00SwsVRWWqs+KFTiGFpGQPA76IKpiBsmx78kvbgjC62NgFl
 VhnN26UTt4KgjqqQc5wLk5XekPss6vLc3ecH+q+XrTBAIlUnzvHNlu2RaZtavVKVvwPQJaskmFU
 l9KB+gihTrOnBN3iu/iPScSKIRFFpEp3exk+YHD62ASOxK6clGnl7X+ZvAWQgR8FrdWfGA5vXOL
 roRRl2Fn51F1ffTCOnjtD3j3drbRPDoNtlb2jYqRZ+/s2wvkuFTnqiGePiHHS/7/93uy2PdVu09
 QGiMRq7/6tTSjc6jZkTzwh2iHlyvTr+RwNXgNbY0Yvn35+zmcobkO/Kh8HW91bURL8G7sAI5+yW
 r8l5uvddES9ln7XxaPpWRR65Q+3DLiAiAArJ7xYzobT67hnv+i9+4WCNQXqxOiSEnQcOKkznUNa
 M36e+UpA/mRIQv14IsUYQ4Vl7mM0M1j2yL55of0avZwE5FsZz7MqmJyV5lJAF7FHKSJ494VpIVe
 N5BCuvVbjkXwXWP7IxBihtPTTFJI8Gfso2nbn654brX9KzQoHADj0SRNKRWIvkXIEifs578P0SC
 ZZpGJN8d72B9aKg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDEyOSBTYWx0ZWRfX36XA/g4JeUtK
 UShk4NMo+/no6mMY58N4e/Z27amzObwaUZPZ5VALBoJDbNZiatyV7/wnfUYEkSjSCXit3YZIKSO
 S7cYh5eAjKzaTAehNOwoWpfFyzBfD4M9neVG6YSxwhozAsBrSjEKvWhPxbO5lKX1fXtDPIAvF8C
 HRkzyavDzRz6lcTWRECKrScTlqww58Bh4DCvlSe0OfQXA6HkM/9iLrDVztGMIZNGW5+JP8fYrcw
 MqwcTLrEvG3l3YeXDU5jFQaDqRAeHmANw+1026RxUbpC8ySSQNrAUuWgIX0YydAuFu6mXYkZCJu
 S8gkENYx/AZFZ7hRuEkWXmeQXR+BXjdjeR4ucyvtcMMUuPSabc8x1rAGQdgZwLHiW72pjP7ZsaZ
 gGHV5m/Y9sb3RnzbtFtcwxl+s77YzR5cSTgDmNIV2Lmsjoj5rfaIODO3GRcW4/H2ph4j+a1tfSt
 kzp2CKiQnGKAIuvJGzA==
X-Proofpoint-GUID: nGpae7dyMqETOmB2zyVn6DWSRGovtTYM
X-Proofpoint-ORIG-GUID: nGpae7dyMqETOmB2zyVn6DWSRGovtTYM
X-Authority-Analysis: v=2.4 cv=MJttWcZl c=1 sm=1 tr=0 ts=69bc2027 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=I3_DoLzjCvalTPEyn3MA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190129
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33837-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2F98B2CEC36
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

With cherryview and baytrail drivers now exposing software nodes that
will actually be set as secondary firmware nodes of their primary ACPI
nodes and with GPIOLIB supporting fwnode matching for secondary fwnodes
as well, we can finally replace the dummy software nodes defined locally
in the x86-android-tablets driver and not attached to anything with ones
for which true fwnode GPIO lookup will work correctly and not require
the fallback to name matching.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/platform/x86/x86-android-tablets/Kconfig   |  1 +
 drivers/platform/x86/x86-android-tablets/acer.c    | 11 ++---
 drivers/platform/x86/x86-android-tablets/asus.c    |  9 +++--
 drivers/platform/x86/x86-android-tablets/core.c    | 47 +---------------------
 drivers/platform/x86/x86-android-tablets/lenovo.c  | 31 +++++++-------
 drivers/platform/x86/x86-android-tablets/other.c   | 23 ++++++-----
 .../x86/x86-android-tablets/shared-psy-info.c      |  7 ++--
 .../x86/x86-android-tablets/x86-android-tablets.h  |  4 --
 8 files changed, 45 insertions(+), 88 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/Kconfig b/drivers/platform/x86/x86-android-tablets/Kconfig
index 193da15ee01ca5943581d800d5d2f82f39aee196..18425f787e933927add436c3354460fad166f092 100644
--- a/drivers/platform/x86/x86-android-tablets/Kconfig
+++ b/drivers/platform/x86/x86-android-tablets/Kconfig
@@ -8,6 +8,7 @@ config X86_ANDROID_TABLETS
 	depends on I2C && SPI && SERIAL_DEV_BUS
 	depends on GPIOLIB && PMIC_OPREGION
 	depends on ACPI && EFI && PCI
+	depends on PINCTRL_BAYTRAIL && PINCTRL_CHERRYVIEW
 	select NEW_LEDS
 	select LEDS_CLASS
 	select POWER_SUPPLY
diff --git a/drivers/platform/x86/x86-android-tablets/acer.c b/drivers/platform/x86/x86-android-tablets/acer.c
index d48c70ffd9925033ec4ab937a7e55622e3f7a374..037648a45fa78679e5e6df132433c8e6fa4e991f 100644
--- a/drivers/platform/x86/x86-android-tablets/acer.c
+++ b/drivers/platform/x86/x86-android-tablets/acer.c
@@ -10,6 +10,7 @@
 
 #include <linux/gpio/machine.h>
 #include <linux/gpio/property.h>
+#include <linux/pinctrl/intel.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 
@@ -31,7 +32,7 @@ static const struct software_node acer_a1_840_bq24190_node = {
 static const struct property_entry acer_a1_840_touchscreen_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 800),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1280),
-	PROPERTY_ENTRY_GPIO("reset-gpios", &baytrail_gpiochip_nodes[1], 26, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_GPIO("reset-gpios", &baytrail_gpio_node_01, 26, GPIO_ACTIVE_LOW),
 	{ }
 };
 
@@ -91,8 +92,8 @@ static const struct x86_i2c_client_info acer_a1_840_i2c_clients[] __initconst =
 };
 
 static const struct property_entry acer_a1_840_int3496_props[] __initconst = {
-	PROPERTY_ENTRY_GPIO("mux-gpios", &baytrail_gpiochip_nodes[2], 1, GPIO_ACTIVE_HIGH),
-	PROPERTY_ENTRY_GPIO("id-gpios", &baytrail_gpiochip_nodes[2], 18, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("mux-gpios", &baytrail_gpio_node_02, 1, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("id-gpios", &baytrail_gpio_node_02, 18, GPIO_ACTIVE_HIGH),
 	{ }
 };
 
@@ -109,7 +110,7 @@ static const struct platform_device_info acer_a1_840_pdevs[] __initconst = {
 static const struct property_entry acer_a1_840_fg_props[] = {
 	PROPERTY_ENTRY_REF("monitored-battery", &generic_lipo_4v2_battery_node),
 	PROPERTY_ENTRY_STRING_ARRAY_LEN("supplied-from", bq24190_psy, 1),
-	PROPERTY_ENTRY_GPIO("charged-gpios", &baytrail_gpiochip_nodes[2], 10, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("charged-gpios", &baytrail_gpio_node_02, 10, GPIO_ACTIVE_HIGH),
 	{ }
 };
 
@@ -193,7 +194,7 @@ static const struct software_node acer_b1_750_bma250e_node = {
 };
 
 static const struct property_entry acer_b1_750_novatek_props[] = {
-	PROPERTY_ENTRY_GPIO("reset-gpios", &baytrail_gpiochip_nodes[1], 26, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_GPIO("reset-gpios", &baytrail_gpio_node_01, 26, GPIO_ACTIVE_LOW),
 	{ }
 };
 
diff --git a/drivers/platform/x86/x86-android-tablets/asus.c b/drivers/platform/x86/x86-android-tablets/asus.c
index 7d29c7654d214029720f444a17326851629c0342..42adf2a82bd4749f8b4c1d3ce9f733949292fd1b 100644
--- a/drivers/platform/x86/x86-android-tablets/asus.c
+++ b/drivers/platform/x86/x86-android-tablets/asus.c
@@ -12,13 +12,14 @@
 #include <linux/gpio/property.h>
 #include <linux/input-event-codes.h>
 #include <linux/platform_device.h>
+#include <linux/pinctrl/intel.h>
 
 #include "shared-psy-info.h"
 #include "x86-android-tablets.h"
 
 /* Asus ME176C and TF103C tablets shared data */
 static const struct property_entry asus_me176c_tf103c_int3496_props[] __initconst = {
-	PROPERTY_ENTRY_GPIO("id-gpios", &baytrail_gpiochip_nodes[2], 22, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("id-gpios", &baytrail_gpio_node_02, 22, GPIO_ACTIVE_HIGH),
 	{ }
 };
 
@@ -39,7 +40,7 @@ static const struct property_entry asus_me176c_tf103c_lid_props[] = {
 	PROPERTY_ENTRY_U32("linux,input-type", EV_SW),
 	PROPERTY_ENTRY_U32("linux,code", SW_LID),
 	PROPERTY_ENTRY_STRING("label", "lid_sw"),
-	PROPERTY_ENTRY_GPIO("gpios", &baytrail_gpiochip_nodes[2], 12, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_GPIO("gpios", &baytrail_gpio_node_02, 12, GPIO_ACTIVE_LOW),
 	PROPERTY_ENTRY_U32("debounce-interval", 50),
 	PROPERTY_ENTRY_BOOL("wakeup-source"),
 	{ }
@@ -97,8 +98,8 @@ static const struct software_node asus_me176c_ug3105_node = {
 };
 
 static const struct property_entry asus_me176c_touchscreen_props[] = {
-	PROPERTY_ENTRY_GPIO("reset-gpios", &baytrail_gpiochip_nodes[0], 60, GPIO_ACTIVE_HIGH),
-	PROPERTY_ENTRY_GPIO("irq-gpios", &baytrail_gpiochip_nodes[2], 28, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("reset-gpios", &baytrail_gpio_node_00, 60, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("irq-gpios", &baytrail_gpio_node_02, 28, GPIO_ACTIVE_HIGH),
 	{ }
 };
 
diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index 021009e9085bec3db9c4daa1f6235600210a6099..7e8c0eb9792cac493268e6ecc3b3a0ecf8dccc4e 100644
--- a/drivers/platform/x86/x86-android-tablets/core.c
+++ b/drivers/platform/x86/x86-android-tablets/core.c
@@ -154,7 +154,6 @@ static struct platform_device **pdevs;
 static struct serdev_device **serdevs;
 static const struct software_node **gpio_button_swnodes;
 static const struct software_node **swnode_group;
-static const struct software_node **gpiochip_node_group;
 static void (*exit_handler)(void);
 
 static __init struct i2c_adapter *
@@ -332,34 +331,6 @@ static __init int x86_instantiate_serdev(const struct x86_dev_info *dev_info, in
 	return ret;
 }
 
-const struct software_node baytrail_gpiochip_nodes[] = {
-	{ .name = "INT33FC:00" },
-	{ .name = "INT33FC:01" },
-	{ .name = "INT33FC:02" },
-};
-
-static const struct software_node *baytrail_gpiochip_node_group[] = {
-	&baytrail_gpiochip_nodes[0],
-	&baytrail_gpiochip_nodes[1],
-	&baytrail_gpiochip_nodes[2],
-	NULL
-};
-
-const struct software_node cherryview_gpiochip_nodes[] = {
-	{ .name = "INT33FF:00" },
-	{ .name = "INT33FF:01" },
-	{ .name = "INT33FF:02" },
-	{ .name = "INT33FF:03" },
-};
-
-static const struct software_node *cherryview_gpiochip_node_group[] = {
-	&cherryview_gpiochip_nodes[0],
-	&cherryview_gpiochip_nodes[1],
-	&cherryview_gpiochip_nodes[2],
-	&cherryview_gpiochip_nodes[3],
-	NULL
-};
-
 static void x86_android_tablet_remove(struct platform_device *pdev)
 {
 	int i;
@@ -391,7 +362,6 @@ static void x86_android_tablet_remove(struct platform_device *pdev)
 
 	software_node_unregister_node_group(gpio_button_swnodes);
 	software_node_unregister_node_group(swnode_group);
-	software_node_unregister_node_group(gpiochip_node_group);
 }
 
 static __init int x86_android_tablet_probe(struct platform_device *pdev)
@@ -415,22 +385,6 @@ static __init int x86_android_tablet_probe(struct platform_device *pdev)
 	for (i = 0; dev_info->modules && dev_info->modules[i]; i++)
 		request_module(dev_info->modules[i]);
 
-	switch (dev_info->gpiochip_type) {
-	case X86_GPIOCHIP_BAYTRAIL:
-		gpiochip_node_group = baytrail_gpiochip_node_group;
-		break;
-	case X86_GPIOCHIP_CHERRYVIEW:
-		gpiochip_node_group = cherryview_gpiochip_node_group;
-		break;
-	case X86_GPIOCHIP_UNSPECIFIED:
-		gpiochip_node_group = NULL;
-		break;
-	}
-
-	ret = software_node_register_node_group(gpiochip_node_group);
-	if (ret)
-		return ret;
-
 	ret = software_node_register_node_group(dev_info->swnode_group);
 	if (ret) {
 		x86_android_tablet_remove(pdev);
@@ -563,3 +517,4 @@ module_exit(x86_android_tablet_exit);
 MODULE_AUTHOR("Hans de Goede <hansg@kernel.org>");
 MODULE_DESCRIPTION("X86 Android tablets DSDT fixups driver");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PINCTRL_INTEL");
diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index 8d825e0b4661c0be879160ea963ac167112c41ea..bd4e0ca2c1ef35ab9e6b1bf9dbb91936e2815b84 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -18,6 +18,7 @@
 #include <linux/mfd/arizona/registers.h>
 #include <linux/mfd/intel_soc_pmic.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/pinctrl/intel.h>
 #include <linux/pinctrl/machine.h>
 #include <linux/platform_data/lp855x.h>
 #include <linux/platform_device.h>
@@ -72,8 +73,8 @@ static const struct software_node crystalcove_gpiochip_node = {
 /* Lenovo Yoga Book X90F / X90L's Android factory image has everything hardcoded */
 
 static const struct property_entry lenovo_yb1_x90_goodix_props[] = {
-	PROPERTY_ENTRY_GPIO("reset-gpios", &cherryview_gpiochip_nodes[1], 53, GPIO_ACTIVE_HIGH),
-	PROPERTY_ENTRY_GPIO("irq-gpios", &cherryview_gpiochip_nodes[1], 56, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("reset-gpios", &cherryview_gpio_node_01, 53, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("irq-gpios", &cherryview_gpio_node_01, 56, GPIO_ACTIVE_HIGH),
 	{ }
 };
 
@@ -84,7 +85,7 @@ static const struct software_node lenovo_yb1_x90_goodix_node = {
 static const struct property_entry lenovo_yb1_x90_wacom_props[] = {
 	PROPERTY_ENTRY_U32("hid-descr-addr", 0x0001),
 	PROPERTY_ENTRY_U32("post-reset-deassert-delay-ms", 150),
-	PROPERTY_ENTRY_GPIO("reset-gpios", &cherryview_gpiochip_nodes[0], 82, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_GPIO("reset-gpios", &cherryview_gpio_node_00, 82, GPIO_ACTIVE_LOW),
 	{ }
 };
 
@@ -106,7 +107,7 @@ static const struct property_entry lenovo_yb1_x90_hideep_ts_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1920),
 	PROPERTY_ENTRY_U32("touchscreen-max-pressure", 16384),
 	PROPERTY_ENTRY_BOOL("hideep,force-native-protocol"),
-	PROPERTY_ENTRY_GPIO("reset-gpios", &cherryview_gpiochip_nodes[0], 7, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_GPIO("reset-gpios", &cherryview_gpio_node_00, 7, GPIO_ACTIVE_LOW),
 	{ }
 };
 
@@ -221,7 +222,7 @@ static const struct property_entry lenovo_yb1_x90_lid_props[] = {
 	PROPERTY_ENTRY_U32("linux,input-type", EV_SW),
 	PROPERTY_ENTRY_U32("linux,code", SW_LID),
 	PROPERTY_ENTRY_STRING("label", "lid_sw"),
-	PROPERTY_ENTRY_GPIO("gpios", &cherryview_gpiochip_nodes[2], 19, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_GPIO("gpios", &cherryview_gpio_node_02, 19, GPIO_ACTIVE_LOW),
 	PROPERTY_ENTRY_U32("debounce-interval", 50),
 	PROPERTY_ENTRY_BOOL("wakeup-source"),
 	{ }
@@ -305,7 +306,7 @@ static const struct property_entry lenovo_yoga_tab2_830_1050_lid_props[] = {
 	PROPERTY_ENTRY_U32("linux,input-type", EV_SW),
 	PROPERTY_ENTRY_U32("linux,code", SW_LID),
 	PROPERTY_ENTRY_STRING("label", "lid_sw"),
-	PROPERTY_ENTRY_GPIO("gpios", &baytrail_gpiochip_nodes[2], 26, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_GPIO("gpios", &baytrail_gpio_node_02, 26, GPIO_ACTIVE_LOW),
 	PROPERTY_ENTRY_U32("debounce-interval", 50),
 	PROPERTY_ENTRY_BOOL("wakeup-source"),
 	{ }
@@ -400,8 +401,8 @@ static struct x86_i2c_client_info lenovo_yoga_tab2_830_1050_i2c_clients[] __init
 };
 
 static const struct property_entry lenovo_yoga_tab2_830_1050_int3496_props[] __initconst = {
-	PROPERTY_ENTRY_GPIO("mux-gpios", &baytrail_gpiochip_nodes[2], 1, GPIO_ACTIVE_LOW),
-	PROPERTY_ENTRY_GPIO("id-gpios", &baytrail_gpiochip_nodes[2], 24, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("mux-gpios", &baytrail_gpio_node_02, 1, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_GPIO("id-gpios", &baytrail_gpio_node_02, 24, GPIO_ACTIVE_HIGH),
 	{ }
 };
 
@@ -420,7 +421,7 @@ static const struct property_entry lenovo_yoga_tab2_830_1050_wm1502_props[] = {
 	PROPERTY_ENTRY_GPIO("reset-gpios",
 			    &crystalcove_gpiochip_node, 3, GPIO_ACTIVE_HIGH),
 	PROPERTY_ENTRY_GPIO("wlf,ldoena-gpios",
-			    &baytrail_gpiochip_nodes[1], 23, GPIO_ACTIVE_HIGH),
+			    &baytrail_gpio_node_01, 23, GPIO_ACTIVE_HIGH),
 	PROPERTY_ENTRY_GPIO("wlf,spkvdd-ena-gpios",
 			    &arizona_gpiochip_node, 2, GPIO_ACTIVE_HIGH),
 	PROPERTY_ENTRY_GPIO("wlf,micd-pol-gpios",
@@ -759,8 +760,8 @@ static const struct x86_i2c_client_info lenovo_yoga_tab2_1380_i2c_clients[] __in
 };
 
 static const struct property_entry lenovo_yoga_tab2_1380_fc_props[] __initconst = {
-	PROPERTY_ENTRY_GPIO("uart3_txd-gpios", &baytrail_gpiochip_nodes[0], 57, GPIO_ACTIVE_HIGH),
-	PROPERTY_ENTRY_GPIO("uart3_rxd-gpios", &baytrail_gpiochip_nodes[0], 61, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("uart3_txd-gpios", &baytrail_gpio_node_00, 57, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("uart3_rxd-gpios", &baytrail_gpio_node_00, 61, GPIO_ACTIVE_HIGH),
 	{ }
 };
 
@@ -850,7 +851,7 @@ static const struct property_entry lenovo_yt3_hideep_ts_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 1600),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 2560),
 	PROPERTY_ENTRY_U32("touchscreen-max-pressure", 255),
-	PROPERTY_ENTRY_GPIO("reset-gpios", &cherryview_gpiochip_nodes[0], 7, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_GPIO("reset-gpios", &cherryview_gpio_node_00, 7, GPIO_ACTIVE_LOW),
 	{ }
 };
 
@@ -987,10 +988,10 @@ static struct arizona_pdata lenovo_yt3_wm5102_pdata = {
 
 static const struct property_entry lenovo_yt3_wm1502_props[] = {
 	PROPERTY_ENTRY_GPIO("wlf,spkvdd-ena-gpios",
-			    &cherryview_gpiochip_nodes[0], 75, GPIO_ACTIVE_HIGH),
+			    &cherryview_gpio_node_00, 75, GPIO_ACTIVE_HIGH),
 	PROPERTY_ENTRY_GPIO("wlf,ldoena-gpios",
-			    &cherryview_gpiochip_nodes[0], 81, GPIO_ACTIVE_HIGH),
-	PROPERTY_ENTRY_GPIO("reset-gpios", &cherryview_gpiochip_nodes[0], 82, GPIO_ACTIVE_HIGH),
+			    &cherryview_gpio_node_00, 81, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("reset-gpios", &cherryview_gpio_node_00, 82, GPIO_ACTIVE_HIGH),
 	PROPERTY_ENTRY_GPIO("wlf,micd-pol-gpios", &arizona_gpiochip_node, 2, GPIO_ACTIVE_HIGH),
 	{ }
 };
diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
index 7532af2d72d1d9de807a1f371425249ac5ff86da..b61930ef51570be402df04c5c2a646217908a8fc 100644
--- a/drivers/platform/x86/x86-android-tablets/other.c
+++ b/drivers/platform/x86/x86-android-tablets/other.c
@@ -14,6 +14,7 @@
 #include <linux/input-event-codes.h>
 #include <linux/leds.h>
 #include <linux/pci.h>
+#include <linux/pinctrl/intel.h>
 #include <linux/platform_device.h>
 #include <linux/pwm.h>
 
@@ -35,7 +36,7 @@ static const struct software_node advantech_mica_071_gpio_keys_node = {
 static const struct property_entry advantech_mica_071_prog1_key_props[] = {
 	PROPERTY_ENTRY_U32("linux,code", KEY_PROG1),
 	PROPERTY_ENTRY_STRING("label", "prog1_key"),
-	PROPERTY_ENTRY_GPIO("gpios", &baytrail_gpiochip_nodes[0], 2, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_GPIO("gpios", &baytrail_gpio_node_00, 2, GPIO_ACTIVE_LOW),
 	PROPERTY_ENTRY_U32("debounce-interval", 50),
 	{ }
 };
@@ -156,7 +157,7 @@ static const struct software_node cyberbook_t116_gpio_keys_node = {
 static const struct property_entry cyberbook_t116_prog1_key_props[] = {
 	PROPERTY_ENTRY_U32("linux,code", KEY_PROG1),
 	PROPERTY_ENTRY_STRING("label", "prog1_key"),
-	PROPERTY_ENTRY_GPIO("gpios", &cherryview_gpiochip_nodes[0], 30, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_GPIO("gpios", &cherryview_gpio_node_00, 30, GPIO_ACTIVE_LOW),
 	PROPERTY_ENTRY_U32("debounce-interval", 50),
 	{ }
 };
@@ -169,7 +170,7 @@ static const struct software_node cyberbook_t116_prog1_key_node = {
 static const struct property_entry cyberbook_t116_prog2_key_props[] = {
 	PROPERTY_ENTRY_U32("linux,code", KEY_PROG2),
 	PROPERTY_ENTRY_STRING("label", "prog2_key"),
-	PROPERTY_ENTRY_GPIO("gpios", &cherryview_gpiochip_nodes[3], 48, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_GPIO("gpios", &cherryview_gpio_node_03, 48, GPIO_ACTIVE_LOW),
 	PROPERTY_ENTRY_U32("debounce-interval", 50),
 	{ }
 };
@@ -244,8 +245,8 @@ static const struct software_node medion_lifetab_s10346_accel_node = {
 static const struct property_entry medion_lifetab_s10346_touchscreen_props[] = {
 	PROPERTY_ENTRY_BOOL("touchscreen-inverted-x"),
 	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
-	PROPERTY_ENTRY_GPIO("reset-gpios", &baytrail_gpiochip_nodes[1], 26, GPIO_ACTIVE_HIGH),
-	PROPERTY_ENTRY_GPIO("irq-gpios", &baytrail_gpiochip_nodes[2], 3, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("reset-gpios", &baytrail_gpio_node_01, 26, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("irq-gpios", &baytrail_gpio_node_02, 3, GPIO_ACTIVE_HIGH),
 	{ }
 };
 
@@ -378,7 +379,7 @@ static const struct software_node nextbook_ares8a_accel_node = {
 static const struct property_entry nextbook_ares8a_ft5416_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 800),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1280),
-	PROPERTY_ENTRY_GPIO("reset-gpios", &cherryview_gpiochip_nodes[1], 25, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_GPIO("reset-gpios", &cherryview_gpio_node_01, 25, GPIO_ACTIVE_LOW),
 	{ }
 };
 
@@ -435,7 +436,7 @@ static const struct software_node peaq_c1010_gpio_keys_node = {
 static const struct property_entry peaq_c1010_dolby_key_props[] = {
 	PROPERTY_ENTRY_U32("linux,code", KEY_SOUND),
 	PROPERTY_ENTRY_STRING("label", "dolby_key"),
-	PROPERTY_ENTRY_GPIO("gpios", &baytrail_gpiochip_nodes[0], 3, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_GPIO("gpios", &baytrail_gpio_node_00, 3, GPIO_ACTIVE_LOW),
 	PROPERTY_ENTRY_U32("debounce-interval", 50),
 	{ }
 };
@@ -481,8 +482,8 @@ static const struct property_entry whitelabel_tm800a550l_goodix_props[] = {
 	PROPERTY_ENTRY_STRING("firmware-name", "gt912-tm800a550l.fw"),
 	PROPERTY_ENTRY_STRING("goodix,config-name", "gt912-tm800a550l.cfg"),
 	PROPERTY_ENTRY_U32("goodix,main-clk", 54),
-	PROPERTY_ENTRY_GPIO("reset-gpios", &baytrail_gpiochip_nodes[1], 26, GPIO_ACTIVE_HIGH),
-	PROPERTY_ENTRY_GPIO("irq-gpios", &baytrail_gpiochip_nodes[2], 3, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("reset-gpios", &baytrail_gpio_node_01, 26, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("irq-gpios", &baytrail_gpio_node_02, 3, GPIO_ACTIVE_HIGH),
 	{ }
 };
 
@@ -531,7 +532,7 @@ const struct x86_dev_info whitelabel_tm800a550l_info __initconst = {
 static const struct property_entry vexia_edu_atla10_5v_touchscreen_props[] = {
 	PROPERTY_ENTRY_U32("hid-descr-addr", 0x0000),
 	PROPERTY_ENTRY_U32("post-reset-deassert-delay-ms", 120),
-	PROPERTY_ENTRY_GPIO("reset-gpios", &baytrail_gpiochip_nodes[1], 26, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_GPIO("reset-gpios", &baytrail_gpio_node_01, 26, GPIO_ACTIVE_LOW),
 	{ }
 };
 
@@ -605,7 +606,7 @@ static const struct software_node vexia_edu_atla10_9v_accel_node = {
 static const struct property_entry vexia_edu_atla10_9v_touchscreen_props[] = {
 	PROPERTY_ENTRY_U32("hid-descr-addr", 0x0000),
 	PROPERTY_ENTRY_U32("post-reset-deassert-delay-ms", 120),
-	PROPERTY_ENTRY_GPIO("reset-gpios", &baytrail_gpiochip_nodes[0], 60, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_GPIO("reset-gpios", &baytrail_gpio_node_00, 60, GPIO_ACTIVE_LOW),
 	{ }
 };
 
diff --git a/drivers/platform/x86/x86-android-tablets/shared-psy-info.c b/drivers/platform/x86/x86-android-tablets/shared-psy-info.c
index 29fc466f76fe7a99f7cb853e38f62593d7464138..f214152a9b0455089d40b977bf1116098afac764 100644
--- a/drivers/platform/x86/x86-android-tablets/shared-psy-info.c
+++ b/drivers/platform/x86/x86-android-tablets/shared-psy-info.c
@@ -10,6 +10,7 @@
 
 #include <linux/gpio/machine.h>
 #include <linux/gpio/property.h>
+#include <linux/pinctrl/intel.h>
 #include <linux/platform_device.h>
 #include <linux/power/bq24190_charger.h>
 #include <linux/property.h>
@@ -169,9 +170,9 @@ const char * const bq24190_modules[] __initconst = {
 };
 
 static const struct property_entry int3496_reference_props[] __initconst = {
-	PROPERTY_ENTRY_GPIO("vbus-gpios", &baytrail_gpiochip_nodes[1], 15, GPIO_ACTIVE_HIGH),
-	PROPERTY_ENTRY_GPIO("mux-gpios", &baytrail_gpiochip_nodes[2], 1, GPIO_ACTIVE_HIGH),
-	PROPERTY_ENTRY_GPIO("id-gpios", &baytrail_gpiochip_nodes[2], 18, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("vbus-gpios", &baytrail_gpio_node_01, 15, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("mux-gpios", &baytrail_gpio_node_02, 1, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("id-gpios", &baytrail_gpio_node_02, 18, GPIO_ACTIVE_HIGH),
 	{ }
 };
 
diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
index 2498390958ad44e89b1c929ff46397e3f9e0c74b..cc61e49f93890e3cde16ea549d2a4f9fd11a41ac 100644
--- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
+++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
@@ -103,10 +103,6 @@ int x86_android_tablet_get_gpiod(const char *chip, int pin, const char *con_id,
 				 struct gpio_desc **desc);
 int x86_acpi_irq_helper_get(const struct x86_acpi_irq_data *data);
 
-/* Software nodes representing GPIO chips used by various tablets */
-extern const struct software_node baytrail_gpiochip_nodes[];
-extern const struct software_node cherryview_gpiochip_nodes[];
-
 /*
  * Extern declarations of x86_dev_info structs so there can be a single
  * MODULE_DEVICE_TABLE(dmi, ...), while splitting the board descriptions.

-- 
2.47.3


