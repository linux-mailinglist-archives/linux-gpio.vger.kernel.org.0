Return-Path: <linux-gpio+bounces-19632-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1CDAAAD9B
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 04:38:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 522B17AAC28
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 02:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48DD03F8A17;
	Mon,  5 May 2025 23:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LD5O5kAD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B3E3BE7D6;
	Mon,  5 May 2025 23:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746487415; cv=none; b=HEikecn7PcDvB/iGJXN+tmh0iMcS4oXypx8Hba3nf32RNkKgZB4FB3oDYm7FAYYnDWUmRs23xwtK0w3tKTjimf4y5vCAXyisJsU+XikOcaJbPX+ceQbf1EAKziC5kj94CTKdD4BQvm5yI+OVCi/z0MD7r2M29lD20kB5rI2fNwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746487415; c=relaxed/simple;
	bh=0zpXg/dv88PnIScM0f8hthu1crIBBf4iKZ46cfJ133E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OKrHF5YaxqTiOInSKXtPQql7OhW08jFUWQLlLAymxhWDR0V2wg+MCm6W6AU2gzFif1fjB9X5C5isWjHYY2qTbvoDyzQNsxPGRWF8EQ4htttHml0TeRgDij86v6/Fd6PoxnfjI9WRmMMocuvF09RViZNQR8ktLwpzJBEZTYry24c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LD5O5kAD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D91E3C4CEED;
	Mon,  5 May 2025 23:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746487414;
	bh=0zpXg/dv88PnIScM0f8hthu1crIBBf4iKZ46cfJ133E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LD5O5kADuzTQuL7vlfywtz4Wpb2LZ+qVbjhFq770Nd9tXnimqsNlaxWZmy7VMExNH
	 zvduD9yR/GxURnc7vE+BzaX4/kMNegu0N9pe4Q6+dAYm77JmSSJ1CT1ocgAr2zFbFE
	 sPd09/IIQ1KriASqHWClIGC2gTAejn/pYCoHTNl8PolBCIFUfH/f+dBmvamV11CCXH
	 utRIuOYdudoRHbkwJBL78AP5JudDraoDL427lV62wxI6JDYr3t8Gsh+Gca185jzMKU
	 Bde881g9+qHaFCGzTkWXLMDEw7L0Z9gdkbWJ8mZBUO3DBxi73PQyzh56EidE86M1I5
	 p8DV7Wrphj5BA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Valentin Caron <valentin.caron@foss.st.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 58/79] pinctrl: devicetree: do not goto err when probing hogs in pinctrl_dt_to_map
Date: Mon,  5 May 2025 19:21:30 -0400
Message-Id: <20250505232151.2698893-58-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505232151.2698893-1-sashal@kernel.org>
References: <20250505232151.2698893-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.293
Content-Transfer-Encoding: 8bit

From: Valentin Caron <valentin.caron@foss.st.com>

[ Upstream commit c98868e816209e568c9d72023ba0bc1e4d96e611 ]

Cross case in pinctrl framework make impossible to an hogged pin and
another, not hogged, used within the same device-tree node. For example
with this simplified device-tree :

  &pinctrl {
    pinctrl_pin_1: pinctrl-pin-1 {
      pins = "dummy-pinctrl-pin";
    };
  };

  &rtc {
    pinctrl-names = "default"
    pinctrl-0 = <&pinctrl_pin_1 &rtc_pin_1>

    rtc_pin_1: rtc-pin-1 {
      pins = "dummy-rtc-pin";
    };
  };

"pinctrl_pin_1" configuration is never set. This produces this path in
the code:

  really_probe()
    pinctrl_bind_pins()
    | devm_pinctrl_get()
    |   pinctrl_get()
    |     create_pinctrl()
    |       pinctrl_dt_to_map()
    |         // Hog pin create an abort for all pins of the node
    |         ret = dt_to_map_one_config()
    |         | /* Do not defer probing of hogs (circular loop) */
    |         | if (np_pctldev == p->dev->of_node)
    |         |   return -ENODEV;
    |         if (ret)
    |           goto err
    |
    call_driver_probe()
      stm32_rtc_probe()
        pinctrl_enable()
          pinctrl_claim_hogs()
            create_pinctrl()
              for_each_maps(maps_node, i, map)
                // Not hog pin is skipped
                if (pctldev && strcmp(dev_name(pctldev->dev),
                                      map->ctrl_dev_name))
                  continue;

At the first call of create_pinctrl() the hogged pin produces an abort to
avoid a defer of hogged pins. All other pin configurations are trashed.

At the second call, create_pinctrl is now called with pctldev parameter to
get hogs, but in this context only hogs are set. And other pins are
skipped.

To handle this, do not produce an abort in the first call of
create_pinctrl(). Classic pin configuration will be set in
pinctrl_bind_pins() context. And the hogged pin configuration will be set
in pinctrl_claim_hogs() context.

Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
Link: https://lore.kernel.org/20250116170009.2075544-1-valentin.caron@foss.st.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/devicetree.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/devicetree.c b/drivers/pinctrl/devicetree.c
index 200357094e3be..e9bfb96a2e0e8 100644
--- a/drivers/pinctrl/devicetree.c
+++ b/drivers/pinctrl/devicetree.c
@@ -141,10 +141,14 @@ static int dt_to_map_one_config(struct pinctrl *p,
 		pctldev = get_pinctrl_dev_from_of_node(np_pctldev);
 		if (pctldev)
 			break;
-		/* Do not defer probing of hogs (circular loop) */
+		/*
+		 * Do not defer probing of hogs (circular loop)
+		 *
+		 * Return 1 to let the caller catch the case.
+		 */
 		if (np_pctldev == p->dev->of_node) {
 			of_node_put(np_pctldev);
-			return -ENODEV;
+			return 1;
 		}
 	}
 	of_node_put(np_pctldev);
@@ -268,6 +272,8 @@ int pinctrl_dt_to_map(struct pinctrl *p, struct pinctrl_dev *pctldev)
 			ret = dt_to_map_one_config(p, pctldev, statename,
 						   np_config);
 			of_node_put(np_config);
+			if (ret == 1)
+				continue;
 			if (ret < 0)
 				goto err;
 		}
-- 
2.39.5


