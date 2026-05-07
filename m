Return-Path: <linux-gpio+bounces-36353-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKIvJpJO/GlOOAAAu9opvQ
	(envelope-from <linux-gpio+bounces-36353-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 10:34:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CF74E4E65
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 10:34:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D320A3096059
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 08:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D301237FF75;
	Thu,  7 May 2026 08:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i7qiVokw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90100349AFF;
	Thu,  7 May 2026 08:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142092; cv=none; b=pH+i0m9mVNnOPfTDtv+8Iggnz+goDfnTCxIN6sfowzF8NIOhwSl5VeMFn6jSQPeW7CIvm1j/xtr+YRgUxN1+zaj1OU9lfdiGcEGo8Tz8FN1V5nEIMQgDUaRauz8qaTSpGlebAaUsb4fbO7MlkDInkVTrikS4o9TZbkw/WQHNJfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142092; c=relaxed/simple;
	bh=ADtYUrAasvGOltfd9FShuLbJhinKTxBPxoHCICnXTv0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=h8wMbrUu8cIQhV4MHe9lQyYWK1oEL1o6JIRiOLpPTXf9j8gRNsWhfFXTyYtQQMqbD9GwzKU5WlpN6OQW2a0II7OFH3Vp0gpsa4baHWC6ZPb4i+ARNY+9zMA/QjChgO1ubHnNihORBYHACRqhR+cAXZ0ktIIZj4Unc/cooc+UV88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i7qiVokw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 43478C2BCB2;
	Thu,  7 May 2026 08:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778142092;
	bh=ADtYUrAasvGOltfd9FShuLbJhinKTxBPxoHCICnXTv0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=i7qiVokwvsXAC/sUis4JV+ecyTT7U+VbOhqUONVnGGDfRYGui3xgy6rLXBPQV4znC
	 VYXmQGm7tY4YglsevSuvUXSaWZTWT1sfFiXl9wBqOG97aYBcJ4I4F/ATG/CN45kePo
	 QnS8qlV3CI4eXJLjKk+wTwMt1apK8ijNpBEIGFBS1XKNxxHbR8NNj0Mnf8N3/bFIZC
	 HMQO3C20Ir1g2uCZC8V2mhmY05M1WiUMzhx7wbH5q178jPVt4dtrIQC9psogaINED/
	 oJl8617MGDODwoe+xYHHBriqKH94jkl77rsj/GysDY2JWPqnuu/RW6b6WGU+SivbTi
	 ImK8dCz/zPgQg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31E0FCD3427;
	Thu,  7 May 2026 08:21:32 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v2 0/2] pinctrl: add support amlogic a9
Date: Thu, 07 May 2026 08:21:05 +0000
Message-Id: <20260507-a9-pinctrl-v2-0-49774feff2ef@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHFL/GkC/02NwQqDMBBEf0X23C1mUak99T+KhyQmuqCJJBIs4
 r832ktv82YY3g7RBDYRnsUOwSSO7F0GuhWgR+kGg9xnBiqpKQW1KFtc2Ok1TDnWQkhJVCkL+aB
 kNKiCdHo8L9YHdGZbz2kJxvJ2ed5d5pHj6sPn0iZxtj9DRY9/QxJYou4bIZSqbU39S86TH1jft
 Z+hO47jCxssS6zBAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778142090; l=833;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=ADtYUrAasvGOltfd9FShuLbJhinKTxBPxoHCICnXTv0=;
 b=+WPtDI+UlHraHDXBTPvl2FM/S60lk+5x68/SNLerSm/CfB7+/O7viEMzuv4ZAUaWnS6YseElv
 3trpOG25Uf1DbIa9FB3fm7J1h0rS0e7B4OD5g3UmGfF6ya2xc+isLPO
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com
X-Rspamd-Queue-Id: 14CF74E4E65
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36353-lists,linux-gpio=lfdr.de,xianwei.zhao.amlogic.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,baylibre.com,googlemail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[xianwei.zhao@amlogic.com]
X-Rspamd-Action: no action

Add pinctrl bindings and driver about for amlogic a9.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v2:
- Add a commit message explaining why it is not compatible with previous SoCs and rebase code.
- Link to v1: https://lore.kernel.org/r/20260428-a9-pinctrl-v1-0-cd611bb5f52d@amlogic.com

---
Xianwei Zhao (2):
      dt-bindings: pinctl: amlogic,pinctrl-a4: Add compatible string for A9
      pinctrl: meson: support amlogic A9 SoC

 .../bindings/pinctrl/amlogic,pinctrl-a4.yaml       |  1 +
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c         | 61 ++++++++++++++++++++--
 2 files changed, 57 insertions(+), 5 deletions(-)
---
base-commit: eccd2fde7dbc398a6aba9120c01247beeca55aec
change-id: 20260129-a9-pinctrl-a9511aa224bf

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



