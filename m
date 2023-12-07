Return-Path: <linux-gpio+bounces-1079-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE177808172
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Dec 2023 08:08:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC38F1C20D63
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Dec 2023 07:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C67F154A0;
	Thu,  7 Dec 2023 07:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="atIfVdYm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF4C9D7F
	for <linux-gpio@vger.kernel.org>; Wed,  6 Dec 2023 23:08:12 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-54c4f95e27fso514821a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 06 Dec 2023 23:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1701932891; x=1702537691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bx/sdnsKumQx6XdP19I/alVAivyipyzs0ZyhJTZLb5E=;
        b=atIfVdYmxCxfrKWv5XsbU7Ivdwh+kvCNIS4lirqhAAuyJaUKgiTwqlGE6WOVnqhM70
         1oXohLQNaVxgtszeqlaPRkudR/+1GKYuemk2/JUrg4iCcnBqtNZOt7RRcT8x6aewP2GV
         LqW6Uka7FjzWKJIKXzxAyoA3u9q8ZZWNOfM24cKYWIlGhbp3ROoTIAepLu4dg6deEvKi
         FZWfJi1qmoLE/rWwTwSRaDCPtcWBNQd8TOVO14Wqg8D1gthYg8om73pWxSILGw4hKMS9
         z8uCyK4B3BseonkBtoH1jz9NhfaCzTmKftnvLYqWKdY/13w6BbAuwUKOYhQfCDDfN4tQ
         EE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701932891; x=1702537691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bx/sdnsKumQx6XdP19I/alVAivyipyzs0ZyhJTZLb5E=;
        b=l/XbM4B6E5MVKgXl6pdr28aDrlxoxmR+LZXqBYr0JSpqbzASe2HPFJqA6ZJgevZpJW
         dnrCxuRdgJ81eYmmcPvHL0oUHLK8JifhUkU2WTxpjX470jHSq5Vw1ANObJgY7LRg8KOh
         SR0MOVRm8MT36VMAf5KuYnA0mTLeBhmFQsCIGxLrC+TGif8nYWOCOIWQAcYuZWaGa/40
         O+wdpcK608A1MIP1ZJIbVUNXd50ANdRahE/bv0rT+y8Y/GHWrpQmbLM3q+qakcsmxlKc
         5pHiQE2/OP5Y98M83QFcTL75EY0hctDioP8ckYoXE9+8+NG00xEd2wq/7+9BNvhU+wlo
         0lrQ==
X-Gm-Message-State: AOJu0YwHANJfcfgQJzgf8QqBl1PpICodVQlOOcCHYXnzWtvZNw/2fLSH
	31N8zMzxTTsAtKniAbHWi8dVhQ==
X-Google-Smtp-Source: AGHT+IHP+wd3l8n2Os8z1MF2DGxaHrRQsX2kNx6ZE8cqbrFBUUQPuzUlvXNzkZPsG6dLuyLv4R/0Ug==
X-Received: by 2002:a05:6402:3185:b0:54c:4837:9035 with SMTP id di5-20020a056402318500b0054c48379035mr1460439edb.45.1701932891279;
        Wed, 06 Dec 2023 23:08:11 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.22])
        by smtp.gmail.com with ESMTPSA id b41-20020a509f2c000000b0054cb88a353dsm420818edf.14.2023.12.06.23.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 23:08:10 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linus.walleij@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	biju.das.jz@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 04/11] pinctrl: renesas: rzg2l: Add pin configuration support for pinmux groups
Date: Thu,  7 Dec 2023 09:06:53 +0200
Message-Id: <20231207070700.4156557-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231207070700.4156557-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231207070700.4156557-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

On RZ/G3S different Ethernet pins need to be configured with different
settings (e.g., power-source needs to be set, RGMII TXC and TX_CTL pins
need output-enable). Commit adjust driver to allow specifying pin
configuration for pinmux groups. With this, DT settings like the following
are taken into account by driver:

eth0_pins: eth0 {
	tx_ctl {
		pinmux = <RZG2L_PORT_PINMUX(1, 1, 1)>;  /* ET0_TX_CTL */
		power-source = <1800>;
		output-enable;
		drive-strength-microamp = <5200>;
	};
};

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

Changes in v2:
- moved num_configs check under num_pinmux check as suggested
- collected Rb tag

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 2eb240b731d5..58786455ecf3 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -376,8 +376,11 @@ static int rzg2l_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 		goto done;
 	}
 
-	if (num_pinmux)
+	if (num_pinmux) {
+		if (num_configs)
+			nmaps += 1;
 		nmaps += 1;
+	}
 
 	if (num_pins)
 		nmaps += num_pins;
@@ -462,6 +465,16 @@ static int rzg2l_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 	maps[idx].data.mux.function = name;
 	idx++;
 
+	if (num_configs) {
+		ret = rzg2l_map_add_config(&maps[idx], name,
+					   PIN_MAP_TYPE_CONFIGS_GROUP,
+					   configs, num_configs);
+		if (ret < 0)
+			goto remove_group;
+
+		idx++;
+	};
+
 	dev_dbg(pctrl->dev, "Parsed %pOF with %d pins\n", np, num_pinmux);
 	ret = 0;
 	goto done;
-- 
2.39.2


