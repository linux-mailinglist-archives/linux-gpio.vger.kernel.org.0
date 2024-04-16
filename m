Return-Path: <linux-gpio+bounces-5570-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 963A98A766E
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Apr 2024 23:29:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 19AB7B2439A
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Apr 2024 21:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ADBA5EE67;
	Tue, 16 Apr 2024 21:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="p7bg82cX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2A35CDD0
	for <linux-gpio@vger.kernel.org>; Tue, 16 Apr 2024 21:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713302512; cv=none; b=V+jGavlqui/bRyA15FZLc1YWYYbXF77rYWPsI6b3kCpUtSBXhRhhNdbhY8eJ4k+wGtTqViXBsoixyd5nBZAZD/3Hb0MV259KvmBilZNzIp/cXOq/1Xf6t8XU4Js2YTxv3yHwFD0RyoAxorE+kIHlxdELP72B5vTYgzwknq6Ay3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713302512; c=relaxed/simple;
	bh=2qf2sxAfvJuJmr1LjgSz5IGxRV1AXQV3UvAvoPcWV1U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=a8Y62xULTSGelWtR8qmbOkkiIFteQCtz1Rt0lmW50wzOmfXtb+B3hjom3eaE6wZWkSlj/fVagjvmXBwaJpx+rZ691kfFP9R8TiZt51leVVMER7DWk4k2y6XLy8i+R0qPgAYYcZ14xHtlRrw7k/YjlnnPfXQHc7H/Jd4jnGa5jZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=p7bg82cX; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6ed691fb83eso4031313b3a.1
        for <linux-gpio@vger.kernel.org>; Tue, 16 Apr 2024 14:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1713302510; x=1713907310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ijloaJiPZtaiaE6zPKvV5TVTs15bp9ZBzzfU6V/0gWA=;
        b=p7bg82cXMQPsMIxnZDHtxx7T8Nv2nzJA8OgUw0W033KWQPoFb0hPEC+LShEpxHwxu/
         xRjsd1c18zWkpemE/9+9CMafkdenkVoU83C5wMZevy1/4/9pbVumR7PYDXouHkuQx38X
         8s83vQyO3eszChTo8FHWLDAXLQh+G6VdLZxxMmSwiUX/8q/2mCAGktSbkEXdsA6+jZ5X
         K1PSVkCBRj0z6UVmsEkEfVBf9EocM41c/4DsITm+dowJbO2HNlbWbo57u/js7VTNhCt6
         SBAq5hISzcVrsnM7OrftbDLUVBqk2asWFMZjj/2AnXEBCwg3MRZoQKTB9GumRAt6rYf+
         NE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713302510; x=1713907310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ijloaJiPZtaiaE6zPKvV5TVTs15bp9ZBzzfU6V/0gWA=;
        b=Te2bq0dTHTCRuPgT7HtrOjgwMYL0jSpu4AaN/mtQbxO8LGozV1S1+uSnXhoeFhbk2G
         dWXmQVtAwaU2ZZY4l9qTJbGcteF2bCEEsVsoR2t/SwASFitSwKewYPh65d57lSEVWy67
         8nV6DeGryfAua2RfC/OKmFqhZd8GunRUJN8qh8Bio6t0Kl5/53gopx/Y63b2CQF6PkDt
         M/z1UHFqEOkEvD5h5izLaLqKde2ZNcT4lVeJu6H6UcNGa23aXeqeBrYosb9ZYCssBVPO
         we13K0gocngxyvxvLYezLWHX7ESmp2McWtKFWLPlroaAA4SBycfMtV36ru8+oDsjVbpE
         +sKA==
X-Gm-Message-State: AOJu0YywBUpFp3T+unrp1ErB+pxWrltInSoRInGZWSrM0ADCll8nF3Be
	uTWKDhaM6ksbvjbvP1AwFuczmI83NoN+hT5z2ukFliBYoDT2/52PALgUB+XT3ig=
