Return-Path: <linux-gpio+bounces-36673-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCV6OGEtA2qM1QEAu9opvQ
	(envelope-from <linux-gpio+bounces-36673-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 15:38:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 652DA521603
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 15:38:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 419FA306988C
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 13:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 662DB37C917;
	Tue, 12 May 2026 13:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YcZOhgCD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bXMOsNO9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D184A349CE8
	for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 13:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778592354; cv=none; b=L498a6T7/h5xdpn88G+ShCt/yhjWsMa+Wmj5FGm25bMmWrrCYPnWATc7G8/5Pr50H61FCoI8WHYAnz2QIxNYC7UOzedrq3zs3Z+CuohR6cuSpPBDhsyk+/M89n1VCwdMqBuALE2BcWsOhK1HE+78hYB920b57xC0sFG/VMUGELs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778592354; c=relaxed/simple;
	bh=dAUT6urYpcci7+seRnPuuK6X6/yN+Qxdu2FzYuJP7Hg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kdqy59qW3O9Ftl9WMXCPsK+vO53NydUNcq50BTEA9OTeKQZqzE3Lz6iDyGH1aKhUdO9S6wlKGWOAmLP1ZxY6TkxXhh4/sjnJrEBpY8tsMfaL/BQThN5gJn8pyUcSnRYcf2GnDoS+7NOCKm89tEW0/t3kWKv7g1TIbj7mA6cZ9D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YcZOhgCD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bXMOsNO9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CCgxSA1410134
	for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 13:25:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lMr3Au4g9Ol6K3jiliyVVM
	tkLtrNvcrj6O2G0UGOHms=; b=YcZOhgCDiWBS6xmV3kVm2KKAveDmLO/4b12J07
	hCfy8JEijGdANMUZOKd8K2JVqcYOlxOytZlO4/oilpPD4Y6/ZSJabHGu+NR2regW
	gzZoNBIwJCRrLdoFNcr/gpcbMm2SLtXDJyZlM+Q1+BJU9+rtdx/bhDW4+L5h19pz
	74yffHvL2ImViMiB5HSHCFprKGNg5j7NfF/T9g2AZXCc+MfiM9KACQQ8t1nY5tEb
	TmBjzIEAsU9V8L00tpnrfMbEZfd5yUZf/TzfxHxMFNGyYVxdbMQPTTetBN72XXl3
	h+iVn5RKhoq3B46puALfCLwxLdUftJ1FjO/PZc/ZrXU/BrgQ==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e44f304rr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 13:25:52 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7c0de780bb5so54373267b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 06:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778592351; x=1779197151; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lMr3Au4g9Ol6K3jiliyVVMtkLtrNvcrj6O2G0UGOHms=;
        b=bXMOsNO9a/dR3Mffpf86x29pBBbZb1BWzoLAAEv9sR7zliYEzPRO+VGtADCWztts+p
         IL0+RAKrVKTb1BuMTBhWUWmCcAoenE+pwL4g8xpdL3T87hywcUXsEARAYolFbiYWgdrj
         kGibgQLUkRcfFQwhvdSznJJDnaD6EBejEd0jrKQNcit+/RROPCdXJq8cvbG3nX4y+Lto
         tLhAVT5Vpw44L5ztOz9B7uBRkQTIB7UIVMKLCpuUC4oIO4Cu0PoB3WIUYTUuUU0EoEUA
         7VVowUBAowHC+dP3sUPvzWprMD963fcxRcbYdEa7W+Rta451RMdFEgIAv8zxM71LFqXm
         QpCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778592351; x=1779197151;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMr3Au4g9Ol6K3jiliyVVMtkLtrNvcrj6O2G0UGOHms=;
        b=BOHCIK2Jx4iIQgAc/JidWB4/Cv8T8269Wewh+PR6lGsoKs5eje3Ojx//RVL/qCHcKJ
         TNgOhFP81uH57o5rrtpYjAT20U3pUY37zFFDRXCqRAL10IjUr3dfIL6lavxZlpe69ITA
         Z4lb7BE0pRJ75WFz7sMzwUca2KWZK9xOfGUMts8bjxuoHm4jAO8iK6VYuJ2OPNJKLxd/
         fyWnHNzGbcwS2b9tu9F/VKVpY5emNH0vzT0JC18aby/DflnOiUoDRzJhZk+nMMhEWm2w
         BZTBWrEpy0HP9ZPzF4WWptW6OR9aIR3LGadeRm0E3UyepFmaO1UqX/7d/V9SR9RYinix
         q9rw==
X-Forwarded-Encrypted: i=1; AFNElJ9w4uG01FVQgLUtOJDTaM87sQts12idQcL/DRzAIpnvRzsj9Ln+6x3XsLccqAC1K63dO1eLJfpeHmqs@vger.kernel.org
X-Gm-Message-State: AOJu0YyPLTpakiG18zFCXi//MMSx2cKMTUknMWsnciRK6GDMpZTe2tPX
	u3g3hSj5hVSE4Z/kSgP/8qPWP+qRjgdP8LBEuCLBhrU0pTJE64z1oMnhuU0RQyLRBtdKBN465xK
	OZVdr+84kxLzyNiZv+AIWilp4ji4yBcR8Q+LZ1U/KZCPZlvdh2CktpYk85Lpox6ss
X-Gm-Gg: Acq92OEITrVCWPN/Na0ifRzlHbwDZAJdheSk3wfBlJ5HBRBg9R8PB7jRAw4S1HVOYDn
	/o8UwSAaRLwyO1uah222TAYVec+nVS9vffaDuU1Hgd3W9n6gOTx4frlGfS7dLiauf3UDxGQitaw
	NzUwgtyuxtd6Kg9X710Jsmfww5rqPQFq9yz3c6TU7j6CCZ2tZBU9N5mYqfBj+RL8vPSuRIZXUrA
	MU3F9x1hRNseJJGpFgIvuSZOH/NQOGq9ZvpUgb0K0Qt51cO7CNsmOOiDYQNPRsExPEhzvWwMAbF
	gsiUDWYHjGgBjbBcmmsfqCQQsmji8hls0Wa5MmGjpl1i3U3u5DggLhFvnOlnpZnTAuU4MVEgq8A
	78cTboKe6zWMjbBO5FSnTlbf1BcVyJVPhgiJh
X-Received: by 2002:a05:690c:6d84:b0:7bf:3b0:27d5 with SMTP id 00721157ae682-7bf03b03627mr269366557b3.47.1778592350859;
        Tue, 12 May 2026 06:25:50 -0700 (PDT)
X-Received: by 2002:a05:690c:6d84:b0:7bf:3b0:27d5 with SMTP id 00721157ae682-7bf03b03627mr269366267b3.47.1778592350409;
        Tue, 12 May 2026 06:25:50 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd66861afesm164595757b3.37.2026.05.12.06.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 06:25:49 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH v4 0/2] pinctrl: qcom: Add support for Qualcomm Shikra SoC
