Return-Path: <linux-gpio+bounces-6968-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 624FC8D5139
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 19:42:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85C031C231FC
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 17:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FBA1482D7;
	Thu, 30 May 2024 17:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VxWF5Qrc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFEB4F5FE;
	Thu, 30 May 2024 17:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717090917; cv=none; b=K0Xcj6a2NiTo6Y8TkMYi5+uySh8DOpEhDM5y3/12aBLFrLjhc6Y9DNBbXp99dbhtTtZJ6o05N1pfg5KzOz4T00X6LSa63OCR3cVreil1Lt4DsoJRdoT8UU6AHRGJhvfweyeoBn2kuX3vknUfsr9f+lWMKclPMLLQlxjIsP+lJ6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717090917; c=relaxed/simple;
	bh=3+wWWlylxn2raLlyLx8WctR838XlUJwYs3q4PDxMLKw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZegrfOY7ppDSQwMW0Sq90VOcWq3xS82X4QigaX0qc+wx7ad0PnHMxjJTeUSVW/XAaBp8v5JF1A69dshIf0CbxPVEkUG+RaELWB1/KDLYFygRk3CbMUJ9kxgBXmc+8mZtEKB2XlJeSdkO9GEkIAChRPdhBrpzzxfCazmS+hQC3a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VxWF5Qrc; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7022bfbb329so955295b3a.0;
        Thu, 30 May 2024 10:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717090916; x=1717695716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8dl4efaMd6PG7V2ds0yvRn9ev5wtsAt+KazWwpZSZig=;
        b=VxWF5QrcWOwCVTDXfkfzHFW5SvH4pWNyWtDKnUiNxQDqMa/A+VfprT5ruLgIuIo6hq
         LA8LGZjoNT5eFKh3+09k34zRF7Y+6XvB5UMauRfh9IVoFW0pbf5K9l/N3W7C8Rmh3Fsk
         ShVY2kcvzzV3AMPPcx8fPv+Ds83piMw15Uempjs+IJC5v3zjR4vW1medtjYXT9rYKvFb
         2Oh1ykWlaypZGuvQVBGDe4McZ8jIrGqQ9JcYRWrp74d39b1J/oiErUq711V3ocEwri5b
         AAmUso70AReY72Bjhsz94nz0wNtU7iHNs8LdXQ38IVgYqI62vcq1fLQLHlZnl1kLc5ie
         2IZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717090916; x=1717695716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8dl4efaMd6PG7V2ds0yvRn9ev5wtsAt+KazWwpZSZig=;
        b=wsHv8BRpBJmSiU0jyTbElj7zWo0N84YA12wLuzbfztM7cuQgPkxHFSYlfrCCtJDSfl
         IrwEx0doh57qLep2I3sxbMZe+J510SpnopfhOIjL+tMjgVDwgl/zIxXb6m5O52qRgPCe
         CUXt+TTq+qR8U456hvwh0favEtMMOgmSUfsr9+mmKZY0tw0Cw7CdYzzEZD85dvPthpQ4
         VelqeEm5CH02rvmR1EmPLqt6VfapeYuB4suPwn/Hasd8G2z6X09Cw8XmdeaI/v7jKLDu
         Nur1jRIVn7093jEzB4LrOtzz4+4Vua8nBhMvCG4wpdnyj2IIKk/OvkVNfaTzYG/Kai49
         0Xzg==
X-Forwarded-Encrypted: i=1; AJvYcCVvgJd0jHYwIZ+091UjGYQdMdRxLMb02j0BXCn8YefaXHcnRZ0msmZJBNKn9ZhOoeZzwUmZbuqiav8jRljZjF1HictiO6lAGJcmwa9i/RIu7XDGHA0VvXQAu7sbK+f/ecrVd+dURgBWXAh3yZ2GJIsRSExAq6dn8S+mj7GIszMFTsx0+JU=
X-Gm-Message-State: AOJu0YzuPQTz2ClNF3I7K9FnZ9FWNv8nq5hId1ubQrHV5KSUenAEJNAa
	L55ehcXt4fqLP1abNC9FqNJJFh+1mt7BQ66UhiMpXw6WcVXdiuIE
X-Google-Smtp-Source: AGHT+IEKZ4ZALznb5HGONKn7x8aCOFbdDf8+QAoeuT36TK5j+2lREX+ESCaT2IWmu9cA0wsELnF1UA==
X-Received: by 2002:a17:902:680e:b0:1f4:af80:7a3a with SMTP id d9443c01a7336-1f61bf8fa40mr37336795ad.25.1717090915572;
        Thu, 30 May 2024 10:41:55 -0700 (PDT)
