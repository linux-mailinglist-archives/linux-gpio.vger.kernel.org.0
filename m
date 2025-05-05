Return-Path: <linux-gpio+bounces-19629-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE2CAAACD6
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 04:24:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 020C11B68153
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 02:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 271973CDBA3;
	Mon,  5 May 2025 23:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cV0DC2NI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BF028A73C;
	Mon,  5 May 2025 23:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746487026; cv=none; b=JOToXobNitvsIN1g+gBbOgbVu480E6wuW7nNeCsyrUgEV81VuQ5fti4tFXSqdtC6+aK9eep34h2Lz7y8hobhUqW15dEvB7zafKiwZCt/sBOo6CAqepAtM4X7CIGbWQ1eA2A/suozO99dyheNE32COnXyfhhalNwXshmyjsHg0Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746487026; c=relaxed/simple;
	bh=Lz96IMezMgkbCz8GTPWpiYh8XEo+mx5noJ7sVQUzPiM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WQRTwPI8XWEM7mvBpW+Pl0HRNaGLEx1vwzMExajMO8eVXeOibv3quSsedKTiYeetxB8mq0WEnUJsLyJRlsNlwXdRtJTI0sHA+ogLdfadxlbgVrsdA+RinkF+0vS5+n6GbhYDdO8X5rDKFLuLcs28Y5UMCl8Lr2l+eq3YnE5M01c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cV0DC2NI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D95FC4CEED;
	Mon,  5 May 2025 23:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746487025;
	bh=Lz96IMezMgkbCz8GTPWpiYh8XEo+mx5noJ7sVQUzPiM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cV0DC2NI/Ri+aBKwSPcF19rPl2aHU9n9pfYQYvcazNCJSklOsFbdEHt+rIR99eo4q
	 ht+gUfbtvt14/oOionGSXcGDWszS6uNVlkZiBuhff2GV4jSx5JZ4JJ7TNiP6dB6C3+
	 Sq3jwOjmKk8Es/SQVHbLQJ3h/qAnlqEtAWvNNVEU8bcbg0LkUECoEKOZz+jxcGqPLs
	 8Oc5ej6WsUTA8MmXm+gsaLwNMsxcUV5LFklN/A9mOd61J7+WdN9/Lz1+cSkre+kN+k
	 YHVu2H4UQCpt02kUn3MIKfrxCmchj43ZDAYO4KGevVCgXduD8Y1VC8frZhClYd+zgR
	 kRu2YWmiuf9Ug==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Valentin Caron <valentin.caron@foss.st.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 115/153] pinctrl: devicetree: do not goto err when probing hogs in pinctrl_dt_to_map
Date: Mon,  5 May 2025 19:12:42 -0400
Message-Id: <20250505231320.2695319-115-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505231320.2695319-1-sashal@kernel.org>
References: <20250505231320.2695319-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.181
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
index 0220228c50404..d9279fc7be832 100644
--- a/drivers/pinctrl/devicetree.c
+++ b/drivers/pinctrl/devicetree.c
@@ -143,10 +143,14 @@ static int dt_to_map_one_config(struct pinctrl *p,
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
@@ -265,6 +269,8 @@ int pinctrl_dt_to_map(struct pinctrl *p, struct pinctrl_dev *pctldev)
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


