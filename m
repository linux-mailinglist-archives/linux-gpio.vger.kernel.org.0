Return-Path: <linux-gpio+bounces-7198-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2025D8FD541
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 20:07:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F3FB1C22DCE
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 18:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BEB4153BC3;
	Wed,  5 Jun 2024 18:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XH5mJeVg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A94F15380A
	for <linux-gpio@vger.kernel.org>; Wed,  5 Jun 2024 18:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610592; cv=none; b=fvQ3aOVk88067TZw1MoHDxww0NrFYFujjH9Z2oe+IxX8lGbxBf1rm2bgZX9tTJKbSyqDofMk3PkHFk4EIJW337fY81nrlfsm+B+UHLphdU956ABXatGrsb36iu31DGd/6naHtqTiqwwmuK4cXypYxoLxQ/C2Jmp/plMOSmEVK1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610592; c=relaxed/simple;
	bh=e26lRTuAGuJgmNX9Kn+IMmOklmBtw9bMfbnFAWkr9AI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=vFsBcjU90PAGWolMrfDHX7qNT9i7YPfFFPzm9ZunNfro4bwc1XLG+Uj6SANzd/ZtbTcX2T6+pgT/tb7DgBSr1ZAusCmjm0P2EQgDmHSXL4ihvQ7hmyVcbZ+x9av0wbpUGo/bXyY3MFkW/PK36AQIop7S8X3D/4jp0PZcqCjDGeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XH5mJeVg; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-62a0eb1c809so340517b3.2
        for <linux-gpio@vger.kernel.org>; Wed, 05 Jun 2024 11:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610590; x=1718215390; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LqJdwI0kfu08l8zta4NZb2Dhq8rse0Xjye+A2f9mH7A=;
        b=XH5mJeVgmcHl8j+yAfDOF16fwTYZtKejt7N1AtlCr+jCLGqcaGoPbC1Z1OtBWbLeqR
         qu79bjTNXUQMB96hPCihyWcQ7C6/Xdw+CBz8yYYRpPef1O1wHiiuWHHNBbDn6basncKb
         feIXaxtnwyQFOXnN4GFHve22CLjHAlNw4tytPP/A1BS6KFsL/yDzrPALUUPMTBYiZfhz
         /ryZI+W919gn4EVH3x641KfCaNVJQjgsw4/EZWvrftTVoVBJm8vaVE+cvQcDoqWXj/KX
         CClLti2T1o6M0md9Eq1LS/CykQoF/EIHK2zXiNh5MwW8WJgwpltYQmZp/slPCc7x/UQZ
         lGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610590; x=1718215390;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LqJdwI0kfu08l8zta4NZb2Dhq8rse0Xjye+A2f9mH7A=;
        b=qmjbN9m89yIzE96f0ElNxrvotLClbtj1BiUP97gTrsY3kMxD1OsNi5nWaCdu1WhP+U
         xQ0q1OlqQOs5EBg8kJuc1vbCMtPkpkGcpU8uAWNAVZM9zRyeu7p3KvlDEJ772CtCCEIL
         36O3xP1VvXut62NQ7NMlL2NQl3E+Le/ZEG/Iz4cxykoFjSGYdRFTn4xKuHIlQXYXCYsx
         wEqfM3rCkbqyvJK5ioQhQk3mlOrZ3bAClPDO1Po4rF55HGFr6caalI6S59HHBfAI3CZd
         pB6B8lu6lHOitVXS+XSx624taeiDPBqNnmc9z6FOCvZqBZrhWAhlMy91qhel6QLoOz5D
         BNZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXdb1TfyMdxPY4fgD/raQXIj4ryFdzxHc4gzBXCLwc02HNwT3B1iDDCW92WKT0ZUik2scugHsuS2OYEoVI06a1HqzGxQ7Duiw2wA==
X-Gm-Message-State: AOJu0YyQG1qDUcbfMSblj+u44dpBJaBJrLcRvOvgbsMKcr05AmGdq+pM
	XTin4nu11JXgaNrTBkYQo80KPTsjLcIVTftxCsvk+Xmnjb53UCoPRdVlMIEfhK/8RdkfXjJWr2M
	mzNvAaUvxCw==
X-Google-Smtp-Source: AGHT+IFarMTHRQyaGAXOhvjvZC3Ev9S2zTS3Kvs5hpqZrMnxro2/BzrazXCSnRirdCi4qPaGa/c0QONTMKwCWA==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a25:d608:0:b0:df7:d31b:7a29 with SMTP id
 3f1490d57ef6-dfacad1dc1amr763889276.12.1717610590398; Wed, 05 Jun 2024
 11:03:10 -0700 (PDT)
Date: Wed,  5 Jun 2024 18:02:37 +0000
In-Reply-To: <20240605180238.2617808-1-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240605180238.2617808-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605180238.2617808-7-joychakr@google.com>
Subject: [PATCH v1 16/17] soc: tegra: fuse: Change nvmem reg_read/write return type
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
 drivers/soc/tegra/fuse/fuse-tegra.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index b6bfd6729df3..1b067dd8a585 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -96,8 +96,8 @@ static const struct of_device_id tegra_fuse_match[] = {
 	{ /* sentinel */ }
 };
 
-static int tegra_fuse_read(void *priv, unsigned int offset, void *value,
-			   size_t bytes)
+static ssize_t tegra_fuse_read(void *priv, unsigned int offset, void *value,
+			       size_t bytes)
 {
 	unsigned int count = bytes / 4, i;
 	struct tegra_fuse *fuse = priv;
@@ -106,7 +106,7 @@ static int tegra_fuse_read(void *priv, unsigned int offset, void *value,
 	for (i = 0; i < count; i++)
 		buffer[i] = fuse->read(fuse, offset + i * 4);
 
-	return 0;
+	return bytes;
 }
 
 static void tegra_fuse_restore(void *base)
-- 
2.45.1.467.gbab1589fc0-goog


