Return-Path: <linux-gpio+bounces-20280-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B19F6ABBC0C
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 13:10:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9BE4189D1DB
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 11:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28817274FDF;
	Mon, 19 May 2025 11:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PTFPsoMR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12480272E57
	for <linux-gpio@vger.kernel.org>; Mon, 19 May 2025 11:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747653049; cv=none; b=ZgPjaV8Mw4CmdCmKrVibpaDq7MXbH1INjizjVDsjlAgxH2ay5eTBB6L5plhKMWOef2Mfi8r3+39nyMO4q/V5fk5S7zpS9aDHgshuZenrnRdTUZ+i6yJ7I40Klgy2lSm1jpgCGrHZtVb0XDAjkUHSxnJtcW9xYgIKGx0uDC3PxsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747653049; c=relaxed/simple;
	bh=lVJrQsJXil7Z/MNgkiTJeGROHb9llxpbb11eHem8omM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Cc79NghqbL1zgx8DfznyyC4915uR+4EAvswVpVWJ6pghmhUIxqICnd+pc5S1AyEp3n8QBgp6gryFQW8XmUGrCBW74wtmnXbTo2sbhNo3sgZLwSq1Bu9mObwFqdNsYLxBVtEeafpctsaMjEf+UsAdBGQUpka9x54NHdf6uUQ3xl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PTFPsoMR; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so46533205e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 19 May 2025 04:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747653045; x=1748257845; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KlnrYkpvchYSPpqzNAuqtzyDvwusJv4qwLm9h1Fp4SM=;
        b=PTFPsoMRYl0wsTD+3dwueS4mfLUrllvHteniTzi1rFZ2il8oKTWlx0apwdKk9fJtAQ
         rd8tkaPXnWdtg8nJ5Gbmw8+Us4jVdXu400iOTiFQCNmZRLyz+YJkcjM8J3nqFinK/DNd
         wnzp3CACvoLvmvdHU0YMHjzyeDVM4NW7piee2pJL9n66XIWDIsNdDGXnxPEjpfJ7F6J6
         sw52JCi89L7wCvYXFcBaz1xq20kClMG4vaEwY/x22tBAEQrot5Jt1wdH17jvaFCpm1TA
         Kd+cbBPKQvItS5O0Hkp26VGsDu20TRHVALkt/KgQIDm8orbnQmIlldTKcBaD1tetfNx4
         QKBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747653045; x=1748257845;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KlnrYkpvchYSPpqzNAuqtzyDvwusJv4qwLm9h1Fp4SM=;
        b=t+B8Z+rgaKo9j37i2VgMTJjARstO0LmJdjl+BT7t5TguIVqBp9euhDUXQQGsXS6EnD
         iXLSV3YNha0K8KzkYlw94pcKOKMBX4pkBAk7yB2CGsqLGc18QvCZKzYZ4Z/YksgerneP
         9vqBlpcUJbg+XXcBAb8irDFjvtS94nvWTdiyB6Kj+/VFo0+vQVUDP6XES1wLfjMAeP5s
         kdVxtBv/S2lXABn1ryM349U3ONfRvkpYdo+VhuuC6UXwY0wZc2bYmOfi1FFglAm5ENrX
         tFcJNY8AU408mCCiftnQAHuL3u5TDFOgo+Amd6g+7UxfcBQ4wNoimGlBIg0eX8czsqxF
         5pJw==
X-Gm-Message-State: AOJu0YxytjaDPy0LPxLWVwrApdYv4FkMqKU8RIwOtMpvWXNIuLBh96WY
	ywkOKcuUhiGlDI3Qb7zdL49IZ0p1Ce/zeo7Jfu3DF0D+1CGsMKrBcBLbjIlmjjdP31bTEVk0JSL
	z6J0j
X-Gm-Gg: ASbGncsOq3abLDVftD/HSyiTAE0PumUTbplyItxpkRckg2KM/re118YzFOoV2r0TuZI
	yOXeonc0CTmmRKI0MXY003v4yVCxI4NF3c5JVJaVbu1TiuFXcHEOB+zlTVmdBYu2x7o9/XSwQyj
	4pXD6d2GCQEWyeJcOLDcjDuDf3tqciV3RR1zFYtLGG+co8OgojgPQAOKIAi+ZeoXYQuJ5GJvNtN
	3PuumlQmOK/+B9A/4uqSva1uPsOcKr9BwJbMNqT5urtePTHpCdM43YntUVPgaZow8fewdLnaa5V
	IbJ4KPEFisvGeiGfrU9KETEejaV2Apn47ldIBxWeGNxyEDgYGKiJs0c=
