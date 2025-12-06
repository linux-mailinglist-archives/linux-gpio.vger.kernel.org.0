Return-Path: <linux-gpio+bounces-29325-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3F8CAA5C1
	for <lists+linux-gpio@lfdr.de>; Sat, 06 Dec 2025 12:54:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C4CD301AF7E
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Dec 2025 11:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB92E2ECE9E;
	Sat,  6 Dec 2025 11:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EImnag2f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AHR9OCVO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8721D63F0
	for <linux-gpio@vger.kernel.org>; Sat,  6 Dec 2025 11:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765022092; cv=none; b=Jlzf8+hc9G4DG/p9BG7NaVPzENfeQd+nj5AE9XxXwnughzRwmsvPA9Eb9jVQaEfhv18b860sfm05nTk7VXfl1h7JDub0Wcr6j/C/vPO7L86EEGsgzWwQDnHEr7CcbfJKELatpfi315PmDTD9D7q/Uorq2mKwptxNhaMWZ+CIFq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765022092; c=relaxed/simple;
	bh=s5DD75m1OIlelZLkDbB/fNYkgmI+Vo8fxd2et8OUAaA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bRmjG1+e2vkEEecusKDu0lVH/URAJqHCduRIU8R89XWnYEg2vWdDZOtGMrUqEO1YzthygGWbdGMOea5VIn5i+31EWPtCkU5L/P4lW6Ru/qPB/DmVUdt+2yC7wbI3MkjLPWnWnoqcwiLISP6hAn2/65BfMH0XDyJa7ir0EGVTRpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EImnag2f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AHR9OCVO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B65Xee82829227
	for <linux-gpio@vger.kernel.org>; Sat, 6 Dec 2025 11:54:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rH1lYfumlPq+OQfsu4lfxK
	VZJsnoB1E422GQgRnpH9k=; b=EImnag2fK+JseEFb26eVRJFzBtKJVa7D3s+RTY
	gbxVtmbnGiRN5KggSLxItKMZdg//XpMdJzLGxyx/KjXcI83sz64De42t38FMv5Gj
	2Mim53pYUl3ujnB2ZRX8dgcvunDjOcmWsMjIiCrZ4l1s+771B7rJPnw2Xof4qoUG
	bkWl4YNKE1HiqmaJtx3Bl+DAkKn/CXdcVPVZGzpGSzsdh/s6ciV6kyp2R33wQhSa
	xLdsWb1BM6PRbiI9JQ4l4iCd26wzjPUyWtzG3S0x1sX9hBYPLxMHWNj/ED5ZE/MF
	KMEo5oYm010KC0gHr6hCne/u31LijX7e1gWctc7seOJKr3gw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4av9upry8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 06 Dec 2025 11:54:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b259f0da04so634192985a.0
        for <linux-gpio@vger.kernel.org>; Sat, 06 Dec 2025 03:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765022089; x=1765626889; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rH1lYfumlPq+OQfsu4lfxKVZJsnoB1E422GQgRnpH9k=;
        b=AHR9OCVOfByShC40Nv2YNtXGXsnp6koYvdDLaY1tjeFMZgYQLMrcjaKqA5sHUNQYLG
         PtNSE1uz5QY7oXiBD5N3xAhw9apyEJXUJxtBFDLIcy+xka0DXA5BhQGr6fStg2Bt//Ry
         dU38U9isw31Ql+5p9jhxd43/FOG33KgEge6c3YKKw67VgJNzTeV3gvsnPDdU24rOHe7P
         5V9r2CX4IfFg36e2aEAg0hrn20YAZlqDviBKuXUsOMLMBe+kbhwS379MmM4HsgQRZEBy
         rDycMZS63+E3CPr3eVEcqeauLJSmP6teNKxzldUImSSI6E2dr5BOxpNReGtX9+5yJzyH
         BFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765022089; x=1765626889;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rH1lYfumlPq+OQfsu4lfxKVZJsnoB1E422GQgRnpH9k=;
        b=b0B1nTRH/TQwYWXX7xqeJ8yReSBiW8TXiyrXvktjIVFWeJEV9rWi5DH/kESh8zFYho
         pGfkSuxviJEfSqwMkihofS82V4MOt8Wpj3QXq9ESrTtlmma631A9+kkG2IbvRi+qJ9DB
         M1eX7iEEc0rZxdfYiqMFbEirflJvXQlkkHlbv6+2Rx5oyMFBW5/L89rz0iPANrqn0klP
         NuPn5kjfK2yif37tLSsi40AmjlPFIvQ0MVurjLBTLtlHS8C/cZ2l0cnclnW9Wjsq6WL4
         6hMJS3ImomcH/RG5WayOHqeAR3SPYerfv0LXVbTywcWUrBVhCNpazhubdfySbMniN7aa
         +Q2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXDzsy7CYPIcrxnlzTCXIXvlQYsnRbI0Pyymp7CXHwFEHYcTZqOb2QTSFXX6FC8P2p90tg3LP3pYV7k@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0SH8VHNZyq4D1lBlAoLynWXWcNLuIOnYkzTGQs2Di0WuK6LbX
	balDFqE7mGcsJGpbRgnayp7BE52jiEzzkWe9gLjdbGSfjcXd++t6QYnv0GaV96LdR1tpJE6HRcc
	bJtH1a0aL7fXqQtEBQrFCU2n8NCirDG2rm5YhwPi81GvrI+wMb9yO2MSZgqLNwyGh
