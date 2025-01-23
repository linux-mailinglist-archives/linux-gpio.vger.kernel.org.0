Return-Path: <linux-gpio+bounces-15031-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC59A1A19A
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jan 2025 11:11:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 368497A4299
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jan 2025 10:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A11DF20DD41;
	Thu, 23 Jan 2025 10:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="231ehXwD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7FF20D4E6
	for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2025 10:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737627091; cv=none; b=Nie5Rj+jdip1RAexBk112MHhLLjo+0VX0LQNFo84YmtXyWhUWW8nYOyqw3GQMtU1EC6Ci4CLtlIf07D0V3udrBsYiU0b0sbyumSZUYNDYn1c/3b6ECi1QgjcuAuN6TkxzZrQJ5m2+eTHxmbQ1jE33FT3jKbv5N1Gu2Otg/ReFxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737627091; c=relaxed/simple;
	bh=0t2qfd3GnssXmR2y8LW0cKG7GonvDxo8t2BPTONaO9o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PGF5o7318+wWrqNIll/2VyuVxFra/0AX8TjIg9sJ/0ldKwKrtgJ4vR9GHPDwV6Bu6WKtvgUJRQub805EvVDvAuInur02ylBy38M4t3rAP3qBlmc/MDGKijwc0V+fBtPvUa+LhPh1bq04EsGgsgLYN0qtLI0cVFG4VZ6y0DltqyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=231ehXwD; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-aa68b513abcso165600866b.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2025 02:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737627087; x=1738231887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6AkogUzy8jf2hIq992KtJA1R6WCK3IssbvI/CIUiwCk=;
        b=231ehXwD1nrTI16Hm7tBz6dt9ycpB94VjCBTV/9Nb/sEHsdW2k2OtXJfDEjKjdClTQ
         xHWIjkVPo0uZEI/mdEyKtghx+Ce5A7Q9VrQt5+kYLEsnQon7yOOXmOghLDHtrOmgx84+
         LLO/0nwCKj/gYW1F9I2M48NG0jIZzz+P8izK1eNnuGzPZPXVHpgrgWmRHmZTQhzWqIoB
         Xk0MkZTDcJaJfi2TBNFuCmBQ9wndMNABKPWv530P3HfaygczX9L/pkJi1RPfn/3dIA3I
         CGvvYG6eeVAmZkitmGz2lZ4SPTmKsElxWQQClzcrkVPPe6Zc+/v+Mo26S9C4e1wgEE0V
         Ojtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737627087; x=1738231887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6AkogUzy8jf2hIq992KtJA1R6WCK3IssbvI/CIUiwCk=;
        b=bHSvhvY/OWDHM7gm6Qd5mlf8gIX4/U4IDpybVFw+JiyoomA+pA3rzn1imyXPtIKtLW
         b2PXtRuh6tIOKUjiqwLjn/R8mKqLN+RQDlKVrtmgy3JagQKbo0SmbHS+G35UweR/Sr59
         AfWV//HSWEThvhXnEe0gO2ox5qeZ+Ilm9gE90Z4vB1KCmrGq8aWw6Ewp15Lq/4yi96EZ
         kUNO5utdyZkttkgtsHtO28qABBzIsPM+9dbxOWIUB4fCgf3Nvzkb20OIqTYAWLrujeQ8
         Gvrir7UELRQrf1m48A0O3foNc5aH1tCs192IYZIJ0UFkKJSYttVtBmt9W3nP7HD6btu/
         wv3A==
X-Forwarded-Encrypted: i=1; AJvYcCWuDKzw+KQ3pmT010un5eahCJVpjMM5//GmWmxDdMiwm/h7QA08ELU183wSNtD2M7n+eFiLRDFiq5zE@vger.kernel.org
X-Gm-Message-State: AOJu0YydwBOPiMmu2HE1CpiZfd67pVgfrTpLLdWAvv2XK1tNIh6DYiaA
	Wj7ZveIS8LKIZIZ7Zwu7pucvhW0SvbbWwILlyTUWfYd13QQSyUR4NtMj21chb8M=
