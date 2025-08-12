Return-Path: <linux-gpio+bounces-24274-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A57CB2265A
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 14:10:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D37E1B62448
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 12:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B98C2EE289;
	Tue, 12 Aug 2025 12:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UrCTOq63"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABBC1E5B64
	for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 12:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755000649; cv=none; b=YbJg0wSXAeJPRZvXYrEnxBMLXnRi8O8/Qi4iYU4lrE7SfsN/MC6IvaKz30iyK32/3CnvTQ+IgGk1ZqmO0zeSVI2NbbQlT0i1Fl3LlNwYuuwL6IoNyvAwyDZNj3FZW4QUChKwY7X11lM5lakHwGL5Au/Z4DzQwaw7Z6YpGtON7Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755000649; c=relaxed/simple;
	bh=+uZnII69G7exfF0EkgUg788HCmYZwnIjwbogADyfu2A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PE1NeA0VCu54ZgVJmNCBhhpfNZ+VeZxXxAqXm7n188Si8Z2+Z1td1l2iM6i375vVMRsnST7xK/k7cUQgQH10cXJ1E5HaROCG+o6rPHSbuiuL7eylHQYmbDYJOsqsEXgZY8G8hgXpoHsuDXI90KzQUi6FguJfDPaK+yYhLlg9/2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UrCTOq63; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3b79bdc9a7dso3273168f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 05:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755000644; x=1755605444; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YwQiBqpf9JoZt+fgILn0+SP0zsZZwzib60rG+OcAdlY=;
        b=UrCTOq63sn4+VyElxGf7bPPkqTea50K+ptYeHqM3Uiszw838uNkPrRe79TCW4E1BMb
         jHdhC06iByjGs/TaF7L8v2qIP2hjgOgtz6U7s5rkhMpfAfbd5DIEaMUTOYdX4LI0GTkr
         0heF8JsBc3mMr8SOiDLxmR6D7EIEdtGEZsvjterA9P0zvoasIk1mgxIzcTQfpZPTClau
         br+mbcljhNDWRK/AGArhmQ0afR9JliTz6weW6/iMudJ+XdZGXJ2i5rt+IbQ24ixouJQB
         dcBtt94CP9zVB8aG3tUMF60QfHeJEg3S4noVhpvMEg8pdifwfY0QmllQ3zIws+js1lG6
         0cwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755000644; x=1755605444;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YwQiBqpf9JoZt+fgILn0+SP0zsZZwzib60rG+OcAdlY=;
        b=EwCVg6/niFlqTd4d7ApWezEW46xbdxHX0+jc/2IFnxsgNeOmliD2OepnAulxm4QwmV
         qxdfbjpT/Mwh0NbuvK7oSfzzvmAu+PaNQkjJfwIQ5uVhPiibNoW/14SOt9tGsyfeBZRF
         EzkIVV1Pa2kKYVABu3bUK3csU6uaCjeXVKx+yP8+ndkHcXNHy6X6gqE+6g1TH+oGfV5U
         wv08dFRKjGLg3qrFEtDEBPsoq0s8qt+InFEMc+iSllzrhD6SO0wOH31LazKJvMFb0r6U
         lmaKg3n7iLC9lqC/1j9MHQFXhEMGbwgId9ammZIduAVziGlF2dkJe0lrsHHsn3aBrHA+
         cw4g==
X-Gm-Message-State: AOJu0YzGfW5KsEaGN1cC+zqkt/izSoW4oSkIjfnorcDb8Rc0eqCEhplY
	Do7rOdy93TMm8R54Ue4gZylMxdCXbfhrawwRxdNnlmoWRfmxpeJobXQNH52TkhzfGUg=
X-Gm-Gg: ASbGncsQNEki1e7Q1p09/llT/JNG4bWLuU7N84lTSJjbMPhY7UdldAb5g8U3vVXuN+M
	pUw/2F8qhS0GVH4AUdkKjf0GnhoFaOo10012RscGPpwiE9ripeTs6YHhB2YMqr9r+O82fEO/hSt
	OxM4x/c4hNSfvfUt80r6OAHPTv7r8yIGyXaXiBTW5xiZqFSoCq3CQlWdTs+xu+fpiKlDxai/fLH
	1sCBQfN14BAwVHwvpczALzqYdjghbbMLQaYWcw5YRqJdVnV/apIvet4dBVo9e4L30PTaEFlusu9
	B8HWNWQC6ulyYQrWzmxmorljvnr3rgT+i10LpIyfmL+ppgX1bZy2p+2p+dZYoN2zrgdAYs2wCGe
	IVgT+xmFyHyi9FVjuZSEyHWQFnw==
