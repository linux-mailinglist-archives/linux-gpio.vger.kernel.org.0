Return-Path: <linux-gpio+bounces-19568-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 171E5AA7E8C
	for <lists+linux-gpio@lfdr.de>; Sat,  3 May 2025 07:32:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60CF34667E7
	for <lists+linux-gpio@lfdr.de>; Sat,  3 May 2025 05:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 965DC19755B;
	Sat,  3 May 2025 05:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="obhY5nRy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F04E55B
	for <linux-gpio@vger.kernel.org>; Sat,  3 May 2025 05:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746250334; cv=none; b=TuJ+vZZi6zqsdRRwepIX9L6CASX0EoC50t4yU+uafmO8dWAw9iv4lulFxKSUNHn6mlrlq+xVA1Mf6IPTilvKnlN76FSxIL96nP3FFKSobBbNlKbIcPN+9V0tL1nNTQCWYPQai1FIO/WbFjMaHWyRImdvYE0MDqKranXeHnQBmxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746250334; c=relaxed/simple;
	bh=JrCjArC0bzr5FFuhkLAmoTVoBHpDGiU0BzbLirzY1hM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=K+QRTB9b+HcFNKXEDPX4/eRWVsJyTeJ6pRZLtPNIpaS9y9O4ktsQf/2s5+CNCzqFavlTnLHpbN0v1AYxRyAY2HANG2K0RlISuNHAB3ejZiv8MNn2jjdx87zSWzYsLcibVpq8cMDV1IxYyDZtkH3YypbxBgu4Zwgf/ZRBD6KdTts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=obhY5nRy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5434CjUE008659
	for <linux-gpio@vger.kernel.org>; Sat, 3 May 2025 05:32:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Q3nDXSB/Fo7qumlTVFjSJM
	Bida7tzkzQifGisEtqZcw=; b=obhY5nRy9K1jM7Zg6ElsXwpMymtgDpqulOoqlf
	N/WHGaIGDYL8e4D91oNlsKD9REBQCQZaSrImfABWeRsH5Dx4zCF4R61mMIdWuQdI
	ASOn2zObsH5eZWXRNEQ8qd0oq3qqWhGh7sdmaHIXj/1CkNNO5xEoel3gEdU39thU
	0c0JznsnViGmfsnZ5BijCwgMhLMD7KSwCxoEIZ8QteiUPIBKlMq578oQiaQ1zn1b
	arYTO5DqQq8v3ioV0x7VAoy3EJPhATpmeuaFwzsJfaQ3HIBSRSwvxfjYdybqJCgb
	j5fE9tQ/ddwPcjRKGZwSlm49t85t2ihcsuhIY/4t611E6LPg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbwfg2p9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 03 May 2025 05:32:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4769273691dso47974361cf.1
        for <linux-gpio@vger.kernel.org>; Fri, 02 May 2025 22:32:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746250331; x=1746855131;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q3nDXSB/Fo7qumlTVFjSJMBida7tzkzQifGisEtqZcw=;
        b=hyl905BavAqM8ijkwpqjwjAPuVKkFSWn1dvJHpks0Ucmhn60PUiFsd7cfuFAPjYfZF
         VVOUYXio/GovQNd5XOyb2TcJ6m75S0IpIfjDY6Jp8RgJmKWC45uOg45OHDyyR2PzFNKB
         bcyqe1Pr/xW4A5f2ObiRPVUMLPsyBanDwFawZfSF5+ima7ALy0U35nxPVXMjdv927s1m
         MG1r0AQKjf6EIjwu0MOayUVVDkx/6brDcfw83MvJRU4fzCgKZZKB7gpGuiM0d2tkYyES
         +U0ITFn0Cm5rEiOP78JcYkXUWDAyrD0nMi578PpAtdWQptPHSd0adIrHBdlYKLNZa20z
         qVYg==
