Return-Path: <linux-gpio+bounces-38157-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IJ0bGxPNJ2ru2QIAu9opvQ
	(envelope-from <linux-gpio+bounces-38157-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 10:21:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F2065DB46
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 10:21:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=lvMAUU8c;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38157-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38157-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A88363059FFD
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 08:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2627E3EDE4D;
	Tue,  9 Jun 2026 08:13:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5A13EAC74;
	Tue,  9 Jun 2026 08:13:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780992836; cv=none; b=PE06g65EHVCUG9P15RUATqRNomX7jH1j7EVkvN8XlYc9qOiaszfiw5yfmbVjWHTj7BFJEihWlkzNh9AZ9MVav3Y44v0lQmlr2p2moKjk2jcBcbGLjMQgg2wGECZwmjRqI9CeOu/D+/mYwXc71Hi6UMUZeg5o+Ul3nhmRBjl3EDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780992836; c=relaxed/simple;
	bh=gHH888DMfaKgGEuNMxRFwJFh5FsrPvr3DTEjnPXl5/o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SVc9gOcPNLcKmITHr+G4+tZrMKF6Pj8J9oJYDS4PjwreeO/jbaVb7cj6rAiw/ZgAsiqBWuCpHAB/dIN+90Pz8OFeYPgIbU8h8zYglgtJ57HS0MzYz383yZZ3Y6qH8mHKtWYjT0prc3CsdI2IY11yUFZjhAEt8bgXw5aWxpvGYOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lvMAUU8c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2CFBAC2BCB9;
	Tue,  9 Jun 2026 08:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780992836;
	bh=gHH888DMfaKgGEuNMxRFwJFh5FsrPvr3DTEjnPXl5/o=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=lvMAUU8caQ4BA7m5rSW4BGy4m4lpinVT6KJi0JVIFsld/gpl4XD0mGj0PMXWcIA5q
	 mqL1W2kAyZuQMdw4cGmKqjrh2wjBskpngxtig61cJf0j3T++mbafyzl05zF1zA65gn
	 phfh3qTKD6IBizzRwQunqAgogaor50Js9rzPLJJx9GCqL6ioPbwEz+9DjlajzT4oGg
	 w2JynUDzxvlFiQBInIIYhJCw6xJyWPKTDhI/ReCOa0e+p1NmY43TNROwUGL3LL1O/L
	 FpUmmXo4DOFfnB4SabNs/NFA65CtlbfpvlJ50xWtCTeX4zAfqNQl0IRw12d9yGGbll
	 hvXPjTS+zp+tQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FC57CD8CA4;
	Tue,  9 Jun 2026 08:13:56 +0000 (UTC)
From: Alexandre MINETTE via B4 Relay <devnull+contact.alex-min.fr@kernel.org>
Subject: [PATCH v4 0/6] Add Samsung Galaxy S4 support
Date: Tue, 09 Jun 2026 10:13:43 +0200
Message-Id: <20260609-mainline-send-v1-sending-v4-0-83768fbf404d@alex-min.fr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADfLJ2oC/43NTQ6CMBAF4KuQrq3pD1Bw5T2Mi9IOMAkU05oGQ
 7i7hY0aE+Nq5r1kvllIAI8QyClbiIeIASeXQn7IiOm164CiTZkIJkqWC05HjW5ABzSAszTyfaL
 rqKhqMHUFpTWcpPObhxbnnb5cU+4x3Cf/2D9FvrV/oGlltDENqwqlRG7hrAeY6Yju2HqysVG8U
 +oHJRJljdY1VxVjqvmm5IsqeP2DkomS1iqtuShkIT+pdV2fLHdgnFgBAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Linus Walleij <linusw@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 phone-devel@vger.kernel.org, Alexandre MINETTE <contact@alex-min.fr>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Antony Kurniawan Soemardi <linux@smankusors.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780992834; l=3812;
 i=contact@alex-min.fr; s=20260421; h=from:subject:message-id;
 bh=gHH888DMfaKgGEuNMxRFwJFh5FsrPvr3DTEjnPXl5/o=;
 b=4Wuli+y9wsnk9cFGe66d7AhtuKCs4arD7VZTWNiZIdvihpdK+xhWlMQUUbidRm1Q+eQLBcYDP
 MDu2yUq1gJLDZy4RV0dJf0/Ai0wDvHucmc5Jeoyq879iQyi45yoXMnT
X-Developer-Key: i=contact@alex-min.fr; a=ed25519;
 pk=KOCaxY4v16ptaT0uk1FRkuaDF2n1JhmnYwLiqWD76M4=
X-Endpoint-Received: by B4 Relay for contact@alex-min.fr/20260421 with
 auth_id=743
X-Original-From: Alexandre MINETTE <contact@alex-min.fr>
Reply-To: contact@alex-min.fr
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38157-lists,linux-gpio=lfdr.de,contact.alex-min.fr];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:myungjoo.ham@samsung.com,m:cw00.choi@samsung.com,m:linux@gurudas.dev,m:linusw@kernel.org,m:robin.clark@oss.qualcomm.com,m:kees@kernel.org,m:tony.luck@intel.com,m:gpiccoli@igalia.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:phone-devel@vger.kernel.org,m:contact@alex-min.fr,m:krzysztof.kozlowski@oss.qualcomm.com,m:linux@smankusors.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[contact@alex-min.fr]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D7F2065DB46

