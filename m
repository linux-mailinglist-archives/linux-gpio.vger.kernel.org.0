Return-Path: <linux-gpio+bounces-26564-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50889B9C78F
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Sep 2025 01:17:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A6D31BC38E4
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Sep 2025 23:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 938622C3260;
	Wed, 24 Sep 2025 23:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UO1djkn5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A537C2C158B
	for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2025 23:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758755774; cv=none; b=Omhtk5252foU46D9Vkiiu2/4J+HjIxDBiAFn1yo7bpSPjO+8oWLnNHACnPyD5OzQZmSt7Okrytx0odKVipX0fcMZg9+YZgfWjEy+je0BwI+qLX3M0WmGvwQQaob2e2dWBfydYfCUhOmdJYsGUS8NWJmOe1lgcNMxujNy+f2AlPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758755774; c=relaxed/simple;
	bh=ivlwUUQlmRNXZlh7F+6fYULgHiWE/9fkPiEhxumB3rQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VBqni3AFmU5zkIrtyELl73YKwgB7iofNosHHxpt71MKEWrJyJ8oHaaFDLs3/5cUFRpDEgrQXyIMouIUEy89aOHvHsJA/9vNRh2ciAqxByfNQlLDSr5ASod7kSVjEU6Zazk/2Cl28qIzLuIr/BqLQ1/yNgAVtEZyKZRefstPw7aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UO1djkn5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OClqGS025248
	for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2025 23:16:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wTJiF4BIPwE/2c1eTUxFT0
	H6zXGwpZWLXUqTjd5z6pg=; b=UO1djkn538dFcbyhVvFC5DZEYy/t3S/yvEa+Ta
	nzEx+tVehw60gbo/6pRY6yt5vuFwHJRpmAxTuwCoqOwcRaMAhSeBZSqQTXs3OLBb
	VvOhtih9uqtaqT98375KmIrLEkr2CihZhsWhB1IIiaiqi1CO+7IR8o6wtoOgFOSy
	aVEunlcQqZYBoPb36fCEYuSSbn6vAYF0ctdq3JTYp/Vi4F0Udqi5h7k0k382pVnl
	DH8JCi+9slkSGnYl5A/WiqPKvA8vVukpIZdE6gPWoTiFsA2YxyG7i4fFNVFqTpUx
	VrFMVlbE6VF0Ba8LfR/Ip2k9QiOqsolzfFqTGXRlePO1OnMw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv1618d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2025 23:16:11 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77f68c697d3so276410b3a.1
        for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2025 16:16:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758755770; x=1759360570;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wTJiF4BIPwE/2c1eTUxFT0H6zXGwpZWLXUqTjd5z6pg=;
        b=PMp0O3GXsDS2g5iqAvpYJtZ2Skp6/eYEaeBf3pQhWdym+TF/NFSUyFoAsKPgQCQAW7
         xC7+IsPKDkJ96L6lxl+6dinp8f6nFa7/w9vYBHdr3CT66WjWpU2aeyPuhE0qyD0g/HSe
         sqL/xMugEKY3GkrVQyefutwRx+x5bFftYX2gcGGmoBrlQR+c8eZwdl3yvCcU4Sw9z+vL
         pSLXjB0mY18huv1Aj4OyswDIm/gdJLJb7eRoiMA6a7AnsGYeZPUyKvWHx+vqrkStSRLi
         /vmnOeRLkJlHoSMTV8/imSZiH+GUnbXBW/J4CEEytgiPnJADNjlr1c9a7zURQZnvVRKv
         zjIA==
X-Forwarded-Encrypted: i=1; AJvYcCUbJhdzPYOOhKXqYE9KE/rV/8ywuV00BDzD1NQyR2C+GiyJivuOfj7bRouoZ03PyXN6IlK9qhFDSdDp@vger.kernel.org
X-Gm-Message-State: AOJu0YxrZ8rsdWbemeJJT04j7D7akVMPQAyaUybZuUzc7OKVbckj6MNn
	is04Z805VHH10NqKanOltfAlYBUzTsXyAw+lQOVOybB6frap08MrzqHVn8Ki8d6JyQeSoEJztlW
	S648kLKaLlsRtcQ8SAobtUFbDGKhYJ6GzjpPAe7VqfAH3BS9Wh+9BkLVK0q04pkCMIdKTwjCpF/
	U=