X-Forwarded-Encrypted: i=1; AJvYcCVR9mzaEBu8bGHo+wLlkfD8um3UCRh+PfnykNbdcSR5QjKlRvwKK06hHwNXfLaawyJ5hNI0/CXvu9D8@vger.kernel.org
X-Gm-Message-State: AOJu0YxuQUyNPlO8rLchdk6hE4vwJa7UtrQnrjAI+pwM5k8SPyG3BJcP
	PLwPgEuomcZZcnlQOJZ6hxvoS3KrQvDD6wTB7eFrRR8qMj2gVFwojKHu5vpKakc8qXHrPzEDeYc
	z3LkqY2kyFjyIB45a5wiJau+kyEg7565JV+yeujYVBaodo9q8XkPF6sVoKhlp
X-Gm-Gg: ASbGncuWdRnsES9p0yugC46RDbS0J3Ue4iKpOXPsq7Set9wEWM2rKmbDkOtEU2XiAjq
	h6Oyqwz33lDReaDwDrwWVQlx1p0EpzdXqnU9gsW3UWnkAcDTn74stJe1ZzrizbzxXs/pUfODFrO
	ynlQ8rMpaHRlw+4q7cSeo3DoeZu/1E0QSmCtEVgnQ8h6+XH2fNghABQnYYXnExckTZlc60WP3Gu
	pjMlJCMyoWAxcmwDRpO/9MNcTv4CH3uum+Jzyimrl8730CxRbdKvfD8lPlKzFN11bpEfy38ulX6
	94QBkkxEfsoyDwrSYUy9MDBvPFa+vQepOxGg9IJ7MaBiXOabx8NptOk6QagD6+AFz9jGyg55GGg
	s5StGMmZ8bEXJ/EzInjunj249
X-Received: by 2002:a05:622a:248d:b0:476:6b20:2cf3 with SMTP id d75a77b69052e-48c32ac7d08mr87015211cf.33.1746250330822;
        Fri, 02 May 2025 22:32:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwkD4VFYgZqh++qJ1hdBjNHyXm/KsDjgLE3d1OOhTEveS14qB/5yiIqfYnDcNQLb6X4GzP+A==
X-Received: by 2002:a05:622a:248d:b0:476:6b20:2cf3 with SMTP id d75a77b69052e-48c32ac7d08mr87014951cf.33.1746250330357;
        Fri, 02 May 2025 22:32:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32029017cc0sm6165841fa.39.2025.05.02.22.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 22:32:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/4] pinctrl: qcom: several fixes for the pinctrl-msm code
Date: Sat, 03 May 2025 08:32:05 +0300
Message-Id: <20250503-pinctrl-msm-fix-v1-0-da9b7f6408f4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFaqFWgC/x2MQQqAMAzAviI9W5iVIfgV8aBbpwWdYxMRxL9bP
 CaQPFA4CxfoqwcyX1LkiApNXYFbp7gwilcGMmSNNS0mie7MG+5lxyA3zkQ2uI4nTw60SplV/8d
 hfN8P4wELvmEAAAA=
