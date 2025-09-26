Return-Path: <linux-gpio+bounces-26633-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D8FBA4404
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 16:38:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2E5018856A0
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 14:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C51A1E32A3;
	Fri, 26 Sep 2025 14:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sk0QV1Ou"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2341F1317
	for <linux-gpio@vger.kernel.org>; Fri, 26 Sep 2025 14:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758897359; cv=none; b=uU6uCYkQq699NKDQ6skpd78BYqzYKGRSWyIYOtxVHbDbK29r/b+kF+XGD+ZBkYmV3bG51jFTv8nnjL5E1Id8Fo7ZbSRHRAo12GbC7+ooLFXnm4MyZ+Uo/J9Di/ldUJdZFT68+lJYefzxbpHLgF1/pMeQAvEns2FtASdaN4cm+as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758897359; c=relaxed/simple;
	bh=BWI+M/wP2SHjOLtcfWfwHhOWGF23U1trJevVZtVlsfE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kJUGae5Ni6DE+PK3ANhalaqyKZ5q8gfhfYouk+bAeOL6gz/Jl/Pw9cB8bXYt+OdLru3UHWU0qqha4GhgERSxog7DL2qybtlzr8BWKcj36ygaLJjfX8cFrpoeU0s3uAHtTL0+s7NbjLL1c26DJT48+zQU8KLO6ZeFVe/dmC0odi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sk0QV1Ou; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3ee1221ceaaso1604694f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 26 Sep 2025 07:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758897355; x=1759502155; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s+nOab2uWIpmKBSJoh6F6+B5SlltfFAMkPKtIdCCWUc=;
        b=sk0QV1Ou1hj7GVYSsBP/YjNt/rWq6h/I/0qa9cKq5ADsClze5BRA23cNM+OMwmUf0i
         X4hWVanu/MePVAeODkZuiDEO5ZkhvHrq1ioykYACX5wPqKp++s5l2UReqgvhCzU2ZJT4
         bd3k8oLyAr6evhLlbiZYXCp4zJGQ0JySV4h7WCILnFnSk+QbztdBID/h3xVmbtknanWf
         n8YSRNfgzUllQXFEG4RWVD/y7zk36w919pXXnz+jD2ODQRHB8wJCN4AuqtgLCRguUA4m
         cjuNZvb0Cj0KoB/291ptHbBvY3aD0kMgDZ4J1v11433JY2MECA5K4NvE8ncG7q7dMWDN
         tEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758897355; x=1759502155;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s+nOab2uWIpmKBSJoh6F6+B5SlltfFAMkPKtIdCCWUc=;
        b=B5K66drHzrY0eysWl9oy8o/kfr6tev7Pa16Wz7GRFpOsSiPyY5mAQvrrAdrIf96vSM
         avYeJX4m+G9OilKMEDm+TIqHp159j+HvgtjPYv9r6J4z57QRVG7F1WNlf05eqKWb4h7H
         Nfig7G5dvBJIcYzwgdwdSeHfLpJ0ZTPoAuZcV/4AdFTzaqyhBwK7cTWgxAFzCa5fJYpK
         aANHtL5vH/BEpWd7uzD+QXa094udqGIgUjCGjgmf8EN17d7jNulW39cyRoBl+0YsPprS
         kO49X8RjFJFP0MYm2UY8/cZDXURLN/opZGZzWaCYrgUoqspT+lxbdhoaaZ64Arhswigx
         QFvg==
X-Gm-Message-State: AOJu0YzEMZhlmDYjqd358dSQOkLZ5v6o92oksu1eaMl2hht6pPC2PJsG
	Gg8bcvGJdra1FK83zQ0UeAfHSghcxlX7jNNirkV2IirdXe947cEUkA9lNg2RHaaD2kaHVj9U3xb
	h0WyJcTI=
X-Gm-Gg: ASbGncsA6sGK4POjtYF+gOdo5mdaza4Y4wpAAz5vDFta81EqpthQmOwTWIzdopxGoun
	2eu2NWlrFku/VE+tergoH4yMIEPLvEFnwt9L/FZEvQqsAe20S5b02X6GttssFYo/IN5roTFShBQ
	LPDSKNa40Trg05RPb5p1H9lfjrsGN86Imw6+pGlw1qn9nMsqzL4naA2o0MTa7vvL3m9F6O7wpau
	qkrmFZCKM0hTkMdkj/mPUulYmG0qKu21sai5nKuzCc3ts4mPHfhOfM3ndpDpqmwAlz4vJzUeNTW
	Cey3LxicFIw3SuQgVeAZAYJ7ispfwc6CFmPEXfG2sFd22G7KVAXxvIcoeEn24weUzf4FnUWry1+
	TP2XYE9aye9+TrCBk
X-Google-Smtp-Source: AGHT+IFxXuKijCqa4jzN0oXmMj0y37YA9FBWoQw82u2guoUHggrRHQeLdPUNOPIadGDmaHckg6RJOA==
X-Received: by 2002:a05:6000:1787:b0:3c8:7fbf:2d6d with SMTP id ffacd0b85a97d-40e4cc6316amr6252564f8f.50.1758897354556;
        Fri, 26 Sep 2025 07:35:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ab15:a65:aecd:6def])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc92491efsm7515317f8f.62.2025.09.26.07.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 07:35:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH libgpiod 0/3] bindings: rust: pre-release tweaks
Date: Fri, 26 Sep 2025 16:35:41 +0200
Message-Id: <20250926-rust-release-tweaks-v1-0-beae932eb691@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL2k1mgC/x3MQQqDQAxG4atI1gbGQRf2KuIiOr82VFQSbQvi3
 Tt0+S3eu8hhCqdHcZHhra7bmlGVBY1PWWewpmyKITahjQ3b6QcbFoiDjw/k5ZwqaethShLGmnK
 5Gyb9/q8dLTrMu26J+vv+AQaCn8BvAAAA
