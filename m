Return-Path: <linux-gpio+bounces-21244-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAC7AD3B69
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 16:42:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48CCB189FE53
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 14:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5D9723535A;
	Tue, 10 Jun 2025 14:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Ekiq1JCv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A920E234971
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 14:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749566326; cv=none; b=pgdiE30e2QUc++NXrD+zYXjAAf9jwq8IwdmLSJasIXsGaEk+oYREVZ8BHGCYlOI344UOPsCOyCtJbRRvrz2KDqEecib2wQNNH3QvcmRWZpTm6SuVGRueVcldHPls5hdMGQkE2BvPHx1GeF2H+RUtuyYWjJsjJ9/aGlrDdDAe7Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749566326; c=relaxed/simple;
	bh=n/8Q3QJmovEcO99W9nilHTg0Ks126Kz/UiSEWmyIYZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZWwmxvzxJ1PQ6mCqNLiNONFZX3olV8gTsiWlINqw4PPdNkIVO7XnNICDq/y/5F+7n9OQTztIFsrvm94x5BDSSRPiOFyvKHI0hxhh6UuW2x9qpCNxV3Adn7uh+32NF03LTneK63n4hfpidnA5kvs3KTU1SctgI7twLk1Wvik5CEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Ekiq1JCv; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so43431095e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 07:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749566323; x=1750171123; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cLj7DWR3g91ZC5MBjrvyVrHQMhHkaM2qnHIpKV16L3g=;
        b=Ekiq1JCvHvswu8hozMOOM//VX0g5EPJfeODi2ICyIXpdkxeyPDphdJAdFSVsfly/Gy
         KvZSPgSmoPOuYlwRB+8BFcWPkXpAEN+VhRiC+ydU/INWOhMG3OH5sqaBju2EvX3bilnD
         eFJeQbyd/x5J4eGMaCIH9uzk3PMTPftGDOz6VUCy6vyAUqhxQYIagFWif7Ps2ohh2nDV
         /hFM11+FocBju2hzPiRIWHazGjh6TYIUSRI13pGQOGvyuzNkN2rH1A+0rEEkUAGXfBYw
         nox7aSpwF/nRh4uwhgrJi7gntYs3SzIWejeIhJdrLhCt+wC8dfmuvstRXHf8c2QNBVo6
         lfMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749566323; x=1750171123;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cLj7DWR3g91ZC5MBjrvyVrHQMhHkaM2qnHIpKV16L3g=;
        b=Ir9xR4wVUKvFzi3TLzdZV4JKJSvc4c7ufYKdRmR82dRXX7p7pW+IvuSYXQH0y84x4W
         eJFjSWh20vClTtZjA/gto8l2lYAzDmz7SoXz9VbGeNaVMqjR0ub0UeG0qClUdv9p11wX
         5yEA1VycZUltck4/hDNGsz3ou8wvcVKLyv/0rqEXL+jm3ZH6yT+ky0jE/xc0CBQfHgrZ
         A+K3BmHqgIs9d3GW7TOwdK/o/GMMK0Z7rj6glGVjXW3QG1Rk3e8ImBBFza2jsmApUmOh
         l3fPYgx7iZYITpOR0PIKireM8GmT95ClduMsKXhfnPB04HmyQvO7JKC5fML1ehbR8cmG
         H2Dg==
X-Gm-Message-State: AOJu0Yy3ce9gsRMLvzy4CbrLziAITOW46hRSp59jr+xC0TM38RmzjiYZ
	wogBjG7sMDPEJ0afOT0LcdXf93ek/In8ivfEHk2z0QM6ESYDiQ6MX6oY132+A8UdCr8=
X-Gm-Gg: ASbGncvZN0u6aSwzGHfPECPnrEWiRMKQqHA7EatD0j+NWp95QfUBdYcWogGk46CBZRp
	LNdW638wbHngJIzfF6Zq5jv2KFeK/eG3BHaMetyD398ftxZPnboikvIcXUzRdsyrWvDGky/5cUN
	w57D90dV0QkWAhqL8bVGuNACE9oN9bQB2/OOIGmC6I0O+WQqYsOEpFWSmTMu7DO7V67A1I8p2JJ
	+9Weg2UmrzUyshrt6tblAbZa4/XEgW5xQt5TrqJUYC3bFspxJsYEyBUcQ3qDs8QNXbBBAXzrYT8
	RUJxJ1QLyThcCoB52Rm0P9wFnRGiTQZ7YN2/5kjlYuXQiBjlrYKw
