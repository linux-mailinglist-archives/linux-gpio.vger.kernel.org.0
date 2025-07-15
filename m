Return-Path: <linux-gpio+bounces-23283-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4C5B054A6
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 10:21:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFD951C2239D
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 08:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9692B275B1E;
	Tue, 15 Jul 2025 08:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="m14a5bhl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC640275AF3
	for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2025 08:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752567597; cv=none; b=FZKVWGzSZzTI0mAzCn7TqKEbc9vmONVUECmHrN5gxuYfH0gREZ+j1TSIMdLQ1xS4K4n+gVBKW+T+QpLNVKUNm8fKWj42LjdEMqphzRNWqMLnXgxl9odtjyo3MippqXLkwdj2TN4ZAk8PRSWjkewLL/1ff9kwyQDj1tJzQlO9nmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752567597; c=relaxed/simple;
	bh=8h/uJyLdFiOc+xHWxiRyYqRP++mrDzMssgrGujDvXOU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S7R5XCwBBR/psIBKOK2q4VdK7oIGMM77wkYXyVY0Vm8Q/u4q+wmNTJh1XcYSMzA8FL5wUj+EzpVeDWXSI3djrEqIXQ44O0bct7/1b743TW0Q+WDgC+ahT713Ts6L+LHknY9AH1oKhllPG9waDwjWOXT/Rbg+yt2OCf5EUS3PiOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=m14a5bhl; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-455b00283a5so21819035e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2025 01:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752567594; x=1753172394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cgq3BkoPZV1MsAUuUatWqCO5CrlezlZFLpi79f3dpXM=;
        b=m14a5bhlSHubWtfw2qmiY2GGNc92M1ecD7UquMCgWan+4MgRyhx6YPLTeuEj69TV0B
         3/Vdugo2dhHEIlhHIxn6se2w3gHgFeUdTMQAZSzsVCwa/u95hK2q2xV/kaK8dr+VZcsw
         PcGZLLWt3fK5OxKr+j9FsRlxKi78GTPm58R5VAbip4H2M4VEfu8dW4SbM7N8MV3o2Umw
         0M0bDZZ32m5j+AwIkpWN5WT538XF8EeEvTCpyP47uWohKE6RNaKkBwojC1y/64A4+Jja
         4I0dw4lUPSgJkB+gLkFSCJzZ//cKxaa5EHz4fxNVVnjVwGj3aCUzuYmD8BhQ5XMhepsa
         OCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752567594; x=1753172394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cgq3BkoPZV1MsAUuUatWqCO5CrlezlZFLpi79f3dpXM=;
        b=E4l01ofbf6ilARA52DxZsNcieM0bPe1RqKXWLwaI7xlMox0XEMqrNEsTPryVnmSK58
         xlsGiZrJMNdyv0B4+zsAlzYND+PtafizPETDWyMhMKAdhMhrp44KcGVwarQx2wC2jh8T
         ItEYWKpkZHXJGZJtbWh/QHZjQ7GY3g/d0hbxF2WMnaFHMVUCP+TcjzRRL9Gna860du2M
         +rUeI+hEugNHBb0BNfSig3m/NdEjcdZO10n7FsyLR/PKdYhjucgZkYw+ZYYWpJWQ3qrO
         sOc2tpGIOfAqEO1pHQkWcg8X1nA5nYrglbtbujtdDb/ugEOs1C9HjDB2F+DLaGJnAZYX
         2aZA==
X-Gm-Message-State: AOJu0YwPWUq98yRv0/DOUna/5bnv1CMVnm1xyL72/O1CHuCx/6zdR6H6
	HsT8vJ+RpHySFG48x1J9e/n9UYHtGbj3kLZtyk49a9oH1hzsOHHtmWi6HZXBz9cyA74=
X-Gm-Gg: ASbGncsUN5gF3V9fuskO4cwiciCSDHi6ZzgPzEhgQyhxDNMab2olAEaqI3RtAklnm5K
	gaZJjuN2QMUtReX4TY1+LfQXhg21+NTB8yaLRe/1BU8EnAdhgChkXuj6Gr7cSehupP4EJA7sXG1
	+iGvlpa2QUvkRrQiOT3PhAXqkMAth/I/waOhkhcThrfOoVly4Rjk/p3pyIswH/Zk4HL8IIydvl2
	CR3/IV+oyP0lRddnI+pPMR6iJG/XfQVjWThkXTD3WNrEY9bEK/ot0Bl0t/kBr9T779EgffgZ0+m
	PwddDTOZAUO/IrP9nQ6TUK9O5a8Z7PeUU0RTwyRVMK+Otz919j/enH7Q00A+es5U4fKhVOyfrt6
	2y3iZqYGJJncRhLb+
