Return-Path: <linux-gpio+bounces-26102-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 961CBB567F9
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Sep 2025 13:45:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05F36189A0FF
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Sep 2025 11:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CED5E248F58;
	Sun, 14 Sep 2025 11:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SgvYWpGq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A188B640
	for <linux-gpio@vger.kernel.org>; Sun, 14 Sep 2025 11:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757850304; cv=none; b=AhKPFvuogfXmhagMY0eRlJsKWzEuf/VF+OpqCYEbewVrHHEutN7Q4RBRRieJblV5V/UIB7HFH2JbKb46fJvUb3A4tqG1bebkLGPGPuanEnaNmTwEC+MWgf7z3z/qBNLUp3PMYdPnmdo/e6IbcDMdOk0ZGbrbi7sztygOlB/Zulo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757850304; c=relaxed/simple;
	bh=fIdw23kCtB7mdE2ObsS2whaNsMI65r/FonqsAsCDIf4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kM7c2Q8j05QxzBkUTTZ6GttH/xEEQf6gozGpvkpb8ch2ffO1WpkqmXPNWv0oLESY60avWRNSuPffaT7CqAJZgOk37Hh3do5/NwkS3FkoM/sP/9MBZdW6FQyKdqOBlFy7tCTV14JpDzPIuAS6yPhnIKVQ/ul0eW++UYgihBukshk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SgvYWpGq; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3e8123c07d7so572620f8f.0
        for <linux-gpio@vger.kernel.org>; Sun, 14 Sep 2025 04:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757850301; x=1758455101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zl9epDnVBDf5FGwQnol7WPxPj6t42uf2hUNcw7PBwX4=;
        b=SgvYWpGq43cB7t/JShNl/aLM3QH5u9bIB3pCoTaxzCbWGihOg5NeWk1sx5jlRRN2W/
         1hcEmxw8cjnqyQ82uXR5AJj8YkTgD4ASMagzuhe5BUsfgdxrIp9X15PGxBrGJnp5hfwU
         SJhad+5ot1AcgqYquRMtS/calSmiXLIiPxqxk8BCc1i1jBgXLO41azrxm3zhNLHGgt+f
         +m6snHE/CLDPCd7WBnG3bK/3Ur/bq3uLuXOnV6YxFHaQE3xuMTCkMFwcl571r5vYcTED
         8MwRQncNaxYJgNWro+1TzaoKmEQ1fVXgu8RMh9gmxp65xC4XpvaCN6gLrj91v3DPdxAI
         rhYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757850301; x=1758455101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zl9epDnVBDf5FGwQnol7WPxPj6t42uf2hUNcw7PBwX4=;
        b=dGKh/dE6L2txr52Vm62Z/RrPn4L7TChM1Aflv+N/DOVfiP401Lf/OsHTn3kHKn7z3q
         4JwwXrG/OuW4ZouVNO7+6cv4US4hxyZaWqShdFuC/jkd/9tHdrL1weY8f9aGGEBeOHir
         zO+KtHcW/STUxqq/5E9IzQMKpHtED/+9EiEC5TlR3TR2xSUt98oWRPFZZhcx5BUaqBgR
         FSVfD2d6Qu9RlmVFYnKmvfcMg182UxDnX/qjP0x90OzdQo0xuGcbybkcJnQz7x+VBKZH
         w/99hk0plMdQH2P1bhyR4EpT2gjq+EQu4KTJPRCQCfJ4tsCsEafZjAwqVPQl3ph7UOYQ
         jQ4w==
X-Forwarded-Encrypted: i=1; AJvYcCV0c+uuMKOPKQtOpjaARr6vE9tDgY1x110225W2BKVt1/bHgV/U6/ZKkgAC0qM0d1eAr3+ClHjLxAfo@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnqv+mA/tK9z+0GYeReEt4/UeaX8kA67iQBow70D7cwrkQOC/t
	P2Wno0BZQGZXcDtJwINGvLs+VGbTYWGwjEtlVNX0Bl122cWFF6F+hyTS
X-Gm-Gg: ASbGncs8iwWUaAeRm4lhBvDtZyCxI+1bpICTW9fXjF/SYQwwuP4+QB69E/2kHnq8ECh
	GKHhaZfPhS2EAY/xxmQCIc+PMCGaUlzGuoCZas+UqFc15YnoWBpFOSpDBowv9B2pD6AMJ9DUcbq
	6gHg506Q5CdCZm139ld4czlhXk2buFxS8vhm0yT4l6XodGd/zNpj1CT+3JGXNmQ2eNXSsRaw2os
	qFsk69GY5y1hWxq84leUwE0RTKGOEB79mcv9rXec/SK1BT0yIB2aJVj+segWSK26R2qAmUnfMX2
	asjh2jn/Ww2Bm4v5Tzb6ZKjUX+T0kIeY1uR79yjK/6xXbPR7SlzINxRSJqpuSH65/f/IWlaffgI
	bVepZkAC3Lw0IuzanFz0ViynxMK2Uyf6DV3u85yuOcgnChWVNi1EXSATilPBmFUcOsZuNRY+WAz
	0T/KE2j+0n
X-Google-Smtp-Source: AGHT+IEKZoR43PuG4u0ovxcf8LSqoSkXytpnNXieBus8x9zq/gDUlem4pul2S/1lpLAukbDJ5yAyag==
X-Received: by 2002:a5d:5f53:0:b0:3e2:a287:2cf2 with SMTP id ffacd0b85a97d-3e765a0915amr6836384f8f.23.1757850301352;
        Sun, 14 Sep 2025 04:45:01 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ea21a6e4basm1503252f8f.11.2025.09.14.04.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 04:45:00 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] pinctrl: samsung: add exynos8890 SoC pinctrl
Date: Sun, 14 Sep 2025 14:44:54 +0300
Message-ID: <20250914114457.2610013-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey folks,

This patchset adds pinctrl support for the exynos8890 SoC.

Best regards,
Ivaylo

Ivaylo Ivanov (3):
  dt-bindings: pinctrl: samsung: add exynos8890 compatible
  dt-bindings: pinctrl: samsung: add exynos8890-wakeup-eint compatible
  pinctrl: samsung: add exynos8890 SoC pinctrl configuration

 .../samsung,pinctrl-wakeup-interrupt.yaml     |   1 +
 .../bindings/pinctrl/samsung,pinctrl.yaml     |   5 +-
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 157 ++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
 5 files changed, 165 insertions(+), 1 deletion(-)

-- 
2.43.0


