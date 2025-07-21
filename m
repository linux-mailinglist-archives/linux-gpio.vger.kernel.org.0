Return-Path: <linux-gpio+bounces-23566-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 530FFB0BDE6
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 09:42:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70EDA170EB8
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 07:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0002284674;
	Mon, 21 Jul 2025 07:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Jnvjwvn5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D313283FE8
	for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 07:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753083734; cv=none; b=BhiJlRQpoXWxBALzVTgci4vx+AwLYabgxBtJkML8hoUAd3u+dyWuCw9iFwpdZnMxXmfhwZ4N+0Uw7JARtrGcoAIf3yv1j66IrVllURF0Qj5m8xr7WI7D9QXWlEIzcFGNI8mxvkOxp4w1ZWdL0yEj4FMdBR4XGpnnVQzrBX2HePc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753083734; c=relaxed/simple;
	bh=hO77kVPtYzgzwYFVm/RQZpr9GQQUnG4D61XyvKSHbu8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=My/loGuqTIfJevYv6TaBszI/ylC/qFvLq43Q7P2jdZMKtWQN5PiycF3pWaDDWLtVSgW1Xp9ufCiRDFvIgqPWaNpjDMqrY66I2kYFKxGRlZ5RmysA+QeLAQm7v6paeabHGCt52Q5I1sL2wMlXW45ipCOYMyr69kn5cw3ZBKeSXH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Jnvjwvn5; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4560add6cd2so32257775e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 00:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753083730; x=1753688530; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tW5J4heJMzz68xajJX+1Ssr0sFF6tAYWD7ANrym35HY=;
        b=Jnvjwvn5Xmx2mOvQ31XB8kgQv+IfWb9KGYAqrvoJVuCtXjBTHc+McIljzvk/0Cvlpb
         /sR7Xdy7ybbLPWILGK4+lDbWT3/KEpTqMBkoqu20oO8j3SDr1kj8c8Rao4XRKCvYqMvg
         hTeivvHwiW6ZgtI2+PtCxrmeo0EQg3DjToc8ZAamPWL0w8dwN0GyDk6Jw1xNOjMZaUMP
         mXW4oEpdPoX6xOsPDYZkFpHAlUlRAPC+kK6MuNPTqqwPCYLmRv1m/DlXlI8oKAdL6pdW
         wduPqnVppRM/N71L8IdKmd9GmVASLNkvNlGS34Km4/IKHf+o3tq01JWTM6U3ZX/hUIab
         sQ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753083730; x=1753688530;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tW5J4heJMzz68xajJX+1Ssr0sFF6tAYWD7ANrym35HY=;
        b=EUGLkLnfs+FE78kZbNbXZorLpHIE9FXoxlaAt8/4Qcw28TkHnCJCnGrP0oqczTgyen
         OHH9Jh4gXGq7yUqbYQSxqx7ke3+iP+I7cJFW0DaZy76hj6p/laGYVlmkboGdqjwv0uUN
         RmA8UYl4sCpgl/9L+84kktCx/yHn4xI5gplnimX4Wvs0Q5InEosXTBlxOinwcVysNdkU
         UWjTOX0mKI2r1r6z1GyIqt3yV69rijpGd9nVWVTVJL4sXSw4QCld713c+7Tual+aGw+2
         iftP1GQdy2tcaMQ7gxnQNxCNiBZzDvSUg7Zp4I3sy6BvzEFt1MNMAnp0FtO8alPxWjvj
         7APA==
X-Gm-Message-State: AOJu0YzSRHbpQyhdBTkdmD7q+WxmDA+ZkyX3UJdQ7Tz6OzkpeNxEz6qz
	A0dl4+R9ov2joiayhUE3wyHT/5XP4gPdbsNE+7oKQFpS4uyNsfXXhpTDQBT4XyTHGJ3MtZLWwIt
	+y/be
