Return-Path: <linux-gpio+bounces-38211-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XK76N2L2KGr+OAMAu9opvQ
	(envelope-from <linux-gpio+bounces-38211-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 07:30:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E53665F2E
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 07:30:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=CfxDgH1x;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38211-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38211-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6324D305B5B6
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 05:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7251372063;
	Wed, 10 Jun 2026 05:29:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6200923393E;
	Wed, 10 Jun 2026 05:29:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781069398; cv=none; b=WZkdE3CuNRwLuqyMHfqiNvpoIernru0P41PgSroKvKKJjtM5ELoG4GqeII+pNDkr5750jgvSMgXciAyYFIG/n9GJQprw5IQ9EdWvq3D070yzQl8THpxjNWajvbPOiVU4W2OMiEBXQZU+bF0UCEssQ0ICSTfwpfI4GX4XthTzTOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781069398; c=relaxed/simple;
	bh=apdwZ7rou12zXbDIPX+MxhDBa1i7yNhr4u5YXE2irHU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UtBJ2ZLY8WfzYSMVnWFRRjSMCG8b4C0jHuxMHUE0f6hFFZwDjliQiZgNGFm8U6glogCEciD40ne42QX1eFuewlVykoYre+M9NdtIT6W4sK/Pee7+h9HKVF3pwP86XWNKq0f24J+lH3M5ViivZs3vRglwHHg6PSgE4tUfDAptrxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CfxDgH1x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0C274C2BCB8;
	Wed, 10 Jun 2026 05:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781069398;
	bh=apdwZ7rou12zXbDIPX+MxhDBa1i7yNhr4u5YXE2irHU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=CfxDgH1x6hi60UGkFvYaFurvhOlYjhgYwlPWo53VwlBLgO3q8d4DZteh7pjI4MQMg
	 WQWykqo0DhQTjAc4lZ63cY+GfDSrYPBOOF5rLAUB0PzzstO+DdSued21F4CIGeoT3y
	 79sdNdJChnlOB1ikya6lCyXvlowXWR+eB3gwzSTxV2wKQn7dbINNTibrtnN2er2aSJ
	 rqJYFmtGiT5u0BnFyYCznHIsMvUl1g/RZUjhDZv4zFlxYROWv/DuYWS5wNNNq1OSMY
	 BC+Z5UMfwGX6IHD5QcuGgZBsGhZSa11hhDpi4y085BOCJ5Tlh7jzIo6esqhaBz9G0i
	 cMyiIAOEsIqtw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F9FCD8CB2;
	Wed, 10 Jun 2026 05:29:57 +0000 (UTC)
From: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>
Subject: [PATCH v4 0/2] pinctrl: ultrarisc: add DP1000 pinctrl support
Date: Wed, 10 Jun 2026 13:29:54 +0800
Message-Id: <20260610-ultrarisc-pinctrl-v4-0-b7e9b2a8ed84@ultrarisc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFL2KGoC/23NSw6CMBgE4KuQrq3pG3DlPYyLUn6kBoG0QDSEu
 9tCosawnGTmmxl5cBY8OiUzcjBZb7s2BHFIkKl1ewNsy5ARI0wRThUem8FpZ73BvW3N4BoMlVb
 AhBEZ4SjsegeVfa7m5bplPxZ3MEOEYqO2fujcaz2daOxtvqRyx58oJriopMxlloPO9PnTOZrug
 eLHxL6KInRPYUEhqTaScqJzVe4p/FfJ9hQelLAnOZSpYKn8V5ZleQPNn8BFVAEAAA==
X-Change-ID: 20260316-ultrarisc-pinctrl-efa6e24c4803
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jia Wang <wangjia@ultrarisc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781069395; l=3342;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=apdwZ7rou12zXbDIPX+MxhDBa1i7yNhr4u5YXE2irHU=;
 b=u8fdlGbzSH3DKWPq1UBQO53LJssEw+Pff8FDcAyaV86JMk+oELpmcxZd25salpVyWdojlGe4q
 Q/IWv2s7cQlCrCP9TD32es4nRRQkRBtqqVWkIEuk70gHQBlF+6zwpMK
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-Endpoint-Received: by B4 Relay for wangjia@ultrarisc.com/20260515 with
 auth_id=779
X-Original-From: Jia Wang <wangjia@ultrarisc.com>
Reply-To: wangjia@ultrarisc.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38211-lists,linux-gpio=lfdr.de,wangjia.ultrarisc.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:wangjia@ultrarisc.com,m:conor.dooley@microchip.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[wangjia@ultrarisc.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ultrarisc.com:replyto,ultrarisc.com:email,ultrarisc.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 80E53665F2E

This series adds the devicetree schema and the pinctrl driver for the
DP1000 controller using generic pinctrl bindings.

Compared with v1, this series is narrowed down to the pinctrl binding
and driver only. v1 patches 1, 2, 3, 5, 7, 8, and 9 (vendor prefix,
CPU/SoC bindings, DTS files, and defconfig update) are not included in
v2 and will be sent separately.

Note:
- ARCH_ULTRARISC support is being reviewed separately:
  * Link: https://lore.kernel.org/lkml/20260427-ultrarisc-pcie-v4-1-98935f6cdfb5@ultrarisc.com/

Testing:
- dt_binding_check and yamllint
- Kernel build for RISC-V and boot-tested on DP1000 (Milk-V Titan and
  Rongda M0)

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
Changes in v4:
- Drop the public DT binding header and document the numeric pin IDs
  directly in the binding schema and examples.
- Drop the unnecessary GPIOLIB select from the pinctrl Kconfig.
- Replace the open-coded raw_spin_lock_irqsave()/unlock_irqrestore()
  pairs with scoped guards.
- Add comments for ur_find_group_route().
- Remove the CONFIG_GENERIC_PINCONF ifdef around the generic pinconf
  ops fields.
- Link to v3: https://patch.msgid.link/20260608-ultrarisc-pinctrl-v3-0-30a09ed74275@ultrarisc.com

Changes in v3:
- Re-add the DT binding header and use numeric pin IDs in the binding.
- Replace instance-specific mux names with generic function names.
- Tighten the schema constraints for A-D and LPC pins.
- Switch the driver to pinctrl_generic_pins_function_dt_node_to_map()
  and resolve mux routes from the pins + function combination.
- Link to v2: https://patch.msgid.link/20260601-ultrarisc-pinctrl-v2-0-07ac5130a96d@ultrarisc.com

Changes in v2:
- Split the vendor prefix, CPU binding, SoC binding, DTS, and defconfig
  patches out of this series for separate submission.
- Drop the legacy DT node format from both the binding and the driver,
  and switch to the generic pinctrl interface with
  pinconf_generic_dt_node_to_map_all().
- Drop the DT binding header from the series.
- Replace the generic func0/func1 mux names with named hardware functions
  in the binding and driver.
- Wire the driver through CONFIG_PINCTRL_ULTRARISC and add COMPILE_TEST
  coverage.
- Restrict function selection to valid pins in the driver.
- Link to v1: https://patch.msgid.link/20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com

---
Jia Wang (2):
      dt-bindings: pinctrl: Add UltraRISC DP1000 pinctrl controller
      pinctrl: ultrarisc: Add UltraRISC DP1000 pinctrl driver

 .../bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml | 130 ++++++
 MAINTAINERS                                        |   7 +
 drivers/pinctrl/Kconfig                            |   1 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/ultrarisc/Kconfig                  |  20 +
 drivers/pinctrl/ultrarisc/Makefile                 |   4 +
 drivers/pinctrl/ultrarisc/pinctrl-dp1000.c         | 168 +++++++
 drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.c      | 517 +++++++++++++++++++++
 drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.h      |  63 +++
 9 files changed, 911 insertions(+)
---
base-commit: 2d3090a8aeb596a26935db0955d46c9a5db5c6ce
change-id: 20260316-ultrarisc-pinctrl-efa6e24c4803

Best regards,
--  
Jia Wang <wangjia@ultrarisc.com>



