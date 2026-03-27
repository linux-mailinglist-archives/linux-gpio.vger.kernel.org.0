Return-Path: <linux-gpio+bounces-34289-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJigNDy/xmnoNwUAu9opvQ
	(envelope-from <linux-gpio+bounces-34289-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 18:32:44 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6694E348631
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 18:32:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA50630E566A
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 17:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86F0B3EF0D4;
	Fri, 27 Mar 2026 17:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ha7FqDDP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3745B3ACF09;
	Fri, 27 Mar 2026 17:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774632329; cv=none; b=O3yCUVqDaZSEoTBYRiMErK+dVJco8OfrKLUusLb4aKe0D8dwCLXqLLYDhrRv6ll1VVguKn9FKJuNRZS7qbPt4Nvxs7j3ZfE/5l0gVVqkHxoG/c+hJkTv0qA0EYauD9JobFkZ7SBwKmIocgbcRDOlKNlWddNOaokoP/GuBgqjZrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774632329; c=relaxed/simple;
	bh=wP07MCoE5Leq1WsPpP2sxNPCLJfyGnjf5lGaQDv3kmA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JrV6wwTQK4+Mlvpd4Youxa3DDEekFgT0rspuBJRM3foKC6XNjZPC620AfLglR27AbZ9rcK3KwIFtCt/qUsV3jhOdxdmyL+kKoofyMI3A3qT8kYcyBXhTY0sJ9ncQuBIN/QNElMF8ZRLdh3QKi0u9qG0NJIc7WJVpj7bKbQl/9wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ha7FqDDP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E54DEC2BC9E;
	Fri, 27 Mar 2026 17:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774632328;
	bh=wP07MCoE5Leq1WsPpP2sxNPCLJfyGnjf5lGaQDv3kmA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ha7FqDDPj+KPmbP+v7G123+vo7+WvX9ANZyyF5C0KVphR4K3Cnl9hvR9nJjyuIftD
	 tDeqhULszj6oz9xwv7ppURiCvBmG39I+V8gyeAEGlqPk2afYULVTYiTU519sHxhRzs
	 /p4BLqpWOUrkbPgySfg5KNIxRluDZcyuI80vKfosc+UzEg/fqiB0K0sHTp+71w/jfZ
	 /Peukliwt4EfBeuK9S/Qz6I9/+aXFNA7O4SToStON+3apRSN6KuJ4Yl2bP2+V8QZxA
	 EGFQV4NchzTkKfYZhVBG9cKXedBORFvtP+zPkK+9+z61a1KJqWP23tohpetzE/jaTU
	 7FUfoEZwhn/8Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D84F010F2858;
	Fri, 27 Mar 2026 17:25:28 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Subject: [PATCH v8 0/3] hwmon: Add support for the LTC4283 Hot Swap
 Controller
Date: Fri, 27 Mar 2026 17:26:13 +0000
Message-Id: <20260327-ltc4283-support-v8-0-471de255d728@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQrDIBQFrxL+uhajiZWuco+ShZhvIqQqaqUle
 Pfa7LucgTfvgITRYoJ7d0DEYpP1roG8dKA35VYkdmkMjDJBOeVkz3pgkpP0CsHHTKjg5iaV1qM
 aoK1CRGPfZ/ExN95syj5+zoMifvZ/qwhCCRrs+5EyoxY2Kad2v161f8Jca/0Cl+nMMK8AAAA=
X-Change-ID: 20260303-ltc4283-support-063f78acc5a4
To: linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774632374; l=1827;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=wP07MCoE5Leq1WsPpP2sxNPCLJfyGnjf5lGaQDv3kmA=;
 b=Q1nzDECbjvmzhD8F/jUVZDSHmwCeuMks6JUDapVMLTH1OJdSFYj0xw0RWt7NjcddbfLZLYTLC
 z3ckPOWC3R5Dx2e+2VcYWI5rpJsi1TA5mN2Zxo8QZT6bzRi/ViLZnBL
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34289-lists,linux-gpio=lfdr.de,nuno.sa.analog.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[nuno.sa@analog.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:replyto,analog.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6694E348631
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is v8 for the LTC4283 how swap controller. 

Similar to the LTC4282 device, we're clearing some fault logs in the
reset_history attributes.

---
Changes in v8:
- Patch 1:
   * Improved descriptin in adi,fet-turn-off-disable so it's more clear;
   * Same for adi,dvdt-inrush-control-disable;
   * Fixed typo in adi,external-fault-retry-enable description.
- Patch 2:
   * Use return value from clamp_val();
   * Add missing 'ret < 0' for device_property_match_property_string()
     calls;
   * Fixed logic in when adi,vpower-drns-enable is enabled;
   * Check default state of the pgio4 pin. So that we can, accordingly
     flag st->ext_fault.
- Link to v7: https://lore.kernel.org/linux-hwmon/20260314-ltc4283-support-v7-0-1cda48e93802@analog.com/ 
---

---
Nuno Sá (3):
      dt-bindings: hwmon: Document the LTC4283 Swap Controller
      hwmon: ltc4283: Add support for the LTC4283 Swap Controller
      gpio: gpio-ltc4283: Add support for the LTC4283 Swap Controller

 .../devicetree/bindings/hwmon/adi,ltc4283.yaml     |  272 +++
 Documentation/hwmon/index.rst                      |    1 +
 Documentation/hwmon/ltc4283.rst                    |  266 +++
 MAINTAINERS                                        |    9 +
 drivers/gpio/Kconfig                               |   15 +
 drivers/gpio/Makefile                              |    1 +
 drivers/gpio/gpio-ltc4283.c                        |  218 +++
 drivers/hwmon/Kconfig                              |   12 +
 drivers/hwmon/Makefile                             |    1 +
 drivers/hwmon/ltc4283.c                            | 1796 ++++++++++++++++++++
 10 files changed, 2591 insertions(+)
---
base-commit: cd041796c380961f0e3c04d9627af80131608adc
change-id: 20260303-ltc4283-support-063f78acc5a4
--

Thanks!
- Nuno Sá



