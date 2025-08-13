Return-Path: <linux-gpio+bounces-24331-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CD8B241FB
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 08:55:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D769C177164
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 06:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB9282D3721;
	Wed, 13 Aug 2025 06:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GxQbe5gb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E835C2737E6
	for <linux-gpio@vger.kernel.org>; Wed, 13 Aug 2025 06:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755068144; cv=none; b=V7k4j1X0Tf9lefXQHBTkMAzbXcfJYQjc4b900BtE7up9yJnQuWUxTZnQmax5G43GBfdTV8smeXqk/3XIzMl1MM5mEphBVtau1k5HoGh1K3iDUfvIODFQkuR6ilKQfWBud1gs8Zow/uiF3X+9RtWermsS5otfbxkHO5aRUn1TdDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755068144; c=relaxed/simple;
	bh=NT3OXZ+6VFZb8CMe4L1nzdruLP5ekCY4F22ZMO9+lwc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DNQyRq+Nay3HB7joVsT8bIMMVzIEBxlM3AYea+W5qB2Ef23BrTBLB8iZ4d4jBKZZ4y7kLyYQnEnu7WAfkDhX1Me92NhZtRPBdqduaAlJWts8SjxRGuKsmSle+yT0/GfkZd89uTFxd2uOfKQbdAesya8aLXJPnI0Up9ExFuIEngM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GxQbe5gb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mOYE008774
	for <linux-gpio@vger.kernel.org>; Wed, 13 Aug 2025 06:55:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=v89RUCwFdyomRq93Seq/cCar3eyic7DgZed
	XTAI4uzg=; b=GxQbe5gbpLOK9bhiBmB5lyEEGQEQ7ItuzcZg167xiPgvg67eGwy
	1O+dSkpAak+F8DwahEiDpb/Qybc4Db8uRnWUcAvuQrcMZ/2OZKPvUhH42BT6sSRT
	6qCTP0N2KjJAHJskku51iFXTp9S+WA7H0hKwCaS2jw6TcPen6AU1T//u0Jq3riSi
	AIVQj21tsOLWyxxGd4e8Da3etLVjEnGw0t1WHbcKzk5pCPKWEjUYA+B3fnv2E4X2
	d7r4QQJPCbP43xdCAykfowvXRW/TUuHNLxqOb6yjMSVdGh71TjGTKyYRKfPu+dn5
	xy0D4psnMDm6VXneJsaIjXn5fTUXgfPnChg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem4es6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 13 Aug 2025 06:55:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3132c1942a1so13219001a91.2
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 23:55:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755068141; x=1755672941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v89RUCwFdyomRq93Seq/cCar3eyic7DgZedXTAI4uzg=;
        b=U6A0K8ocdmgHVPXFtfWvCZFPHz+9VJEi0rqzoxGYwjZe4WWhndASP8vXE1suzfmUlN
         LXxyfVNZVC1/JoF0fs6brvrdnZW/L//YcvHZtUXADzue6yRa2UOnhTvmEtlrUPhZ4+pn
         6rlmXB5ldEQk9dFcAqkO7/fdUDsRP70zvEgU0sTkOc7yrGeuHVAh7Si754GHSLZ41pzR
         8PO06XFw12ixVK4CE9XQEx57H/Vqe/GJQWaSJyp9LUfRn7di7FeRdrADrWsJ4blOScd/
         iBkNMm8IPTvRkMpn/pbBHcFubBmgC+qBm3V4wyJ+khIkCDlNdtQhPi7RFXUgpc8XG+vJ
         gMqw==
X-Forwarded-Encrypted: i=1; AJvYcCWQ+mOFNYwqJm+A6VW6HPebvBp47alTVmhgFkWm7xMSGuFAfVyQp2YvatsXfQbBhLu0VvSR/WaA5spI@vger.kernel.org
X-Gm-Message-State: AOJu0YyV8GHU1iWwyzxBHCZiFioJHxpZuwvBhuunddb3g8fbrigFuTUY
	zsNRjqYRpfatOzWtVSHfGQ0auJXU34o4gkfX9qLXZG8ccSAfVEk/cGQO/8Eg3yzntoV7WbvkXHZ
	Pqs7oD2EGCIUr0L9T13x+czV1HMO5c0k3g3vpwJp6zdAUYd5txcAC/iDALFOOs3EI
