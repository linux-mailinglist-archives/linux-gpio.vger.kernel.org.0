Return-Path: <linux-gpio+bounces-29404-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A67CAF00D
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Dec 2025 07:12:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C249C303092B
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Dec 2025 06:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08D16320A0B;
	Tue,  9 Dec 2025 06:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BHpfpaQF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PO41EEi1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B51E320383
	for <linux-gpio@vger.kernel.org>; Tue,  9 Dec 2025 06:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765260770; cv=none; b=m4hSpxgUPesdKpm9ZEFarfkXrGpKVgtFP9awMTPhpKjigjj8bF3DYeiSbQIfJFGOcuBa/LduZIob9AL00MDG07ujLx97VaJ5yhezmMZEec3ziMlQ3quVGecmo73ZGqRUBPuNDNBMRUblNdlBLl7Xx69VgbDmAwyUd4lyaccImig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765260770; c=relaxed/simple;
	bh=5HEwMc6g/H+WmnrQeMOy4bf3TlkDuTzuPc7R+m64k60=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VXvpNx3NElSxVGFx05gAcqKgNK1uvzFUm61wW0nEPiga3p+qtUU2RzJYc1QrqAZROhFnjjA6nmTR3GT+awaZQ1EE/R3VSteB5NUaL1sBIqSHkcDwVZ4lIRBZ/2TK0cs7v+1OV1rn97rugLVsuei1S9JydUVINQQHet9jyAFyYBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BHpfpaQF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PO41EEi1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8NXbC92430571
	for <linux-gpio@vger.kernel.org>; Tue, 9 Dec 2025 06:12:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/4YrqwbCQbEUroydksm+hI1mp31D40f4JPv
	aO4QqkN8=; b=BHpfpaQFBR7jKvT85E9brEImrrQqFfFjmYM5qjI6Vxjk/bTlph0
	wgut916uUk+zY1+qrGK19zJdbQ1JHXOiz3baJtqrbmyY4XQQHZ8LgOHF5gTNkqjs
	oa+VOf+A/+KKJ9SAh0D8k91fuOG4stbY9niSLcvZCPacok8/LbLnO2b3jk1eZ4MF
	KqrHnHR9b9tyWRnU5j7VohwXSkbzQr5oEAhE9n0Fv6rg+bdzIAKrbanalYfoJZO3
	NOl5XD4vYtORXjronf4NEJrz2e/08h/BiJCJRUK+NtBw4av+avq0oPUUnBZO5NTk
	/wicEHaQJG9zy2vN8VTfF9cSJObJLSxDn7A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ax2rf1x0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 09 Dec 2025 06:12:47 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7d5564057d0so14097484b3a.0
        for <linux-gpio@vger.kernel.org>; Mon, 08 Dec 2025 22:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765260767; x=1765865567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/4YrqwbCQbEUroydksm+hI1mp31D40f4JPvaO4QqkN8=;
        b=PO41EEi1YzbNt+bkJzEYQac4jFIgHtIvV3n9JR04bbYKa+UWfkTIoSmoMo6WTz4ake
         dVLmg2+WjoucGZlyM8GnSwNuy2RjCI+T1+xY1hHmvFmT5FcLwVBCJCvbpul71Z26FWy/
         zt4dEHLcZP2eU8KITg9eJoEjioQGPZVjkbWGoGeJsIlXAGrpCNGao4K3eW0BT+H1qfXV
         5uPvszoIypQ9X9ll50/iQzdMVl14cZFJl4IG8GlspeZIPnEZT2m5kJOvhVvxzN2NaIgr
         FwWAve91d1uM3+gH5k9W9t36kyFIFTSaMhogHzT2+k+89ur3io5fC5L70ne1gPps6FLl
         GRfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765260767; x=1765865567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4YrqwbCQbEUroydksm+hI1mp31D40f4JPvaO4QqkN8=;
        b=hEOP9e6HxqG0PMrv3tsCaAXleqPyfjUVTtn+L+gE4gZ4A97zR41zBU8xoqPG7B8MLW
         WH8GFP76Gdd31T8r9AtjHoHV+IAmkwvesgnZwXaj+WzBUtXPLGXZUa/QlyoSqkfL2Fuz
         axBCj6zQ/YwnM0PLy1K5tPaWA0hulyLzKX0XgBqhPbwp8FWr+os+EYnQF7oT7ypbEsV5
         wB7JIWPC5Z13dxMRJSnUgPLF8eZoJPJVHNGfeWQKfBT690iQZZ6n96saUNmjNc07MgBP
         lWt2pNCsaz/6RupHheFwnI80Q0tU4e0hTQZPWCgGQWpGq7CO6Z/cxWd8LUQnWAN30yKB
         CsUA==
