Return-Path: <linux-gpio+bounces-30771-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB2FD3C5AE
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 11:41:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B082F6AAE81
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 09:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB6DC3D348C;
	Tue, 20 Jan 2026 09:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mMlsLV3Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dYFVJNYa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3BC3D3017
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 09:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768903025; cv=none; b=TS2/Lc8KNE5rKBzK678+liDSZNhqTVBhEYw8TRJH98WTBO+q5vsHc5Gcsw8pIsTv49jj89keI4zhgWN11/oZOdDa35SD9p8UHCuaiRP0dzOI0voBkUQ11uJXkEwsO95atQZ0o8JBWZZ79JIVhNEnt6b3AYcNebJEHTNLUfPnj5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768903025; c=relaxed/simple;
	bh=FzH3FXVIZ4sYtWn5IF8efd7H+UrV06X/7FFmsV/Erq8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=borksVh4YCDhNmYZZtiHrKZ3L2iiTFKu8+JT67MDWFACC8D/oxjS5E0BzlVS6yPK9t3O2pXofB7J+K8Rjbg3uR8PErFlznE4tE/k5Og1BGwjDr8WhctN1PIK9fZ+/8PGsAEm1P/rc99J+Db9pZO0Rhc6NMa3Le51o9bHz8kycOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mMlsLV3Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dYFVJNYa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K8YBdp3367596
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 09:57:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SnG6fJCRZE7y7BN7GndMWu
	n9/Ei2lFxmtqiFlXiBylA=; b=mMlsLV3ZjWqaASrLJPHtMb47IpfszxZVgrOKw3
	kWnB2FHI31GXfDtdmeDiwP050lXuj0QNUKP0NTZ6l9RAKX6RKruKPoULErwENulN
	AlN7iJXGLAs1GNHX1PkjtXKzMIoilxj1NGYNI8fDyLqr3t53juanrzMJgPnwrIwK
	O4kCfOzxNYLlSkcm1Tg4cfjvF0fzTQoDyHSdATzRyGQEBoV2qJw1h7WAfN/b1Pbd
	K+Oa8Om/+DrAXyGUsOzIy/cEcKlPzHVJQKEbRFmQ4xLqj2hjup87FxTrEyCZVYcL
	yHUa6VavQABDp6HXq9uq+IfB3G5wReDZ6hDETFCNE8hZK6rA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsysb1dkx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 09:57:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5015175bbb0so121137281cf.0
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 01:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768903020; x=1769507820; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SnG6fJCRZE7y7BN7GndMWun9/Ei2lFxmtqiFlXiBylA=;
        b=dYFVJNYaHo5MV06LohLD3CDrO6apOz9AGwsH6JuVYEJF5sHB7zwzG062pf+SaOMdNX
         AynnRkZEP0kHLPBw8vW5ILAOL03SmKQ6V70XT6uBgPb7hrFZ19ZoDRWtPxMme6J+fEwP
         C/klO57cxU3dg9FNikb3dMeWjTreBfVlP84zO+De/W4leGpQ5DCKFQsxBJKa+htQ5eLI
         PQJw7oi9PE6gcmZU6XD7MYfBSuWGUVOcxcNz8XRfLQUM7Cikwpv1Cd+QJIKJwORzKUbw
         IevZmup7kM050HQIS2gaTcQOY9hx3XyA/kjA5ZpzHp/9asi8Yb0AqBDM43sMzTzFnxwJ
         u3uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768903020; x=1769507820;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SnG6fJCRZE7y7BN7GndMWun9/Ei2lFxmtqiFlXiBylA=;
        b=bbT0JC8RjEUdjgYoQH6YtZFiX/8ByABbZ/0E1rXpnQJzgdyTlOqnhypaNlBDaYTsGh
         T+n2/Q5/eBbk4u+pSz2k4hAZZQXQG+HgXjzKUir4HlXU/dZNqYltOh2aeWt20tI7awjl
         Rq4PveRGUNC1lMw7Tn/SJYzY5gCbFduLjnW1OsWU1iGnp9/OFwthUvNU9E93gCA0oBFm
         BQLZb1AuEga78cYygBtDnGnRmQEkRvumPRmKpNmcRB7f0C42ozolQQH9pKI0pdyF3/rq
         h6jTbd3BpdaWiJE6O9GlTkp1wlN80Cke7JoALOvj+P+pKrY4iE/dgLTsc2Utxik12sY9
         hYZg==
