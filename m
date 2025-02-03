Return-Path: <linux-gpio+bounces-15193-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E80B1A25196
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 04:13:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1114161B65
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 03:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D4D3154C15;
	Mon,  3 Feb 2025 03:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="YMOmdPZx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF02413B787
	for <linux-gpio@vger.kernel.org>; Mon,  3 Feb 2025 03:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738552365; cv=none; b=r9b0v825KcN1tI5CPKq2g1qbhn5wtMvE552lZWDzYSSDeP+l2QiYxLZz3IZ7EJiRFmVfJK8rFY1GGWHPEvGQsOJA6YkyoSmj3CDSiDJcx1wtc7loY42H/jPzOKmgiz6rT7uNsKuMQ7GX95irDIW6PdVsCrSUfgzekEWJya+shfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738552365; c=relaxed/simple;
	bh=D5T5KJKLkNqZuunpZaQz66egOgmq3gUBykVLiVCskVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y3I6LNiK/Bapt6rzMoQ6fHzlaOAZxC67Ng0vUU0/XtuqavwT7ZAwb5xM3qS/yQKYTn5MZkyxlntI0L3fl5oRgXNL+Hyd2iLLxtQl0XQNRtpxuFD/J0prfXAokxheGjcCWlN4Yu1sx2nUqYgd/HYf1anED+JXWmlU9xxmGbwNT0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=YMOmdPZx; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D5BC33F296
	for <linux-gpio@vger.kernel.org>; Mon,  3 Feb 2025 03:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738552361;
	bh=CmjoqfiwFmGpVKgL8na+qeTrK73yJ3NuCGJzYY0C8p0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=YMOmdPZx5KBFEKDyXoudCMJ2AIM8SAyyTfLHeocMwTtC3daFlUzCAkL9KUGl/ejsA
	 kmYQ1WINeCH0M03j639LahZGdrWOKGG7o79usD7B3uXmRLV0RFPnC9ALeQDXgcEUXp
	 OF9/przXHgb4Kb9Bp7s6x6fJIyrRtpb4ZFC3B/orOWYxac1KZqS4xSL66RiuZqR9/q
	 Trw5LOZU9Rhq2vPEf/TJcJj99PnlC+d2fIQCrOoV/BVIwTCp/pEwt+PAPKpHY1uIj7
	 jXjXlDeBdBPy9LysVcoHSDU3COtmN9ufXRi/hKEu2tcpC+o8aTnU53f2udnUpj7FqV
	 te+6g5uO4jD5g==
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-21648ddd461so83226885ad.0
        for <linux-gpio@vger.kernel.org>; Sun, 02 Feb 2025 19:12:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738552360; x=1739157160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CmjoqfiwFmGpVKgL8na+qeTrK73yJ3NuCGJzYY0C8p0=;
        b=FUGvGjfb6TrYL4p8JyP0p7G2CYEKBjDFBvxEL7s68T/JF7+ctaO/8t+dwsPXFJfaS2
         Esvto2v4fN3/dZ17ys8evGIrfKXWfp2HOM6UA9anV/cnNVuTmX4GuoU5a4waRBulHMhi
         rg6m5Y2fekyVjAbiD1Oy2EOUYfHljc/kToF7mWn/4au4Od0mpt/4lRnWPjbbYy5KpK8x
         42e2cUKde5aq1g1+pHjN1b92O2rYcrVg6f1k3CfHKpeG9VL/vDDpKMOdfWAaJCtagZzf
         zliBXMndkl7hVgjBTujd/SkT+D3vRB4FWX8ESX1vXENzfDK4KSSJBi8SCblqmVoj7ctb
         VDcg==
X-Gm-Message-State: AOJu0YwMaXeY31lrvMhZg6R6OAtNjRlruiLXyuv/2syKtAUD+Rsf4m/H
	e6N+jzyFF9fPRWttJ7GxQtRIkpSNf3ZpPkRpNUbUJQQLWFd2u54KKlAS3F+IKmZjPyR6F460vvt
	/x9o2O2Ke/RLNIwCHHW8oaFwScF85cJvaEqlpDNSToNj/jUU2RmiMTW4twMPRtqWI8b/5/5SAjz
	BoSjqtExw=
