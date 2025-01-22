Return-Path: <linux-gpio+bounces-14997-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E2CA19120
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jan 2025 13:05:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21869165974
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jan 2025 12:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DF88211A39;
	Wed, 22 Jan 2025 12:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kXjvQjcO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D305A79B;
	Wed, 22 Jan 2025 12:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737547544; cv=none; b=QJGw7Sgp2C6qYVzCXnuUqV7uH8GcxVN+8lNNreVtsqC98Mqo3oeOq2zLd+1VI9A/e/OJKGtcjSwY4mhCG5q4U3aJtF2rz/9nnGi6cLhcx4TMJXeay21cB4MjBbWAh+5hspFgO7Po20CIrzCa9Lds+Rv/x0FPQlYRbXswXRjcZ8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737547544; c=relaxed/simple;
	bh=+ITUbqiB8h3mooG4CjAkBl+OMFvMx6kJMNs4x2MF9Dc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ult+ZkJyktFWG6DnhmOWWh8Ko9XZehUnVBpzxf0tdKijrBBZqSQmzuen0an3bZkv6x9kAZY6PD2BJKln/wzSoKvsm9+dqIUZc5JwOfHuhBIBzgzBsRYpPFQdTwylFkhBT//1it5I5L7HVBYRzgpcZ7cLMh5sNzii7naBtzdOTyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kXjvQjcO; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30613802a59so73115981fa.0;
        Wed, 22 Jan 2025 04:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737547540; x=1738152340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zgYZFxtQdnqjet/yl9paLb18OZEec6iU81ry3xA1IxM=;
        b=kXjvQjcODA74o0uvC+P8/tmbUogud7/TNdH4pZPqQw2K/dkt3wvMG1H2nmbJOG50ig
         jdohccI57XTpTIek972fg96CfHbFdjcUrWFO5oHiZspsJAn7eUMXyfP4y81RpqAFhFkh
         bvuLpk4aaVL5hV1Vdp+KZMx0eJkuBXF2nFOcjnydnpxpT+YyWSRhlzHF+Sw7gC95PDhH
         fTf9+mg0112JjTEMdIAxGmLr6pxY4GdRba4NKs5FSzQ04Ni+HMM+9L+bnETkWDiriYnS
         q+72AHABo7Y7iBaMzjf93gdaMbRmcIg2BWMS5+5nl9hcnLfnhjmbOs9pmZxiZyplTvmK
         H4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737547540; x=1738152340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zgYZFxtQdnqjet/yl9paLb18OZEec6iU81ry3xA1IxM=;
        b=O3/ltcVKlxsSiaa6ZZg+9mamsV1G0hyw69iYLmc+MqEynX8Aqq786dIg0JpA/JznVT
         cnCfyVYQiCBReeo4KeKGbCBNUUjh3yd6WRsNvOvpA/u3aP5V0OkAWyZTSEuIrNUQ8UXC
         UZcCa85nmE+qRad19aSWc4fmmkFUbtDroqGDMYxfDSjQxpG6BJaGDbZhQNKQDxDovh1l
         PVb+FB/FchEsSHAI/Tw4K2vpyFyzy0vvc1lfkqs6dZYN0zGbat33q6vAyhFeyFV8y8am
         RHBQKpMg8XKv70F+1ij4Mi93ONCSvwlP3c9Qc2LFMPvu7p+tOzdZ4A7T0H7bUPVZnjd0
         Z+5w==
X-Forwarded-Encrypted: i=1; AJvYcCWHtasW3vn74ns8qGbDG915n+vxYWysfj3dSmflwKNRJLm28TIPwv6txwRg3PeaZ5bSeZoQ8O7EWn0QZYJ1@vger.kernel.org, AJvYcCWZEW3S+wPxUk0hqsnoMXDcC00yi26e0dRbVmZ/FFOoHw9Nczv79OJ96Vq5nFPA94zSS4i63iQhA4Ig@vger.kernel.org
X-Gm-Message-State: AOJu0YzdKVxWoM9IkE2JAXYzIswgjjnguDiJfkRtaE0mEw0YG1Baz/6w
	ILwZv8S9FrUg/jTyT7dIfNKZCaRkymOmUjIrBbt4TdHrKbIg9zIUlO9Ch/eW
