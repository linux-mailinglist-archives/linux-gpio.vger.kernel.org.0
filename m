Return-Path: <linux-gpio+bounces-25136-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACA8B3A880
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 19:43:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4A633BD217
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 17:43:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06AD833A031;
	Thu, 28 Aug 2025 17:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="eHy4YRGd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF7A257831
	for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 17:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756402995; cv=none; b=bqOTGOi0jNxcVoqax5HFdbYI1ysEjLfcU34ksBCkwLGomPU/kOgZAztsjRjVcyxDt89+YMYqKW99/Es5Xn8zflmiGN8kr89cwEu0F7y8JHdqgRDTDEhe5e7JZ4GIirjCOpBuQ3pNDq+vQCYBTeSbtaJmz2LiCQKt5sTmu+fSRXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756402995; c=relaxed/simple;
	bh=4IlHy3KnPGIue3r/NBeKeBP95YpYxgltEGZ+hQv8gcg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SXS6rODXxNedqW/UYJLjsqdHzMvIB//fpQOjIqvjEUeKkqFogK++qKEXBXG5p5pQT1gJQckuXl4uN74tIiEuv5I41SVMJJS38BLhDQTpP4b60UhyUG1z6y93PwMhQFsyjeE7TIi1JZqRmdx805w1ldVfYE1C42amni/0VUydWMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=eHy4YRGd; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45b7c01a8c1so7215775e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 10:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756402991; x=1757007791; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=26B6z+HPxKQuBUM0jDAltBuzbAAx+EjPMnoHFkMFMVw=;
        b=eHy4YRGdODJPOH5TFlk/Ot9GzjT7Jlb/stT+7/6Ly4qI1VOtMp4w+a7rOPk1S9zcuK
         vn078IMLKALMqlcKmtcOd9CONmfN4eHiraC56h+n1SQYeF6NenUehFONU2R7oPgHx6wE
         OnpfTVq3kRVR8XvVbCXomiciQYZGzvzAGn3HiJBsT2B/nXgnlDfqkjinvRHn4rRX3PC+
         ak/uAbTpRgPHS5RNpJ8LKL7BxJpQ2Ouy12aJ8kNsXOrTKaICyjTdvSOlyEGMPzF1lKqZ
         gTjlng0PgW5pP9GDHF/DVTrcoZQhkD8pOx5PIjywWhoO78N1CZ/g0/jpXpiuNKx7U8Z+
         qUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756402991; x=1757007791;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=26B6z+HPxKQuBUM0jDAltBuzbAAx+EjPMnoHFkMFMVw=;
        b=ezDO9XZiHgk42EvhZ9GTj2tiDbgLmq/a1GHeainPjfx9Vp2lf5c/FLDvyQWxcJJxhS
         3XFpl83hzfyXT21O9V0BG2vzh73vIrxQvfnGme5cZGowbZ7EZ3WtTDuuqTsrrJb98tMc
         jmFiL+vp5MX+au/5zPRJKqVY/TbUdzotD7+JeHoDmSTUslqbQo5QCUq+WPPKe9uTS/UG
         klfIzPQq4IzsjZ3aeZc3p6NUgTJS0nipsoBZENE1bLloiiWlxVxbR40Eas47r7KiNVAY
         XHu4xqSNDRhVh09j/Pn4wJUKJUDjzBq60tyZsyJXmHGIppc6ZdIWJIDku1PZ9eYpGaUf
         cQXw==
X-Gm-Message-State: AOJu0Yz5ZFIWj2Os1RsO4mQ/H6gzuVCsFiA8mrSjk/yf9y/O4j5ITo1f
	Po83fo6rXUevpx0pwikrST1DGSLlzj13Zd/j5CCJVc3o9ehqhDfOLu587UaXvhGqSFk=
X-Gm-Gg: ASbGnctvWcqYdD6vV3VBp2MzUWZEF5is2+R9A46Oce8/+cVRMJVIoEHTO/ILix9wqBD
	PIuo9EtcREWTbeyHNHtiXOHBjA3+BEBvfMWBQtPqp+jRhQQQK7002cjHzkEK7VYCqvNVleP7h/s
	l3C/8TrH9xkWutfQIZS+BkoHeR2qnCTQeH0kBds4O+tp7kk/FbRl2eaEtlkvZWjNqNuAw1YxOeC
	z3RvHbU+TOIRgbDxmELTMHRV8ko7zeq/MmcWtpKCWRVoowr+LcSXePw5J+rlwuAWcvV60DUZmgS
	vRVTSbuqny+F0/BS9/KTOB1O+7duM3dT9Bhk5Hyiir3Ss/LmHOXdKiD7ZZobP3NFk/PHpT2etWb
	L5pSTUr+njyzxuEDy5g==
X-Google-Smtp-Source: AGHT+IEFn6/gzyXyD3UURLRTsxdkR4VdDHiY8WnOpB8hlgggILgVixqfibH779OEa3DzZnm6J9BOaQ==
X-Received: by 2002:a05:600c:4fcd:b0:45b:47e1:f5fe with SMTP id 5b1f17b1804b1-45b517db94dmr178653235e9.34.1756402991110;
        Thu, 28 Aug 2025 10:43:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4933:4d7c:cf69:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e7d2393sm3812075e9.3.2025.08.28.10.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 10:43:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH libgpiod v3 00/10] bindings: rust: prepare v1.0.0 release
