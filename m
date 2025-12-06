Return-Path: <linux-gpio+bounces-29340-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C9962CAAC32
	for <lists+linux-gpio@lfdr.de>; Sat, 06 Dec 2025 19:34:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B9CC306562D
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Dec 2025 18:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A04192D0C9C;
	Sat,  6 Dec 2025 18:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MOOKOjGf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D521626B955
	for <linux-gpio@vger.kernel.org>; Sat,  6 Dec 2025 18:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765046083; cv=none; b=Q0aE2gRpLv2lRym+n0IKN6shhbkboParM2evAej5NXfedTAqEGJnEIMTpa2DdIFXSCc0jdIEO6XLalOyTPkkSF/QINmxDOrQvQe11Q3OBpEI7LctYu1qhf11ixx7Adjs7ibKVLRDnUqGfxgQK4Pe+/DZd1O1J10EgE7nY0n42Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765046083; c=relaxed/simple;
	bh=kA4hAN1sHiKFKheGE16X/PUth/xQ10ETqni3kNgL7bE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j81mwwZYaVWz5Q0ePkvyYXi6rKQMNIFaLlsdz3wt/FhYLO83Z+An+jL5oiXyG31K4r8EI/sm5NLQ2Vh8Btu2YJViOf2Y1zWNqZk0bRfHDsqSfc12mpJG4ePN8J68jYFCuuAfeuV1ATfmDrw5GR6kgIWjVsZWFR2KwKFYrttlUy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MOOKOjGf; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-37a3a4d3d53so29013081fa.3
        for <linux-gpio@vger.kernel.org>; Sat, 06 Dec 2025 10:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765046080; x=1765650880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YvEboDLvR2gzipynR26Tv9n7iFvwIWdMUwKccQoCWtg=;
        b=MOOKOjGfNr3345ovEuZTT604fL2AdLF5TigrThXrgl3KCwX7nC8Rw/ALDiJylQXD4U
         Zw3o/fV206a55eCK8FkJG3TtUjWG3Uyr99bQLX+5Q5lB7lXIGXcrtO18OFzguVN9aX+p
         nHlwzbpFh18XnBKcDvai+jOjLSfPocGuHwypPrdBwI57c1cNkza+BzNpco3Z2ZKeWSEZ
         4ZqsN8S1EXiOw1jzjXWo+GhLQYw2t+OoKZghsShvgQusonGco1g3A3iA8TicAUtMo60F
         GP4PYXq3ovhi6A76uwhJO5B+C/xiXD6FQJYatuToKOZoKuJz4rx/SritkBl8czWB1KFb
         xeUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765046080; x=1765650880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YvEboDLvR2gzipynR26Tv9n7iFvwIWdMUwKccQoCWtg=;
        b=oyZBX5YkhmvONoTolnt0tH+rPhQVcbmYa/M2qRgl5/2giC5t7ocI4/OtutoXgIQkzT
         GnbphpDVAeHvf1o5vF7IPpjjUehJ8G0c/ZQt3UctuQWESUMBQh4cjGv4JBGuGhO9Q/uT
         tA+PwDl2hNTy+M1/VRkBAUr2MtU0hP/HtZb6KTfBE3eYX9xANG2isT+fUlW1pLnM9gYn
         LN+Hdn40B72qmksq6aX0CtXnqE7lbv5Nh+ML8L2MskL5vIXY9QJUy875t+YeSvj4RdBD
         In6v18ewwhoqJvKsrF/lLdUyukpFDYNEi+Z/af04qBWCrDAwD0kw1NJFUBLJ6xvfvsYV
         DOMg==
X-Forwarded-Encrypted: i=1; AJvYcCVCGFAZ6gnOX+VC/AcnjtGOX0WmTD1YTT0jjSTv7w+AuzjkpD+Q/wwTuVrwh1XpVXKijPviTUQazxct@vger.kernel.org
X-Gm-Message-State: AOJu0YzMMdYfRXalpwQXr2w0eNIb2702CvY0qwuVUfYJaJY6y0lFBVqj
	u8sOwBT9oV89+U40gLdE/7GNixcuCdXqV+t3WYKDFRKWyHE+QwNVGf72nbXuiH0L
X-Gm-Gg: ASbGncuBSFMKLTVufTCTl/BNJBfgLytgtdZTgCe6giD9ZpqArcIGUz6fY4KMSM6kG4+
	8RqhoAEqdRlr8RCPey/00psSKtJgVKNQwt2KyEHKhpSZ+GqDdBVdS95wa6mLM223P3bR4YvKgJy
	9Chhf6tEwQficIuJHmfmaMFq5cVfK6mJGwHM2fZt5TFQEN2Q/GqR+t7gR4oCbNkqUC8e9v+ImqZ
	ckknV7BcieqgwfJbXlyG+3pRoYCjvTXwHva1bupaqyVAE6UQELOwKTYsAxKQysi91CFAOed5Zb7
	gknO1GE0R9lydPwAI1bjQBnGFEoVzgNFLs+K2NVsmrndfxYo8nZ9/CIci3RSalF+vqy1izwXNPD
	ezFWVjTH1GqUTb50nGb4b5aynV20jYBZpF818pU7JJXQUT4U5NCxrK/W2aVUZ4XBgmgI072hTFE
	R++FZ7lces
X-Google-Smtp-Source: AGHT+IG33E69bsxDqP4nGkx72DrGfYjPjJ2GkqS3YfyfrVavZ4K3jW7roYUUcqQB8woGw6GG0Vqd+A==
X-Received: by 2002:a05:651c:1546:b0:378:d5dc:17c2 with SMTP id 38308e7fff4ca-37ed1fb8099mr9884041fa.11.1765046079701;
        Sat, 06 Dec 2025 10:34:39 -0800 (PST)
Received: from localhost ([194.190.17.114])
        by smtp.gmail.com with UTF8SMTPSA id 38308e7fff4ca-37e7060f2d4sm25155801fa.40.2025.12.06.10.34.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 10:34:39 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: regressions@lists.linux.dev,
	Dell.Client.Kernel@dell.com,
	Mario Limonciello <superm1@kernel.org>,
	patches@lists.linux.dev
Subject: [PATCH v2 0/1] gpiolib: acpi: Add quirk for Dell Precision 7780
Date: Sat,  6 Dec 2025 18:04:12 +0000
Message-ID: <20251206180414.3183334-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v1: https://lore.kernel.org/linux-patches/20251205230724.2374682-1-safinaskar@gmail.com/

v1 -> v2 changes: changed tags

Askar Safin (1):
  gpiolib: acpi: Add quirk for Dell Precision 7780

 drivers/gpio/gpiolib-acpi-quirks.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)


base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449 (v6.18)
-- 
2.47.3


