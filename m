Return-Path: <linux-gpio+bounces-20978-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A108CACDB73
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 11:54:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 403B03A4084
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 09:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EC4D28CF53;
	Wed,  4 Jun 2025 09:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="k88xajP2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BBB7082D
	for <linux-gpio@vger.kernel.org>; Wed,  4 Jun 2025 09:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749030848; cv=none; b=DQEl0bDJp/nGKbC0+EjAX2CawClsuNV//FIUmIBztq5npTo7mnMAf3YlbNfLMdVHVm65n/ITk4ZzZgLjqHyOR+5kIAqi7tndgZ3I8fNTFsQSiDBop+AAijenf1SvA9qpPltn2kbEBlnIppEayC2XkIWpTk1qheIumIW+H8WtOxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749030848; c=relaxed/simple;
	bh=uEQ76NlH5lO8kMZwukda4UrTYqvsSsuybGdDVRVBWvQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qDgUz2YxrLWrrQXyBfWI5lztNHq4IH+FN3SWXIL/KppNdp6JF16fSOFm7leSGv5dP5MYVkViQQ0L+jFhDOGxGGn1sKMTg+b1l4n/UvRTblo1P9ktsMeuMFopgox3vBThNo6v5VYCfupTjlnZ78F5Dn2/piTp/rtlXTj1dbP9JhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=k88xajP2; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a366843fa6so3508246f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Jun 2025 02:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749030844; x=1749635644; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kv5CwvHVDzEGSO319Wt7rOhWIYk28Ayfv77Lv6Sbtqo=;
        b=k88xajP2l5xcWeq69jnFTBXJuIeY2mEIwWbSnoHvK6OOuo3Xyu5QtX8jwKQ3zqR11z
         9ciwV6WotG/dSrE2qCfQ+Ohv0Bx8NItkMeD8YhprDGeQqtd59jsTmKLv+ItPENTKGkX3
         KzY0keWZZwYRcVw4WLJSjB3LzqLVpMiMVCiGamZX8znoGJubLW+bply1yTNi3jQ0x3SN
         TDadEnj6yCto8gJpMex4omotKjWLZUjVBE1McYIHJMLyuha7l5RoeIv6Q7Hdl+AkK1As
         RPmj9nr2Ys77MYVkiReT+tJkXbjfgXCRIK7tjYqCpGwYavYgYpHRobksHsVoAQaGBp/0
         PumQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749030844; x=1749635644;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kv5CwvHVDzEGSO319Wt7rOhWIYk28Ayfv77Lv6Sbtqo=;
        b=GchhMqVEZjvW6/pLSq8Eeg/NN9K5cM4WR0zbthZjxAiNMhzBxOaR/GqXipsGsO2Ysk
         0D9Qs19JhM8S6E07hkIgNQr2pR0AhBNN2ZsYg436+MYXcv1QHblqKtue3iuLcLlbMlBn
         ILdszs5vZFWfUvGL+7k/gWxVD5I+2kR/4UI5QmboC5N9MAS2edLbYtrupsrIM9s2jbLP
         Wx02XqIkoJutw/zPagRBuxwn+97ZodBFnYxfZZ9tiNKDQyJ9hNHoKtx/vvGK5jYT9sqs
         RJSBbl8fBXaYPM/urjG5x6CqhvwD56yEiWn06QvNcEwz3ZEYqkYuW6HZk6QVKpaUdFt4
         IeEg==
X-Gm-Message-State: AOJu0YwIkmTyW5rMrYBQWVtRrphmO9nM7aprSvYWUCnstFYy8FvM0BTQ
	Ke7MYm8FHls4PgMFeAE8LU4/dp2fPIersPzLYd4XxJ3IBu4JTPxJTgC86llOEGCHEBE=
X-Gm-Gg: ASbGncvJsP3pLMu1kZKVot3nsWTlpJ5yJHuRThbGdvllH3jvAeH/pPle2fQEmKLPA0U
	YhJO6q6cLmcjr1JTI2wmsnlvYAqBWpV/rZjj8yi3QEpoiEATlhxBWgp3pshmCjoSkXpOvs/4cSY
	PWG8gDNoq+huqbLpPM0dMVtr+Y4HROg8Ttn7mTus108Cav1MpJSyRvHdWwnF59jcS2huxKWdruJ
	2hD5BkdLiB1JUtdVzjiCrkFkM4oscdSImKzlwSgLYfbEr5aXR3sxiT5C0i1T9vKHdva6hH8LsJP
	urUnRS2xrpbgovmJsqQscTR7h9HV3JGjWuXFuJfgiyx8vYd6Ia/SI/7C
