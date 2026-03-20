Return-Path: <linux-gpio+bounces-33884-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJlsLuOavGmz1AIAu9opvQ
	(envelope-from <linux-gpio+bounces-33884-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 01:54:59 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4903E2D4845
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 01:54:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 147A430BF5DA
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 00:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBBEC25DB1A;
	Fri, 20 Mar 2026 00:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MltemJ5g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD869257825
	for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 00:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773968039; cv=none; b=I9abJLnprKYPEnpOtMOHF1V4hNXLgxh6D9omYckIz2Xoy8eIgAoZcNHNnM9kpxEsXHZ9NVh9U7EqDyyms9iEQlZbVzBUx543obqbGne2rKhq/jRzrVIchEjcof4gbgWkMu1H28FjeQZtklXW97CD+qzLSW9r0oEDRFDa6udgAtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773968039; c=relaxed/simple;
	bh=RPdS4yZ4aMDBpjdVYOmpeBtEsGxqKGyrHqi3ViirQf8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FaoBxiSEn291HrAmctxI6rRJJTeVaUGbv48vi7E1mjCPyshqEEacw7BHBAnGwt5KWVYS1ixowzgFPkyUE9z6wDtk/7ZEQtyM2q7wmSK3ZvP07HbcFQC7a2bAm1Id3AjVpMJcysvUwRtWj3FOih+flnyt1zCv3R7YZN/mP+/h8nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MltemJ5g; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82bae83318bso42463b3a.2
        for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 17:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773968037; x=1774572837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dAZdaOpK8Tpotf92jIjh2hYipqpzhjyOHEd27w2pfAc=;
        b=MltemJ5gbKKHa0HoB43cnvFFPdGv/1GdmSki69ImFdn3JHvqkH3D54TekvpniIAtZD
         8UWa2MKVk3xwErCmNQgReb7uKR9z8h5DIiE0o8sedgoZ3bibU8k9uB4DkDroVglcYvqp
         qO4JjSEfTi21NmJA0po7+OEH8RDidtD79tLQuM3M3VhJiUXhHLNQI2fmZW8Y2E0e54VK
         U0G0jvQwqGzNu/pfPHW77HOQfqhZBe2CnTUEwP4DW1qaJJZ8G2Yj3YNar6GAkNHnLbCo
         o5/m79LiA2M5sZX+QZ7sXIxoBHXulrhqkXviz5dBZD+TKGGDRqbr1V329xbZyNJOix/Q
         JqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773968037; x=1774572837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dAZdaOpK8Tpotf92jIjh2hYipqpzhjyOHEd27w2pfAc=;
        b=Dphvt6ImgmWxI1zB/qZcAQcdLLy8usUjNHx8to4YfxLenhE5YR15+RVuxGn/kxUfyQ
         EFAAHEnqYLRSymdeMkqRbm3skgnctDbB1+hn1/V64pqoSBuK85u6A7qhhNmYBHsnUEsx
         pTxc1UyfaK/JSktKs1winGQxb2POA+s5135TaCh5Lidichf8pGI/pEfB/DYgxU5H2shz
         LeaEGXeFhF1L9IESSgYMCtrfjwSYHMAqbithbwgn6ESjUg658zgdOSlxMDWJFIpd1UYu
         kkVhQdkNTSHiBGw91Wm9Lm70o9bDwoi1FucleG26VqlpBrfmJzlgL+L40LCrN9uK5LVy
         XOUQ==
X-Gm-Message-State: AOJu0YwzG8RXU4QA+OAW3j1864rQnVjX8zunwfuUZWbdjmWToI4BpN5K
	B6qs5aGSvYni98v3cNlwpN+H5y/aTVTtKGmAkfCDGWxWoEnsDc5mvl27q51TulcY
X-Gm-Gg: ATEYQzyPl1+VBfjAiYzQDKCwW6/FuRKc+LS4F0YcFwLVweCSeHuLIBbAJnsheNbwgvN
	en6dOxem7khLSy6LcgIp/Zug4RRzdxa+uAeTwSyytJA/x2B+KWmDqLIV+9FIfpPxsbI56ZibKNv
	rd+IyOVogdTUeextnVYNZ2dDqiL1BQOktqd3xKZsC8jNgq8hhrLCVzkjC8Q0xTQY1LvcFNQr9IA
	PwHYdpiYj9BuDEL2VDLokeuOvhv86lgLnFsKf5klAt38nUNlC08KRk4BzAcrPEzYNZ9mZ8tSfzD
	N1amodQw8YB+FBI5+MvfVJqb4FU+T2kpHJPa4Dow8iyincGEBC+y1wgKxpaniFYM3uwBATYd91n
	h8c/ER4FwOUr/tp5CzvLN2xZZU/wJ+Z3dicmqGkiCINRgy8xEeWxF+4YRoPVvrk0/4Ky+77SoTs
	HwpON+zN9Muk7PTVNo21FJLAEqApanPRio60pamMHEF3OhuY9J9k+wZjc=
X-Received: by 2002:a05:6a20:7d9e:b0:39b:bee4:2954 with SMTP id adf61e73a8af0-39bcec29e21mr1068513637.63.1773968036651;
        Thu, 19 Mar 2026 17:53:56 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c74665ca1f8sm435525a12.20.2026.03.19.17.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 17:53:56 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Hoan Tran <hoan@os.amperecomputing.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] gpio: dwapb: reduce allocation to single kzalloc
