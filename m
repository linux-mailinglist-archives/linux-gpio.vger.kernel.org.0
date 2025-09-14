Return-Path: <linux-gpio+bounces-26119-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B0EB56B43
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Sep 2025 20:35:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1317165773
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Sep 2025 18:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4748F2DE70A;
	Sun, 14 Sep 2025 18:35:01 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from shrimp.cherry.relay.mailchannels.net (shrimp.cherry.relay.mailchannels.net [23.83.223.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0991F5842;
	Sun, 14 Sep 2025 18:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.164
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757874901; cv=pass; b=UokkCn5Ch0F1dlJaPHK/e48xEJ535und1wbeVnYH8RuzWiWqNYd123i1+C84/uiurMM21fM5NHA63KzlEfCEQ+rpzPv2KQKOXjLfGvFCX9WFjpGWJN1F9z/IfBtQJb2vyb0i46Q7/4Jjh98zLZq3zsZVxiCwxNUoWt9uKRTYuRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757874901; c=relaxed/simple;
	bh=jwdJ57SPFeChMt3qLbsltswA6/cvWM94uNE0Q/m7Nmc=;
	h=From:Subject:Message-Id:MIME-Version:Content-Type:To:Cc:Date; b=U0Bnm/pyOZDaVr6+fzhAMTS3KzgsCWcA6aNVxFY0maPOEGZ9+vy1z0qWFbovBUZbhuT+l+oYDqtl+DftfkWdCq97qdSi9vZ8L413Jcg1Ew6W5Yd2bB/aXWO+CItgEVXE8PrMkJDzroYESu5Lte+fE2jGK4ALNLpLOn6a5nMWwgA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; arc=pass smtp.client-ip=23.83.223.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id E73546C0D51;
	Sun, 14 Sep 2025 18:34:49 +0000 (UTC)
Received: from uk-fast-smtpout10.hostinger.io (100-107-5-190.trex-nlb.outbound.svc.cluster.local [100.107.5.190])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id C97FE6C0D20;
	Sun, 14 Sep 2025 18:34:44 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1757874887; a=rsa-sha256;
	cv=none;
	b=13JhPclN37mXgfrnYhvcGJFkdeUPPbmJ8ys1WYjMW+haB3dddrJyQ+/jdWnS5MQjgWEspr
	4sbv4XRU7k/TPmFHmvwXU+7zGfCKiXl0utfiRuIzavBH3W1OxEjo8e+349omKn+46KuN6m
	R6iGKWEW3bL7yIsKxaMqJitiqAehM5Tz64ARenfjKGeiBYMSDlcE9wv00Cezaecssm94WA
	xVK19qAzrpjIb77hifJt6m5h7Z1Le8GFUoAr+/eekAq3grVlOZ9N7iy28MI1w7KIftkekB
	0L5c8sW/I2dO9U/Lu3x+IFXBlJhHU1rmnF17wNfK1AMV4w309QXkvFNaveZfoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1757874887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=REfKBUMlwDoG5LT4Qmitt7dxpBlc/HPo7D6odawzDm8=;
	b=uy0rvurB6uC+a//v6tOxeS8DSDYONBMcuQtcxe3QuJlsAnoMR59ZgZp3OT0JQXhuiY6Nl9
	mTscyyhrGyVXYNCwjXFz3fKRK76HfzKLaTcHUGOGejQ0y74AoJIwApI/LyLc4r0HAZ3mmi
	oyTZ5JXZUUIzVKp6Je49+ct37PdfMIItJ+sS2AYsDaC1b8XqbkSAJUDBvIyJQA8U0yV1Nd
	nEECtNpM2neWXGlQk8c/oOe9J1isduKszkkkF20GVXkycTSa2Ad58Ucf2E+523lQZipTza
	lPgczBXHI74OSZnqmLJhIYMV2yo0u+9QnLN42WFObRdodJg6h/pPKdPz0jVG6A==
ARC-Authentication-Results: i=1;
	rspamd-54bcd779b6-sqm4z;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MC-Copy: stored-urls
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Whimsical-Eyes: 6b96161a1abc02c0_1757874889625_1313890535
X-MC-Loop-Signature: 1757874889625:1636616220
X-MC-Ingress-Time: 1757874889625
Received: from uk-fast-smtpout10.hostinger.io (uk-fast-smtpout10.hostinger.io
 [145.14.155.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.107.5.190 (trex/7.1.3);
	Sun, 14 Sep 2025 18:34:49 +0000
Received: from [172.17.0.2] (unknown [110.138.220.153])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4cPxf723bmzFK6mV;
	Sun, 14 Sep 2025 18:34:38 +0000 (UTC)
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH 0/6] ARM: dts: qcom: msm8960: cleanup and add missing I2C
 nodes
Message-Id: <20250915-msm8960-reorder-v1-0-84cadcd7c6e3@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHYKx2gC/x3MOwqAMBBF0a3I1AYS4ye6FbEQ89QpojIBESR7N
 1ie4t6XIoQRaSheEtwc+TwyTFnQss/HBsU+mypdNdpZo0IMrm+1EpziIcq4uveAdaZbKVeXYOX
 nP45TSh9vOxzjYQAAAA==
X-Change-ID: 20250831-msm8960-reorder-1849dee3817f
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-gpio@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
 Max Shevchenko <wctrl@proton.me>, Rudraksha Gupta <guptarud@gmail.com>, 
 Shinjo Park <peremen@gmail.com>, 
 Antony Kurniawan Soemardi <linux@smankusors.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757874878; l=2340;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=jwdJ57SPFeChMt3qLbsltswA6/cvWM94uNE0Q/m7Nmc=;
 b=aj83fKSEVrbAz5jLUJ+BWO2KgrjsHjAfOpKQblx0XkM7pa+WOygJQAGZO3DHqGVErAO/IZCvY
 8d7cWJ9QE8VCjQjK9wxrutVdH8lz1UMDVzx/bMlZ6XMFIeqaajJV9WU
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Sun, 14 Sep 2025 18:34:38 +0000 (UTC)
X-CM-Envelope: MS4xfHdV8pYgGT2KC9F9XckX976bcsuuN2D1O5znkT15m46YwZt8zbpFoniUu8z8gD8YyxzouGHItdWk6HkMCuVJXqGZwtbPFGO7cbLQ2A5ySllCMBYpJbbU SgpTje4ROyQN8c2ukKr9FLinurxC0+hZ+PigIZl6vyplozMgStHUaTYBhgM/uTahCC1fB7CwI+Er9A33eFloJili4VVghO+RhRHBJZpyrWJfa10Jr8fppiCJ uOfctqJ3d0hvuz45mzr/6nSFP9M8D6fENKiaYt1wG6vlpAMwyMH2YlS2EyIbXsEz63DqukyD4ZO5vPjUzeDKPBbr9HSgR1EwF552UBmU2eJxcybvHhqPyK8R TNOESYVP8EQeC15+QK7LQCVgGI/TgGZdJRPU57i8y0xPExr3tsuHnEjCZitqb9M8BmVoabPlwC3qNNTB4gVexavSy7gpR2WIfyuYDLBNb5SZkMhI7JXcvKAN 6kBxL/2OkawG0ILtM9aHKPCNZaY+ambJv9BP9VK9vLxEwdAYY4yXJMSbsny/eHVEogL4W+nhriSX4iTKOt4eFBkJFsgxHufqQvyaQMkUQpoPsA4sWimmaKvi 3mNM36yaUzLAEN0AKI5tLuL2kcVraYBw5YianLOPH+i655YpMOET2CPCqyvEgxwXUMOK1SFHkABCMv0V46/tu2VcbTgzuHbKwK/8ewNDugN1FA==
X-CM-Analysis: v=2.4 cv=LvvAyWdc c=1 sm=1 tr=0 ts=68c70ac2 a=3tJJDl7MZm1GcYeSp/W8Jw==:117 a=3tJJDl7MZm1GcYeSp/W8Jw==:17 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=wxLWbCv9AAAA:8 a=Fg_ZwnXJ7CBUc7Ulf-0A:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-AuthUser: linux@smankusors.com

While working on adding support for the Sony Xperia SP (msm8960t), it
was pointed out [1] that the msm8960 dtsi could use some general
cleanup and reordering. This series applies those suggestions and also
fills in missing I2C nodes that are required by several phones based on
msm8960.

Changes included:

1. Reorders nodes by unit address and sorts properties to comply with
   the Devicetree style guide. Cosmetic only.
2. Inlines qcom-msm8960-pins.dtsi into the main SoC dtsi. Most Qualcomm
   SoCs embed their TLMM definitions directly, so this removes an
   uncommon split file pattern. Cosmetic only.
3. Adds I2C child nodes for GSBI10 and GSBI12, which are present on
   MSM8960 and required by devices such as the Sony Xperia SP.
4. Adds I2C child nodes for GSBI1 and GSBI8, which are present on
   MSM8960 and required by devices such as the Casio G'zOne. This work
   was contributed by Shinjo Park.
5. Updates the binding documentation to rename the GPIO controller node
   from "msmgpio" to "tlmm".
5. Renames the GPIO controller node label from "msmgpio" to "tlmm" to
   match the convention used by other Qualcomm SoCs. Cosmetic only.

[1] https://lore.kernel.org/all/rcazqdcr747ujkba6z2j2oci27ajkqfi4hydgc2kiavm73y37x@g63jga2fcwmo/

Thanks,

---
Antony Kurniawan Soemardi (6):
      ARM: dts: qcom: msm8960: reorder nodes and properties
      ARM: dts: qcom: msm8960: inline qcom-msm8960-pins.dtsi
      ARM: dts: qcom: msm8960: add I2C nodes for gsbi10 and gsbi12
      ARM: dts: qcom: msm8960: add I2C nodes for gsbi1 and gsbi8
      dt-bindings: pinctrl: qcom: msm8960: rename msmgpio node to tlmm
      ARM: dts: qcom: msm8960: rename msmgpio node to tlmm

 .../bindings/pinctrl/qcom,msm8960-pinctrl.yaml     |   4 +-
 arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts        |  10 +-
 arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi      |  59 --
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   |  12 +-
 .../boot/dts/qcom/qcom-msm8960-sony-huashan.dts    |   2 +-
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           | 727 ++++++++++++++-------
 6 files changed, 491 insertions(+), 323 deletions(-)
---
base-commit: 9e410f58e82ea0c0e865f688d84edad1da7824d2
change-id: 20250831-msm8960-reorder-1849dee3817f

Best regards,
--
Antony Kurniawan Soemardi <linux@smankusors.com>


