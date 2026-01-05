Return-Path: <linux-gpio+bounces-30156-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F0639CF48B7
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 16:58:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C6E33085A5D
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 15:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4B330E85D;
	Mon,  5 Jan 2026 15:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d+Wm5YaF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Succ9nv0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC73D3054EF
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 15:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767628349; cv=none; b=hvu0sjId/YYYsxHY2dg8AxUhXKStCl2BBwS2Ed25Y/erztlROnziHjYZ4SA7noVHJfQfRtR5fNxx8WohlBLRm0ZS8+dDKfrv9Dw9s7e1XMx/Yzrsl4brEp+pGR/lLLu6NekLL1/AwtQ/j6drphGArrokg3tzu2rC8KIR1vXmiXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767628349; c=relaxed/simple;
	bh=WsZyYE/tlMueaKH9KILYRaNjShfrfBCJVCgjuIHHQZ0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IffrpyQiAR9cjU0uQnBLeOjsIBAhIlSR6rI14YFntU8O8Pw8B7phCrngfMb0C1SD//wvNAtMNopxgFJgHdNTD4Ki9EjkoqLIaZgI+mpqf9fEgTX7TfSyd1i0f2XcNimcLWbCjlXeVAVLDyqZzYE0L3q9PYIpRjRQcWJPGLoBYOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d+Wm5YaF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Succ9nv0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605AC0n3091242
	for <linux-gpio@vger.kernel.org>; Mon, 5 Jan 2026 15:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UHQuHa9SVqS2hlZN4/f/ta
	YKuxBR+aJh/9yb+V3Ul+Y=; b=d+Wm5YaF4+5WqEljuWocYmIarJ2FWTHVTAX/5L
	z7UuiI6KEfbBXI+UAdSGy8lD8yW+r91pKcKmdGmcnO7Zh55psQqoTBYBweIOOEVg
	uNBwx37q0lCUylNVK+pk2qzwzbBwp5ej8IOY14GUC8Cy8FEmljr7ij5p4GDPq/FN
	NKwoKl5ecG2ehF73EfTlIFOikWhGTyxMJyl7pMjXTucdb/J+PN1CI4ngE8LuyOSQ
	tC5x4g4TcfbCB9f+PrSUcqjGfEtPQW5LAhzp0LGkNGVG84LEg0DlWVP7TzbqDr51
	rNABoREq0gWTrtmP/3WLACRMn9expMhjXSRpKkZH1TqxlwCQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg4v62191-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 05 Jan 2026 15:52:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee16731ceaso396391cf.2
        for <linux-gpio@vger.kernel.org>; Mon, 05 Jan 2026 07:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767628346; x=1768233146; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UHQuHa9SVqS2hlZN4/f/taYKuxBR+aJh/9yb+V3Ul+Y=;
        b=Succ9nv0Nl37sl9ZtT80XV/2vc+wGK3Le7GUTsGkvee0PAJfeWDOr+JMQOlSBPvdk3
         X6hyNgnw3ZyYKXDIkIYN8W24JXFeV3bE20fyReDvvATT6pwZvbyzTQTquV//lirasaD1
         qKiff0BbxofYpJsjzGTzS1ShQG8IUge+eqDjLXvIoYaoTDueWJq6fbYWRV4VuDg/DLLW
         cDGGC3xT/xPbDLylNXyP0wM5XkmUF6f+u6OHqFodIS3SCL/FU6OG5Lg0ytKBZ8n95yJr
         AbGXv6RWYaY/Z8UTkCijLo3/BX6K7tWKHIjmZdrsGL5MwD6cDffS7RhSkm5AkOWireFm
         HZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767628346; x=1768233146;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHQuHa9SVqS2hlZN4/f/taYKuxBR+aJh/9yb+V3Ul+Y=;
        b=S0fgN4YZujbYGlriEPLHqBmFpSbuG3fC0Hl2sVYcHri8NuFngOk5W3dV9jYAaXNJbR
         xeLHAD55bjFkMOgeD8RGof7Lp2/VlOMJHzQ4H8ND+/OSymj0qGMZKoefHcZ9CqFr0cAb
         649uOkDebYJ7ng2Wgc1ITrO4yRQ6rqXyUl4rqKq9Ca13xuIICq50LNTzOuh2RH8KgCMA
         aIoQ+r1xXTdH2R5/55r6DNRaOegofRM25YiYD79VzyF4VaHs4HTGQbfYzxY00sh6btLc
         6+DazZiJcbg5luqf+mkNONXGrA/ugkgE/wTNwOQzoLgJzGH7BnyByinfqkmfPd1EvbUg
         g9UA==
X-Gm-Message-State: AOJu0Yx/Ea3B8smRuWP64T0416lMM+iKvXuup9bzME8EJzp6OzytSY35
	cm42fd6WCqvkGyJv6Bf4CgEI4rZ2aVDOc0dW8daGXbDNe/I779CBUR+iLCNKKnH7KdzzOLqDS67
	bHLfJ2XtX42LAjCHBgEC59gFqMniimFk1f0Lh0F7SuWiZ9A0C1vznFq1oP6dr+xnw
X-Gm-Gg: AY/fxX7phlmBoivHvLcndkJD2q2TA1evRcTFAS+TAOc7Fi/kZD+2joX4E887e8VP8LD
	X+amcOg9kYpS/J5c7rEeulTYEtkzQmw+aut+KrciiUvGuN9kgSOKetQjdhriulxbbrb9WbZBmkP
	fAVydVJYhe9Uywn1nqHZlesRwmJ9wT6iui/p+LJvQsaQepPcdDtLIoEGQUWjWCV/YoaetlvoK3W
	gGNhmFMZs/buYdZNAsaHFJy+udi4MzE3RvGW32IWIBQwugnP/Jl0dcXuXbkU8UTutnxMFmlKz6u
	ZBR6IlJ3ZXPR17bjPWDWHN3BfizoApvUcdRKoN5KwQCBNNDEUPAEzmS83iYIlwMjEoemmU9AHCZ
	RD72hnG/tZuPL8onaz30dFGIspi+j4SgPAjoAlkA=
