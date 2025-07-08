Return-Path: <linux-gpio+bounces-22914-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 901C0AFC5DF
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jul 2025 10:38:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B11FE3A7E75
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jul 2025 08:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B8112BDC36;
	Tue,  8 Jul 2025 08:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="fKtNOmpa";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="KARDZeMo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1AB221FB5;
	Tue,  8 Jul 2025 08:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751963930; cv=none; b=owsfSTgdl0Te0Gj5tIDOwZHWyihJovdvOIuPI44Q+S+OPkgoFhBZbRfqP+KOBE1pjOzcgsJpI/ecyrb/GP9MfKj+q2qEZEpOcyrBqBIDG3u08i8SF5i0RpsJiNsZz2huwwhjA9vmyHRpo0YF27KFDyQOO+ESnIECTzkJnJUSTMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751963930; c=relaxed/simple;
	bh=2zaYyiCu1/Y2VifYVRGpstzSWOLtBuPcVnufjTCVzng=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HDcg3VnQNfrlv7qpBjsqelEpKGGmeo6RYd+E5ANNgNmOR8Wl+9nVuMuuTUYVoHeJT6oNQP/mdqIqYW4jA1jrQ5qMrI2qUZXL8uLlmoghIXhRhEv74nZjTtpkmCTlt7C1IePT/ah2hw1jx0CKZlKMpP/Hpu6+YCuobZtoAr8S6zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=fKtNOmpa; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=KARDZeMo reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751963926; x=1783499926;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NyW3LEPljdWwfcjkUurkmy2RP4ljAYxZFVl0N6K9jS8=;
  b=fKtNOmpaBEUvtIKEvClOGmflo/pkSIefCX/KCM3bCa1LieQqfu09C08/
   tdOUTK3xW0Ys20lFiAnq3YcO3etAiYtqvfOJvVxdqPqyeBGMP1ZTI3jEp
   GKZ0g5S+dQOJcbOMMWgt03M5Y9UUOxX7ccHJOe/VWQTPkpV4MIiotr6Ua
   2VjUesm5pbw2q3ym9wQNRlPIsOccqY7WGWeTnZTU43Tp7EMwHfz0Q7SsV
   p8oNUjZcuX6lBjxWyTEpoyNXgh8wDZ/F1z9FFiG/h07lGw+PiYubddRe2
   lVKrQsVoy6wuwSZyALC29PhKadgxHBhyqQzN+CrxZg1gWExAEobqOTEHc
   Q==;
X-CSE-ConnectionGUID: BKA7qy/3SaeGYPsvRSYavw==
X-CSE-MsgGUID: x5RCDCfgQSCTauPSxQ+5nQ==
X-IronPort-AV: E=Sophos;i="6.16,296,1744063200"; 
   d="scan'208";a="45081250"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Jul 2025 10:38:42 +0200
X-CheckPoint: {686CD912-43-B2B90094-F6B7211E}
X-MAIL-CPID: B2572D919755F24A6E8681809FB22715_4
X-Control-Analysis: str=0001.0A006368.686CD930.003F,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C4CC160E21;
	Tue,  8 Jul 2025 10:38:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751963918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NyW3LEPljdWwfcjkUurkmy2RP4ljAYxZFVl0N6K9jS8=;
	b=KARDZeMoLrc4+6D+SlGh4u2ZMVw3qStUYTXxhT9QWVnSHlH3d3VU3DkmhubvO79OZXZyhy
	eYIkJdtUNgrmjtv/w3OPwXwUcFNYEH5pUHAvSLjnr9RW/4YAm4276MYLQ/FUUyq/eEQqhF
	Nf6lK6jOhJsExJ/xn4egp1xiEtcPf4s5GgilGyuA9QnlfqCLRbAecGfARJll879bjfzH5Q
	bFpHTLM7JOK6lhZOLItrJ/PCunjGN2fqi9bteEdG+jGWjTC0NLMqgzxwJ2s2nNp7HRCm2x
	pFoUeHCmelPTio1lFDACjfevef/4hwixoA8Q6e1bkTtYkCgFX9Zq9DLT2tlAjA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] gpiolib: of: Initialize variable
Date: Tue,  8 Jul 2025 10:38:29 +0200
Message-ID: <20250708083829.658051-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

of_flags is passed down to GPIO chip's xlate function, so ensure this one
is properly initialized.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
I'm seeing errors like:
gpio-720 (enable): multiple pull-up, pull-down or pull-disable enabled, invalid configuration

Digging down it is caused because of_flags is not initialized and
gpiochip_fwd_delay_of_xlate() does not set/clear the passed flags
pointer.
Is the of_xlate function expected to clear flags or is this the right
location?

 drivers/gpio/gpiolib-of.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 73ba73b31cb1f..37ab78243faba 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -708,7 +708,7 @@ struct gpio_desc *of_find_gpio(struct device_node *np, const char *con_id,
 			       unsigned int idx, unsigned long *flags)
 {
 	char propname[32]; /* 32 is max size of property name */
-	enum of_gpio_flags of_flags;
+	enum of_gpio_flags of_flags = 0;
 	const of_find_gpio_quirk *q;
 	struct gpio_desc *desc;
 
-- 
2.43.0


