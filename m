Return-Path: <linux-gpio+bounces-7187-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE11A8FD4D9
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 20:02:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E2CC2889BA
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 18:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DD77195989;
	Wed,  5 Jun 2024 18:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FJuZggmh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7141957E8
	for <linux-gpio@vger.kernel.org>; Wed,  5 Jun 2024 18:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610426; cv=none; b=gYWs4H5w+Eb+bjvVBCa1RgBuoxMUS2g1lCQhhRIyMgHaFaGcHl5lWX7MNwH7m+l/Nnp8ViHfbp0L33lTgbO4GyGEvRT1pXQRCZ4TYO3ta8HsyaLlL9U/i7yAY6w+0JNYUZdZKG6GuCpOBfQ+vtyDwChcd7DRd/JLewaYRVghGh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610426; c=relaxed/simple;
	bh=M/eENeT34qITqyMJGoLfrkcDLPx6c2gqtgSpfyqShjk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Xn42PMofL7RbkXVwrjsX3VSxxT3YZva4ZSGc+kqY6gywQc6U2FnbvncDpVeO1yB4R1h9ZMNrX9eS7t87wKmvAxDtFaig1jhiLaKfuzbQD7gw+kk59hLRtQekjy6VUpSHHfhsc2JliYHK2ZLKrv7AmzPjkMcMnNVuBMk4aUeBpBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FJuZggmh; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-df7a6530373so128565276.0
        for <linux-gpio@vger.kernel.org>; Wed, 05 Jun 2024 11:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610423; x=1718215223; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oWEvs7lXuHPW/wbGZW3HASpAVL3QgOZ/ef+Ervw8nvw=;
        b=FJuZggmhFGhWp10YbseBbhbNSwZbD3YkwUxXiS6vcF3km6ch/KL4ccGCubjjUswrvs
         stPWi6m+aTLRC39j/3ob86S2Z6NSr8O8AxWYWzc/hE+2uMm67w4Lmz1S94v/l/H2c1hJ
         O+dO/BeG+dPImMkDS26dKkcAxhVypHz9QHnNm3SysGqu+1oZzO8mtV+2ZAtcfMJ6UYcp
         ai+ktg2KHiTPkI3n1qzSaKTw4JfArzruUWmO+bX2v6Wv+JKurz/SBGIfcsiP8wS4dc4B
         B6pVh21yuxtzozIJA2Lvp6iwb6u37kIgRlnXtqQ/gmB7Q0nOc3TCGGSkWeK8EtBzAwJO
         uA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610423; x=1718215223;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oWEvs7lXuHPW/wbGZW3HASpAVL3QgOZ/ef+Ervw8nvw=;
        b=RIKCbAKtW40+6yz0yNbCoOlKyg/cCLGSmN2l6sRko+zA9Q5FgjeCesrmMZjgOJ+If3
         4uX07bl064DkbaxtDGhTB5Vr/GV2aJAFmqN4jb8mwwUclfBysRYIGVL4GapIq1JdevZW
         tCLA4Cky6M4Fs4/G2FtWY5n3BAR301jrNZ2zIbMMuc8DsEi7nTQUVahpLNKnSCm/XR3r
         GOQ4q0Vczmuy7volIE/quPPenCtkbasg7UEaYR6u82LT0YlBtE4blXwqO2A48ly7zwXm
         v2jhgp5+WPtxj8himDcpLD+PhHR9k4UHJANOUAlfAzKDOc6dJgAYT2PsG/PdFzckeW4p
         /nVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcXBzoWOPM6yUJ2LunoqxLxz7jskcUgfq07AEMP4yoA4L8Vgd9rwWgsdv8ZyGN9zxjCxsJC1ofWIeljCJrMHliMWeSqYHdwIbSYA==
X-Gm-Message-State: AOJu0YyQ/Tymb6exgaZKwlyMCqOpxMPbhzzs3z5+YaV/vNv1qDMVS7NE
	rWNqVjlo5ERDJfKSMx8+7XiaB6RegMyixd7kUEtHmL44LFEeWcu5xJ+Ra+nAyQh77LWo2HzSwAZ
	Awa5c2gwLoQ==
X-Google-Smtp-Source: AGHT+IHzBpKnrggHmMHMkvKX90wRDGnyxC/rya4wNnolxBy/S7eZxADMs2JOhL4gs65LRvS4Cl380vcS0L4//g==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a25:9004:0:b0:de5:a44c:25af with SMTP id
 3f1490d57ef6-dfadec0b255mr68771276.5.1717610422643; Wed, 05 Jun 2024 11:00:22
 -0700 (PDT)
Date: Wed,  5 Jun 2024 17:59:49 +0000
In-Reply-To: <20240605175953.2613260-1-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240605175953.2613260-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605175953.2613260-6-joychakr@google.com>
Subject: [PATCH v1 05/17] misc: ds1682: Change nvmem reg_read/write return type
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
 drivers/misc/ds1682.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/misc/ds1682.c b/drivers/misc/ds1682.c
index 5f8dcd0e3848..953341666ddb 100644
--- a/drivers/misc/ds1682.c
+++ b/drivers/misc/ds1682.c
@@ -198,26 +198,22 @@ static const struct bin_attribute ds1682_eeprom_attr = {
 	.write = ds1682_eeprom_write,
 };
 
-static int ds1682_nvmem_read(void *priv, unsigned int offset, void *val,
-			     size_t bytes)
+static ssize_t ds1682_nvmem_read(void *priv, unsigned int offset, void *val,
+				 size_t bytes)
 {
 	struct i2c_client *client = priv;
-	int ret;
 
-	ret = i2c_smbus_read_i2c_block_data(client, DS1682_REG_EEPROM + offset,
+	return i2c_smbus_read_i2c_block_data(client, DS1682_REG_EEPROM + offset,
 					    bytes, val);
-	return ret < 0 ? ret : 0;
 }
 
-static int ds1682_nvmem_write(void *priv, unsigned int offset, void *val,
-			      size_t bytes)
+static ssize_t ds1682_nvmem_write(void *priv, unsigned int offset, void *val,
+				  size_t bytes)
 {
 	struct i2c_client *client = priv;
-	int ret;
 
-	ret = i2c_smbus_write_i2c_block_data(client, DS1682_REG_EEPROM + offset,
+	return i2c_smbus_write_i2c_block_data(client, DS1682_REG_EEPROM + offset,
 					     bytes, val);
-	return ret < 0 ? ret : 0;
 }
 
 /*
-- 
2.45.1.467.gbab1589fc0-goog


