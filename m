Return-Path: <linux-gpio+bounces-12104-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0479B05B6
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 16:25:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62005284961
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 14:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46FB61FB8AE;
	Fri, 25 Oct 2024 14:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FsmLrS0p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2516B7083A
	for <linux-gpio@vger.kernel.org>; Fri, 25 Oct 2024 14:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729866311; cv=none; b=FbsZ4HNd2VLf8RP1VKDKlm/hlyYY6F6zaJYygIYZx4uNzQCOMVernA/Ypc0p/TS3ysUm5PvUBoXLs2yXS0Oj9QHU6TCMhLAqtj9Y0OmjbjGAxS762v9i2fkEb2VPx5oSOtI4qHSdSoUTOG4KCcb4kw4oHqk3oNa1w2WzR4YrQVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729866311; c=relaxed/simple;
	bh=7uwT+o57UvM7J/FQzp0V9fqdfYC2UNIOdQJe6Bj47XI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HH+Q2pezq24tfH5U0XHwzOOJ/eOcgFONZ4ks4235hYao6LiMU+ZmI9mE+posBkHBhcU+Kvlv5KAlBicz2ytO3KCnoYmAIuxOeaFp3iGHuWWCJ9UTEl7DLZVEE8bEt07m69C6un8yJJp/RGRAuI6cAXDnDygZwVy29rcQXThbfn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=FsmLrS0p; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43161c0068bso20602395e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 25 Oct 2024 07:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729866307; x=1730471107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IKxWRQVkB4WdUkX8OjK707c8TKcovo6NqREhGPLhdkM=;
        b=FsmLrS0pc4A03oRNLGEhnANmPKK3SCwKJwoOqyf+OnTgIpuxZRChwRrlBL71pMKlcn
         u0kcx6hHayAyky3HZjDxt8CosI3YTQ4GEtE5Uy/fC28xE3Or5MGRpeLbtUNVXcxAYili
         r/ECNhy45yp2KukjsOTUTmeUyN1G2c3CHa2ftUJuZvgT07bx5jSdaDKOurqBxIXdGlrR
         LQ73RxpFlbLtXbBKUlMKBjxaJfcxUm/PrBPQIMmFOzk6iElFdOU4WPkEFs5D3xYHX5uL
         wEdgmBvdTqWlNhW0KJbomVwJm/607+PR5UdzBnmVdb/jZFTw/O+jEI77jn+wJoNqTt1A
         +wvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729866307; x=1730471107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IKxWRQVkB4WdUkX8OjK707c8TKcovo6NqREhGPLhdkM=;
        b=vzgj0h67sIfqsTz4Ie1VtZy/IKFOCjPIGOaXnSLvF6iCO19v67lCo0tm9VFLfKG7Nm
         38HXO3l/6HIihvHhDZJ4TWwGV5cLzmTXA6056aI79xy9LLzwu67cpMZQNLNhfGxEplm7
         dV8Hs3xK+ACJBYY+y650+cPMKRhV/yvTmYaQGCd2GTlh8jvY2qXntsMQeeUrAs92aNC3
         Ti/zevHzM2AYmnIKDxQiS7dt8kQKbNvtai707yfwSAVSlR13TO0ob3ecDGxg586salrf
         CazZwkNlhZbvoCrr2nkZkv/8C1zTnSxcioxCyMK3hQJjKbJZi1nelfMq493WxlpCgCDJ
         SjlQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8DMqmHpJM5LnPlf7lcKq7rNrgTl7Z+BSrgnI8kyRp6Q+/45v632cDYvsWfOdG1v07fiIgiUDuTV9K@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyx3JAu2FhMaw2eQxN/fz5vZqOJvh++tQzemVxiWyqkXL64PoN
	19vEAfYI6bY017SxOakMmyWqAns0hiq1slcgwF28jCfh0pLe+XsRd3o2M+oV2eY=
X-Google-Smtp-Source: AGHT+IFW/HyHRVy6ctVsiYJPu+tooWLvDcmC1BLHr+e9gfbJhkAvwQ4pQy86lpbSCZbeQ9157khFyg==
X-Received: by 2002:a05:600c:3b90:b0:431:5ba1:a513 with SMTP id 5b1f17b1804b1-431841fdca7mr92227775e9.10.1729866307323;
        Fri, 25 Oct 2024 07:25:07 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a207:5d17:c81:613b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4319360ca31sm19121445e9.42.2024.10.25.07.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 07:25:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio fixes for v6.12-rc5
Date: Fri, 25 Oct 2024 16:25:04 +0200
Message-ID: <20241025142504.44267-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linus,

Please pull the following MAINTAINERS update that adds a keyword pattern
to the GPIO entry the goal of which is to alert us to anyone trying to
use the deprecated, legacy API (this happens almost every release).

Thanks,
Bartosz

The following changes since commit 8e929cb546ee42c9a61d24fae60605e9e3192354:

  Linux 6.12-rc3 (2024-10-13 14:33:32 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.12-rc5

for you to fetch changes up to 7e336a6c15ec7675adc1b376ca176ab013642098:

  MAINTAINERS: add a keyword entry for the GPIO subsystem (2024-10-22 09:13:10 +0200)

----------------------------------------------------------------
gpio fixes for v6.12-rc5

- update MAINTAINERS with a keyword pattern for legacy GPIO API

----------------------------------------------------------------
Bartosz Golaszewski (1):
      MAINTAINERS: add a keyword entry for the GPIO subsystem

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

