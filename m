Return-Path: <linux-gpio+bounces-37722-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OUmMhT7GmoZ+QgAu9opvQ
	(envelope-from <linux-gpio+bounces-37722-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2026 16:58:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 894CC60D9A5
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2026 16:58:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BC2183014347
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2026 14:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74488314D21;
	Sat, 30 May 2026 14:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="myT0clkv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE90331197C
	for <linux-gpio@vger.kernel.org>; Sat, 30 May 2026 14:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780153092; cv=none; b=jzSWZpyyiWHmqTJAkz2b1puZmFAZPh6b5J2xva9vtNLPjtm2NrzqjZ9y8dQHBgUlIKtjpw4xzFKMwOLvD+RSE9kObHqJMdZgjtWN9EjxrN6LKqMWg4F0bhc/WV0Bc4TR5Dukhg/bztZyo0C5QnvYzPNkS04cCfb6jXpQE3mglfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780153092; c=relaxed/simple;
	bh=LaSZy4tAMF/OIeKnicst81GeQ4Uzqc4SwQUQiLMnA1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KI3sGzMXew+GYM+8fz0ymVe6z3jErI3Ts7e+XOKEHfXUyGHtBGnwKXtlysUTaPvHfQ6B/pJiBYqav/BOl0rE5OTUqVC8xvCHVfv39YaR7caPP0/jpkMIiARdOLnlpPHbgxzR48OHyFb0BWyHN/djPnaJX81Q/HAC0j2Wn2YLzZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=myT0clkv; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-441209fb77eso9106068f8f.1
        for <linux-gpio@vger.kernel.org>; Sat, 30 May 2026 07:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780153089; x=1780757889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r32fsRHaMPradn/MupXc1NKlCK5+0PUCZmgy8fvmlC0=;
        b=myT0clkvizDLtb0TsxST/nea0ocUR+ILNbklafRTLZ3rQcshEHSj04lRl5teM+JeTN
         W1XeTDBcqLJrRO7wYYFI/ROn6af1+AQXBzEu+IXdhfXlOMkU/PRy9GtjYmoS6PcKjmaI
         kdCn3wlMZStpHORUzom55nT4hc82aQLNrxO3s02mzi1qOvrXLTpum3o5RVntuoYcPsNB
         MLI8f8NceBl+Xcqo/FEQTkjA9WQ77xEV3ovaxYQ0kf/PClL4W+V4n87k4ykk3ExF2UfW
         EUZLf/+VNrIsoRvZ9InEM0Z5W5emwy/Ny0n/Op748yuO0riuOiBW4y4B4PiMUQl18ltI
         1daA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780153089; x=1780757889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r32fsRHaMPradn/MupXc1NKlCK5+0PUCZmgy8fvmlC0=;
        b=CBZr0ljLvt14Do+8s6TChGWyVas0r9SmWiBDbCWg+YHBjnUSrpRz4+fubSYgplaNtC
         IS+aLsyz02XPhJt0TmVIatq7j5QPj5W7783e9L5leF0f3RZzF7Y81SnWpQACg1tpR+SH
         dsxj3teWBCCJXRWv+daEYWjn+8Eddzq7IMKOkUC5bZp2iV81z01WRHT566CLuFdc0Kku
         6llUJ9s52rEebSPqCrBW5sVyVNcl+KpPAkLRasVw+/9KFhi7AWKM/eWM3TtbJme8hKcI
         RKW3fR3h5mzoFKiDCmY4RnIuBsfGNNUZsLrmZxy8roe8bqcQKbp+HVObrRwSsP+tCYBf
         D+TQ==
X-Forwarded-Encrypted: i=1; AFNElJ/u7H4q+Y19QZfU39UMG+Yo09YzG09URLvQ52Q1eomD2a4CmttcF0cluoBXBdIRElQz8TiUvsOoaIfN@vger.kernel.org
X-Gm-Message-State: AOJu0Yx52nUDqnBgBzMte254UgGPbo9V92egVL+twc7x/tZF4nMTQDbq
	fjfxP+hyxU2AdBbJwdpwdKNbOrM7HJcGki2Lz864Kb9O6PHtzoAgD3FV
X-Gm-Gg: Acq92OGiF64KXzYmal6Rqzps9ivqHYVjB8pSWbOkpM412eiCEiAdxKA6Z8oOOBh8aAr
	s10uuUC9eUIvhHU7XzuS58eOPRH2CdjeeNxTPiqOi1HUyNZxR5R+qMxw638m9xR2AYa76xPCyxO
	YgBo5B+UfgS51E9lA5uGl73xjWvdkhGW/ST+pncPMXqC2xjv40rANX4y0QuOXAHiYdg0Ow4Y/Vp
	1D4fYZJX5+G6B/8odkHxk4wkyxdN4I1oPxUj3Z6dZBoAJzE9lwkPKZM36KMYqFz7KQ0r5lbWUfZ
	v0AEO+NMmcVOwf33m09KLpUZMlCyEy89+j7kkTBDD8m/gLEv97NtKhf6zHie7Y17QLioWO3c1He
	mneMjkk5tdqpKCUkIzScXgrmVTtlIQijIWm+Phx91yuA6WxoDwFQY6x/Zkst8VUu8uGsDUeJShn
	4TUC3cqhBcU3e6QWdZSHFlYAW4jLXciKw=
X-Received: by 2002:a05:6000:40c5:b0:45a:5392:3a19 with SMTP id ffacd0b85a97d-45ef13794fcmr12535168f8f.16.1780153089159;
        Sat, 30 May 2026 07:58:09 -0700 (PDT)
Received: from zenbook ([31.4.224.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354b5bdsm10916493f8f.21.2026.05.30.07.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 07:58:08 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Teng <andy.teng@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 1/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Pull pinctrl node changes from MT6795 document
Date: Sat, 30 May 2026 16:57:53 +0200
Message-ID: <20260530145800.1029920-2-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530145800.1029920-1-y.oudjana@protonmail.com>
References: <20260530145800.1029920-1-y.oudjana@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37722-lists,linux-gpio=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[protonmail.com,lists.infradead.org,vger.kernel.org];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com,mediatek.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yassineoudjana@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[protonmail.com:mid,protonmail.com:email]
X-Rspamd-Queue-Id: 894CC60D9A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Yassine Oudjana <y.oudjana@protonmail.com>

mediatek,pinctrl-mt6795.yaml has different node name patterns which match
bindings of other MediaTek pin controllers, ref for pinmux-node.yaml which
has a description of the pinmux property, as well as some additional
descriptions for some pin configuration properties. Pull those changes
into mediatek,mt6779-pinctrl.yaml and adjust the example DTS to match in
preparation to combine the MT6795 document into it.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 38 ++++++++++++++-----
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index f4bab7a132d3..0dcbca5ca8f9 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -111,12 +111,12 @@ allOf:
         - "#interrupt-cells"
 
 patternProperties:
-  '-[0-9]*$':
+  '-pins$':
     type: object
     additionalProperties: false
 
     patternProperties:
-      '-pins*$':
+      '^pins':
         type: object
         description:
           A pinctrl node should contain at least one subnodes representing the
@@ -124,7 +124,9 @@ patternProperties:
           pins it needs, and how they should be configured, with regard to muxer
           configuration, pullups, drive strength, input enable/disable and input
           schmitt.
-        $ref: /schemas/pinctrl/pincfg-node.yaml
+        allOf:
+          - $ref: pinmux-node.yaml
+          - $ref: pincfg-node.yaml
 
         properties:
           pinmux:
@@ -135,9 +137,25 @@ patternProperties:
 
           bias-disable: true
 
-          bias-pull-up: true
-
-          bias-pull-down: true
+          bias-pull-up:
+            oneOf:
+              - type: boolean
+              - enum: [100, 101, 102, 103]
+                description: Pull up PUPD/R0/R1 type define value.
+            description: |
+              For normal pull up type, it is not necessary to specify R1R0
+              values; When pull up type is PUPD/R0/R1, adding R1R0 defines
+              will set different resistance values.
+
+          bias-pull-down:
+            oneOf:
+              - type: boolean
+              - enum: [100, 101, 102, 103]
+                description: Pull down PUPD/R0/R1 type define value.
+            description: |
+              For normal pull down type, it is not necessary to specify R1R0
+              values; When pull down type is PUPD/R0/R1, adding R1R0 defines
+              will set different resistance values.
 
           input-enable: true
 
@@ -221,8 +239,8 @@ examples:
             #interrupt-cells = <2>;
             interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
 
-            mmc0_pins_default: mmc0-0 {
-                cmd-dat-pins {
+            mmc0_pins_default: mmc0-pins {
+                pins-cmd-dat {
                     pinmux = <PINMUX_GPIO168__FUNC_MSDC0_DAT0>,
                         <PINMUX_GPIO172__FUNC_MSDC0_DAT1>,
                         <PINMUX_GPIO169__FUNC_MSDC0_DAT2>,
@@ -235,11 +253,11 @@ examples:
                     input-enable;
                     mediatek,pull-up-adv = <1>;
                 };
-                clk-pins {
+                pins-clk {
                     pinmux = <PINMUX_GPIO176__FUNC_MSDC0_CLK>;
                     mediatek,pull-down-adv = <2>;
                 };
-                rst-pins {
+                pins-rst {
                     pinmux = <PINMUX_GPIO178__FUNC_MSDC0_RSTB>;
                     mediatek,pull-up-adv = <0>;
                 };
-- 
2.54.0