Date: Tue, 12 May 2026 18:55:42 +0530
Message-Id: <20260512-shikra-pinctrl-v4-0-b93c3a2e4c08@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFYqA2oC/3XPTW7DIBAF4KtYrEvEnw32KveouhhgqFETOwHHa
 hX57sVOq1RKs0F6SPPNvCvJmCJm0lVXknCOOY5DCeqlIq6H4R1p9CUTwUTDlGhp7uNHAnqKg5v
 SgQavOdgGnW8CKUOnhCF+buDr2y0nPF+KO90+72xX/aDmF82ji56C0IDSOKtRdjNfVQsZqRuPx
 zh1lWw1U4GxoJUGC5KrQrRGM1sHb8AJyaAFCGTd38c8jelr61es9YBnVWZOGeVWWSusBOOb/Zj
 z7nyBw7p5V55NnMVdqZl6UMSqKGy9c8I3pn6iyL+KeVBkUbTmpZvzTnH+j7IsyzetGTwTvwEAA
 A==
X-Change-ID: 20260429-shikra-pinctrl-fd71ab6ecd6f
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778592345; l=1860;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=dAUT6urYpcci7+seRnPuuK6X6/yN+Qxdu2FzYuJP7Hg=;
 b=lwNmKw1UkDXYNRZDZd15AAJPE5rNQldpF+B5wS5fwyWqxTDlc8Wn1+4c53ez/uQqIh7QzVA35
 9IZPGzivPSPDuHJO5wkWo6jh2UcdyxuBjny+aRGZ9M6aZCKlTu9zqkT
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: UJOzoC0_VblgyX4iS-AKkr3R7rCD2_Qk
X-Authority-Analysis: v=2.4 cv=SpSgLvO0 c=1 sm=1 tr=0 ts=6a032a60 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=F7K3iWs-JhacpI5SHW8A:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE0MCBTYWx0ZWRfX7d//1lyqQ06I
 oUtJDLOb7LxsEHt4qy/r8J/uwHiv3UxRYtUdxToGNCtxJUUkGCbGz7aE2zHEGkPir06zTb8vkQP
 RPMByST23wPLVyzW5QFtuu8kxJyCd1E4VRs6eT+p2MEhuHe/yXskVl0q+0MljoNgAGbm05G1o5M
 XJJ+IOeidKtI2mwGwaNCCTCey/8xEDILfTQvYi0BThxlPPNcOZ8h6rkbjKMyR6jp3ov7aRrLUy8
 GXhWOmZBV/K5bHU/XfKjPyrUC6LMCzDuv9DUYuSxkz8IBCztmp1teSbw0PAu0WajWIrvDXGhpmo
 MwYJPH5BrsWT22MBo77G/FosT+hMPKjqv2KOoy/xorB0f+vcdbzpTcKuow5HLgISoT6pBGgc4/j
 ttdtnqZ5aRx6Gm3241/3sm81/AFDk1hZaxf1cOOCcBvPkJqcp/M5dBDBR8ykwrNMKWNzUzSt+LW
 YuaJtN4PvLyvU7brlSw==