X-Gm-Gg: ASbGncuWPkx+y1ycOYSFrFrJs0zIHFoJ+qKkNFbkYduSzuz0atsqBwsznPsFiQqh3UQ
	PdXWJGUcUJ0hFVOCLb+173DIfOO2hBpJBKTrcmnScRzUwjOJvEEA+rH/voVtfCDhdNKc7n1gQgJ
	3z2U2dgI8rbq0Lf9p9uPtoJ60IglsUrbV7O6p0l5JAurwcL8/uRVISPL0mELvQbwodyXvSaRkBC
	7GpARwOfHmiZVU2srIsa5DPgwaXK0Jva85A0EGri4IAMAJ9ve0HInk+JWu+8krej4Wu9DYwRJJ8
	L9W6g2tu8X/0DxBm0dEaA3X5pcBk47xJTw4ABiTLeKuWqN8=
X-Google-Smtp-Source: AGHT+IG9zdVilHknM+0G6YXDighy5AbQ0VbjqNQ6JTiB66RdlK8I0yBhaHfW/+EquzwqjcR1Z+eYVQ==
X-Received: by 2002:a17:907:9726:b0:aab:f11f:f360 with SMTP id a640c23a62f3a-ab38b0b919fmr2405778566b.2.1737627086471;
        Thu, 23 Jan 2025 02:11:26 -0800 (PST)
Received: from localhost (p200300f65f018b0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f01:8b04::1b9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab60d690232sm465042966b.37.2025.01.23.02.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 02:11:26 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-pwm@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 0/2] pwm: lpss: module namespace fixes
Date: Thu, 23 Jan 2025 11:11:09 +0100
Message-ID: <20250123101110.339337-4-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1013; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=0t2qfd3GnssXmR2y8LW0cKG7GonvDxo8t2BPTONaO9o=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnkhW+EWT/d9tAECnBYMsK/F6iuh/aSQWrX2qOu HE8XJk4qM6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ5IVvgAKCRCPgPtYfRL+ TrtwB/wMftkBHCMhEbdpGMmqUw3A8iol7rVdpIw048RDkshdp1pSwvdqW+VfoYJoBnq3AutVkN/ GaVl0al9X8ZTVqpsc7ZrVupNrQI5c51VubEeZH1snRTTWBKxLQAsRCqTD4v4WlqpVB7xBEIAqYH JqUVqzj+I9JHKbuofVsAFhvUd/5GY9IFgyhR2cigOuIrZ5YiqmgoyXly3wuY6RrWctcNKzCX6Iu nNGHLDhnxzpfoqt1UjOWppUoPIl+Lz9ZkNXBYCu/FRp8/bHoe+7opMmsbjmC3Cjo4aFdIvmp1QF lg5pGKiOg33nQppszYp167bJKz03GjoAMDJFzTxVWwcIVI0G
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

in (implicit) v1[1] I suggested to move the MODULE_IMPORT_NS magic into
include/linux/platform_data/x86/pwm-lpss.h. While I still consider that
a good idea I was overruled and so here comes the variant with the
explicit MODULE_IMPORT_NS in each module that makes use of the
respective symbols.

I don't have a fixed merge plan for this series (assuming it gets the
expected Acks). Either way (both via pwm, both via pinctrl or the
pinctrl patch first and the pwm one in the next cycle) is fine for me.

Best regards
Uwe

[1] https://lore.kernel.org/linux-pwm/cover.1733245406.git.ukleinek@kernel.org

Uwe Kleine-König (2):
  pinctrl: intel: Import namespace for pwm_lpss function
  pwm: lpss: Actually use a module namespace by defining the namespace
    earlier

 drivers/pinctrl/intel/pinctrl-intel.c | 3 +++
 drivers/pwm/pwm-lpss.c                | 4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)

base-commit: 232f121837ad8b1c21cc80f2c8842a4090c5a2a0
-- 
2.47.1

