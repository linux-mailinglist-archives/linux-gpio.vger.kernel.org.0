Return-Path: <linux-gpio+bounces-7197-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CABEA8FD538
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 20:07:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 581C3289CB1
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 18:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1684153506;
	Wed,  5 Jun 2024 18:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lus7SPN3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F171527BC
	for <linux-gpio@vger.kernel.org>; Wed,  5 Jun 2024 18:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610588; cv=none; b=D/S8NIqwJjK/hWHukqPq4m8/9RikW0RCHg0xTITaqoimnd123cRRnbNDYwPkfYOwZdrdBO89bg30tsMVl085cwMWwhs47C0GIGZpmstmzmndf1HtuWO+OZV05NFr4bv/fuuk3jj1thgGTAPmBM+ILv8ew9yN0zfUy2+3H2+UbWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610588; c=relaxed/simple;
	bh=fQnAA6GcMGARJcapq8jrHjYduUARBDKjz1Q8WK0DSoQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RC7v72nDR3YOoGN9DXkGiHzuJJUhl9A6VWLQ9bP/Epwj6WOtkBSQLGAzpz5MGtF7ja6dKAeBozhiCjWjWBSb6iXj5VPfHc55FZ93bFJv1pdCpFQmtTXHKrrEXg3Ugh5X7AyfK4xI2M3p5sttl7fii8yPX/lIMmKl2GlJtaPF0Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lus7SPN3; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-629638f1cb0so241277b3.3
        for <linux-gpio@vger.kernel.org>; Wed, 05 Jun 2024 11:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610586; x=1718215386; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7kj3F75/M4iGlFf64jdDqM9oitcQAChmy+MmDZHUpac=;
        b=lus7SPN3C4HJv1tGJtCt1RIriFHVu8EEpVEMob2pAO8r6AMx5EAPSNiuPKl2bRzYQp
         s1VEWcfIPJX/KS4FEtXAzH5/f00aZVi036MesJXBGtTc2A7tCn5ogk7csm+q/YzoUbXH
         GH0559kuLCkRr5jzmVydtPupiX1A2bAQiKcMVjCUSgBob0nD02px43LZ5IZqWb2LoS2x
         rLr5E7NyLegGCjibJ5ymhaJPjRFTolRt848Hv7O7wDDA93AGyEP2J9W1cBN6JvbKRokx
         L0QkJRANeCLf0RE+Rzzj6A3TpVHJiPrK0/cw8lRtVLmlg4UX3Y78ruq1O3ulI9oG6zk2
         kOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610586; x=1718215386;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7kj3F75/M4iGlFf64jdDqM9oitcQAChmy+MmDZHUpac=;
        b=Lrrjv1ZRDHHMT1s6sOTOdkQa/2E7LIAxhb8ThcLqaMo3LksYk+qIsqQZvT3q9KdkX/
         sPKPjB4xs0QJduGvKXxJqh6T4VHlxPL6dt3IoHqNUNEyiE0BxtFi5hihiY/lQRuDrDQN
         RWiL3n/aNPErKr8rZZplOuIN9gqNkcKu0RN0sYXUIwWmPWYgZaXyvzNtOU+OTJTTXlGP
         SnJmIRjfGnNT78QoVp63+yhlCnZjFGNMRC09Ik5dmIFrdoiRtdLOV0Feiqg7l+9c2WZh
         lawwADkEFwqIFVuO4CuE9hM2q4kkGd/FfnosLbQ7MmJGCjiMOrE+Owu1fhzvckQAn3dY
         vvwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWgt2M3cGVwDTzrNBP11sYIyer8DUjGlTmgBNYtjOaMLvLouvYhKYtuLhwGtbciNcxmw++Qjy5BHVZ8wxB4Neh/ELyXspCsiLj2g==
X-Gm-Message-State: AOJu0YwgBkeNu3AoGV1QvRGjIUsdIaNouE37JBFl7yD1wsSg2owQve2e
	4iG+dxVxWduQf/9RgT2lZR+ZNLoOUeI0Dn2PGuQWWkxUxQFfJ6N3ji3b6OcxBMoAFNvsaGilszX
	aW4CCkH20Jw==
X-Google-Smtp-Source: AGHT+IG6CBdANF91FP38CmQTKr/LfgQsOsOD0b5R4Rhez9xhC1dP1JVIrpq0leEJ+8nApvlRDSurrJhIyku1Vw==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:690c:c93:b0:61b:ec24:a014 with SMTP
 id 00721157ae682-62cbb309e5bmr5896267b3.0.1717610585878; Wed, 05 Jun 2024
 11:03:05 -0700 (PDT)
Date: Wed,  5 Jun 2024 18:02:36 +0000
In-Reply-To: <20240605180238.2617808-1-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240605180238.2617808-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605180238.2617808-6-joychakr@google.com>
Subject: [PATCH v1 15/17] thunderbolt: retimer: Change nvmem reg_read/write
 return type
From: Joy Chakraborty <joychakr@google.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-usb@vger.kernel.org, manugautam@google.com, 
	Joy Chakraborty <joychakr@google.com>
Content-Type: text/plain; charset="UTF-8"

Change nvmem read/write function definition return type to ssize_t.

Signed-off-by: Joy Chakraborty <joychakr@google.com>
---
 drivers/thunderbolt/retimer.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/retimer.c b/drivers/thunderbolt/retimer.c
index 6eaaa5074ce8..fa52ea11ec28 100644
--- a/drivers/thunderbolt/retimer.c
+++ b/drivers/thunderbolt/retimer.c
@@ -32,7 +32,7 @@ int tb_retimer_nvm_read(struct tb_retimer *rt, unsigned int address, void *buf,
 	return usb4_port_retimer_nvm_read(rt->port, rt->index, address, buf, size);
 }
 
-static int nvm_read(void *priv, unsigned int offset, void *val, size_t bytes)
+static ssize_t nvm_read(void *priv, unsigned int offset, void *val, size_t bytes)
 {
 	struct tb_nvm *nvm = priv;
 	struct tb_retimer *rt = tb_to_retimer(nvm->dev);
@@ -52,10 +52,10 @@ static int nvm_read(void *priv, unsigned int offset, void *val, size_t bytes)
 	pm_runtime_mark_last_busy(&rt->dev);
 	pm_runtime_put_autosuspend(&rt->dev);
 
-	return ret;
+	return ret < 0 ? ret : bytes;
 }
 
-static int nvm_write(void *priv, unsigned int offset, void *val, size_t bytes)
+static ssize_t nvm_write(void *priv, unsigned int offset, void *val, size_t bytes)
 {
 	struct tb_nvm *nvm = priv;
 	struct tb_retimer *rt = tb_to_retimer(nvm->dev);
@@ -67,7 +67,7 @@ static int nvm_write(void *priv, unsigned int offset, void *val, size_t bytes)
 	ret = tb_nvm_write_buf(nvm, offset, val, bytes);
 	mutex_unlock(&rt->tb->lock);
 
-	return ret;
+	return ret < 0 ? ret : bytes;
 }
 
 static int tb_retimer_nvm_add(struct tb_retimer *rt)
-- 
2.45.1.467.gbab1589fc0-goog


