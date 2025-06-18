Return-Path: <linux-gpio+bounces-21770-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 358FEADED5A
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 15:04:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08DFE189A50D
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 13:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB327D27E;
	Wed, 18 Jun 2025 13:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="c3vpXc+E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AC438F80
	for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 13:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750251735; cv=none; b=gr3HrON8aedhAxyQhI0IQoZFd6wvgQos4l6a3yfGLiTKx6paUOC/eFLJoHpsjn/4oqx5pGm3X8uCxZfayOVyeZNQcXgXa6Vj4F5bmcAMXdXCOeGT1gJz8iCfdpnpRsUjKxMXErVSHFq249bOxUAxgpsY//gWvrVlQCoXLNWy1a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750251735; c=relaxed/simple;
	bh=hccs/FPXaY7RAT+ynuxuHb9c9hF4RB0vDaqzG5iDnIM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CQdXeLsUroQf5OB9nDSJ9OitPWaTR4UQKPCMXHOmU5O81pXJmujAsfCp/M8feqgn4enl6d/5h113BJhQETYUu/WgT0W7jBP1y/Q6QvljaNorqs1WEfdN3N9fwZzx2KBSpNYl5TPpfST9b0LdBksIpeF1L98PzmHo0UQyDDO9RgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=c3vpXc+E; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a54700a463so516022f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 06:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750251732; x=1750856532; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OTWR5btaPN4gCiFFn0DuYIolrKWDjrSKSxmNaXwLEWs=;
        b=c3vpXc+Ejx07D3Ro1DWhnXQgkRENHcjnadDlFvopQw6OBmGarmWDcKLSFV61bTT4xE
         8yC1ISu97qscGzLNAmAxWzJ1rP3u1LEwkd+1yThS3JvqQXA8b61NU83k6S59oz4ielNk
         AiJCMW8F1JrvcC9kwy/0dsRVuQOMXYLMVoghMTzPwVA4GRRbodSXCjlIw4hwZ1QOCnTM
         rrwQB7uXc+qVSTLQ1sYlS6Jmq0+kMYgIVKFim8WCfiL9bt6PRDYLrHfX9cF5dFYtUtHZ
         bZ/b62Cqiy7mu8aALk7EUwO4z7s1rsqHVYh2bbkWP4cg08cicdbhM9HcvtVHX0Y7WGrX
         XT5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750251732; x=1750856532;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OTWR5btaPN4gCiFFn0DuYIolrKWDjrSKSxmNaXwLEWs=;
        b=Lv2irYu+T4Hkso9qu63F6csYUYFYjDswCuAfC8QfYOjJG4IYtpwnVUgSthEUeZ5P5v
         haj7b/fwGHNkN1V1X22ujzPB02tQRYiHAhlUZEVYGjA/eTNwh40lEiYu2p1LwH9CEqBo
         zanMFmkOWvg2AoL7QZ+hGFz9prc1q/blx/d+B+V9QZ2uTnkBWwdBknPJtMbOSWnpqrWr
         vCVsdtvAP9KcYs4mb/Y5COwzF7M3ERGQPAiKxdTfku9T1pjrSEEx9E8NXvFKqy1KGGOs
         juY5Ph5YlKpMe8UTtbKJZ8q3YzCHSIsJAT6OKYGeXFf/nHy4lsAFscxdSwGe14eV/IjF
         TqlA==
X-Forwarded-Encrypted: i=1; AJvYcCU7rGmzsQQX+YqAS4XRsay/snggbAGPkyIRyWki1HX30QuoQF6jRsgZO0Qmq0McIbrnn1j7+otRVfhH@vger.kernel.org
X-Gm-Message-State: AOJu0YydXuhKGTGDKaAteR74Rvtl4XgsHmSXuJ2/w2LlkCKPtsytaDG9
	8IepRwiD14blUW5MmAXaoKHj8RQX0qfc0uSfLAzAhKH1lr0pp6esg2pkSN1F8y96TAg=
X-Gm-Gg: ASbGncu2dXvUc1WCqxGzUJS1Bke5678iaBzVw/a1LUyNObF0suC6uBw3uRkgElpbZxt
	Ua34e7b7FifwdL+DZgup50PHE7pZCvmecUUZpFuwOBMsOwQNHQfmf/WZvLpSN7/oN4SKRZI5tpr
	QOlq0mnjsFhpnvscDs1yd9DJupmhXFIm8EYpfKG144B3Fma7nRd8Bgy/1bdW1VxV1mTjaq0Ss1+
	nKXqPbX9NlyIUYvwkeiq+XlH/h2l/0Z1oYaznEakCRhcA8YD3Wr8WbbDH+BABKsZnbq90JOfon5
	2UW+DD8SeT2bE4T++tHKFuooYku0yt2HDvecPK02A2axF5ZJaXPySipBMPJVRw+GOA==
