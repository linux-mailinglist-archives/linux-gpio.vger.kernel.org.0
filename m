Return-Path: <linux-gpio+bounces-36495-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cH3/JqjPAGrZMwEAu9opvQ
	(envelope-from <linux-gpio+bounces-36495-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 10 May 2026 20:34:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 03418505ADA
	for <lists+linux-gpio@lfdr.de>; Sun, 10 May 2026 20:34:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F1B83036397
	for <lists+linux-gpio@lfdr.de>; Sun, 10 May 2026 18:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA5AA3164BB;
	Sun, 10 May 2026 18:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U/d+1Uvv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0CE2FF641;
	Sun, 10 May 2026 18:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778437937; cv=none; b=qpGDNMRNji76FPXjtQsQ/2tVlpj7cpwzkbty6DXis/RcGc1jaLZy5qeQGf8FLsobIkd8KNsj0SQvq8RCu42DyPZS7GB80SpCpHkrg6HtLI5zl7aAoP5YymDPRtuDlzE7jM3hzQ+ZTEiqp7VpSXUEyFWjcyuEptLLOfpl2JozSeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778437937; c=relaxed/simple;
	bh=zhf2v3Fxq81QYgVX0wuET1y38n//e4jTE1V3yZEXPG4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TUtmqzWHhprZiNmhjogkK/LL/8V6SqS3ku9aw+LYvBdPyYM0KpOHBcKoS9H/Zt/kFR0zra9PE6BkTcdinbbBfe6BtHEGAIsO7u74dt0S9e8XgtFHt0ugVbl8riDuY3fDNEdjjx3uoQVSvtF/LwlyaPawksdO76tWVEQ1ivkq11Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U/d+1Uvv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2FE74C2BCB8;
	Sun, 10 May 2026 18:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778437937;
	bh=zhf2v3Fxq81QYgVX0wuET1y38n//e4jTE1V3yZEXPG4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=U/d+1UvvQJw+09H4SOt8zwwq5cT/AdOnx7yIlslHaasPafOpRLkoL0jh1W+wnAklt
	 hPspXFmmHSHz82mmZsb55L1k9ha7rQnoVy6jJgd8AFvAQ3vI/qI7bAuVRCE8Ssv4aD
	 A4USBnPhTIR3eGBj2ORZ4ZfIs3leGcHk6DKqvunX5zmR3P/3rWkJLqRQ4VFvMU5YZt
	 fj37VWBLL7jlmcKFivyWHpzSJaynu4FfFNpcwh+IbArBQTRhEQULLvg2yCJJS0P3Po
	 cxcU1jue4yaPrc9U/273px3BgSSIIu/H/VrcW9nu63z/sh20jNVHXII8bPzE0zjMeW
	 7Rx03+lUOGMhg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1850ECD4840;
	Sun, 10 May 2026 18:32:17 +0000 (UTC)
From: Alexandre Hamamdjian via B4 Relay <devnull+azkali.limited.gmail.com@kernel.org>
Subject: [PATCH v2 0/3] usb: typec: add Rohm BM92TXX Type-C / PD controller
 driver
Date: Mon, 11 May 2026 01:32:08 +0700
Message-Id: <20260511-bm92t-v2-0-2145e4f4386b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12NQQ6CMBBFr0JmbU07VbSuvIdhAe0UxlgwLTYaw
 t0F3Ll8yfvvT5AoMiW4FBNEypx46BfAXQG2q/uWBLuFASWW8qikaILBUejTuVbGam1Iw+I+I3l
 +b51b9eP0au5kx3W8Gh2ncYif7Sir1ftvZiWkcN5raxziActrG2p+7O0QoJrn+Qs/7YNLrAAAA
 A==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778437929; l=1928;
 i=azkali.limited@gmail.com; s=20260510; h=from:subject:message-id;
 bh=zhf2v3Fxq81QYgVX0wuET1y38n//e4jTE1V3yZEXPG4=;
 b=kFodGNoh7i42PTlga1DXS3gjvphT79mvS9m5p75ugk5y5GXgzHHPClLOLam0RuCgVuBM4mAy3
 RklHpfzsM9ZCgNPfH+x+UBZgY2pCo409RZsHT3zcVQoyy0j5C6DFK3R
X-Developer-Key: i=azkali.limited@gmail.com; a=ed25519;
 pk=I0Z0IdCdQJqNGX+FQUnXhrHg950u3cM6Xzz3YT6JOyQ=
X-Endpoint-Received: by B4 Relay for azkali.limited@gmail.com/20260510 with
 auth_id=774
X-Original-From: Alexandre Hamamdjian <azkali.limited@gmail.com>
Reply-To: azkali.limited@gmail.com
X-Rspamd-Queue-Id: 03418505ADA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36495-lists,linux-gpio=lfdr.de,azkali.limited.gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,linuxfoundation.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[linux.intel.com,linuxfoundation.org,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[azkali.limited@gmail.com];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[]
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
Changes in v2:
- dt-bindings: usb: rohm,bm92t: fix properties type
- Link to v1: https://patch.msgid.link/20260510-bm92t-v1-0-dff3c9d22426@gmail.com

To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: CTCaer <ctcaer@gmail.com>
To: Alexandre Hamamdjian <azkali.limited@gmail.com>
To: Linus Walleij <linusw@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: devicetree@vger.kernel.org

---
Alexandre Hamamdjian (2):
      dt-bindings: usb: add Rohm BM92TXX Type-C controller
      dt-bindings: usb: fix properties type

CTCaer (1):
      usb: typec: bm92txx: add Rohm BM92TXX support

 .../devicetree/bindings/usb/rohm,bm92t.yaml        |  132 +
 MAINTAINERS                                        |    8 +
 drivers/usb/typec/Kconfig                          |   11 +
 drivers/usb/typec/Makefile                         |    1 +
 drivers/usb/typec/bm92txx.c                        | 2634 ++++++++++++++++++++
 5 files changed, 2786 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260510-bm92t-378a19c339e3

Best regards,
--  
Alexandre Hamamdjian <azkali.limited@gmail.com>



