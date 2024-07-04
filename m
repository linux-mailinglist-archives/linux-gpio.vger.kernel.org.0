Return-Path: <linux-gpio+bounces-8051-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 977BA927D39
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2024 20:37:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5362E282236
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2024 18:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 251917346E;
	Thu,  4 Jul 2024 18:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FUvrfPY4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CE045979;
	Thu,  4 Jul 2024 18:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720118216; cv=none; b=owyqrKXXnB8GO8SNiW/uwnPD6V4Ud/52izUnKFvXzpxVvy9qpN3DLjW9YDou6Ly8trgGED7l5FRg8OQ9STzWSyIzsrh4OkbqiMwHNxGaxs7v0BrlgkpfR7u27Llwgeq57l2B/I4/ORlxSaecW+osM30ifO/qPqWK2XVrea7H/ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720118216; c=relaxed/simple;
	bh=2+vWKkD6NaDssBT+shr8RNi81lkdPvXcuXk+iWlx8No=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rHQHHF8qdJ1HEdggSi97AuvFtiUa0O71yC9fsWVsoOL1PWxFXhrjJnFmshelw+fkCMej1swwwDQwahizhOa34DvWSVDQ4iFHOinvSw0btAngiejKgAj4A/FjtJPfsv3PZja2VBwUQT4kTvwmQMEJmVk1rKMzcGWDtDpmLzUiKwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FUvrfPY4; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-425809eef0eso5940985e9.3;
        Thu, 04 Jul 2024 11:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720118214; x=1720723014; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FpkFfjiADJS0EPLlwf7BKxwjayUopZBP/ZK8yqdHasY=;
        b=FUvrfPY4OAo9wDP0DlLr011I4i3MyxiKiNPxi2431X8UvopzpznH6IrJW8r95GN0J1
         FZDNldh+SGs0plTDGgc3X2fCoEfJCEWfVTeIQyduSK3fOING8hlA2xsSTH2H8XO4lmZU
         sqL/q0YAt9mCtEGFMxQ/Bnrad2t5gtJQjIKkuSXfsoqH1tPSjnOpv3IKaNASv6vF4EIn
         ymTkZXLYK+kBX9JgvQYI3B6gOKjtdyNoe+tV8t/0BiZ6IbEM7CSMQ8183QEfnmYDk9yZ
         5G0uSr7Rk4DoNttfDZ8+KiTSP8AKTK/XzNlG9siXvAx4IrGbGHRpFeLd+IcNJ2uPC41N
         OZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720118214; x=1720723014;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FpkFfjiADJS0EPLlwf7BKxwjayUopZBP/ZK8yqdHasY=;
        b=fNRveeBdkXfNzgmKlWjL3pTzS9cLsYSIZkMz9TvRUWEOtAPn1YZvqX763rvnXmc8fh
         CRMCKobjDN64g3uZHDP0G3VPTyyOBmexMcFJW2WMns4yih178MYaeduw8HiKzIXG4aRP
         mizM/6dXO/WdU+CD0MHYwhf2OuoLdgVpLtuhnS5xnJNIxunNYsNUTUi2/AIW9Sx8/DjR
         hbCD7HHFjDVrRI2V7KoAmDjidTi91pNoQZnJLkc+n++enDJxfZnFDxvG+1NvgTlQ58J+
         FeUZ8akv03BvQyEGm4sbFp66cofAt0QMYwHKaPB4tl1GAh7C2h7rgS3FGiEc+SJuTC9Z
         jALg==
X-Forwarded-Encrypted: i=1; AJvYcCU8bCMfZ19UjXJN83Ubbya/BwWwo6Mb2DcJUTA1MWdQX7uh2dDP+SBggOilG4bO7xYjqXZrwpv7A7QkublNHpq63Q+tLUzTT1eIUynQ
X-Gm-Message-State: AOJu0Yxa3C6bt/cAiUcn/nRyGT9prcpErj1L7iaHNt2i9dcGrzvPbu91
	tLKijUoEjK+1n2I42Fx96E3NDLDJmHOne6XdkQ5KtazdNR1OMtoe
X-Google-Smtp-Source: AGHT+IHiXwZAu0cOxOthEcXTh6/WJTUfeUSNnFNQp/JPkIEBDAtNLGaseVXSBW8/Rts72j1TS7dk0g==
X-Received: by 2002:a05:600c:6a0a:b0:425:65b2:76b3 with SMTP id 5b1f17b1804b1-4264a3e7c28mr19267625e9.17.1720118213699;
        Thu, 04 Jul 2024 11:36:53 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-0b06-a203-2f25-a0f6.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:b06:a203:2f25:a0f6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a28333dsm33823075e9.40.2024.07.04.11.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 11:36:53 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH 0/2] pinctrl: Constify read-only struct regmap_config
Date: Thu, 04 Jul 2024 20:36:42 +0200
Message-Id: <20240704-pinctrl-const-regmap_config-v1-0-9d5570f0b9f3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALrrhmYC/x3MSwqAIBAA0KvErBuwr9FVIkJssoEyGSOC6O5Jy
 7d5D0QSpgh99oDQxZEPn1DkGdjVeEfIczKUqqyVVjUG9vaUDe3h44lCbjdhSljYYVe1ptOzJk0
 NpCEILXz/+zC+7wcYXQJpbQAAAA==
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720118212; l=763;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=2+vWKkD6NaDssBT+shr8RNi81lkdPvXcuXk+iWlx8No=;
 b=5IDbA41awAubEdhhKiqXOvRCEpEq9QB0YfRpzhjS0sV4xF6z1bD13sRLI0yuiqQgBXFnyK5Ar
 xiin2JX4DV7BXYxabVYQJVjbjUv1fS4lUz/jgS+ttvmF6dyK9DyAd3M
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

This series adds the const modifier to the remaining regmap_config
structs in the pinctrl subsystem that are effectively used as const
(i.e., only read after their declaration), but kept ad writtable data.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Javier Carrasco (2):
      pinctrl: ti-iodelay: Constify struct regmap_config
      pinctrl: realtek: Constify struct regmap_config

 drivers/pinctrl/realtek/pinctrl-rtd.c   | 2 +-
 drivers/pinctrl/ti/pinctrl-ti-iodelay.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240704-pinctrl-const-regmap_config-836a87d7e7e5

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