X-Gm-Gg: ASbGnctTaia5kRWDmzGS+qpFuQK8wFGZDhJs7dUtw4woz5GmBh2t6PXlqR22vdSNEaE
	gia6g9JS8UsxNyB8zavg6WR9OwNNegvrLgNegA/kqbsCMjSZMCDbQz0RiUTMTj3ZdSGN9v9DvCo
	VwthrKt49ihtPAXxybOzyagcVT1xBAxb4V+Y4UivWI+LbsNUpTihprEBfboGQuZ8v8Q0Ka0O7l8
	79UGjyyV3pLitnsVCZ6d8zUC0YCbOGijZkkpoYURN+LHyH9vv7olD8pQ8froyQI8YfCPlcIp+AK
	NIWPBOYdmDfGyhSCF+kXOwvdiXKQRIeIv3FJrDEkk7oGNZ/9mRAJy5rPqOodmAlLXdPP9261oZK
	Jmtpxl9vSHtjC4YqTL6Fu/X5ZdUiIhUipdPipdu0Qbny+VR+1W4g=
X-Received: by 2002:a05:620a:2956:b0:8b2:1dfd:f6a2 with SMTP id af79cd13be357-8b6a2548843mr252947685a.40.1765022088724;
        Sat, 06 Dec 2025 03:54:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAJaoUtXKXrr8VjlxAYKQvYJbpLSGRmOpepxIiU7U07lbLsLN81LK6v75C56QjHBW2jcf7VQ==
X-Received: by 2002:a05:620a:2956:b0:8b2:1dfd:f6a2 with SMTP id af79cd13be357-8b6a2548843mr252946385a.40.1765022088327;
        Sat, 06 Dec 2025 03:54:48 -0800 (PST)
Received: from [127.0.1.1] (75.13.23.93.rev.sfr.net. [93.23.13.75])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbfeb38sm14027048f8f.12.2025.12.06.03.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 03:54:47 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/4] gpio: shared: fix some bugs in unregister and error
 paths
Date: Sat, 06 Dec 2025 12:53:52 +0100
Message-Id: <20251206-gpio-shared-teardown-fixes-v1-0-35ac458cfce1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFEZNGkC/x2MwQqDMBAFf0X23AWzqRT9FekhmFfdSyK70hbEf
 2/ocRhmTnKYwmnqTjK81bWWBuHW0bKlsoI1NybpZQjSD7zuWtm3ZMh8IFmun8Iv/cI5B8hdxhj
 j8qA22A1/0fr5eV0/MjrAxWwAAAA=