X-Change-ID: 20250925-rust-release-tweaks-d1a94bfda0c4
To: Erik Wierich <erik@riscstar.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3055;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=BWI+M/wP2SHjOLtcfWfwHhOWGF23U1trJevVZtVlsfE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo1qTFaNevHBMTQS0gvfWE0xcEyo/n3VDa11mAk
 +qEK7zzfxSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaNakxQAKCRARpy6gFHHX
 ctzdD/9LQ9xgG1R0/haj2oMScmmpDLbfMJxvHYthMwmMz2bzeuwthGhfO6XzGISmG8EVVE63xoe
 zWZPJm2Axp/OzczxAeM8c45An3EAwlDl9sFSsZurltkih5ZO0keTcjx54R5Yhges2C0c4YoHVxo
 Fh4TFRci/Yj8QPKBkVUx1fgEBYvAyUrs3qkwRvD4Oh3ViXJRhdAcYhaLRju24D2nmykK6IsGIrY
 uQVmw69PkuEAHUoMPy0lkG6fIeMAuaTf/9ketC8ArQqfay2ejqMrniigjpQHRGwri3/icWlYP44
 DrrKzykFz52DO/LWYnLM2cJpz7KGPKPLyK6+j67t1xP8T0k5H19s7hxkukOfIlwbjDug021AABz
 DVmdTH2PlWFb7Ti76fSMeBcoX9Rm1LQ9w6Sw1g7xJEp7exLH/tBiOVYVM6VZ+FYd6IKQAnMWWa+
 OtVuLhwTflTofwBBiNOT/A/oWpYXb82Ug/d24I9SXk9bc/MKLm6qp6K+gWbjGp1t8yR0cYpViKf
 9ZgjRw1fBPYhIqZcAdqg8CbTjBTBj45HQ1DthbKDbqY6qRwrSfFRV+MZnHDCN6cdd5yKF6Ed5+/
 Kplhp+DvUtBX/9qYKWJ2Zuoifv4xCqjCMwJXfUPerIouqe94OfWg8Bl/KthiwOYdlW8+h96JWQz
 eUSVe8jqrbYqMcw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Here are some final tweaks before I do the 1.0.0 release of libgpiod
rust crates. The first patch completes what I though I already did last
time when updating the examples but I must have borked. The second patch
just runs `rustfmt --edition 2024` on all source files. Finally the last
patch adds some examples to the readme so that the landing page on
crates.io already shows how to use the code.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (3):
      bindings: rust: complete the unification of exports in examples
      bindings: rust: update formatting to --edition 2024
      bindings: rust: add examples to the README.md in the libgpiod crate

 bindings/rust/gpiosim-sys/src/lib.rs               |   2 +-
 bindings/rust/gpiosim-sys/src/sim.rs               |   2 +-
 bindings/rust/libgpiod/README.md                   |  78 ++++++++++++++
 .../libgpiod/examples/buffered_event_lifetimes.rs  |   2 +-
 .../rust/libgpiod/examples/find_line_by_name.rs    |   2 +-
 bindings/rust/libgpiod/examples/get_chip_info.rs   |   2 +-
 bindings/rust/libgpiod/examples/get_line_info.rs   |   2 +-
 bindings/rust/libgpiod/examples/get_line_value.rs  |   2 +-
 .../libgpiod/examples/get_multiple_line_values.rs  |   2 +-
 .../examples/reconfigure_input_to_output.rs        |   2 +-
 .../rust/libgpiod/examples/toggle_line_value.rs    |  17 +--
 .../examples/toggle_multiple_line_values.rs        |  17 +--
 bindings/rust/libgpiod/examples/watch_line_info.rs |   2 +-
 .../rust/libgpiod/examples/watch_line_rising.rs    |  23 ++--
 .../rust/libgpiod/examples/watch_line_value.rs     |  25 +++--
 .../examples/watch_multiple_line_values.rs         |  18 ++--
 bindings/rust/libgpiod/src/chip.rs                 |   4 +-
 bindings/rust/libgpiod/src/edge_event.rs           |   3 +-
 bindings/rust/libgpiod/src/event_buffer.rs         |   3 +-
 bindings/rust/libgpiod/src/info_event.rs           |   3 +-
 bindings/rust/libgpiod/src/lib.rs                  |   2 +-
 bindings/rust/libgpiod/src/line_config.rs          |   3 +-
 bindings/rust/libgpiod/src/line_info.rs            |   3 +-
 bindings/rust/libgpiod/src/line_request.rs         |   4 +-
 bindings/rust/libgpiod/src/line_settings.rs        |   3 +-
 bindings/rust/libgpiod/src/request_config.rs       |   2 +-
 bindings/rust/libgpiod/tests/chip.rs               |   2 +-
 bindings/rust/libgpiod/tests/common/config.rs      |   3 +-
 bindings/rust/libgpiod/tests/edge_event.rs         | 120 ++++++++++++---------
 bindings/rust/libgpiod/tests/info_event.rs         |  58 +++++-----
 bindings/rust/libgpiod/tests/line_info.rs          |   2 +-
 bindings/rust/libgpiod/tests/line_request.rs       |  12 ++-
 bindings/rust/libgpiod/tests/request_config.rs     |   2 +-
 33 files changed, 276 insertions(+), 151 deletions(-)
---
base-commit: 97ee30872853b2c9fbb448240012909d985f2e19
change-id: 20250925-rust-release-tweaks-d1a94bfda0c4

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


