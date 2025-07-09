Return-Path: <linux-gpio+bounces-22963-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AA7AFE05F
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 08:47:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5F911C41C11
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 06:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE9672836BE;
	Wed,  9 Jul 2025 06:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RAUtHZ45"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F8A28134C
	for <linux-gpio@vger.kernel.org>; Wed,  9 Jul 2025 06:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752043360; cv=none; b=p6hD7nkB3XkSKN6JWaRaoa+CE8P+7JW00w2QhJANSvmNbJSv7hULZRT521yK+kiDdYFEa+c8vr9IwLNpNWSomHPSRhuBoJEhYq4eZNA/NSGqSANU+ZD6htq+5/i6yjgU/A63fBM6u2wcMxjDsIYe6eF7jc/4qQL64dw4Ww6m9zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752043360; c=relaxed/simple;
	bh=Nuvs407c3+66Qu8FgkGdfBaQ5GE3ismYcRngagVFJ4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MoFECiNo7c85XLdS3Dt6EfhgqJykVTcCGZRZYjm2R/PWqH3rKJ2+oGl5tjK8ULU3O1v41hLgZuR8UaH98LWNntpXUfCPK9ZE/JMdSUFENLNAJfdqV/JR9SUkyn54IEy6d9kKOiZ/tPwD2voZinQ7z75UyfCerVHEvwOwVi+Q1lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RAUtHZ45; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-453398e90e9so37321095e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Jul 2025 23:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752043357; x=1752648157; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E976DkzNR+BwTdvOcAZRGj+DsyDJt9zF9/zM1CbhNIs=;
        b=RAUtHZ45JclysjNoFfB1TXNH93VMplymhHCImBEKAVss6C+27wMV7ESo4qENNYOcuF
         zj/TJx0Y7ixXLI/Bq55QVmUnYDCvgQBjyWie3CGjOTkImiVNvWUII0l86eqKqUXULyMo
         3pinLfWtQzoy1zu3wRj7RMQhAw52JE6lmohDNAKUXtmJ61QXDtzM1y49pdqnxHi0E+WH
         t9qD9/1ukDw3CoI1B7FyQkVMjYVOC60Kamaky+YmxHM0+18z8wRF6Nx6qGsue0L8tghF
         MMc5yYXzhDjZYI6JE2pwfAp3fdu645l3RMxFX/QtHzpRcQMZMzw640B7m/6fWs/tDksj
         hvIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752043357; x=1752648157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E976DkzNR+BwTdvOcAZRGj+DsyDJt9zF9/zM1CbhNIs=;
        b=VXzpbfELi213LNgelKo9eWxM3o28BW4vpzcTG4VDO5Dw7E7Kouq3RrnI+Z/ZWvheHU
         hSbGOZyb63G37nT5l+dgKXxDhLMlP66y8ZSgVxbSDHP1drdeVpGNKO/kTKW6x5S4cMkP
         jAfod6FmT7twOxinjEYmiW9/ReNazkc+8PiDYoiNP6WCJlg9Lijiqe83oVr7YZnKWmpm
         xW+rDYj31SPGdEIgNWf38d/+8Bn/7X4WiIQLqZc5n0bQ8r2Jl+24lsXZtGxqwMIvohRE
         XJRpjfJ+BGRG28re55mZPRo3rZoe33ePk7s18CCKAGdM41Elob+2JofLAmM6d3F3vKOm
         O6sw==
X-Gm-Message-State: AOJu0Yx/tZQjQwCX32KSw5mLXmP9HTfJU5+721gSd7KzGhL7IpkV+n0Q
	QmHWTw61N9GF9MgCGKskIKB2HcNCA3FH4p99thtxhLF1XAVS6TIFLDxATrEZwK32qMg=
X-Gm-Gg: ASbGncuzlFEtBsuDiI9ID8WrhsOdH5G7bh8sC24FQqj1hd5bTCB6dm0sGpYDEi81Men
	flY+5T5TfInhG24yEdi38NHHnBgJeVGk9dwcp9gZXFM7JR5bXU4qsNcu9AvWt8hW8D2nxw/3UEK
	ecWoKbxqix8Rdqb2AZpo7EuTxMafsPAPEj0YkUtYSErg7f7kAJyBRt60IzPVg2tcWeo0mr3Ecpy
	DDpz7hdS1CHV0omlDXxXok6xIC2mldbm7xe1dMigrBSzVfiiECAdB8lLO6wDS238lAZZpJcqHhQ
	PAwx9KaFK2ytSOPlRWFfCjFmtAALXF/5EcPaPmKqmKad5B3KKxX6N9cq
