Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 580E4124855
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2019 14:26:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726846AbfLRN0D (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Dec 2019 08:26:03 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:46969 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726788AbfLRN0D (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Dec 2019 08:26:03 -0500
Received: by mail-pf1-f193.google.com with SMTP id y14so1195186pfm.13;
        Wed, 18 Dec 2019 05:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=mQvM79wcujGNIpd4aeOU0khxD9KQpsb8Nw6gV8bnRSU=;
        b=EuPrTdPICea62Y0tIErzBNfDUENFZJbz9R5n1Z9b+BF0u3hi7RSPV/M4zGidXYLwsT
         IIdO0kgr6ZIu/TSLnt2IK3XfN9R/afZLO9oRzZTP6692QEDV9KqzI8bFG9jhmyAFwDP0
         OY3RlUnwNxf54R1Dx8AaLmHUtup4+aVviOgIkbZOkHY+PTTlWe86LmWIsWpGNP9A+nug
         JxHbmiN3hX+1pqtS4/1tmISISZAVEgK8mCpQY3T1bKXAi5UTk018bgwR6w9rBOW9hrSy
         GGfdRK+kL7mf2CSYNXpKDLSal8Afbs/HjnAYTorQ72ZsLxU0wT+cd+cGwn+praAGkPcS
         Eksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=mQvM79wcujGNIpd4aeOU0khxD9KQpsb8Nw6gV8bnRSU=;
        b=f330fuY7HrLDPNhCbTYV6+kxL01v7WZljDi/4dPPEd1QtqywAIfKWitatMKBZmxCWo
         thyEdQl4jRy9GbDo2hFV+onO+mMaTqShkCZUbVtAFP3kZUZG7jt2KixsZyHCLQvueDMw
         KmHqmTz5Bw2Yx0jQyr+/2llCYDSur8FR0ij8GIajgLzFJCBnJdw5/eFeVw6pGUhIQqZU
         /EVFyGIwhCmb1JvBvosN/T9v10YwazGvlSKlpOmzrUkFsCbCOj/CfHACDGnOfjrFSdWk
         aaykKDSmJGEsQnVAO/Hd6X4+KY74IZeiEoGSYq4M6LAX1FoA5Vw0bOyxvrgba7FPHGd5
         NAxw==
X-Gm-Message-State: APjAAAX30+EXfNzW3MARekS2wAWbK9hTyZ7hVnvqh6QYJrm5ow0F+6H3
        ZqdhHcydmrrXOagI069xjUY=
X-Google-Smtp-Source: APXvYqyhl40/66a/zQm3aoOEHmBZy0P5ZD0xIBuQlOp+jdCrpW269eX8KVBXPX5kKVuZcqbq9+fNTQ==
X-Received: by 2002:aa7:949a:: with SMTP id z26mr292450pfk.98.1576675562596;
        Wed, 18 Dec 2019 05:26:02 -0800 (PST)
Received: from oslab.tsinghua.edu.cn ([166.111.139.172])
        by smtp.gmail.com with ESMTPSA id l1sm3263770pgs.47.2019.12.18.05.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 05:26:02 -0800 (PST)
From:   Jia-Ju Bai <baijiaju1990@gmail.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [PATCH 1/2] gpio: gpio-grgpio: fix possible sleep-in-atomic-context bugs in grgpio_remove()
Date:   Wed, 18 Dec 2019 21:25:51 +0800
Message-Id: <20191218132551.10537-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The driver may sleep while holding a spinlock.
The function call path (from bottom to top) in Linux 4.19 is:

drivers/gpio/gpiolib-sysfs.c, 796: 
	mutex_lock in gpiochip_sysfs_unregister
drivers/gpio/gpiolib.c, 1455: 
	gpiochip_sysfs_unregister in gpiochip_remove
drivers/gpio/gpio-grgpio.c, 460: 
	gpiochip_remove in grgpio_remove
drivers/gpio/gpio-grgpio.c, 449: 
	_raw_spin_lock_irqsave in grgpio_remove

kernel/irq/irqdomain.c, 243:
	mutex_lock in irq_domain_remove
drivers/gpio/gpio-grgpio.c, 463: 
	irq_domain_remove in grgpio_remove
drivers/gpio/gpio-grgpio.c, 449: 
	_raw_spin_lock_irqsave in grgpio_remove

mutex_lock() can sleep at runtime.

To fix these bugs, gpiochip_remove() and irq_domain_remove() are called
without holding the spinlock.

These bugs are found by a static analysis tool STCheck written by myself.

Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 drivers/gpio/gpio-grgpio.c      | 5 ++++-
 sound/soc/sti/uniperif_player.c | 3 ++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
index 08234e64993a..60a2871c5ba7 100644
--- a/drivers/gpio/gpio-grgpio.c
+++ b/drivers/gpio/gpio-grgpio.c
@@ -448,13 +448,16 @@ static int grgpio_remove(struct platform_device *ofdev)
 		}
 	}
 
+	spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
+
 	gpiochip_remove(&priv->gc);
 
 	if (priv->domain)
 		irq_domain_remove(priv->domain);
 
 out:
-	spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
+	if (ret)
+		spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
 
 	return ret;
 }
diff --git a/sound/soc/sti/uniperif_player.c b/sound/soc/sti/uniperif_player.c
index 48ea915b24ba..62244e207679 100644
--- a/sound/soc/sti/uniperif_player.c
+++ b/sound/soc/sti/uniperif_player.c
@@ -601,13 +601,14 @@ static int uni_player_ctl_iec958_put(struct snd_kcontrol *kcontrol,
 	mutex_unlock(&player->ctrl_lock);
 
 	spin_lock_irqsave(&player->irq_lock, flags);
+	spin_unlock_irqrestore(&player->irq_lock, flags);
+
 	if (player->substream && player->substream->runtime)
 		uni_player_set_channel_status(player,
 					      player->substream->runtime);
 	else
 		uni_player_set_channel_status(player, NULL);
 
-	spin_unlock_irqrestore(&player->irq_lock, flags);
 	return 0;
 }
 
-- 
2.17.1

