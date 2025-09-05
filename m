Return-Path: <linux-gpio+bounces-25685-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AAFB45C09
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 17:15:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 302A8A63046
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 15:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27E5931B81A;
	Fri,  5 Sep 2025 15:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XEpTXwnz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EB631B807
	for <linux-gpio@vger.kernel.org>; Fri,  5 Sep 2025 15:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757085062; cv=none; b=QUy6SP0+ZIQhbtJ9d1EvhBgKYVPyAtxqIfH2qHLk9f67Msmg1hQ7zbRE3NZRwrmHkeJXLm0bvAgwnUSvojKdYfqDGzRybCqoeBGl4XJV1NsLGuAacZwZfAEymmscYwk8msr/g/nB9r5ULhzNL3Yrx+D3SKMwJC7kJc7lgGr5hcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757085062; c=relaxed/simple;
	bh=BqHA2KI7+E2wg1IN5Us0LjPUXVJRXh89VEgZqldP01g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZrdAEfBkhZklv3molS55Eo+mc4Y1dVoNhvH6J9+iIGe8QSWa1HItgO6n/JjAOnpqUoBZ5ciYsHbLyGjhCQx2GNLUcqPYDOu5VPOL+pnPkY8upuNqxAMoes26V2qEFpsfpqqM/gAGKvyeQPBW5buglBLttYYVp4PgfP0j1OeBI+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XEpTXwnz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5857BcHk022162
	for <linux-gpio@vger.kernel.org>; Fri, 5 Sep 2025 15:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zCUHK4JFj9/T7BE19qN/qk
	2a+SV8gFmOlRACJ/Kqf8I=; b=XEpTXwnz5PB6w5E3IGR7bKCDisTzDrgig6yQuA
	ON6AdQ65OQQm0RQmsgMuwezC7utsjqe5XUWsMtXOtqjmF5dRLJ7iN5x69tYVawmQ
	bPEKDOxXw40fN2LwchmwpUwRoKJHUADYt4le7jXlZiBMNjQye8OI3eVhkE+V1iWU
	4gH+a1KuzV+6cIGFlC/yJaQpxekusFaSrWsOZrzrHIbE+rZ/WoheZ/tqexuARcDQ
	vdvEnWAgPeOVsgPqaz0hC3+feaj4vj0d3h0Jnr4W5YzOkbdiIA4rCtueREOLiam3
	MJ9yET6jcFJ+Khw/vkKqwVhrf+GhNpWYlwqWub/shxxi9z9Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk9bc7c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 05 Sep 2025 15:11:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-244581953b8so26232795ad.2
        for <linux-gpio@vger.kernel.org>; Fri, 05 Sep 2025 08:11:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757085060; x=1757689860;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zCUHK4JFj9/T7BE19qN/qk2a+SV8gFmOlRACJ/Kqf8I=;
        b=o/tZ0SKvs0qTcDB4H82xfoH3rNYFm700WjjXb5hBlTjOzXJ/bcJNFU2LpmIouxDvh6
         V1m/g5+z72+RkU0x/uGBYi0LapEJUVB0oJhfoMDBOJJnvDB+r5RlMLrWh2WAXAqt9cTe
         cfJ11s54+GpxeppiGLGh8jXw0pz4amrsgFfkMuFHex+g0fILOiWrcQ6n11HnbGhZ+CA6
         1+WjVTgX2iGL3XWg13f0X9CRV6Dqls636Nr23AlBnsv8nrzTff104wv1BTTmWLMgeJNm
         cppgbR7XFimKHP/5jL1+XJtsy2ZSQUwDn0wUQ4zgPNX8khFBH6gSXJ0OAP9zcPauMWTH
         FJYg==
X-Forwarded-Encrypted: i=1; AJvYcCVE0iUpvVWVg0Zu76Xsxcnx2dK921AnGe6Hd3poFlfuSRJNfWIrgp14UgxCaH7we3RddYXvLlGT0ivQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxkSEkDRicFtV4gZZZGbr1jq9tyiI+/h9UfZragX1YOsjpeuwyS
	B+RyezkGMSCF1/6dCxiFEhQgBjIrrJaUguxRdoZIxb3eCPe9RHOCOp9J7GJTNppmbQROT8Kg8ug
	dh96ojO+REtLbsG+Tslh744xwSIWgCfh8gNqoF9Xgw0dCd5HLjPfuH0LngIZhlOkH
X-Gm-Gg: ASbGncuKi415iTGxRp535DFQloiRw2RfkuK7IAAToz/i2yCtPYn3gZnTULtlluuQs6b
	JLQwQrKfdxqgEhMNdDw4uJUwFMwuViUPip+3CbFtb6/xjZzu9zLaQ5EVretG/rgbnWVt77YPeT7
	TIlSpq3szi09AavV5B0ZZ/810oFqywCJMpx3d4n8yY7hSffYXYi6WFtB1/g4y1JsK5nBv+lBY7b
	AFvei0kCeuk2dP1+FgWLZw2WikRF+hm5Nr55J9BhEtC3okpFOJrZI046VlZA40aqWbTkudvB3qR
	TZSaBDWKxGB3amanq2pY5LBUGQOR6MGiJvSXjosTSdy3P7R2ZbMI9pQ05rITRBmTA+mSELGfhqu
	9a2g36AS5lKgCZXEtkGk/uYTSlmAKxB2IMKbJjWQpXJ8wMAA6l3bsq3tItsO1
