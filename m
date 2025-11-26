Return-Path: <linux-gpio+bounces-29105-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AA535C8B0DC
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 17:49:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A78E735196F
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 16:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CD1D33EAF5;
	Wed, 26 Nov 2025 16:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3ZkHD+NU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A7D33A024
	for <linux-gpio@vger.kernel.org>; Wed, 26 Nov 2025 16:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764175760; cv=none; b=laM6rfTjri1U8CWAcLhIXn3k3q8snIeQQM+FBbDh/a2K0XJwGpGwEob88EthvX+fsxCKaVfyQCN4wYC7aP+hC1flsNkCMIgfIoE3SlCnJXDC9vinQw4wW170KCS3mC1b/IUbeBa9jOCTnfhpjOw82GyoYXqHoColNBgr3QRcyo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764175760; c=relaxed/simple;
	bh=0qXyibuX4g5zQ/P/1+2rlC4fT1wR+Wbz6OJo6uSU9CE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UsdMpt7MQvwbbRwp7TC0zy1ebF0UkEL7r09Jf6xi9vqE65KwsxJtS4osV5YjzNfOH26X/Wf5eSwioQ7EHuqw5lLiyz/1jwoWq7kHLlNfJLKSXaJHgKhCrTY3bIzMipe4wEQHxYm6gdNIX3t7L+Z/ORq0Za4bcTCdojJmrtm+X+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3ZkHD+NU; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4775ae77516so65810995e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 26 Nov 2025 08:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764175755; x=1764780555; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Psrx8x2MfjHTSjS7fhz2D+ea7dotY4a9qq75+AqeWwY=;
        b=3ZkHD+NU+J562Wv2wO4USxefmjmJ243FDyieRlfZPUA0E7UpdIxYYB2t7kA+WUbqEZ
         ml/6hgxpp8ORHh2mt1M0H4HyAh2NqvCsMkOEHKG2o00j7AGhe7h8hR4YwnZ6n6YcFDfG
         JDHE3DhE3aapWJzxXNlAxDM+G3wJyXSLZ73jlL8Wrv99wS5pnPxhAY/o6pTSA4J13ns5
         Q54CMdU8JLjYz5CqT264Umf45TyhtUfaQQYrIn2tnP7bMEvyCyrrv1stIfr/gZy3NE9L
         4szKCnEiCP+bSaClQUC/rHOgiq0/WR20Ogv7cT3KL3H5LkgBIpsRIW/DXyfzMB2/h9AY
         /GHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764175755; x=1764780555;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Psrx8x2MfjHTSjS7fhz2D+ea7dotY4a9qq75+AqeWwY=;
        b=DIHZLuVSMi8+a+lQL+WwYZfJlxGfDh43mlXS45NZ1EsgIDkucP5rW+ulskocwv+CHE
         e9kw2bok/bpWzYbMBgAsLtcbBb4L5f7Xni/TjU3MDygAvNJTOxVoIoDF/UKHJQGG1lzJ
         NC3Fbyno/ydyr/5RPyF8XgNuaAXC9bzVZ99If6GmihiZkLuZDy7Q4beQWsTNVriKcqHl
         6VNVKurVs9KypB3Xfr1u0mn3OS1WSkK5otx+NQb5klTn/QzmNVVaS09I214Y94GEINkJ
         rFSi/dQAc7TwyL4gvTalFidV/u+IWFp8BAqNxyWFJtZk1HsLO4mrCdF3B4fXGIGjYCAu
         HonA==
X-Gm-Message-State: AOJu0YxR9X2jA73xG2eLF2BxTCb46BKilkN6cZh4Lb6da7ep9tmRPXmK
	Mtr47gf9s91ILuiJn35xhUekRkgVq59xJMSr+zkUliDON37lEhcrIviYnwHrcdWYw20=