X-Gm-Gg: ASbGnctyBqaU54galo30Eyu/8GRR9H+zOvmHEaTMypJYpyCyF9iLPa/Er+n46NtXRUs
	CQGbJqdUKSjAmfQkRnNtc9arndY8gFhDJSFYGXLT+HRXZm+se6hX+5mQijV42p8A6AbfyAiBFoL
	PMfip6o9UQLPFOGDjEKlq68tk337pcTRLEk/16fsgg+G0JdnJRdOeEmRPpUPblaIjuUhvi9pj6b
	EkZu3Q257RDK4k1pSkoB/Gp/Rt6/zkOi3EWCKq8GA4r29hzbBuQhRyrkGgFyTzfFgweWxfODpxj
	6HDRDMJ038jHCNselxU=
X-Google-Smtp-Source: AGHT+IF5uiqNAwv4bhx0mIkxMomx3WHJnNODdDqvMk5Fcs4lnFnmTt7Gp1YP6PO8I7SOuCxdsD4UbQ==
X-Received: by 2002:a2e:a4c2:0:b0:302:29a5:6e21 with SMTP id 38308e7fff4ca-3072ca5bb11mr56711981fa.3.1737547540111;
        Wed, 22 Jan 2025 04:05:40 -0800 (PST)
Received: from NB-5917.corp.yadro.com (avpn01.yadro.com. [89.207.88.243])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a3448e0sm25693371fa.33.2025.01.22.04.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 04:05:39 -0800 (PST)
From: Dmitry Mastykin <mastichi@gmail.com>
To: linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	e.shatokhin@yadro.com,
	arturas.moskvinas@gmail.com
Cc: Dmitry Mastykin <mastichi@gmail.com>
Subject: [PATCH] pinctrl: mcp23s08: Get rid of spurious level interrupts
Date: Wed, 22 Jan 2025 15:05:04 +0300
Message-Id: <20250122120504.1279790-1-mastichi@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

irq_mask()/irq_unmask() are not called for nested interrupts. So level
interrupts are never masked, chip's interrupt output is not cleared on
INTCAP or GPIO read, the irq handler is uselessly called again. Nested
irq handler is not called again, because interrupt reason is cleared by
its first call.
/proc/interrupts shows that number of chip's irqs is greater than
number of nested irqs.

This patch adds masking and unmasking level interrupts inside irq handler.

Signed-off-by: Dmitry Mastykin <mastichi@gmail.com>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index f384c72d9554..70d7485ada36 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -382,6 +382,7 @@ static irqreturn_t mcp23s08_irq(int irq, void *data)
 {
 	struct mcp23s08 *mcp = data;
 	int intcap, intcon, intf, i, gpio, gpio_orig, intcap_mask, defval, gpinten;
+	bool need_unmask = false;
 	unsigned long int enabled_interrupts;
 	unsigned int child_irq;
 	bool intf_set, intcap_changed, gpio_bit_changed,
@@ -396,9 +397,6 @@ static irqreturn_t mcp23s08_irq(int irq, void *data)
 		goto unlock;
 	}
 
-	if (mcp_read(mcp, MCP_INTCAP, &intcap))
-		goto unlock;
-
 	if (mcp_read(mcp, MCP_INTCON, &intcon))
 		goto unlock;
 
@@ -408,6 +406,16 @@ static irqreturn_t mcp23s08_irq(int irq, void *data)
 	if (mcp_read(mcp, MCP_DEFVAL, &defval))
 		goto unlock;
 
+	/* Mask level interrupts to avoid their immediate reactivation after clearing */
+	if (intcon) {
+		need_unmask = true;
+		if (mcp_write(mcp, MCP_GPINTEN, gpinten & ~intcon))
+			goto unlock;
+	}
+
+	if (mcp_read(mcp, MCP_INTCAP, &intcap))
+		goto unlock;
+
 	/* This clears the interrupt(configurable on S18) */
 	if (mcp_read(mcp, MCP_GPIO, &gpio))
 		goto unlock;
@@ -470,9 +478,18 @@ static irqreturn_t mcp23s08_irq(int irq, void *data)
 		}
 	}
 
+	if (need_unmask) {
+		mutex_lock(&mcp->lock);
+		goto unlock;
+	}
+
 	return IRQ_HANDLED;
 
 unlock:
+	if (need_unmask)
+		if (mcp_write(mcp, MCP_GPINTEN, gpinten))
+			dev_err(mcp->chip.parent, "can't unmask GPINTEN\n");
+
 	mutex_unlock(&mcp->lock);
 	return IRQ_HANDLED;
 }
-- 
2.34.1


