Return-Path: <linux-gpio+bounces-19639-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 31278AAB47C
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 07:07:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8C8B4A4333
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 05:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B3A447AC2F;
	Tue,  6 May 2025 00:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hjRlpCqj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E5A3899F2;
	Mon,  5 May 2025 23:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486702; cv=none; b=qR95v898vvSjyjtdCdEtuRbDQy2qpmKlYSuStgf6SewY6uqYh71+LErnW+2It1weTqjJIo0qwW3q/ygL5KDcOf4gFf9DOv6goBtMj8KuJa2ZgrKHOr20jefF83lCrDV4PfKPnZleXyN2zQChPIqA8LXfeGukfpGc9h8vWUz/euM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486702; c=relaxed/simple;
	bh=l/fE66EQd0oDkDJxz9EZ4fSDv3180mfWuZEG3FfUzVg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rp6pSAWLa5e/WSMdf/J3BucSk9FTsTquQ63Aa4A46fbN3aqdSmvlJxJmJxP1o2h7lC6CYIIv2rZYUkKjUjzmD9WRn2xqB3C5CfZYXuUniW9pZ+vQRKqyPEk4Hffx3UMQ9tY2lVMuOLtpaKD+lR0464KvWF4+lOWhRzkkQMpNr/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hjRlpCqj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02BE4C4CEED;
	Mon,  5 May 2025 23:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486701;
	bh=l/fE66EQd0oDkDJxz9EZ4fSDv3180mfWuZEG3FfUzVg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hjRlpCqj9ECQ+2x8oXE6jNx80Mn8PJ+vcLHWy1guMlofiq+sl8a/qwguSAuniltzi
	 ryrcYEak2APysIZ0XW4rKU1FoUPptCqLZw72srnLhfGyZ/bSNjq3Ge9oHZ1kJ0uKPt
	 I8VgaDVfzLLB5m5xlf2Mgj9/mXbahbCceU83qoFbltNK6+hEKVtUMmthBplr93O9mo
	 PsIyh6Phy2qo2lsyjzzMYPHcZQECIq0w/BOaNE07/6Fc9mWcUjDwBmK0mgI1mS0rVU
	 6hLruVff1ooX40uuwz7VsmQqG3QXPEgsnAR1rcvrajI96F9B4XgrkXJXoO8lHlIEFF
	 ycYhuTvw96moQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Valentin Caron <valentin.caron@foss.st.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 160/212] pinctrl: devicetree: do not goto err when probing hogs in pinctrl_dt_to_map
Date: Mon,  5 May 2025 19:05:32 -0400
Message-Id: <20250505230624.2692522-160-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505230624.2692522-1-sashal@kernel.org>
References: <20250505230624.2692522-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.136
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
index 5ee746cb81f59..6520b88db1105 100644
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


