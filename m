Return-Path: <linux-gpio+bounces-23600-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B150B0C8D5
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 18:32:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6D451C214EF
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 16:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D499F2E0B6D;
	Mon, 21 Jul 2025 16:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ePn2qgyb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196AA2E091D
	for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 16:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753115558; cv=none; b=VhaY/EuKTQLExR6SZsyzEOGE6nQFepHU/JltoAytHq/ajW23S6pY/d4GFED/bGJKoMq1BpoOwZCLc6j61R7fCGirytknt9/enZIjrrOgct793X+5ys6oTQJg3Cy3bSNFLCLJZbTZUcEsy8of+Mx+P54y55RVlkAKYtCkTRX60Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753115558; c=relaxed/simple;
	bh=iyIzr+jC5KDjXspPRwBZrSh9tU6LfOxoBKt9zdZWbdo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Tx8qbnpRx7Mew9IEjN6B6Ibuj5zLLFwnYYCZH5r2ivrVFDhEdsGcoDdv03sjo3tp1C6Fo9btq5Olgujh6amgejL4ULJslYAQmEknNxnsbvNnndm6exYP2T+p859VjekAROPPUwWKUy63x69b+3K9Ft2YMXcPQiwIBqQRRiKk7og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ePn2qgyb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LA4h9p015762
	for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 16:32:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=T4Klmseu2Mfh86rZxIp8QLkDs/hpniEhGQD
	JVIutbVc=; b=ePn2qgybduqreyyB2iatoTEJLk+Y5+qbVXVWb1lH8TqElslkGqK
	PGuIBlt/Z+2PeiO5IrPjxbITe6w2H6iFkZgpIPomx/uaxVp/f5IPbdbsiJXQhggy
	W6gIdK4smPLuBgv3gHHo2lE3sP//tD/E0AWJWNWqh/m7CzrTFs37WA2FiO94ig9g
	AInNEnPmktoTJwmGKYWbMkJAmM3z50m1Ercf7GEivxsWl2UU1zHUCCcC9OzBsEFX
	rTbJYbp434LGvKVQ7Rr97W1jb9oFxNjCrVtBo3Y4m4a/djNnzdPfDbvD9MblzGEF
	psXZE15Dw2U1N0D7pQlyqBPRpNZ2lblu7LA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 480451e4wv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 16:32:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-235c897d378so42181385ad.1
        for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 09:32:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753115552; x=1753720352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T4Klmseu2Mfh86rZxIp8QLkDs/hpniEhGQDJVIutbVc=;
        b=ZPzsvY4Sm76lLaUwat5QI7BBZlTjp4H5t6mKNcNNxyOaLdWj3/wb08UxN4Yhik2YP1
         EZWieVZ7+3QnOAtT1/awC43oqVzl8AmQKrjwdwFq9+dlpjaCbZ9hLMc5XqBAqi7hvW7E
         96e0PgbAsBwU5rq5Ym/lKiafoq9kMRUMJiJrsiLyHKi/NTPtgI7VtA4EePgvA+n/GDtn
         xZfNxLWFHcK+XgUKXhG8I5cX5MbrWOHz5vCMHAuw6faF9XqHoS71Mk45hE+F09ZkmVtp
         t6pBOmP+iUAQ12UCJeLN8fJREIBByqbvOXMx/LOB+Qjob1vs8lu7DsoIihTaqPOdTJaL
         5DfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUJ5KhrLg4drC1jw58XP12uMW+sNa6gzwgrOLyVOR1mhWaFkXeabOj3ePzXZ5PUijzkjGZWA/b7fx9@vger.kernel.org
X-Gm-Message-State: AOJu0YyiO1iYqC9WcP9g7wmJKgu+RqnYKpRpqAjuXeJridzARYw0ZtAg
	rSMkNLv+95WAlsDjsYFgHvhocuHhJY9trSJ9FmAtoWZwI0EFG8p2dgY2PGhqIbSekMa5OXUiC0u
	63NDct2fDiMOryLrMrqdgEfrkXDbv6oyKc2vvTf7PiANMldIZQEyFAaHg2Lts0ZZk
