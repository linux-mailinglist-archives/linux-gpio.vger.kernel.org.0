Return-Path: <linux-gpio+bounces-36493-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KO2DKrGtAGpkLgEAu9opvQ
	(envelope-from <linux-gpio+bounces-36493-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 10 May 2026 18:09:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5E5505036
	for <lists+linux-gpio@lfdr.de>; Sun, 10 May 2026 18:09:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DF7893004D3D
	for <lists+linux-gpio@lfdr.de>; Sun, 10 May 2026 16:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C8B63ACF1C;
	Sun, 10 May 2026 16:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AqFyAKC0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC1F3ACA74;
	Sun, 10 May 2026 16:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778429342; cv=none; b=KD0H6vGQ6/nL/IAZK9Ne0O/ETkONxAVWPfQL/UbiIP2PpbDe5vrYRFQoSQa/ZnTkrdosAGZlMRYZCuu/hxBAWMUn3Pz5KaJQLgoAZnh4BUA6FliFUyw8K4+C5Fua/f9VYWJ/ls00zhC1jGWfCX4hOi3xJTYbvJVMc+pZg99dUXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778429342; c=relaxed/simple;
	bh=wfHMaPVrKZ/CnHd2SjBdGDvMgPBPVKrMvAzVQG74mw4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R/+otcBP04xvL5goad3TT/rvpg93ZjB6Z//0PKx9y868f1viI+FwwS/XrgjWCQ3ooyjB+OIDAmceBxdng6/2pbKvmDyCGTYTv9HXB6qqhgJA+bYCPGoR0sylfldqHCWWy4hWWY2wPbUX3tt4GBa+lS6ZmSY0KTiDcR3xr19QMO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AqFyAKC0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9518C2BCB8;
	Sun, 10 May 2026 16:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778429341;
	bh=wfHMaPVrKZ/CnHd2SjBdGDvMgPBPVKrMvAzVQG74mw4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=AqFyAKC0ND+hX5XohxWudf08zaCe0LUMtshbEMMDka6aOBhvd7dm6Daymac3xa34z
	 OsJM6eK8QKjNsYCHsTwl+WpMw2i885MoUEhI3HtwsrCr94F47y889sBSJHXyg/JCQ4
	 VYrPFy3P+Lhc7PwCNqJn6aKBK/E0+3azX3Un8RTdeWPTLtYd1Bg8ccTfHjJikX1Puh
	 eayiwmNeTJ1VYxahAuN5R8/agBW0H73zA6oKuxBDzJbjypJHeltXQ5Ui/6eK4CA0na
	 sZZlDGLXYQQ5BTuFEBT99f9afcGdeN6frW7Ur3g2tYAPBFjKB6D64DR/artE6LVDoy
	 NXmWhnUXIfwJA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2B84CD37B9;
	Sun, 10 May 2026 16:09:01 +0000 (UTC)
From: Alexandre Hamamdjian via B4 Relay <devnull+azkali.limited.gmail.com@kernel.org>
Subject: [PATCH 0/2] usb: typec: add Rohm BM92TXX Type-C / PD controller
 driver
Date: Sun, 10 May 2026 23:08:53 +0700
Message-Id: <20260510-bm92t-v1-0-dff3c9d22426@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU0MD3aRcS6MSXWNzi0RDy2RjY8tUYyWg2oKi1LTMCrA50bEQfnFpUlZ
 qcglIs1JtLQBYUa82aQAAAA==
X-Change-ID: 20260510-bm92t-378a19c339e3
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, CTCaer <ctcaer@gmail.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Alexandre Hamamdjian <azkali.limited@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778429339; l=1198;
 i=azkali.limited@gmail.com; s=20260510; h=from:subject:message-id;
 bh=wfHMaPVrKZ/CnHd2SjBdGDvMgPBPVKrMvAzVQG74mw4=;
 b=REsPFHgjcoHND/C70+ey/FApHgnxXCkQO4GaIsf4qjx7zf5Ah/DseTUQfjvUrhp8TxB1assci
 RFHuC6TxolQCm5SE1mpimcRyihDWI2KeGk0zx98PSSTDldp4yndSpRb
X-Developer-Key: i=azkali.limited@gmail.com; a=ed25519;
 pk=I0Z0IdCdQJqNGX+FQUnXhrHg950u3cM6Xzz3YT6JOyQ=
X-Endpoint-Received: by B4 Relay for azkali.limited@gmail.com/20260510 with
 auth_id=774
X-Original-From: Alexandre Hamamdjian <azkali.limited@gmail.com>
Reply-To: azkali.limited@gmail.com
X-Rspamd-Queue-Id: AF5E5505036
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36493-lists,linux-gpio=lfdr.de,azkali.limited.gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,linuxfoundation.org,gmail.com,kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[azkali.limited@gmail.com]
X-Rspamd-Action: no action

This series adds initial support for the Rohm Semiconductor BM92TXX
family of USB Type-C and Power Delivery controllers.

This chipset is found on Nintendo Switch hardware, where it handles
charger and dock USB-C / PD negotiation, DisplayPort alternate-mode
entry through the dock and VBUS / VCONN control.

Further patches will follow to wire the driver up on Nintendo Switch
device trees and to address review feedback.

Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
---
Alexandre Hamamdjian (1):
      dt-bindings: usb: add Rohm BM92TXX Type-C controller

CTCaer (1):
      usb: typec: bm92txx: add Rohm BM92TXX support

 .../devicetree/bindings/usb/rohm,bm92t.yaml        |  128 +
 MAINTAINERS                                        |    8 +
 drivers/usb/typec/Kconfig                          |   11 +
 drivers/usb/typec/Makefile                         |    1 +
 drivers/usb/typec/bm92txx.c                        | 2634 ++++++++++++++++++++
 5 files changed, 2782 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260510-bm92t-378a19c339e3

Best regards,
--  
Alexandre Hamamdjian <azkali.limited@gmail.com>



