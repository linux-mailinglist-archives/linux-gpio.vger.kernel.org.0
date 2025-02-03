Return-Path: <linux-gpio+bounces-15275-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA32A25AD1
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 14:25:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FDA31881AF6
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 13:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17BF3204F96;
	Mon,  3 Feb 2025 13:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EbW2ULbl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C95204F78
	for <linux-gpio@vger.kernel.org>; Mon,  3 Feb 2025 13:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738589136; cv=none; b=UoxIUeQvBbmfcEXtLbEB8XpQ/x5QN2affQ3/Kdm1XTUmFDjUOGX2uf8iEQGmBeLR0q5xprvC8fsj9Ic9aOFH87bHLK0jpEw5A0lN6Qf5Ak2uZQUYvcsLTJVvdf4X0oOZ/10tyyYXwcKrkKgq9AVCI76vtg+zIAAkLMjjk9Li6lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738589136; c=relaxed/simple;
	bh=2t910obnwldBeW7QfTJPLRpiNb0MPLiszYZZ1UfkJ/w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KyE1mnUL0uC+pl4wBFDTfgo/nsY7CFwHVo6lCPwns2YNdSJKMNUyrilmI3/PJA5oCTJWex5GsuIf/SPUOPPiI5RBQpEHd+YvcGAoQszMaVKNZAR6ahUse/2tWcoF3OJfjAP0TVYJiDHgPxxtU0bu9TCWBxFOiqrvHRijVNuMCfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EbW2ULbl; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-385deda28b3so2275936f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Feb 2025 05:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738589133; x=1739193933; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5lxpMjNSz8Ix4DI6q8XKwRnxaGe5mUsNvzQsoZ5OIbE=;
        b=EbW2ULblvY66JHSCqeJWylHpYYJXnRHOnqUO+vPKyUYyD6ORuafNEA83G8ZsWDRvyz
         aoQnTg5XkcpxFiKLoisWsEojGmUrz4Cdp2s18tTGbmvEoO9AAe8/bwPMPZKJ8IexScgW
         Z/t4lj3ESSC7CxFdhvPx3PI6P8f8koHJanGGg+3eh6fmCCZEbJXuR2NoP1gKwTXAKGsd
         3Pn3BHlUVs0lz6RXpgHDKg2aUODk5uFnR43j8It2oWErwutHSNddvah5j7GBV5Rmikpf
         KEXyzX5UH+girkX3XkGeQbVmF10N19u2CXLSxxRKkbWmmC9MvCHUfOqepBsH2HzBeEoT
         4dGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738589133; x=1739193933;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5lxpMjNSz8Ix4DI6q8XKwRnxaGe5mUsNvzQsoZ5OIbE=;
        b=kPX2Nz2HvB4Jzm+sjk4eoYVQbqbdnYCDBMBAuJG0PmGzky7gvy00RssGGkJ0puHcBC
         zEviexzz85TdcVKoVKEq54gSQM0u435Q5zNWbodoCD/VdscINPeh9c+JZN22CFZpj5W1
         /eJRgsKxgnpdUch1sejSvyDNNKACT7jA0PN9gJC+lDeujlPUMcIRWpUUBH2UkOZaXtAi
         MJxJpXIvAPTejoGM9V0vIeWO823KIb2ALslOMJ1SBnK09gIU6/W+oELF+WYmWoWIlell
         /aP1+mov30gSD9pIIIsWHDYpPYBNFs623j7KPxbBKFtaA92fLBLqCuXNGNe41fIWkimY
         0Wfw==
X-Forwarded-Encrypted: i=1; AJvYcCWgU3j33IMoAc84j5RxkGf5NE4INvylVivBCd1YMoFbD0UO523FlqocdPZtR21IJY5WRtstWhWMKyl2@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+GFlsNI4s7BPQ4MleEMJO0386oGz2jh/YqFBAsfwMFGS9GZDs
	kcxl5iz5rl66q4Ru6Y3mz3Is/MQJvv4WWfaulLQU6Et4YNkuzqVFKqGct1C6DH0=
X-Gm-Gg: ASbGnctT3Xe0gEdnUxZUgj/fYrf5KI5Vmx2PUIJN6ya3Rs9yNFgT1Y8v8XONPUf5wO6
	FPWWHnKZmdk/jBVp54vLT+txSHWqmIz/1nYSZXZyUNL35I2k5B0GNCqzkafBhnhIBcFgczJ+WCY
	gooF3Mn2Hw8r7Xdt5QTA0MPn1Q8Oi23Y5x51nFIpJ+WfOyOA0b5qehJYyL+wYdiEbqD5jsF/pZL
	oIKvjloLhyUrnWVawrRcaybEGcL2kJCwdP8joJ+6mZqFKd+trEaT8Kitpvlxkt3fFKiw9LlqOpq
	QTefdC4=
