Return-Path: <linux-gpio+bounces-32133-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mN4OB1irnWmgQwQAu9opvQ
	(envelope-from <linux-gpio+bounces-32133-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 14:44:56 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CF784187F07
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 14:44:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7679F30FBA91
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 13:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D225839E6C9;
	Tue, 24 Feb 2026 13:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="RLa3NCk0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447C239E183;
	Tue, 24 Feb 2026 13:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771940398; cv=none; b=QukkNhT9DpdmHy8EE0o8op8kaOga+kctPEPYlvtCEp/km7HTCUWsLav5NKTCI/XVM/tyIIony4MOH+BixqbjkHMvrr0SvUTERTaIX+OjjlZp9M95KO5JEoaYg7u0z/sTyZDwjrR2qib84nOZvKIBCBEbB2C+N3jJxz/GEFfdwCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771940398; c=relaxed/simple;
	bh=2yRZ6SJ6G23viEtD3vhyomoLcT5RhSxWj+BYUdCot24=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q26cWabz/lCx0UpaDOPfjs2M9/F3nrymiC/KvEnRHLKsIboIV0h8a5lQuZejqgPeEs6u5RDn9qNzePzF06ftHv19AmQGBSvvUX1mkzsbg/n0LNOu48mBeOHyQHeRg6NVRRQ+x+HJWdrsT4eG0ZyfSz5AJlrEsMN7RnMM0lAi8eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=RLa3NCk0; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1771940397; x=1803476397;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2yRZ6SJ6G23viEtD3vhyomoLcT5RhSxWj+BYUdCot24=;
  b=RLa3NCk0FADxybvV7SMow3Q/QgJZ0nyOKR+OOxI2vYhvPdlDyliUiXCo
   U9siubYTA4g4EkmM0ioStg8w3HKbyjHZi1GXdY31CVdmbM8K/RLjVUcFW
   n/3n+vGz+azHXS+Qa6T4K4Fk2ix9jtVdhgl98jr5Am/mWIUXmTr2FPmPu
   wPC30n/hdVCj25dZKgz+CyUA4zcfxhsUh3tQyvaZ3DNpGv2BgCgj/o1DS
   AfvM5MVJkOgryPWHwX1F6N2aa8JaGySyBvDNYvIoo3Q3K2CVgUBEwTm47
   RpyiCjbXyZsCnuayUS4PoVQoefgYPuRBNQVnU25i0hCztqTwWnReaG+ph
   A==;
X-CSE-ConnectionGUID: 1FlpOl2WSoSIXpPLSoXJig==
X-CSE-MsgGUID: +/qcNtWSRA2Q1xdaKaIbEA==
X-IronPort-AV: E=Sophos;i="6.21,308,1763449200"; 
   d="scan'208";a="53771064"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 06:39:55 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Tue, 24 Feb 2026 06:39:38 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 24 Feb 2026 06:39:37 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linusw@kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [RESEND PATCH v2 1/2] pinctrl: pinconf-generic: perform basic checks on pincfg properties
Date: Tue, 24 Feb 2026 13:39:04 +0000
Message-ID: <20260224-icy-gently-6177bfcc46d4@wendy>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260224-stimulate-fraying-29ac76f6c55e@wendy>
References: <20260224-stimulate-fraying-29ac76f6c55e@wendy>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3546; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=2yRZ6SJ6G23viEtD3vhyomoLcT5RhSxWj+BYUdCot24=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDJlzV/6cYGzqvju8KEAr/o7dwncT7te05nDmuS1awHZHeDJD uNq8jlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExEw56R4QnXereKGdfeCNTO+bymrk NnVfxHlh3qgXuOBmVmT1A0tWNk6Go48jnzs1nQWVu1hsSULZ2+1/bYnrm5tf1jAF9h/Fd7PgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32133-lists,linux-gpio=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[conor.dooley@microchip.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[microchip.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,microchip.com:email,microchip.com:dkim]
X-Rspamd-Queue-Id: CF784187F07
X-Rspamd-Action: no action

Some pinconf properties are mutually exclusive, either because they
convey the same information in different units or represent incompatible
configurations of the same pin. Attempt, in two ways, to prevent these
situations.

Firstly, for enable/disable properties, produce an error if both are
set. Since enable/disable properties share the same enum value, they can
be trivially checked via the newly added bitmap. Having both enable and
disable for the same config makes no sense at all, so produce an error
in this case.

For interactions between properties, doing them outside the loop makes
more sense as it can be evaluated once. In case there are some edge
cases that would be broken by producing an error, only warn for now.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/pinctrl/pinconf-generic.c | 41 ++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index 94b1d057197c6..30475da0fd10b 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -222,7 +222,10 @@ static int parse_dt_cfg(struct device_node *np,
 			unsigned int count, unsigned long *cfg,
 			unsigned int *ncfg)
 {
-	int i;
+	unsigned long *properties;
+	int i, test;
+
+	properties = bitmap_zalloc(count, GFP_KERNEL);
 
 	for (i = 0; i < count; i++) {
 		u32 val;
@@ -251,11 +254,45 @@ static int parse_dt_cfg(struct device_node *np,
 		if (ret)
 			val = par->default_value;
 
+		/* if param is greater than count, these are custom properties */
+		if (par->param <= count) {
+			ret = test_and_set_bit(par->param, properties);
+			if (ret) {
+				pr_err("%s: conflicting setting detected for %s\n",
+				       np->name, par->property);
+				bitmap_free(properties);
+				return -EINVAL;
+			}
+		}
+
 		pr_debug("found %s with value %u\n", par->property, val);
 		cfg[*ncfg] = pinconf_to_config_packed(par->param, val);
 		(*ncfg)++;
 	}
 
+	if (test_bit(PIN_CONFIG_DRIVE_STRENGTH, properties) &&
+			test_bit(PIN_CONFIG_DRIVE_STRENGTH_UA, properties))
+		pr_err("%s: cannot have multiple drive strength properties\n",
+		       np->name);
+
+	test = test_bit(PIN_CONFIG_BIAS_BUS_HOLD, properties) +
+		test_bit(PIN_CONFIG_BIAS_DISABLE, properties) +
+		test_bit(PIN_CONFIG_BIAS_HIGH_IMPEDANCE, properties) +
+		test_bit(PIN_CONFIG_BIAS_PULL_UP, properties) +
+		test_bit(PIN_CONFIG_BIAS_PULL_PIN_DEFAULT, properties) +
+		test_bit(PIN_CONFIG_BIAS_PULL_DOWN, properties);
+	if (test > 1)
+		pr_err("%s: cannot have multiple bias configurations\n",
+		       np->name);
+
+	test = test_bit(PIN_CONFIG_DRIVE_OPEN_DRAIN, properties) +
+		test_bit(PIN_CONFIG_DRIVE_OPEN_SOURCE, properties) +
+		test_bit(PIN_CONFIG_DRIVE_PUSH_PULL, properties);
+	if (test > 1)
+		pr_err("%s: cannot have multiple drive configurations\n",
+		       np->name);
+
+	bitmap_free(properties);
 	return 0;
 }
 
@@ -352,6 +389,7 @@ int pinconf_generic_parse_dt_config(struct device_node *np,
 	ret = parse_dt_cfg(np, dt_params, ARRAY_SIZE(dt_params), cfg, &ncfg);
 	if (ret)
 		return ret;
+
 	if (pctldev && pctldev->desc->num_custom_params &&
 		pctldev->desc->custom_params) {
 		ret = parse_dt_cfg(np, pctldev->desc->custom_params,
@@ -360,6 +398,7 @@ int pinconf_generic_parse_dt_config(struct device_node *np,
 			return ret;
 	}
 
+
 	/* no configs found at all */
 	if (ncfg == 0) {
 		*configs = NULL;
-- 
2.51.0