X-Proofpoint-GUID: UJOzoC0_VblgyX4iS-AKkr3R7rCD2_Qk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120140
X-Rspamd-Queue-Id: 652DA521603
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36673-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add the pinctrl driver, document the bindings and enable the
driver in defconfig as default.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Changes in v4:
- Remove eGPIO fields not supported on Shikra: drop .egpio_func, .egpio_enable
  and .egpio_present from the PINGROUP macro and shikra_tlmm (sashiko-bot)
- Link to v3: https://lore.kernel.org/r/20260508-shikra-pinctrl-v3-0-771144cdc411@oss.qualcomm.com

Changes in v3:
- Move MODULE_DEVICE_TABLE(of, shikra_tlmm_of_match) immediately after
  the of_device_id table definition (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20260504-shikra-pinctrl-v2-0-14e9dcc2d685@oss.qualcomm.com

Changes in v2:
- Fix Kconfig description to drop "Technologies Inc" (Linus Walleij)
- Remove unused UFS_RESET macro (Maulik Shah)
- Add spaces inside braces in shikra_mpm_map (Maulik Shah)
- Fix gpio-line-names maxItems: 165 -> 166 (Krzysztof Kozlowski)
- Link to v1: https://lore.kernel.org/r/20260429-shikra-pinctrl-v1-0-1b4bb2b3a8d6@oss.qualcomm.com

---
Komal Bajaj (2):
      dt-bindings: pinctrl: qcom: Document Shikra Top Level Mode Multiplexer
      pinctrl: qcom: Add Shikra pinctrl driver

 .../bindings/pinctrl/qcom,shikra-tlmm.yaml         |  123 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   11 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-shikra.c              | 1253 ++++++++++++++++++++
 4 files changed, 1388 insertions(+)
---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260429-shikra-pinctrl-fd71ab6ecd6f
prerequisite-change-id: 20260428-shikra-socid-a27ae38cb7e3:v1
prerequisite-patch-id: 843f28095c0d42d0d60ab7000095c64dcb2e90ca
prerequisite-patch-id: 1069d6880c3ff91c230c20fcd876738001c6d35d

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>


