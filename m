Return-Path: <linux-gpio+bounces-6608-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8478CE953
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2024 20:04:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A60AE280F23
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2024 18:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 738BA3B293;
	Fri, 24 May 2024 18:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bjRi0ec5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913C639FD4
	for <linux-gpio@vger.kernel.org>; Fri, 24 May 2024 18:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716573848; cv=none; b=giU8Sy/VVD667pRtJBM7HoU4Rse6w0F1zs/uYx/EuNQu2l6SeBenbwqMnzqv2PjD6j+gZuoFI7/kR2ILV/f0oRwyLNfe7Q6v3hA8SUJPNjW6M1ES7aup+HdHuEr5LrHfECNu+KeCNhD0rUw63AnzOpWdyM3w6SnMnSX0bLExtpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716573848; c=relaxed/simple;
	bh=xcPbQWGcaApL9iu6CvvsQmNwa5FSOhvgCq507aC6CSg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=C87r38uqocWnii23k9TneIpFNuwbP88uDGvdJ0oBkTa7oy5zkpbpiQ1S70acp78uG6fbYgqcyh50uqestSgZC0DSONsKwIA5Bqcc7a/L0va02AHQGPf+Jcr4Lot7E2SUnq1a75HvmzslhUk5zC/Rac1+5AJiSYyF6ag3ijLTNFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bjRi0ec5; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4210aa012e5so6428955e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 24 May 2024 11:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716573844; x=1717178644; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WaxqONmuOilC4mIC3FFNFOnvTV890+lcMH/n5cSV+c0=;
        b=bjRi0ec5qDp+ilmof59snkFwwVgIXoN+ZRoK9RESuBl/y0dpxqcXYt0y7R3HjsAvr3
         53Sj12blA6M1Fc7pO+x/19DXuZlapPVp5NpZsPx16v4Wpd4whGuHdfP8eroRtNGu/nfr
         38lKy8RWauHE+0r/cWgsEpLDMZJN95K5YyWj6lboQ55CvQWEnyk1AwmlnT2KZ5vDDNp+
         CipzpAEz7IrHL5uhxYxH0i+Bd3zLekDJ/m8PrUIRk7JDxSwjnZzNZeqvW/9seezBS89S
         tgfo+tI+rA/WcvgZpT88WD1rn4bul1nhGHGFM1nhBPjoalyjyw5m8EH20ZhYKXQ6hNmt
         GDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716573844; x=1717178644;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WaxqONmuOilC4mIC3FFNFOnvTV890+lcMH/n5cSV+c0=;
        b=fJKP384gVlqbM9twdmzIoxbux8VIJ1SAPeKy9XK4ua3gU4BhMJmRnQdYsvlxsIKEVF
         xZYBBpVfrbSsDylcjr+HlARlNxpkcKPN2zN7LZBD1Gaot9FabXP0A6RJYmoaZB4oYKdH
         T6FR5b0yJG5IUG+xqGYRJeMPdeQglxRtmFrW6ZLT0E78kM3lfHb5kK1x05gvpbVECkSC
         F3HRvJ5a3/aqKDCYP8no65WQooYt22EpDWy472/B+/Lcaz+76mGXNeVUUO4XAUsan9Cp
         TmtHptIRrpGYhBeH2M02b4vgZx1wUmAuq4fYpg8DqKM5VPxfng7YxXpqZhdA+tega69J
         RoHw==
X-Forwarded-Encrypted: i=1; AJvYcCU88gNVWnXraeVSwcX7COR8/7/pMsz98riH8LVQHIpG1hJOJ4+nIIS28nwdkNiTuOMObiRlT7CFdeyZpYWRl98FocfRQJuy0bPKlg==
X-Gm-Message-State: AOJu0YwLOII0a3kEyPY8NFoqqd9TeSTQcbYORceBvnDcX4ZrFroIpOLa
	W/es7hH8bibdY+z60TcXqqnt0CjZOj6hgAz4KjVrNF7hJoFh7JvdQ7EvUiJkx3h4KxF9uNfvi8d
	R
X-Google-Smtp-Source: AGHT+IGcomq6UBxY765+4ngndQO4RbNjQ4MHZ9UOOpbagQud/qPF+eY+L6HqO9VgcXWKkYjovc8Pow==
X-Received: by 2002:a7b:c2aa:0:b0:41c:1434:f571 with SMTP id 5b1f17b1804b1-42108aba96bmr21688655e9.37.1716573844512;
        Fri, 24 May 2024 11:04:04 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:986a:afa7:d450:11a9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-420fc82cc41sm58338675e9.0.2024.05.24.11.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 11:04:04 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH libgpiod 0/4] tools: tests: fix a few issues in bash
 scripts
Date: Fri, 24 May 2024 20:03:26 +0200
Message-Id: <20240524-fix-bash-tests-v1-0-1397c73073a6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG7WUGYC/x2MQQqAMAzAviI9W9DZKfgV8bBpNwuisooI4t8dH
 gNJHlBOwgp98UDiS1T2LUNdFjAtbouMMmcGUxmqrCEMcqN3uuDJeipasj6YlqjzDeToSJyNfzj
 AKj4ess8wvu8HcJe3EmoAAAA=
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=666;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=xcPbQWGcaApL9iu6CvvsQmNwa5FSOhvgCq507aC6CSg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmUNaKRa5+GMmdYjQ75wZTwLKZZAP19YgMkLdu6
 Kvii1T6JzCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZlDWigAKCRARpy6gFHHX
 cmdUD/sG4c+vHxurNLEiEXM+MSkWXXE23b0oeEyHKXsnc4sFutnzXxQXzCLLBMAnkuzrHVDWCMN
 C+jQlBcMBpBSMHSL6u9tq3JlALTcexnP8XzfBHFD705i7On5YVYAaOPUwMws3AhUuR06Zrz1hHo
 XnTWdor0ZrHod1wylbEG90Vi1pDaGOyX/u7jFbjcfdY98eLzy8819iBiDBjcmrqusckqt3qDqYB
 oZEP7E1jfBuxZEaxeEnNlE6Fv2Q+LqTAQPHTD3TuifkYBYXZaA/y8qxiq/Dd3V7nybfA1udfMdq
 pswQkjjbHGox4H5qmrox27OD0JT+PbY4tP1JpwA/AiAPvaCLf9+kQV+omWVuPP7g2WC4jaXfTu6
 MsKXH5y7vYW/zfh/oE89YR8iNhyX4gxexfVAfp6kYFcVF32KzCpsbVZNDoOS+Pl6MImLlvSK3jH
 +q88sZatjB3Mzqq+Pr5pe3wBASHC82H78j8VnsC0mGCTTxdpZR1R9MIhw2JyJDM4Gc0pwwcNVUN
 vZgQ8W89GNRhiAs1BKXnI9QTGYVd7b4Lad4/0dD34f9lBywHet7n86kiXg+hMzAG+D8s+dLTIXy
 ADcUNvwRtBlx7jBwHoSpwuCN9FAxY2HyTE1IfbwS4CN4YMlfofMpWVm1ZyfR1mGi0z2t+EE5FUH
 9+jQQDGfa9e2JIA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Fix a few issues with tools tests reported by Andy.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (4):
      tools: tests: use tabs for indentation consistently
      tools: tests: use $@ instead of $*
      tools: tests: remove unneeded ';' in while loops
      tools: tests: remove dependency on grep

 tools/gpio-tools-test.bash | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)
---
base-commit: 27fe10150f6d5fa78d1a1ef1e922dc8395d1154d
change-id: 20240524-fix-bash-tests-545bf26447b3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