X-Gm-Gg: ASbGncsjy8zqi4xV1B/dZ7z7BiBCVSVrL2diBzk+TQArARc4RLQAH3RYEtafGEILnQR
	vog9S7D0eaSqRGAgQieWrvdoYCQ+lCpj2xFJaMIO/77ghJEZHLRP01z12Eqnosmcfc2IaV5Ti6C
	Zn8SegogCXsLeQ70sZ/rhSdwxdBhxUeBETzcs1v19RD6ZLq6Vbi3QHjrQ7Emod6/V14ZWupjDmB
	mpBjm/hyWdCQIHnu/mpzw1GO9P1DY5iwEcnbP9In2tTeRfwaavT4hUnaE+ykGuSnDCEb3qZuHns
	cSh0
X-Received: by 2002:a17:903:32c4:b0:216:1543:195e with SMTP id d9443c01a7336-21dd7c46c41mr327607085ad.5.1738552360008;
        Sun, 02 Feb 2025 19:12:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHp+COZgI0atxnqhzoQqDdxpFJFFAFhiXjT571bA8VSq+NYsAvBWHh/9zdb8p4Q4G2jzbXzBA==
X-Received: by 2002:a17:903:32c4:b0:216:1543:195e with SMTP id d9443c01a7336-21dd7c46c41mr327606845ad.5.1738552359688;
        Sun, 02 Feb 2025 19:12:39 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:33e1:5e62:5b35:92b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de3300253sm65809075ad.162.2025.02.02.19.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 19:12:39 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/10] gpio: aggregator: add read-write 'name' attribute
Date: Mon,  3 Feb 2025 12:12:07 +0900
Message-ID: <20250203031213.399914-5-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203031213.399914-1-koichiro.den@canonical.com>
References: <20250203031213.399914-1-koichiro.den@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously, there is no way to assign names to GPIO lines exported
through an aggregator.

Allow users to set custom line names via a 'name' attribute.

Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/gpio-aggregator.c | 42 ++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 76d3a8677308..3263d99bfe69 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -63,6 +63,8 @@ struct gpio_aggregator_line {
 	/* Line index within the aggregator device */
 	int idx;
 
+	/* Custom name for the virtual line */
+	char *name;
 	/* GPIO chip label or line name */
 	char *key;
 	/* Can be negative to indicate lookup by line name */
@@ -678,6 +680,44 @@ gpio_aggr_line_key_store(struct config_item *item, const char *page,
 
 CONFIGFS_ATTR(gpio_aggr_line_, key);
 
+static ssize_t
+gpio_aggr_line_name_show(struct config_item *item, char *page)
+{
+	struct gpio_aggregator_line *line = to_gpio_aggregator_line(item);
+	struct gpio_aggregator *aggr = line->parent;
+
+	guard(mutex)(&aggr->lock);
+
+	return sprintf(page, "%s\n", line->name ?: "");
+}
+
+static ssize_t
+gpio_aggr_line_name_store(struct config_item *item, const char *page,
+			  size_t count)
+{
+	struct gpio_aggregator_line *line = to_gpio_aggregator_line(item);
+	struct gpio_aggregator *aggr = line->parent;
+
+	char *name __free(kfree) = kstrndup(skip_spaces(page), count,
+					    GFP_KERNEL);
+	if (!name)
+		return -ENOMEM;
+
+	strim(name);
+
+	guard(mutex)(&aggr->lock);
+
+	if (aggr_is_active(aggr))
+		return -EBUSY;
+
+	kfree(line->name);
+	line->name = no_free_ptr(name);
+
+	return count;
+}
+
+CONFIGFS_ATTR(gpio_aggr_line_, name);
+
 static ssize_t
 gpio_aggr_line_offset_show(struct config_item *item, char *page)
 {
@@ -728,6 +768,7 @@ CONFIGFS_ATTR(gpio_aggr_line_, offset);
 
 static struct configfs_attribute *gpio_aggr_line_attrs[] = {
 	&gpio_aggr_line_attr_key,
+	&gpio_aggr_line_attr_name,
 	&gpio_aggr_line_attr_offset,
 	NULL
 };
@@ -813,6 +854,7 @@ gpio_aggr_line_release(struct config_item *item)
 
 	aggr_line_del(aggr, line);
 	kfree(line->key);
+	kfree(line->name);
 	kfree(line);
 }
 
-- 
2.45.2


