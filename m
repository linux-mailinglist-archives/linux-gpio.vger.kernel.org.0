Return-Path: <linux-gpio+bounces-6860-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8F98D3993
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 16:44:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1677289110
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 14:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD63315AAC6;
	Wed, 29 May 2024 14:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="acvxl+jF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7AB1581E9;
	Wed, 29 May 2024 14:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716993881; cv=none; b=g3RqQkb7wnD+quKa8SYbJyarJ5UQwbTAfssPtwu/Ra9Yohplw8uYNZg1CRq8QA6oepanLO2rHNRFRRpfvTZtXgKU4uM1kAjBmmOXzu4qpTUHrtMhGGkW0ClgheuMdGO39pUcnEz3w7U0u6MMSTJZzmqnpAQMbYNgzYOIjWYH+PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716993881; c=relaxed/simple;
	bh=gCT8PDxsy7chYSyUoW1k8QcPJdu1mk37WMs2Qzi/GIg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MsVH9LzQHnOHLZfyi6OjKC5wPZnsLX9PBhL1IKQVz1oiSavsxao3QGTzL9cFGTeG7nAo7Gtsz9jcpXxHEXL0PGfmrv5kJjHke07Maheyv9nidpv7oKZKqAGI1nLqj5LFp+OObkdAHYm7/TM3f78DSsRBHyM7+lq0IxIqF/ZrzKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=acvxl+jF; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52388d9ca98so3367348e87.0;
        Wed, 29 May 2024 07:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716993878; x=1717598678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wmg0Xdln3CoQgJ9NVNuMFs06AxZyiuM9wtNOUDPn1Ws=;
        b=acvxl+jF4l1Fn445EpMyDJP7HLvePAY76vT08rr+n5PrrEaEprEfFmSgpJMCphR3Z1
         l+Z7Jw605mq+zZo3VJ/nHFalbQVJ1xv1fzt59aMc+/ag00PfgZVRcDuGRvHCezYzHUk5
         j8ZEqCp9Wrp3D+lEmqygIxXYhBhD0Q7PmTLVQD5hfEA7GNrzmKxfdG6bCz52esbBdkjT
         lNYNFNhed1sbnhl9wKCjZ0JjXOPVYKt75evVtme3ROxoqY/aaiJi/v7vzCxN/RfSWeVV
         52CxTe2or+iZTLtt2C4cTh32a9mXkDYCKFKBZGh+6c0SCdM/lNLXzMT991t+UqNpkRfU
         uI0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716993878; x=1717598678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wmg0Xdln3CoQgJ9NVNuMFs06AxZyiuM9wtNOUDPn1Ws=;
        b=qpHHsFvdEGGQXfpiC9fWOKcI+kFScZ1ptqfT6jEk46qRzXD2Ys0lcjHDjNJwkg/V8o
         BGafz4FibddZn7G2ohJfr7KjejZ/PA1mszuclbyxy9HzoR8Ijq98ojTwD5Sna3eKUlKa
         Wzbdph2rj3hQeRcu3ZttVOpE4IWcoWRSQMQTZdZ16z+HLlwZb8fFqaP1edHR+rdJ3Day
         FHFB/VSnV9vIn1qt4Clkj1Z8hE/ezQLQ1UHctOh3SMWssgMHV3wyorALr4yKZMi1/mZ7
         1CSbrSbYCn+jxT6NIZtwI7xpgSA3PIrc3/eA6NOBbOv0oMRLYSOvLwrB9P3mrfIl9MEX
         AxIw==
X-Forwarded-Encrypted: i=1; AJvYcCUjEP5Nv3Q1fn0v1HZDomj4euS6o0oVm94bz+qmNLbeKEBJOVWcPRQsPFU/2mRR5KQ7+Y/84qyLJYOb9682klykMSvAwbj3pn1iZId0JxiCRsxOKMOjMvMHd9G6AaxlBl5Xx+v8bGrvvQztc/JONyJrJazwEd55vMazGx9sP2D8wYTJI0I=
X-Gm-Message-State: AOJu0YyxXfvkBe/lQRWElPFILY7QcNWGI33Fmkz7Y5rzEu/cM/nDonsr
	pGJPb23zYXC7Qqc3Ko2HXu8/7C4GSp0uE9hqekanNop001fBDuL0
X-Google-Smtp-Source: AGHT+IEmeGBP4gSt953JX9l/IvekTaw0WinbNkSEyrZcdumRfTqWxO7Errv9yS6JwzWsqMFJg0mUOw==
X-Received: by 2002:ac2:5dc1:0:b0:522:8352:ff29 with SMTP id 2adb3069b0e04-5296736bb86mr12370567e87.42.1716993877840;
        Wed, 29 May 2024 07:44:37 -0700 (PDT)
Received: from yoga-710.tas.nnz-ipc.net ([178.218.200.115])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-529ac903bd9sm928915e87.236.2024.05.29.07.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 07:44:37 -0700 (PDT)
From: Dmitry Yashin <dmt.yashin@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Jianqun Xu <jay.xu@rock-chips.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dmitry Yashin <dmt.yashin@gmail.com>
Subject: [PATCH v2 0/2] pinctrl: rockchip: add rk3308b SoC support
Date: Wed, 29 May 2024 19:35:32 +0500
Message-ID: <20240529143534.32402-1-dmt.yashin@gmail.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series and adds support for pin controller found on rk3308b.
According to rk3308b TRM, this pinctrl much the same as rk3308's,
but with additional iomux routes and 3bit iomuxes selected via
gpio##_sel_src_ctrl registers.

Downstream kernel [1] managed this SoC's with rk3308b_soc_data_init,
wich picked configuration based on cpuid. Upstream pinctrl patches
droped soc init function.

The function rk3308b_soc_sel_src_init sets up gpio##_sel_src_ctrl
registers, making SoC to use 3bit iomuxes over some 2bit old ones.

These patches have been tested on Radxa's ROCK Pi S, one based on rk3308
and the other on rk3308b (from the latest batches). For the new boards it
fixes broken spi1 clk.

Similar effort [2] was made several years ago, but without keeping base
rk3308 SoC pinctrl support.

Based on feedback from Luca, Heiko and Jonas, the v2 series droped dt
binding in the favor of runtime SoC detection, so iomux_recalced and
iomux_routes updated for the new SoC's and patch 1 delays recalced_mask
and route_mask init.

[1] https://github.com/radxa/kernel/blob/stable-4.4-rockpis/drivers/pinctrl/pinctrl-rockchip.c#L4388
[2] https://lore.kernel.org/linux-rockchip/20220930102620.1568864-1-jay.xu@rock-chips.com/

v1 Link: https://lore.kernel.org/all/20240515121634.23945-1-dmt.yashin@gmail.com/

Changes in v2:
- Drop routes fixup patch, already applied
- Drop dt binding patch
- Add new patch to delay recalced_mask and route_mask init
- Rework last patch from dt to runtime setup with rk3308_soc_data_update

Dmitry Yashin (2):
  pinctrl: rockchip: delay recalced_mask and route_mask init
  pinctrl: rockchip: add rk3308b SoC support

 drivers/pinctrl/pinctrl-rockchip.c | 286 +++++++++++++++++++++++++++--
 drivers/pinctrl/pinctrl-rockchip.h |   1 +
 2 files changed, 267 insertions(+), 20 deletions(-)

-- 
2.39.2


