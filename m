Return-Path: <linux-gpio+bounces-14460-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B19C8A00A5D
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 15:18:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F4EA162E76
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 14:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B75091FA27F;
	Fri,  3 Jan 2025 14:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="swihbgpk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAC71FA244
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jan 2025 14:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735913925; cv=none; b=gI39pfkCXXU/gmTSc+gthriRvEUlg9PWomMUOfAzguxTR8mpy2yVfUiSBrBhmn4SjM1E8iG8BjmtamXqnBgdV1NqAOkYwvUKBvKWsrTKUrwC3WC5K8wE8wVYo/jY4kgsBQLX6/YMBUqzDZHR+PvxW9B+lRzfcEZ9/f/5Gazlffk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735913925; c=relaxed/simple;
	bh=IFN50eb/PV8gCgaBNQo9JkrWHf0H2C6cH1IGBkef178=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WrxEhr53u6SyU0zS/FgcGBJWSUSPL2tTC45kBFy1ftOQ/b9fjIRZYliupXrn1s/4M3TG7YLnsADb554EULYqGJF1Xl8RWAmm8Ua6lxQNZ8fgoU9Nojk9Q3ULkSEUApHp8lubESQeVHsxsBceKQ4HBabnAz1YhBbDWn/zZdVKMJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=swihbgpk; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DAC1140F32
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jan 2025 14:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1735913919;
	bh=vowSDbTio+bvKwSw6EcFC7rumCpf4mOZl2/5zkaRDg8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=swihbgpknUu9b9vM54ZQZYoansRVXS8ufxt2E9en3cn8/DNeXBLHa9B7MABT+a7JL
	 3ZPbOQdE0USuDfczVJ3h96B/cY7cGTOod9qgwLqdCvYjQVJ0G1k6EbyclPPc9XIbxd
	 9alXe1G1cMJdXZdHdpVuDdhbYsHNWnWZlQ6HpGfB8Ii7TQjzIxMntbLoIwfH9LnlsZ
	 5WduDItO9wHg73I+/iwYTZRLhHkMub6NfIerj50rZBatmUjAn1l1iDvM3LpjZJ4Q4y
	 le3JYdrDB6nao105d4qiZHCPDVqLradO7R0PtX9zr5fdPU7GXeDbXzFWH6gAZg5C8N
	 vJfS0hVKOAf4w==
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ee9f66cb12so17432905a91.1
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jan 2025 06:18:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735913918; x=1736518718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vowSDbTio+bvKwSw6EcFC7rumCpf4mOZl2/5zkaRDg8=;
        b=MVImNERG1KwXMfUpNBj+qIyDfMw2gHPrqN3IGH2ArOK5qfK+rF8Wwtk5EKBz8H5NEl
         r5/wFcnQE2c0d4fVQCitKWXvI2BaWfBqGf3SVDYpMvdSpGD48uLwwbmv29VIIVoTsO3c
         gunYOESmbthRsKjQH2MGn+nSVsflxZcWPK5MXMX7Jk3pW0FfZwRpSueFJN0WDcsse3Ha
         w64weahQuQBzwFse3LwXcFqhH8ArorrfFAW4J94RfHtGS/pASeTJLuqvD1RpPHj1Efdm
         KJ0F6htWFlCJHd/JyDZOdM6dVgQkzRxReOU4D8pujYoGySlIApUhaRBln08Al1Kzi++a
         69yg==
X-Gm-Message-State: AOJu0YwHtAEkLch2fE5hsxoBA9JfeKt3WWn5ebvJ40cFXzDinUZ14iUe
	X6DG8/7zMYrkfjKTk0Gs7wHbSy8FRvcRSdZIFMJZysvYe2qeCvd9UMGWrKhIdhbLlpQqRh38uvt
	Mw9xz5j90skK84C5TAlm40GIgn+1rq0TnAg/UN9YU44jYYETXfsmD5wcHdK3LdF2bIFetXnZf5j
	YxxTklDOI=
X-Gm-Gg: ASbGncu27bvQdn3pusMcsjcN8pnF4FtwyZ0AGCGpkqebcykaHP4dpQh8jmPwf3crQci
	V//B02/a3MOV2HznRZ+cWkpT7KuKyNbzyP2BBzHarTbFipRUNUZWyqsXK2eeQpkH3uvuscJ5LDW
	gsSdnejH4Is0L+gbBwxi0pjDr2S2C3n5/aT/eugVR21KKMPh3ajyhW4rTgAas2SlJ3OqDfgkM75
	WL7QMtKu1q9BYy1ON0EuM7wgUliWJ8WHDcngX5dOlLDtIUMOktZuZRB2w==
X-Received: by 2002:a05:6a21:3a85:b0:1e1:e2d9:44d9 with SMTP id adf61e73a8af0-1e5e049f6d8mr66831258637.27.1735913918263;
        Fri, 03 Jan 2025 06:18:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGm7N7Yyx/G/VJ5CMhT/uAyi9BGtmjzulR9p6eqGE4xa2YlxffOyvVJbbVKj+IuP9xHqXQFlg==
X-Received: by 2002:a05:6a21:3a85:b0:1e1:e2d9:44d9 with SMTP id adf61e73a8af0-1e5e049f6d8mr66831235637.27.1735913917971;
        Fri, 03 Jan 2025 06:18:37 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:cb9e:69af:fb16:54f4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8fd7b0sm15502908b3a.139.2025.01.03.06.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 06:18:37 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] gpio: sim, virtuser: minor usability enhancements
Date: Fri,  3 Jan 2025 23:18:25 +0900
Message-ID: <20250103141829.430662-1-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is just a minor usability enhancement proposal and some bug fixes for
gpio-virtuser and gpio-sim.

Koichiro Den (4):
  gpio: virtuser: fix missing lookup table cleanups
  gpio: virtuser: fix handling of multiple conn_ids in lookup table
  gpio: virtuser: lock up configfs that an instantiated device depends on
  gpio: sim: lock up configfs that an instantiated device depends on

 drivers/gpio/gpio-sim.c      | 48 ++++++++++++++++---
 drivers/gpio/gpio-virtuser.c | 91 +++++++++++++++++++++++++++---------
 2 files changed, 110 insertions(+), 29 deletions(-)

---
v2->v3:
- Incorporated feedback from Bartosz:
  * introduced gpio_virtuser_remove_lookup_table() as the counterpart to
    the existing gpio_virtuser_make_lookup_table()
- Fixed a memory leak that was spotted during the revision.

v1->v2:
- Incorporated feedback from Bartosz:
  * added more gpiod_remove_lookup_table() calls where appropriate.
  * assigned subsys at declaration.
- Added missing kfree(dev->lookup_table).
- Fixed typos in commit messages.

v2: https://lore.kernel.org/all/20250103030402.81954-1-koichiro.den@canonical.com/
v1: https://lore.kernel.org/all/20241224060819.1492472-1-koichiro.den@canonical.com/

-- 
2.43.0