X-Google-Smtp-Source: AGHT+IGiJc5Hq8VxNCFUCnUV/lBSFSUGu1bJiT+ew4NGmMwdQxHNnteeQqkY+bqitvTjQNj8zXRiow==
X-Received: by 2002:a05:6000:4009:b0:3a4:f902:3872 with SMTP id ffacd0b85a97d-3a51d92fd2bmr1606925f8f.19.1749030844101;
        Wed, 04 Jun 2025 02:54:04 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:e8d2:e71d:f170:23e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00971e4sm21525640f8f.65.2025.06.04.02.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 02:54:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH libgpiod 0/3] doc: add rust docs
Date: Wed, 04 Jun 2025 11:53:54 +0200
Message-Id: <20250604-rust-docs-v1-0-8ff23924a917@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALIXQGgC/x3MQQqAIBBA0avErBMmKYOuEi1SpxoIDaciCO+et
 Hzw+S8IJSaBoXoh0c3CMRQ0dQVum8NKin0xaNQdGmxVuuRUPjpRHWpv3Lxo7C2U/ki08PO/Rtj
 ZrgdHD1POH0uWekxlAAAA
X-Change-ID: 20250604-rust-docs-502d6caf207b
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=912;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=uEQ76NlH5lO8kMZwukda4UrTYqvsSsuybGdDVRVBWvQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoQBe6GhQkCQGLV3oZPysTN0HRwvRNSLJns3YzN
 //Yc5PE46KJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEAXugAKCRARpy6gFHHX
 cseFD/4yhDrODMfcyL3RBcEz4QbHS2SG1VlrQqEhanrqfEh2qiie4A3J24y8OSGzI/t0gQ5zQix
 453+Isqm4ZbjQUUoXVd1++4EqPHqxiFb8XTxo8I5iQofdatCVpdFqi5G2Rk80eWGhettnWMomDB
 tjOQ7tER3GtnwgZlfNbwd3zlbg1roE+GywmkQ4tWASGwsPr9+3X8JZdlngCuRPz+vQypRXQzACl
 5NNKiFEJWOqPpmAK+ntq1Ltv0MyOHUNSSX7lh1vrd3li98dNOHGuJ8fkPG+0flBecyOAtqbuTHo
 Uc4AT8N2ufJsvdM2yzHhygNbNbCcvTQutn/3w9+cgYf0BQQBbf1O7cROEtgAqytR+2kHTutqdK5
 R5UfMgIdQJBygV9DVaoFiWfyvXj3+f4GTonqx31sEV+3Rs7P62VEEhCHr+y8h6itTRRz7sgb1fR
 /8aDkmIDFjSS/LVORXR9/fH+TpermNr/PWPuiC64kekh71EqjPiDKnY9j+OOA9OYwKCZ178iezx
 lrIhoj0UgnBy9N0aeCRNemUnXCZFs1/j29rzKhKNYO3OvifEWsbrL6sqK2AkenO3KLnDmS013BB
 l24aDE9t85uOF6L/cny6PWU3KADLYYzEDV55l3x1sV/3+61MXXh6OewdFuOWgY2aAyWJE/p7cpQ
 mREE/bFPOiUaldw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

While full integration of Rust docs with sphinx is currently hard, if
not impossible, we can still follow the pattern we used for GLib
bindings and generate the docs using cargo, then linking to them from
the sphinx page.

While at it: fix some minor issues in conf.py.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (3):
      doc: reformat conf.py with black
      doc: improve the readability of the prefix variable
      doc: integrate rust docs into the sphinx build

 .readthedocs.yaml |  3 +++
 docs/conf.py      | 43 ++++++++++++++++++++++++++++++++++---------
 docs/rust_api.rst | 22 ++++++++++++++--------
 3 files changed, 51 insertions(+), 17 deletions(-)
---
base-commit: 088c66ef20662b76eebf03e71f11196a5ae14b33
change-id: 20250604-rust-docs-502d6caf207b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