X-Forwarded-Encrypted: i=1; AJvYcCXQQ3xIb/pVWLzyFh1UGdNDFX6Ojm4JsalAMofPx3rlUBsVHNur0JbhY/Uma2og2Pod8AeY/OqpklKF@vger.kernel.org
X-Gm-Message-State: AOJu0YwNVUw1fbIsmzPKpVJN1JylneMrQeUDNBswLKfoDTKv/mNmUvJD
	LvqCi9KsHky1pUuimgVaddt23D/dEsMmK3GZuBj3z2RAydHca4Mip36s7EzYlg3f4eSjJU/c9jb
	Re0Tnnzapvrb29cRer8YLi9EDuRlmYU2I4MOCNqMOf7TB2uM+cOM3et1csYh7ya/V
X-Gm-Gg: AY/fxX6FZ4h9Hjqd+Devo9hPyUbDyuuOSGe7U8//NMkb8WoRHmkZcv0QpCHk8UEwy0M
	XwOFAylowfcDEwV3I54JGAW8LdUtobWeqb8BJTA/+SIkP2gQHcQCtX7lOgfPUt6G5wZ8vmlq+02
	G8RG4DkdP5Wpwy7+drOg8yK0kkAupGL7/ywMabRY+jONGu985bg7dwIiSyc2xSpo6BOhkW47Niw
	NN5mBOxkxXzGaDljCNADD041KHeOpKXJhwbN95MugIA2ZgbwJe0ANCFUdmXRWbLc2kVv8spVr7I
	1w9+wc+vrolYJhM26FLLcwjJ+TAIq1qVWflWDjo2f4sDpm6bsUafZrJRDlNb3L2j82aBTJufjkV
	/IoHp6o1R5mvsYQY0aQ==
X-Received: by 2002:a05:622a:95:b0:4ee:191e:adea with SMTP id d75a77b69052e-502a163d0fdmr178747171cf.35.1768903020063;
        Tue, 20 Jan 2026 01:57:00 -0800 (PST)
X-Received: by 2002:a05:622a:95:b0:4ee:191e:adea with SMTP id d75a77b69052e-502a163d0fdmr178746921cf.35.1768903019439;
        Tue, 20 Jan 2026 01:56:59 -0800 (PST)
Received: from hackbox.lan ([86.121.163.152])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654533cc543sm12697032a12.20.2026.01.20.01.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 01:56:58 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/3] pinctrl: qcom: Add support for Qualcomm Eliza SoC
Date: Tue, 20 Jan 2026 11:56:39 +0200
Message-Id: <20260120-eliza-pinctrl-v1-0-b31c3f85a5d5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFdRb2kC/yXMQQ5AMBBA0avIrDVpKwhXEYu2BiNS0pYIcXfF8
 i3+v8CjI/RQJxc43MnTYiNEmoAZlR2QURcNksuCC8kZznQqtpI1wc2s1DqvpOqKrBcQm9VhT8f
 3a9rfftMTmvBO4L4f5a3x9XEAAAA=
