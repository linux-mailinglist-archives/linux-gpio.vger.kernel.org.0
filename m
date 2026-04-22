Return-Path: <linux-gpio+bounces-35363-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCUjA7vz6GmQSAIAu9opvQ
	(envelope-from <linux-gpio+bounces-35363-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 18:13:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 342FC448565
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 18:13:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6318530DB6F7
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 16:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A29237F017;
	Wed, 22 Apr 2026 16:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U4rbNoMF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EC438B157
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 16:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776873919; cv=none; b=S2FYxtUNtxHweVgFtlZ5TMNx+KGLclsv/qQRAOSujc3rhWYJr1Yh5ZU/2rKZfBbSGkS3puTVPExI5lDPBBhfpxuiFrCFTwkkXxHABYBJ/+yy2AUljoSuBfTY3uD2u0Q5BYqP6GMdH1ABRx2zfnFS03gZgbulFdDd772m2dhTvOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776873919; c=relaxed/simple;
	bh=VgOr825JFd85qpx9ZSe3P5UBh8fNbkiALkxKCmKvveY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Wpn3KcAOKAK+SRYdhUsx0hVUcAXwQxQvrIEJl3s7mq6WzpNbwnsCfXveeXxf3rzWePMExCHnxEur8B5uZt+P0Hy2BlIxy0BXkfzEjjd0wKPwd1uPNLV7Xa8P44tRdvmNJ+cLK7Eiu+0oRjqwZvQ9lZDmYNxBpxnpaeIwT8x+J2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U4rbNoMF; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82fcd0aa2dbso1052783b3a.0
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 09:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776873916; x=1777478716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r78Ht7d3rD0nKWuIXu8vxDpeZ4/LkBaXzBNsFb0PtOo=;
        b=U4rbNoMFQuAci9G8rVh8tGL7tiwcAwZh5UnmQHdJLpbKQr2/OSu6KSulDw1MA9q+OV
         1TRgxivxt9TELwvEbRkSD88MiH0891ykjZtgaJM17+Ttzxgw+nPHvE+cpYB1JX2SbOtv
         0zOFpXu6E6StIla6WPK/dmSiKuI3Cql5N4lK5NjsLWS1II0EhRT8Qasy5EFic9IDjj7Y
         ijv4H6C121lEUaDJ53EOw1Je86sDpOZEfqD6kNmAi2ZIB+e4eypTC2gV/AOj13liTgLq
         WeLqQeKE0TTit0+x5v/aJAGG0CZxh4HpqxIgCmiN5X3tG0L49BcEssOmH3FQyDsvDObZ
         w0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776873916; x=1777478716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r78Ht7d3rD0nKWuIXu8vxDpeZ4/LkBaXzBNsFb0PtOo=;
        b=CqutqnkAlKODQpun7QrK297g9wyFT1qc2c0dtB71bzVjZxJeLEyNS8DvAPLX0tAKmy
         90/E63o8o4tpjrm0nGlnMg+7FTBqhcFd0X2auNRAONJYn9sAa36hGQOKzC1DfTSrjNDz
         NcUCdZ7YM5RxZ3KzxQfqLF9vFd1lgDySb7v3MAipVSnRe1dqYtSsoDEvkDr8v/u09897
         ENzNi1y32XLmFDz0qCbFPtIX14fbw+H110Ne/3x3dZASXhcNd6+xnHqA3vLmS6sPsCoF
         HeZLJvaRg9TEvafk1Uu3H4wP+stWkKWQNZsXssMP4bn2grJSlc5rK0JkzeZEj94JNH1y
         mlOg==
X-Gm-Message-State: AOJu0YwpLIBzXvUUMVgbDbmjrqZOIFn97EgNXVjwUe2K7IlsPbbV2O9f
	Ou9ki+B8y6qfFrREBQae0DtIx6Nq4cgCDtUB7JtK4bgu1HCzzlPioskS
X-Gm-Gg: AeBDievrNHRxi0a8tn7afc7t5bZg9nOCYrjRpYw3xG+hK5Qvo5f2ElxACB7Fb76QEjQ
	3L7dGObtHeuyTepQy1vZ7SeTbmOAVQOuGVK7Tv6k2phQgZtVIVFTg6vBLfoh4YXF/HcQd9LhTK2
	LcvpXTl60HYq9M00yxa63bruPLMcnXUHvPLcDKpY5EaaInsQn92HA1xEz6duuf3qIS+jx4Io9me
	gmKQrQ+4j3J9ZzmUqqCYKyfNvmSX+rqpMe3B0KapZGkFZpH9BXWh/GaEVe7Q1XLRPwc83JQaBMG
	O/DSEe+NTPHByVhv3zjHuUsQi98+q9yIsXx99RILxDAkOwKA9/++p65f38vbfGI/B3heNB/wHIi
	ttXxzRWFcEqD/MkArqGHiqeTD9Tqwqff1Fs/aoqaOQTe4niEwJQgNn7+Cw6Bkz3MpkGJfNbnE9E
	tbK/y9F42UHd0/7yuNTAfqPx2tlyH+k1SHw8X01hxUeALcHV2QEcdah8AOHlSmhTNn
X-Received: by 2002:a05:6a00:3a20:b0:82f:50ef:3eab with SMTP id d2e1a72fcca58-82f8b54738emr19822095b3a.28.1776873915614;
        Wed, 22 Apr 2026 09:05:15 -0700 (PDT)
Received: from happycpu-p1.. ([121.160.151.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec003dcsm18151031b3a.52.2026.04.22.09.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 09:05:15 -0700 (PDT)
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
Subject: [PATCH v1 2/2] gpio: 74x164: support 'registers-default' DT property for initial state
Date: Thu, 23 Apr 2026 01:05:04 +0900
Message-Id: <77cc91a966bfcbeaad825b8be607dbd7a85dbbdb.1776872453.git.happycpu@gmail.com>
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35363-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 342FC448565
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

74HC595 and 74LVC594 chains retain their output state from the first
serial write onwards. Today the driver always kicks that first write
from a zero-initialised buffer, so every output comes up low until user
space issues a write. Boards that rely on the chain to drive signals
whose power-on state matters (active-low indicators, reset lines, etc.)
have no way to express the desired initial pattern via DT, and must
reinvent it from user space each time after probe.

Read the new optional 'registers-default' u8 array into chip->buffer
after the buffer's size becomes known (so __counted_by() is satisfied)
and before the first __gen_74x164_write_config(). Absence of the
property keeps the current zeroing behaviour; an invalid size is
rejected with dev_err_probe() so that dtbs_check violations surface
loudly at probe time.

The matching binding change documents the property's layout. The
corresponding U-Boot driver (drivers/gpio/74x164_gpio.c) has honoured
the same property for years, so the two bootstages can now agree on
the initial state without user-space involvement.

Signed-off-by: Chanhong Jung <happycpu@gmail.com>
---
 drivers/gpio/gpio-74x164.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index c226524ef..b433a4a61 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -134,6 +134,20 @@ static int gen_74x164_probe(struct spi_device *spi)
 
 	chip->registers = nregs;
 
+	/*
+	 * Optionally seed the chain with a board-specified pattern so that
+	 * the outputs come up in a known state on the first SPI write. When
+	 * the property is absent, the buffer stays zeroed by devm_kzalloc()
+	 * and the existing behaviour is preserved.
+	 */
+	if (device_property_present(dev, "registers-default")) {
+		ret = device_property_read_u8_array(dev, "registers-default",
+						    chip->buffer, nregs);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Invalid 'registers-default'\n");
+	}
+
 	chip->gpiod_oe = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
 	if (IS_ERR(chip->gpiod_oe))
 		return PTR_ERR(chip->gpiod_oe);
-- 
2.34.1