X-Gm-Message-State: AOJu0Ywckoeu1ZeBJX2K9aC2BHonJx1TCYWqGI8V6SiLJCr4B3rW9L96
	nDYs2pKTDk7m3WKZ36mzDWFVhzzhDx7NGbZQnpzcdRHFzK7ogw2NzHgqgiZBH1LlPTcHfLkk75X
	BpgHAZDb+7MOa+2dP70UEhlRRQiIjJifY1OmoRgCCBVWrWLjTcWEML952Ig77qdSp
X-Gm-Gg: ASbGncsnKZC0oiO4V061DUKTc5yxik8wxt5RPnIIZyHpM1m91jLz8Q9s12VeyTSIRNt
	cXMA1uFYud+gE1QcpOJfAIyMJOzTpuS/Y5Ufh+PdIbELDWszsBu4vkFtfBAYwLKhvCzijv2WgAK
	nQWsKG3Ednc0jQAOOdyHqaIlddaXeWeyCDZu/FC3uI59UtZC8RcydrIA1NxmLV210Q7QChgp9xE
	peFyDHNYXN8WWwvdHxLLzxREBfSyU3QrvI7fFjOPi0PBofhjtjnlNgOzVcoNme+0KMjodw9FUsT
	JkPli6iz55I7XYw1iGHE9ofmPJF4sCosmkRHct6p4Uk/D/RvHxECYhVlMAAFVizwzBRYtKSv6gd
	hnN1jwQLLLCmu67ViylENv57hAHAutfwUTCUxP4AGHvwIEIycZeGODa6VdEyOG8U=
X-Received: by 2002:a05:6a20:7d8b:b0:35d:cad7:cd63 with SMTP id adf61e73a8af0-36617e83b4amr9642897637.30.1765260767038;
        Mon, 08 Dec 2025 22:12:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0PBmC+WHQP3uF9gMRmBLS7UutMbhLozQqQ3F8Nx/VflyKd/TqjFoD6aF0IESEtICN8Y9LqA==
X-Received: by 2002:a05:6a20:7d8b:b0:35d:cad7:cd63 with SMTP id adf61e73a8af0-36617e83b4amr9642875637.30.1765260766618;
        Mon, 08 Dec 2025 22:12:46 -0800 (PST)
Received: from brgl-uxlite (fs96f9c361.tkyc007.ap.nuro.jp. [150.249.195.97])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0259dd7bdesm4249459a12.27.2025.12.08.22.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 22:12:46 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Daniel Gibson <daniel@gibson.sh>
Subject: [PATCH] gpio: it87: balance superio enter/exit calls in error path
Date: Tue,  9 Dec 2025 07:12:36 +0100
Message-ID: <20251209061237.7949-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ee0wvrEH c=1 sm=1 tr=0 ts=6937bde0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=kS9sT8ua8GhuIhCqqd6Lkg==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Rq-G4BoJ1QqpnPmLVJEA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 4Yic8DKnCOL9vHQsDwVMgKmLwgrhpNnc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA0NSBTYWx0ZWRfXy0u2Oxv+dmw5
 RAOxWNdcnogsc/khZtJOB5s4IWw64YGwjCA+TXEudE2OOmH112i3tCO7TG5xLIqO736gNTMwKYi
 Ny3/xSLbhYOja8UPNU75YZxxHlx88H+lwLNfg59ci50xTNtRl1HbFJwW5CLMemD751xrI1dqCF0
 VHYiISRWlpP0AtOFgTOzqvUAhXDc53PNS9NDe+/gy5rXK717sMEsMwXWxRUT8Ufju997UhceapQ
 ZcIRkYpv+P3Fc8dKRBUvyfKJXEp5p2AB5bs8n+oCYcIV9lXfQ2TlHHnRIKNQoisq59YhZdptES6
 HV4zf8eJET9K+W09vvq+lNv1qbMIxdMpkJyEZ7vGd7Yr/THM9yMoW3bFeDhV7iJsC0jyXVniofw
 ok7wAlZWlwqce7W9+BmycPld4bjnAg==
X-Proofpoint-ORIG-GUID: 4Yic8DKnCOL9vHQsDwVMgKmLwgrhpNnc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_01,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090045

We always call superio_enter() in it87_gpio_direction_out() but only
call superio_exit() if the call to it87_gpio_set() succeeds. Move the
label to balance the calls in error path as well.

Fixes: ef877a159072 ("gpio: it87: use new line value setter callbacks")
Reported-by: Daniel Gibson <daniel@gibson.sh>
Closes: https://lore.kernel.org/all/bd0a00e3-9b8c-43e8-8772-e67b91f4c71e@gibson.sh/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpio-it87.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-it87.c b/drivers/gpio/gpio-it87.c
index 5d677bcfccf2..528ac1890613 100644
--- a/drivers/gpio/gpio-it87.c
+++ b/drivers/gpio/gpio-it87.c
@@ -254,9 +254,8 @@ static int it87_gpio_direction_out(struct gpio_chip *chip,
 	if (rc)
 		goto exit;
 
-	superio_exit();
-
 exit:
+	superio_exit();
 	spin_unlock(&it87_gpio->lock);
 	return rc;
 }
-- 
2.51.0


