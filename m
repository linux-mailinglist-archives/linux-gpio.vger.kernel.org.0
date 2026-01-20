Return-Path: <linux-gpio+bounces-30778-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHl5F1BgcGkVXwAAu9opvQ
	(envelope-from <linux-gpio+bounces-30778-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 06:12:48 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A425160B
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 06:12:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 764F36260D9
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 11:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D9D4423A83;
	Tue, 20 Jan 2026 11:43:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D61C423A63;
	Tue, 20 Jan 2026 11:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768909398; cv=none; b=sLhh2zUTvH0hG8qLpA7Tw4hDnIikHAuOEmo/qljyFbxgHW8AD841yP9E/+x2KqWZZnUSpahl63FYD7zCkMP4zPytVYMOGLOy0lZ9YRtit11Lh5fut0RokT/JRjCM+R6lqYYFd4NVICIrBIewC77HXfe7YgcQPfqTqEKdNdHDVQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768909398; c=relaxed/simple;
	bh=DdyR9u8Qi85yC9mqQt4hcDY4TFfwnZrUdwlfhlwek5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=A8nkNSFNyxREbJZi+rZdlfi0+81T3HhCL+sSkttcZI96kqXtZvSOSIdqh65MvW4/oqaXHvoCtuENaWqoUjk6+IHvXYguoCXP8/piGafXSkDDFOYGd0U6wQ6NIwhh094/jD6zlb/znprP3/tJWriJCBa6m79BClTHd1P/uQbP1IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 20 Jan
 2026 19:43:05 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 20 Jan 2026 19:43:05 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Tue, 20 Jan 2026 19:43:05 +0800
Subject: [PATCH v3 1/3] Add compatible strings for AST2700 pinctrl to the
 SCU binding.
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260120-upstream_pinctrl-v3-1-868fbf8413b5@aspeedtech.com>
References: <20260120-upstream_pinctrl-v3-0-868fbf8413b5@aspeedtech.com>
In-Reply-To: <20260120-upstream_pinctrl-v3-0-868fbf8413b5@aspeedtech.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Joel
 Stanley" <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	"Linus Walleij" <linusw@kernel.org>, Billy Tsai <billy_tsai@aspeedtech.com>,
	"Bartosz Golaszewski" <brgl@kernel.org>
CC: Andrew Jeffery <andrew@aj.id.au>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>, <bmc-sw@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768909385; l=1240;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=DdyR9u8Qi85yC9mqQt4hcDY4TFfwnZrUdwlfhlwek5w=;
 b=F8UdHXQ2SCCgYDrPHtnGW0vHCdwhIeAO/iDaOKNIZc5owOxsuTO4H1VkhaN+KoLgCz93rIXF1
 fNnir68QwhsDrrouzcpxFcWoj0eDNpaB76o192k23IvHDUzpxZTbN13
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-Spamd-Result: default: False [1.74 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[aspeedtech.com : No valid SPF, No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[billy_tsai@aspeedtech.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_FROM(0.00)[bounces-30778-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: A3A425160B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

AST2700 consists of two interconnected SoC instances. Each SoC has
its own pinctrl register block, which needs to be described
independently in the device tree.

Introduce "aspeed,ast2700-soc0-pinctrl" for the SoC0 pinctrl, which
follows the same usage model as the existing AST2600 pinctrl.

The SoC1 pinctrl registers follow a regular and predictable layout,
which allows describing them using an existing generic pinctrl
binding without introducing a new SoC-specific compatible string.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
index da1887d7a8fe..ff6cf8f63cbc 100644
--- a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
+++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
@@ -87,6 +87,7 @@ patternProperties:
             - aspeed,ast2400-pinctrl
             - aspeed,ast2500-pinctrl
             - aspeed,ast2600-pinctrl
+            - aspeed,ast2700-soc0-pinctrl
 
     required:
       - compatible

-- 
2.34.1