X-Gm-Gg: ASbGncv2pyxVCHDR0y+Sjv0VmvtNUi3Z+SMagghN328BoMHmf05BymBLtinRI8qoQTy
	uzkaCcZLnMXHZesLOd0kZ1Ba9wcJJm0TdHL4wpPi0yuIcV2BB4cbkyxhF5jmIv6LPTznVNOIp5H
	fFZ0tkUNLY3M9dYSOZOet93zjsIzLL/BoH/b8Bx5r/fAaOvW3hYqu4JpNWfw2vOoIawHOhurEFF
	n4fAK1mSjJ4PQNGR4YzCAw5ttsTiXQqhTy0f9fwUEqLSD0+kWsY4d+5WiZds/E03bzIhSF8yVCy
	zD01n3MJSkZakxJM318HzhXLi+C+h2oDnrzheQZ6UQowlhDyeay3/JM31AjI613v5iKy3uGgrtH
	GEVCrbN+ROeALDLanoN/QK/kYi7l1jxKjwU6afW0zGE/XDYKq9YyBTSoP/kcT
X-Received: by 2002:a17:903:b8d:b0:234:986c:66bf with SMTP id d9443c01a7336-23e24ec7396mr273613895ad.11.1753115552384;
        Mon, 21 Jul 2025 09:32:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGC0qoXvxpN+826ak4QR0pKSE6QgwEdRBv235JvB5HIj/InSR7Zq+Oi7gRegvz0g7tfqG2gRA==
X-Received: by 2002:a17:903:b8d:b0:234:986c:66bf with SMTP id d9443c01a7336-23e24ec7396mr273613485ad.11.1753115551964;
        Mon, 21 Jul 2025 09:32:31 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3c3b2c4esm59893255ad.189.2025.07.21.09.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 09:32:31 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: andersson@kernel.org, linus.walleij@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_rjendra@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] pinctrl: qcom: Introduce Pinctrl for Glymur
Date: Mon, 21 Jul 2025 22:02:19 +0530
Message-Id: <20250721163221.310746-1-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EIMG00ZC c=1 sm=1 tr=0 ts=687e6ba2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=TVyXueylgh4vxAmsgxgA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: KZldu7VWMA0JAI10DWJ3UNxzUX9Ix9eW
X-Proofpoint-GUID: KZldu7VWMA0JAI10DWJ3UNxzUX9Ix9eW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE0NiBTYWx0ZWRfX7egMRP6ZHLEi
 WFUX8lYFhoqxtq3ywxfjZQjRVkut0hVngps3qZTJE3dDPIS48zmetPYJR1gD+CbvLbOD2ja7nK0
 U18er6TIHAXFwuRkLY5KFMp6sVxxx4rDCEbIACTigPagL0nyq5mUIwnBGE0WX8DWHH4THfK6qi3
 YJqHkmcd9ap63odcuRNC66HkERS3+NJt9d6wU1rVTsfw/lbCwQJ2HaizVUMvQWSRLQxM1GfgmrU
 Rf8bSxIHZg77L+Vx+Cp0yEzW6CUMH0YIQ4TzuKHjDnO7rUmr/GsYVRk5jY6tymiuBHnBxNwyjr4
 ndXeFUJ6jvNECv6EC6ZfmhpA9bBCA3wCld7Bqsgae1RtCgT9Z3uWTMlRGcXma/e3jLo0pwsy8r/
 6dC49Srb8k4i51p+/vtQ2N9atQrekB6sU1dFKUIXgakJXwKDXC6oMEn02hZv++dLj5TroxWL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_04,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=892 phishscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507210146

Introduce Top Level Mode Multiplexer dt-binding and driver for
Qualcomm's next gen compute SoC - Glymur.

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

 .../bindings/pinctrl/qcom,glymur-tlmm.yaml    |  128 ++
 drivers/pinctrl/qcom/Kconfig.msm              |   10 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-glymur.c         | 1777 +++++++++++++++++
 4 files changed, 1916 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-glymur.c

-- 
2.34.1