X-Gm-Gg: ASbGncvggNYRvHnqsLMhh4pGajuNxAwgtkWPPmFY1P6S5Phs2x6KQuUXGy72SWVVxub
	toALPj0/iZxb/ibkczmiqGyPSHD1pX+OFcNtKMPWtonPtXP4rPPXxSwCwB3i5v8JpKziQWuO0co
	lMh3STD8EpQgZU1jNmAKxsDsnCo5CkdEjh98aawjTzdDdRmY9YXQHBNNyzqlOxNfWYvwcq3UNh4
	1bMfwJPIJiWFVHDoZGROlsQ3uLBLSyWSdGG0db74b9XK/6hJ4t0POXgpzm+oHKVLD9CQAj5RRcJ
	NJDwVITvesdUfFmmDQN4ukRzdBYzs3rUjU/sUajduVVdZB1W+KKQiqp2xjiaclULelSBL6XbSgk
	fFekvu9T/9gTvvMI=
X-Received: by 2002:a05:6a00:3917:b0:77f:472b:bc73 with SMTP id d2e1a72fcca58-780fcdc7f7amr1729482b3a.6.1758755770075;
        Wed, 24 Sep 2025 16:16:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+6K/1ZFPyR/zAwkK0azv8gcDU7cAcbMQSe3Bc31YPHGam1kxpHhJxChPuGrl7oC0rfnontw==
X-Received: by 2002:a05:6a00:3917:b0:77f:472b:bc73 with SMTP id d2e1a72fcca58-780fcdc7f7amr1729460b3a.6.1758755769659;
        Wed, 24 Sep 2025 16:16:09 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c27686sm144845b3a.96.2025.09.24.16.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:16:09 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH 0/2] pinctrl: qcom: Introduce Pinctrl for Kaanapali
Date: Wed, 24 Sep 2025 16:16:02 -0700
Message-Id: <20250924-knp-tlmm-v1-0-acabb59ae48c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALJ71GgC/x3M0QqDMAxA0V+RPC/QCkXcr8geokvXsLVKIjIQ/
 93q44HL3cFYhQ2ezQ7Km5jMpcI/GpgSlQ+jvKuhdW1wve/wWxZcfzmjc32MkUKgwFDzRTnK/14
 Nr+qRjHFUKlO6BplsZYXjOAEsexcWcwAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758755768; l=769;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=ivlwUUQlmRNXZlh7F+6fYULgHiWE/9fkPiEhxumB3rQ=;
 b=/G3wgQ4QYN4y/BRvhzhGFePmtWPvBXmc43/t/mFWyQxQdB1XEtMwNHtqxJgw/bMdUHyC7v7bw
 Tk3WuLolbEEC0M+kbTG8Mr59QbBhD6CvoK1JxyYn0aECaGLnwhpleDB
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: Wi_b-lkEU4MW-wyeVDVNvcMXsFaMDWZZ
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68d47bbb cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=0wRmexETLPsNm1jg2zQA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfX2rsOofTjf/Mj
 4LZh/h2paLmRVQdNPJS7fxfZB/z2XmqwvnkpgnuQ8kecqF7gRpGmt/gAeofHz58r5SAEi+Z/1Gh
 4suLXLG/644EB8YPlmXBdSatfC4SslJ3dfKOUQrh/ZgdgGzfxDIwk/A4N5Vv6RArVp30cXZwUEV
 g3nvyg+i0WyS+k1bKmKHTLGQGaCuYqTbeWwcjtmDo2T+ya5XVUeya2f+3LkK2a/dhX8SKm9UrXS
 cAhj6FbT62uJ1Uy4rqyctBEGU7iQn5a4GW/VOnXW6COQflpYT/kMduT1VAMfuKqVnPvngtotwJv
 wsKPL2rY6dCoU7k2R+8JgcFI6eD5JgouDAJb6zB1K0lY6nkgZeOi6qgdVuf2QJSrkAeBHaKmaXa
 ndlAiwMR
X-Proofpoint-ORIG-GUID: Wi_b-lkEU4MW-wyeVDVNvcMXsFaMDWZZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025

Introduce Top Level Mode Multiplexer dt-binding and driver for Qualcomm
Kaanapali SoC.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Jingyi Wang (2):
      dt-bindings: pinctrl: describe Kaanapali TLMM
      pinctrl: qcom: add the tlmm driver for Kaanapali platforms

 .../bindings/pinctrl/qcom,kaanapali-tlmm.yaml      |  127 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |    8 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-kaanapali.c           | 1803 ++++++++++++++++++++
 4 files changed, 1939 insertions(+)
---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250917-knp-tlmm-009fffa55a5e

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