X-Google-Smtp-Source: AGHT+IHUSN5V1JaYJWQZ7cxe7TLily9ybPD/vgROVSwWRFrXHBGuRKVxxI7CRYAKbvNYyBK6UJtiCA==
X-Received: by 2002:a05:6000:1567:b0:38c:5bb2:b91a with SMTP id ffacd0b85a97d-38c5bb2bd03mr11255905f8f.17.1738589132790;
        Mon, 03 Feb 2025 05:25:32 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:62d7:938e:c76:df44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1b547csm12913959f8f.62.2025.02.03.05.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 05:25:32 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH libgpiod 0/3] bindings: fix ordering of releasing of
 gpiosim resources
Date: Mon, 03 Feb 2025 14:25:02 +0100
Message-Id: <20250203-fix-gpiosim-in-bindings-v1-0-d2c9e0f3a29d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK7DoGcC/x2MzQqDMBAGX0X23IUYfw6+ivTQNGv8QFfJQhHEd
 zf1ODAzJ5lkiNFQnZTlB8OmBepXRd/5o0kYsTB55zvnXcMTDk47NsPKUA7QCE3GsQ+tuLae+q6
 hUu9ZivqcR1oQ/k2k93XdyICd13MAAAA=
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
 Koichiro Den <koichiro.den@canonical.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=938;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=2t910obnwldBeW7QfTJPLRpiNb0MPLiszYZZ1UfkJ/w=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnoMPE+cU3jCI+jjlTLIeTamX6SH/WZeEIjnn4d
 FiktDg+VeSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6DDxAAKCRARpy6gFHHX
 cmMlEADIVpHJbt9+IlkVtlopUSvSmTul35HHzXYb4tD+qjeeGMxjgGqj24IQsoBSWl1CvTutI3w
 OY8W9G0oA3zD2wNWRbHiTiVw0GHy2Bd0VUwXzfrPzbE/IE3+pJ0fT8K1GOdiD5b9XbScCa25p4i
 6wHYMFAVeR6HZoj7J6HYmtuybuLAIjwF6P6OkqKghVwPfrW7WMW2Hw3qxgseoMfx+H4C70zCaPu
 rH04V0TGpkgE7OtJUcWMNX2GDy4XpeDSp/hg+d8Qe/Jb3vSWN1dQ0ZsRTUEHISpyZu3sELOWxNK
 zuuLbCrYBVVUwUfJzjU0SnI9yNNEeJwbxVquAWW4PqaVrImMpHLat+qPITuVasY9Zq8D1tojacW
 yuMejBOG40YMqJb+8AdsqexXxYmidMKTqDgJOch+PYBgJTENlkdW/5t6z7PO4xKx7eKqZmIxi3i
 1dGkZvo/YtiLX0NgOt6/JPjBe0WKslKreCgdt+5GsJPKO8d8qEKIUlXahy0tOch3TwrSEzfuikF
 /GnRPCm1yWb1VX2EOb4YW3GfSdW8VaI7utAPaK4Wi6KoAJTpWDc2oS5Hw4y5F9aywmpp2Ldrvbf
 qRig6G70Xz8IPYVzyvWfdNndgfGEM9zJpNOLT9MGk2Nrg/CCxZpn73IvvBn+gnNsq+pnt0aQW16
 lQf6V67ELtpEkqQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Linux kernel commit 8bd76b3d3f3a ("gpio: sim: lock up configfs that an
instantiated device depends on") uncovered resource management issues in
bindings tests (C++, python and rust). This series addresses them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (3):
      bindings: cxx: tests: disable GPIO simulator before releasing it
      bindings: python: tests: disable device before releasing the bank
      bindings: rust: tests: disable device before dropping the resources

 bindings/cxx/tests/gpiosim.cpp       |  2 +-
 bindings/python/tests/gpiosim/ext.c  | 11 ++++++-----
 bindings/rust/gpiosim-sys/src/sim.rs |  6 ++++++
 3 files changed, 13 insertions(+), 6 deletions(-)
---
base-commit: d6457b28e29a8edadcb619d389878ea99cd4bab4
change-id: 20250203-fix-gpiosim-in-bindings-d6b4e041f653

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