X-Google-Smtp-Source: AGHT+IFVIzGmHkKor4u8NwTpfGtR77UMKcohXw73R4NnB4t7rwU2sr0bCSgbEPQ1STF5Nt4bGRw1yQ==
X-Received: by 2002:a05:6a00:21d4:b0:6ea:950f:7d29 with SMTP id t20-20020a056a0021d400b006ea950f7d29mr15300973pfj.20.1713302509601;
        Tue, 16 Apr 2024 14:21:49 -0700 (PDT)
Received: from brgl-uxlite.. ([24.75.208.145])
        by smtp.gmail.com with ESMTPSA id c19-20020aa78813000000b006e6b3c4e70bsm9792840pfo.171.2024.04.16.14.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 14:21:49 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Grant Likely <grant.likely@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 0/2] licensing: relicense C++ bindings and add a document on contributing
Date: Tue, 16 Apr 2024 23:21:39 +0200
Message-Id: <20240416212141.6683-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I'm Cc'ing all copyright holders for this project's C++ source code since
the last license change which are Linaro, BayLibre and Kent Gibson. Please
kindly leave your Acks.

Bartosz Golaszewski (2):
  licensing: relicense C++ bindings under LGPL-2.1-or-later
  doc: add a file explaining the contribution process in detail

 CONTRIBUTING.md                             |  88 +++++++++++
 COPYING                                     |  11 +-
 LICENSES/LGPL-3.0-or-later.txt              | 165 --------------------
 README                                      |   2 +
 bindings/cxx/chip-info.cpp                  |   2 +-
 bindings/cxx/chip.cpp                       |   2 +-
 bindings/cxx/edge-event-buffer.cpp          |   2 +-
 bindings/cxx/edge-event.cpp                 |   2 +-
 bindings/cxx/exception.cpp                  |   2 +-
 bindings/cxx/gpiod.hpp                      |   2 +-
 bindings/cxx/gpiodcxx/chip-info.hpp         |   2 +-
 bindings/cxx/gpiodcxx/chip.hpp              |   2 +-
 bindings/cxx/gpiodcxx/edge-event-buffer.hpp |   2 +-
 bindings/cxx/gpiodcxx/edge-event.hpp        |   2 +-
 bindings/cxx/gpiodcxx/exception.hpp         |   2 +-
 bindings/cxx/gpiodcxx/info-event.hpp        |   2 +-
 bindings/cxx/gpiodcxx/line-config.hpp       |   2 +-
 bindings/cxx/gpiodcxx/line-info.hpp         |   2 +-
 bindings/cxx/gpiodcxx/line-request.hpp      |   2 +-
 bindings/cxx/gpiodcxx/line-settings.hpp     |   2 +-
 bindings/cxx/gpiodcxx/line.hpp              |   2 +-
 bindings/cxx/gpiodcxx/misc.hpp              |   2 +-
 bindings/cxx/gpiodcxx/request-builder.hpp   |   2 +-
 bindings/cxx/gpiodcxx/request-config.hpp    |   2 +-
 bindings/cxx/gpiodcxx/timestamp.hpp         |   2 +-
 bindings/cxx/info-event.cpp                 |   2 +-
 bindings/cxx/internal.cpp                   |   2 +-
 bindings/cxx/internal.hpp                   |   2 +-
 bindings/cxx/line-config.cpp                |   2 +-
 bindings/cxx/line-info.cpp                  |   2 +-
 bindings/cxx/line-request.cpp               |   2 +-
 bindings/cxx/line-settings.cpp              |   2 +-
 bindings/cxx/line.cpp                       |   2 +-
 bindings/cxx/misc.cpp                       |   2 +-
 bindings/cxx/request-builder.cpp            |   2 +-
 bindings/cxx/request-config.cpp             |   2 +-
 bindings/cxx/tests/gpiosim.cpp              |   2 +-
 bindings/cxx/tests/gpiosim.hpp              |   2 +-
 bindings/cxx/tests/helpers.cpp              |   2 +-
 bindings/cxx/tests/helpers.hpp              |   2 +-
 40 files changed, 127 insertions(+), 211 deletions(-)
 create mode 100644 CONTRIBUTING.md
 delete mode 100644 LICENSES/LGPL-3.0-or-later.txt

-- 
2.40.1


