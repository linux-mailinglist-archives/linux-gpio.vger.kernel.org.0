Return-Path: <linux-gpio+bounces-15192-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 132C5A25195
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 04:13:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0655C16163B
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 03:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A93E148316;
	Mon,  3 Feb 2025 03:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="qqYo6CLU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728AC28E37
	for <linux-gpio@vger.kernel.org>; Mon,  3 Feb 2025 03:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738552364; cv=none; b=O4iwHnwgMHX4vedkT4LyhkVPidrsW/+JTCM8j6hkLyfeGXWZ65HnPyUAZmpUPFUUpsISbaJuqC06dxJnmObiA/hp921aTZfUJsGmlfKXb+0RduddkCqhDI49Q1iR/o1rW9ZTIiQKROmLvyqJK9xeapxrPRujNi1S/B16upL9C2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738552364; c=relaxed/simple;
	bh=2Y6NBPCKbmP/94IPXmCJXFLpGu3HSWTII15x0rMPg2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nphVURD7ZZfdQEA7AOluebOiv20fQZSqQlSdsDBVyGu8FAO+/r+D+uNy4Qh7xZzAWcWGuXgaZpH04si39U+nNTBRa/rLcOJXPZVVG9pW3xyR7xAIhQd59U0N0bQKLljPxddRsqgpfJn8agvIqv5KR4iAQe+9zxtvDS3JFCOW/XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=qqYo6CLU; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0B2283F2FE
	for <linux-gpio@vger.kernel.org>; Mon,  3 Feb 2025 03:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738552359;
	bh=qFgkZeNVoc6Ek1Z3LfuUiIv8kYJatNPIlX5PMFPOzfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=qqYo6CLUUcbgS90efIvjU7xOz/TqFRQ0T/akGd1y4c+C3CckySC+7CzY1nFx0jbcU
	 +7cAIBBtkXBthQGFrMEV3GOi0cqo6t5KBgTdSGy3HVJcl5lIHR6tYVLyMyFka73X8o
	 NOakwyqEY/cn8OtQcuWr6EG5ui5xkvzaEy5fC7+D90upY+a7tD0AzA+GPFoYDDvvO9
	 pj2tq62Lub56+ej9MoBVgEpcSJT/uXpjSmaIQhyBvHFOD+FceSN3FfsXSKryf+6DuG
	 6B3CcOK+xzMNNCaAxW5lco8ckTQUP50Yyid8EtsQ8tjc2tDBPNSppFkVKahZK7hmfS
	 PdmBMuEz5UpXg==
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2178115051dso85569095ad.1
        for <linux-gpio@vger.kernel.org>; Sun, 02 Feb 2025 19:12:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738552357; x=1739157157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qFgkZeNVoc6Ek1Z3LfuUiIv8kYJatNPIlX5PMFPOzfU=;
        b=gff9USGYk6bAqY6JPIFzhOgjtnnQPDnBlisgPBAZp4766B3Hh3rSTZr+9KwVOIn6qq
         mTihGMw5iTp2DTB1Y83pmNFKUn9wShSUfmIAp9fk9ocxM1S6BysXA337b1c0F/M58LM0
         1aIKdN1NZjFPVw4ASGbV8LyPoiUSa2LhDOYubhwz5dVzQrwhkDg+v0Vvq1d9GI3bZ69L
         IBvlUnGVaJva1420ZKP3Mnhx4oynaTrotjUIdW81dKNR2hTO/jPlZBYZI4CX0JxNQcvs
         yxtYV3nzEUoCz/lZQCstSr3qJGRDLriE8zDZTx7B2asPLygnenPBRPMp0+WQouDMLx4e
         7WwA==
X-Gm-Message-State: AOJu0YwF+Xpx/ufLz9loRCk516kt7oIw9B9vEaerSV/RCQbBpWVzx9X8
	PVg1msSiudJxuC6Drvd5pj3Di+uz1OqBU4i4ZqYSutmuNO97Jil6dhRCtxJRy/xGoA5rxp60kuH
	U3uP/2Rq77QLoJYXEruMqDk4b+DHiAztJsxQtKw9IqR9dRmDvGR6GSS2H9qcaL4mdU3JA+OUOK4
	cCmem5WdE=
X-Gm-Gg: ASbGnct3yMQpEXIGIN60b6UDCCpnP1QqzhgOMElLgoIiy0ThIby6kPX2CZL3pkJH1xJ
	+5l8JpkA4J0emZ2VR6MYgcqAiEJ3X82cJPj3jk+aIZfiVHlcREJizjBzmx6dd+tf6685MMbrkqu
	/ISZ2nxj2ttqFi2loCNhHV1Ho8ejMlB559RtU8QcqsgUyrzi01Z78i7j3yUu65qrmWPywosD+C/
	1e7H4tRu9SQwli3MMH8vfGNfHBoJJVBuespXgz/XX5UvNHb88BHrfet/PK7R+zvBMFl7ySaIftP
	dZxK
X-Received: by 2002:a17:902:cec3:b0:216:7ee9:2227 with SMTP id d9443c01a7336-21dd7dd88e6mr318429415ad.36.1738552357119;
        Sun, 02 Feb 2025 19:12:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDZPzII7boMUc1kYDeUFjBUUJJwRNHBS0vkC4KLHE7UxpkuO1ByD1lqZ53Aa4OOdj2fw2SCA==
X-Received: by 2002:a17:902:cec3:b0:216:7ee9:2227 with SMTP id d9443c01a7336-21dd7dd88e6mr318429185ad.36.1738552356836;
        Sun, 02 Feb 2025 19:12:36 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:33e1:5e62:5b35:92b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de3300253sm65809075ad.162.2025.02.02.19.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 19:12:36 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/10] gpio: aggregator: add read-only 'dev_name' configfs attribute
Date: Mon,  3 Feb 2025 12:12:06 +0900
Message-ID: <20250203031213.399914-4-koichiro.den@canonical.com>
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

Add a read-only 'dev_name' attribute to configfs interface, which
exposes the platform bus device name. Users can easily identify which
gpiochip<N> has been created as follows:

$ cat /sys/kernel/config/gpio-aggregator/<aggregator-name>/dev_name
  gpio-aggregator.0
$ ls -d /sys/devices/platform/gpio-aggregator.0/gpiochip*
  gpiochip3

Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/gpio-aggregator.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index c63cf3067ce7..76d3a8677308 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -732,6 +732,23 @@ static struct configfs_attribute *gpio_aggr_line_attrs[] = {
 	NULL
 };
 
+static ssize_t
+gpio_aggr_device_dev_name_show(struct config_item *item, char *page)
+{
+	struct gpio_aggregator *aggr = to_gpio_aggregator(item);
+	struct platform_device *pdev;
+
+	guard(mutex)(&aggr->lock);
+
+	pdev = aggr->pdev;
+	if (pdev)
+		return sprintf(page, "%s\n", dev_name(&pdev->dev));
+
+	return sprintf(page, "%s.%d\n", DRV_NAME, aggr->id);
+}
+
+CONFIGFS_ATTR_RO(gpio_aggr_device_, dev_name);
+
 static ssize_t
 gpio_aggr_device_live_show(struct config_item *item, char *page)
 {
@@ -781,6 +798,7 @@ gpio_aggr_device_live_store(struct config_item *item, const char *page,
 CONFIGFS_ATTR(gpio_aggr_device_, live);
 
 static struct configfs_attribute *gpio_aggr_device_attrs[] = {
+	&gpio_aggr_device_attr_dev_name,
 	&gpio_aggr_device_attr_live,
 	NULL
 };
-- 
2.45.2