X-Gm-Gg: ASbGncugcYQRVkg/hvfDFwn9S6sTC1/zba5OZ1wUEv6Tti2Tw3AV+WiWcylJLJuY/lk
	WDnM6uuR38kTMpAZjNoq9FQVIe58GQiIn4rqXzUBg4eMtfVwc9XgmBYHgRs77vqwlDeZ5nGEr3f
	amJk+E0PWX6DedPNhHsHpgR0Qtr837q0O60nrkOIHwgoOcMUGNziPoMrGxRKzTLiplozFg0x+0p
	kiHqZb9aNBu7rid0enbCXQr7iTlNp5bETptH2K8j4Koef49UnFLD3bnyc/WJ+1DEwV0ejfY4upY
	BNestZkdgaUEO84omVgKITFtrE0AjF1ZhoHWJBMiojxXE8mtwkNE3dK3T8+QcCA2UJ44KXgTSsh
	PlcXGaQ==
X-Google-Smtp-Source: AGHT+IHJZLjdIKVeTBkSfJlh9ASyk4eHVlZSPHnysov2w48otz974Zoy4pyd3rMV7TWb3eUBti4sRA==
X-Received: by 2002:a05:600c:8b01:b0:456:f22:ca49 with SMTP id 5b1f17b1804b1-4563b8d1413mr98639925e9.0.1753083730632;
        Mon, 21 Jul 2025 00:42:10 -0700 (PDT)
Received: from [192.168.1.187] ([2001:9e8:d58e:7200::35e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4563b5bfa44sm90336215e9.13.2025.07.21.00.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 00:42:10 -0700 (PDT)
From: Erik Wierich <erik@riscstar.com>
Subject: [PATCH libgpiod 0/2] bindings: rust: mark raw constructors as
 unsafe + rename to `from_raw`
Date: Mon, 21 Jul 2025 09:41:52 +0200
Message-Id: <20250721-rust-unsafe-consistency-v1-0-aa1b42ed5983@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEDvfWgC/x3MQQqDMBBG4avIrDugoUXtVUoXMfljB8pEMiot4
 t0buvwW7x1kKAKje3NQwS4mWSu6S0Ph5XUGS6wm17pb27uOy2Yrb2o+gUNWE1uh4csT+gHxmsb
 Bj1TrpSDJ539+0FumeZEc6XmeP+v42vFzAAAA
X-Change-ID: 20250721-rust-unsafe-consistency-be78ed4f98a9
To: Linux-GPIO <linux-gpio@vger.kernel.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Erik Wierich <erik@riscstar.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753083729; l=879;
 i=erik@riscstar.com; s=20250721; h=from:subject:message-id;
 bh=hO77kVPtYzgzwYFVm/RQZpr9GQQUnG4D61XyvKSHbu8=;
 b=UD+ami9iOj1rPa4D8QiZRZXpPvhYaqButmuoFcGw6QXNsbdk/X/36lMb0A31iSLyPDT9zgePD
 4CUv30fsToqAW0aERjjpnGunP4nmXX/5H2KvvdrKP+Ahfo+DxzBFXyE
X-Developer-Key: i=erik@riscstar.com; a=ed25519;
 pk=gjm0pD1JkINoNzvT3vC2WZoAWUld0EyXuhsQ/i5Qz4I=

This is based on top of:
https://lore.kernel.org/linux-gpio/20250720-new-with-settings-crate-v1-1-a51392bd5b13@linaro.org/

Signed-off-by: Erik Wierich <erik@riscstar.com>
---
Erik Wierich (2):
      bindings: rust: mark constructors that take raw pointers unsafe
      bindings: rust: rename constructors that wrap raw objects to `from_raw`

 bindings/rust/libgpiod/src/chip.rs          | 10 ++++++++--
 bindings/rust/libgpiod/src/info_event.rs    |  7 ++++++-
 bindings/rust/libgpiod/src/line_config.rs   |  7 ++++++-
 bindings/rust/libgpiod/src/line_request.rs  |  7 ++++++-
 bindings/rust/libgpiod/src/line_settings.rs | 10 +++++++++-
 5 files changed, 35 insertions(+), 6 deletions(-)
---
base-commit: ec1a9986dce755a96780e1c9c3a3b1b0227061bc
change-id: 20250721-rust-unsafe-consistency-be78ed4f98a9

Best regards,
-- 
Erik Wierich <erik@riscstar.com>


