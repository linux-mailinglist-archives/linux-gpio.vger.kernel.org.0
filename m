Return-Path: <linux-gpio+bounces-30148-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B2BCF3D4C
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 14:33:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A08230802AF
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 13:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C4FB313551;
	Mon,  5 Jan 2026 13:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DBGByWbl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bbu0DIg6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189763128D9
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 13:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767619278; cv=none; b=ep0xpnTHfbH3BB+r6rLz2/YFUBr27RVqElPPLZiLUx8pQnWuzg9chPD6ixeLY3ZfLqDNhH5LqEGtZNo7wcoXKWUeC3TwJ9slHte9M/qJrBF8PJK2DWuLum9YDFywsMEEHUFVCIwsdCFWWYQ3PWCJGgjW0gN2yV/EwstfnALGOxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767619278; c=relaxed/simple;
	bh=FBTZ8+7LvoIsF+AgKhfu2oeaJF2Dq7lHkP4MR/E4HT4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GSX+h+Ae8X8IuCiTWXQy1rfehCRe6EHhNvvRqxR1tbqtGIRhhxz8wEQGVbT7gW+s/j8vp2k8+yf91ch+lyrRHkRfhg87o+9m3kEx9qNx0mIyXsLy0+Hla9CQeCt6wg9U4YZRjcqrhTkLRLeteNpprIKfgHS4YHP8BWTeZwv+9zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DBGByWbl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bbu0DIg6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605BWEv43521079
	for <linux-gpio@vger.kernel.org>; Mon, 5 Jan 2026 13:21:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MIjPXN/R7lTAMQyxLIdd6q
	T0iyatayMM5Bo760ZcfSM=; b=DBGByWblvu68QBi5fqcn+NJiF7P+mHkA4sSAcO
	2onqps4OJoZePc8gZxH1mcchA1a3TfSTGLtQjWuxd0mIBICI8oKSOxmwaw85qHZP
	osAIdIZNeRfgOYO7opTur0ewQXEU/IdddpKtm+SADVk3xCUibwvpkcyZOvmc3/XT
	vPfB06OpYpPlg5xIW5Mx7M6htfHFmBgTj5NYzXh3yzVM3Kh6JJnjSniZlyM3z6xU
	zaIJipO7Kbeo4EXXUnd8OBjo1mZiYG+o8OPRexvQixzD1BXBTNa6U2iiItPw74vV
	6GUemb9UjrmHmP9LjUwmTTnwvMh+GADEHJiVdFgzUK6/mShw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg6uu9c2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 05 Jan 2026 13:21:15 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b89ee2c1a4so27334342b3a.2
        for <linux-gpio@vger.kernel.org>; Mon, 05 Jan 2026 05:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767619275; x=1768224075; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MIjPXN/R7lTAMQyxLIdd6qT0iyatayMM5Bo760ZcfSM=;
        b=bbu0DIg6qA47s6KleiyZRdxeRLEs1DkkX0m0XEExcqiDL5qDpcDweYDt8rMelAQGeh
         wS9HtCLHY1QcJEyUT0KM54auB/xyNwI4jHBjqk/d7dMwQPPPVLs3LQZvy2q/6q2aPvxs
         Kj/V+Gc8T5GNdXUN3/zlxsKlIdhVxekpTB9dfJwH/zSLYI7PWhvv+VxsQxoOHPteENEC
         sBKXAR84fPs4gMK0efSUfvQt4ayqiEgt8IyRKNGQbFg1ALjhbaLnWA8QBn0IM9UXiFaq
         k40616sQtBF29GrGfBYqITGKGr6WgomsUNycbTHgIBIkbHcrXAxYKd8qi9RaiFo2eQnM
         TBrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767619275; x=1768224075;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MIjPXN/R7lTAMQyxLIdd6qT0iyatayMM5Bo760ZcfSM=;
        b=S2EwDBbb6vM2JxbMCMXr0ySGm1C2QSQ3gKApq5tsmHjMurzLNM3pTfvx+o6MMo8G8k
         v3HnTNPlRXFmp23Fa1KnmwihsE4+wCBj5QeQzYp64SUkFCpq2K0kVnmZei+4tasQ2Rc7
         CmYSPpB1mvlTdSYqiWWYxpTtEo3P8vkLpUbkJgOdMICrC5yZA2wG9PPn8dat2BERJmxz
         42TRPjasORptowUK1iq8qUhO/qnYgfJB4U5EMcDSHrz22NU85WgbbHQ3tNrhm4+nT049
         MEJ0ZLcyH3A08++hXijeO+YGn7GLH5vFRDw6cVGwUuadBLxgCRILk5z1n6W6ATWx0kzH
         vg4A==
