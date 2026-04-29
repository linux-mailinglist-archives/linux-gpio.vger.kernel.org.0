Return-Path: <linux-gpio+bounces-35746-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JlUMVmB8WmChQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35746-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 05:56:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 717D448EE2D
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 05:56:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 57AF73085AB3
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 03:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1315B3112BC;
	Wed, 29 Apr 2026 03:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mkcd4255"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A727388E6B
	for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 03:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777434705; cv=none; b=F1tViJouSxpREp/WckTGx0Mp5SchC7T2MCIucg9ePjPZFEZ733ixOl2Bw0Xd4Opr1/XaC+50atvyjXwU4FEjo3A4sY6wsYH6Vg0aQRGa4CGw67Qx1nGNzfa4n1bgLaQWErsxinhtgZwGeAC4XuTwEl/4ogXAvW0W74ozz+UO5RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777434705; c=relaxed/simple;
	bh=8ZTEWpljO0UJ4t5lvQukdUtvqSV7WB3UYomQlWmFqCw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CESX+3JmlpBh7JfS1ra2zu4ppNldrWvLhRoy6YDeBdgQttnMRkRUXbx1oRC3UubgQFX7PusOzBUzDqfl/ffdR6NmzmkUV0vZOWfMglmkq1gu8Up0AaeCD8nOmOOXVjvlim3VgwMHoqTI1lvdMo/JfPJxZezErfSWzyh9hK7OW0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mkcd4255; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82cf636dac8so5209102b3a.3
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 20:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777434702; x=1778039502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJRe07kUVUgqjg/ti8//IJVD4xo2eVRTabM2wx2IjhE=;
        b=Mkcd4255Nezp7I6VHDgWlkeZndr7xVbo42+7xJyvUcjyQ9FTXuCQUEmRsq5ZBBhR3+
         Tx1+QesUqmYnhfKigrzINV3559Igkt7vsZiTAaQeOlzDTnbFtM0FK8qw0yI8+A8dt6BK
         YhWyRBFRGoLXLFfGJh4wGYWb3pRou+rCjKpVDtZuny6LyjXP57qocYNoSAaAvdBfcdeD
         AjfRGMtgR9Cpqnh9CXx4EMCkY7j4q3kRcyuvrXjzrSsFFnFUHyS0mRKSyM+cmZfDaBsa
         usHYHENHKptKNSDKAFstWdTkkUOck/yF+avm8oSFE43u9QxA0VjcE21dNweYJXpDWsTs
         XmIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777434702; x=1778039502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DJRe07kUVUgqjg/ti8//IJVD4xo2eVRTabM2wx2IjhE=;
        b=XV21qmGFHzHC980Sd4NMDZOutLArrMHLYAI9QmKN8tdKV9EjxoKkjqRDAkW8nztB2v
         u9SSMvgSVw2CErNW8DvWx/FgqS5nR9IzAavVkR+fKWRKCb7TeeL4Hmt3zeubDhgGluv7
         2qW3rdHXwAo6YVFrwPrM54/LbI8d85EX6i0mbPc+0zmpjRWltmCrih6GJmhF9e57O51o
         zbII/OBsdJe9ntDS2CKgutsh3PuoaaD8JFHNxJ6fN/b4MJ/uQ+w27DdS2RgxdEH94kbg
         m8su6AbWwE51oyC2t80aaRuuZKPPD19L12aH2t+Qq1Ngj59JvAs2CAosjvMBNYXoRLQ9
         NFpA==
X-Gm-Message-State: AOJu0Ywg5bYVmJr/ImNEgSk+kA0ocI60oqPmLpjzgAuVIUJNwkwXnoyy
	lnI6w6nYJzHQw1LwvE+y2ccLLsYaSWPnfWDeFluVmoNRxRkeP7DLXv0F
