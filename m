Return-Path: <linux-gpio+bounces-18299-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DD0A7D5B1
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 09:27:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00DF51894653
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 07:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EACCE225771;
	Mon,  7 Apr 2025 07:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="az8NH4TE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1FE154C0D
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 07:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010355; cv=none; b=ReiyaXJSlZ6nfHNvnbfGR+fvX03y2Jc4/iSsOUi167JTQCC0ryAvtPdhBb5gNczy+aPSLXftikmOEx4tSyQM9yvEwODC7UnyXVCD2Z3pstE0DgYd3IhnYAYjmZVsenWlAN6Rv0bWuwhwhrOZM7WpnqXhTlzASStX8Q18MBeGPl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010355; c=relaxed/simple;
	bh=BlY3UN5r5ZQCn0tDpg4oRi8gowXTcjflrHOZG4T6F4A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Rp39eSemGBGtmNlyssLVrkxW2iFvvkgFNOfQ8o/765WeQTf50EUAUt13T8BwzhOBkugD/kfYPmiqe58zx1HuJ/K9WFSDt+DxrqRY4ldwwtxmsrMw7lha+a0yVLcWXxTR8gXeZCRj4pf7V5BqsLFSzMM6wnrfPxhO35FeIyihw30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=az8NH4TE; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso2936872f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 00:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010352; x=1744615152; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WqKh+14kSRTt3VLgemwcn051J7IF3QB71JoxU60RwiY=;
        b=az8NH4TEk+ZEeX8OVtLOqMTMA+k/HIZeKrpuQoIGu2DNEB/VY2gHoXRxCGtsfshwQl
         p+ZKXuuWI7tjDpGvn6okSltVcJTcjNSav9enyyPOq0r7gWcssSbyGnWdFzCFM/uOCz1C
         HKn4emztEJcvmKYq5HhoQ2qW0uutn/+MHQIoH1hIEYyV68Jwge5syv7lAmuylqibgu8z
         /7H0Pl9VJoFBj0/ff7TKHJ14ej0C9vAW3BouNN/iRloXzF9epaJWBUhru4Gg1EDnG5Sf
         i1E1y1/1Ul/HT7zfFZmOGTKfWUE+7YVsUXOiU/8bd30P2uMNF2OJFd4xrj5SvvyX904b
         GDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010352; x=1744615152;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WqKh+14kSRTt3VLgemwcn051J7IF3QB71JoxU60RwiY=;
        b=F4Rr2XaKnN8rYqT2K4QNnE8ujaLqf03AoLeDtyPbuLXCfhAs3byYfujIBZlDCOiVTs
         yc5T9cXCyaGXpquNbp+0Us1RMuEFaODDP05+/TszWZHU0jYfdsRkRLFOIlEQpHgEFhmQ
         vFM84Km71QEkAHWPOjKtmNsZ6GGyC5t6PUdLY+iPr5rQ/orhdorsj3tc/Jp76Ud/uDQi
         0HPRg/mjai7J/D/O/vDSlGo/qR79TRzocoHlvDgUZYJRf3ShydGa7VK7AjYKscSX7ps1
         hvLiWjBMEKawRalwmno/OfscqOx+yycbCeIZRg/huQReEnPc18ml9o8VEIo+hGpBegnX
         otrA==
X-Forwarded-Encrypted: i=1; AJvYcCWXx/6SHPPcpdV+ZoJnhKbnQRmBe00uxDrL8q5j18KO+DkDi60YERImlyXlhfZa2q37YNTboYvjoOdu@vger.kernel.org
X-Gm-Message-State: AOJu0YxL9kXjERbbWjQ+qn2lBUMm4ozPOw94QyAjiE/H4SxafRifvNW2
	af8Tv/SkkTLm706Pda3bDxPcSXkMdgeXS5QkqTJvjC0VXdAWMcXWKAuyUTHo9po=