X-Forwarded-Encrypted: i=1; AJvYcCVbh0li5L18OQOCDGTQtbgty6d0meW6jMD1+mG/FXCGQ2SSf170yJFQrETDYQjOxUfE84HlO+oG6LNe@vger.kernel.org
X-Gm-Message-State: AOJu0YwsmZrIPT0mUKCmS2VoNPc03P6fjChoiZd435K/vjLtjpeydDYZ
	2RR9c4KwzrcXRtAiNoE0oQ0uH3ssEdEBYvkqbM9O3VDKfuZKKLgb3Va/DjYjkQI6NmwuOVeMJqA
	DC2m8BWCTc76ieQlpy+lNpcGlNZBAmBECICBB9o09VlX7Z4DVwJ7dBqasKfHh/bKA
X-Gm-Gg: AY/fxX4KNlZTgKriL/HkJ2b1kOUOVmgXzki9DdvABG4u+Lhsj6qpTdaCssH8XzZGgag
	9YM9hu63b6X6OPc74UMO9elP5Jo2c2VWe0bMOwrRNTbKyZR5oBWDccMHgN82O58nXeCFXY8huIR
	7Ua/W4JZ6ZlgvnMDlB3dxF/mr8953xbgW6ncAH293ckKjuaLMdTJcPeoLTH64UBQLPfHtHW3i+Y
	IiSeFt1UsJRD78TSvI46ejNtWR5wFQ2BfE7agXE9/AFcO+XX0bk4NVE96j3E8BhAlR7/9ivZ0TY
	TnXNoGrZy5NJSubj8EEYgFlV58/ZqHy7iN95ywoytd9GHypffWA8qM5cA5d2NIapzGj8HQwYefx
	GQ96JcudylFSDvWp3f3zsmmWU7RxQQTprTbi45SFnD1z8zcrt7aLbgUgmTBbMAsjO1n25YdIKPg
	==
X-Received: by 2002:a05:7022:6290:b0:11d:f440:b758 with SMTP id a92af1059eb24-121722de94dmr60837994c88.25.1767619274572;
        Mon, 05 Jan 2026 05:21:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFi7wwgXlgpNSgQhXunkoDlw8+l1BKCGdKng7r815BSVKW4edu0QNsj4YCyHm6NQU/E1rLaaA==
X-Received: by 2002:a05:7022:6290:b0:11d:f440:b758 with SMTP id a92af1059eb24-121722de94dmr60837968c88.25.1767619273931;
        Mon, 05 Jan 2026 05:21:13 -0800 (PST)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfd95sm165866042c88.1.2026.01.05.05.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:21:13 -0800 (PST)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH v2 0/2] pinctrl: qcom: Add Mahua TLMM support
Date: Mon, 05 Jan 2026 05:21:09 -0800
Message-Id: <20260105-pinctrl-qcom-mahua-tlmm-v2-0-7ac036f700de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMW6W2kC/4WNTQqDMBCFryKz7kgSgy1d9R7FRYxjHTBGEw0t4
 t2beoFuHnyP97NDpMAU4V7sEChxZD9lUJcC7GCmFyF3mUEJVQspFM482TWMuFjv0JlhM7iOzqG
 uqlrr1lCtLeT2HKjn97n8bDIPHFcfPudRkj/3/2aSKFBQ112l6cWtVQ8fY7lsZsxBV2aB5jiOL
 /ffTifFAAAA
