Return-Path: <linux-gpio+bounces-36740-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIw6EuRkBGq6HgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36740-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 13:47:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F5A532809
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 13:47:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D63463083A0F
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 11:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E0038D6AD;
	Wed, 13 May 2026 11:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hehUXCbZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NX5WG5pi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3825036657B
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 11:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778672855; cv=none; b=BKsUeTjnWK/nUqbjXFtzR7kknrkZe57ypseUwm30Ksk4IzMaS5rUHOJIaD89kRFkGJcBHMFHJ5lgM1zF+EW44wexy9DK+7QanZYDfOoqwj7xx2SyyRIzaKoDBvPpd9oKc8eGJ3pTZrxbtStMroEi2L66vnBp+I75E1/Fli0yrko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778672855; c=relaxed/simple;
	bh=zSgfrj75qYjaRodBCYjVthgmEk6GxGvhDcut866HuOs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z+oKLtAoNn4QD+2ndPg7LqvThbWrvzclfXq6DSa6xpdJajI3THRx2tR0WPGWgiMvrOYNti4jviCKnUh6R5+TXvr7m24C7Sq+v4HMWOHU5PddqHPqb6l1FUql3ZIwo/lwdYkoYyIQNuU65lI644wIOP2LNP55cU4WLYU8K0Jy5tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hehUXCbZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NX5WG5pi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8mIhd3474831
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 11:47:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X9uPHg/ZLKJmgtFDuygYqW31BN4KQEb6Ubl5ALAhS9M=; b=hehUXCbZsLo7834P
	MeTRa5J6G8U8orEPlFdRsBGQXoO4BN23XK47Bp9bble1J1JtwWjEMNTptLYYbyIn
	pvUu1Yo9eBiySwEnrEouJRqPrZgjCXYxQO4ys5GkXsBu2WAjEPvois6fSc2MLqsF
	gF0oc0ZP0lF9h6bnQZmKzSOz/JTDbTBXbwxWCQxdvqjigTDTugYRKOHPmQbQ5AHh
	3V0CAHQkF7W1RdGWtDnrlN8g4bNQcgGvNXiWfSv8hech363kucLYIq3nlr/F7uA5
	dTUTq7rP4/Zq9VoMMhXMZJ9MUl0M12vLzsOWDEsR3HyZnS4HwbvT5AFpPexJmTuV
	jFMFew==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p418ne0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 11:47:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e423a05c8so66902311cf.0
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 04:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778672851; x=1779277651; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X9uPHg/ZLKJmgtFDuygYqW31BN4KQEb6Ubl5ALAhS9M=;
        b=NX5WG5piTxdMH/+mVF1mXoC+tFgJNtDt62SX5DcyVYs03FGgvM3j4ggwF1sPZ+xYXC
         94a4qPIfFBRbK/Dk1cHpe4tRBIHc1GmS4+z7+0iS89SALgtMFzAyVMNfvYHFuvT7PL+3
         WWaURDAh7F4Kv1zQp/FPQnSfsNwRUdDjwIoZOEvMuseGXDYuBKfYnH0PlC86aEVdqqPA
         95M/bt4bIBtRMmt4DJjvjUe/HnZ6W6W6rs7RxiBgfo8DwM78VZPCgivXboWoQi0W2x+y
         YeVLaVqMH2jr5p9CdrP7QlibMrVLO76M6IUeGwa2noY3zgMXzfuMVm5Wstj7XaQiteps
         W74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778672851; x=1779277651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X9uPHg/ZLKJmgtFDuygYqW31BN4KQEb6Ubl5ALAhS9M=;
        b=qP0BNn4DvwnPBetJG5151TlaPVHcyuZmGTio+HzNt+y55/T9AAFryxZt+pgEIn4C7t
         +adpTZ9LxRYmIKVdYxtdDGGwHRjh/hXRJu66oQ+6LSeQBTL5NUjGVo5ig7OmrT75EHRi
         ETC3mHu0xMOCF95/65fKkr6wPby4nZdTEboUQ2of6Wbly5bfUL6vLeJnMqJfIkoZ6cZx
         Wr0En81wLSTOHVf6uRMRK5jBEarStCZg5koxx4aYHkyhjajt0J9E1uQ+C4zwEhB40tLJ
         u81KXwmZjzIncsQbLg9LXy2lJVGyBQUMwDIIQ+EXnhnPG8yfxOtOKU4+ln2DWIQ4R0Wf
         sWCw==
