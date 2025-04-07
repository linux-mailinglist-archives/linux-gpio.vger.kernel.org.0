Return-Path: <linux-gpio+bounces-18303-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C645A7D5B9
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 09:27:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17E06163062
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 07:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D8D227BB5;
	Mon,  7 Apr 2025 07:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GV3ZwaPw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDEC221D9A
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 07:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010420; cv=none; b=ofty31UoEYT8V+4eDLj61avxzlECHSXoC9jG6Gvq7LN3R0velHl7jEtCaqmgJ36fihH/DV0TqIcDRBRsPKzrhipj8iMTv18lr6ioQoDqzRB7+H/HARXrblF7YvqGLzcwB782FqcT5zpHmi5kMNdygk4w1BF1B646ikbRt/6mlvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010420; c=relaxed/simple;
	bh=vB97Q1YPbq16AwOxn+yN6Er1uY//wlkJ2Wtv7a3Qbug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pgojmtyI/DHn7skIaNvU5qkZuCQX5XivJKHPAI6ibgGbiS1YW+sg1xB0h/dtD5xu/fK/h6OWI+z0MNtVwELS2jqy6Y+T67lGr0hho4u90fo5vfOArxnNAlK1Q82YKusZNWq9NzDKVOhEwOkMfKjMWbEOidpAMu9jKQq2YXz7Pt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=GV3ZwaPw; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so19096105e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 00:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010417; x=1744615217; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NZkA1+Q3u+jEfVBi0l7ljj4vwe6IMZ6cjm27iXV9wpo=;
        b=GV3ZwaPw3Hk+auH+WqV5uLeWRsnQddF7ajTcaT67jdpyZX7/oukOgxB13wC4YPSRtX
         T2El5GbD3/o6iGfJ9x5cAkqw75hoG4+7vk9VOt0fG3B9uTU4WrmltT6rCoM0yS9NMkWN
         Ra2apicd36+bONy3Ij9pGVsIzMr0FkiBAS30l+c0KYCnBBYW0SAth7WlGFwMk8yBzDZy
         L9fmkTpYWUZKaxitEIW7tuEbWqHFV5iynAccV3W44kkZ3hiS1+NoIIVR4T2eFZeaS03W
         WJ5YFKo85lPobx/QV+ewuaQTCRTDRthKwT5Eib1rv3w0raJppAQWnUFXYdm5RZb6fRKS
         oW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010417; x=1744615217;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NZkA1+Q3u+jEfVBi0l7ljj4vwe6IMZ6cjm27iXV9wpo=;
        b=NKDBG5I/yPlmdQd878lSA6ngu956lCZlr+45uxq/gYbziuY+NDa0xMQQMbKIy8DNqC
         STMNmyZKGMeBU/ZXyRdeghs1CKd2/hKTFShXDlj/ab5KMN9PP8dG9ZpVDNl61aVOLvgI
         +GaSwHUFEsR9yJ4BFhAk/IfYmHMOGlzKhAFlqbe8oYsgcHgprDhkrg3n7jQimOPAuD5F
         5gUYd1qZBzVUIZhMTPr1FV8HnSfc5Vj01RKEUBO79Svy0zbxDnrkEPzwDKVWoeoaoPXO
         GkmhkNfdlbFMAo7ja+VBkkGB7tqjq/gITwpMitnDz5PBOkEwQlXcnUgodpCLOI0yVQTO
         wa6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWK1/QbByLLT3sKauib1qzBpEWp6J+dHgal4yP82bfJmk262nHr1nEjn1Vkp0vEHj4cQsO+qKZRSz2p@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu3o3XHPsHPp/hpISM6to4v4Wbm5ydpJGrfv6O+suX4c56wKhn
	kCSoRVeaDcw+EAa2WIaIOabhLTzCKOdqmG4VhEXoQR5M2GO7dvIl1p96UVgGXfY=
X-Gm-Gg: ASbGncuAB2oIhvJGWB/xSWeoLExqKvN/iobhcgP+ywvexymu+sXmp9wSiMOkVCtQxbi
	ciF411vUsNtfDGYvSP2KmHWQUHEurIOIopGUDc6E5CcFpcdGEFQHcPiKmhU+II6JPB9XWsRVKPX
	iLOxC2ayj62++a8XnT6/gaSgz2IFzbxWsH9QSmdLC2T30oLxqnlohzClUC8kp9h2GNX9NVwnYNi
	Tt91mkzeo5Vtw/HUDKQGU7z5NXgS0WJMJDvJxvCqYtlg8CDO0F9nazQwnYvalbkunFAMEvqNepB
	Cf0Nxb+/y0Z0WLAbouxDXRzo2rsjEe/eNZNFVg==
