Return-Path: <linux-gpio+bounces-33600-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NvMIpofuWmergEAu9opvQ
	(envelope-from <linux-gpio+bounces-33600-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 10:32:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E988B2A6CB8
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 10:32:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 84D673081F34
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 09:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D249D35E945;
	Tue, 17 Mar 2026 09:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LH1X3ZSQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953312BCF68;
	Tue, 17 Mar 2026 09:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773739715; cv=none; b=RTUqpXUttt/XCCUJIKJypKGEmsepHJwQdbIotXnexhsawDcJncPOaLQeAycMKgnNTCJWTJS9EOnZiAM3xP1xS5b5nU8xXiFY0NTJRSs24AybnsOvp6Ycdaqbbs2kOsONMzuy7PvnTC3XKbTagMewuXGqs68x0+m0g+feml4daQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773739715; c=relaxed/simple;
	bh=sjnlXkWk5W2DA0kuuvF8lXaFqcyP3ve5fDUP+1YBDc0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c8uw77g4NDYTI2TpNiwgu4eXmlk1s/H3TjJu/Psgdw4M5cxUsi9WbC5gUMsftXou918yWc0br7B2pLDDS2gFkYE1AB1LQGCsw4YYD75ru8+XG9mac7MIRuQZka+lHCaqnDt0UwyIZDz7obdQh7iN4eFqLbiDK8LPmuk4r5YOEhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LH1X3ZSQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DDB6C4CEF7;
	Tue, 17 Mar 2026 09:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773739715;
	bh=sjnlXkWk5W2DA0kuuvF8lXaFqcyP3ve5fDUP+1YBDc0=;
	h=From:Subject:Date:To:Cc:From;
	b=LH1X3ZSQT1WdefjHIrTCH2agyx/nkOvsDkZg2CLfWXEBjeCvqUSaNn9MGQLyqSUth
	 gaXExk5MDs/6bn0x6R7O3z83jD+9xRHs+RpSm5oz7gRcLlo7O/k9dYaqbMIQCHbbtl
	 lx8RdDlQbYYEvPDsZP8aLKAP2Q8ymomijXk68F8HMhY6Es1elTwKc0qlSwPYObje3H
	 0WDt/YagchZufObUFmB64M/iDUs1e/5MOUWYoG1UlgW0bri7nL+WKq4UNfZMbrdjQd
	 kRRz0zaou/VYETuRupb5kdqt/90YRlwHvuN2mxUS7JJCM8piWt52FxlVnhy1CRPMSY
	 xge3akGvOk4CQ==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v2 0/2] mfd: arizona: Move IRQ GPIO to GPIO descriptor
Date: Tue, 17 Mar 2026 10:28:30 +0100
Message-Id: <20260317-mfd-arizona-irq-v2-0-9ea546f517dc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBBFr0Jm7RhakAor72FYVJnCRG11aohKe
 ncre5fvJf/9BSIJU4SuWEBo5sjBZ9CbAs6T9SMhD5lBl7opK1XjzQ1ohT/BW2R5YOPIOFKmtWU
 LeXUXcvxai8c+88TxGeS9HszqZ/+3ZoUK65Mxbqdrt6/04ULi6boNMkKfUvoCcDBVU68AAAA=
X-Change-ID: 20260314-mfd-arizona-irq-6fe7fe179a09
To: Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33600-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E988B2A6CB8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Move the hack using a platform data-provided GPIO line to use
a proper devicetree-provided GPIO descriptor to poll the IRQ.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Changes in v2:
- Instead of deleting the feature, migrate it properly to devicetree.
- Add irq-gpios devicetree bindings.
- Add code to handle irq-gpios for GPIO polling of IRQ line.
- Link to v1: https://lore.kernel.org/r/20260314-mfd-arizona-irq-v1-1-4b77f524f832@kernel.org

---
Linus Walleij (2):
      dt-bindings: mfd: wlf,arizona: Add irq-gpios
      mfd: arizona: Convert GPIO IRQ handling to descriptors

 .../devicetree/bindings/mfd/wlf,arizona.yaml       |  9 +++++
 drivers/mfd/arizona-irq.c                          | 45 ++++++++++------------
 include/linux/mfd/arizona/core.h                   |  2 +
 include/linux/mfd/arizona/pdata.h                  |  5 ---
 4 files changed, 32 insertions(+), 29 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260314-mfd-arizona-irq-6fe7fe179a09

Best regards,
-- 
Linus Walleij <linusw@kernel.org>