X-Received: by 2002:a17:902:d552:b0:248:ff5a:b768 with SMTP id d9443c01a7336-249448dfcd7mr276291185ad.10.1757085058999;
        Fri, 05 Sep 2025 08:10:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEg4+nMFAS/BPgW9bPSO2Z4RPxKHv0LPQfTZ6rcqDIJDLKIhTOAJ1a06wN5qeR/MIqSzQ9cVg==
X-Received: by 2002:a17:902:d552:b0:248:ff5a:b768 with SMTP id d9443c01a7336-249448dfcd7mr276290355ad.10.1757085057885;
        Fri, 05 Sep 2025 08:10:57 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276f5a0bf9sm29279908a91.13.2025.09.05.08.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 08:10:57 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Subject: [PATCH v6 0/2] pinctrl: qcom: Introduce Pinctrl for Glymur
Date: Fri, 05 Sep 2025 20:40:18 +0530
Message-Id: <20250905-v6_tlmm-v6-0-1720e5080415@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFr9umgC/2WMQQrCMBBFr1JmbUpMmrG68h5SJNSMDTSNZmpQS
 u9u7NbNh/d5vAXYJe8YTtUCyWXPPk4FcFdBP9jp7oS/FQYllZFHaUTG6zyGILTSZFE3FvcExX4
 kR/69lS5d4cHzHNNnC2f8vf+NjEKKAxEZao1pWnWOzPXzZcc+hlCXgW5d1y/+AXS1pQAAAA==
X-Change-ID: 20250905-v6_tlmm-323fa634a61f
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, rajendra.nayak@oss.qualcomm.com
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: fUsV9YwxNLNrDylyvH709M_6qL-UqNQA
X-Proofpoint-ORIG-GUID: fUsV9YwxNLNrDylyvH709M_6qL-UqNQA
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68bafd84 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=XKE42yAn20ll-QmRT3oA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfX9ZHsxaCgvm1n
 xUgLC0g8b8OyrWIJigUspZTtoqCj9bPbpyW9apQiFF7waFL2cuwkg2rZh83x20nfOsSTeRbkvyE
 a7Jcl94ENDdEpwnhINir4Q8IDKrBNA5UpnE17u3OMKmiawsfAxmo/2NRALsymWACQEW+z8qEF/7
 bhx0p/8B3XKXQ5/JXjD04u3MA/TodrGKB8mfUPY2jdmcel8p6gSJrH718/vWuh2S/Y9rtTE7HvE
 JawlWt0KdOGowpksbG4AyZnGprQfT3x/MpS1TZW+3oXR2NcVIgLltFvLhPJrNS1nQluUqbI6lgh
 EofxO4WMcvVqLX6FrWUbVw3sOrsObshpsVRmZDu2PkHyyY2ZQwMOapnE0tRrD8mJl77idZmv164
 9fil0pRm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042

Introduce Top Level Mode Multiplexer dt-binding and driver for
Qualcomm's next gen compute SoC - Glymur.
Device tree changes aren't part of this series and will be posted
separately after the official announcement of the Glymur SoC

Changes in v6:
Fixed maxItems for gpio-reserved-ranges in bindings
Rebased on top of devel branch
Link to v5 -
https://lore.kernel.org/linux-arm-msm/20250813065533.3959018-1
-pankaj.patil@oss.qualcomm.com/

Changes in v5:
Rebased on top of v6.17-rc1
RESOUT_GPIO_N changed to lowercase in bindings and driver
Link to v4 -
https://lore.kernel.org/all/20250723103644.4058213-1
-pankaj.patil@oss.qualcomm.com/

Changes in v4:
Updated bindings to column length of 80 char
Link to v3 -
https://lore.kernel.org/all/20250721163221.310746-1
-pankaj.patil@oss.qualcomm.com/

Changes in v3:
Fixed indentation for example tlmm node in bindings file
Fixed s-o-b and review comments in the driver
Link to v2 -
https://lore.kernel.org/all/20250721143037.20983-1
-pankaj.patil@oss.qualcomm.com/

Changes in v2:
Fixed dt-bindings error from example node's reg propery
Fixed gpio-line-name maxItems
Driver UFS_RESET macro updated
Removed obsolete comment for pingroups
Updated ngpio to include ufs_reset pin
Link to v1 -
https://lore.kernel.org/all/20250716150822.4039250-1
-pankaj.patil@oss.qualcomm.com/

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
Pankaj Patil (2):
      dt-bindings: pinctrl: qcom: Add Glymur pinctrl
      pinctrl: qcom: Add glymur pinctrl driver

 .../bindings/pinctrl/qcom,glymur-tlmm.yaml         |  133 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-glymur.c              | 1777 ++++++++++++++++++++
 4 files changed, 1921 insertions(+)
---
base-commit: 578c9ce6071995e1c2e7ec3ecd2fd2f5498a1dbc
change-id: 20250905-v6_tlmm-323fa634a61f

Best regards,
-- 
Pankaj Patil <pankaj.patil@oss.qualcomm.com>