X-Change-ID: 20260102-pinctrl-qcom-mahua-tlmm-433644bae64c
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767619273; l=1372;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=FBTZ8+7LvoIsF+AgKhfu2oeaJF2Dq7lHkP4MR/E4HT4=;
 b=115sBtkA56uB6xtdPLDa0Fre12/Rff8ztKCWNYacDhtC2p3j5bINgRfjWJ1GvsizPqfOXWikO
 4j0Iaa2BDnjDGSlpFn9Ncuetp/r67wSYyZt4DacZbMT3MRv831R4mJp
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExNyBTYWx0ZWRfX6kybwqIjHvIl
 wZR2ua0hYpB/nPVLOS7MfftNEJflOaeKQHpXm2/kfvldjDfdoBlgwu+CGII/AnawxCBd03NZQDD
 vnv2UJE+fxCXjKspLBAJR8ez7jm033sU0OoVIw0H1dqjGLbVXb+TNb4EVIOFSYkcAaAx4qHnhkI
 hvDtGsXBBMbfnZ6QA4hICSL89cSXh4YqFqVg1uCc0fiYBZnwU2Hho3dzutpmLCAddI7gsV4yg5q
 TXlJ6WKFU9oGh2mflI5nDR30lC8+5H4KLHYVBIOJXl3XSHZUfnYr9DP9gHsj2rt5MVSB3vzqgk9
 54QfhzS18R3o02f0VLOfU3+U/5qVoOiMM4/brjr6VHS92Q+/+7oVed70kz9lYfeocODqWKqldxP
 7MvOBgDuVaZr23uzPSgBeVFStCssxIjTPcXs+m4b5OeTxX15alOVI6ak21IHpxdgx/OS9Fcf+pm
 69M09Sb5uPyw21TCJCQ==
X-Authority-Analysis: v=2.4 cv=eZ8wvrEH c=1 sm=1 tr=0 ts=695bbacb cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=4Q-EQNNWwN3BBnYOq88A:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: uQVtPByG6qAzFUOkTF0z88sVZAuf1CFI
X-Proofpoint-ORIG-GUID: uQVtPByG6qAzFUOkTF0z88sVZAuf1CFI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050117

Introduce Top Level Mode Multiplexer support for Mahua, a 12-core
variant of Qualcomm's Glymur compute SoC.

Mahua shares the same pin configuration and GPIO layout as Glymur 
but requires different PDC (Power Domain Controller) wake IRQ
mappings for proper wake-up functionality.

Changes:
- Add DeviceTree bindings for Mahua SoC TLMM block
- Add Mahua-specific GPIO to PDC IRQ mappings
- Add mahua tlmm soc data
- Enable probe time config selection based on the compatible string

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
Changes in v2:
- dt-bindings: updated commit message based on review feedback
- pinctrl: drop GPIO 155 from the PDC wakeirq map
- Link to v1: https://lore.kernel.org/r/20260102-pinctrl-qcom-mahua-tlmm-v1-0-0edd71af08b2@oss.qualcomm.com

---
Gopikrishna Garmidi (2):
      dt-bindings: pinctrl: qcom,glymur-tlmm: Document Mahua TLMM block
      pinctrl: qcom: glymur: Add Mahua TLMM support

 .../bindings/pinctrl/qcom,glymur-tlmm.yaml         |  6 ++-
 drivers/pinctrl/qcom/pinctrl-glymur.c              | 43 ++++++++++++++++++++--
 2 files changed, 44 insertions(+), 5 deletions(-)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20260102-pinctrl-qcom-mahua-tlmm-433644bae64c

Best regards,
-- 
Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>


