Return-Path: <linux-gpio+bounces-39686-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SY2aLBTUTmq2UwIAu9opvQ
	(envelope-from <linux-gpio+bounces-39686-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 00:49:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F4172AF4A
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 00:49:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=jT+gqW2k;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39686-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39686-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E982F306CF3F
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2026 22:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50ABE3769F4;
	Wed,  8 Jul 2026 22:48:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC46D30C618
	for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2026 22:48:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783550909; cv=none; b=JLw0kGH1BZHfzdv/LfI3ikUNhV6TIj3JAmi/c+FxsbNagXdBzBPfdp/XWLRz/KI4U9qvqLTM3uUZSruRl2ASK3uVnlXzoWuXwpl1ZEuXRUlcIc5nqreFfU5APEZVq1rf9GE1Y+FKYSqHqWtvHArMYCQAAcMjd6RQnAUvEYFB0NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783550909; c=relaxed/simple;
	bh=nQX/Kn5G3ZH/L8fZkAmyxEeI7mV90VwZj8IHlC9nZec=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oyGnXAddAVNNFpDK/nP2Hb0yDZJXi9Q5doPnTrMRTHskeoCC0cGfUg0GzXd8VxW/GFSOXBHzK9i6qE+xw6TlpwxWYgU2PGNuuRXEwaTtS1WG9tT+2TX4Ukr/NUJksLitF45GprifZrNtM0gHD82P9FitjcVjLwFnO4fkYw783Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jT+gqW2k; arc=none smtp.client-ip=209.85.160.171
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-51c01089e8aso6966701cf.2
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2026 15:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783550907; x=1784155707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kOIU/Q+WQzJvS79ZfIzIzsTDKkVRFJ8CsUMjqnigyQI=;
        b=jT+gqW2kll22Bsbpkqz4PTNYbdZVjVl2k8/uyCEd3pE5AHgM0v2hROI1ZR98zkBGDY
         aAMTqnmpjHd+yXKLMe1c+bAh9Ny36tz9OmdUfVUToM3IhcDw6+kBRflu+zEFOR91eIyl
         uYY5XGQdZnu7v59eVLeeRW72xVrGDBpsXrJxXGCKg73bDznjFyL/Hluw3linfZog/8VB
         g2gYxLuv1mA5IdfydwGHIFSFRilzJmeJ445i2ukuXIZAPLyPpw7l6khlgCdDSoWAS0cU
         MDch8H8O+MxmpR4doaIT4VsvwjWpwa7BdE0liZ98d+WjerhVYvHKAaBn8DtKiQ7bxe2t
         Ttmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783550907; x=1784155707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kOIU/Q+WQzJvS79ZfIzIzsTDKkVRFJ8CsUMjqnigyQI=;
        b=CSZ+0Q6ghev/OcqRN6viYC6oKD6SCUcwKc8dZ1baN+JWxNjuFPCsznQ1W3VQFSbe9s
         AMAgZRIHzvvDJai5aaRCmQVHFndLQN/hC8AZ4OWVqWFCrj8WsmW3fUjN9j3Zrd5sXTyk
         4X1PXNah5HMDp99UWqOsguNEa+qBSysNKEm2v8fH4kzagQ9/HGAquPp+xiTJfBrVUGR2
         9MFvZJoHCwQtBdRI5q/z7MlJmZXVkiEiS8GRGFauepD0H6EaiPFfi+CKB2H2NHTql6Oz
         c7kcH0w9lIsJftES/5Vc6iRKOsAPL1swTryMZzTNGLQuupZl/0TgBKIACaPQFTicrK/o
         tOfQ==
X-Gm-Message-State: AOJu0Yw8FeKjSYt6sRR3C4ocTY3RJCf1X8C1HGEJeOH3w1ePlPjL9E2/
	Te7aVDjfZPjx1rY7WzY2YUyrXBDd/X+Spc8OL8JeGhD3S/MdyDCsqBeJJHsuzQ==
X-Gm-Gg: AfdE7cnqTzdox00zhPXS9yqv0qR2gYpk0Sg5y+N6CnQDlOp+4RCHZ850w88AUdTTd+c
	rOeAJER9fFdZAsUc3DKdfj6ENDQoRU6/TfVqZjT9NUBzIUPV76nYgWIawzcD15jICCGE+jVI/Hk
	McrvGck0cYZOJdqpGKp6ywPf1EW14/zTfqBvh0PhemSycuO7BgUhdSb8MZ+f9HsMqB/d8TbXI1X
	qyO8T48HGL+eGmalwgrQMamNPVJ9x6wTpTkR6VOOVKPcRj0msJn4VXmXzlilSs+zxEe2HZlzyOJ
	z5dCY5+eXJh7e2C/H3k2Moee6msHYXmmkcs4BRt8IODyRTqOx6SUqtujpRlEacxNVtbXa6/U9aS
	lGfwcsmPmV9bc3x7aSGJ0et4Fz9NjmFXPXacybanjqhsEMXYyr6y+pr5I0l0bXLzsOFGLno4Dhj
	QXycBJpAJLqZPSXy2Ebsyu+L75v350bImbb4XAJUGvuKkAxv4pz1yX8IKfLQ3lFu3UNst4vToWd
	qExOjiVa2LYScmbydLMgXphPnsfiDZWuXW/UjjQOu7s0nH4qp8Bd0QBq15koBPpxg==
X-Received: by 2002:ac8:7f81:0:b0:51b:f40b:2faa with SMTP id d75a77b69052e-51c8b3e32aemr50992231cf.52.1783550906576;
        Wed, 08 Jul 2026 15:48:26 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c41e084e8sm142990171cf.28.2026.07.08.15.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 15:48:25 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Ralph Sennhauser <ralph.sennhauser@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] gpio: mvebu: use devm_clk_get_optional_enabled()