X-Forwarded-Encrypted: i=1; AFNElJ+yLesnIf+6UhsR+meYi9Y5jkRw0CYuI9jZecV+JD9Gvx/2z5YJI8shjR3JDZJj+JLjPDD4aattsWeQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyuNCjnWm/u1ko2HnrWKM8Oxe5ev7kDOWHJc3IrLCFk1mfaFiTA
	8xK5Yp/lPl1l/knJr5BVaaVgl93tG8KQz74PjeqNeDcMy8MMglr2GeIWyxLpZlmckmgK3s2Peb4
	lLu1rCKhj4E6/TKhEqkPf5JWZxNzISv1iseQKCqstsgozCiB4mfbTaNGARoMzV/eV
X-Gm-Gg: Acq92OG6SrFdOhINcUhRdypksfdcmyQFZJaC3wLx/PEuhAl7wdy/q5MSmDIJ03mTgkv
	15hti2V5cZckTaxvKLUKyp74ZZJboFLAJhuiR4o9Eni+s8ZDbAjvwelPnsnvt2mlau2lxIapj6m
	7ZEYjObn6OCE2xGoH6uFhJbG2bsQJNSTO2Zl6YbNYNH5bQm9/KSVKfzyJskRlHv5NNKA8EjAm0+
	5kkH/azYK1YLVUYxAt0WOJYNT/iNI0gxbbpjXeWgj3xLcqob9ot6HyC4uVWrjKz4FKZ9ozGIFiC
	/wtGghXaSJET111Tp5CYIFTy1XETbeyIvXVn4eCh3NgOktzu6mVAzZVgoOjsJxjeDxWSwxfESeV
	yO0BiJhRTc4Cbj+GyEvxQEWgH/s8hM9eMc1u72+gwcUtkGGEdfg==
X-Received: by 2002:ac8:7619:0:b0:515:7d69:4c0a with SMTP id d75a77b69052e-5157d694cc7mr42946891cf.2.1778672850947;
        Wed, 13 May 2026 04:47:30 -0700 (PDT)
X-Received: by 2002:ac8:7619:0:b0:515:7d69:4c0a with SMTP id d75a77b69052e-5157d694cc7mr42946521cf.2.1778672850301;
        Wed, 13 May 2026 04:47:30 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:63ec:4acc:c4f6:423])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8e5f00e8sm41615855e9.2.2026.05.13.04.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 04:47:29 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 13 May 2026 13:47:12 +0200
Subject: [PATCH 1/2] tools: provide the libgpiotools shared library
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-tools-common-shared-lib-v1-1-58ac28a9f1d5@oss.qualcomm.com>
References: <20260513-tools-common-shared-lib-v1-0-58ac28a9f1d5@oss.qualcomm.com>
In-Reply-To: <20260513-tools-common-shared-lib-v1-0-58ac28a9f1d5@oss.qualcomm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>, Vincent Fazio <vfazio@xes-inc.com>,
        Alexander Dahl <post@lespocky.de>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=24039;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zSgfrj75qYjaRodBCYjVthgmEk6GxGvhDcut866HuOs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqBGTMeM7U1z577el4QhTgJ2cuIMLTePfDmzOem
 3SANwrzJ2WJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagRkzAAKCRAFnS7L/zaE
 wxPvD/wK++d+Wfu2XqmwAwLdvfFZUWveRHtXk90FgjKqIubvZ7NrVkq0ZXabEDlwWZ4dtT5nl+/
 UR7hzZNK2q0WmspexW3YW8/5G4Kp+cmjEJjZwrV2moZsa2FAjUlARDjF+axGkcz1JgggIdcrCdt
 VO+gEVN4tNvVka74hWHAtOSIhbCzRckOZ33YIx4EyvKXh87yYxzXrjiY2kBsLCZbiu1L5ArSgZn
 RHiP6YvJW3SoEw5pLKiUCNPM/0qOdJTB7pfkvXVd4Hl1JDVBeNmIIBZI8L3QrFAtAeq7U/kq9Y+
 IFuDzOuCYHw8THWBIa7exPkveWWMl8VzAVsHhhw6xyFETdv58xRonchnKpZJsnJY85TCsUuHy15
 RQk38d1EjKB2gwDYIu1sve/zp1oLEjIr0ioUOgEwQ1HQTV429ZDDgrUua/mTjgqlmKU2wzszS45
 vodoO4UPv1OGVR9ZTIMiMgM9wARvPHRSNBvAvLrUlBWlKX/fVgZgFC8wSgEYVoIHT6TJ+L84qlD
 x6zsyrZP/B2rQBPZxVgvFTkxbw0kTggnV8ZQ9fxr/uTUn/jwmyadlrNmBkIGHV1lJmurDlp687u
 SoHEc+BxFqiBEP7liTP8oCyQi9skVzIwP+SSiOhXr67uEEtWA/n7G2L48v/vr2PjQpk5bLXCa3F
 EluaXOiCyhr80pA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=df+wG3Xe c=1 sm=1 tr=0 ts=6a0464d4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=9oa-NRsQ604_4aUzPiwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEyMyBTYWx0ZWRfX1C0m4AqGWLC4
 L1WWfctyg88piESWsTXyyJxSJ4SVHnz4YqhfLLu5IOkPhX9hivcYXSjH1DfqN8rVN812xja8vaK
 7EzlUUqU14z8s42iox9I55RT+2qwOe5GvsefXM7Pt/lT/UEr5/NxlcYOvmxauLOHupgMdzrFgli
 205fthRPkzDClXjA7dj61l//AviS12x5tJjqBDjdirP+/zywQIt17JWS/o6KBl27/pRMmaC7aBs
 ZBy2c5uFkQK/ysUVJo7dwaH7XwqoJuo9zmF6WLXU3eepmAIpoiRtwx3Pyo8oyGqEPvR3xtP70ki
 kyQcCMq57RpYhLRzbJQL6GPMWyUqYtmXaogjwsXEqBae0H/49VWf4CPBG7RuOcf5+Il4vRVSuZd
 WZfg7Q7lFcDgydekZCGP6nZVE0AjULvL5kXKxeNS8k02j1r9dRnC/iphD08kiMtIINcGDFdJJC1
 PERQIU0a2JmS+v5xNfw==
