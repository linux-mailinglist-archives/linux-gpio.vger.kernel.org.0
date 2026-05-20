Return-Path: <linux-gpio+bounces-37200-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBYXKVK2DWrC2QUAu9opvQ
	(envelope-from <linux-gpio+bounces-37200-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 15:25:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA1D58EB70
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 15:25:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7EA263007A69
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 13:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 472103A3826;
	Wed, 20 May 2026 13:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lGIXG3wK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gdT2/3J7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39E0348477
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 13:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779283532; cv=none; b=UV+tp1cdA/hKuPJCD7MjmtUJBDgqi2NXV/MCOSisKB/ComY9Vwbbs2lXHZ3egrFtleqy3UeKDdDBv15ZNa2Nq7iF71Wpu0ybNdmMRKh6VmAcY3VGqUef1rtU5ijlUlenWT7ZDqXtyGuYFnJnnM0LliOGlvjvfPFcTXcgDRGhCFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779283532; c=relaxed/simple;
	bh=dpBzg9zlTDjazIxohgR7RWnyk6NZm9rP0R7pOhYKmYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NTMlxmr/nYFbsTASCWT23KRvJui3coyObN6WYHRsyjsdK2IGifJwxhZb8lnwdRuqtDZ7sQkNxIZPj3VW9gUloJevHzChwhhRoCazzeFpb8EtRcKVqNlmEcRluwHWPtQm1cmF6NGUu9ljaav78ji+ESmHiF/MUuN/N7I9f6zGJio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lGIXG3wK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gdT2/3J7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K78xOC1725401
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 13:25:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GH1S6x8/f0fwRU6JS2rGdz1EF99sFIqi+K1xw1yVSeE=; b=lGIXG3wKhLv4+KbX
	sfFu0jOizzrssOI+O6DIpaskgCaWcbzM6TnRGvmBha16Ku8l9A856Pa+fbvCrEVN
	fH/77OYCewMxqVzgDof1YTxt21TcAdYiqwqLvqxosl3mEGl9kRRrHxFe3gpDwPiL
	b58f51hj3mWqglfq8L//4rDDAcelIugB8YLPKHO5W6GoSXARrbP1MP2EoMUQPMEe
	VN5mzVFnVS4mwN82zmHe7nR/HAyiilY7fcanY0E9CgV5M6gHh0R3guXMi3xCvnqV
	5IiFZSuYOF3XLPMmHl6jP46QWpxUAFQaSNEGj9zYu7GKk8Pp6yTh75IkRRtDVnBO
	o0JoPA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3qmwjy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 13:25:30 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-63271d633b5so3281193137.3
        for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 06:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779283529; x=1779888329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GH1S6x8/f0fwRU6JS2rGdz1EF99sFIqi+K1xw1yVSeE=;
        b=gdT2/3J7108Qyd3eZXjjNK26wbD6QuJwzKizdGNy1RiTTJq9bKMFPmRq8c1qAvOQol
         DJHFs50U4AtfhxRI5h6m+vNbUBAxHB4rZs50C7xPJXZvGEOLcyFZPuHGvh0I/vaI9LgO
         4Jf5y7onIjvJ9YmyNllOo+a+YZeKhES/58zJJZkGOBqxBjB64Yb7BDrfOekAURTrxVRF
         +OxRWwwHslwuhAqRfhUMkWVAlcDRkg6n19RxqAjSo6tq07SF5w+WoS2EhVLAxtTSj9PN
         c9w1+lv5Sls5377lfJ5+BUz0PGCPYre32OZD8V3S8yrNCEWbBLHSl6aZY2pVTJ3QkX+D
         D1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779283529; x=1779888329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GH1S6x8/f0fwRU6JS2rGdz1EF99sFIqi+K1xw1yVSeE=;
        b=DckTnex7OwO3nWPZ+Q2MFhPP4a4Kg/ZJ8FMWAwVA86c5f95n1A+qezaOWzeo0LieHW
         B4HVruRzyVV2HZfw3Pm3pbIQKc4orzuz9HWfgNeXoZaFfpLR70oNK9BjWZ+kDvjWxf/H
         H72+WQl/Mziuua46gj74n3ZGZO5tMmTmsL6S5NSV457uYYPaQ6ex46QvcCjZMfN0CFfj
         prIe0uASeoAlNniW+58yd4zTfGsPDr3DQ9uyXywtxjqbrLIwR8bYAgzwLHVcBT9CkMPK
         Mdp306pmrZtCW5i2tnpwEnHN6JRKKvR66k1WFb82r4ZLzN/2jHgmfsmg6wM3YwCNCICE
         vaEw==
X-Gm-Message-State: AOJu0YyXyp1dMzQkRyg0E+/ZnFxUj6s9bOO9/6D2Oi8/LrSQ5pNzf/cp
	S8WGaIZYt/fkmz/HmV+P5X0cFRfRciMx6e+MqEPtxjVswaIJU18+SNAZzKoyou+LgT5lOO7zkGZ
	jHaa7VhnjwzYzNCSSuC4trH2Qnk2puNxX7GRHyvNIFpobTj/Egm0EgYYJPAyCwkz9Sc5ve7fw
X-Gm-Gg: Acq92OHnemppGHrDjvMbVcDZwDcRGIh7A3D8Xrp7v4xS5bOOZl6jovWyUkMn7IjPkkQ
	xFwhlSF8o5QtcXdPaf9oml/kXz5lF+2+wqG/VKvPpUEojy+mCRRJCHLbpYWFQtyvvpaA5iuZzm3
	2vYyIovf4YUbShkrmN8xb7ygkDHcYbMJk17g2J5bc8U15eSDqBEaFOc5XBjws16E3GnGoxouRIf
	sJPi/pepfV2WsvRfPGYA74RAkfpq6V+y0GRYUYKFDhExQ6ukqlYAXWpWznm+fxwPe7HvVVBK1Wl
	0oSjTkRXGKQ5sYdPz3cDRWzRszLiIVegNP2o5zDUvUW1nKafHd5ZLBHEPosreiZkVJj12+3QHN5
	ETljPFnsqFXLO2BuT3dxXthgL+Pr6vbILbT0YfO1XJXNBMK98KQ==
X-Received: by 2002:a05:6102:374b:b0:631:23fa:38d7 with SMTP id ada2fe7eead31-63a3f18505cmr10776254137.14.1779283528975;
        Wed, 20 May 2026 06:25:28 -0700 (PDT)
X-Received: by 2002:a05:6102:374b:b0:631:23fa:38d7 with SMTP id ada2fe7eead31-63a3f18505cmr10776195137.14.1779283528471;
        Wed, 20 May 2026 06:25:28 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:9ec3:885a:6d78:48d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe58638sm127925495e9.17.2026.05.20.06.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:25:27 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev
Subject: Re: [PATCH] gpio: en7523: allow COMPILE_TEST builds
Date: Wed, 20 May 2026 15:25:23 +0200
Message-ID: <177928351979.51371.15501091389617115126.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260519005912.628667-1-rosenp@gmail.com>
References: <20260519005912.628667-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEzMCBTYWx0ZWRfX0Ei9sovJs+1+
 xGmgb9vautl56whCR9CQ45TR06gPD8KeNwBg9geEUKDZD7dqqL7asvvyJxXVZA8bN/PGZLjbGj7
 e98PHlkKYfp9a+BpQw/eb8bAUXbb24ElXwSJxu8NjDvL3xbd4t8bP2J+03H6AFc8W3COTBJj0M8
 jaCqroXmx+9Gc5zdXN/B9kRpDz2Yjr240y6mT8pjwjM9d0AsHeAUyvEUsy54scSW0E/AKwKCZza
 Tew500eVhR7SncauqmsUSwSq2scwjNQHHwV8ZxaDWnXM1c9/3Q4dMfo7KVZFDuikNBo9dTcKgPV
 xhknElDd9X7Tn5zRL0mC/6o902rUzZS+IBq+bsxUVFPfgx9ZCkojcWWiU1B5ZoIhk5MNMRngWEk
 dsp4NW0KPzdRsNpMbtE4wNPWx/CGNTcw2q3eJChyn0CZIDawoWknWcvbhoix/M4Lq7WHr2Y2WRn
 2jHDs6YajFKs03QJZQw==
X-Authority-Analysis: v=2.4 cv=N9cZ0W9B c=1 sm=1 tr=0 ts=6a0db64a cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dBzKjp2fhYOy3RD5rRUA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: HAiy_CPevJX_OmtcJcabGmDka8Hz5q9h
X-Proofpoint-ORIG-GUID: HAiy_CPevJX_OmtcJcabGmDka8Hz5q9h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200130
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,google.com,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37200-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,lkml];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CBA1D58EB70
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 18 May 2026 17:59:12 -0700, Rosen Penev wrote:
> The Airoha EN7523 GPIO driver uses generic platform, MMIO, and gpiolib
> interfaces.  Allow it to build with COMPILE_TEST so it gets coverage on
> non-Airoha platforms.
> 
> Tested with:
> make LLVM=1 ARCH=loongarch drivers/gpio/gpio-en7523.o
> 
> [...]

Applied, thanks!

[1/1] gpio: en7523: allow COMPILE_TEST builds
      https://git.kernel.org/brgl/c/292e7cab58e2ce1f9213a6a326eb314e18756459

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