X-Google-Smtp-Source: AGHT+IE4NFbkuyDnl3cqhX3wLB5iol6GJ3o3IIHvl8i9q/PkFyJTZL8MRW+aYu2wp8LxHgzZXSpUzg==
X-Received: by 2002:a05:600c:8507:b0:43c:f597:d582 with SMTP id 5b1f17b1804b1-442fd608753mr110426555e9.1.1747653045171;
        Mon, 19 May 2025 04:10:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fc90:23dd:2853:309])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca88957sm12290575f8f.75.2025.05.19.04.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 04:10:44 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/3] gpio: fix Kconfig issues
Date: Mon, 19 May 2025 13:10:40 +0200
Message-Id: <20250519-gpio-irq-kconfig-fixes-v1-0-fe6ba1c6116d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALARK2gC/x3LQQqAIBBA0avIrBswQ8yuEi3CRhsCLYUIwrsnL
 R+f/0KhzFRgEi9kurlwig19J8DtawyEvDWDkkpL3VsMJyfkfOHhUvQc0PNDBbUfjRms8qRWaPO
 Z6Q/tnZdaP3Qr3iNoAAAA
X-Change-ID: 20250519-gpio-irq-kconfig-fixes-5f877392fe2a
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Peng Fan <peng.fan@nxp.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=632;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=lVJrQsJXil7Z/MNgkiTJeGROHb9llxpbb11eHem8omM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoKxGz30JoqAecUretb/uI1Qaguof272A92CI96
 ju5w84hez+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaCsRswAKCRARpy6gFHHX
 coQ1D/9RQMTCKMgZn2smazoutDftwgmURZPUz2kRWYo7aDQAkMTiurpb0Y1Nk/bwVXh42suzp0/
 686RyE1nOs5lDe35iIvWFSln5bVRLzVsPOp89Ewhj0Ab/pWkGbBOXSdjwAlclRdJmaez0VkXgOA
 8TnhAxh4BAo6aR3hgYMwqHAAxPog++8klw51oVbZ3rZeUGzUOGtzaeT5HGjag1NLkU1Thq7rE2Z
 YJuDX4Izx5TYex6AhmjntY3jRd7+hfmDfB1laBNBiwY1UMU0Tec+YpxpIyCHacUOqdijUyp9KsE
 AH00ZmkW+mfT/whKps3B9YqlAuUaJ47RqPtYL3ZX7kfx7Da5nMQZ4GQlN21SvyidAwdkRQtrVEO
 3chwBaMVW2TZBeM67DZEfHZ1uR8DQB6jQdN8x6vSfdO0Cjh0q3gfjiCURkz+vOfBJqOAghwV5XV
 9MLiktPGwczM0/Veb6HLzkmeGIZc5yttnGKMUdb2DEGFtS1xwi6uLQgAlRQxXjqlviJJeFj/iS2
 ybYNhjsHQACsxmWaKoLf1jZuQ59kZ1AgH83ydowT0hna+jQ2W0FdWN0euKXsnNurQI0hYAlJajB
 wfmhNzixTkS0zs1aO1om9Y/JTCPLoBee9qDrCMKJheTwqduK6PUBncDd7nu98j2+ooll38W7CDo
 G129wj60fbvVbTQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

This fixes two issues with the current immutable irqchip rework
signalled by the build bot.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (3):
      gpio: pxa: select GPIOLIB_IRQCHIP
      gpio: mpc8xxx: select GPIOLIB_IRQCHIP
      gpiolib: remove unneeded #ifdef

 drivers/gpio/Kconfig   | 3 ++-
 drivers/gpio/gpiolib.c | 2 --
 2 files changed, 2 insertions(+), 3 deletions(-)
---
base-commit: 8566fc3b96539e3235909d6bdda198e1282beaed
change-id: 20250519-gpio-irq-kconfig-fixes-5f877392fe2a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