X-Proofpoint-GUID: TVGFsmaf-z4of55HesIYqzLn6Qwao5KG
X-Proofpoint-ORIG-GUID: TVGFsmaf-z4of55HesIYqzLn6Qwao5KG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130123
X-Rspamd-Queue-Id: C6F5A532809
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-36740-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,xes-inc.com,lespocky.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

In order to enable users of the project to reuse the high-level functions
provided to gpio-tools via the static tools-common library (for
instance: for line lookup by name), expose a sub-set of its
functionality in new shared library: libgpiotools, accompanied by a new
public header and providing a stable API/ABI.

Add a new rst page documenting the public API of the libgpiotools shared
library and integrate it into the sphinx build.

Closes: https://github.com/brgl/libgpiod/discussions/178
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 docs/Doxyfile           |   1 +
 docs/gpio_tools.rst     |  16 ++
 docs/gpio_tools_lib.rst |  12 ++
 meson.build             |   3 +
 tools/gpiotools.c       | 437 ++++++++++++++++++++++++++++++++++++++++++++++++
 tools/gpiotools.h       | 236 ++++++++++++++++++++++++++
 tools/meson.build       |  20 +++
 7 files changed, 725 insertions(+)

diff --git a/docs/Doxyfile b/docs/Doxyfile
index 8c5b5dff54721fe4ccc9f3049e6c2c3f484cb911..3ee98ab21c0412a6d62d50686981c82cb3c8f464 100644
--- a/docs/Doxyfile
+++ b/docs/Doxyfile
@@ -4,6 +4,7 @@
 PROJECT_NAME		= libgpiod
 OUTPUT_DIRECTORY	= doxygen-output
 INPUT			= ../include/gpiod.h \
+			  ../tools/gpiotools.h \
 			  ../bindings/cxx/gpiod.hpp \
 			  ../bindings/cxx/gpiodcxx/
 GENERATE_XML		= YES
diff --git a/docs/gpio_tools.rst b/docs/gpio_tools.rst
index e4bf5847315ce93859bd4179df306a43a0445fec..2876970e4028451b05f7b20a551fc97d0a1685c2 100644
--- a/docs/gpio_tools.rst
+++ b/docs/gpio_tools.rst
@@ -33,6 +33,22 @@ There are currently six command-line tools available:
   changes to watch for, how many events to process before exiting, or if the
   events should be reported to the console
 
+Shared library
+--------------
+
+A number of functions used to implement **gpio-tools** has been made available
+in a shared library separate from the low-level, core libgpiod API in the form
+of libgpiotools.
+
+.. note::
+   The libgpiotools library does not get nearly as much attention and care as
+   the core libgpiod C library so your mileage may vary.
+
+.. toctree::
+   :maxdepth: 1
+
+   libgpiotools API documentation<gpio_tools_lib>
+
 .. toctree::
    :maxdepth: 1
    :caption: Manual entries
diff --git a/docs/gpio_tools_lib.rst b/docs/gpio_tools_lib.rst
new file mode 100644
index 0000000000000000000000000000000000000000..2931f950d4b60c4e445e6d8c9d29dad1a4975214
--- /dev/null
+++ b/docs/gpio_tools_lib.rst
@@ -0,0 +1,12 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+
+..
+   This file is part of libgpiod.
+
+libgpiotools API
+================
+
+.. doxygengroup:: gpiotools
+   :members:
diff --git a/meson.build b/meson.build
index 4ec1e575820ff64245b52823312b57e8e09127d9..0bf970eb155178394410c4fbd680eb7544834637 100644
--- a/meson.build
+++ b/meson.build
@@ -33,6 +33,9 @@ libgpiosim_version      = '1.0.1'
 # ... and another one for GLib bindings:
 libgpiod_glib_soversion = 1
 libgpiod_glib_version   = '1.0.0'
