Return-Path: <linux-gpio+bounces-33852-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFl/AIhFvGlTwQIAu9opvQ
	(envelope-from <linux-gpio+bounces-33852-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 19:50:48 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 983922D1567
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 19:50:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 021F1301AE7B
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 18:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5992533D4FD;
	Thu, 19 Mar 2026 18:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FzTor9Et"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6C615CD74;
	Thu, 19 Mar 2026 18:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773946234; cv=none; b=u5lbNbhTERMEjJO9uSXHew5xcb2gtr3KJ/9d3MbBths6QHT7ShZrWQLj0oKPNST7E3E7QU90FpRsUC8GP/RqHjoaTsFXJwMAnJkdd62KFUhN/AKU4M4vje+OCP1gJGLb4/r8zX5fm1YvSHv9Co5L3nPfWXVJJM07eKlcdXGut9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773946234; c=relaxed/simple;
	bh=5YNZUvrTIuv+7IsLpKst0RP0uPhw8+y0Y7ikzKfokv8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tTImBspmP4ES4hTCLhe93sZMoIZnaK62gSvhwhLcFfrfK4XqZcc0jzpotPnDsFqiLq6tr0/qFS6dHxh+Vl2sLD2LlcKa8SC97QH4DLXkrLvezwUuZ/JzBSivZNdObDyGuQn3koY336Tu7c7C6NC8zsErZp5HyTSmxHuciBxJaOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FzTor9Et; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB01C19424;
	Thu, 19 Mar 2026 18:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773946233;
	bh=5YNZUvrTIuv+7IsLpKst0RP0uPhw8+y0Y7ikzKfokv8=;
	h=From:Subject:Date:To:Cc:From;
	b=FzTor9Et3g/wmH007mWvLwIJxV8Wnf1BrP3tPKcSRmpghwvQq4PWQQibqgM0VyzC3
	 Uf8o4Uo/XMVV230Gh/H1KpbzWBiDix5HqOn3g428+bzHsNFQmLVyt/g1kFtmg8Qaim
	 d2lk0vLPuOZbMQRQxug5Gv3wSG/AFlIy/mPbdDh5Qw9LaIYit5TG/x9M4KuOZiClNt
	 jj8rFERmb8Mc33/iMgYns71U2Ovz+zQEuAgcgZODhmG7jmVoT5Z5ZhiyMyU1npt8EV
	 HGpmLaaooTJVuECTWgnZXunGk4D1z1wrnHP9pJSL0R8UR1BshJr8klLbFpA012NyRi
	 +M1eyN13dY/NQ==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v3 0/2] mfd: arizona: Move IRQ GPIO to GPIO descriptor
Date: Thu, 19 Mar 2026 19:50:28 +0100
Message-Id: <20260319-mfd-arizona-irq-v3-0-24c251377ec2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNQQ7CIBCF4as0rB0DlBbrynsYF9gOLVFBB0PUp
 neXdqUxLv+XzDcji0gOI9sWIyNMLrrgc5SrgrWD8T2C63IzyWXNS6HgYjsw5F7BG3B0g9qitih
 0Y3jD8tWV0LrHIu4PuQcX74Gey4Mk5vW/lQQIUEetbSWV3ZRyd0LyeF4H6tmMJfkJ6F9AAocGT
 aVqWwndtV/ANE1v5njaZPAAAAA=
X-Change-ID: 20260314-mfd-arizona-irq-6fe7fe179a09
To: Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33852-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 983922D1567
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Move the hack using a platform data-provided GPIO line to use
a proper devicetree-provided GPIO descriptor to poll the IRQ.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
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
 drivers/mfd/arizona-irq.c                          | 45 ++++++++++------------
 include/linux/mfd/arizona/core.h                   |  2 +
 include/linux/mfd/arizona/pdata.h                  |  5 ---
 4 files changed, 33 insertions(+), 29 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260314-mfd-arizona-irq-6fe7fe179a09

Best regards,
-- 
Linus Walleij <linusw@kernel.org>


