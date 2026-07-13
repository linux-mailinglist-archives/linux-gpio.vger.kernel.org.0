Return-Path: <linux-gpio+bounces-39992-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s9ADC7QBVWooiwAAu9opvQ
	(envelope-from <linux-gpio+bounces-39992-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 17:18:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E05B74CEC0
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 17:18:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=P3nfgZlw;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39992-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39992-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8AD3330E2543
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 15:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECF1B377EA2;
	Mon, 13 Jul 2026 15:07:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8323438B5;
	Mon, 13 Jul 2026 15:07:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955273; cv=none; b=lqnHxRlv/gMmBRj+didrieDCTqr7Ypomic6mlq5ocWdqTaZKojQTViMjMuS4eTCuxyOAiJ2FC2F+qWqSctSWc5XufwH+4NKKzmi5xnXP+VltIh6RHWbNereezOjZ8JAkW1utXVkLqupSZTbLDmm+AKHAqVb0Ev81RQkD1AJ3pVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955273; c=relaxed/simple;
	bh=JovwadXpz7CRGvxkNebvwnbtAdzmpWCiqaagy7z8tjw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bXi6j9cnrDw4a74PeCk18EfCOtyXQKzwmuVh6QmMw0wiXMXnARNPS3K4gj5LO+NjBWZ2r6NUuCfSkhl7LSb8RiAVSmDKwIADYy7Tj1nHJvkQVhDxEQAJESVk1YxQPmoUKkD1+cz91CptXB/GTXvuX+Xl5a9HNnCmTC4GoIPKfbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P3nfgZlw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F4B1C2BCB8;
	Mon, 13 Jul 2026 15:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783955273;
	bh=JovwadXpz7CRGvxkNebvwnbtAdzmpWCiqaagy7z8tjw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=P3nfgZlw90O+Brd5UeDNI9l1K9rmXOy8ZLX9wxJxkkFl2DFXE1EbCq1lLKJI7fMw/
	 I5gYAZ9OD8dvwTuFibtwE9Dzden1Pp1zSvUjCRPxunzghd/YQuftwURzwfARfXGST+
	 69DNeWHtiAe8Hz/OVnsJfX4VhLtXOMr64Y1hF/BGleJiydB8IcDZ1htXtilAEE5xIr
	 96fJXqPU007670KbCldyD1k8nTf92MYyALjdxX2iXNAPVTKB0qDSGAQ0QUAu8KrKg+
	 r+AASGaIgQVOxfvA+XJdwsl+nHX7lSngG0C+1rS/T1EXMnRs/lBm9WOAvgn7l1I54a
	 6zbYfiN6vT6Ww==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2873BC43458;
	Mon, 13 Jul 2026 15:07:53 +0000 (UTC)
From: Nikolai Burov via B4 Relay <devnull+nikolai.burov.jolla.com@kernel.org>
Subject: [PATCH v2 0/3] pinctrl: mediatek: Add MT6858 support
Date: Mon, 13 Jul 2026 18:06:20 +0300
Message-Id: <20260713-mt6858-pinctrl-v2-0-1bd072e3206c@jolla.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOz+VGoC/12NQQ6DIBQFr2L+ujQfGgS76j0aF4hQMSoGqGljv
 HvRdtXlJPPmrRBNcCbCtVghmMVF56cM7FSA7tT0MMS1mYEhK1GgJGMqJZdkdpNOYSAVFaqtsBL
 ILpBHczDWvY7gvf5yfDa90Wmv7EbnYvLhfTwudPd+cYr/8YUSJFZw1XAuLbb21vthUGftR6i3b
 fsArly8vb4AAAA=
X-Change-ID: 20260708-mt6858-pinctrl-917ad9097023
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Nikolai Burov <nikolai.burov@jolla.com>, 
 Nikolai Burov <nikolai.burov+review@abscue.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783955270; l=1879;
 i=nikolai.burov@jolla.com; s=20260707; h=from:subject:message-id;
 bh=JovwadXpz7CRGvxkNebvwnbtAdzmpWCiqaagy7z8tjw=;
 b=bWb23C26pN44n6mlmSAmuErea+0dtwrEaBlVVmyqLqqYDYMF6hqHYLznk/EUFEfNGhgqZrZSY
 qgwi96JaH/eDRNEKJ52VBzCwrmldS3UcW7B4GPGDJ7/wZmwMNsSo2wH
X-Developer-Key: i=nikolai.burov@jolla.com; a=ed25519;
 pk=yzpa+PD+ovHUFMIOBA9o2QqGwI110jM6hdGHLc7jtoQ=
X-Endpoint-Received: by B4 Relay for nikolai.burov@jolla.com/20260707 with
 auth_id=859
X-Original-From: Nikolai Burov <nikolai.burov@jolla.com>
Reply-To: nikolai.burov@jolla.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39992-lists,linux-gpio=lfdr.de,nikolai.burov.jolla.com];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:sean.wang@kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:nikolai.burov@jolla.com,m:nikolai.burov+review@abscue.de,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,m:nikolai.burov@abscue.de,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[nikolai.burov@jolla.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt,review];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,msgid.link:url,infradead.org:email,collabora.com:email,jolla.com:mid,jolla.com:email,jolla.com:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5E05B74CEC0

Add support for GPIO and pin configuration on the MT6858 (MediaTek
Dimensity 7100) SoC.

Signed-off-by: Nikolai Burov <nikolai.burov@jolla.com>
---
Changes in v2:
- dt-bindings: Change reg-names and descriptions as suggested by Angelo
- Remove incorrect slew rate field from register table
- Fix hole in the EINT table by including pins without EINT support
- Add missing pm_sleep_ptr() and /* sentinel */ comment
- Link to v1: https://patch.msgid.link/20260710-mt6858-pinctrl-v1-0-f75ab558f0df@jolla.com

To: Linus Walleij <linusw@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Nikolai Burov <nikolai.burov@jolla.com>
To: Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org

---
Nikolai Burov (3):
      dt-bindings: pinctrl: mediatek: Add MT6858
      pinctrl: mediatek: Add driver for MT6858
      arm64: dts: mediatek: mt6858: Add pinmux macro header file

 .../bindings/pinctrl/mediatek,mt6858-pinctrl.yaml  |  190 ++
 arch/arm64/boot/dts/mediatek/mt6858-pinfunc.h      | 1335 +++++++++++
 drivers/pinctrl/mediatek/Kconfig                   |   10 +
 drivers/pinctrl/mediatek/Makefile                  |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6858.c          | 1407 ++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6858.h      | 2378 ++++++++++++++++++++
 6 files changed, 5321 insertions(+)
---
base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
change-id: 20260708-mt6858-pinctrl-917ad9097023

Best regards,
--  
Nikolai Burov <nikolai.burov@jolla.com>