X-Change-ID: 20251205-gpio-shared-teardown-fixes-d1e2429333c7
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=810;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=s5DD75m1OIlelZLkDbB/fNYkgmI+Vo8fxd2et8OUAaA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpNBllL/q+UR/XWCKLsUrBy5d/J6Hzjn+lYO59X
 i72p3pPmfOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaTQZZQAKCRAFnS7L/zaE
 w0oED/4rF/llkIyMf2vBO5FvFQ0fQkmVYfAie6jmPXAPFJJtQK+7Qer5+Bxl3cuatWq+Wn7OgfY
 R4TkxUzH0eLYRZLjDtkmvE4NNNy9+/RutR+/yqQn3FnaCGP2oeN37QgUj3yHUT9gKvVwgmBpzPQ
 TH5n18Bjb5lwxb/sODkHfjpmThUPFQCRkMloKsY0NWZjek2Czw72FIbOAEVqpLNlK1KaZH2HX6H
 9EBhts30FonX4dksjt358F1+MkZpYNxDpEgmqlFbOuq/h3tslrz+QJvB4IREefyUkkfn2sBkmH9
 840PuEItaZd5FMiG6hP3S8WnlGby3sN9Pi3pXyWJXQRxtNoUZkA2jm/io4tgEgJI5d1kYg1XDCp
 29EoPSDbm79JQfobI8ptY0FeEW8/X3Q2RtQZ6LFjqXcMjPB607ot85ELOLnUHkJt02xvFv3lFcA
 rlusES+4QP3HfyMYxhV2icPQcKeYzSR1bxsjBp8r1P59fuNzH2sbxlggktEFw7XdiBTwetfJbQV
 IwUj4AWaPpHfSPyjgbCkGt5SS5pm8Id4ayE7dvauDztqhx8PF3Vg0YARg+rbNiIHH+NSucl9rmP
 ZsXRI+Z/36A+u8DhGppjumGFBiXdjtTS/2kM8RUHfLYV4Aqjb8RR91RyLjYrYEa05sSOjPAXuXB
 XcmR7xsrO4ofcXg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: aT8jTzEoo-LuusvKzBwjZPcn1qYPGptg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDA5NiBTYWx0ZWRfX0BufYlpdpwUb
 34AysxlqWFpx7hYVFLM67yvZGoouL/Xm9DptJyLlSshxxX+1eDAxs78PQTGaO4m9BuDssZHkOQ7
 PkTf0o397qRrHquj1H1FbeM/6G6/c1oejPnQhlL44E3d8eiAHbKo0Gm9BAMUs1vvI+nQ+AhbVtp
 fBEZGWSXCOOPtpt411JeF5fOMfrw2LdNFbqBdG7ws0ePNhfZFgjBoZB+AJJMnIVUovSn+ouAuzh
 m+xU8+HAi2NlzCyoe4AwRthhQncXxRvkNQ2BxIXlsyXt9Uasripg62E3Iuri6lumTy7It+SIe/x
 yQFS5qbV84Sl7X4yAO15U58p7uaL2ShdjhPwN5Hqu4YR3P4OCsqj0gPbsrCjGXRQb7vt2Dqeo3c
 aXN5O0rCFpJRWITqFJvOFY2A5leWvQ==
X-Proofpoint-ORIG-GUID: aT8jTzEoo-LuusvKzBwjZPcn1qYPGptg
X-Authority-Analysis: v=2.4 cv=NsHcssdJ c=1 sm=1 tr=0 ts=69341989 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=OJCUNAs2RTwferbJ40Rlvg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=sRTBoas0Ks4LyZrZHwAA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512060096

Here are a couple more fixes for shared GPIOs that I want to send before
the end of the merge window.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (4):
      gpio: shared: fix NULL-pointer dereference in teardown path
      gpio: shared: check if a reference is populated before cleaning its resources
      gpio: shared: fix auxiliary device cleanup order
      gpio: shared: make locking more fine-grained

 drivers/gpio/gpiolib-shared.c | 50 ++++++++++++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 20 deletions(-)
---
base-commit: 057c46412cd90e432a73f650cdd75b56f755a082
change-id: 20251205-gpio-shared-teardown-fixes-d1e2429333c7

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


