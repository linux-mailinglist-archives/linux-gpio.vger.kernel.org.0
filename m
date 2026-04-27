Return-Path: <linux-gpio+bounces-35546-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDxRJh4572mD+gAAu9opvQ
	(envelope-from <linux-gpio+bounces-35546-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 12:23:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E6802470EA9
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 12:23:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7EC16307E88B
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 10:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A2F93B531D;
	Mon, 27 Apr 2026 10:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FvQOGicR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kUVYyOkA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676423B47C9
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 10:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777284896; cv=none; b=CgYOLMZ/D85sLBncP+dMmL/TV4jQP4j+JDxLsTEI9WCr7VDow2U5SeFdCAeeTcEmLvXX3NHq+XAIpvoQRsrSMesjDx/wSjmEM8gcy8+RXg9hq26lWVUv8/HJMFjwpnCVz1APGeRLUoHMPFGPqn7EUm+O0j2berFAaDY3HvwO++I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777284896; c=relaxed/simple;
	bh=dSj8QcbqhwM/xcyTOwocmZYInT51CeFqDex4cF/M15k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jolL7ZDegwdRifLZwBMWD05ThUSbE1XmVM9qUAo48OeZBA1iAsuUltbElaVDx62f5RfMsE4qJcT3L1YhwEvMQpY5UI4xhQ0m1e9fMk/kMmxF1/+bDXCTy9c4cl3h30L8EPx0eYWvT2+rrq+Ggy79c/eKu6elsdwtHjqpiLAZ6ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FvQOGicR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kUVYyOkA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R9OgEH3825281
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 10:14:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wVJly2KbK/XJ3iSoKi7tMW
	mJlaWYkcPh5yIHu0NXuKQ=; b=FvQOGicR6U8nmh+NuB1O9hXzAa/M3GXY/wdiXw
	pgd2o2VeS1oVJr9mESXTQU/Af7qpRJpYYGyBe4s9JUUsvOtFKuR+3GZJjIgv7fvq
	qvHa1lKfnubf7CC/FPRSfdJCoT5UYdY6GeoPPC6xm5dzNetZj4jM1SQcqpCKA8HR
	BsEn4lcBKoQdrRDXooikYgH58P5OPnLlrrzehf+5YogGa5QycQkNRmUM9T24aixl
	hEdmwkGCgXVpY6h46WZdDC8PePT+0LsxiAXj12JqExZRI8d45rhSWxBX4UBBUla5
	0V6G05H7DujNIHcZbPf5q/C5jP9S/9XLNyLFScnigrERR9wA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt555083x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 10:14:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d58bed44aso217331771cf.3
        for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 03:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777284891; x=1777889691; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wVJly2KbK/XJ3iSoKi7tMWmJlaWYkcPh5yIHu0NXuKQ=;
        b=kUVYyOkAgh4TIHCoiPHpeC9U8lGkTrxTh6wrAnmNifKQpUEEVTMUBVNfOUgT8AYT6G
         v8pX3Vt7ss2oKKJP1JnRds2xXs0ea4iSQ8dmSitwL/FxNXU3z+xMEqm/rPayT/n862Lp
         ZTVs7uAhSUbv5ru1KRx19C1xcP0Z2wVpPjH5zp+dsKWikI8ttu8bFBoDCL7Rp52EKfb9
         mBzBKdYEVJutK1G6RKzx1WhlST5R2HO1Gx+dnwanuHuNyF7I2CzioEn1+FyuMg5SaQoG
         DUaLL78rch64gdow205swhJTB+KxwvXpK5/h6mng7Aken190gTHpw0wBdq/k7DpSWt6w
         PkhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777284891; x=1777889691;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wVJly2KbK/XJ3iSoKi7tMWmJlaWYkcPh5yIHu0NXuKQ=;
        b=YpXA9yv7CB7IAA7CEZaCw071/fGdSvBZScKT3PnSH7QKeiwh/x7qEX5OY9K46IbnEI
         ZKL/zR5X9Y4mjgWbru2TXzjzGFpOUHY+cEbrMZo09nLhr9x6Zlc8y0lip0GmdCvvp+A6
         hFHece47qswhoVIGrQ2y2Fv12pso4gkv8pv21AcENtQKc4KnNuhluTzHgf0ozMsOV9fg
         oDqVRrseL+nQooZiLt6d/xqS7mgM9kTJKQhksyICS4xTTq/px2b9iCvEWhU23xWY1b2L
         TEvCv0E/BMpIqcwIi6njrgDdpnA9I4bVaG/PYY3y3n2+fiK0c6wIPmTf6eKULnXFYLoY
         l74A==
X-Forwarded-Encrypted: i=1; AFNElJ++Ynr8CQNCoOKtl/2M8soMiwpHLiUVTHEFSvqS9jp3MY95p/x8G+4P6bYXe1fY9yoEXUDxX5b8bAiL@vger.kernel.org
X-Gm-Message-State: AOJu0YwYWd+7JmatTVCjt8Z3dG4TA0S9bCrcPO0FU9M8PCIbZQpslBK3
	f6eYJi5aNcUQ9v7xYNUEBloW92NGe6MD/BI3pnmQCxRJMhCqPeVcjRdg7miCUi+4D7suEd5vYNe
	RsLYoo6I52eZ7E4IiozfNbthqa5HjHsUP82xQV3ijm4mNYXu/VALvYs/K59XKhBF6
X-Gm-Gg: AeBDieui1DzREQaw/Xxk+eS/fgbqc/8y5hTiYVxitbG/bx3bUZkD+/qHj4w3tD57cyh
	B86iy5UTuB0QyPx6x3seeyNYYcCGfh2+NSTjK55NnTJG5V2USThY8VB4kSBCzqgG7JhJIN5irp/
	to7wt5SdfNWMfwuisXxhXPcgLVlFBCTSU9hMrBr7ATmbIdan9duRLwhXWqs+DlmskiS1zYu+a5g
	otlORU4ZE3+nULuz1VrasF1vdrGOC4uuY/OHQb9bBNz8vMYAHG0g0aXVLyecPF4XxjUdhEscBVz
	STPwfWGMMS8D4CPjtdmrc2FMBm9JbKfWfRYuk0PA9I+bNfNWp6gMwNIS6CJ3WSgMcywzZV+ce92
	jnYhpMZ4EbivoIP0IpZpj7+MKw8twBHYtUDr6u7PCkXw+Grq4GoQjYqISDokjvA==
X-Received: by 2002:a05:622a:5516:b0:50f:b904:454 with SMTP id d75a77b69052e-50fb90405f0mr370935311cf.11.1777284890911;
        Mon, 27 Apr 2026 03:14:50 -0700 (PDT)
X-Received: by 2002:a05:622a:5516:b0:50f:b904:454 with SMTP id d75a77b69052e-50fb90405f0mr370934991cf.11.1777284890483;
        Mon, 27 Apr 2026 03:14:50 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5062:ae86:23aa:702c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb74c789sm235103445e9.5.2026.04.27.03.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:14:49 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/4] ARM: pxa: attach software nodes to the GPIO
 controllers
