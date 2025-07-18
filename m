Return-Path: <linux-gpio+bounces-23460-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3451AB0A0F3
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 12:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBAF23BEEEF
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 10:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB69E2BD595;
	Fri, 18 Jul 2025 10:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N2Km+4oP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088AC29E108
	for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 10:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752835614; cv=none; b=iGVvN+8mCzWVtBsuW2x8Qabu5zRxp5zU04TPwG2u03H6Z+vlCXcDxiHBh8n89GVhdgDAU0t50pXVj15Y5x1Jymtk67kmIbtfo7Iu8BBrX33YltgzRLuPQ0qtPtl7p2jN1XICL9iiD+i+t9qfCgiVhGzGxWKKqt/a5bh8XAZ4PQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752835614; c=relaxed/simple;
	bh=ZCzgqQ5wClK+CpOspY0xkNzERE+nZ0OAJ4Bui5yuNYE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IEd7VDqxtksFUOqk20eP72XtooSTr3EYWhjK84cM0mD8FpFed62pVcTelOE87L9Rzw9Rwj0SAjRdhQaSZ0ZpwZ5+NYlNSht783MPX6RzBAO2JuDqWOp5Cb8fDKjevnBnJtzqxmfHpNu62Yz9w0+8CcNw8JsHG87fPSz3gXzil5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N2Km+4oP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I5WDOA000647
	for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 10:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ii7gkbQDsBKlsIJbbjCqaJyes15tBplO58P
	17UvUF84=; b=N2Km+4oPwfjpujrdM2mZ5jUpTNJuE0rWP6QSfUbBFuau6XKkLwc
	nG8KQ16CcGbpEwVptjno9cwKyk40YkDjgQzExwu6MW4qCarwbhABvOOPojVwlZnQ
	ieuOtDe+98BL78x58lW1NdVexVM8XB/hWzpqfaYt1KWyECZfUPrpXqifqPghOovU
	8+VER+xCszmMJXwaNR46NW0a9yjc4znlpLnlq0JbjnM1/mXYkn9WyRsRJon32m4W
	8FvFBfIN08vHnpp9l8LrhaP/oKBmQsJQvdphm6YSvmc7oyae5hkJtXmDiT5F10jU
	Fr9sChhiYHn5p1S4wSvfZKZ/6nchUY4l1Dg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5drx8hp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 10:46:50 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-74b29ee4f8bso1946942b3a.2
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 03:46:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752835610; x=1753440410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ii7gkbQDsBKlsIJbbjCqaJyes15tBplO58P17UvUF84=;
        b=RGffhFeAil8glHdLfS50lzT00Yc/qxwNbHC7+3KNdTVRnrGzh+96aHI5jvW7KJ90kP
         U9WKH3cDLMq9A4p1Aa2mKf72mE+NAmBHdwnGzG1KSOjgsp1vlrFIuvUmHnXbmsTigr9F
         83ZREVmX7jq9S1idnta22HnXBixi+6wnQQiTKhjEHhtXCB2fhlA8bj0EBgMCf4K2/CLu
         OUxsJJW9hOVzTCifoCbq6LxxNnwZiBH2R1G78HbF/2daJVyu6+EYvfQzLbSYCQjqaxWp
         QOD5N1PlYuG+S6DYTQkMW0Qh0w1EalDrX5exdji40eRjbuyfCRDGMHKoXGT7TFidpAjL
         gLqA==
X-Forwarded-Encrypted: i=1; AJvYcCUxpmM6/iQtd5FHQKkHKQbQofDjROlDRH8+mOfe1vZDgW8JwrMhrxEsgtqwF/3vdPn+1YAdBGqOrGo1@vger.kernel.org
X-Gm-Message-State: AOJu0YwXznQ4ZDZibIs9FgSriZyoMZfz9zeXHp0pI5QXMAzk6zs50WkA
	+UcSlSFr6+rWt6tu7tWC7yBL97CjFulhtGrg3dVeTR7IPJ0T9uDaj2NhW5ItNnqfYxl3OIXh0Ry
	W0avHY7qlRRmGhH/owzRmYZb7+g/vFxTZTkhF6uDRI+TPHmGNpTy7Mi4ohm070Foz