Date: Wed,  8 Jul 2026 15:48:22 -0700
Message-ID: <20260708224822.960617-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39686-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,lunn.ch,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:thierry.reding@gmail.com,m:ralph.sennhauser@gmail.com,m:robh@kernel.org,m:andrew@lunn.ch,m:linux-kernel@vger.kernel.org,m:thierryreding@gmail.com,m:ralphsennhauser@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 33F4172AF4A

The clock is obtained without doing any sort of cleanup on remove or
anywhere else. Use the proper function to handle this. When it fails
with -EPROBE_DEFER for example, return so that it can be handled. When
the clock is not found, it's NULL and not a PTR_ERR. Handle that as
well.

Fixes: 757642f9a584e ("gpio: mvebu: Add limited PWM support")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: return -ENOENT as before.
 drivers/gpio/gpio-mvebu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 8d3acadb0d68..a863b0bf46ff 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -833,8 +833,8 @@ static int mvebu_pwm_probe(struct platform_device *pdev,
 		offset = 0;
 	}
 
-	if (IS_ERR(mvchip->clk))
-		return PTR_ERR(mvchip->clk);
+	if (!mvchip->clk)
+		return -ENOENT;
 
 	chip = devm_pwmchip_alloc(dev, mvchip->chip.ngpio, sizeof(*mvpwm));
 	if (IS_ERR(chip))
@@ -1182,10 +1182,10 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
 		return id;
 	}
 
-	mvchip->clk = devm_clk_get(&pdev->dev, NULL);
 	/* Not all SoCs require a clock.*/
-	if (!IS_ERR(mvchip->clk))
-		clk_prepare_enable(mvchip->clk);
+	mvchip->clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
+	if (IS_ERR(mvchip->clk))
+		return PTR_ERR(mvchip->clk);
 
 	mvchip->soc_variant = soc_variant;
 	mvchip->chip.label = dev_name(&pdev->dev);
-- 
2.55.0


