Return-Path: <linux-gpio+bounces-37261-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NGVJ3PPDmrMCQYAu9opvQ
	(envelope-from <linux-gpio+bounces-37261-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 11:25:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C275A2477
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 11:25:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EBF5F3091E55
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 09:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8250377EC1;
	Thu, 21 May 2026 09:18:08 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA9A363C6C;
	Thu, 21 May 2026 09:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779355088; cv=none; b=HlWbqnBeeh4IWnwQhN5I6ihPTIuGTsF1YXYWyhPrf3C/BnObCJLmwOcUqwVzqFstqw8a3YiNoMm8wug4ax1Flk68H1yPjCqF+Nsmv7ztrgT1LS2AqQrF8dPYhKXFxsSiYEiqX6mNRvwCuieFYTSXiyzGAOiri3RLSaxP2zVeQvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779355088; c=relaxed/simple;
	bh=i4l8EYNulAY0ORtjeje6phdH6j/P+gZ7QY5HsMlvAKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Ri74EruwLAKaI5AJfBF7LE1dk3OvRQjiDGf8lfstWVu0lwlEoSwUQmTGK4yF0TmtdYfV6wYWO2J+ct2j2k2JEj+UPjQO5cuktdtjO6hS8Z9q5ViacFYdFYv/EmL4q4rZY8tLGNzHv1UigzYKZjJLO3wYdrqsjFU3ZTVMKEQz+Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 21 May
 2026 17:17:46 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 21 May 2026 17:17:46 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Thu, 21 May 2026 17:17:44 +0800
Subject: [PATCH v5 1/3] dt-bindings: mfd: aspeed,ast2x00-scu: Support
 AST2700 SoC1 pinctrl
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260521-pinctrl-single-bit-v5-1-308be2c160fc@aspeedtech.com>
References: <20260521-pinctrl-single-bit-v5-0-308be2c160fc@aspeedtech.com>
In-Reply-To: <20260521-pinctrl-single-bit-v5-0-308be2c160fc@aspeedtech.com>
To: Linus Walleij <linusw@kernel.org>, Tony Lindgren <tony@atomide.com>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Bartosz Golaszewski <brgl@kernel.org>, "Lee
 Jones" <lee@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>
CC: <patrickw3@meta.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<BMC-SW@aspeedtech.com>, <openbmc@lists.ozlabs.org>, Andrew Jeffery
	<andrew@aj.id.au>, <linux-clk@vger.kernel.org>, Billy Tsai
	<billy_tsai@aspeedtech.com>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779355066; l=1187;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=i4l8EYNulAY0ORtjeje6phdH6j/P+gZ7QY5HsMlvAKA=;
 b=Nbmx+lDLb2q1uArVoP9C1MReK9qGnypQJg1sSYbxBn/ddKzT9YZFmGUmEvz2Am+h/CAhyU3Fx
 6lSnXtpKVDyBfRZleb0DbuzA8V1kMhxOHrkk5WP6m7cS72nVG/zdy4d
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[aspeedtech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[billy_tsai@aspeedtech.com,linux-gpio@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37261-lists,linux-gpio=lfdr.de];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 22C275A2477
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The AST2700 SoC integrates two interconnected SoC instances, each
managed by its own System Control Unit (SCU).

Allow the AST2700 SoC1 pin controller to be described as a child
node of the SCU by extending the compatible strings accepted by
the SCU binding.

There is no functional change to the SCU binding beyond permitting
the aspeed,ast2700-soc1-pinctrl compatible string.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
index 0d5e168b0309..948ba92ef49b 100644
--- a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
+++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
@@ -100,6 +100,7 @@ patternProperties:
             - aspeed,ast2500-pinctrl
             - aspeed,ast2600-pinctrl
             - aspeed,ast2700-soc0-pinctrl
+            - aspeed,ast2700-soc1-pinctrl
 
     required:
       - compatible

-- 
2.34.1


