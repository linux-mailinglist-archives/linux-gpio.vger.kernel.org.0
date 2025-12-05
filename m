Return-Path: <linux-gpio+bounces-29306-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B38CA93D0
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Dec 2025 21:17:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D09B30F5ACC
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Dec 2025 20:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B7726CE2C;
	Fri,  5 Dec 2025 20:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mail.tikatika.nl header.i=@mail.tikatika.nl header.b="cfXty5bP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from tika.stderr.nl (tika.stderr.nl [94.142.244.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531A625A2A2;
	Fri,  5 Dec 2025 20:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.142.244.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764965814; cv=none; b=YSHjRzKMFN3bTTwqwuBkK+i375qPDAQu4BG0T2+SKhBSSYWiWX1sLkAI/WL9a88LBfxCm6KWrRHbQV/yUA1SQ1fqFVdy4pA4bh53949RCTEyyzm7Ecd24Oy8doPDNxGgqp/ZgTgpTVmpz0FICVQ/fYH/1KMaxDMGWcIWpbw4wN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764965814; c=relaxed/simple;
	bh=H1pkqbtnAmubRqF3JPbkkpaISz3BW4qCIPShfd2Y2tM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pf0j0L2CIA8iboQ2aTOlIF19MDgGvBZaGsuqYPPBPxyiVkuyjz7j4L5z7YJq2GjhIxqBjLIN2/1xK/3IMJxlQxTFT1YeSXa1sDa0iHx1QWv6PyiUP4JPxiKYGQBCc0XAK/fIz+I3bpMy1Lp7Gonfe0aJWARXvu7/g5MSjFKV2yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stdin.nl; spf=none smtp.mailfrom=tika.stderr.nl; dkim=pass (1024-bit key) header.d=mail.tikatika.nl header.i=@mail.tikatika.nl header.b=cfXty5bP; arc=none smtp.client-ip=94.142.244.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stdin.nl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=tika.stderr.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mail.tikatika.nl; s=201709.tika; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XIoqhX0typcqboX+DkDTWXgWFYzdfO7UAmIx4Qh4ho8=; b=cfXty5bPbjRvDtG0+5c2vXuNPt
	azWCtZeHSTE0EyUhRsoQZjiHOn53/wtNPZvdTbdgbsT4ep9e6Ywkrsm63TbOpH7rc5hZmkD/5loaB
	29sq5MqsDKcaZfa0BpRU4JxpnyGAGRdf3xJmnjaNgp3IY1WxfdT310U3IWTM6OzwZtTY=;
X-Preliminary-Spam-Score: -4.3 (----)
Received: from [45.142.19.84] (helo=zozo)
	by tika.stderr.nl with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <matthijs@tika.stderr.nl>)
	id 1vRcEN-00DDbS-2H;
	Fri, 05 Dec 2025 21:16:46 +0100
Received: (nullmailer pid 2868408 invoked by uid 1000);
	Fri, 05 Dec 2025 20:16:43 -0000
From: Matthijs Kooijman <matthijs@stdin.nl>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, linux-gpio@vger.kernel.org, Matthijs Kooijman <matthijs@stdin.nl>, stable@vger.kernel.org
Subject: [PATCH 1/2] gpio: rockchip: Call pinctrl for gpio config
Date: Fri,  5 Dec 2025 21:06:52 +0100
Message-ID: <20251205201254.2865179-4-matthijs@stdin.nl>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251205201254.2865179-2-matthijs@stdin.nl>
References: <20251205201254.2865179-2-matthijs@stdin.nl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pinctrl is responsible for bias settings and possibly other pin config,
so call gpiochip_generic_config to apply such config values. This might
also include settings that pinctrl does not support, but then it can
return ENOTSUPP as appropriate.

This makes sure any bias and other pin config set by userspace (via
gpiod) actually takes effect.


Cc: stable@vger.kernel.org
Signed-off-by: Matthijs Kooijman <matthijs@stdin.nl>

---
 drivers/gpio/gpio-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 47174eb3ba76f..106f7f734b4ff 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -303,7 +303,7 @@ static int rockchip_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 		 */
 		return -ENOTSUPP;
 	default:
-		return -ENOTSUPP;
+		return gpiochip_generic_config(gc, offset, config);
 	}
 }
 
-- 
2.48.1