Received: from prasmi.. ([2401:4900:1c07:3bcb:e05d:a577:9add:a9ce])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63240c947sm450105ad.269.2024.05.30.10.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 10:41:55 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 03/15] pinctrl: renesas: pinctrl-rzg2l: Allow more bits for pin configuration
Date: Thu, 30 May 2024 18:38:45 +0100
Message-Id: <20240530173857.164073-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The pin configuration bits have been growing for every new SoCs being
added for the pinctrl-rzg2l driver which would mean updating the macros
every time for each new configuration. To avoid this allocate additional
bits for pin configuration by relocating the known fixed bits to the very
end of the configuration.

Also update the size of 'cfg' to 'u64' to allow more configuration bits in
the 'struct rzg2l_variable_pin_cfg'.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3
- Updated size for cfg in struct rzg2l_variable_pin_cfg

RFC->v2
- Merged the macros and rzg2l_variable_pin_cfg changes into single patch
- Updated types for the config changes
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 30 ++++++++++++++-----------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 169986022a73..fe810d8dfa58 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -78,9 +78,9 @@
 					 PIN_CFG_FILNUM | \
 					 PIN_CFG_FILCLKSEL)
 
-#define PIN_CFG_PIN_MAP_MASK		GENMASK_ULL(35, 28)
-#define PIN_CFG_PIN_REG_MASK		GENMASK(27, 20)
-#define PIN_CFG_MASK			GENMASK(19, 0)
+#define PIN_CFG_PIN_MAP_MASK		GENMASK_ULL(62, 55)
+#define PIN_CFG_PIN_REG_MASK		GENMASK_ULL(54, 47)
+#define PIN_CFG_MASK			GENMASK_ULL(46, 0)
 
 /*
  * m indicates the bitmap of supported pins, a is the register index
@@ -102,8 +102,8 @@
  * (b * 8) and f is the pin configuration capabilities supported.
  */
 #define RZG2L_SINGLE_PIN		BIT_ULL(63)
-#define RZG2L_SINGLE_PIN_INDEX_MASK	GENMASK(30, 24)
-#define RZG2L_SINGLE_PIN_BITS_MASK	GENMASK(22, 20)
+#define RZG2L_SINGLE_PIN_INDEX_MASK	GENMASK_ULL(62, 56)
+#define RZG2L_SINGLE_PIN_BITS_MASK	GENMASK_ULL(55, 53)
 
 #define RZG2L_SINGLE_PIN_PACK(p, b, f)	(RZG2L_SINGLE_PIN | \
 					 FIELD_PREP_CONST(RZG2L_SINGLE_PIN_INDEX_MASK, (p)) | \
@@ -241,9 +241,9 @@ struct rzg2l_dedicated_configs {
  * @pin: port pin
  */
 struct rzg2l_variable_pin_cfg {
-	u32 cfg:20;
-	u32 port:5;
-	u32 pin:3;
+	u64 cfg:47;
+	u64 port:5;
+	u64 pin:3;
 };
 
 struct rzg2l_pinctrl_data {
@@ -1081,7 +1081,8 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 	const struct pinctrl_pin_desc *pin = &pctrl->desc.pins[_pin];
 	u64 *pin_data = pin->drv_data;
 	unsigned int arg = 0;
-	u32 off, cfg;
+	u32 off;
+	u64 cfg;
 	int ret;
 	u8 bit;
 
@@ -1185,7 +1186,8 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 	u64 *pin_data = pin->drv_data;
 	enum pin_config_param param;
 	unsigned int i, arg, index;
-	u32 cfg, off;
+	u32 off;
+	u64 cfg;
 	int ret;
 	u8 bit;
 
@@ -2413,9 +2415,9 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
 
 	for (u32 port = 0; port < nports; port++) {
 		bool has_iolh, has_ien;
-		u32 off, caps;
+		u64 cfg, caps;
 		u8 pincnt;
-		u64 cfg;
+		u32 off;
 
 		cfg = pctrl->data->port_pin_configs[port];
 		off = RZG2L_PIN_CFG_TO_PORT_OFFSET(cfg);
@@ -2459,12 +2461,14 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
 static void rzg2l_pinctrl_pm_setup_dedicated_regs(struct rzg2l_pinctrl *pctrl, bool suspend)
 {
 	struct rzg2l_pinctrl_reg_cache *cache = pctrl->dedicated_cache;
+	u64 caps;
+	u32 i;
 
 	/*
 	 * Make sure entries in pctrl->data->n_dedicated_pins[] having the same
 	 * port offset are close together.
 	 */
-	for (u32 i = 0, caps = 0; i < pctrl->data->n_dedicated_pins; i++) {
+	for (i = 0, caps = 0; i < pctrl->data->n_dedicated_pins; i++) {
 		bool has_iolh, has_ien;
 		u32 off, next_off = 0;
 		u64 cfg, next_cfg;
-- 
2.34.1


