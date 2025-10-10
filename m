Return-Path: <linux-gpio+bounces-26982-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 507CEBCD2A8
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 15:22:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 756D44035AA
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 13:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 065BB2F549F;
	Fri, 10 Oct 2025 13:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mc5AE4zw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1F62F25FD
	for <linux-gpio@vger.kernel.org>; Fri, 10 Oct 2025 13:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760102347; cv=none; b=JBf2EyUz34CVroXhjXEKGaxtZIyXrJPxV/AvrgCT3bdmt7+SkWmJF8rfxRmfHq1w/skUCuicw567Arw1eBdVvnJIxDgfJxYYihNwiHSU05XuHRQSgFUcss8ArCFSeozU7GdQ9L6Ugm55+W4/7Y92S03S534o4BT/NOp14hPsBbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760102347; c=relaxed/simple;
	bh=3vxa0bIhWKzpLUrAlTprZcKO9BcLIggp1N4gz1sNzPk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MG37fESrpSmjxXPhtRhzfEjdfBgvFQj9Lf5zK8KTXC2IxCdxj7ci9XXwFJpw4wKg1Unl67oZtM/wvgRWwwdWnLwoasyD8dI1DyLE+NoTjbCn/FO5p/xS2e54rd60m3of3DswVCOPTJsxwaXzgGzmdFthUE6vKJ2NCjlfRJVzSxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mc5AE4zw; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3ee15b5435bso1255426f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 10 Oct 2025 06:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760102344; x=1760707144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eESySdgcY9v9ra8tdnwU8gzCn2jOOBOg4UBQNbKN7Mw=;
        b=mc5AE4zw9Wmf8kTnMET+cFB400XOkmtDA1x7XJ7sMWyc95I25Uw6P8bq3JcXSk9KKn
         ERR52FlKImmmAOgB+Uz+vtgw/TvnRYvl8xHJ/1Ls8WIcWTXPLogl53kUAK9rXVfZWKVO
         4hCNGWwY1wdCbAneRsQNHw7sLedDFuk5PEoco+iUu0IbtUvPf6aWtpkCapLFnK+Fk5mf
         MDivV+On1jhkRKywZBrKWr4u/pTawJ3LlgAo573lv5bDgGICnfaxPcpQYnSlmjvgD+hT
         H8LUOM4+dRN/MV+YHZTvYy9X09wfVCylSic/kKsuSRtZxU4EaTUZ4731p9ud6fG+8qIl
         SgVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760102344; x=1760707144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eESySdgcY9v9ra8tdnwU8gzCn2jOOBOg4UBQNbKN7Mw=;
        b=MizYzoZ69cwZrxGXp4lxoLEakjM8PhTdcqc658cXi+7CZ5pejuWQVRo6Y8ixk8bekp
         lPvtId4vQBT3jzk29+QEpntwYTNw4j9rKbDSPYpZuFHrak5czOmBrpZZ4is+xt+K8UG+
         1gNIFHTBb+i9h+0AFoGmkVZZ/qhRBU9GbH4U0OxAJmYTC9ota6RYmc9+y7y5tHds5wJ/
         0l17ptbEE/n3gnjHt4g1fTwHHMY2e4FleKGqz5j2QTpfWiWUSHYpTjv2VrjFzVHtF0v8
         MAnBLoDsbcPmnDXtYBDrAS22RS8QAh/DVTKpRxNzBy7oY2Y5eQqI6YMtc7wyH+ozNkba
         yC9g==
X-Forwarded-Encrypted: i=1; AJvYcCXGtwrIuKB+Xx3co2BGqdjlekWqhP+edM68SjuxZR6HWjEW32Qgf7WH7mlKf72IaI15o9deMaqamCL3@vger.kernel.org
X-Gm-Message-State: AOJu0YypsNgon4SpeNkF3XQxYGZxNoymPYF0r6CuGhmmt69F8ZdtOHYq
	HCcYmVh9id3zC92vW8cX98gUN8MPAsKGCHWCRouQmqPKwYXAWIMvUdFCaitzNVS8Gak=
X-Gm-Gg: ASbGncttWw9dEFFKadDJkEyksLxTWvEzgKwUgPz1m14nSlgYKHHZ4vP6HncJQsb02ai
	CVDq7Ta3Nna7Pg5q2NRpVdUgQl5DzXInz7Uc9cepzXFekocj49AfcYAIHuDu7K92JH79QuQaAMd
	+SrsQqcFYHnj1Gs7a/vHGYnWPg2tq4sEEizuLZgOejGmEvubsw05JwRwo4kC6MUKzfNl7fnxvst
	65aH9YISERRflG74dC3brD+994hPA5z1yajiuERnyadkHq/yiNPEKSipF7e51efoow07G0PTFNO
	dgQsYWvCFLGQn7oaG3XrJ9Mf2YUyB7gKgJdiNNPB2UgyD6ZHeeais8GSbXKgNu6e3u2GX7oPzSB
	vLXQDvetfP2j8EuIwnjZF4q/gJ88aQgn3POKpd+Cw
X-Google-Smtp-Source: AGHT+IFH5I37Yiesi8opgO7PE2x/yg0YnPIPS/K45ngR4nLlSYEBIuRjzlOfGz2UlUetHqtnqjPzSA==
X-Received: by 2002:a5d:5848:0:b0:3fa:2316:c32 with SMTP id ffacd0b85a97d-4266e8e44c9mr7182247f8f.57.1760102343168;
        Fri, 10 Oct 2025 06:19:03 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:d1c1:43d4:ab99:c8a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e8309sm4144798f8f.50.2025.10.10.06.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 06:19:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio fixes for v6.18-rc1
Date: Fri, 10 Oct 2025 15:18:57 +0200
Message-ID: <20251010131857.26204-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linus,

Please pull the following GPIO driver fixes for the upcoming RC.

Thanks,
Bartosz

The following changes since commit ec714e371f22f716a04e6ecb2a24988c92b26911:

  Merge tag 'perf-tools-for-v6.18-1-2025-10-08' of git://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools (2025-10-08 19:24:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.18-rc1

for you to fetch changes up to b5f8aa8d4bde0cf3e4595af5a536da337e5f1c78:

  gpio: wcd934x: mark the GPIO controller as sleeping (2025-10-10 09:37:19 +0200)

----------------------------------------------------------------
gpio fixes for v6.18-rc1

- add a missing ACPI ID for MTL-CVF devices in gpio-usbio
- mark the gpio-wcd934x controller as "sleeping" as it uses a mutex for
  locking internally

----------------------------------------------------------------
Bartosz Golaszewski (1):
      gpio: wcd934x: mark the GPIO controller as sleeping

Hans de Goede (1):
      gpio: usbio: Add ACPI device-id for MTL-CVF devices

 drivers/gpio/gpio-usbio.c   | 1 +
 drivers/gpio/gpio-wcd934x.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

