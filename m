Return-Path: <linux-gpio+bounces-36297-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFl2JBxV+2n+ZQMAu9opvQ
	(envelope-from <linux-gpio+bounces-36297-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 16:50:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F115C4DC962
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 16:50:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1AB623011065
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 14:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EC3C477E20;
	Wed,  6 May 2026 14:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="AwZu543A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08D5344D88
	for <linux-gpio@vger.kernel.org>; Wed,  6 May 2026 14:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778078968; cv=none; b=iyf8XZt+k3n9Oe4rlFZC4etkz4VKW/4QHvtzodKSMBjQqEj5ZdaQpgDqsGXCnjvrD7EAFSu8IuQSZCtCVqhCkMx1bhG2QUunxzPaidqXgmggVIiqFqHgU+oDLLswwT5E+e3HhplLsYsTe5goA70TbaL7zwX0eUO/WGe7SiRQSMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778078968; c=relaxed/simple;
	bh=JAwO0GnFewziOCTbfnLEhiDT49kC56alAv8N5J+cYc4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XORaYHcitgL49RS7aaQTkN0kx80coX/pJFFcwbRL628yP9n2a7WfEUbKBFP0P7IXQ+9l5ArKZHB0ltU6LrHeFW5CvO+19+Ep4JG6SUCLtAnl8yxJZ4ZiLOxEtcA5oUHlovYgkkWsQs/PCgKQZ6iJcv5wPyarq88eugmqyfKRu1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=AwZu543A; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-44a14580111so4302392f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 06 May 2026 07:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778078965; x=1778683765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mgapLd3aySuAQ3iWNsV/rjtWMsIkyAS5NNwh4PX1s+k=;
        b=AwZu543A8oyZx+Tm2Cu9cJEhL2EqBSA+crffBZdk9Tt77tTNFVplORPOunKaZyRSTp
         gdznyQZDKdOlPeEtmz8GR3OIOBPFjuyGtYkvgAmbaqUCVCYuYKy6JZ0InDm5jsS3fzm8
         ve43Nh0k5LTzACGP/URXnozmt8/evldoU7LUUfWomi/b6+bOauZFeFaxcooaOJ+SfZn/
         ZGfSNCOXzWovdf2AEQ0svWyEQN8UU5dvphJ1vQZTe9ePigX53DFZDH+5o6a/6X2V2r/R
         Crgs+HivEL7gmkJdrWNQTyLITnEMzByAVfM1FcqGy1FhgQjFpGyrI0l5Iof4SGtQixeH
         t0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778078965; x=1778683765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mgapLd3aySuAQ3iWNsV/rjtWMsIkyAS5NNwh4PX1s+k=;
        b=mKjyRvJuM2tG5fjeunxMIPDoajb1aJaFGwKhddL+pH/lsqMrvFvm7sW2fTxif/zOxR
         imAavTG1pdHNz4OeX03vJGfQqnx0MiPVkhwY7HGL8JaQrK4qojif06h5kPKTZtqDmJ0r
         recNjfMlOztjuCYp47RHOJ0HpJiNoty402snAH88JIkbqxGzDGHobndE7V/8WT8WuVM2
         yNFtUSX3Rd9eMbcgkYBe9Cn34p5OBunm+VykAP9LujBdU4M/Pct1P/3LOWvXrCN+2JcR
         3K/JkqICahPCzrx+X814f4BHWrzYpkfEYLh0g+RbVAE7oG9ckvTM/EWA+3NUu8Y+vX6C
         LtiQ==
X-Gm-Message-State: AOJu0YxaIudcfsN+f6/M8WrQwjD/qdJ4IFmt2gXNuspLYbunL1uosA0g
	DH/8FFUWOfX4DUE9LtrBJ3e4C71B/WZClD0cvU0IbtRatgsPWw7bgpKfAJjrN+dJsEQ=
X-Gm-Gg: AeBDiet6wDIXxte4CbTQvLCP/deS68MP7rdV2TykzKIu/dqDM0BtIzFF3LCcaSKOVaC
	IFcNAuIwSt/XhdyGO4I4rSXFUb7imOb9AJO8OdY4eWdFfv2c8ZB228nU489R6jz3AmfYpS748cc
	rj7QOgz8hURPVQs+Wuzh7XpB3AbEs881gLI2IuBXheoI+pbPUEVj2FQHiOpgBtg7SVLaBMI32kN
	MbLWXSq4w2+XcWw8Z+fVH/zzLLv8qTVpIMzMf1Gx/IH0mGrucac8irXqzLLBnpy3uFX3e3L3myY
	4EVmB/dhsxvWxAhMfD/pZOQPpKW0cG4hdhGwG05WO2gDP+hI2OCSwXc1tFFrADEwzFJgaZric6Q
	dvzA53ywXOzTvrAVcwiRGE0jajYsn/aQo1puWn2dT6Mqw2/5ywrigzJfiTG2dB63+MvDZWGT4pE
	pFPWasL8c6RSM0l3OqTsxyhjqDzmAAQGguc7LaZkVJXfeST6AHTKcIBPrtkwUelG8SUPY7vK7LS
	K0oFy+NFDpyEDc88VSEB1FT
X-Received: by 2002:a05:6000:250c:b0:43e:aefa:db84 with SMTP id ffacd0b85a97d-4515d5c65ddmr6662012f8f.34.1778078964803;
        Wed, 06 May 2026 07:49:24 -0700 (PDT)
Received: from localhost (p200300f65f114e08e4d20e057e51ec46.dip0.t-ipconnect.de. [2003:f6:5f11:4e08:e4d2:e05:7e51:ec46])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4505238e174sm13144251f8f.1.2026.05.06.07.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 07:49:24 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH] gpio: amd8111: Drop useless zeros in array initialisation
Date: Wed,  6 May 2026 16:49:18 +0200
Message-ID: <20260506144918.2445358-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1446; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=JAwO0GnFewziOCTbfnLEhiDT49kC56alAv8N5J+cYc4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBp+1TuEhGAiYN4nXNTv6eOCHx3l6YSA+SkHezNr FKGlSo6MBuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaftU7gAKCRCPgPtYfRL+ TmtRB/9Y+Nt9AdJxhMk6daKAQG+SwK35kPH1p9uzanjfN4IFYpmu2xFd4OHYNV5l8kzolYmVh07 83PbE1HDsttloHJDICbnu4yB9dU/dnao9g5xvdNbbHk2/o1e6TGl7NAfkIUh9zbIAzFOZ+3qnvB KVElPIV5vY5ayOeAl0SxKovPYSrxWOE8VR+enYAeNSY8eXoMTX8PtePQPqzl9Yuyxg/Si5R3+sM xuZ2KxeDiMolIdl5fQn/zKnuUr4wo1B8BBUmAJKXpjuPCo55AHlK2QFnmjcLV0UVlEO6KkOGuya 6Tix+6Q5hjWnz/3seFHukdXVDTLHXf1Ep4PMyaXhkpfZTzDG
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: F115C4DC962
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36297-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]

The compiler fills in zeros as needed, so there is no technical reason
to add explicit zeros at the end of a list initializer. Drop them.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

I'm currently cleaning up lots of pci_device_id tables to not use list
initializers. This one is a bit of an outlier because for my next patch
quest I need only named initializers for .driver_data, so I don't really
*need* this patch in. But this first array member's 0 in the original
code initializes .class. It's very unusual to assign .class but not
.class_mask, so I guess this was a mistake (without consequences).
(Named initializers are great!)

Best regards
UWe


 drivers/gpio/gpio-amd8111.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-amd8111.c b/drivers/gpio/gpio-amd8111.c
index 15fd5e210d74..8078b5d7b80c 100644
--- a/drivers/gpio/gpio-amd8111.c
+++ b/drivers/gpio/gpio-amd8111.c
@@ -59,8 +59,8 @@
  * want to register another driver on the same PCI id.
  */
 static const struct pci_device_id pci_tbl[] = {
-	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_8111_SMBUS), 0 },
-	{ 0, },	/* terminate list */
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_8111_SMBUS) },
+	{ },	/* terminate list */
 };
 MODULE_DEVICE_TABLE(pci, pci_tbl);
 

base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.47.3