Date: Thu, 28 Aug 2025 19:43:02 +0200
Message-Id: <20250828-rust-1-0-0-release-v3-0-0f9c6c1c4808@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACaVsGgC/23NzQqDMAzA8VeRntfRpvVrp73H2MFq1IBYaV3ZE
 N99XdlhA8npT8gvG/PoCD27ZBtzGMiTnWOoU8basZkH5NTFZiAgF5WU3D38yiUXcRxO2HjkRa4
 0FKIUWiCLh4vDnp4JvbGJzLCQ7dg9bkbyq3Wv9C3ItP/CcASHT6oSuqKuelBYXSeaG2fP1g3JC
 /Br5IcGxDCyrHVrtKkN/hn7vr8B14wXNAMBAAA=
X-Change-ID: 20250811-rust-1-0-0-release-65342607040e
To: Viresh Kumar <viresh.kumar@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Erik Wierich <erik@riscstar.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2355;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=4IlHy3KnPGIue3r/NBeKeBP95YpYxgltEGZ+hQv8gcg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBosJUozb4QNOOWTQ6JjUrpUJCLTvKvBreXWHr/4
 7bluw1E6reJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLCVKAAKCRARpy6gFHHX
 cpR0D/9eOOqWRgaFxTVD1yRF34JvcCM/vLk8YXIDHZbbFd69pU6Zv0hZtqqWFcfd7Vp0tNxOi4c
 vRusq1gFJC/KIMJ9AtKhJSdV7bXOx7qyuI/wZ2L/xC8/hMfnR99AJ+4b/mu6UNLs45sRY1Lj3Z8
 Sba6IwWYr8bz17fk+CJ0upYK1HWban2O4N51meVwh2IQ7IIXGhBPIrrgRl77S89abdz4B18/06H
 rTtaTa/f7qLl961vNwMP9nxKWcj4qGZzHH7LrMgs+8EjdVwDVFz8o321nTwpuocLAnQKjs2bVLt
 FzAb35OAf6hKj6EmthLu5w7awGluDAKdZpvGDdI15OkMW6583eAPQRGHyXJZ+AFeagGCtArIuvL
 24ek7km8F6H7YHwlCS7DPmWKzVtRrxuu/4Dc76Y6Vmcm4uqzBoVIJAh6ARHrJTTamMVQhoy2SVT
 Y37ar15SH8m6ltCo/3jTyUUonF0hFmv3yMWpLDdQ/4XqoS8cVA5n5MCH4GGZrQr08KOVYMzQ2yT
 GSTqGdd+al4+N8PupXMC1UQvMZv0BBoybtMXBJ0Vgyx0GWvfRgESVa25ZeKyY7G2SKSkxm/81In
 TTwnm6BLgJdXH533/LIZpQ0UmN1k1SEw9anLDpJbFIwE6zlpd8dKy0VY38tmsE/GAKSfL6Q9Y6B
 0dIusP2fHNtqM/g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

The libgpiod rust bindings interface has stayed quite stable over the
last months so it's time for it to stop being a v0.x release and become
officially carved in stone. Bump dependencies to the most recent versions
available, fix some issues and then bump versions of the crates ahead of
the official release.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v3:
- Bump the minimum required rustc version to v1.78 after all to satisfy
  more recent versions of bindgen and system-deps
- Link to v2: https://lore.kernel.org/r/20250815-rust-1-0-0-release-v2-0-b1794cb4b9be@linaro.org

Changes in v2:
- drop the patch bumping the minimum required rust version
- loosen the requirements on the dependency versions: specify only the
  major number for stable crates and the major.minor for unstable ones
- Link to v1: https://lore.kernel.org/r/20250812-rust-1-0-0-release-v1-0-372d698f23e8@linaro.org

---
Bartosz Golaszewski (10):
      bindings: rust: make Buffer::read_edge_events() lifetimes more explicit
      bindings: rust: add missing unsafe block ahead of rust version bump
      bindings: rust: bump the minimum required rustc version
      bindings: rust: update bindgen dependency
      bindings: rust: update errno dependency
      bindings: rust: update cc dependency
      bindings: rust: update system-deps dependency
      bindings: rust: update thiserror dependency
      bindings: rust: update intmap dependency
      bindings: rust: update crate versions to v1.0.0

 bindings/rust/gpiosim-sys/Cargo.toml       | 10 +++++-----
 bindings/rust/gpiosim-sys/build.rs         |  2 +-
 bindings/rust/libgpiod-sys/Cargo.toml      |  8 ++++----
 bindings/rust/libgpiod-sys/build.rs        |  6 +++---
 bindings/rust/libgpiod/Cargo.toml          | 12 ++++++------
 bindings/rust/libgpiod/src/event_buffer.rs |  2 +-
 bindings/rust/libgpiod/src/lib.rs          |  4 ++--
 bindings/rust/libgpiod/src/line_config.rs  |  2 +-
 bindings/rust/libgpiod/src/line_info.rs    |  2 +-
 bindings/rust/libgpiod/src/line_request.rs |  4 ++--
 10 files changed, 26 insertions(+), 26 deletions(-)
---
base-commit: cd32f27dd550753488bff4918aef4e230ce01512
change-id: 20250811-rust-1-0-0-release-65342607040e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