X-Google-Smtp-Source: AGHT+IHpPjFFlJDSkBPgrO6I41uexMOHig1BRBPlRgzV6SsR14UibMi/3rCWV6DQ/1uJeGXoDG6rTg==
X-Received: by 2002:a05:600c:4ecc:b0:43d:2313:7b49 with SMTP id 5b1f17b1804b1-43ecf85f4d2mr100415065e9.12.1744010416824;
        Mon, 07 Apr 2025 00:20:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec3669002sm121751175e9.33.2025.04.07.00.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:20:16 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:20:15 +0200
Subject: [PATCH] m68k: coldfire: gpio: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-m68k-v1-1-7fdc9132b6e8@linaro.org>
X-B4-Tracking: v=1; b=H4sIAK5882cC/x3MQQqAIBBA0avErBswpbSuEi2ixhoikzEiiO6et
 HyL/x9IJEwJuuIBoYsTHyGjKguY1jEshDxng1a6VkY3uEQ+ppUjJjpRLtwbt6F1rbdWO+Otg5x
 GIc/3v+2H9/0A+d+MBmYAAAA=
To: Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1765;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=xpjlcs0Z+gAlZJFbn5AlXbcR6QRO7s3gx9jjA4Yf1Zg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83ywLwPBxfPzoX+y2laB9IHxbDRLfAaKx6afO
 m3U3MGsITSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N8sAAKCRARpy6gFHHX
 chzFD/9187tA+35Bnp9Rx8W4LxG/AeuKg9A73cy0c8KWQhWSdM7ri1UlLP1a9NbaUQtyH0By9oC
 2APZ0yRzXqSfFYP9fK9ZpYEkio/d8gepkwbFdcq1RTKbdManuCywpeHrTFSgCeRle93oLeV2ofV
 4Fnaam5T5+Zc9A7UFqUOqM7xd0fJ+Ra9pfRuZSYTKPp3vf1mfRPSsjePo629D3APbon9HuQV8rn
 eLMrSdZXM8UcgnJE2V60b/O3ANrlia6TT69eCm/giNkX+WCMV05mE/keSk+H7TUea4EH+efyZtR
 5Ycvv0s4Bi/+hI+/0Nh5gygp7khgI07qS9KZd3ygckstGgN/MirZNmYDK0OAZclCtRBGonphGOC
 TbXVVwoU81g20JSUbSMLZyC48lU7atrB9mUelvCzhINdJ8MkFHsG+aPRNuZiyAX2BVWjCDy5OSe
 ttX7s70dOMQVlCvDk1hogR1MYfXblwVVsk/2oQ1REV+JpRFaR0HnJRpklfVNFfkdGvPfJ6XdFxV
 x8GqV+b5JdJCeOxqkRt1lmXLxPXSl+AA29VwFzNiTcGgMY0ZO/LZ+8lLv6g45e6D6azdn/HQjz2
 z70FQNuZ99Uzf0Uo0Nb8qLBv03mX+x4EP1Cu8gH06P23VusZFg0pK4/dFo+xSeZbDhkMg5ikjT/
 d0J+f7HA6IKvfxw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. We're in the process of
converting all GPIO drivers to using the new API. This series converts
all m68k board-file level controllers.
---
 arch/m68k/coldfire/gpio.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/coldfire/gpio.c b/arch/m68k/coldfire/gpio.c
index ca26de257871..30e5a4ed799d 100644
--- a/arch/m68k/coldfire/gpio.c
+++ b/arch/m68k/coldfire/gpio.c
@@ -123,10 +123,12 @@ static int mcfgpio_direction_output(struct gpio_chip *chip, unsigned offset,
 	return __mcfgpio_direction_output(offset, value);
 }
 
-static void mcfgpio_set_value(struct gpio_chip *chip, unsigned offset,
-			      int value)
+static int mcfgpio_set_value(struct gpio_chip *chip, unsigned int offset,
+			     int value)
 {
 	__mcfgpio_set_value(offset, value);
+
+	return 0;
 }
 
 static int mcfgpio_request(struct gpio_chip *chip, unsigned offset)
@@ -158,7 +160,7 @@ static struct gpio_chip mcfgpio_chip = {
 	.direction_input	= mcfgpio_direction_input,
 	.direction_output	= mcfgpio_direction_output,
 	.get			= mcfgpio_get_value,
-	.set			= mcfgpio_set_value,
+	.set_rv			= mcfgpio_set_value,
 	.to_irq			= mcfgpio_to_irq,
 	.base			= 0,
 	.ngpio			= MCFGPIO_PIN_MAX,

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250326-gpiochip-set-rv-m68k-789f77283f78

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


