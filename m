Return-Path: <linux-gpio+bounces-34201-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLnOCsAUxWnr6QQAu9opvQ
	(envelope-from <linux-gpio+bounces-34201-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 12:13:04 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 290363342E0
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 12:13:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3E82330B0D53
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 10:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12550382F39;
	Thu, 26 Mar 2026 10:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i9BsEftY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6138EEBB;
	Thu, 26 Mar 2026 10:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774522275; cv=none; b=tnmBzGRE2smlwrg40YcWcVd5T7vK/vnIYw5Q98pBOpC1FBiLw+wzdfwSILjKl3Uu7Kkja8oMkeHz+hWDvCEDPokqHz7lmoqoFCq5X/3PUSS6e3GBwkHODXjjwsu+c+Iogfsog/jKMxt0m9yr8AOM4kIEZtZqjaktDu8SF9FGNnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774522275; c=relaxed/simple;
	bh=EzZfmQOMMujOeVfa6UhnYFzzL8p4aNp/rOTVD6jR130=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rH9f/DlgBlsXIF3OaeFyNMvulIWcAdkgOysq58Ke+VjG10vYzQZbH1DQNpvMcbBE80zfThB5dcvgTIXnJTBUhhcstNhBpaWnrnUKrb6HDy6V4KCRbtJLFYzkungdnsbV2pJoHhMqq92lP8f7lEVMy6w9sxneNnyHfiqsKh3Gkyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i9BsEftY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51F2BC116C6;
	Thu, 26 Mar 2026 10:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774522275;
	bh=EzZfmQOMMujOeVfa6UhnYFzzL8p4aNp/rOTVD6jR130=;
	h=From:Subject:Date:To:Cc:From;
	b=i9BsEftYC8DWjjVl5F9XivgCx1p1Tf+R8ZtuLsYK6yVe+ECzE8+o7garo++mCTIur
	 dUGAztlpWGqRiOmW2CDI0noohube+OPm7xGPCBGXTQSauBqbCuV7BpHo41yxZq98fL
	 SKqaJRtW9iQVdRPNs5bxJWAKQ1+0VebfbEJ9tuAxQ8xXz4ZeXw6Ktdzaqb2bzp3WwZ
	 y28G/rXlRCxr6XGw64WkF8x3SYD7EZ/ptkpF+upcretwWiNCgw1oaH8bl6HK6rtn5C
	 f+ruLwQnJAhRG2VgkRCRlhQvIAJOke5QhejMjLb2CoKoQrLFExOnYwZ0y1h7yNjGbT
	 7TApi9iiAkXsg==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v4 0/2] mfd: arizona: Move IRQ GPIO to GPIO descriptor
Date: Thu, 26 Mar 2026 11:51:10 +0100
Message-Id: <20260326-mfd-arizona-irq-v4-0-50c47ed0a18e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XOwQ6CMAyA4VchO1vDuo2JJ9/DeJijg0VlOgxRC
 e/u4IQhHv8m/dqBdRQ9dWyfDSxS7zsf2hRykzHbmLYm8FVqhjkWueASbq4CE/0ntAZ8fEDhSDv
 iujR5ydLWPZLzr1k8nlI3vnuG+J4P9Hya/rd6DhzkWWunULqdwMOFYkvXbYg1m7Ael4BeAwg5l
 GSULJziurIrQCyBcg2IBKC0qLjQmuzvB+M4fgFBRjPgMQEAAA==
X-Change-ID: 20260314-mfd-arizona-irq-6fe7fe179a09
To: Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34201-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 290363342E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Move the hack using a platform data-provided GPIO line to use
a proper devicetree-provided GPIO descriptor to poll the IRQ.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Changes in v4:
- Fix error path to use dev_err_probe() and report mismatches GPIO
  IRQ numbers properly.
- Fix spelling error in commit message.
- Pick up ACKs.
- Link to v3: https://lore.kernel.org/r/20260319-mfd-arizona-irq-v3-0-24c251377ec2@kernel.org

Changes in v3:
- Reword the irq-gpios documentation as Charles Want it.
- Collect ACK.
- Link to v2: https://lore.kernel.org/r/20260317-mfd-arizona-irq-v2-0-9ea546f517dc@kernel.org

Changes in v2:
- Instead of deleting the feature, migrate it properly to devicetree.
- Add irq-gpios devicetree bindings.
- Add code to handle irq-gpios for GPIO polling of IRQ line.
- Link to v1: https://lore.kernel.org/r/20260314-mfd-arizona-irq-v1-1-4b77f524f832@kernel.org

---
Linus Walleij (2):
      dt-bindings: mfd: wlf,arizona: Add irq-gpios
      mfd: arizona: Convert GPIO IRQ handling to descriptors

 .../devicetree/bindings/mfd/wlf,arizona.yaml       | 10 +++++
 drivers/mfd/arizona-irq.c                          | 46 +++++++++++-----------
 include/linux/mfd/arizona/core.h                   |  2 +
 include/linux/mfd/arizona/pdata.h                  |  5 ---
 4 files changed, 34 insertions(+), 29 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260314-mfd-arizona-irq-6fe7fe179a09

Best regards,
-- 
Linus Walleij <linusw@kernel.org>