X-Received: by 2002:a05:622a:24f:b0:4f1:ddda:9a26 with SMTP id d75a77b69052e-4f4abd122a3mr748155621cf.35.1767628345964;
        Mon, 05 Jan 2026 07:52:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFymhlZ5sIhNH3ulkmZXDDnreoNDHre/UY8qk9QdE1UD2u4Q0kbe5kYRQneEodaCgY0ufiGsA==
X-Received: by 2002:a05:622a:24f:b0:4f1:ddda:9a26 with SMTP id d75a77b69052e-4f4abd122a3mr748155121cf.35.1767628345421;
        Mon, 05 Jan 2026 07:52:25 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dd3b:c635:dd06:9574])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bca56a24sm202757f8f.33.2026.01.05.07.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 07:52:25 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/2] gpio: shared: another set of small fixes
Date: Mon, 05 Jan 2026 16:52:07 +0100
Message-Id: <20260105-gpio-shared-fixes-v1-0-76d6ff0afcd8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACfeW2kC/x3LQQqAIBBA0avIrBtQK4muEi20ppyNigMRRHdPW
 j4+/wGhyiQwqwcqXSycU4PpFGzRp5OQ92aw2jpt9Ihn4YwSfaUdD75JcNB+oq0PLtgR2lcq/aF
 ty/q+HzfZdU5jAAAA
X-Change-ID: 20260105-gpio-shared-fixes-40a8ec3b6b25
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=512;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=WsZyYE/tlMueaKH9KILYRaNjShfrfBCJVCgjuIHHQZ0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpW94pNJPj7lyD5CLHDNAw7COYA17y1aiZhFfJ/
 f7krKrvLLyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaVveKQAKCRAFnS7L/zaE
 w7asEACznZ72zMh3UY1n0SG2PNPB4QhyHuYRSBztGbSOjLOhu78KQOj+ik06RcKay9ujUItN2GK
 Npxr8MvolrRCCUtu682Gjm511NzG1mYhLzqr44kq1aK4qDb2D+iRGftBO110u/+SoEdH0lW/WKo
 Hl8HQlSws9I5r61YWxOIXg2gSlAiC+qbQpF65zbmKbwtdR7eGLN67NGnMm13xsEjL6NkTpH6hND
 cv8V5WLQXtjZH/IFPKSKU0W6GhfM/jVRofECAdPfZ8oj6+RjUfaHNeG4SQUrJPoYrp1hhrgk7E6
 3yLo35N0IBMsDZqBdyJDqmEOLaLHpSTa6lOQ9wsi9zYhZrm89CJgPiDNRgxjY5bx42rDIwjozEl
 WHQsUDyloi1qRdBys25Dwv/AoWaLkNGFPTABC/lH4W/5aBnFw7lHnmUTBfk7kKdgjCQ+FgzZkY0
 Km2HnavKG4/mjwwqFk5efDGEcpqwp/SmxX2Gp44C1G0DEgTuScFFIr2GWXHtlAchgVQeoV3LSDy
 q9bpQPsxNJiQdkWtCRIjfVjQB1mU3JtoxugxFgkFMt0anQMA9LONqzi02HZOFNc3U7nbmhifitN
 5YDaj2DFLB0l84c9ODGv7OC2Q+kKo7CJdwd+D67bTfb/ZNNSoFN5oPLuPape939jIA02uujuRIU
 RFTvlpOxmKEIBeg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEzOSBTYWx0ZWRfX/RBgXZ7H98rP
 1U+CkweV3oRPhKQS8HJDUxrVTJv2nc73lxMRjBGkp1D/vFCeagyIaDbsb+KPtNQRafCCaOuuaru
 bMXbuZtjvr+nSG44uDFQPcAaVZZUtfeB8cc2Z5aYkbcMmlO6G41Bw57Ajld6E5NY1BF1gt85zVY
 j/BxqzrWQ2EPza3FMAHMfbi7j2c/bnuMr2q8X1MHLHPjRS8ThveipEegW4ynSRpiKS4GQdDcumM
 fdbrnlmsIxlJia0VjYSN626OcIQeDjxFqfSMFZUmTrswg1y1lLnYDCmNvDLbWudA/XKYFxpQPge
 EoucOjshWyXQVco1/wlSbxJFKiee5kGA6t8ZF5wQa+dkWGyGX7if0LTfYXdgrY2KRzHEbxhlYdX
 duttB82tYOKth6WRo4RJKD2rAIrbSrpk5UAtz0b49QF+sAA4C8IRa6ceQwv2wZhpTlfnO0D202+
 GSOlFnQCRL29XEPqF6A==
X-Proofpoint-ORIG-GUID: M4g8toCujyhsFafCiwVweWBedU8ZquFm
X-Authority-Analysis: v=2.4 cv=c4ymgB9l c=1 sm=1 tr=0 ts=695bde3a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=RssKh1IuFTcOXJU4d8EA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: M4g8toCujyhsFafCiwVweWBedU8ZquFm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050139

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (2):
      gpio: shared: assign the correct firmware node for reset-gpio use-case
      gpio: shared: fix a race condition

 drivers/gpio/gpiolib-shared.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
---
base-commit: 19fb766a1e5ed5943a62fc671c09d45352a81b1d
change-id: 20260105-gpio-shared-fixes-40a8ec3b6b25

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


