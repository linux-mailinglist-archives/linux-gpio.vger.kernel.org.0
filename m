Return-Path: <linux-gpio+bounces-35296-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DwHA0tH52mw6AEAu9opvQ
	(envelope-from <linux-gpio+bounces-35296-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 11:45:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 25286439048
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 11:45:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 650F53010218
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 09:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF3A03B0AD6;
	Tue, 21 Apr 2026 09:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eY/JHEyu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D863AE6FD;
	Tue, 21 Apr 2026 09:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776764713; cv=none; b=kOr/XDdhRpDpukC16vTDMo7wHzoGPyCFtRruNNb67LGnF6/a/OA2rcq38wRQ5uXKYPqpslR0mMu+3WJ6ycaIopcPJPSso1g55mhP9+7GpHxPZMfGIfeUdshgD4LfKZl0qTTfE8pTaZ4e5seNVUvksnLaIg3elBgnM5U8NWwgjgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776764713; c=relaxed/simple;
	bh=CHhHEb5sgQt9z+DgNHdyFkJRxxQ8BX3aIo7SXeKph/w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tSdRIYLzFlpvLL+8bREum9Z9CbNHtaAQ5VU3/sfkfExJNeWlQ9BfmyqHWR5hU1XA8Ft6HP8H3P+7Q5xtaVvHuywwFbGh7i8TveE+7edvTzWMZv/t8uRpVds+G7RWolUxsOBx2cmkNR+4vJ1PT0qT8Y00W0hyHNRAa7qBnpcqNco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eY/JHEyu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F256CC2BCB5;
	Tue, 21 Apr 2026 09:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776764713;
	bh=CHhHEb5sgQt9z+DgNHdyFkJRxxQ8BX3aIo7SXeKph/w=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=eY/JHEyu1Y0/NaBk5nBLOhd71CVVRGZl5J0kW0jqC4HdmTxv9I/SW15VQgRQmC7mM
	 /FjjIjZk4qqs3ZM4hRSpscyka9yOtHeYnxZdbHWNi1WjPJOiKPErRD5xwHPcA1aVr/
	 YLJ18GEGtCKaYwdneM4pYugayerJLODVC22cRZSed0GB6su98zqNTX4SoAuWM1AM0l
	 yYtCc6wcbP8dimKOjFmtiIuSsa5Mt0xA5ih5IScRDyEMHzTRF7OKZu0TELhonlAD6t
	 9rG9p0Zt5V6zAsC23B/DVXOMPHXewLi3KZckPmdo03QRXumfng49GsjM0N+Ceth/l4
	 WDUEP1wA4nhPQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DED9BF327CE;
	Tue, 21 Apr 2026 09:45:12 +0000 (UTC)
From: Alexandre MINETTE via B4 Relay <devnull+contact.alex-min.fr@kernel.org>
Subject: [PATCH 0/8] Add Samsung Galaxy S4 support
Date: Tue, 21 Apr 2026 11:45:06 +0200
Message-Id: <20260421-mainline-send-v1-sending-v1-0-bcb0857724de@alex-min.fr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACJH52kC/x2MwQqAIBAFfyX23EJKhPUr0SH0ZQu1hUIE0b8nn
 YY5zDyUkQSZhuqhhEuyHFrE1BX5ddYIllCcbGO7prWG91l0EwVnaODL/BSNbF0P3zt0wRsq+Zm
 wyP2vx+l9P3sOLCFqAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Linus Walleij <linusw@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 iommu@lists.linux.dev, Alexandre MINETTE <contact@alex-min.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776764711; l=1782;
 i=contact@alex-min.fr; s=20260421; h=from:subject:message-id;
 bh=CHhHEb5sgQt9z+DgNHdyFkJRxxQ8BX3aIo7SXeKph/w=;
 b=iLRPlGSXT3LnuC/vB7tE1btiUBFHxZZnZ+LvfrLycTACCo+OS6a2vvYLdkKQsuG9cOyMxs5+b
 F6NC3gyqJaLCMRltTFLGAw+y/MvfM6X1fnMaIY3YEcAFP7MejT00bI2
X-Developer-Key: i=contact@alex-min.fr; a=ed25519;
 pk=KOCaxY4v16ptaT0uk1FRkuaDF2n1JhmnYwLiqWD76M4=
X-Endpoint-Received: by B4 Relay for contact@alex-min.fr/20260421 with
 auth_id=743
X-Original-From: Alexandre MINETTE <contact@alex-min.fr>
Reply-To: contact@alex-min.fr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35296-lists,linux-gpio=lfdr.de,contact.alex-min.fr];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[contact@alex-min.fr];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,alex-min.fr:email,alex-min.fr:replyto,alex-min.fr:mid]
X-Rspamd-Queue-Id: 25286439048
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add initial mainline support for the Samsung Galaxy S4, codenamed jflte.

This series adds the devicetree binding and board DTS, together with the
small driver and common DTS changes needed to boot the device with working
USB peripheral mode.

Tested on a Samsung Galaxy S4 GT-I9505. With this series the device boots
and supports UART, USB peripheral mode with USB networking, the front
notification LED and the physical buttons.

Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
---
Alexandre MINETTE (8):
      dt-bindings: arm: qcom: Add Samsung Galaxy S4
      dt-bindings: extcon: qcom,pm8941-misc: Add PM8921 compatible
      pinctrl: qcom: Register functions before enabling pinctrl
      iommu/msm: Look up masters per IOMMU instance
      extcon: qcom-spmi-misc: Add PM8921 compatible
      ARM: dts: qcom: apq8064: Fix USB controller clocks
      ARM: dts: qcom: pm8921: Add USB ID extcon
      ARM: dts: qcom: Add Samsung Galaxy S4

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 .../bindings/extcon/qcom,pm8941-misc.yaml          |  17 +-
 arch/arm/boot/dts/qcom/Makefile                    |   1 +
 arch/arm/boot/dts/qcom/pm8921.dtsi                 |   7 +
 .../boot/dts/qcom/qcom-apq8064-samsung-jflte.dts   | 484 +++++++++++++++++++++
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi           |  18 +-
 drivers/extcon/extcon-qcom-spmi-misc.c             |   1 +
 drivers/iommu/msm_iommu.c                          |  28 +-
 drivers/pinctrl/qcom/pinctrl-msm.c                 |  15 +-
 9 files changed, 545 insertions(+), 27 deletions(-)
---
base-commit: b4e07588e743c989499ca24d49e752c074924a9a
change-id: 20260421-mainline-send-v1-sending-289ec98e6dc1

Best regards,
-- 
Alexandre MINETTE <contact@alex-min.fr>