X-Gm-Gg: ASbGncu8lPau0oGHUlBPHONLHLwpeuSEyLOsbcRaJdqQ0DuSZHYghQD5G53+GyacpmM
	IaxaW/1+DsQ/HYcy5gL8TKrwXq5//042wy/lqaumsbkv9zjm/7r/jWsUoRNJnAASukRXcm4ZxGm
	82m4sKHiqSTI589Z5F4rSV6gFhsSDiQ+hNhu9GiO+2G1aWBsk3PcNrEoZH5uSh3GEltajGkXB6W
	cME/NksLYSfez0OMD02TceY4qQrO2UnBuF0ACCAHeAKRVoXcYINGVIFhWrncsxJf+P5Ed0iq6JJ
	GMEs+8p9WCBXQvKuhYqYthAsnitEcbdkQLKO5Zlv2vPK20a2
X-Google-Smtp-Source: AGHT+IGvMdRPD+kjJ9Hujy59G/36mNIjZPkQ7ysnvQL9hCAIjtiyBVlbUsUp0SDWyYOEmz2lXL6QBg==
X-Received: by 2002:a05:6000:2283:b0:39a:c80b:828a with SMTP id ffacd0b85a97d-39d6fc56dd2mr5544644f8f.33.1744010352600;
        Mon, 07 Apr 2025 00:19:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364c959sm120215145e9.25.2025.04.07.00.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:19:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/3] Input: convert GPIO chips to using new value setters
Date: Mon, 07 Apr 2025 09:19:09 +0200
Message-Id: <20250407-gpiochip-set-rv-input-v1-0-a8b45b18e79c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG1882cC/x3MTQqAIBBA4avErBvwBym6SrQom3Q2JloRiHdPW
 n6L9wpkSkwZpq5Aooczn6FB9h1YvwZHyHszKKGM0Fqii3xazxEzXZge5BDvCzcr1ShHawatoLU
 x0cHv/52XWj+2dvWEZwAAAA==
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=972;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=BlY3UN5r5ZQCn0tDpg4oRi8gowXTcjflrHOZG4T6F4A=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83xvMKyHBavWMOsfyMnVmVhp65dXSJW20Oolq
 K6mqIAwtxSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N8bwAKCRARpy6gFHHX
 crMxEACb8LC3x3XGrTmU8mAJ0CIwJGyS9Z6f/YjHflKW3t+xGNYV2Mpa5Sm8/gMmLufd1ZG/7qH
 tL/XTn+onWyHHqhjV6teuLm+sXA+htDwn7jaVRLzNuS+W/EcQYkSgDeY97H1+qF3/k1yrkA3Ki9
 ln81wTFNuo6RKJve5+qmY5goKp2C+HuHYEciQqy+VGtKt071ibqEHH9flV7wiH9l1/e8RWp3ngT
 8c1fjG2HmzWuJINEimIE0Ik7PGSf1yn0yT1SVRcT8uJZLUQzYmdJKStphph0/Iiitsoma6COOIg
 7LKUzu0puqXOUjkViclKytOdXrft3Z9km4lkG809AlVdvBHlOwJ28KQR1cu3iMezKvE3NswtrjJ
 Etlq6wu92rD/fnxOmQ6pUBy6UxXtbV7SzBPO8JIuGr8779328/eiLb3kt9/DU/7tkHjnXINQnjF
 Wb4u5v4DD7KNKGzs0K7pGYafwPRP1IclhWS7wiNIbDCvnSx3P5EPgs66BJQH8LJHPWYH3O3Ob9D
 PKPtiiTLvUfnb+mUIPzMSYoXUE5tUfmR1dexTOqteQRxcyEPS0BybIJDyn1cChWy+4tiIuXnutb
 Mhb92PRqY5+CwzG0TCw1v54dmpk8sNo01zpApnJjuGCJP0mOTMdKJs6dzS+3HvCe2QcM9DDjs6P
 KEzCLIZgo8AayAw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. We're in the process of
converting all GPIO drivers to using the new API. This series converts
all the GPIO controllers under drivers/input/.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (3):
      Input: ad7879 - use new GPIO line value setter callbacks
      Input: adp5588 - use new GPIO line value setter callbacks
      Input: adp5589 - use new GPIO line value setter callbacks

 drivers/input/keyboard/adp5588-keys.c |  9 +++++----
 drivers/input/keyboard/adp5589-keys.c | 11 ++++++-----
 drivers/input/touchscreen/ad7879.c    | 11 +++++++----
 3 files changed, 18 insertions(+), 13 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250331-gpiochip-set-rv-input-bc12818c5732

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