X-Google-Smtp-Source: AGHT+IEywg6w59g2mx8KQEA5DxZqFCbrLHoGShus610IZqWOu2oBuwgUJ83xT3nNW0Y+lQlOhQKrdQ==
X-Received: by 2002:a05:600c:6388:b0:43b:c857:e9d7 with SMTP id 5b1f17b1804b1-4531d6fdab8mr32062795e9.5.1749566323035;
        Tue, 10 Jun 2025 07:38:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e056138sm146001345e9.5.2025.06.10.07.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:38:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 16:38:30 +0200
Subject: [PATCH RFC/RFT 15/15] gpio: TODO: remove the task for the sysfs
 rework
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpio-sysfs-chip-export-v1-15-a8c7aa4478b1@linaro.org>
References: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org>
In-Reply-To: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Kent Gibson <warthog618@gmail.com>, 
 =?utf-8?q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
 Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1371;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=FrDvVu23TJm5ghXSfiA8hCOI1OUNHhCK1w5KAsAVwJY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSENi73tPISvj0xD+HMTPCvZKJvIUOegaNu5uO
 y3wtnEYSI+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEhDYgAKCRARpy6gFHHX
 cvdTD/41qLITo5HP3W1/ezMXOITtIMegRdx3dV4RXRA0XYNgVnGdtIv+GtlOwW8GgkylTyZnOP5
 Wfsrj/Up9MFtr7QGsC5a27m0Htw7fkUn/UVqRr7MeoQ8DvvfAk32r76O8EK8mjvPRTTUFVReoi3
 uAf60JE6IClr1FoTU36dCKeB5xl49K1D0D+HsMd9uIrrqxlgSC15xIp0y56R8f4l1AnTR3WIedz
 YZL+mTTw2XSxnoUjO6wb2cwYRMKWurtH8qp3lS0fQEPKw3xT6OsfqfzOQLuDrvXX8LnJhQU4VT7
 PIS05fVZHGPBQVv5wug/7MbgFAm58VZv6uYBK37niJVecMiKPda75xXiASpcQuxvhgB+QoqKUKz
 A7W3Lp0hqOJduExEimuvWx5A8A5DdhJXo5DrzKwUl1yCxYno1XOGe5G1VCoz4tl/85yUznOngXV
 A0dMBBp4KKarcZvL79wRTHRPYHEBnZOXmJ43W8+qdDT7mPPVDyDz3DQu3Nl36JXSyT7W7qoP1XI
 4oWV9IpKkGBDrM3kDz4wIuTQ3pnN6NCOSAsTR+lY2bFJJYGMXwtTwBxODx4AEpGx160o1Tvb35O
 QrbS9vKZg9HXhdd8zpigNSaxAfBJWw53Koph20N01/y857F1eQEnkFPHXR8ife46VIAfPyoQAzI
 k+HcSd9LFpI0Whw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Remove the completed task tracking the rework of the sysfs interface.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/TODO | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpio/TODO b/drivers/gpio/TODO
index 4a8b349f2483a91883c74b07a43efb1462dbd377..97024925f14ab92b311741b0b7944acbddcf5c4b 100644
--- a/drivers/gpio/TODO
+++ b/drivers/gpio/TODO
@@ -183,19 +183,6 @@ remove the old ones and finally rename the new ones back to the old names.
 
 -------------------------------------------------------------------------------
 
-Extend the sysfs ABI to allow exporting lines by their HW offsets
-
-The need to support the sysfs GPIO class is one of the main obstacles to
-removing the global GPIO numberspace from the kernel. In order to wean users
-off using global numbers from user-space, extend the existing interface with
-new per-gpiochip export/unexport attributes that allow to refer to GPIOs using
-their hardware offsets within the chip.
-
-Encourage users to switch to using them and eventually remove the existing
-global export/unexport attribues.
-
--------------------------------------------------------------------------------
-
 Remove GPIOD_FLAGS_BIT_NONEXCLUSIVE
 
 GPIOs in the linux kernel are meant to be an exclusive resource. This means

-- 
2.48.1


