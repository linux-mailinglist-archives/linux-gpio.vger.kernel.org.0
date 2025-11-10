Return-Path: <linux-gpio+bounces-28301-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C31D8C4795C
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 16:38:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AC283BD6E9
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 15:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D36B323D2B2;
	Mon, 10 Nov 2025 15:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="El4VTfY9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB9F23D7F5
	for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 15:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762788351; cv=none; b=n3E6K4jGDaJfsLZkR0Bk99w0QgQSPnXn0UiIdxQ7wwq6MNLZsGyGob16ux7IQXrmaTpbpaUOnGVLOEqlqhsWLX7uihElq8QtP+qHSzFd8iZKukko94QUlUS2QdVpAG5AsOWcxndHKqUh/xomHbTUhMM2vwICUjuMLFe7QsOQBSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762788351; c=relaxed/simple;
	bh=55cmDK/DB9d7aWyV3KRW+2aWkZsi317dmr5DmE6lvzg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fKDnYJsZhgfFmzbj6AgOHqoMG30SpA9GyZWWkBUbUxsd7Ee97h5E3EA0HnU9qqb7WFLkWo6pwsJCNJyl1mN9K/mA9PwnH5O6r+VBEgfgUNr+pgCMY/ssJehenfuq+bvNc4m34c1aspwKsTej1HbDvdE209otxf+IHg5d7Y1H8kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=El4VTfY9; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5943d1d6471so3134808e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 07:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762788348; x=1763393148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Y7AbbQjoW2c7ZR6ncveQ52gAnz6KIPcgn2CEQordzs=;
        b=El4VTfY9jnI4I4m+jLt5IZRt5W0PMDjX2ohDPFhbjpYofJyXeKhlEWguQ5T2/hXwzH
         u5kXnqRZKBdVFZdit62N4SHK2LqX/jpFL0gHaJ9qoC8zaszh2FTp8AgDujO/H2gg5wgt
         esk+mnuNSI6P8OjvTgzwcOuJrtSWneZoQWWNl9WIqj0Er8ciRmCxdNFwC8DR7YtPJWu5
         1U4+Ybh9tUKakkdIULGZKUqxxs5dv4NASkzGsC5qYeysE1g/+wsYis90zREsG8dLb6s7
         UTtDumqbJxSmEHqou+A6idHLOftjhcReZ3HlcY7OPWGyb5UMuKjMnqKwe/mlsKmReuxi
         JmWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762788348; x=1763393148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Y7AbbQjoW2c7ZR6ncveQ52gAnz6KIPcgn2CEQordzs=;
        b=whFR4ms+h3IKMg7j7RJ6IqTI88jdRHAziWE5eYQsJGo2drlSmjyJJc5Uv1K6Jldgmh
         tvveQsptx2JA/ZqVTTqHt2+ge0jRswIdKGpkG7sRRx2p+bRT6MtScND45ty+ZLp0D5AL
         SeOpn06MpkaMCQpQi542vd5NlbASBtW3XypfNDEkZiv4vmUsyM/PBhKSvduqDT4g5DE7
         oWR0ylHtABzN6gI39GRWFcd4Wh3ydwgdiVvhoDwvZtkLOsyhOS3ubFP8u58+6cWLUqHA
         2K059x+QtrRuoIS7g8Pnj1z55GToswofNNb2kZxRx5TeGXpL7WCr85u+zPyufsjMdjuj
         zr5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVzXAv5kQYk+Gkiz+OEjDWjhcz+ybKk/fK35ZeJy6ItMxMKVvdXBQfA+A1zI15KlBwWfYJE/l5XHf0T@vger.kernel.org
X-Gm-Message-State: AOJu0YzCUOVQSxBXhg8a8LRDrXDycM2/C6bcECmmT2k7xD5spQM23+t1
	CG/hZdodZ7g2wwLoDMk0NFYMTPK2ev8Wt4I+JB3gzHIGplAIQGOfNEpe9mCVdomz
X-Gm-Gg: ASbGncvNQH5M7GM/1CDRvbii2OvwgOmp+m98kIpjOOQTepL2J9yhWnZ+xGq21XfHmCa
	Ld8ccX8ItmORW1T8LzfhHRa/5B44Li9zeWzpjrSL9KpAwYU3qnVtdvgkO7sq51hT69I/q+ZHFfh
	bDDwqELbPEyOIQIMESpEORBr7T5PLwZj1P8hgkVnbFo488z8SJa+2pCB2ur22cAKY8Qmr1U36I0
	0YcCI4cc4AyqCAFjGxvbsm5K6TPRd2xSH0EzE4fpH7FMtW1VTVFuk++wm+cuUajwrgryeuy6z+Q
	VCpmpqc7zAqHosSui67yDRUnuJ8DLEo4RrSnXZ9oEO+eh1FIGp0lIOJURwNP5Lzg93/S8WqdfEa
	c28Y7AbFzVUVj5qtMaXK7ROma/Ia15YWAh3XD9fzFM9EAKNA3FTzH4JPokDvh3VF9y4Yr21ZtC6
	srv6OgOaaVYImXy23GhEbHsnv4HG+mIUV5Oyy2yQhdxNLY8fDKCjdItmuXP/1YgP8HyAdGLA==
X-Google-Smtp-Source: AGHT+IFZ8Hdn9bIBL2aLClDGCYweA+vbXjTWrk0GlGrm/tskYdFblhNV3v9npKdqEcfWPsY9ou6LMg==
X-Received: by 2002:a05:6512:3d04:b0:594:27fb:e80f with SMTP id 2adb3069b0e04-5945f1c258fmr2134855e87.37.1762788347931;
        Mon, 10 Nov 2025 07:25:47 -0800 (PST)
Received: from localhost.localdomain (broadband-109-173-93-221.ip.moscow.rt.ru. [109.173.93.221])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a013a36sm4059381e87.14.2025.11.10.07.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 07:25:47 -0800 (PST)
From: Alexandr Sapozhnikov <alsp705@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Alexandr Sapozhnikov <alsp705@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5.10] gpiolib: acpi: handle overflow check in acpi_gpio_adr_space_handler()
Date: Mon, 10 Nov 2025 18:25:44 +0300
Message-ID: <20251110152545.11-1-alsp705@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added an overflow check when setting a bit, since the function will not work 
correctly if there is an overflow.

Found by Linux Verification Center (linuxtesting.org) with svace.

Fixes: dc62b56a68d3 ("gpio / ACPI: use *_cansleep version of gpiod_get/set APIs")
Signed-off-by: Alexandr Sapozhnikov <alsp705@gmail.com>
---
 drivers/gpio/gpiolib-acpi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index 834a12f3219e..dfb421bff979 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -1069,6 +1069,11 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 
 		mutex_unlock(&achip->conn_lock);
 
+		if (i < 0 || i > 64) {
+			status=-EINVAL;
+			goto out;
+		}
+
 		if (function == ACPI_WRITE)
 			gpiod_set_raw_value_cansleep(desc,
 						     !!((1 << i) & *value));
-- 
2.51.0