Date: Mon, 27 Apr 2026 12:14:31 +0200
Message-Id: <20260427-pxa-gpio-swnodes-v2-0-86fc24b9e714@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAc372kC/2WNwQqDMBBEf0Vy7ko2gSA99T+Kh2A2ulCNzbbWI
 v57U6GnXgbewLzZlFBmEnWuNpVpYeE0FTCnSnWDn3oCDoWV0cZpazXMq4d+5gTymlIgAbTGN+g
 jarKqzOZMkddDeW0LDyyPlN/Hw4Lf9ifDf9mCoCE6FxoXUIcmXJJIfX/6W5fGsS6h2n3fP3I92
 U+3AAAA
X-Change-ID: 20260330-pxa-gpio-swnodes-132a81af10e3
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1550;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=dSj8QcbqhwM/xcyTOwocmZYInT51CeFqDex4cF/M15k=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp7zcNXC+nCopNbtzxa8izNabMX9mR1bIFSaxzx
 sf27cFcB/qJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCae83DQAKCRAFnS7L/zaE
 w+YqD/0To0UqW/A9osp1ipMI0jSERxvWfK09+h/kZ6otcNDx8KnYOvqN0Bodi2/MLUzQIPnuKNE
 XrkNwn8zOWzXkMcFEejZMNARgtV6WABt0gCl7sMRdZiMJsza0/0XdzNsOBnd7VxZiPdCCLbWNif
 tjjd6dUan6rQZNJltaBS48Mu4g/eQtUTw+zvjlMzYcSZQLaDxl2ClqWYPv/XAPCINWGSXcb94dt
 vvb6QndYAIk68LJY8ZIomecHmUEBGXTts5DU5F0ycRb0mTm9yn3366Gwhgnm515OY2fLgAdOhON
 WILAk208dBYl4vvgwZxDYqH9QdI/mvQCvV95UGh/m69bpMFQz6TzNFzq5P5+onq1vevIDQfeVeA
 eWvOeZvKHL1G9pyIlCJ2yJrRA00FyxTf6e7LRAJNRyg/YpGXCsYgWz4p7ZdUnaDFD5xVsbDL8y/
 LGm1/OWnRyrURUp4v4gmNdiaJTdXrixGKwGK3r69Ca4XCstPnuuvRajS8sqibK6AlPgTteU6oSP
 HzILoM9q0LKbbgyYMnzRLU8zmynGVqnuRJwHIyCFmgmeAqdPxK2pxNI931J3Lu/48S2wkugrHeh
 ibQ7hdJY875hhHSnq5tsXdpGKm1xThe72PQ8YLnwnUpAIy58LGtf+gUXWsjiIdnsfMDIHB+eDrL
 uQwEBZIyZ9jrJdg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: R24y5e9xByqGrDmw6dDb_T7NCirxTe-m
