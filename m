Return-Path: <linux-gpio+bounces-20614-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CF2AC5CD9
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 00:21:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE67D3ABF3A
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 22:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C335215F42;
	Tue, 27 May 2025 22:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YekCHHPj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0037139D0A;
	Tue, 27 May 2025 22:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748384469; cv=none; b=PF6hYVY+YhEgtpldFhRU1ogIwq2fEgXvEHNPqwmqb2YO7V/mj+cQ/7HLfuJjXPkSoLYXUNYxKRZ5ddhKkEn6ZI0rsLBsdO4jNA0MbByBEreEZGNs0HzbN/6RVlTrkMrOu5rl7Xr0ASxoSJPSKEH+oQjWioHCNNaCC/qp5cfz23o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748384469; c=relaxed/simple;
	bh=pRHpfU+iErScwmho/6sCiZoQBXbVnuz2OWGlnIWI8fA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o3y+nXJk6mcOtP7iW1LKKGdlmpi3GL0Fy9wqk2txwlOx7Ko7eFMSJYQCo9fXcebcSh0Gnrn1u7V3A36T357nOBYlveySDDVUebhAvLsUKbKVqxrPe3eA319pU35/b4CnLYL14lfvt6vl7op6xZfNWmWZlOBelksiiPxzHx5GzCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YekCHHPj; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so51033475e9.2;
        Tue, 27 May 2025 15:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748384466; x=1748989266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7XytmjT0QYoYbr62wTzvh2jLYboBuJySkJ1IHPxAlMk=;
        b=YekCHHPjA3ayuO/5LAvuBrzLWusYcCC+qsXrzPhIjChGxO4jnmhaaHmzIINQaajleA
         w9aGftbK+xVskbMKHB0JNB+pqro86MIKZ/wvzSnCxQA96viQhmTK+V2ObNZ1s97BgxAL
         xG+MGBdXuIufhoK9EnZOxkFOhPaPLkQTJd9Xs/3PlFmwfej32r5v3sZBRu04BWgwAT6J
         7ymqtjoOD1ld0uXIvV9yeYiG2hP59hvKdyPxYBKWw9t7aMGbHh85pV7MBqiZ4SuBY7c3
         NyN4C1PnTneKBqG8d/5ROHoZyfMkm/lj0XZTQFLsf/SgT+pV1I+yYdmqAYL1scuREHZr
         EFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748384466; x=1748989266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7XytmjT0QYoYbr62wTzvh2jLYboBuJySkJ1IHPxAlMk=;
        b=KzxfROLv8pM7PBWVTebKLq0CoHL1wfx7kmQblvfSZ6xIE75UE9O7Fq6agRGLe/5cxO
         j2q1633V925yFktCgvmPCZqgBRF7zdT5O8XMPPVGcWj8ShIywNXtSHdmBQ7ndq94VsMA
         PMhaw2pFMeypMb5NM/FlBoKveO8Tx0ohxkTFid48/Gxx0U2SHmQTjeACl15BCcUVLPIT
         67dvAi6RvBXDeNaQTUGUMjTVg9KatD1N4KeoSmX1NjJcgFSyc0GJL2h7d4IroBEqU2yb
         pHALhRw3b9tHzlsflzifYW8tqQHOJc7+Dl1S1FCnRuhCjVq2/HZAXc8XVK4yYW3btU00
         NuCg==
X-Forwarded-Encrypted: i=1; AJvYcCW/es0zN8CYyqfpQpauwqFKQkc1vrSwGVoxqP5vRRpKRlHOIqCF4UjsDPnm5XUNZ26J9JRhddqUPug6@vger.kernel.org, AJvYcCWi5PGwdRQnYg+qClifqIRezDfFMjjC77ikKUW60+EPoFXkTLjWkQXDtmd1+PbXyS0MrPyo9mxlpfiNJQ==@vger.kernel.org, AJvYcCWzWt0D1vkb9C6crXBtuL5W/i9zOUDaqlsFjcrkA3mQ55+jdLRQ4DEPRCxN9agzpGrSeEHZajqGLFAupT47@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4EE8DkTJ/KSYqk5lhU0TfJtGn9/g0HGALLsYVP2J74wx95K5z
	mDk2EKwHAUwsBLe4JhlKgIg5eNpt9v0w42yZatyWOilKDBqwv1KLtiss
X-Gm-Gg: ASbGnctCaK4rubRTWAmvewurEwnXqkKdRWVcBmtwD2p9buuWnDPqbIVyvuSxoQwAFFq
	xxjtSl31TrfKdqiV3HhFvM2bRPJjRhOgjm6bxRnfx25s9yNd4Z68pQoQ/TTm85pXUPUZVbLAWaF
	5pvmT9neCyU0vdID8EyvPw7yxfoJf6C73pGFT9e2r1aUDnaIA6ik/MQNjFKb74hwwTQ7awhjPwl
	FGDBIjLmQuciDAakB0KmDHBYTOXtJXy22//J58FTRcdcP0s2MuP2Rj7DqcI5ReU4o+ohQuWfSaV
	rKh3jj5p8WbM1rXXvIGZNXQNKLlzAZptsxXsaNvVtC/6T9Y7Dx5s8gb1ALEkb9RsnDWUZlpKg1q
	5fEogb3ib+wnZ0zJVgXbdWbxb2muupKA=
X-Google-Smtp-Source: AGHT+IFdKWU8GcSeLjuTkimcHYGLyMLF9mUe1qrsMqtPgGlIFwLTef1kQexYipsKO1mCIPUpGPKSqA==
X-Received: by 2002:a05:600c:1e02:b0:443:48:66d2 with SMTP id 5b1f17b1804b1-44c91dd0981mr170619255e9.16.1748384465884;
        Tue, 27 May 2025 15:21:05 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a4e8bc377asm233366f8f.72.2025.05.27.15.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 15:21:05 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 0/6] pinctrl: Add Airoha AN7583 support
Date: Wed, 28 May 2025 00:20:32 +0200
Message-ID: <20250527222040.32000-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series introduce support for Airoha AN7583 pinctrl
support.

Most of the changes are generalization and cleanup of the Airoha
pinctrl driver. These are needed as all the array in the inner
function were hardcoded to EN7581 and didn't reference stuff
from the priv groups.

Everything is changed to match_data and priv struct so
adding AN7583 is just a matter of adding the structs.

Also the schema is generalized where needed to address
for the small difference between AN7583 and EN7581.

While converting it, it was also found an additional copy-paste
error for the PHY LEDs pins.

Christian Marangi (6):
  pinctrl: airoha: fix wrong PHY LED mux value for LED1 GPIO46
  pinctrl: mediatek: airoha: generalize pins/group/function/confs
    handling
  pinctrl: airoha: convert PHY LED GPIO to macro
  pinctrl: airoha: convert PWM GPIO to macro
  dt-bindings: pinctrl: airoha: Document AN7583 Pin Controller
  pinctrl: airoha: add support for Airoha AN7583 PINs

 .../pinctrl/airoha,en7581-pinctrl.yaml        |  297 +-
 drivers/pinctrl/mediatek/pinctrl-airoha.c     | 2497 +++++++++--------
 2 files changed, 1489 insertions(+), 1305 deletions(-)

-- 
2.48.1


