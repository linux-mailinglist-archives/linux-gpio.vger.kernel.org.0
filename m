Return-Path: <linux-gpio+bounces-35657-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KJcAMNv8GkJTgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35657-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 10:28:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8810C480155
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 10:28:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 560C330861D6
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 08:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8594E346A1F;
	Tue, 28 Apr 2026 08:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h9TWDpw6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283213D3339;
	Tue, 28 Apr 2026 08:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777364575; cv=none; b=rrUWMXotGab6S5GDL6UJhOGdaKtMyBBqbxjHOGajfZAVFwtgSD4I71xC84u7Ua0B89CPCG7sl8+POriuvUU1tll4LguvGKcSXQoYp8/qrGqZqLKQYCZCgK6xSx5D7uQRJgFOlc0oW8JyliFoid3T9OIuG+hndSV6h9Sjp1Oil7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777364575; c=relaxed/simple;
	bh=PCmmP7rOGoVbafpRKiOOAPfPVCbMnwaOJ+ZUHtPfBlM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VdqfI7wKTDzPNmshi+hVZ5hL+lI+6ovjtgg0+FBAGJFS2op3S5MWlWNj30aCHFEZKMgr4xM9Z8dt/upcT41Nxxxj9LTgnAJN/U3JTTwyCRijGw2br3QTnWD2ba9970RqRqJZOTjR+KalfSkrM6RVyCW5C+a1BtDwhDjELXUDQFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h9TWDpw6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C34D9C4AF0C;
	Tue, 28 Apr 2026 08:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777364574;
	bh=PCmmP7rOGoVbafpRKiOOAPfPVCbMnwaOJ+ZUHtPfBlM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=h9TWDpw6lpcfUpn56iA0a3kI6avu5jGxjRDxkCOmq7ivofr0kRiQ9zh5h0zzgO0QW
	 2aR430KVGkiUmiDH5IVSrGARq3t6hps9V9gzkE36GtTsCN64B1ya8OVKioxN4mOg02
	 h6OmBXjwhjloFJ8SE7t6QcVWq4cWGvSJMBAsfVonJPuTMZFjH4k0acJzhuUtOdc5oB
	 nl90D0x97N5tsKaDgjXFS0S5z/6FN6seVsW7Q8qtKJJtnsySBb2UeVj9mdFuG3ssJm
	 PbN/M9t12LYEWHcgQgMdvkSqbprjjAFfypEp6C/MwF6IQsk9+FoIohGA4NF+M3Y48+
	 zryyP+iwyjhYQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2D5AFF886C;
	Tue, 28 Apr 2026 08:22:54 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH 0/2] pinctrl: add support amlogic a9
Date: Tue, 28 Apr 2026 08:22:47 +0000
Message-Id: <20260428-a9-pinctrl-v1-0-cd611bb5f52d@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFhu8GkC/x2NQQqDQAxFryJZN+AEW9CrlC4yY6YGJEpGiiDe3
 bG7//g83gFFXKXA0Bzg8tOii1UIjwbSxPYV1LEyUEuvNlCP3OOqljaf63yGwEzUxQxViFwEo7O
 l6Vby4miyb/e1umTd/5335zwvrtRp4XcAAAA=
X-Change-ID: 20260129-a9-pinctrl-a9511aa224bf
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777364572; l=623;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=PCmmP7rOGoVbafpRKiOOAPfPVCbMnwaOJ+ZUHtPfBlM=;
 b=e1FzcU/DdusnZod18ZyvkoyVW7rZNPse69uMZZc413BNyHmbbnJrbiwJ1VkPw9aQaSbXm8ifR
 wQV9Qv7WVVXAztSi4LRYKW0F4GH3ocNk3lCQV3uZqDvKoFUq937AHqX
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com
X-Rspamd-Queue-Id: 8810C480155
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-35657-lists,linux-gpio=lfdr.de,xianwei.zhao.amlogic.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,baylibre.com,googlemail.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	HAS_REPLYTO(0.00)[xianwei.zhao@amlogic.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amlogic.com:email,amlogic.com:replyto,amlogic.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Add pinctrl bindings and driver about for amlogic a9.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Xianwei Zhao (2):
      dt-bindings: pinctl: amlogic,pinctrl-a4: Add compatible string for A9
      pinctrl: meson: support amlogic A9 SoC

 .../bindings/pinctrl/amlogic,pinctrl-a4.yaml       |  1 +
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c         | 61 ++++++++++++++++++++--
 2 files changed, 57 insertions(+), 5 deletions(-)
---
base-commit: bd7fd288490c64835a74c05e631c102ce056d5e1
change-id: 20260129-a9-pinctrl-a9511aa224bf

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