X-Google-Smtp-Source: AGHT+IGrkuKRf8ASKDfX0sTDcpcG9CKUjqG6Ra7UQoKBXPCTkOeDhsizOUZ9apPiOxx9SQWio855/Q==
X-Received: by 2002:a05:600c:a08c:b0:456:22f0:d9ca with SMTP id 5b1f17b1804b1-45622f0de79mr38258375e9.26.1752567593839;
        Tue, 15 Jul 2025 01:19:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:5631:db97:f06d:3c45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc1de0sm14334589f8f.24.2025.07.15.01.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 01:19:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 15 Jul 2025 10:19:44 +0200
Subject: [PATCH v2 1/2] gpio: wcove: use regmap_assign_bits() in .set()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250715-gpiochip-set-rv-gpio-remaining-v2-1-072b4cf06330@linaro.org>
References: <20250715-gpiochip-set-rv-gpio-remaining-v2-0-072b4cf06330@linaro.org>
In-Reply-To: <20250715-gpiochip-set-rv-gpio-remaining-v2-0-072b4cf06330@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 Srinivas Neeli <srinivas.neeli@amd.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=895;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=gLwj1jcF6O5wtOOh/IADmop2uEL16XARUpkAcXGwhYI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBodg8nnunuxPzL46V7QrmHbN9D3vpJ5ZvWi5UKe
 4SnHsoJVQGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaHYPJwAKCRARpy6gFHHX
 clQZEADJ0l35mCofC3vsZu3DzXah2/oltxb9XT8xF2yTRVenxDymV25Gx8mLtGrzx1r7gD51HZi
 FPwhwABLkcZ1j5oMOx4ApDzrbJX4OATYGBwDgG+sSZajIAxYD5lrziOc8X9tWiLO5nwvHpGrp1f
 A+a+dztQH4GiGbUKOLOHAjRVKocN7/kfW8roBJtEybs3X8DL2vOcVDEtj1B5Urp8oMN/ES9Riua
 N7UOyjMzvopcoEFvaCMHloUDGfviE2pH/5UYPwQaxanXqmp1KOeQccQ+e/PeASUm9PUEQKi2UjW
 eNZzrx04cufdTax83865WDbLCv+1MtUC7y3mweuRV64BdzAkM1mON5HW5cmmSYGyW3kZLq2UVIW
 W5oFI44PUblHYGG592KPnM9UViWAmJC8Qio73ERDFQqGhyre9uyVvQA73F91m/vN168+iyyqmOF
 qeUJ+hoqu9bkSMoQkGIWuK9WlpS/LOGgCadCPgLxyFtQf7BYJOEd9ehnu7NmkxgfRpdRU3vQVfT
 I506EqBAiYrorQmf/RS4qWlEzc8zCGvU7syvG54yNkhHjgg2eRKoUZ5AuFS4pbY9XKpLnyQlHhy
 rQWzaesgWkLRoJDNUStyK2XS/eX2zUqpb/E6kyR1kEi3q4p/V9CytJsZe07Cs6DzF7HG8V/J7FF
 1UuxI82J3v792Qg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Replace the if-else with a direct call to the regmap_assign_bits()
helper and save a couple lines of code.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-wcove.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-wcove.c b/drivers/gpio/gpio-wcove.c
index 1ec24f6f9300f33f5b3f0f8deb539e08392b8188..816fb8d113e66b27070f286755f3192b2a8f8512 100644
--- a/drivers/gpio/gpio-wcove.c
+++ b/drivers/gpio/gpio-wcove.c
@@ -208,10 +208,7 @@ static void wcove_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 	if (reg < 0)
 		return;
 
-	if (value)
-		regmap_set_bits(wg->regmap, reg, 1);
-	else
-		regmap_clear_bits(wg->regmap, reg, 1);
+	regmap_assign_bits(wg->regmap, reg, 1, value);
 }
 
 static int wcove_gpio_set_config(struct gpio_chip *chip, unsigned int gpio,

-- 
2.48.1


