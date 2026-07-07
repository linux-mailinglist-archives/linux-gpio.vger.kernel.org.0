Return-Path: <linux-gpio+bounces-39613-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fvFYDpWGTWqc1gEAu9opvQ
	(envelope-from <linux-gpio+bounces-39613-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 01:07:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 87700720544
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 01:07:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=jqtOGQQl;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39613-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39613-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B533D301C6D7
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 23:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC2EC3093DF;
	Tue,  7 Jul 2026 23:06:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B63221FD4
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 23:06:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783465617; cv=none; b=AECeCxOMfww2ZCTCgQUxhkari3wE2TRRXG54sT3VWBCMLAKt/1ZcczgKf7zZhpBAw9y5Rm9N972xZTz6sZnNUqIiv4Aah4PKdyW/UYa42NbI/GaxrskRexOdQwmSBY5SjoydJAtYM7EOsqDJzRc/F1s+nXE2y3DJQvdd/OLK3KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783465617; c=relaxed/simple;
	bh=L0GHR1v0x7MZET0vZVeu0l8qSN1ZfLoaTOTElTljsIg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JZn/Ufj7zG6MhIrAEboJKx43cTy9lu0wzXXpbDd0hQEqEG/kzko8Z/e5dtwz8yT9jCyU/Mp8hQhoPm2fbbhZed8E0wSqg2iMHG8evB1KNy0DGER5ROe5Il7fnQOwC+XvBB1L8il8RkuX22eEZdhhH9jY0kIbpUtzZyAdQhG/B1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jqtOGQQl; arc=none smtp.client-ip=209.85.222.169
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-92e99ef0902so805285a.2
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2026 16:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783465615; x=1784070415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qruhWsJOVl9ibFqHy2pCue9Gd7ufg67PRI0LZgtMksI=;
        b=jqtOGQQlE6pYJHhFoxEXjvUZxTGHyPNXVLwsOZprgpcNRpomEsHVbHwTuKPJV8PnDs
         B7Wh2cvgh1kJgPdhs7hScpxOSnvrYe1L/3+rR2YSmZsFVFAZTw2YvbTl+i4snzLstTkw
         htHpPO/Ccz0thy3jLsutk6zG6yD3igCrFhrl8uEYxtfUVuKNT3vKswgj1dWYmeoBeD93
         laVe9qbpqVm7LH8XTqDxGeVEblYPjWLvhTvNLGjTxbRbGkyzEFCxK/9mByYcEGrlXMlP
         b29va6ZH7Fwwln2HC4uly001R61xdOxMHGXYhXmuzs1ipJ17hiwiiHle12m3qnTOFFzJ
         SPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783465615; x=1784070415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qruhWsJOVl9ibFqHy2pCue9Gd7ufg67PRI0LZgtMksI=;
        b=EhDz892+E4kzc3RMsNCrEsS8lYKTbO/Tx92vIPInmaLPWLPNBbJszTuYIlkRtloZlk
         FhIRnmk7yjDBnTrD+2DLyJVVdlTEP/O84GUia9/3TOpH0xod/9uPg2hn0PCBtnTLPyc1
         TsQmkBMppRnLbSlx1Git26Lq+yjra55O/7QQtxWhPKkeQmNpiWZ9RjLBwth7lUCPLyM9
         pQJVvggETPXTaJcxsjsAUNLr7aypJjbtJzeSHWm/ZEwWjZwfGks/5Vr8WJcFRZKQ0JaD
         yN0XByQXHnoJQ+CoGjq3HVuTIUgtJ+cmQkjCArP0YiQaSqifQQ8obt1bsjZ/p6a0tyjg
         uGQg==
X-Gm-Message-State: AOJu0Yyovsv9rrLkpqhXc70ZN55tMQ+cCuyNoOB55dRvSVKmvfjHcr0z
	x/qlRVPld4oyF4gcJq19s9SEbZh5zacSetiH5ijnpYNQSEa1+FifNyq8fZrUrvK6
X-Gm-Gg: AfdE7cmrKy1cd+0zn24CIQiHYY8ouXSrqUBNeTvXe/ldI9zwHOsnxdk4oFJ92cXOD8v
	PzmApvkVM6sNHOkyK5BXa3PeyIkC5defcW6oUDdzZdIItbXEeAXkW0o2okNng7kAJZ6zgeKL6eH
	zU86cthxAhPE1H7XrsbGaqWFU9Nnoq6pX2p6YCd3XUBjzcsXXzUEimeKP6yxo3iUTAwS+J5EOWO
	ZF803l+c0+COQ0gbDPi/MHw6BBK76pGH9qgOmsZA+2c4+xaYk0kkf1NZSmvqrKHPWtxMlUAPAaa
	pU0FSpPf+2tpbtKCwgJQ0r4Try/vZxQtNUVmtY30nv1oF33Dow9vXVUz/wE5eIPv4a7o26i810E
	S5H2TqFbFquF12N658YGAZ3ZQySQAx6VNIq2OSMG67bM2BBRegKxcvP2DLgaukvz2/HZsCRCoqw
	4qUclFdLsQLlBxpy0Z6y+HW7F6ocT8nS/vDZGElMo0hEzHd4VxpPoxqTqXPjfOzQ0xz+Bl6xniG
	NhqwA9qXA==
X-Received: by 2002:a05:620a:2720:b0:92e:7d53:8e8d with SMTP id af79cd13be357-92ebb4f3500mr804914585a.27.1783465614937;
        Tue, 07 Jul 2026 16:06:54 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90b804dasm1269924285a.1.2026.07.07.16.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 16:06:53 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Ralph Sennhauser <ralph.sennhauser@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] gpio: mvebu: use devm_clk_get_optional_enabled()
Date: Tue,  7 Jul 2026 16:06:51 -0700
Message-ID: <20260707230651.1138887-1-rosenp@gmail.com>
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lunn.ch,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-39613-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:robh@kernel.org,m:andrew@lunn.ch,m:ralph.sennhauser@gmail.com,m:thierry.reding@gmail.com,m:linux-kernel@vger.kernel.org,m:ralphsennhauser@gmail.com,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 87700720544

The clock is obtained without doing any sort of cleanup on remove or
anywhere else. Use the proper function to handle this. When it fails
with -EPROBE_DEFER for example, return so that it can be handled. When
the clock is not found, it's NULL and not a PTR_ERR. Handle that as
well.

Fixes: 757642f9a584e ("gpio: mvebu: Add limited PWM support")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-mvebu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 329275d6518c..cdf7eb46ae5f 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -833,8 +833,8 @@ static int mvebu_pwm_probe(struct platform_device *pdev,
 		offset = 0;
 	}
 
-	if (IS_ERR(mvchip->clk))
-		return PTR_ERR(mvchip->clk);
+	if (!mvchip->clk)
+		return -ENODEV;
 
 	chip = devm_pwmchip_alloc(dev, mvchip->chip.ngpio, sizeof(*mvpwm));
 	if (IS_ERR(chip))
@@ -1194,10 +1194,10 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
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