X-Change-ID: 20260120-eliza-pinctrl-7bb592ad63f1
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=892;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=FzH3FXVIZ4sYtWn5IF8efd7H+UrV06X/7FFmsV/Erq8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpb1Ffa++4e/D5/abuIIXQA45h3fb+68lmL9fqB
 wtBEzvBiwyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaW9RXwAKCRAbX0TJAJUV
 VhXYEADBf+0NS6KjFQ6ZDlmQpwIq9NRAJAIcZ6u30sOffxG+/wziu/zgbXoZuG04PC16KWMQp6P
 ar0UaU8C8IUcs2INdg6KqPOWiYn4Xo2creB3habv5hS1Xd9yTFSVr+b4q2deY50jS+5x5eR4kZA
 V2Nn1TXGVVFxzoT35XNKv9g4Z/JjyJK5Bx29z3FxZQc5K38O8tFooexvpIv7LlI9fc26Ex3uiOh
 HtS+aq+5RQaNnAjAULAMBSwgwyDTfaGeLTqL2MlFfsTZTPDv3lBIQtP+52XguNPQDaG3lSuC1UM
 d94Q6Hdn32UK1CKMZoMbKLPzLY7ida/WtF6B6y+/81Ob98/Jzg+9J2e+AM57YIfY98jdBsX+1W9
 MzezyRKL9+67GhcMbodPffXCOIzszPvJ1dzVjIV5bIunt7wwVnVJJiiswJw5/iWEwaqPNe1972n
 dPV8WTdsVlHE20fYdQ1pkGW0hgEjRDzxmtJoFmYjnvWbFKvbVCaOuRlxe0zvw42EQEqf0jAqBNN
 hVMvzNz1zY62KGdiwTDGC03mwlLUdhhHG3Tv2+1hjJqQE7/QhuPTsvC9k8V/yLHTZ6wBhjvAFtG
 i/5F93uHQwpO9nP+45umIz/lpPFm9v7c5wETe+Vo+2xnoP31w0868tvzoLMn4dNzK66Iw4wiCp8
 taT6xkLqTLT2EyQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: PM615Pi82xppjZtITkSjAi198gtU3IzT
X-Authority-Analysis: v=2.4 cv=XJ89iAhE c=1 sm=1 tr=0 ts=696f516d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=RUlelSpolvTNyr7Sls5SJA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OwXYu7Csgvg7BBQfv-AA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: PM615Pi82xppjZtITkSjAi198gtU3IzT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA4MiBTYWx0ZWRfX94vAoIWm+j3Z
 VbR50xPzQme5TRbxu7EXEJ/zlU6x0eBej+qfS3uRo2gWcwrn+XVvh5nVfqUrFpfogO2SJGuvcUS
 MJoIVDt3Ipq/yApb/2bpWSic5OAiSvzXcLFzpgGjG1RCkmce1swo0m12FVQnjgtda6krypp/frI
 3DsTqqwtj+5cuYZLGNiam5RNHR5lKdE4Y8rwZszqfXMcDx3EON0XaTH1e1d9PU/548SmlQ4+Vrf
 j8ox4CzRglTBXQUnBGOHf/IEN+0aDOEB75loBEmLoWBtUDWJU3oFT1LRtGO8Vyz+xSGVsKwcBdM
 V+msds9Ch/79cDFu4IzLLWwAaUerYmLEsjgGgGciyleiOlis5vF+ZiwNVRo04cHKbZ3VMVZ2zjb
 NfNDRbhsRfa62g5t12p4dgzwygyUl2RcPhcbVOQgt/2BF2hZFMnaowIozsXzUMbEwKy5/txc1Ak
 nc61bhQtIIdzUx6SGxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 bulkscore=0 spamscore=0 clxscore=1011 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200082

Add the pinctrl driver, document the bindings and enable the
driver in defconfig as built-in.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (3):
      dt-bindings: pinctrl: document the Eliza Top Level Mode Multiplexer
      pinctrl: qcom: Add Eliza pinctrl driver
      arm64: defconfig: Enable Qualcomm Eliza pinctrl

 .../bindings/pinctrl/qcom,eliza-tlmm.yaml          |  138 ++
 arch/arm64/configs/defconfig                       |    1 +
 drivers/pinctrl/qcom/Kconfig.msm                   |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-eliza.c               | 1548 ++++++++++++++++++++
 5 files changed, 1698 insertions(+)
---
base-commit: d08c85ac8894995d4b0d8fb48d2f6a3e53cd79ab
change-id: 20260120-eliza-pinctrl-7bb592ad63f1

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