X-Gm-Gg: ASbGncv9Ofy74Si0nGnnpTXc8c7G4z/XBc+dok6svZFAVMSUZCKhw2BthwW5ueMcWEb
	DVf8/LHeD3iBD93UcAU7v3EbbNEmTmQBtXumz/zC6xbEOhJuwazB7l4t+CwEj/XJNbxy5Z71bnD
	El70eC0twF4V+Y//mWgaVxoLN/UdV2llrXIsd2HW7oKrBrUOD1LERSoJXjTrnzl1cQ4Z+zpjR7s
	A6GkHrhqhvzE4IpyTPwNPYT9IsncKJEiddpY0PnX6FBvN4Rz5iOs5VuXJT8Slz0FotSPUm2IlWT
	pqMqOw66hPm5YtqakAVZk5bGAWnO1HJFjMok3cBHpA/qYfeZYtoxVgoHo35MCCy8Ie6IE7Op3mQ
	QdfqdBcoJLCqio/6KXZndh61RT0YU24MXtknt1ruEJhWe6mKE1ka8ziR+bVis06KfTrCXEsRWCH
	oqcTVZGA==
X-Google-Smtp-Source: AGHT+IFf2WujO/iLI4gzacOKOfkUEpT+swfazLU2qy609cfe1FKFet2BSwBjqZmr17oHamowmco1BQ==
X-Received: by 2002:a05:600c:3ba1:b0:475:dd89:acb with SMTP id 5b1f17b1804b1-477c11160cdmr208580595e9.22.1764175754645;
        Wed, 26 Nov 2025 08:49:14 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:544e:b6f5:116d:4a8c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790add5b80sm55848625e9.6.2025.11.26.08.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 08:49:13 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/2] gpio: shared: fix some corner cases
Date: Wed, 26 Nov 2025 17:49:04 +0100
Message-Id: <20251126-gpio-shared-fixes-v1-0-18309c0e87b5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIAvJ2kC/x3LTQqAIBBA4avIrBtQ+8G6SrSwGnU2JQ5EEN09a
 fnxeA8IFSaBST1Q6GLh86gwjYIt+SMS8l4NVtveGDtgzHyiJF9ox8A3CWqn/dqOtnNtgPrlQn+
 o27y87we+wSQwYwAAAA==
X-Change-ID: 20251126-gpio-shared-fixes-080ab392483f
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Jon Hunter <jonathanh@nvidia.com>, Cosmin Tanislav <demonsingur@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=597;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=0qXyibuX4g5zQ/P/1+2rlC4fT1wR+Wbz6OJo6uSU9CE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpJy+EPLFRNZ1lcg/jCI2T58+w9Gz2nGGQ7Cj+d
 MiwlprdIsWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaScvhAAKCRAFnS7L/zaE
 w+omD/4s+LEfxdwmBhTySp/WsqjZxOluWBFGU2VuI58DdPErYPjuFaOryP2QGdwVnDSsthAcldc
 alLor19DOloL/vQVOJ/m8eBw6fmX2nUXfmV802+zuHl3qkuRTl0R2HnawbdQoS16+uu6WvQQJhK
 T3XxzpirL5Mt86MydqCz0d4uro4wfX59zPBpyLlQf1Lme6CQBuSqZDo+2+bOHmmw5qCa9UcGTkg
 hPeOq+ihQN0b0sRAnrvp67tUjzH7p6FiAuIKnhE8sIkc3AkRd2aqaMyzg6WZ/IDUv+PxS4F3QUi
 blSRV2FgIwx3ZvA9sWwpEJ3tnNV+Y+1EgT9Lm/38RZpricGxthK7bah2S4yGP0Mjonu9+aeOcIM
 y/3we61J0QwGJlYvFwtGNrKFkig5i9l+Oq7BiwF11ZCztJuexgydVhkhRimdrAVNxjWg0wHMLVX
 8DcSJv1/Y/X7ook996ONep/jZlrsiYLJAQgF10Q5YKXc4WHYpNlT4YF4fqKQFcdTjxIhmJpl/e3
 L2ca4dxUfc29MlBkcbSIWE+LiC3o0u+63AQZfSB3I0HM/sdnsuEUbHnQdduDHkFeQ9F87645wJ8
 uwxTMcF+eWPIJELZ5Bxg7rIeduFZP2cC3P7YCbG4jumSV1dI51x3pBAxuZPbAxwgNNOlNQUGzkV
 7kmFzFb0AgN+qgQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Here are fixes for two more bugs reported in linux-next.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (2):
      gpio: shared: ignore special __symbols__ node when traversing device tree
      gpio: shared: ignore GPIO hogs when traversing the device tree

 drivers/gpio/gpiolib-shared.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
---
base-commit: 3fc91e5912eb3761d7b19e6ee8eb92749e856316
change-id: 20251126-gpio-shared-fixes-080ab392483f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


