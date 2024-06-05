Return-Path: <linux-gpio+bounces-7194-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B22828FD51D
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 20:06:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 636781F25B12
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 18:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDFBA14EC52;
	Wed,  5 Jun 2024 18:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Zceh7r4D"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95B314E2F1
	for <linux-gpio@vger.kernel.org>; Wed,  5 Jun 2024 18:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610575; cv=none; b=VBljVrE+z6AuzpvLiHfNFsi2+4gciBbDoeYe93T7usWKpFMpwjJ//cc7JOQ03U7Lsr8ubKJK44kLd59ZUac+5dN9+AQTlaLZe2tqaURE6598tDrhEPWkbXjxbjUhmB1a2+RjS4bpHeo2WgYKplLujY6cJXDkQWszfegpvAMO/MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610575; c=relaxed/simple;
	bh=3NTGVyytdVyzcHP8txKlFB9YPPGxIJEVxCzu2cUQr1M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WyDd2/iVUeMEaJnpsXlxYtKOFZjOEKaANz/jEhOuK6biHnPw+LexIqfu7W/4M2D1n21gRdjxmOhhQQ5wC0CqLADZTE2HhTN4j4ZTYOsvt7ijQSbyGAiR5VSH9KJYYFu6d3YadB+wqjuTzIPRuObNGhvul1w3o/jn1jZNoaYvVGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Zceh7r4D; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-627dd6a56caso319947b3.3
        for <linux-gpio@vger.kernel.org>; Wed, 05 Jun 2024 11:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610573; x=1718215373; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qDI8h7ZoQYy75CqD6I2McYIto2hpIA5emU6fq1I3LPI=;
        b=Zceh7r4DKjZxj+a9nK/QaXDX6PywKjBJO0UZV1S/xJdKXimp/nnCI0wZvsZf0UJhwK
         7Q1RjJdda7ewUbgf1avKIEw/IlHVV0/kuQYnDpbGWhedQ8/BTcIzW73L2EnJUWVZdmg+
         PZ9u65qivhbL3++hcgSBbL4DG4bWaaEbCO+dFoE8ACY4vUfP6RaLzkkrbcCyH5XWZISy
         wDGKnK9ja1EPb9k9WJHVTZJ5qM0WWQfoT1vIvHa7kLuHD+Sqbr7dPNAVmelsUyhgUAwX
         A2L8gG3AW7S8JXvOWrFgHP2ygYbSqPQRbESNpKB37Y6rSBH6lpRPJcUdj1DyHb9Jg1wz
         zX0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610573; x=1718215373;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qDI8h7ZoQYy75CqD6I2McYIto2hpIA5emU6fq1I3LPI=;
        b=jRuQMIOiErK0yumRqg/pDLZBdzzyyWqTeDi7C2wuWaGqwhlsWnKeeUn08mdpoHOC47
         M0xjzbra3NoHaeScda968C7KmhhN//+IzZg0aS5jlflQnz+l7+LKZycKgne95eyzBbQ1
         2aOYREJooDOiYimsjWyGIK6BOk3Wo/h1o3wBeHR65L9K1d3jILL3F9RrQt4iIVv07sTg
         ekZjI4CW4RhkuOhcjPoAn6fyMSx0I8rkPqostqLiYU6C9mAXOengORY7FBzlw/Yha1Qa
         6KTv5i0H3w7K4S4Nw6VxMqTsz88L2qhaabFqcq/HRwUpSHGnnoSDdmhnHTvGxjxlgmIU
         M/Jw==
X-Forwarded-Encrypted: i=1; AJvYcCX2y49yGQH5Yql+TkLbA7ME/zIU0dngUgI6cz7bd01LV+yN9nQgDPLl1VX/ty7i+a/yzRMbSMxED/x77losnw44YkO0qjz7M055XA==
X-Gm-Message-State: AOJu0YzZO8diWpsm+CDyPffBGbwIDudCaz9PkXN2O2bzkzck3KJB9khd
	kwAUIVZG6OnXr6ETYiLy+vakbc9JcxiLj/doPUIB438leM1TEthjYak1PS2j6WNorjOfAnmxOD2
	ik+pL2DipNQ==
X-Google-Smtp-Source: AGHT+IHsHtY+bAgPNOkcmVi64EeRKQimO371NMHALyHppPPqEXYX97pSerbED4x3JFp6tor3148MLJe9OAqS8w==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:690c:39c:b0:627:96bd:b2b with SMTP id
 00721157ae682-62cbb596fc6mr8780427b3.6.1717610573043; Wed, 05 Jun 2024
 11:02:53 -0700 (PDT)
Date: Wed,  5 Jun 2024 18:02:33 +0000
In-Reply-To: <20240605180238.2617808-1-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240605180238.2617808-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605180238.2617808-3-joychakr@google.com>
Subject: [PATCH v1 12/17] soc: atmel: sfr: Change nvmem reg_read/write return type
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
 drivers/soc/atmel/sfr.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/atmel/sfr.c b/drivers/soc/atmel/sfr.c
index cc94ca1b494c..c1c8e59cf6fc 100644
--- a/drivers/soc/atmel/sfr.c
+++ b/drivers/soc/atmel/sfr.c
@@ -20,13 +20,16 @@ struct atmel_sfr_priv {
 	struct regmap			*regmap;
 };
 
-static int atmel_sfr_read(void *context, unsigned int offset,
-			  void *buf, size_t bytes)
+static ssize_t atmel_sfr_read(void *context, unsigned int offset,
+			      void *buf, size_t bytes)
 {
 	struct atmel_sfr_priv *priv = context;
+	int ret;
+
+	ret = regmap_bulk_read(priv->regmap, SFR_SN0 + offset,
+			       buf, bytes / 4);
 
-	return regmap_bulk_read(priv->regmap, SFR_SN0 + offset,
-				buf, bytes / 4);
+	return ret < 0 ? ret : bytes;
 }
 
 static struct nvmem_config atmel_sfr_nvmem_config = {
-- 
2.45.1.467.gbab1589fc0-goog


