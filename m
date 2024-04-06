Return-Path: <linux-gpio+bounces-5138-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8266689AACB
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Apr 2024 14:37:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C1D8281FDC
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Apr 2024 12:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D372CCA0;
	Sat,  6 Apr 2024 12:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K0rbE3T4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C78DE546
	for <linux-gpio@vger.kernel.org>; Sat,  6 Apr 2024 12:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712407049; cv=none; b=cEsqHu7vgmXv+0EcSKeqvUlyRcBRxwlPeiGxeoHkv04eAz56CRlGsoDDEUaxOcMpHj7P/QvTG3f1sfar1jEF4D+pKswBU6viVZMsyx0H2pE8HJosdMIVvYFzlVLACFXn0oOhVlN5wpTrCnc+mHXa+70IMmK+EEY8dGPXeTpLvhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712407049; c=relaxed/simple;
	bh=YOVIIWKGTkCpjRyUaH17mBVFvntA7TOUG4ojMC3kTbY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kNAzERR90UXPCt3a8FGnNRDSRptjdtzaGmYCYbjoVxwlGpN0IRqU6S0M+2zKfRxlM0LsCRXACMvOKdhAaMRqojea9PtLKZt5HVg4pN1lKNA6ghf8JDVW3O/CN761Tc666t7ifeayiFsUqom8jslHgO9T0lQg72TzFAOlQ5z88Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K0rbE3T4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712407046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qTdqJp1lE0VsFVlFulVpcQqaPrsz4TCWjCEHAoTvwbc=;
	b=K0rbE3T432hAVopzHuRq1xBliwL+SPfCq2zqXheuqXtSUCgvtGnAlkqD3sqbwCPDMzIq8V
	9YX0YNPytaBwnQNS/DKPWprsaJxOPOIdJaI5BkenrM/itUOk6nmoduj2xRcJJeH/1Or4uK
	erdpNtXzGaSlPQ+Rxv6aQkH1fT0uqHc=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-163-vLNHuje3PaKDJjY-OBFvsw-1; Sat,
 06 Apr 2024 08:37:22 -0400
X-MC-Unique: vLNHuje3PaKDJjY-OBFvsw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F9BB28EA6F4;
	Sat,  6 Apr 2024 12:37:22 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.50])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 83250C04120;
	Sat,  6 Apr 2024 12:37:21 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-gpio@vger.kernel.org
Subject: [PATCH 2/2] pinctrl: baytrail: Add pinconf group for uart3
Date: Sat,  6 Apr 2024 14:35:06 +0200
Message-ID: <20240406123506.12078-2-hdegoede@redhat.com>
In-Reply-To: <20240406123506.12078-1-hdegoede@redhat.com>
References: <20240406123506.12078-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

GPIO_S0_SC57 / GPIO_S0_SC61 can be muxed to PCU_UART_TXD / PCU_UART_RXD,
add a pinconf group for this.

On Bay Trail board schematics using these pins as UART these are
called UART3_TXD / UART3_RXD, name the pinconf group "uart3_grp"
to be consistent with the schematics.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 019a886a37ae..bd2363355a60 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -231,6 +231,7 @@ static const unsigned int byt_score_pins_map[BYT_NGPIO_SCORE] = {
 /* SCORE groups */
 static const unsigned int byt_score_uart1_pins[] = { 70, 71, 72, 73 };
 static const unsigned int byt_score_uart2_pins[] = { 74, 75, 76, 77 };
+static const unsigned int byt_score_uart3_pins[] = { 57, 61 };
 
 static const unsigned int byt_score_pwm0_pins[] = { 94 };
 static const unsigned int byt_score_pwm1_pins[] = { 95 };
@@ -282,6 +283,8 @@ static const struct intel_pingroup byt_score_groups[] = {
 	PIN_GROUP("uart1_grp_gpio", byt_score_uart1_pins, 0),
 	PIN_GROUP("uart2_grp", byt_score_uart2_pins, 1),
 	PIN_GROUP("uart2_grp_gpio", byt_score_uart2_pins, 0),
+	PIN_GROUP("uart3_grp", byt_score_uart3_pins, 1),
+	PIN_GROUP("uart3_grp_gpio", byt_score_uart3_pins, 0),
 	PIN_GROUP("pwm0_grp", byt_score_pwm0_pins, 1),
 	PIN_GROUP("pwm0_grp_gpio", byt_score_pwm0_pins, 0),
 	PIN_GROUP("pwm1_grp", byt_score_pwm1_pins, 1),
@@ -335,7 +338,7 @@ static const struct intel_pingroup byt_score_groups[] = {
 };
 
 static const char * const byt_score_uart_groups[] = {
-	"uart1_grp", "uart2_grp",
+	"uart1_grp", "uart2_grp", "uart3_grp",
 };
 static const char * const byt_score_pwm_groups[] = {
 	"pwm0_grp", "pwm1_grp",
@@ -359,7 +362,7 @@ static const char * const byt_score_plt_clk_groups[] = {
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


