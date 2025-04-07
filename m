Return-Path: <linux-gpio+bounces-18317-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BE0A7D692
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 09:46:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5104B3BCBB0
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 07:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E028221F35;
	Mon,  7 Apr 2025 07:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RxdWrJGi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE37A188A0E
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 07:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744011694; cv=none; b=BgfdgVKGZ7WPz/tPE4e1jakvXOo8dF6h45fnxEiYCtOYsz9vGnFA4R+n7PAj7jyyd3iomzNDltr4+RlVZ9Vv14yUiZYkS7uAFxto656zpkyfG1mpoxEHvy8u+Z2j2xXRVk0O+cxps1VVRed/czxrljkxXi6MhCz2/mG4d30Z5U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744011694; c=relaxed/simple;
	bh=wUxnoVJrOkhN8ol+6ufOgx0J5Xy6IYNdh22iPwhPO0w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aux+bja0z/xYLgVwQe3UpgSyRsdLLv5RYVTmMWWBCm/LGyxN6JzRi1RqtVNvKmGnOdlULkzokq+u664De06IZbQgQb+qtH9uKsYis8c4O6zk/hq7Pq+a6WJperU50DhtJdlUbqHE/YLbUUaORD9LnpkCm6PzT43t6fFSwJ54NmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RxdWrJGi; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cf848528aso33073835e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 00:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744011691; x=1744616491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uz22H0sKHi0P6ChA8f8l89RVIB0HG3tTa0TbQ2D4N4E=;
        b=RxdWrJGiH2w8Wlfhk1ImgZ4sTnRqHYSa/norO4NdFlG6iIhWXeX8T7TrYP+Qsqc72i
         dnpQ08vDVGWt/hQvcT5vYLE0RNNLcJKHK0XPGdY7NbW5DpmSNxALhiKVCqnkiitnjgwc
         hoNTi7GpkYP7x/BGmP/EvFEFwx84Y865pEGEXr995F/Ekg9xwcT7vUcQ9rhHRRTZij3b
         QGLUFAuwA74I7EhNrCYLGNXcuTUigOqIXG7fczNr+gPCr8xw1HTdkUomJ2TDpQ4A9+dm
         sKzqfnodOyIyU6ZzyvQtmHUSAkgJOD5UXGtHtYpY9wGiw5dMWWs7+KZMrg2SeBtHmV2m
         bPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744011691; x=1744616491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uz22H0sKHi0P6ChA8f8l89RVIB0HG3tTa0TbQ2D4N4E=;
        b=h67fdgzWrUseBI+bL/ZqvxObTukZOhQ4RTf01mKOQJf7TGGaYAAmOUEwWpRMgn8abg
         SjcfMZ5w9sUf4v1EEPINOm8t+gL2et3c+sPOR1RENRodmYXgm3vKQTkwEVlrBDhonfC3
         6CmmM5Te1RhyL2407JGS/ihh4ZfIE3fbBB34i66Klxa7T/WJMfePZNcHqvqtsE4dGkM1
         p6s/FrNI0vaDzH5UiuPqsoLZgN36I6q7U1e+ednE4p1a3OMIxMGeGfyNP7+c7HJ1jE7V
         YIBDxgaU0Mwk+zPYeWdTIXZR/qebjwFzAN+Yy02J7g9ackGhMRBhiEFTAQ3iQpyZsUhg
         bKsw==
X-Gm-Message-State: AOJu0Ywnb6ZQN1WvaiFK77PAqz1Bwbs8+c4qP3xAz6Q88EK4g7K+nlRE
	VKjQGZGmQCfwuO3rlu9L9ElDl2ohZwsvXOwo+RPBD7SN5MnC7XvZ0cEdbGiaxHs=
X-Gm-Gg: ASbGnctpuQVhI4G4jxwxLj6D54y5jvOgoRv3TnnQYWGac0iP3GqlN56+4sf4cAT6J0t
	fXxgCdlNhF4EV2oGNhYroXzbOVNLKmEpzLvzZP2nJlLw5saH24pn+96dd6wZgUs1XtSkZNR2orH
	zIS4D7swWdsElyEaUc05deNq5lwZKZeW9+G6mXDd+Y9+z2YHTuSGdOdFyUaex67TTb9yI19lKiD
	lvbC7Tm/GCl7AiCXGhQ7vJF6Mc/tQfLR741ktcVcaK4LPHXnAvIw3ZLIgPaAIylH6IwRodaVTLU
	0BSBZ5ijZjunpjR4+TlJUahJ7QiJAj5nj1dY0cCQmwHp
X-Google-Smtp-Source: AGHT+IFHFUB/LjMCMRZ1FmL1ZohnhrBOQtU3VyuHCtAN6Bq4uju9hGTT9QfacVvXg7wSnqGBuluI6w==
X-Received: by 2002:a05:600c:4754:b0:43c:eec7:eab7 with SMTP id 5b1f17b1804b1-43ee0640054mr73289405e9.11.1744011691047;
        Mon, 07 Apr 2025 00:41:31 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a6a60sm11029472f8f.29.2025.04.07.00.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:41:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Peng Fan <peng.fan@nxp.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio: immutable tag between the GPIO and regulator tree for the s5m8767 polarity quirk
Date: Mon,  7 Apr 2025 09:41:22 +0200
Message-ID: <20250407074122.23773-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Mark,

Please pull the following GPIO change allowing you to apply the patch[1]
converting the s5m8767 regulator driver to using GPIO descriptors.

Bartosz

[1] https://lore.kernel.org/all/20250327004945.563765-2-peng.fan@oss.nxp.com/

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-s5m8767-polarity-quirk-for-v6.16-rc1

for you to fetch changes up to 4e310626eb4df52a31a142c1360fead0fcbd3793:

  gpiolib: of: Add polarity quirk for s5m8767 (2025-04-07 09:33:29 +0200)

----------------------------------------------------------------
gpiolib: of: Add polarity quirk for s5m8767

----------------------------------------------------------------
Peng Fan (1):
      gpiolib: of: Add polarity quirk for s5m8767

 drivers/gpio/gpiolib-of.c | 9 +++++++++
 1 file changed, 9 insertions(+)

