Return-Path: <linux-gpio+bounces-37757-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EIeMrZcHWoBZwkAu9opvQ
	(envelope-from <linux-gpio+bounces-37757-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 12:19:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3B661D36F
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 12:19:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 75748306DAC9
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jun 2026 10:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F1533AD50D;
	Mon,  1 Jun 2026 09:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cgPDe/Ai"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7DB3AB285;
	Mon,  1 Jun 2026 09:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780307881; cv=none; b=VCKjd5bvry2+nk6PKG/E8cLYSiG/BMswCS6zomsPmm3LzlQVgbRHmdvPZB7TApEU9UEH1I0Y6yfEuLC6O5TNR98gjsZBQK6DFUqOtPH/M2AuMIowUooLj2lB2jbgVWKS/+icnvlS1z7wwX7/+BdkjTwoEcPejWXIxUuJxBmtxbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780307881; c=relaxed/simple;
	bh=hkgpBJSIHKNGSIEikYqYj8bRV0TVmrPLDgPOcxUfc/w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XPbx8Udsxi5ZoLtYm5TZ2KoHn/pcr8jYvjxMAyrdP2Lm+8NvTePUV8uv3q7WMImfjE+nYbcrCnFbSucz3fu9jirtn194vyoPsAiUwH1Yyr39UHM+J8b8ech5q0iibRlKsyon84LlNGTsrpmJsB2zbnG1F9Jl4DjKSJeZXuxApdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cgPDe/Ai; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7067C2BCB8;
	Mon,  1 Jun 2026 09:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780307881;
	bh=hkgpBJSIHKNGSIEikYqYj8bRV0TVmrPLDgPOcxUfc/w=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=cgPDe/AiIGpO0RyoV4yjSUTuih0ikq495osgh5dBb5of+opY8YKNJiUNFp6Ze5lUy
	 ZuH2mVIbB1z993NMG/mF2M9atTxhnW/MBj+YgdBF2SuPbdg1FhSHqeUDTgELtI5B1T
	 ASzumQs3jRSaMAdwY+qJKWSThiIa13JixT84RNgJB7rnWhHgEoGFkbCOAtTgbCaK2E
	 UfNHuElXTXtHMUDzH6qQKb08p1ga8ZG1S6xo33xhIWKcnOidtg4mWYbZtSVcafkpsC
	 95Oxkfx5Cs2I+9/5NGmFrh/Yy3LNTWOAUOsCev3EhllQF43octBSoFl/QXAPsPMwKr
	 ljoKroqOKXpww==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C68CD6E60;
	Mon,  1 Jun 2026 09:58:00 +0000 (UTC)
From: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>
Subject: [PATCH v2 0/2] pinctrl: ultrarisc: add DP1000 pinctrl support
Date: Mon, 01 Jun 2026 17:56:33 +0800
Message-Id: <20260601-ultrarisc-pinctrl-v2-0-07ac5130a96d@ultrarisc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFFXHWoC/22Nyw6CMBBFf4XM2pq2UAKu/A/DotRBxiAl00I0h
 H+XR+LK5UnOPXeGgEwY4JLMwDhRIN+voE8JuNb2DxR0Xxm01LlMVS7GLrJlCk4M1LvIncDG5qg
 zlxUyhXU3MDb03pu36uAw1k90cQttRkshev7sp5PavKNvlPnTn5SQom6MKU1Roi3s9eecnX9Bt
 SzLF1nU8q/IAAAA
X-Change-ID: 20260316-ultrarisc-pinctrl-efa6e24c4803
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jia Wang <wangjia@ultrarisc.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780307879; l=2368;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=hkgpBJSIHKNGSIEikYqYj8bRV0TVmrPLDgPOcxUfc/w=;
 b=yBWGJok3ZJ5o3DScBUQWjrlXh1EhvD0+o+laasVRSKCNTjuBVqfpF/FzZ8A2B17tTyzltqFO6
 wwFZlB346vaA+XoIqHEW+MPxZajML108XGgr+YAlHgmH4xpnnM2s48I
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-Endpoint-Received: by B4 Relay for wangjia@ultrarisc.com/20260515 with
 auth_id=779
X-Original-From: Jia Wang <wangjia@ultrarisc.com>
Reply-To: wangjia@ultrarisc.com
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37757-lists,linux-gpio=lfdr.de,wangjia.ultrarisc.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	HAS_REPLYTO(0.00)[wangjia@ultrarisc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,msgid.link:url]
X-Rspamd-Queue-Id: 3F3B661D36F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

 .../bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml | 128 ++++++
 MAINTAINERS                                        |   7 +
 drivers/pinctrl/Kconfig                            |   1 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/ultrarisc/Kconfig                  |  23 +
 drivers/pinctrl/ultrarisc/Makefile                 |   4 +
 drivers/pinctrl/ultrarisc/pinctrl-dp1000.c         | 172 +++++++
 drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.c      | 496 +++++++++++++++++++++
 drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.h      |  75 ++++
 9 files changed, 907 insertions(+)
---
base-commit: 8fde5d1d47f69db6082dfa34500c27f8485389a5
change-id: 20260316-ultrarisc-pinctrl-efa6e24c4803

Best regards,
--  
Jia Wang <wangjia@ultrarisc.com>