X-Gm-Gg: ASbGncv3LFGOATd2wbKAAyo9hMi5o/M6uwTjiQ4uoQbrgjrsGTcrW9CmjlDndoFA4uu
	0l6IRvz254nmDZf2wYwT66yHgKTo19DxBzK/yrkyM9IFN7qMgHrq1R7BBDsqE2nhY1tfMtqT0DL
	Y6zqdsMwvXRBm0qzJNn9jBezNKdFGrb7SahrGG1Vp5eknWGyYpLB5O4TPtdF5NQwjLlukI50ENf
	PZZKfuiBQ4Nr6hoS7AHP9RNV6aLDyP4lTYCpk0QmLA/SE0/dC0y6jPNrzSIU4blUexVJYK/dnGF
	5nCg3dpxhjvR42JPtcm9R2vjDUjvs5yS5eG9w7J4smQCrN98kyhFWmzHIHSNgNopRDM5DLU7c9V
	6
X-Received: by 2002:a05:6a21:648d:b0:231:6ba:881c with SMTP id adf61e73a8af0-23811d5b72fmr13279544637.6.1752835609912;
        Fri, 18 Jul 2025 03:46:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+oIQZv7zeP2XrajyPNGsv0HOcYRrzrBPX4o99YzxCFVD8DkN7dyHzSjoLscfcsLRkcELSfw==
X-Received: by 2002:a05:6a21:648d:b0:231:6ba:881c with SMTP id adf61e73a8af0-23811d5b72fmr13279503637.6.1752835609468;
        Fri, 18 Jul 2025 03:46:49 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb678cdbsm1028989b3a.108.2025.07.18.03.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 03:46:49 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
Subject: [PATCH v2 0/2] Handle shared reset GPIO for WSA883x speakers
Date: Fri, 18 Jul 2025 16:16:26 +0530
Message-Id: <20250718104628.3732645-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: z749Wjuj_hgnp-EB03OZr9hD1hTsJzBf
X-Authority-Analysis: v=2.4 cv=D4xHKuRj c=1 sm=1 tr=0 ts=687a261b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=sKMTf-CTBu6bTl4tlAcA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: z749Wjuj_hgnp-EB03OZr9hD1hTsJzBf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA4NCBTYWx0ZWRfX0fenPg6VoZr5
 tIJUFviMFBK/SUu5LJZK7Y5iUXBqQ0jdLDnkoH0rpZelOe1lYgNBQNY7leWa/xs7HYCgACrDIOB
 f5RZKNEVD3X26NMKGpU6+UIbwdHVgJKIDXT+fFlEdulQ0xcLYE+OTiGdfxz6LigRMcxkTFX3f/q
 v8QUbl2HTYIkDHSvMFnGWrcgvkLyUmrSQr4RGA6JJDiAdErKi0AiTyX3x6VaGdfXnoRD4Jn05it
 b++z7Dq4Qcb31dbRNNEQY+GyA+xfn8LUhaK2kJLo9DezSyAyrYzrgUGlLE0RsX5UOQxxHP+38mY
 AVEn9JrKJijQuPZyxiSscLrjPQeKMYXCifkNxXeqCap1dJS5gHtX+3V+d9wJ5TC7oM8B20hFYL2
 ajOFBBXKVB4wZaanar5eMdBz6R7Ef+PV7cDkZDXo0kiqxHCJvLSaAtbBVX7EjquVdoJvv8Fm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=913 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180084

On some Qualcomm platforms such as QCS6490-RB3Gen2, the multiple
WSA8830/WSA8835 speakers share a common reset (shutdown) GPIO.
To handle such cases, use the reset controller framework along with the
"reset-gpio" driver.

Tested on:
	- QCS6490-RB3Gen2

changes in [v2]:
	- Addressed the review comments from Krzysztof, Dmitry, Philipp.
	- Used devm_reset_control_get_optional_shared_deasserted() api.
	- created deasserts/asserts functions to handle reset gpios.
	- Register devm action to safely disable the regulator on device removal.
	- Link to V1: https://lore.kernel.org/linux-sound/20250620103012.360794-1-mohammad.rafi.shaik@oss.qualcomm.com/
	

Mohammad Rafi Shaik (2):
  ASoC: dt-bindings: qcom,wsa8830: Add reset-gpios for shared line
  ASoC: codecs: wsa883x: Handle shared reset GPIO for WSA883x speakers

 .../bindings/sound/qcom,wsa883x.yaml          | 11 ++-
 sound/soc/codecs/wsa883x.c                    | 93 ++++++++++++++-----
 2 files changed, 81 insertions(+), 23 deletions(-)


base-commit: e8352908bdcd2d0bcf0aca8c69fae85fd5ea5edb
-- 
2.34.1