X-Google-Smtp-Source: AGHT+IHi+3seAQJhUSG/U1FgiNxSTYdYEu1xk8bl6taZbECqdEFlu6Pv4ri3aXmTuPAo4Albaf6BVQ==
X-Received: by 2002:a05:600c:19d1:b0:444:c28f:e81a with SMTP id 5b1f17b1804b1-454d53e67c7mr9606365e9.27.1752043357343;
        Tue, 08 Jul 2025 23:42:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030c443sm15115341f8f.11.2025.07.08.23.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 23:42:36 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 08:41:56 +0200
Subject: [PATCH 19/19] gpio: zynqmp-modepin: set line value in
 .direction_output()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-gpiochip-set-rv-gpio-remaining-v1-19-b8950f69618d@linaro.org>
References: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
In-Reply-To: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 Srinivas Neeli <srinivas.neeli@amd.com>, 
 Michal Simek <michal.simek@amd.com>, Nandor Han <nandor.han@ge.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=854;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=IhD/N+4+Xg2O9hP4AtgHBCqqrPPHCOSCnlXwGhv+djk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobg9FUTxKP1TIjkWKQ/foJIGz60zeLZU+t+Fj1
 eYCIokKJ4WJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG4PRQAKCRARpy6gFHHX
 cm2mEACt3VB84bPMSnM2RT0+6t2zvIhWob2gSpxWZnVZkXwegG0Xrt1uxZUq6u2uWKteI+QUILE
 PAGSWxD69oqxqWW7wsxvLavRZ5o4sskoD4fViABUqOqIq9K3XMK+/hJsEGcgbSI9v+YJo3dnXG8
 MYwfcQfboOgt73NEw6ou7UcAIN7cDUeGV38FzQuAIen2aryODpFil0IUF5syaurHY76mU1JvF41
 Wejs6/wXZJArjCsRppF/FGVKJm0EU4uBc7+haxh0ya9y5DyjF/MKKApjaEtiqBouTdsstPPPqFb
 +Nz6fIji5cEX9Bfvlt9TZ+GeIOc0aOvAIUysV4gVs+8G6Sp6mOm5m5Vzp59rdRl0m8R804kN7pg
 x7Rk4QXy3me49f9Ompx4JkI+8uJdDTph7aiy7i+/0CRAi+5Qgod/BP0Hl5o0PFbz/BBRJghIoLR
 JIH6t6WSHidwdPgTR6UkC9fjMi5IRVc6CYPpkpMdQ0k750dI3J7tkqfcaGQzmmLYrZgWJspnGy5
 yDR7dpXBLw2KfD+JeaVsOQXwCNlXsO/0FUW7Kv+1hQ9uoL1vU1LpRTaLdhoFD2rxRNsMw/dCya5
 YIihq1N/TQk3vSMpkZ2reNa8qq1UzxZD6VucjyLr6Ei9VeS9GQfa8gzwc39GvrrRBMe4lgWv5PC
 ycqiuAuPwx81i1g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

It's ok to not do anything specific when setting direction but the
callback should still respect the line value the user requests.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-zynqmp-modepin.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-zynqmp-modepin.c b/drivers/gpio/gpio-zynqmp-modepin.c
index 36a547d6fc5a5c100f81c72600e14d620a462cc5..6dc5d7acb89c544d8dd9e217c96e41cc5599d116 100644
--- a/drivers/gpio/gpio-zynqmp-modepin.c
+++ b/drivers/gpio/gpio-zynqmp-modepin.c
@@ -104,7 +104,7 @@ static int modepin_gpio_dir_in(struct gpio_chip *chip, unsigned int pin)
 static int modepin_gpio_dir_out(struct gpio_chip *chip, unsigned int pin,
 				int state)
 {
-	return 0;
+	return modepin_gpio_set_value(chip, pin, state);
 }
 
 /**

-- 
2.48.1