X-Change-ID: 20250503-pinctrl-msm-fix-b225fc7ead2c
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Josh Cartwright <joshc@codeaurora.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Doug Anderson <dianders@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3565;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=JrCjArC0bzr5FFuhkLAmoTVoBHpDGiU0BzbLirzY1hM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoFapXh4/UJUC1gJg8vS5V54U5xFsk/5ULuz06t
 IiHdTeF9f6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBWqVwAKCRCLPIo+Aiko
 1fCrCAChmY9npXN9et/ISZqhP5jTh2TPOyJiYp2wBbiUjcoKodg1RhEyTA+mV2BaZLhzaste95b
 TZhroBDFA8gUg6YhhJ7xK73orFbwH9MEkvMxhcepmgk1LZjRqFNSEz3ZdgRzACQBSMDtLfXxnej
 y5y8qZdNYW+P9E9tM+/Ietdpu5VCd9vg2wUvqwn/8HTIOMHyM14bjKHMmOrRrnaApZpPXTIoJoq
 GJwnLz81OwKE1qH7f7X6SB9tRY1ApCtfRKW7uq+Jylpi7AMSdLwFw+zjJFNCBOCEKFPsDtmSm3I
 l8jAcOrxEnp76xZ2clHeWTIpwQDcfm/Uaiq3K1/4WjK7vO8n
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: S39JYxbJysav1syAaHeaYwLCO-alqK5H
X-Proofpoint-GUID: S39JYxbJysav1syAaHeaYwLCO-alqK5H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA0NCBTYWx0ZWRfX7fs6ri168jIf
 S36G+OWk99QaN6741KEWprrKOmWtuZReb7zT1+wBOLQRvSiVjBb1MIIGHvi6VvWJSsRi8CdTG2Q
 e4ocJ853Mh0U+GqrgZnP15mDAlXsB9MsulVVUAgO2Y16rDF1f9MkeJFnqLndtjrqzVhT4q1vrwe
 PqZQ01rb8qNsdCLPDdBUusrcTPAjD78Zdb57zKb4wdqwNW2Z/l41pNp9VKs81dBHVSwS1C3lcaE
 2h/po2O99/svZ1W3YcHU6bLSPUUQQDYu554e3MgjDiXA0wufFBYVPOqmY5W4sCdTEceDPUxhqzy
 t1nwWdnrzbJUieiRcqNhRsBq8HBsf/p62c18Tiet6il42+4FvYNd7RyPR41NbumUPJkdc9YYL6i
 8ZSTY3a+wGKURitEaub4BVTM+XxoKXgPcD4/0BJp1kcyeOqKTntFUUh2ApRCBCC7Ms/IO/Sz
X-Authority-Analysis: v=2.4 cv=AfqxH2XG c=1 sm=1 tr=0 ts=6815aa5c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=yL6wTZgN64zhq57P54QA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=631
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030044

Fix/rework several issues in the pinctrl-msm common code. The most
important fix is the one for the gpio-hog handling.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (4):
      pinctrl: qcom: don't crash on enabling GPIO HOG pins
      pinctrl: qcom: switch to devm_register_sys_off_handler()
      pinctrl: qcom: switch to devm_gpiochip_add_data()
      pinctrl: qcom: drop msm_pinctrl_remove()

 drivers/pinctrl/qcom/pinctrl-apq8064.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-apq8084.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq4019.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq5018.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq5332.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq5424.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq6018.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq8064.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq8074.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq9574.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-mdm9607.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-mdm9615.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm.c      | 41 ++++++++++++++++-----------------
 drivers/pinctrl/qcom/pinctrl-msm.h      |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8226.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8660.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8909.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8916.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8917.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8953.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8960.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8976.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8994.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8996.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8998.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8x74.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-qcm2290.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-qcs404.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-qcs615.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-qcs8300.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-qdf2xxx.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-qdu1000.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-sa8775p.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-sar2130p.c |  1 -
 drivers/pinctrl/qcom/pinctrl-sc7180.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sc7280.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sc8180x.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-sc8280xp.c |  1 -
 drivers/pinctrl/qcom/pinctrl-sdm660.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sdm670.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sdm845.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sdx55.c    |  1 -
 drivers/pinctrl/qcom/pinctrl-sdx65.c    |  1 -
 drivers/pinctrl/qcom/pinctrl-sdx75.c    |  1 -
 drivers/pinctrl/qcom/pinctrl-sm4450.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm6115.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm6125.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm6350.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm6375.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm7150.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm8150.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm8250.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm8350.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm8450.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm8550.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm8650.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm8750.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-x1e80100.c |  1 -
 58 files changed, 20 insertions(+), 78 deletions(-)
---
base-commit: 6ac908f24cd7ddae52c496bbc888e97ee7b033ac
change-id: 20250503-pinctrl-msm-fix-b225fc7ead2c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


