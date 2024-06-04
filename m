Return-Path: <linux-gpio+bounces-7124-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA588FB4E2
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2024 16:12:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88ED5282287
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2024 14:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BBB72B9BF;
	Tue,  4 Jun 2024 14:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/Qea5iD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556CDD535;
	Tue,  4 Jun 2024 14:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717510334; cv=none; b=hnW0TMEWzUXB151Wy8c2iQqqjE8MU+J3VuxHRiD4/4PtI8JKD6mU3gwAzcIVJQIJDUd/wj1PZU89ahRdp8fc8gFynLXKUpDei/uI8A8VbmV4PaOJO/0TsihC/S+cnZrBiKivcH+PoeSN6DhS8wl8StiEKMBIAgPCAFgMKCDPQAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717510334; c=relaxed/simple;
	bh=C7M3Ung7NZyyQ/5AeZaQ98hsGFGD8qp5A9MnbnjMmQI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j8Vs9rtyxKhLRV3QjDDHmyCEpT5tDfrpQJUrG8pBy6FlYQdg3qPiGswMCSLKsF96o/PMMxXopABgUDofULtjjisioGtZMrmleEHhrbMEFsi4/9ZWXyivKvdled6b/0/J6fGCPpilCT2bSe+CzIALqRh+Y5UrSwvJ30+Xnxm5FqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/Qea5iD; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52b936c958dso3695794e87.0;
        Tue, 04 Jun 2024 07:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717510331; x=1718115131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sTI0bo9QlSR3jF5fzKL/lNTXRRTehVU4sAkZtkhRBzM=;
        b=K/Qea5iDsFDuq07bS2wNusd6BIT6RB+yUrWJVZXlhc3/i88WjGGvKxAj1U14xITIwK
         N/+MVJKFvH55Ky4ecpCX5t1fVZ8eaDPFh+q57ROkTWbDJnQqYpzAFrxyTmxahfSHItFr
         +T5jS6GYoEdh1yS4c/5gFLjvujKcy4CZ/ECXOVlvET63Or2z/e3Dum2jbYqOf4wCnOSk
         DiB2F0UfXh1tbID9EfLTORuJbitBIQ5nKWy4ITEIXaa/dax7buFns900sOVB47wpHqwH
         dluFnRVxAdbBfxtFQpByUaOjZXa3krBLlFOxJUVQlF7FwGHvEG37CZtcnanKuacAvbok
         FvIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717510331; x=1718115131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sTI0bo9QlSR3jF5fzKL/lNTXRRTehVU4sAkZtkhRBzM=;
        b=XDQfojY+lt8IMqYOoQWZ9bcl+fnixoueCVVgD7ar7BrXb01Ja4Wmxv/o1bb7riFTlA
         VLYh+D6nFnjkn0cIyVD3jxij3II548cdF2h4v1lBH98d2VeJ4yZU52rf3f8jdlJIiyIn
         d0z0zJGUmQf5PBnL+S8BH1uj/iATOFfPdvN6F8LOy1ScWiPWP830MwVTWtlVkO4sEDfn
         72IM4HerBUayRXy1s8fK9CfheKzzT251V+o3YsTsAoE1H5ATYZQ/hE6yifYmkUkZ400O
         7WeEIG0RXuY1OZ2aAoup8+6w2PD9fpxdKF3BzwX8UW97bD9S2PIw6aEI59fghnWJtbQz
         7x4A==
X-Forwarded-Encrypted: i=1; AJvYcCXbXfPDivas3KgzaIGQvgpD/pOX1oBo+GPx2mgD9F/4Pj3poef6bI0jhW9YW3peXqyrXR/cFqIgF9QDTgWGa1Cuq5zlDxQb9dne102ceYe5qnnnB3k/9S3kaytjLXqxcyk4yR3egGTVQfWLGQHKHb8TFETMtQlNxbG2CzsL8KRhC7OzdgI=
X-Gm-Message-State: AOJu0YxCr1ztHgbsnlVuVnFU5HSYYn9XUK2t9drF8QorggS+qeUE+Zuh
	gJbl7xFrNy3KQ6AfVVOd/qVPdovmFnQM5RAva6iq+rR99oUkdHmA
X-Google-Smtp-Source: AGHT+IEX+hO1fjOTWqgdmiNAEFg0qrDQFDw6cG1U1FlLDxT3z8cZCdVuh8JspRxuIl3ApF0IENghfA==
X-Received: by 2002:a05:6512:3e24:b0:52b:874a:7df with SMTP id 2adb3069b0e04-52b8955c5bfmr9728475e87.12.1717510331074;
        Tue, 04 Jun 2024 07:12:11 -0700 (PDT)
Received: from yoga-710.tas.nnz-ipc.net ([178.218.200.115])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b982d3de7sm742743e87.2.2024.06.04.07.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 07:12:10 -0700 (PDT)
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
Subject: [PATCH v3 0/2] pinctrl: rockchip: add rk3308b SoC support
Date: Tue,  4 Jun 2024 19:10:18 +0500
Message-ID: <20240604141020.21725-1-dmt.yashin@gmail.com>
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
v2 Link: https://lore.kernel.org/all/20240529143534.32402-1-dmt.yashin@gmail.com/

Changes in v3:
- Witespace cleanup
- Add Luca's r-b tag
- Rebase onto linux-pinctrl for-next branch

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


base-commit: 32335efff386d04961b178d4c6b7d1ccbafb729f
-- 
2.39.2


