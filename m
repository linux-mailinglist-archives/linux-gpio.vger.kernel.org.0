Return-Path: <linux-gpio+bounces-5148-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D0789B36B
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Apr 2024 19:51:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 732301F23DD9
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Apr 2024 17:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62A813BBE7;
	Sun,  7 Apr 2024 17:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RokEEKKg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C563BBD5
	for <linux-gpio@vger.kernel.org>; Sun,  7 Apr 2024 17:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712512278; cv=none; b=cDEIgus5/c/5QKXFPaePqFsAlTc6AqeNo6dm7hVwHYRCfVhRnD6pPrYQo42bc3cS1E9UWsLCy2882Pc7hVRQ+j7kmY2usp0YzXSMvEwpfW9gAy1t1ZW/U4tX80tgk1BCHNtvEAPKnXaWcIyGmXOiHRMyhm9HyGyBMThJRMsIYMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712512278; c=relaxed/simple;
	bh=FKxbQ7TpUJy504f331ElPEZpOuG/m7IcCO/iyU/+1B8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gE7b8oziKIQwAlaSdlRl9c9s6r1DvlPdyzuo70ExSHxgz8VYkUS5V/PKaO54HYpcqOoghtSls37anWVEGrEh/pKqYP4jy1Ohb1fX2d0Nf557g2WwgEamxP+QGfLHB80EkhvwTNqvwBikEhoVYrU40pfkTNLDIH+CsIsh0xwUCzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RokEEKKg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712512275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wiGjx730GoyajXb4aAHCWMNkXu4oB9jhkk3JTT0uht8=;
	b=RokEEKKgiUn6uXbYnMD+1mTZXV8LDq0OK4L+XPl9eLvaXrO21pdeGPldseEMORwHbAkEF7
	pJ73ZGsBo42Ll9AZsgfVrxLepv2W1adpVF8iH4OSbDYUvEpXXPGpQ/wYYV9syeyXJbqN0g
	tCcOXGewB2gGvFNTWsYAFPzjtfSqDgM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-120-nE8w-JFPNbGUTmz_vhptKw-1; Sun,
 07 Apr 2024 13:51:12 -0400
X-MC-Unique: nE8w-JFPNbGUTmz_vhptKw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91F813810B29;
	Sun,  7 Apr 2024 17:51:11 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CDA5340B497A;
	Sun,  7 Apr 2024 17:51:10 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 2/2] pinctrl: baytrail: Add pinconf group for uart3
Date: Sun,  7 Apr 2024 19:50:49 +0200
Message-ID: <20240407175049.11644-2-hdegoede@redhat.com>
In-Reply-To: <20240407175049.11644-1-hdegoede@redhat.com>
References: <20240407175049.11644-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2

GPIO_S0_SC57 / GPIO_S0_SC61 can be muxed to PCU_UART_TXD / PCU_UART_RXD,
add a pinconf group for this.

On Bay Trail board schematics using these pins as UART these are
called UART3_TXD / UART3_RXD, name the pinconf group "uart3_grp"
to be consistent with the schematics.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 04d37e121b36..1bfff29d6596 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -231,6 +231,7 @@ static const unsigned int byt_score_pins_map[BYT_NGPIO_SCORE] = {
 /* SCORE groups */
 static const unsigned int byt_score_uart1_pins[] = { 70, 71, 72, 73 };
 static const unsigned int byt_score_uart2_pins[] = { 74, 75, 76, 77 };
+static const unsigned int byt_score_uart3_pins[] = { 57, 61 };
 
 static const unsigned int byt_score_pwm0_pins[] = { 94 };
 static const unsigned int byt_score_pwm1_pins[] = { 95 };
@@ -280,6 +281,7 @@ static const unsigned int byt_score_smbus_pins[] = { 51, 52, 53 };
 static const struct intel_pingroup byt_score_groups[] = {
 	PIN_GROUP_GPIO("uart1_grp", byt_score_uart1_pins, 1),
 	PIN_GROUP_GPIO("uart2_grp", byt_score_uart2_pins, 1),
+	PIN_GROUP_GPIO("uart3_grp", byt_score_uart3_pins, 1),
 	PIN_GROUP_GPIO("pwm0_grp", byt_score_pwm0_pins, 1),
 	PIN_GROUP_GPIO("pwm1_grp", byt_score_pwm1_pins, 1),
 	PIN_GROUP_GPIO("ssp2_grp", byt_score_ssp2_pins, 1),
@@ -308,7 +310,7 @@ static const struct intel_pingroup byt_score_groups[] = {
 };
 
 static const char * const byt_score_uart_groups[] = {
-	"uart1_grp", "uart2_grp",
+	"uart1_grp", "uart2_grp", "uart3_grp",
 };
 static const char * const byt_score_pwm_groups[] = {
 	"pwm0_grp", "pwm1_grp",
@@ -332,7 +334,7 @@ static const char * const byt_score_plt_clk_groups[] = {
 };
 static const char * const byt_score_smbus_groups[] = { "smbus_grp" };
 static const char * const byt_score_gpio_groups[] = {
-	"uart1_grp_gpio", "uart2_grp_gpio", "pwm0_grp_gpio",
+	"uart1_grp_gpio", "uart2_grp_gpio", "uart3_grp_gpio", "pwm0_grp_gpio",
 	"pwm1_grp_gpio", "ssp0_grp_gpio", "ssp1_grp_gpio", "ssp2_grp_gpio",
 	"sio_spi_grp_gpio", "i2c0_grp_gpio", "i2c1_grp_gpio", "i2c2_grp_gpio",
 	"i2c3_grp_gpio", "i2c4_grp_gpio", "i2c5_grp_gpio", "i2c6_grp_gpio",
-- 
2.44.0


