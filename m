Return-Path: <linux-gpio+bounces-39835-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pAdYAYAJUWph+QIAu9opvQ
	(envelope-from <linux-gpio+bounces-39835-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 17:02:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B104273C06A
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 17:02:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=mFABD7o8;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39835-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39835-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C654330164B7
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 15:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABAAE2D5C7A;
	Fri, 10 Jul 2026 15:01:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BF5233956;
	Fri, 10 Jul 2026 15:01:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783695715; cv=none; b=hsbCkDI8vT2YSBWVsKEFdaNLGTr+XUBfWqyfR2EVpwMgRfCqBQ8Hgz7JEZSHcWNItQpd8JFsoXSql8BAnwzk8v0jAOC/IRjGQeyike6bYLzdClHj4zaB3ce//f7kjsEIY2H9oC+lwMpW/TVMFPkWnAuGJ4dh6aWidJApLQbCcts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783695715; c=relaxed/simple;
	bh=Zq0NKaJlpzYFMBprR7tFkC2cwEQusS6IE/2q5o6meCc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AYnFaRjCZooypV/JRF0ngwxauJOahN2QSrGpSCan4cMVj/HNPbHCN5LdqdkBpr769Ip1zvbjGslMzI3axIVr4scEyYAqsPF4fgZBy/MCpvmoFWr6uIuLdaLTtsu9Aa0WwL6p3pK8HSOENCtGBZtPIjO7nU2rwLwwFWAdFmY4d/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mFABD7o8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10DD2C2BCC6;
	Fri, 10 Jul 2026 15:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783695715;
	bh=Zq0NKaJlpzYFMBprR7tFkC2cwEQusS6IE/2q5o6meCc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=mFABD7o86SbEULBKr9B++FLg5pgHcX/CuVDH4A7u+/zHkXI/uPfPtz9YTb/UHBTN4
	 BfL0WKU3oJaokyPRaKi6cVJD+K8QH5t0cLFj8DH5ntFrf09vdOdYS/gQmHpQF/rgZA
	 84/Wj12+du90BNPyEEqFRQND3EMZBLnOzKEgX4CYxWFVNrXCmsF+hAEvX8MTGh7UkL
	 IRt9zghavxQOYcnKK4oRFrs0ZP3PKcEZAX90Cj6Y4DHJY1qDCuLFLnlV1uQp7qRu8G
	 rPek0zi6i0oPAmp5ElFzwiYsq+eSnNEl7nanz9QdscwEbECI2yBl/dX176CfCYzLdU
	 ejwsuvC5DqvxQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E054AC43458;
	Fri, 10 Jul 2026 15:01:54 +0000 (UTC)
From: Nikolai Burov via B4 Relay <devnull+nikolai.burov.jolla.com@kernel.org>
Subject: [PATCH 0/3] pinctrl: mediatek: Add MT6858 support
Date: Fri, 10 Jul 2026 18:00:22 +0300
Message-Id: <20260710-mt6858-pinctrl-v1-0-f75ab558f0df@jolla.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAYJUWoC/yXMQQqDMBBA0avIrBsYI5rEqxQXGqd1RKMkUQTx7
 sZ2+Rb/nxDIMwWosxM87Rx4cQn5KwM7tO5LgvtkkCgrVKjFHCtdarGys9FPwuSq7Q0ahbKAFK2
 ePnz8hu/m77B1I9n4XOC6blrsz45yAAAA
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
 Nikolai Burov <nikolai.burov+review@abscue.de>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783695712; l=964;
 i=nikolai.burov@jolla.com; s=20260707; h=from:subject:message-id;
 bh=Zq0NKaJlpzYFMBprR7tFkC2cwEQusS6IE/2q5o6meCc=;
 b=dyxBquZP+GmdIg3f4UUg/xOOgljWgtNmiAwORqIKBamjDtTKI7DnD9sXCD3aVIz6d22P2zk0z
 EG7H7U+F8BLDZvN+uULFm22Jix5qv8l4sW25Lyq79NqY6FOX7UTUuvL
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39835-lists,linux-gpio=lfdr.de,nikolai.burov.jolla.com];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:sean.wang@kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:nikolai.burov@jolla.com,m:nikolai.burov+review@abscue.de,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,m:nikolai.burov@abscue.de,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[nikolai.burov@jolla.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt,review];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[jolla.com:replyto,jolla.com:mid,jolla.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B104273C06A

Add support for GPIO and pin configuration on the MT6858 (MediaTek
Dimensity 7100) SoC.

Signed-off-by: Nikolai Burov <nikolai.burov@jolla.com>
---
Nikolai Burov (3):
      dt-bindings: pinctrl: mediatek: Add MT6858
      pinctrl: mediatek: Add driver for MT6858
      arm64: dts: mediatek: mt6858: Add pinmux macro header file

 .../bindings/pinctrl/mediatek,mt6858-pinctrl.yaml  |  190 ++
 arch/arm64/boot/dts/mediatek/mt6858-pinfunc.h      | 1335 ++++++++++++
 drivers/pinctrl/mediatek/Kconfig                   |   10 +
 drivers/pinctrl/mediatek/Makefile                  |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6858.c          | 1408 ++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6858.h      | 2301 ++++++++++++++++++++
 6 files changed, 5245 insertions(+)
---
base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
change-id: 20260708-mt6858-pinctrl-917ad9097023

Best regards,
--  
Nikolai Burov <nikolai.burov@jolla.com>



