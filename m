Return-Path: <linux-gpio+bounces-26804-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7F9BBD450
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Oct 2025 09:50:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 04ADE3497FB
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Oct 2025 07:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2973A253F14;
	Mon,  6 Oct 2025 07:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OUThJG9I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4FF24E4BD
	for <linux-gpio@vger.kernel.org>; Mon,  6 Oct 2025 07:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759737001; cv=none; b=qDNNCT4S2ZUmHgmFvCIbI/sWk4E51psRkhSvmlRkBRiEf8dCWSeVvCWUn+IyJypMUIUfopCvkljUZeLftHiupz83n1UdFyTABiYtIe+Au0k5vh1vmsDmt8lx29Mhhq6vVrtPQxb52Z9rZdOVsQiJjphLpe/4zDs8Tau92eJGzHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759737001; c=relaxed/simple;
	bh=pXS5dbkO/H2Yr4ZRPX6HKaCB2AX7eTL3ZS9U7ZkbG2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YTqrNbaPsATIaeHxrRC068iv5rK9ruilfzfL8x2wFRK1Hvai5J9RRI0sjFAnge0W8Rqji42YG3wDuJOv031DuwxZNKsBIxPorBapFHCwOV7En72CAyssLi3oUmjAceDbpRaKLSyccVpMlJa6gca/dSlL0jztpgTBPkjkrvnx23o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OUThJG9I; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-57d8ff3944dso5628099e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 06 Oct 2025 00:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759736998; x=1760341798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kx4mAPmpKwCaHSWBKeBovoTZO7ReFcGeFzDJfyhWBSA=;
        b=OUThJG9Iy0KTuqEOJiX/yvNullwO/rsK3i4d1KPAYXUOCkxbAFFCeZzWm1wP4XwJ6m
         Lo0TUdfddDHnOL6OrhoPeHadghklfp8eBocey03pwt+XIcyJNH0DEITstbfA3rquoeEo
         e5IkGYTnlQ8WLIA/031Rvy3+f2+bXdVEt94AzGBctg5NBajLcTlCIZUDcobketmR5p+5
         0oFdIvccsbffvnQxV23+mGT9xhUSM3DOkRf73LwP4Ga+pbhhoD3GKErEHzLKx1/iqqbd
         vz7GQJfPdeKxdQ7qjn9mQLu3JoV5u9fEu9s3/SN/LsNWtmzXJLyolFpv+Vh0Nfwf0zf2
         X1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759736998; x=1760341798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kx4mAPmpKwCaHSWBKeBovoTZO7ReFcGeFzDJfyhWBSA=;
        b=nbW0pRL8iU3tcLCUHXhNU0UjQ02n/VLlqbZnzeUG5NJvfsZLgGwVSSJY6u4TtENww0
         3XwtyLxswGjJYghE372x2+N/LbhXgBvVREIaP8rWM9fOAziE9+swszx/V3oLO6+d6j1b
         +rzLGzwsk2M/DrKEOKWE+9daA3ODHOFXBwVEErbW4dDVFa4k6jxTEjMwetK9k7qkVhgP
         etwruH8BoHxAFu6I/UFiWrXXtZj5fm6aN04zmWPUHiLLc0BtJ74qZUXrl+8zNSaymEsS
         EDPd/11C9udT9nypVtLXDjxYEd8N9SsnV9/WsqcZTxDd9ESz7J0zpBI5XW5lMT5H1kED
         xjWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZbUtfpN20pL6relykCnsKAiBlJrAPLUHHZKj/qsEeu9nMWw8ujbXlqfysXcTSB0/75h3jYbiuzyAi@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9/wA4L6j/YCTEz1Rw31w0c0TVc2qyP/R/+4kzaOuduHRtnWTh
	AtEjiODDQNnFE0/aIPQWPyTTGgzn/cKyY5fC0uWHPB6lhzE/qP7hI9Oy5jEVo8ev
X-Gm-Gg: ASbGncuklVN+XUssQhS5WJ+go9VtoJprp0DUVtZN/0pXJtNIC66Fdy1Dyv6AUQzLNlN
	wYY8c4aeG7oY0aLvpLnvR4UsGugiNBWP0A3PzN1CSCVoNNB3XqtZZQir04PgPGMEpkjFVjYlffb
	w47XMcyud0mv7V0ofsiT8OA4i5TAERCvz+/Kpv9/dFT0JY3lqoeG3PPbaXpwYcNeleMvYQQkq8M
	XdiLCjGaFf9J2FAUoe2RDucF5AFIc7VIAQZlvENQyZxpji0WWNRTqIytTKK05T05a/JNXcDm7F1
	GiK8BiEG4WnyVUDn8M+b91bMDjVV+T544Bx/UBtp0VXwE3i4ryBArHVPHjgdAsarvXSluxSwPly
	f2+9ebtSL2ocqbDh4jlyE6zLxK60oGcxjGIEgTN9/zyyaRXBb3nUTSpVLnDs6E8e48v2idj5tre
	SBXfN+DLf1TYBRmG6s9aGigzj5HyM=
X-Google-Smtp-Source: AGHT+IFi0Cs5BLY65bmuTIfA6LXsAl2lVAty1X8RjOlQSSXeuqxgWf6f4+HInY5D/ePmJSblqTZL/w==
X-Received: by 2002:a05:6512:138a:b0:57e:f60:2327 with SMTP id 2adb3069b0e04-58cbc96084fmr3386105e87.49.1759736997816;
        Mon, 06 Oct 2025 00:49:57 -0700 (PDT)
Received: from wpc.yadro.com (host-95-152-52-178.dsl.sura.ru. [95.152.52.178])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d21csm4817962e87.86.2025.10.06.00.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 00:49:57 -0700 (PDT)
From: bigunclemax@gmail.com
To: 
Cc: bigunclemax@gmail.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] pinctrl: mcp23s08: Reset all output latches to default at probe
Date: Mon,  6 Oct 2025 10:49:29 +0300
Message-ID: <20251006074934.27180-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Maksim Kiselev" <bigunclemax@gmail.com>

It appears that resetting only the direction register is not sufficient,
it's also necessary to reset the OLAT register to its default values.

Otherwise, the following situation can occur:

If a pin was configured as OUT=1 before driver probe(Ex: IODIR=1,IOLAT=1),
then after loading the MCP driver, the cache will be populated from
reg_defaults with IOLAT=0 (while the actual value in the chip is 1).
A subsequent setting OUT=0 will fail because
mcp_update_bits(mcp, MCP_OLAT, ...) calls regmap_update_bits(),
which will check that the value to be set (0) matches the cached value (0)
and thus skip writing actual value to the MCP chip.

To avoid this, the OLAT register must be explicitly reset at probe.

Fixes: 3ede3f8b4b4b ("pinctrl: mcp23s08: Reset all pins to input at probe")
Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 78ff7930649d..23af441aa468 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -622,6 +622,11 @@ int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 	if (ret < 0)
 		return ret;
 
+	/* Also reset all out latches to default values */
+	ret = mcp_write(mcp, MCP_OLAT, 0x0);
+	if (ret < 0)
+		return ret;
+
 	/* verify MCP_IOCON.SEQOP = 0, so sequential reads work,
 	 * and MCP_IOCON.HAEN = 1, so we work with all chips.
 	 */
-- 
2.48.1


