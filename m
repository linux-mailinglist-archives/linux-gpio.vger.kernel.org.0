Return-Path: <linux-gpio+bounces-26423-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 729DCB8D46B
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Sep 2025 05:34:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF4C918A1596
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Sep 2025 03:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35BBE27EFE1;
	Sun, 21 Sep 2025 03:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="VcQ9SThW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from rusty.tulip.relay.mailchannels.net (rusty.tulip.relay.mailchannels.net [23.83.218.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A7827B337;
	Sun, 21 Sep 2025 03:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.252
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758425659; cv=pass; b=SB0EY5dgZ5c04T1adbBvJhHkZLOI6+HgervZwWBeYx/aWwjolo5i8gv8MstRVhiRdbIv6oXLIO/7/YeO4NTBdG38Y9jVbzFlBaT49nnTwPpGge7IwfC7tw8EPyK9mODFrui+Jz41j1SvmLXyl1G2d7SiBXi4/WRKKAaaEq5WeI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758425659; c=relaxed/simple;
	bh=G4+nuNjx8OaM7Xe7bscK3toLD2aX5PuGEo7CevkMTUw=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:Date; b=aH5QRbYPGocqOaGPQNgWwEqc7qQcSjJtOytkRj8ZDx/6bkTR1/YeuX6oApDcZK8h3rmfIIJEy0KkMEuAdepDKEuSGVmlZQ/FJHWH8Dh4IcBgJsyfi0E2J7cEcNJFbX7AaNVvGu73Eju31qO27vpBNgi+WudMqBuoBkwzRRbAiBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=VcQ9SThW; arc=pass smtp.client-ip=23.83.218.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremailsmtpin|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 37BF51E0C73;
	Sun, 21 Sep 2025 03:26:09 +0000 (UTC)
Received: from fr-int-smtpout16.hostinger.io (100-110-226-62.trex-nlb.outbound.svc.cluster.local [100.110.226.62])
	(Authenticated sender: hostingeremailsmtpin)
	by relay.mailchannels.net (Postfix) with ESMTPA id 387DC1E0C6C;
	Sun, 21 Sep 2025 03:26:04 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1758425166; a=rsa-sha256;
	cv=none;
	b=xU5ZtoMqL+jjuMXLYyN9P1A9m/sFhBG0HI6CAay0KszatZ+zOnOLiJGZNf1BI5AWQoukRP
	0hEpp3Aqdp9iJ2UY9wf0c91Hg0g3uePFWcceBjiUuqqT2Jw38InSKxSpnDpRf743nJRXIk
	nI7dSM3LIkEye0pQg/MsUHQmuKLFQWcr16rXlySw0brivfwhQz4DOE6lP/Fzxm6Jm0walD
	IPOWMyJi+W0VdSk+71ylkC5hFLxI5/en3TX/earFlab3FX5vv+7tYC3t5paoAwbQxfWQmp
	T6EbHZvE0H/8W/kHOdui0fpeeqRUNmIdnt51H7XMcEEP20IHuZrE36g3DNLI2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1758425166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=p/GwW2MoRvM5xht/dwnMrn6cQz+wFw7PH/Wi3IqPV38=;
	b=lib8sZDf9QEtMfLkk3jOyj7C2qJB/B9/qR4UrTINiIauviRlMjgqbtMLQ/20HcWmo6IEcz
	NndfQjz1DU1bGnucG9JeWYNv0vmJRaNmeZgxX41ZDai1TwRNva98CtQdHlYdFFrdmpHCHp
	SgovZ+aR+cH0UwVDP/t6UT7u71hJNxgX6faXK0hIozgQ9nxsnKzWw6Joit/z/Oz7L3UpEN
	3QO/RBaWicJApKhuFZdf5rucvbgxQK7BBwVGAtfmUqRmOpb9ZnVw449pmEvCcGFVZYJ8KW
	PiyylmKtRWnh85ldTAohNvRYmme77CFCYCq6ovXpA96bo62IDDOFMlfGV4m0Yw==
ARC-Authentication-Results: i=1;
	rspamd-5b85487794-gpb6n;
	auth=pass smtp.auth=hostingeremailsmtpin smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremailsmtpin|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremailsmtpin|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremailsmtpin
X-Print-Obese: 26d0a8142cc4fd01_1758425169096_3227658715
X-MC-Loop-Signature: 1758425169096:70033340
X-MC-Ingress-Time: 1758425169096
Received: from fr-int-smtpout16.hostinger.io (fr-int-smtpout16.hostinger.io
 [148.222.54.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.110.226.62 (trex/7.1.3);
	Sun, 21 Sep 2025 03:26:09 +0000
Received: from [172.17.0.2] (unknown [180.253.43.125])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4cTs8R3YhFz1xnZ;
	Sun, 21 Sep 2025 03:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1758425162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=p/GwW2MoRvM5xht/dwnMrn6cQz+wFw7PH/Wi3IqPV38=;
	b=VcQ9SThWgjb02r3l0enWN4NhFseALmFILwDjybRg2vfhmYPiGHP1mRHI6GCi30OcPlD7Gw
	n0ErOLclYx/9xQNhWwj672ZfBoN7aLzMrJZKLBhU6+Wk6TnetVuGJUO6s4TUZpEvIOpjuG
	Kfb28fTci+1Uf80FK1mptkwnv4iCMFoiuT6WvcQSjPa1by+hGdqsTX7y19cwCD6a1G4Rbl
	NwmotG8QAj/eBCkVzZGpaEgvYEQsncdBrt2x53GRa0gzOCFacvDx+SiX74aFXhP3sE2Ree
	ZVg4R/ei6bTTT/7N7ZC2itO9kdnZu4BsjQOZjqmO+disn3SBdWdqL0neRgIklg==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH] dt-bindings: pinctrl: qcom: msm8960: rename msmgpio node
 to tlmm
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250921-msm8960-sdcard-dtbindings-v1-1-5a2455a30a06@smankusors.com>
X-B4-Tracking: v=1; b=H4sIACZwz2gC/x3MMQqAMAxA0atIZgNtRVGvIg61iZrBKo2IIN7d4
 viG/x9QTsIKffFA4ktU9phhywLC6uPCKJQNzrjadM7iplvbNQaVgk+EdE4SSeKi6KmlimpruQm
 Q+yPxLPf/Hsb3/QCh5AYZawAAAA==
X-Change-ID: 20250921-msm8960-sdcard-dtbindings-ad8d3d511e6c
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, Max Shevchenko <wctrl@proton.me>, 
 Rudraksha Gupta <guptarud@gmail.com>, Shinjo Park <peremen@gmail.com>, 
 Antony Kurniawan Soemardi <linux@smankusors.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758425159; l=1736;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=G4+nuNjx8OaM7Xe7bscK3toLD2aX5PuGEo7CevkMTUw=;
 b=iI5B4j9XZ+1xQhXux0OJllZ0pFEn8+swuTHksllpsuOdVsHfiFQV7W1nxXSE/++gbI3jYBAVN
 d7bIcQywVOJBELPvknP1lO8U9XJGwWZhSwLc9NW1XG+Q88ySO2zp+vz
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Sun, 21 Sep 2025 03:25:59 +0000 (UTC)
X-CM-Envelope: MS4xfIhUW+CZrxQCKUwojBDvKpV4+Dh9Jy8vIrTeAqeb/7vhjMfkJrsVGV9H2vcZ2TnaKQBmocanL3TPJA+XFn+S+N8VFqDAWPityR8K3mlkBV26/q1PqN7P Yzd+EDqv0VE4NTmFQBq8ZAOe77QV2FSEDbYUDm9wtBzbx8bojzb0UT+rAuS4jjQQ2OKrzgEly+ciFShZuiMKoyXs9hj2yDECS741NJc55T5PJpok24B5oUI0 0xqdYImjU3qDW6J1bXVHymqM05SJwNmQLAc0DQLEQes4peLRM5xR6UzdtjX6kzUj/rWhUmWAaPQ0tKdHQhdOrIWMOFP8/h4x9Jcp/Ayobf28c+inGXYMxu5P y2B3vaERfMssPGq7ZxErRhOWIxzDjUePmSI/OFvu4K7QEH30C+RTzfWck+YYF2rBVf2dMzhxDBh1V9K1RG/686t7BkyDhXSwx9s4NJuKiY4axjLOHIgyZerc JE9QRtYjM5R3kRqgJceGZqfXJZ7R54xw/oOQT+D9U6Xkye5fFRn1odd/7rUiQWyGLmJiLPm1AA4tqamoNMP8mrivX4zRdIp3jk0V6wURYKgsHz9UGIirlBjZ yxP1T6QTDnEyB1J8O6Xo0VzFHNGZJtMxWawx8Pb4LWGVVQRcgbvB36OEcXvwcOLKVOJCiLrP3GQ8ASKeV4J0n0YX
X-CM-Analysis: v=2.4 cv=DJTd4DNb c=1 sm=1 tr=0 ts=68cf704a a=hVqNbC/oQIbyndLMfyRB3g==:117 a=hVqNbC/oQIbyndLMfyRB3g==:17 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=wxLWbCv9AAAA:8 a=pGLkceISAAAA:8 a=2Hlz1Ra-QEqM0uTCcOsA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-AuthUser: linux@smankusors.com

Rename the GPIO controller node from "msmgpio" to "tlmm" to match the
convention used by other Qualcomm SoCs.

Suggested-by: Shinjo Park <peremen@gmail.com>
Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
This patch was originally part of msm8960 cleanup series [1], but as
Bjorn pointed out, dt-bindings live in a different subsystem and should
be submitted independently.

[1] https://lore.kernel.org/all/20250915-msm8960-reorder-v1-5-84cadcd7c6e3@smankusors.com/
---
 Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pinctrl.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pinctrl.yaml
index 46618740bd312b975321427e5ffa34811c68e652..03a3692770142048391577401869cea9a7735053 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pinctrl.yaml
@@ -107,12 +107,12 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
-    msmgpio: pinctrl@800000 {
+    tlmm: pinctrl@800000 {
         compatible = "qcom,msm8960-pinctrl";
         reg = <0x800000 0x4000>;
         #gpio-cells = <2>;
         gpio-controller;
-        gpio-ranges = <&msmgpio 0 0 152>;
+        gpio-ranges = <&tlmm 0 0 152>;
         interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
         interrupt-controller;
         #interrupt-cells = <2>;

---
base-commit: 846bd2225ec3cfa8be046655e02b9457ed41973e
change-id: 20250921-msm8960-sdcard-dtbindings-ad8d3d511e6c

Best regards,
--
Antony Kurniawan Soemardi <linux@smankusors.com>