X-Google-Smtp-Source: AGHT+IGJC50rN4jfkVFSrPT/RqCdsK+ZR34XzrWUSMnoX/0FBBZartYIvscSbG1Mc4Fsr2G3aOcyvQ==
X-Received: by 2002:a5d:5f4d:0:b0:3b7:9546:a0e8 with SMTP id ffacd0b85a97d-3b900b7aecbmr13909506f8f.41.1755000644427;
        Tue, 12 Aug 2025 05:10:44 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8e1cb7deesm34268788f8f.2.2025.08.12.05.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 05:10:44 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH libgpiod 00/10] bindings: rust: prepare v1.0.0 release
Date: Tue, 12 Aug 2025 14:10:30 +0200
Message-Id: <20250812-rust-1-0-0-release-v1-0-372d698f23e8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADYvm2gC/x2MSwqDQBAFryK9TkPP+Il4lZCFnxfTICrdRgTx7
 g6hVrWoOslhCqcmO8mwq+syJwmPjPpvO49gHZJTlFhKHQLbzzcOLAnDhNbBVZkXsZKnFAJK4Wr
 46PGfvmjSblx1Geh9XTf7fy3LbgAAAA==
X-Change-ID: 20250811-rust-1-0-0-release-65342607040e
To: Viresh Kumar <viresh.kumar@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Erik Wierich <erik@riscstar.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1789;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=+uZnII69G7exfF0EkgUg788HCmYZwnIjwbogADyfu2A=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomy890zgLUfQlQ/8TWfzJFsS+ytrSW5xY51eKE
 8yoCanaRnyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsvPQAKCRARpy6gFHHX
 ch/oD/9EXwWscxtTaLV95XVOY4akOoHMS6nClfY2YZFw3eDJ7WJfM1887t3//cC2Eac2qdczlxQ
 8vb7BwQOCKdMYoEQ/tC0Ozx2jgdRpEPAKLzrqe5MshaZEsqUPoMPVGYPiSnAMpIusCqJeaKzrrg
 NnYXjtw/N5I/IE7/muvqleBOiWSC/6UuRwipnpwj10QcQzB3oGYbYyZMlbLdGWd3uGPxUbCLH49
 qCvT4yQnpPjoOa0JzRu3liEIraRsMBZQZxOtNJ+rVvUwD85h89Xm2MCdQnAA4Pdp2lHySAQOKGw
 OQuKdy9EkkO5CYN/9yEfwWbFHqnDf8+2CrbGwUeOeh0nPf0oFJMmdiYZg5q8Og8AV+YFlmP+Hf/
 qS/NtCF0O8IpKbRsC5KTua7vF3ErxfpCdt6AhfNIjQVMyV1YJkp438I1aF/kgbGvFTN5vEf+Q0B
 /Cdyebc56nJejEGuWhxO5qdWfaPeK47Lm6p73nGk5R18L0/Kn3D+D5LCGbqDq3001dOhajfdYCf
 cagZRNu0yHClo2RuaFAA56wMFzCeVuio7UMAz15gqtc9580tjjQJmsW7JbxV/IcfgOPCalItquT
 l7c1Uvfd8oj8TCLdvqGjf8slkigz6Bq/paRu2U92mxmP0yhBrmcsUDzdDIw+HIysiXTLWNht+nr
 ZCPmb7rzFhVGo7g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

The libgpiod rust bindings interface has stayed quite stable over the
last months so it's time for it to stop being a v0.x release and become
officially carved in stone. Bump dependencies and rust version to the
most recent versions available, fix some issues and then bump versions
of the crates ahead of the official release.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (10):
      bindings: rust: make Buffer::read_edge_events() lifetimes more explicit
      bindings: rust: add missing unsafe block ahead of rust version bump
      bindings: rust: update bindgen dependency
      bindings: rust: update errno dependency
      bindings: rust: update cc dependency
      bindings: rust: update system-deps dependency
      bindings: rust: update thiserror dependency
      bindings: rust: update intmap dependency
      bindings: rust: update rust version
      bindings: rust: update crate versions to v1.0.0

 bindings/rust/gpiosim-sys/Cargo.toml       |  8 ++++----
 bindings/rust/gpiosim-sys/build.rs         |  2 +-
 bindings/rust/libgpiod-sys/Cargo.toml      | 10 +++++-----
 bindings/rust/libgpiod-sys/build.rs        |  6 +++---
 bindings/rust/libgpiod/Cargo.toml          | 14 +++++++-------
 bindings/rust/libgpiod/src/event_buffer.rs |  2 +-
 bindings/rust/libgpiod/src/lib.rs          |  4 ++--
 bindings/rust/libgpiod/src/line_config.rs  |  2 +-
 bindings/rust/libgpiod/src/line_info.rs    |  2 +-
 bindings/rust/libgpiod/src/line_request.rs |  4 ++--
 10 files changed, 27 insertions(+), 27 deletions(-)
---
base-commit: cd32f27dd550753488bff4918aef4e230ce01512
change-id: 20250811-rust-1-0-0-release-65342607040e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