X-Gm-Gg: AeBDiesf9bQ2sKb0Axj5QrPqTp1Ol6GIRQnALHGKANgiRgSjEaLTiLIxfH8C4M6Z3KB
	285Rs06tOzc/a+bFGtpKd9qA4UnrU2dArJKfRqXHrMfH5DOuyWMMX6LmJWMy2MtZoZOLEb35gw9
	8MGjilufPkgbmAu2M7z5P8ydvPDG4sMb/egJBigAjrG++E+4djWI3ulz9OspTbyqp8yd1kkXE2N
	URM3qnCbfg04F6ZCxKb9smMMkKDYLe2BjDdjYY7f1OwcK86e/691/CkjBZ4jGAAf+hLybJZ6squ
	IDzQBHeXFOS0GF54qVRJ7K/wP9NefHUCrqthWFpozutCAnOSPz5cFZsMkZt0E1545dUHD9zqnNA
	MDSX7EwBXvf00x+4qDzDuHLkRhzjMg/fJt3FELVKC53IUPzwcyUF+fS+ipKtgFyfCMgyL6gapnA
	WTF419yr1yuZ55tHtjSNp6wfHDCM38HeBFTAtKPKWvhF31zBAMsE0MV+f8AjPY3wPi
X-Received: by 2002:a05:6a00:3486:b0:82f:72e6:ed4 with SMTP id d2e1a72fcca58-834dd91736fmr6337129b3a.0.1777434702416;
        Tue, 28 Apr 2026 20:51:42 -0700 (PDT)
Received: from happycpu-p1.. ([121.160.151.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed5f30ddsm502899b3a.26.2026.04.28.20.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 20:51:42 -0700 (PDT)
From: Chanhong Jung <happycpu@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] gpio: 74x164: support lines-initial-states for boot-time output state
Date: Wed, 29 Apr 2026 12:51:34 +0900
Message-Id: <20260429035134.1023330-3-happycpu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1776872453.git.happycpu@gmail.com>
References: <cover.1776872453.git.happycpu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 717D448EE2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35746-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[happycpu@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

74HC595 and 74LVC594 chains retain their output state from the first
serial write onwards. Today the driver always kicks that first write
from a zero-initialised buffer, so every output comes up low until user
space issues a write. Boards that rely on the chain to drive signals
whose power-on state matters (active-low indicators, reset lines, etc.)
have no way to express the desired initial pattern via DT.

Read the optional lines-initial-states bitmask, recently documented for
this binding, into chip->buffer before the first
__gen_74x164_write_config() so the chain comes up in a known state on
the very first SPI transaction. Bit N maps to GPIO line N (matching the
nxp,pcf8575 convention); on this output-only device, bit=0 drives the
line low and bit=1 drives it high. Property absence keeps the existing
zeroing behaviour intact.

Suggested-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Chanhong Jung <happycpu@gmail.com>
---
 drivers/gpio/gpio-74x164.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index c226524ef..5ca61cf52 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -112,7 +112,7 @@ static int gen_74x164_probe(struct spi_device *spi)
 {
 	struct device *dev = &spi->dev;
 	struct gen_74x164_chip *chip;
-	u32 nregs;
+	u32 nregs, init_state;
 	int ret;
 
 	/*
@@ -134,6 +134,21 @@ static int gen_74x164_probe(struct spi_device *spi)
 
 	chip->registers = nregs;
 
+	/*
+	 * Optionally seed the chain with a board-specified pattern so the
+	 * outputs come up in a known state on the first SPI write. The
+	 * property follows the nxp,pcf8575 convention where bit N maps to
+	 * GPIO line N. On this output-only device, bit=0 drives the line
+	 * low and bit=1 drives it high. The bitmask covers up to 32 lines;
+	 * any further outputs come up zeroed by devm_kzalloc().
+	 */
+	if (!device_property_read_u32(dev, "lines-initial-states", &init_state)) {
+		unsigned int i;
+
+		for (i = 0; i < min(nregs, 4U); i++)
+			chip->buffer[nregs - 1 - i] = (init_state >> (i * 8)) & 0xff;
+	}
+
 	chip->gpiod_oe = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
 	if (IS_ERR(chip->gpiod_oe))
 		return PTR_ERR(chip->gpiod_oe);
-- 
2.34.1