X-Gm-Gg: ASbGnct4SxgkEb3DQsF/LVi8atmM8NjwdA8Ms0+qbuH+OwjrM7pGRHYCMfAqzF8NGjy
	ZyN+Rn9wyLHzu4osoB0+pgCQU7n64RroNUlmxuDkL8tsYamVXDdWXHxy+AjVjC/MerbZ3/8j9YL
	R+BJ10uWJ/Ochp785bgGI17EtOWxobXhyPu3be4aT9Qb2jpS014ViP6FQVewaRVPxckDFLLjOz4
	94jc0mGP6Bq0M5XCvI+QElMiV59qNxXlVPNI/zOo8v2lO1ISeovhGhStqLlgLqeNK12rNMhTEf/
	FfVspqrhcvcKugEV9m/7lWFL+N9vEnqneJ+8ETbzmnCIHlGf0IBzVbGp0Fwmca3U5ytWG79b33J
	LLfcfBHiEJywJ+D7BQjnY1Y0hCiIoN9zwdaX77dz2rU7r6Lbf/yJ/WdmWITLW
X-Received: by 2002:a17:903:b8d:b0:242:9bbc:c773 with SMTP id d9443c01a7336-2430d21de4cmr30253805ad.54.1755068140576;
        Tue, 12 Aug 2025 23:55:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjoz7s/dXHcA7mFMizX3dudhJwmJQlObOlwhL9SP3pNoUbNrgFVCMigCH22Xet8aYtZ6XYew==
X-Received: by 2002:a17:903:b8d:b0:242:9bbc:c773 with SMTP id d9443c01a7336-2430d21de4cmr30253325ad.54.1755068140008;
        Tue, 12 Aug 2025 23:55:40 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899aa1asm315958875ad.122.2025.08.12.23.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 23:55:39 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: andersson@kernel.org, linus.walleij@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        rajendra.nayak@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] pinctrl: qcom: Introduce Pinctrl for Glymur
Date: Wed, 13 Aug 2025 12:25:31 +0530
Message-Id: <20250813065533.3959018-1-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: voX5UXUGTk_gP7PBAHsXVi603zwX4PAg
X-Proofpoint-ORIG-GUID: voX5UXUGTk_gP7PBAHsXVi603zwX4PAg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfX6LghR4ZUfRCF
 1AUrkUaIGKf/9RZRflS3PPyIAkThcqDo09AtqKvWvqWvTro6C+WGlRwmLJFmFTvZHLdb6pPUUe6
 3AwoMpiIfsyTxyfnDhDdFsCfksdcyVH94xVvA/4DZQ/OEtHn4HC9xoyDXCXFCginy/x58A2NlEb
 ZpNqt1z4h1tO+cotalLo0FI0h4WBBEcuxsg7kygBtRTigv6FvYlppKxN8q7tpOQ+AdJq6qDrLNa
 UK6wSkirPbfARDV8jH9xhyDUhVFlG6Oq2YReHpoyd2AMHCzbYUeibzzYKJPKOBN+/vxBjo+C7YB
 laAo4rfkHSvfVpklZxf60S37Xy0rp24fj8/XcXCPaGiI3e/2Zyi5aKgTfG1QigUL6XscUt359NS
 YZISMfQA
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=689c36ed cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=2OwXVqhp2XgA:10 a=ne6LWfaJPpk26Hbpmm8A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068

Introduce Top Level Mode Multiplexer dt-binding and driver for
Qualcomm's next gen compute SoC - Glymur.
Device tree changes aren't part of this series and will be posted separately after the official announcement of the Glymur SoC

Changes in v5:
Rebased on top of v6.17-rc1
RESOUT_GPIO_N changed to lowercase in bindings and driver

Changes in v4:
Updated bindings to column length of 80 char

Changes in v3:
Fixed indentation for example tlmm node in bindings file
Fixed s-o-b and review comments in the driver

Changes in v2:
Fixed dt-bindings error from example node's reg propery
Fixed gpio-line-name maxItems
Driver UFS_RESET macro updated
Removed obsolete comment for pingroups
Updated ngpio to include ufs_reset pin

Pankaj Patil (2):
  dt-bindings: pinctrl: qcom: Add Glymur pinctrl bindings
  pinctrl: qcom: Add glymur pinctrl driver

 .../bindings/pinctrl/qcom,glymur-tlmm.yaml    |  133 ++
 drivers/pinctrl/qcom/Kconfig.msm              |   10 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-glymur.c         | 1777 +++++++++++++++++
 4 files changed, 1921 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-glymur.c

-- 
2.34.1