Date: Thu, 19 Mar 2026 17:53:38 -0700
Message-ID: <20260320005338.30355-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33884-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.967];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4903E2D4845
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Instead of kzalloc + kcalloc, Combine the two using a flexible array
member.

Allows using __counted_by for extra runtime analysis. Move counting
variable to right after allocation as required by __counted_by.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-dwapb.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 4986c465c9a8..15cebc8b5d66 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -75,8 +75,8 @@ struct dwapb_port_property {
 };
 
 struct dwapb_platform_data {
-	struct dwapb_port_property *properties;
 	unsigned int nports;
+	struct dwapb_port_property properties[] __counted_by(nports);
 };
 
 /* Store GPIO context across system-wide suspend/resume transitions */
@@ -114,11 +114,11 @@ static inline struct dwapb_gpio *to_dwapb_gpio(struct gpio_chip *gc)
 struct dwapb_gpio {
 	struct	device		*dev;
 	void __iomem		*regs;
-	struct dwapb_gpio_port	*ports;
 	unsigned int		nr_ports;
 	unsigned int		flags;
 	struct reset_control	*rst;
 	struct clk_bulk_data	clks[DWAPB_NR_CLOCKS];
+	struct dwapb_gpio_port	ports[] __counted_by(nr_ports);
 };
 
 static inline u32 gpio_reg_v2_convert(unsigned int offset)
@@ -585,14 +585,10 @@ static struct dwapb_platform_data *dwapb_gpio_get_pdata(struct device *dev)
 	if (nports == 0)
 		return ERR_PTR(-ENODEV);
 
-	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
+	pdata = devm_kzalloc(dev, struct_size(pdata, properties, nports), GFP_KERNEL);
 	if (!pdata)
 		return ERR_PTR(-ENOMEM);
 
-	pdata->properties = devm_kcalloc(dev, nports, sizeof(*pp), GFP_KERNEL);
-	if (!pdata->properties)
-		return ERR_PTR(-ENOMEM);
-
 	pdata->nports = nports;
 
 	i = 0;
@@ -714,22 +710,17 @@ static int dwapb_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(pdata))
 		return PTR_ERR(pdata);
 
-	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
+	gpio = devm_kzalloc(&pdev->dev, struct_size(gpio, ports, pdata->nports), GFP_KERNEL);
 	if (!gpio)
 		return -ENOMEM;
 
-	gpio->dev = &pdev->dev;
 	gpio->nr_ports = pdata->nports;
+	gpio->dev = &pdev->dev;
 
 	err = dwapb_get_reset(gpio);
 	if (err)
 		return err;
 
-	gpio->ports = devm_kcalloc(&pdev->dev, gpio->nr_ports,
-				   sizeof(*gpio->ports), GFP_KERNEL);
-	if (!gpio->ports)
-		return -ENOMEM;
-
 	gpio->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(gpio->regs))
 		return PTR_ERR(gpio->regs);
-- 
2.53.0


