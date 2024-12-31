Return-Path: <linux-gpio+bounces-14374-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 361C49FEFC8
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Dec 2024 14:31:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D3313A27AA
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Dec 2024 13:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D51419CD1B;
	Tue, 31 Dec 2024 13:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eivZJbKo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D79194C6A
	for <linux-gpio@vger.kernel.org>; Tue, 31 Dec 2024 13:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735651873; cv=none; b=GgSAWuvtUO/gWwYR3VmAH4EfJNBziMLuo9JhRIW0BC4eZWBKfo9N2jmhrp5u5Cnpsel1rlgmAyA87coBbO6n4rcTa8PlE+6rRbeVXXqv2Mtu2uXCAutuBidj3z2ebCF4+Jf1DSh9cSLoZBgslFCh03KRwhwk+0ZdrCb4DdqK1d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735651873; c=relaxed/simple;
	bh=GWaUmjUBLoV7gRAqe9HG2nbEnwr2ZKSAXA9FTUCz2jE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pm0SnBHb6MujjmvW1dIdOnspVuV2Hf6YuaTJBDjlYBOfYmcE888iXfcIgvf2cwvFjvVqTXbKoXhXgt8kU4AaRRVqrIhn0HRjqF6+p+sp2tQweL75ukPZOa2eCZt25SU36MYkAntlRWmw3mShWfJXfVLkIOzPdyN6zFF55NYOLog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eivZJbKo; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436381876e2so14916595e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 31 Dec 2024 05:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735651870; x=1736256670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ztH4Cp+TWuFNo+T9DDOJEU6MuEj49P+cJhTlURsWNmM=;
        b=eivZJbKoCngpjwewZCKJqCz1G/HfGQxiFWW7QsTCnWNntin6qJax2i5w8Crgb6FSi1
         WZCheAk1hco9REQ+BFzC2fyK9dNp+hczZFsiOhPY41Jdj5plvgAe7AfEWamjLONRXHib
         kyHM1GS1+DlXP7UZwzSwxWI1g7RrJYwfZjdC35ht9mKPYpCnFXWzfZ4LzTXznZLS0H/N
         Swfvn0CWUKQATek8vLuxARKsjs32Lg4EbvWhB1hFp5kJQGLDzwfJNiUsDd/WfA7yu3f2
         h5b6crOQDFSy/V5gZy3sHXEiPBBmVRgd3YrJTkRzTVCCddG7CyONAsshCsWaz2dJ5QF3
         PzKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735651870; x=1736256670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ztH4Cp+TWuFNo+T9DDOJEU6MuEj49P+cJhTlURsWNmM=;
        b=cWM2Pr7tThrf6AgP/eeoe9UQyzOK8OBSsWhETVIUr1tmHKYU2r68ixpeJg/bp/IIP6
         FyXuIxlJYjJcI3m8xH+V0QS0uUX+8WSQKRQG85xPOAca/9o9uYK3egE83+r38MyhgykA
         Kgv+H7ek2NhTPeina9wJ7ZmrEUtpoHGzNQSKCyfvCOJF18Zr4M8sNB4hlO7Hm1Zlx9jo
         t3GOifv1agpo9N0PUsjY+FXLU1E4tv9biZ91wRS7WWP3e0By2RVARUNAsanUjhycH3B3
         mE3m0F7nEcc1gvsCSYcC+BLNp0ehRSFUIpFUcFjc0GLxdLQdXNrwYZvMA/TqZjNHWV8x
         0Vkw==
X-Forwarded-Encrypted: i=1; AJvYcCXmuTWDiLRlIgChzZIV5LM9ZhDkiJ8chzBnVC7swCC3Vg4pcI6AvhFrx6PgxziPJYscgHwSHWeesHDF@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjdp8bD2/3cfpz0wvJCWCUBAhMMWxcZ6cygFZFGCImTQwmoeYN
	D/CZsdhDsJR+Lj9bx+EYhJWypWXh3JnQUQTQGrBw2vn+rusqS59JpNN5rDFt3Q8=
X-Gm-Gg: ASbGncsFVbhxsPdGjdypX/00mL7E56q+Fc2IBq7ltctdBdfu6VAV4OamQyCeZccpuym
	MAFkLkvWynliIu2uheidienYY6Offxc77Ao8iTEGADsAqml1p1h6Jk8V6CVsN2Q3H73NZt9sEMz
	CoFtOJk8jP6vMRMnTwrwUJta2KT1j212pZOetC1yXjOopTKdPcIUASubrb5saWt5w6FsywxT/fn
	JlCi4HwYX2sRNy2tKFtQfMnlcXGoRGRgCj2K5IA+e3+cyoPsS7pqIknb1xc2gDbbZeX+Us=
X-Google-Smtp-Source: AGHT+IHi7+HrBv4JJTi9gtZfiRBlA81Co2JS3S9Apnra+hVXLLciWPy9sGqyudamix3ncbI9k0mZwA==
X-Received: by 2002:a05:600c:1d1f:b0:42c:c0d8:bf49 with SMTP id 5b1f17b1804b1-43667921f0fmr138879685e9.0.1735651870488;
        Tue, 31 Dec 2024 05:31:10 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c515sm390740305e9.30.2024.12.31.05.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 05:31:10 -0800 (PST)
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
Subject: [GIT PULL] pinctrl: samsung: drivers for v6.14
Date: Tue, 31 Dec 2024 14:31:05 +0100
Message-ID: <20241231133106.136237-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Fixes for old issues, not critical, so not worth current RC.

Best regards,
Krzysztof


The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tags/samsung-pinctrl-6.14

for you to fetch changes up to 0ebb1e9e1b12ddcb86105a14b59ccbed76b6ce00:

  pinctrl: samsung: update child reference drop comment (2024-12-02 15:11:54 +0100)

----------------------------------------------------------------
Samsung pinctrl drivers changes for v6.14

Two fixes for very old issues around error handling and also one
cleanup.

----------------------------------------------------------------
Christophe JAILLET (1):
      pinctrl: samsung: Fix irq handling if an error occurs in exynos_irq_demux_eint16_31()

Javier Carrasco (2):
      pinctrl: samsung: fix fwnode refcount cleanup if platform_get_irq_optional() fails
      pinctrl: samsung: update child reference drop comment

 drivers/pinctrl/samsung/pinctrl-exynos.c  | 3 ++-
 drivers/pinctrl/samsung/pinctrl-samsung.c | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

