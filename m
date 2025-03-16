Return-Path: <linux-gpio+bounces-17657-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88294A63618
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Mar 2025 15:31:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B76CA3AEA73
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Mar 2025 14:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 360B31A8F60;
	Sun, 16 Mar 2025 14:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L4G8Ex1f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3520238DD1
	for <linux-gpio@vger.kernel.org>; Sun, 16 Mar 2025 14:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742135476; cv=none; b=dBZ5XE37VqxrGAZ0oP1hH95sdQmux76Q1h9iElveDPUo1QeFv+vIdMFv05fp0+Xcw+jhWPtrfdjIw7jffPcqx/mL+5KF+bjvAKYTXtGT9f0KEzkUbEwv2d9cZU7OkZGMrmT7xEiWORD7FHak1nGnmd8FstxpE+taHAJ3Pd9S3x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742135476; c=relaxed/simple;
	bh=ULlCJjdLr1vKJqaHlZQyZo7s+9QYPUfaXtxEtSc7JEg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pHlkYWbbVVib50kToUedWO8VsNZfbz39/34/LMJzmqGSZ+uzdoJH043014qKT2aVZn4KmtIaZ/pzyGuNTTauYCtKpxNmSW3M8uppjndMR7o6YrUiMtf8NZ6qLCBBRN9T24WNu+4kYv8py+R+NJ65iq4tZpbgqi0T/OBH4mdHM1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L4G8Ex1f; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43d0953d3e1so1406175e9.2
        for <linux-gpio@vger.kernel.org>; Sun, 16 Mar 2025 07:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742135472; x=1742740272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tc/KJH+qtYUavPHzbi/9sG/C7pjG+2ryVkaTYFLi/Fs=;
        b=L4G8Ex1fQdQOcTZb3DJWMHWs84cUtDG7R3Hh58e6q1bp0DDRZdS0+jUv6utc5UAwPp
         76uhuzStouz0Yyp/Ql7bhEKQVZaLl8m9Afr4GucZNYfxzOjCwKdEIxO1xUdD+kTE3d9p
         RvT/IRqjRvmBCk+jUd8aAf2/Xmi613X+8gSyWf3lBCW2pgcEQpfTcOimG1lQiv++UKC+
         kYyFl0wfSeBqZmbev5xmEbI2qfChijFANKIwCP/79gsYg2SzqqOq869MWFK3zl3uhRKn
         m15WD6ZMiyG/5c2onB9xedw5nthhSQCuMNc8rVzamNHip+f0KStwzbCOlOhRI+WJW5SC
         JRcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742135472; x=1742740272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tc/KJH+qtYUavPHzbi/9sG/C7pjG+2ryVkaTYFLi/Fs=;
        b=kk73oKP4OWtIkhV6kxirWUnWJQxjNI2LrJ9yO2/bT6XXSMeQ/qJuv7VYKDgLkmn991
         aHcxUMpksbLoe/eQMOoe0e1eN8fcGKwXkaQdgI3qyO5pZwx1Ql1efuydVeKFPLAsxkKV
         NkWyVSojzLxdBdlZLrrkQx93iIfyWgQoHy+D6br0G1EkBJQiDZH08Am21HvNztau1EKO
         ycoMBZKw/CoN7dzefaFSOHGDfeQbmvHSRK0Wvexe3+PIxyWhX3GV4HMt5gtw2unsBBTK
         4cUfQhZ8IfrYlpyIvpE9GFynQoEpg6Nl4R2qdqyRygAH3zQSTueM7wUI77AxaA0xeO6u
         gfow==
X-Forwarded-Encrypted: i=1; AJvYcCXlEd8K0jNHa5zL7KMJxOY+C8cDfdIJEKPay2VtFsZPeF8iurCyM2NeKiI3aniKbVcR4dheubJ+h/nv@vger.kernel.org
X-Gm-Message-State: AOJu0YwaPWE131GpN2xE7nJzQc6xlF+vfoUyevOOCRpM5c9R0843aSZM
	b48n9T6ZPgzWB+EebjenvcDAP7RvjZDDlZgm/NwhLf2zzPiBggFVdMVH1eErYXI=
X-Gm-Gg: ASbGncvEMu1KGM+oiCDofa7RoE0VvJ7sKsAdiNiHPef/kkyS5nyNQJPU5x51VavHyJW
	sKXneK5kl3lUJAeH0O2jAr8HMbk+ZAYSRt+OLFerRF9gb+3uJ7zJVr+ATO+CW7uokCUKIe9GpWc
	cIRZu5EEBY0kn3VJKwopshuQT6gw5+cORQ2c46whJBbe3nTNeVGba5ZXsRqO8rLRkBFMYpEpY7p
	PpKMtthdMJIKJKr5ODwr/QGuhsLWqR7mK3GIQEg43b2Qy4YWDVLlPNBPC86MO75eld7ua7A0LvL
	GflnGZqsqsjPSq67FqW/PCa6VAdaJp7rNQcTkD74zl3Awwg3ACUKvcqKEnNwsc+6n7O9
X-Google-Smtp-Source: AGHT+IFi9JXkUWFEjeJAm1SkUmYzub/naf0VWY52i62TdEebnaMcewd6ZseRSkUbDf0UNDl+nNKnHQ==
X-Received: by 2002:a05:6000:1786:b0:391:42f:7e83 with SMTP id ffacd0b85a97d-3971f51129emr3597689f8f.13.1742135472433;
        Sun, 16 Mar 2025 07:31:12 -0700 (PDT)
Received: from krzk-bin.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8881539sm11919868f8f.46.2025.03.16.07.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 07:31:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] pinctrl: samsung: drivers for v6.15
Date: Sun, 16 Mar 2025 15:31:07 +0100
Message-ID: <20250316143108.17045-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tags/samsung-pinctrl-6.15

for you to fetch changes up to 701d0e910955627734917c3587258aa7e73068bb:

  pinctrl: samsung: add support for eint_fltcon_offset (2025-03-11 20:37:29 +0100)

----------------------------------------------------------------
Samsung pinctrl drivers changes for v6.15

1. Add pin controller drivers for newly usptreamed Samsung Exynos2200
   and Exynos7870.
2. Correct filter configuration offset of some of Google GS101 SoC pin
   banks, which later is supposed to be used during system
   suspend/resume.

----------------------------------------------------------------
Ivaylo Ivanov (3):
      dt-bindings: pinctrl: samsung: add exynos2200-wakeup-eint compatible
      dt-bindings: pinctrl: samsung: add exynos2200 compatible
      pinctrl: samsung: add exynos2200 SoC pinctrl configuration

Kaustabh Chakraborty (3):
      dt-bindings: pinctrl: samsung: add exynos7870-pinctrl compatible
      dt-bindings: pinctrl: samsung: add exynos7870-wakeup-eint compatible
      pinctrl: samsung: add support for exynos7870 pinctrl

Peter Griffin (1):
      pinctrl: samsung: add support for eint_fltcon_offset

 .../pinctrl/samsung,pinctrl-wakeup-interrupt.yaml  |   3 +
 .../bindings/pinctrl/samsung,pinctrl.yaml          |   2 +
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     | 405 ++++++++++++++++++---
 drivers/pinctrl/samsung/pinctrl-exynos.h           |  41 +++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   5 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   6 +
 6 files changed, 413 insertions(+), 49 deletions(-)