X-Authority-Analysis: v=2.4 cv=CJEamxrD c=1 sm=1 tr=0 ts=69ef371b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=5j7h0pFm_H_taD54xyYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEwOCBTYWx0ZWRfXyswtzmqYl+zA
 fQ8xEmcqfPLgJkZFGp9S/XnS/YbaJER406o1AwEcYMdoEfBubpLR0HKDDJkWEKUIQN0xy1h2LSg
 2jQ8SUTuq2pADZYracilVBO1O2qTnMvNJlYJcAYRO9OYEHZGdLi84InYLzp4/Azlh6NTc445AsN
 l7/N53St3MmVUBDIz86/zD8TlZzsqgwPNuVGzEaxEJOBoYEqoA/d9Vt8IF/RKWg1z13g2Y9/AsZ
 mjmqqRRoB/7VTQ4fd/UOvj56NZt8j8yxHQllr+5a6nHtXPeoHsuet41Bsb8XcwQ7pLp9pqzB9Ke
 uIqfGbXwFNZ993VFvCHKeadrRzJ2rmyC9lDGDWMtVBH6lX0Ky9eCiS7d/kgBnPSw14CoB5xAyHl
 od3r78D5eHvipYAUAkC/+wJdnXYOSqOddjymLR1mVcufITPrq2BGZOC+H/HfFOUi3gKmdDVtJoI
 44tycr3Xg0HoJBf5seg==
X-Proofpoint-ORIG-GUID: R24y5e9xByqGrDmw6dDb_T7NCirxTe-m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270108
X-Rspamd-Queue-Id: E6802470EA9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35546-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,msgid.link:url];
	FREEMAIL_TO(0.00)[zonque.org,gmail.com,free.fr,armlinux.org.uk,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Convert GPIO controllers and their consumers on the PXA platform to using
"attached" software nodes. Since everything happens in a bord-file, it's
quite straightforward. We technically now have a way of passing an
unregistered software node to platform_device_register_full() but that
requires using struct platform_device_info and since the existing
platform devices are either referenced from other places or defined in a
different compilation unit, I wanted to reduce the impact of the changes
I can't test and went with the older method.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Rebase on top of v7.1-rc1
- Add a patch making some platform device definitions static
- Link to v1: https://patch.msgid.link/20260331-pxa-gpio-swnodes-v1-0-f66d86d10d8d@oss.qualcomm.com

---
Bartosz Golaszewski (4):
      ARM: pxa: statify platform device definitions in spitz board file
      ARM: pxa: spitz: attach software nodes to their target GPIO controllers
      ARM: pxa: pxa25x: attach software node to its target GPIO controller
      ARM: pxa: pxa27x: attach software node to its target GPIO controller

 arch/arm/mach-pxa/pxa25x.c |  5 ++++-
 arch/arm/mach-pxa/pxa27x.c |  5 ++++-
 arch/arm/mach-pxa/spitz.c  | 11 ++++++++---
 3 files changed, 16 insertions(+), 5 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260330-pxa-gpio-swnodes-132a81af10e3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