+# ... and another for the libgpiotools shared library:
+libgpiotools_soversion  = 1
+libgpiotools_version    = '1.0.0'
 
 add_project_arguments(
   '-D_GNU_SOURCE',
diff --git a/tools/gpiotools.c b/tools/gpiotools.c
new file mode 100644
index 0000000000000000000000000000000000000000..dda36da888b94098231e977380aa38af2aa5069c
--- /dev/null
+++ b/tools/gpiotools.c
@@ -0,0 +1,437 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+// SPDX-FileCopyrightText: 2022 Kent Gibson <warthog618@gmail.com>
+// SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+
+#include <ctype.h>
+#include <dirent.h>
+#include <errno.h>
+#include <gpiod.h>
+#include <limits.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/stat.h>
+
+#include "gpiotools.h"
+
+#define GT_API __attribute__((visibility("default")))
+
+static bool isuint(const char *str)
+{
+	for (; *str && isdigit(*str); str++)
+		;
+
+	return *str == '\0';
+}
+
+static int parse_uint(const char *option)
+{
+	unsigned long o;
+	char *end;
+
+	o = strtoul(option, &end, 10);
+	if (*end == '\0' && o <= INT_MAX)
+		return o;
+
+	return -1;
+}
+
+static int chip_dir_filter(const struct dirent *entry)
+{
+	struct stat sb;
+	char *path;
+	int ret;
+
+	ret = asprintf(&path, "/dev/%s", entry->d_name);
+	if (ret < 0)
+		return 0;
+
+	ret = 0;
+	if (lstat(path, &sb) == 0 && !S_ISLNK(sb.st_mode) &&
+	    gpiod_is_gpiochip_device(path))
+		ret = 1;
+
+	free(path);
+
+	return ret;
+}
+
+GT_API char *gpiotools_chip_path_lookup(const char *id)
+{
+	char *path;
+	int ret;
+
+	if (isuint(id))
+		ret = asprintf(&path, "/dev/gpiochip%s", id);
+	else if (strchr(id, '/'))
+		ret = asprintf(&path, "%s", id);
+	else
+		ret = asprintf(&path, "/dev/%s", id);
+
+	if (ret < 0)
+		return NULL;
+
+	if (!gpiod_is_gpiochip_device(path)) {
+		free(path);
+		return NULL;
+	}
+
+	return path;
+}
+
+GT_API int gpiotools_all_chip_paths(char ***paths_ptr)
+{
+	int i, j, num_chips, ret;
+	struct dirent **entries;
+	char **paths;
+
+	num_chips = scandir("/dev/", &entries, chip_dir_filter, versionsort);
+	if (num_chips < 0)
+		return -1;
+
+	paths = calloc(num_chips, sizeof(*paths));
+	if (!paths) {
+		for (i = 0; i < num_chips; i++)
+			free(entries[i]);
+		free(entries);
+		return -1;
+	}
+
+	for (i = 0; i < num_chips; i++) {
+		ret = asprintf(&paths[i], "/dev/%s", entries[i]->d_name);
+		if (ret < 0) {
+			for (j = 0; j < i; j++)
+				free(paths[j]);
+			free(paths);
+			for (j = 0; j < num_chips; j++)
+				free(entries[j]);
+			free(entries);
+			return -1;
+		}
+	}
+
+	*paths_ptr = paths;
+
+	for (i = 0; i < num_chips; i++)
+		free(entries[i]);
+	free(entries);
+
+	return num_chips;
+}
+
+GT_API int gpiotools_chip_paths(const char *id, char ***paths_ptr)
+{
+	char **paths, *path;
+
+	if (!id)
+		return gpiotools_all_chip_paths(paths_ptr);
+
+	path = gpiotools_chip_path_lookup(id);
+	if (!path)
+		return 0;
+
+	paths = malloc(sizeof(*paths));
+	if (!paths) {
+		free(path);
+		return -1;
+	}
+
+	paths[0] = path;
+	*paths_ptr = paths;
+
+	return 1;
+}
+
+GT_API struct gpiotools_line_resolver *
+gpiotools_resolver_init(int num_lines, char **lines, int num_chips,
+			bool strict, bool by_name)
+{
+	struct gpiotools_line_resolver *resolver;
+	struct gpiotools_resolved_line *line;
+	size_t resolver_size;
+	int i;
+
+	resolver_size = sizeof(*resolver) + num_lines * sizeof(*line);
+	resolver = malloc(resolver_size);
+	if (!resolver)
+		return NULL;
+
+	memset(resolver, 0, resolver_size);
+
+	resolver->chips = calloc(num_chips,
+				 sizeof(struct gpiotools_resolved_chip));
+	if (!resolver->chips) {
+		free(resolver);
+		return NULL;
+	}
+
+	resolver->num_lines = num_lines;
+	resolver->strict = strict;
+
+	for (i = 0; i < num_lines; i++) {
+		line = &resolver->lines[i];
+		line->id = lines[i];
+		line->id_as_offset = by_name ? -1 : parse_uint(lines[i]);
+		line->chip_num = -1;
+	}
+
+	return resolver;
+}
+
+GT_API bool
+gpiotools_resolve_lines_by_offset(struct gpiotools_line_resolver *resolver,
+				  unsigned int num_lines)
+{
+	struct gpiotools_resolved_line *line;
+	bool used = false;
+	int i;
+
+	for (i = 0; i < resolver->num_lines; i++) {
+		line = &resolver->lines[i];
+
+		if ((line->id_as_offset != -1) &&
+		    (line->id_as_offset < (int)num_lines)) {
+			line->chip_num = 0;
+			line->offset = line->id_as_offset;
+			line->resolved = true;
+			used = true;
+		}
+	}
+
+	return used;
+}
+
+GT_API bool gpiotools_resolve_done(struct gpiotools_line_resolver *resolver)
+{
+	return (!resolver->strict &&
+		resolver->num_found >= resolver->num_lines);
+}
+
+/*
+ * Try to match a single line_info against all requested lines in the resolver.
+ * Returns true if the info was claimed by at least one line, false otherwise.
+ * On strict-mode uniqueness violation sets errno to EEXIST and returns false.
+ */
+static bool resolve_line(struct gpiotools_line_resolver *resolver,
+			 struct gpiod_line_info *info, int chip_num)
+{
+	struct gpiotools_resolved_line *line;
+	bool resolved = false;
+	unsigned int offset;
+	const char *name;
+	int i;
+
+	offset = gpiod_line_info_get_offset(info);
+	for (i = 0; i < resolver->num_lines; i++) {
+		line = &resolver->lines[i];
+
+		/* already resolved by offset? */
+		if (line->resolved && (line->offset == offset) &&
+		    (line->chip_num == chip_num)) {
+			line->info = info;
+			resolver->num_found++;
+			resolved = true;
+		}
+
+		if (line->resolved && !resolver->strict)
+			continue;
+
+		/* else resolve by name */
+		name = gpiod_line_info_get_name(info);
+		if (name && strcmp(line->id, name) == 0) {
+			if (resolver->strict && line->resolved) {
+				line->not_unique = true;
+				return false;
+			}
+
+			line->offset = offset;
+			line->info = info;
+			line->chip_num = resolver->num_chips;
+			line->resolved = true;
+			resolver->num_found++;
+			resolved = true;
+		}
+	}
+
+	return resolved;
+}
+
+GT_API struct gpiotools_line_resolver *
+gpiotools_resolve_lines(int num_lines, char **lines, const char *chip_id,
+			bool strict, bool by_name)
+{
+	struct gpiotools_line_resolver *resolver;
+	struct gpiod_chip_info *chip_info;
+	struct gpiod_line_info *line_info;
+	int num_chips, i, offset;
+	struct gpiod_chip *chip;
+	bool chip_used;
+	char **paths;
+
+	if (!chip_id)
+		by_name = true;
+
+	num_chips = gpiotools_chip_paths(chip_id, &paths);
+	if (num_chips < 0)
+		return NULL;
+	if (chip_id && (num_chips == 0)) {
+		errno = ENODEV;
+		return NULL;
+	}
+
+	resolver = gpiotools_resolver_init(num_lines, lines, num_chips,
+					   strict, by_name);
+	if (!resolver)
+		goto err_free_paths;
+
+	for (i = 0; (i < num_chips) && !gpiotools_resolve_done(resolver); i++) {
+		chip_used = false;
+		chip = gpiod_chip_open(paths[i]);
+		if (!chip) {
+			if (errno == EACCES && !chip_id) {
+				free(paths[i]);
+				paths[i] = NULL;
+				continue;
+			}
+
+			goto err_free_resolver;
+		}
+
+		chip_info = gpiod_chip_get_info(chip);
+		if (!chip_info) {
+			gpiod_chip_close(chip);
+			goto err_free_resolver;
+		}
+
+		num_lines = gpiod_chip_info_get_num_lines(chip_info);
+
+		if (i == 0 && chip_id && !by_name)
+			chip_used = gpiotools_resolve_lines_by_offset(resolver,
+								      num_lines);
+
+		for (offset = 0;
+		     (offset < num_lines) && !gpiotools_resolve_done(resolver);
+		     offset++) {
+			line_info = gpiod_chip_get_line_info(chip, offset);
+			if (!line_info) {
+				gpiod_chip_info_free(chip_info);
+				gpiod_chip_close(chip);
+				goto err_free_resolver;
+			}
+
+			if (resolve_line(resolver, line_info, i)) {
+				chip_used = true;
+			} else {
+				gpiod_line_info_free(line_info);
+			}
+		}
+
+		gpiod_chip_close(chip);
+
+		if (chip_used) {
+			resolver->chips[resolver->num_chips].info = chip_info;
+			resolver->chips[resolver->num_chips].path = paths[i];
+			paths[i] = NULL;
+			resolver->num_chips++;
+		} else {
+			gpiod_chip_info_free(chip_info);
+			free(paths[i]);
+			paths[i] = NULL;
+		}
+	}
+
+	free(paths);
+
+	return resolver;
+
+err_free_resolver:
+	gpiotools_free_line_resolver(resolver);
+err_free_paths:
+	for (i = 0; i < num_chips; i++)
+		free(paths[i]);
+	free(paths);
+
+	return NULL;
+}
+
+GT_API void gpiotools_free_line_resolver(struct gpiotools_line_resolver *resolver)
+{
+	int i;
+
+	if (!resolver)
+		return;
+
+	for (i = 0; i < resolver->num_lines; i++)
+		gpiod_line_info_free(resolver->lines[i].info);
+
+	for (i = 0; i < resolver->num_chips; i++) {
+		gpiod_chip_info_free(resolver->chips[i].info);
+		free(resolver->chips[i].path);
+	}
+
+	free(resolver->chips);
+	free(resolver);
+}
+
+GT_API int
+gpiotools_get_line_offsets_and_values(struct gpiotools_line_resolver *resolver,
+				      int chip_num, unsigned int *offsets,
+				      enum gpiod_line_value *values)
+{
+	struct gpiotools_resolved_line *line;
+	int i, num_lines = 0;
+
+	for (i = 0; i < resolver->num_lines; i++) {
+		line = &resolver->lines[i];
+
+		if (line->chip_num == chip_num) {
+			offsets[num_lines] = line->offset;
+			if (values)
+				values[num_lines] = line->value;
+
+			num_lines++;
+		}
+	}
+
+	return num_lines;
+}
+
+GT_API const char *
+gpiotools_get_chip_name(struct gpiotools_line_resolver *resolver,
+			int chip_num)
+{
+	return gpiod_chip_info_get_name(resolver->chips[chip_num].info);
+}
+
+GT_API const char *
+gpiotools_get_line_name(struct gpiotools_line_resolver *resolver,
+			int chip_num, unsigned int offset)
+{
+	struct gpiotools_resolved_line *line;
+	int i;
+
+	for (i = 0; i < resolver->num_lines; i++) {
+		line = &resolver->lines[i];
+
+		if (line->info && line->offset == offset &&
+		    line->chip_num == chip_num)
+			return gpiod_line_info_get_name(resolver->lines[i].info);
+	}
+
+	return NULL;
+}
+
+GT_API void gpiotools_set_line_values(struct gpiotools_line_resolver *resolver,
+				      int chip_num,
+				      enum gpiod_line_value *values)
+{
+	int i, j;
+
+	for (i = 0, j = 0; i < resolver->num_lines; i++) {
+		if (resolver->lines[i].chip_num == chip_num) {
+			resolver->lines[i].value = values[j];
+			j++;
+		}
+	}
+}
diff --git a/tools/gpiotools.h b/tools/gpiotools.h
new file mode 100644
index 0000000000000000000000000000000000000000..f1c35c436fe5acf837e4b0487cea16925112c2e1
--- /dev/null
+++ b/tools/gpiotools.h
@@ -0,0 +1,236 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com> */
+/* SPDX-FileCopyrightText: 2022 Kent Gibson <warthog618@gmail.com> */
+/* SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries */
+
+/**
+ * @file gpiotools.h
+ */
+
+#ifndef __GPIOTOOLS_H__
+#define __GPIOTOOLS_H__
+
+#include <gpiod.h>
+#include <stdbool.h>
+#include <stdint.h>
+
+/**
+ * @defgroup gpiotools GPIO tools helpers
+ * @{
+ *
+ * Reusable chip and line resolution helpers used by the suite of GPIO
+ * command-line tools. These functions allow users to build their own programs
+ * on top of libgpiod using the same high-level abstractions as the gpio-tools.
+ *
+ * Unlike libgpiod core C API, public structures exposed by libgpiotools are
+ * not opaque by design. The goal is to allow easy access to members without
+ * providing a large number of very similar accessors. We leave some padding
+ * for potential future extensions.
+ *
+ * Error handling: functions typically return negative integer values or NULL
+ * pointers on failure and set errno to indicate the cause unless otherwise
+ * noted.
+ */
+
+/**
+ * @brief Descriptor for a single resolved GPIO line.
+ */
+struct gpiotools_resolved_line {
+	/** Identifier string from the command line. */
+	const char *id;
+	/**
+	 * ID parsed as an integer offset, or -1 if the line must be resolved
+	 * by name.
+	 */
+	int id_as_offset;
+	/** True once the line has been located on a chip. */
+	bool resolved;
+	/** True if strict mode found the name on more than one chip. */
+	bool not_unique;
+	/** Line info object; only valid once resolved. */
+	struct gpiod_line_info *info;
+	/** Index of the owning chip in the resolver's chips array. */
+	int chip_num;
+	/** Offset of the line on its chip. */
+	unsigned int offset;
+	/** Line value used by gpioget/gpioset. */
+	int value;
+	/** @cond INTERNAL */
+	/* Reserved for future extensions. */
+	uint32_t padding[5];
+	/** @endcond */
+};
+
+/**
+ * @brief Descriptor for a single GPIO chip referenced by a resolver.
+ */
+struct gpiotools_resolved_chip {
+	/** Chip info object. */
+	struct gpiod_chip_info *info;
+	/** Path to the chip device file. */
+	char *path;
+	/** @cond INTERNAL */
+	/* Reserved for future extensions. */
+	uint32_t padding[5];
+	/** @endcond */
+};
+
+/**
+ * @brief Resolver mapping requested line names or offsets to GPIO lines.
+ */
+struct gpiotools_line_resolver {
+	/** Number of chips the lines span; also the number of entries in chips. */
+	int num_chips;
+	/** Number of entries in lines. */
+	int num_lines;
+	/** Number of lines that have been found so far. */
+	int num_found;
+	/** If true, perform an exhaustive search to verify line name uniqueness. */
+	bool strict;
+	/** Array of chip descriptors for the chips that own the requested lines. */
+	struct gpiotools_resolved_chip *chips;
+	/** @cond INTERNAL */
+	/* Reserved for future extensions. */
+	uint32_t padding[10];
+	/** @endcond */
+	/** Flexible array of line descriptors for the requested lines. */
+	struct gpiotools_resolved_line lines[];
+};
+
+/**
+ * @brief Look up the path to a GPIO chip device.
+ * @param id Chip identifier: a number ("0"), a name ("gpiochip0"), or a path
+ *           ("/dev/gpiochip0").
+ * @return Pointer to a newly allocated string containing the filesystem path
+ *         to the GPIO chip or NULL on failure. The user is responsible for
+ *         calling free() on the pointer returned on success.
+ */
+char *gpiotools_chip_path_lookup(const char *id);
+
+/**
+ * @brief Get the paths of GPIO chip devices matching an identifier.
+ * @param id Chip identifier, or NULL to return all chips.
+ * @param paths_ptr On success, set to a newly allocated array of path strings.
+ *                  The caller must free() each element and the array itself.
+ * @return Number of chips found (0 if none), or negative errno on error.
+ */
+int gpiotools_chip_paths(const char *id, char ***paths_ptr);
+
+/**
+ * @brief Get the paths of all GPIO chip devices on the system.
+ * @param paths_ptr On success, set to a newly allocated array of path strings.
+ *                  The caller must free() each element and the array itself.
+ * @return Number of chips found (0 if none), or negative errno on error.
+ */
+int gpiotools_all_chip_paths(char ***paths_ptr);
+
+/**
+ * @brief Allocate and initialise a line resolver.
+ * @param num_lines Number of lines to resolve.
+ * @param lines Array of line identifiers (names or offset strings).
+ * @param num_chips Number of chips to allocate space for.
+ * @param strict If true, perform an exhaustive search to verify that line
+ *               names are unique.
+ * @param by_name If true, treat all identifiers as names; if false, try to
+ *                parse them as numeric offsets first.
+ * @return Pointer to the new resolver, or NULL on failure.
+ */
+struct gpiotools_line_resolver *
+gpiotools_resolver_init(int num_lines, char **lines, int num_chips,
+			bool strict, bool by_name);
+
+/**
+ * @brief Resolve lines by numeric offset.
+ * @param resolver Resolver to update.
+ * @param num_lines Number of lines on the chip.
+ *
+ * Marks lines whose identifier was successfully parsed as a numeric offset as
+ * resolved. Only applies to the first chip (chip_num == 0).
+ *
+ * @return True if any line was resolved, false otherwise.
+ */
+bool gpiotools_resolve_lines_by_offset(struct gpiotools_line_resolver *resolver,
+				       unsigned int num_lines);
+
+/**
+ * @brief Check whether line resolution is complete.
+ * @param resolver Resolver to check.
+ *
+ * In non-strict mode, resolution is considered done when all requested lines
+ * have been found. In strict mode this always returns false so that the
+ * caller performs an exhaustive search.
+ *
+ * @return True if resolution is complete, false otherwise.
+ */
+bool gpiotools_resolve_done(struct gpiotools_line_resolver *resolver);
+
+/**
+ * @brief Resolve line names or offsets to GPIO lines on the system.
+ * @param num_lines Number of lines to resolve.
+ * @param lines Array of line identifiers (names or offset strings).
+ * @param chip_id Chip identifier to restrict the search, or NULL to search
+ *                all chips.
+ * @param strict If true, verify that line names are unique across all chips.
+ * @param by_name If true, treat all identifiers as names.
+ * @return Pointer to the populated resolver, or NULL on error with errno set.
+ */
+struct gpiotools_line_resolver *
+gpiotools_resolve_lines(int num_lines, char **lines, const char *chip_id,
+			bool strict, bool by_name);
+
+/**
+ * @brief Free a line resolver and all memory it owns.
+ * @param resolver Resolver to free.  May be NULL.
+ */
+void gpiotools_free_line_resolver(struct gpiotools_line_resolver *resolver);
+
+/**
+ * @brief Extract offsets and optionally values for lines on a specific chip.
+ * @param resolver Resolver containing the resolved lines.
+ * @param chip_num Index of the chip to query.
+ * @param offsets Pre-allocated array to receive the line offsets.
+ * @param values Pre-allocated array to receive the line values, or NULL.
+ * @return Number of lines belonging to the specified chip.
+ * @note offsets and values must be large enough to hold the number of lines
+ *       stored in the resolver
+ */
+int
+gpiotools_get_line_offsets_and_values(struct gpiotools_line_resolver *resolver,
+				      int chip_num, unsigned int *offsets,
+				      enum gpiod_line_value *values);
+
+/**
+ * @brief Get the name of a chip referenced by the resolver.
+ * @param resolver Resolver containing the chip.
+ * @param chip_num Index of the chip.
+ * @return Pointer to the chip name string owned by the resolver.
+ */
+const char *gpiotools_get_chip_name(struct gpiotools_line_resolver *resolver,
+				    int chip_num);
+
+/**
+ * @brief Get the name of a resolved line.
+ * @param resolver Resolver containing the line.
+ * @param chip_num Index of the chip the line belongs to.
+ * @param offset Offset of the line on the chip.
+ * @return Pointer to the line name string owned by the resolver, or NULL if
+ *         the line has no name.
+ */
+const char *gpiotools_get_line_name(struct gpiotools_line_resolver *resolver,
+				    int chip_num, unsigned int offset);
+
+/**
+ * @brief Update line values stored in the resolver for a specific chip.
+ * @param resolver Resolver to update.
+ * @param chip_num Index of the chip whose lines should be updated.
+ * @param values Array of values to store, one per line on the chip in the
+ *               order they appear in the resolver.
+ */
+void gpiotools_set_line_values(struct gpiotools_line_resolver *resolver,
+			       int chip_num, enum gpiod_line_value *values);
+
+/**
+ * @}
+ */
+
+#endif /* __GPIOTOOLS_H__ */
diff --git a/tools/meson.build b/tools/meson.build
index b26718ba69679d03d210562768f71ea02bc3ed01..d755167cfbd7c2a7400d28cf5e5d5f9eece699d7 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -1,6 +1,26 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
 
+libgpiotools_lib = library('gpiotools',
+  sources: ['gpiotools.c'],
+  include_directories: libgpiod_inc,
+  c_args: ['-fvisibility=hidden'],
+  dependencies: [libgpiod_dep],
+  version: libgpiotools_version,
+  soversion: libgpiotools_soversion,
+  install: true,
+)
+
+install_headers('gpiotools.h')
+
+pkgconfig = import('pkgconfig')
+pkgconfig.generate(libgpiotools_lib,
+  name: 'libgpiotools',
+  description: 'Collection of high-level functions for building programs using libgpiod',
+  url: project_url,
+  version: meson.project_version(),
+)
+
 tools_common_lib = static_library('tools-common',
   sources: ['tools-common.c'],
   include_directories: libgpiod_inc,

-- 
2.47.3


