Return-Path: <linux-gpio+bounces-14447-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABF5A002F5
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 04:04:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8331A3A3752
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 03:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91F6317C225;
	Fri,  3 Jan 2025 03:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="C2tvAeKD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229413208
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jan 2025 03:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735873455; cv=none; b=eD/jihmhKzrAQpZF1IQIuAqzJw2csMhOb9Dir7OuSOT5qZ/gkrkvXAnsh82D4DSQ25bLr+R8BXRff+MjgdByHDRwY0Hbv+uBguiSAw6bVp+VWdFasHTYrpI3EJESikBL7mapRO20AW/n5psuTD0VOpZXCKs91O5ROu+p/Kx338o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735873455; c=relaxed/simple;
	bh=SF+CmgCoKAaOaJ0XKNaymm2RxfW1M2DL4+Cwm0+i9iA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ewDfrpWt13x5N4JmD5ufN5AbWBXMpN4H2D19CVCSZGwdMfz0kODALNgtR/Ieo4d7bLeNlZk9TAkv0Jvon58vo+JvdVpJ48d3hzKmjibSrt46306FxefGTcWazhZpVSo7A4KnRQxJiA3ljkHwgf/RsMJB8flg6gE17Q1Jlc4FZDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=C2tvAeKD; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5CA2340FA6
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jan 2025 03:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1735873451;
	bh=JA407SJXbwxifXW0cMzBQ273XaDtaMD5n4EdqEFt3Vw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=C2tvAeKDYACFNQ5YXe5tngQ8++wX+za8d/f+5DG1Nc46E0/u8rls02ug+JTFxXFkV
	 FIOlDp3bqSSfBHsUBKLr3yQlR+8My6+0WY+Obn5zcBHQeM/yE88kj24A/KykBZMH+A
	 pRL0s1nXwG4vBwQyMXsUwYynq/Xo81T+5tbgOC2oJiaJ2NKNs84A7OXXgVvTzRD5ip
	 iEKr70YAb7IWda7kWO87vtv+Q7jt6KJlowYrBzXD8qgOgGjx0SLI6THuTbI42+79Q0
	 69iNDz/7Vp5fXA5zPVe8WyjGX5nX9nGtnbiRiezYo5VLF7O5VWBi6LZFdIcWEumtr3
	 rHU8yPZkrm6UQ==
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-21648c8601cso138526455ad.2
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jan 2025 19:04:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735873449; x=1736478249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JA407SJXbwxifXW0cMzBQ273XaDtaMD5n4EdqEFt3Vw=;
        b=tOU80YJQID/iF/E/hR2dhNXIx6HJjYprVsL/OA4aw6blT2YWrdqkVK58Y5rTgfYEFf
         E25TolZOATWh9XsmoaieqSE2jRXdvZfYj8YIFNNRJwDYstt4+hSgI8KOp/mbf4a8XIaH
         WXrPkG8v3Qkbri9C0VQggb0j9Q7Nmx1zSOK04wfOKN8oey4fLmRNA9idfeliW4OESisA
         JBpzktLq2FNPP6bzYRVhucKBM36o/iA9FTuf4SE1TZPNlItf+4XM6MjQVobTESVIkwDI
         CirM8CSQ2UQSZZjWDLIxL7q2D6KgNEsdQSNYrPMfMenXdtVp8zLed74tBM2YW/8Sskpw
         BiAA==
X-Gm-Message-State: AOJu0YzDzwdr0WLqJs2agzuTkq/mTsJas3NnGHvRsJVlNULFDnTKnfZx
	sB1aQYo1+HKmEPBjGsxVMQnaecMN79sOcPZXpKpdAVRmdfTYvS2mmTF2+meURcJXhxN9GR+rJiu
	DUhQsU9GAqF9DY2lbTw1b0F6gEPDvVypPoHTyWb69E7adSPZLxoYI9ZxX1I6dUXsG1U9HZEQAfS
	j5swVKJR8=
X-Gm-Gg: ASbGncu1RR1d4DfG3dZCWkBwzdvd5BXK4C1Ymv+jvtrMx6+R026j4I2H4aNOwOscs54
	/f+UjILB4Haax5I9OThAFP8XmtuZYITfQW06brFsL9HoJr6+T/b0Igv1C9lr59lVDRrHU2DdGdK
	gFuYnUs39nLanY6wqqZcsv6dWAGJ4hbP3ZJ3xXeSPtII1jiDedNoVY4HQ3rqtcJ1xtRvm3TCe0y
	EALZq46Ch+xxAZ3ZWLDMvrZ6vLr7csQxv3yGFdnFCaZ8sR1luynzID1DQ==
X-Received: by 2002:a17:902:ce86:b0:216:2f7f:ff69 with SMTP id d9443c01a7336-219e6e894c8mr567781305ad.5.1735873449629;
        Thu, 02 Jan 2025 19:04:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGg9ZwmZiyUVNqps0kxR+ovy2yPFMQWXGj321YlPTQwqNDQspuHHq4E0TwyymkWFqgK2bxM1w==
X-Received: by 2002:a17:902:ce86:b0:216:2f7f:ff69 with SMTP id d9443c01a7336-219e6e894c8mr567781095ad.5.1735873449299;
        Thu, 02 Jan 2025 19:04:09 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:cb9e:69af:fb16:54f4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc964e92sm234468215ad.18.2025.01.02.19.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 19:04:09 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] gpio: sim, virtuser: minor usability enhancements
Date: Fri,  3 Jan 2025 12:03:58 +0900
Message-ID: <20250103030402.81954-1-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is just a minor usability enhancement proposal for gpio-virtuser and
gpio-sim.

Koichiro Den (4):
  gpio: virtuser: fix missing lookup table cleanups
  gpio: virtuser: fix handling of multiple conn_ids in lookup table
  gpio: virtuser: lock up configfs that an instantiated device depends on
  gpio: sim: lock up configfs that an instantiated device depends on

 drivers/gpio/gpio-sim.c      | 48 ++++++++++++++++++----
 drivers/gpio/gpio-virtuser.c | 80 +++++++++++++++++++++++++++---------
 2 files changed, 101 insertions(+), 27 deletions(-)

---
v1->v2:
- Incorporated feedback from Bartosz:
  * added more gpiod_remove_lookup_table() calls where appropriate.
  * assigned subsys at declaration.
- Added missing kfree(dev->lookup_table).
- Fixed typos in commit messages.

v1: https://lore.kernel.org/all/20241224060819.1492472-1-koichiro.den@canonical.com/

-- 
2.43.0