Add initial mainline support for the Samsung Galaxy S4, codenamed jflte.

This series adds the devicetree binding and board DTS, together with the
small driver and common DTS changes needed to boot the device with working
USB peripheral mode.

Tested on a Samsung Galaxy S4 GT-I9505. This series adds support for
UART, USB peripheral mode with USB networking, the front notification
LED and the physical buttons.

Booting the device also requires an MSM IOMMU master handling fix,
which will be submitted separately.

Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
---
Changes in v4:
- Rework PM8921 USB ID support by registering the extcon device from the
  parent PMIC driver instead of describing a separate DT child node.
- Add GPIO_OPEN_DRAIN flag to i2c-gpio
- Drop the Reviewed-by tag from the Galaxy S4 DTS patch because its USB
  extcon description changed.
- Drop the MSM IOMMU master lookup fix from this series. It needs a
  broader rework and will be sent separately.
- jflte still needs that follow-up MSM IOMMU fix to boot.
- Link to v3: https://lore.kernel.org/r/20260519-mainline-send-v1-sending-v3-0-3dd7aa125353@alex-min.fr

Changes in v3:
- Clarify that the Galaxy S4 compatible is for the Qualcomm
  APQ8064-based variant, and add Krzysztof's Acked-by.
- Clarify the PM8921 USB ID binding, driver and DTS commit messages to
  describe the PMIC interrupt-controller interface and the lack of a
  known register resource for this interrupt-only path.
- Keep the PM8921 USB ID extcon node non-addressable rather than adding a
  speculative reg value.
- Keep the MUIC and LED buses as i2c-gpio. Testing the corresponding
  GSBI controllers on GT-I9505 made USB fail to enumerate with the MUIC
  on GSBI2, and made LED brightness writes time out with the LED on
  GSBI3.
- Reorder APQ8064 USB clock entries to match the related ci-hdrc binding
  update, using iface, core, fs order.
- Sort the jflte DTB Makefile entry after the LG Nexus 4 entry.
- Link to v2: https://lore.kernel.org/r/20260427-mainline-send-v1-sending-v2-0-dcaa9178007b@alex-min.fr

Changes in v2:
- Keep the APQ8064 compatible list in qcom.yaml alphabetically sorted.
- Clarify the Qualcomm pinctrl commit message and include the failing hog
  lookup trace seen on APQ8064.
- Clarify the MSM IOMMU commit message and include the NULL dereference
  trace seen during IOMMU probe on APQ8064.
- Move the PM8921 USB ID extcon node to the end of the PM8921 child nodes.
- Reorder the jflte DTS nodes and pinctrl properties as requested by
  reviewers.
- Add Reviewed-by/Acked-by tags collected on v1.
- Link to v1: https://lore.kernel.org/r/20260421-mainline-send-v1-sending-v1-0-bcb0857724de@alex-min.fr

---
Alexandre MINETTE (6):
      dt-bindings: arm: qcom: Add Samsung Galaxy S4
      pinctrl: qcom: Register functions before enabling pinctrl
      ARM: dts: qcom: apq8064: Fix USB controller clocks
      mfd: qcom-pm8xxx: register PM8921 USB ID extcon
      extcon: qcom-spmi-misc: match PM8xxx USB ID platform device
      ARM: dts: qcom: Add Samsung Galaxy S4

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm/boot/dts/qcom/Makefile                    |   1 +
 .../boot/dts/qcom/qcom-apq8064-samsung-jflte.dts   | 481 +++++++++++++++++++++
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi           |  18 +-
 drivers/extcon/extcon-qcom-spmi-misc.c             |   7 +
 drivers/mfd/qcom-pm8xxx.c                          |  78 +++-
 drivers/pinctrl/qcom/pinctrl-msm.c                 |  15 +-
 7 files changed, 588 insertions(+), 13 deletions(-)
---
base-commit: 4bf3800382b91c2898d14452cf4332782b3fe80a
change-id: 20260421-mainline-send-v1-sending-289ec98e6dc1

Best regards,
-- 
Alexandre MINETTE <contact@alex-min.fr>



