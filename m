Return-Path: <linux-gpio+bounces-33430-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HYsJbU9tWlEyAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33430-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 11:51:33 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2891328CC86
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 11:51:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4CB53046EAF
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 10:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 449703542F6;
	Sat, 14 Mar 2026 10:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YQNGlDe3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CBD1BBBE5;
	Sat, 14 Mar 2026 10:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773485476; cv=none; b=bWFMBLlZnI14pxho+QQAp3wHo6y/fN9Wd4qSVzKEcRAxhz3D1spStn1cEZWAQCNeX7QePZJ3SKEJvhlA+p64L+0PMmRkEXyKfqLICFEXWt3kpTQOUUb3My52Q593V1/LZgtdF3kSBmgkDM4n+TwxPOCc1BB+/+D7gEghiyuYye4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773485476; c=relaxed/simple;
	bh=4Sq3DEK8G8zCXWtDdEnlAx8YFVSgsv/JQaaNI9zSiWw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Gcb60ps7NGTMTx5Z21GpI7iSZiktnfpgQ1vv5g2mxZFlP+Biwai9uRaEXYFqLDXVIfvIj6maF/RxXJsSCY7OPoR/D7TxpmVtuUg7QkZru354ZJTh2AFSzLFx8KN4IioCHwj8T3J5ScfiSgMRjeSGb7wzHHEsgp1Ee/X6q/DjJZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YQNGlDe3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80852C116C6;
	Sat, 14 Mar 2026 10:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773485475;
	bh=4Sq3DEK8G8zCXWtDdEnlAx8YFVSgsv/JQaaNI9zSiWw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=YQNGlDe3JMT4XCMGyOAnhOC1pgyp4ad9Te60T5oa8z0buUE3d52LKZQU8fisF4hC8
	 FFNRn5CDkYjB+VjJKmWhRM/dW9A0stme+YZ+5fJ9xgwFRpQceNBqRxbMYOUJ/I9xJ7
	 bm830cgBdx5G02X4MahRnkRVr74a/WNhUstIfkeO8OZ//7QByid6IBkS7LwupjPJkR
	 gnNOqq+lro6q49qIukIJWYdm5LdOWmMnw4zMhfn6IX3B0MrA24RXKE960rFqBBQ4r2
	 mLK5rHisvS5Ql1dTjHt4sCxcv05G6s8K+PUHuaIi8BhR3nouf26LAIpFmBcKJYp0WC
	 wSvrfRrGWTF/A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 779D010706CC;
	Sat, 14 Mar 2026 10:51:15 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Subject: [PATCH v7 0/3] hwmon: Add support for the LTC4283 Hot Swap
 Controller
Date: Sat, 14 Mar 2026 10:52:18 +0000
Message-Id: <20260314-ltc4283-support-v7-0-1cda48e93802@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOM9tWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyzHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0MT3ZySZBMjC2Pd4tKCgvyiEl0zw0QDy1RjM1MzU0sloK6CotS0zAq
 widGxtbUAsEfWcmEAAAA=
X-Change-ID: 20260314-ltc4283-support-61a09e365659
To: linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773485540; l=1803;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=4Sq3DEK8G8zCXWtDdEnlAx8YFVSgsv/JQaaNI9zSiWw=;
 b=V/ukvSe4Rq3Wz5tKTRrUOYrNTvQfWH7HW68j6w5IhtJqkTDYRYBmpWMuTwdseG2bbCZ1xan0l
 cjZiUn5QlmIB7LuYlnfx8/wq7A1JhDt/lLVoen1O20MUSg0Zdd5mG9N
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
	TAGGED_FROM(0.00)[bounces-33430-lists,linux-gpio=lfdr.de,nuno.sa.analog.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
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
X-Rspamd-Queue-Id: 2891328CC86
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is v7 for the LTC4283 how swap controller. Main change is that I'm
now using the auxiliary bus for adding the GPIO device (done depending
on FW properties).

Similar to the LTC4282 device, we're clearing some fault logs in the
reset_history attributes.

---
Changes in v7:
 - Patch 2:
    * Initialize raw energy to 0;
    * Clamp power val;
    * Handle BIT(8) edge case in ltc4283_write_in_byte();
    * Clamp ISENSE according to vsense_max;
    * Fix ltc4283_write_curr_history() by converting vsense_max to
      micro;
    * Fix default rsense value (expected to be in nano ohm);
    * Terminate table in sysfs attrs.
Link to v6: 
  - https://lore.kernel.org/linux-hwmon/20260303-ltc4283-support-v6-0-efe11502fad2@analog.com/

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
 drivers/hwmon/ltc4283.c                            | 1787 ++++++++++++++++++++
 10 files changed, 2582 insertions(+)
---
base-commit: 33f9280f8a3a1b8e1df9ab1ff4f9d2654f434f3c
change-id: 20260314-ltc4283-support-61a09e365659
--

Thanks!
- Nuno Sá