X-Google-Smtp-Source: AGHT+IGyG6czM+NA4DL6DPDZolzFgEkYLp4uzIqdLlHk4uIN2olygmeuzCIqgpbNsdJHz0t3ZLd8vg==
X-Received: by 2002:a05:6000:2209:b0:3a5:8977:e0f8 with SMTP id ffacd0b85a97d-3a58e269482mr2168586f8f.19.1750251731670;
        Wed, 18 Jun 2025 06:02:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ad8:9ec2:efc8:7797])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08c99sm17043595f8f.63.2025.06.18.06.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 06:02:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/2] gpio: fix NULL-pointer dereferences introduced in GPIO
 chip setter conversion
Date: Wed, 18 Jun 2025 15:02:05 +0200
Message-Id: <20250618-gpio-mmio-fix-setter-v1-0-2578ffb77019@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM24UmgC/x2MSwqAMAwFryJZG2j941XEhZqoWVilLSIU725wM
 zAM7yUI7IUD9FkCz7cEOZ2KzTNY9sltjELqUJiiNo3tcLvkxONQrPJg4BjZIxFVRO1kSp5Bp5d
 nrf/tML7vB3m1S41mAAAA
X-Change-ID: 20250618-gpio-mmio-fix-setter-ddd4dd7a03eb
To: Klara Modin <klarasmodin@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1067;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=hccs/FPXaY7RAT+ynuxuHb9c9hF4RB0vDaqzG5iDnIM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoUrjP1wth3l3y0b/dpfsvBR3ga26T+3RSw3vJB
 x0kbg9Jlr+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFK4zwAKCRARpy6gFHHX
 cigrD/wIlZg68DQPUb/Uxwvn20BPPVNFSRmkO0ONhMjRxA9Cd5z9FVSELIqeJNcLmMOBgKKTrcl
 uUzpGdafOJq/2I413tc6QwR3r+VZdpnwxIIknZbn3z6XQjh93IPRQFA/WN2Bs2EodH69CwwXpxe
 0KSN3WZKe4N+fjCUA5kjmFbu7TNarl5YiZ2svHzzMosiyvTgdtMsxYHG5YwRPdfVB8KT32E/9c4
 3Vkj7Bp11lHQwPBkiZ6TU87k1rCNSMiboTHpWphUbc1a+Kt+gOOa2StXKi1OYSLVevP/TsF+fUR
 Bm23qRH6x1jOyUTfAIPiabWKKlwA0lrsJe4QpnSTeEPAZUWuLehTDK4HT/4PS8K8fCMZZhlZmpT
 AIIBZMua28rtFBDqAINXCRHVBBToqEUTNvGvpovtfRvL2CPhRNb31ZITYlKPhcClO9K7SATr2W8
 4REqdSa+37GH/Ej5jdTP8Rhhg58AoJyoTScoLrehje5gsaCBZ3wTCUtRLNnAR912GtGEYEAupJ5
 7BArRUYRcXDWX3Dk3mtJnOTtt39agcOSMvgpeFYQkeY0zQrtjgOQzQoQFOblmyHUR1a/e5kFJT+
 ZDhXeF8KVdg4YLstfIX58CZ1Bz1pOII36vTQnzQP0/a1+U6TuV5ZTbFm22S1Ms7pa5GrQ9dMgDa
 Ezax+2FfL6QSn3Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

I should have paid more attention when doing the GPIO chip setter
conversions that there are instances where the setters are accessed
directly using the function pointers in struct gpio_chip.

This is not optimal and I am making a mental note to track all such
use-cases and use the appropriate wrapper instead. For now: let's just
fix the issue in gpio-mmio and its users as well as one other converted
driver that suffers from it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (2):
      gpio: npcm-sgpio: don't use legacy GPIO chip setters
      gpio: mmio: don't use legacy GPIO chip setters

 drivers/gpio/gpio-74xx-mmio.c  | 2 +-
 drivers/gpio/gpio-en7523.c     | 2 +-
 drivers/gpio/gpio-mmio.c       | 6 +++---
 drivers/gpio/gpio-npcm-sgpio.c | 4 +---
 4 files changed, 6 insertions(+), 8 deletions(-)
---
base-commit: 7b20980ffc11514d8849811857d915001236bcfa
change-id: 20250618-gpio-mmio-fix-setter-ddd4dd7a03eb

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


