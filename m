Return-Path: <linux-gpio+bounces-6642-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 843958CFF66
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 13:54:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B19C51C21387
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 11:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63DD015DBA8;
	Mon, 27 May 2024 11:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="frMP3jSg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA07813AA31;
	Mon, 27 May 2024 11:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716810880; cv=none; b=RzX+N5Dh5Ep9WTAys1pKX4VwwBv9j+m7Hpip1mOBN7GCti6oxqKqwcA6uHNsRHPHtLukR3O+If8LvyXZSJRgKp3FUB1MbP96L21TDCvDWNy9MtxdRnN/6h4Q4sR93JeoV4PpW1X3G5nZvoIluEfNqrK6MJHo5QWJtHWgjDfKSEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716810880; c=relaxed/simple;
	bh=Ep8t7vPeAwXRzCTeTUUWkx1TqvppgijvQkJ80jbST/g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Z0xm30ZVCUojCbxLh/JO+KkBbRxXykrGEfUJWUuTIOdbCQWigqPMRK1Hz44ieFgiw6OKMD3MXFzdN5Qf7+AzdsZNrie9+p/ny/Yt5KYn+u98Ou0Z56QMJxX6CzDkyIKzpG6lUuX9GezahifTPKm235r+HKyLSUFp7nZKUxAkbJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=frMP3jSg; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6f850ff30c0so3305593b3a.0;
        Mon, 27 May 2024 04:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716810878; x=1717415678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3u9+Rm0QSuOetnYvXN2dLgl+DFtTpVtk+t4PrA9bwrY=;
        b=frMP3jSgE2E7gzEuQBlzhjMGCXHfginjVlZHX7AWYgYZGVkR6exzLNQPa6fEjgLZKt
         0o5yL7ls0uwd+6XAnTbz/r3F97cqcZkVGATJAe90tuAR6MtBGJtm/3l8geHkAnaW4FDm
         LvFzsbTPqfra1rWuJthYSwdOW8UYhn0iJ29vh8CYFJLhTLwlu6bS5g1r4Uo5JdvyVgIn
         Nm3H8p1VjTADjv+pO9XPUEcUGwMCVcmP9l1Y7KcSQIqORuOdAzCbEuD1GOguKcT7o+9U
         3dK/1jKs//jpOqZmhqnD5+EAnWRJnrNUCm8ku3/8gtgygSQjpGtsSU+GUfKosipr+c7b
         RFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716810878; x=1717415678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3u9+Rm0QSuOetnYvXN2dLgl+DFtTpVtk+t4PrA9bwrY=;
        b=oYcZq1ygbrXcH6/GAy6EwaruA6EfNdy77WsX6whHzCDOUIo9HZZlDXUUhyv3aiQQh5
         PgWMTQVGmqm8uCkGSLYDJ/g40wHlMsYf2u4jrpNmb0WY9j/LxrDnYJ0MJULzlh/f+GKD
         fevoMQFgioqYNnOduLEBTMkocyalRVI7PtW5I5Nk0b8Q+/Z+x7kSDp+3eGrIahOewKmE
         QtzZ1bE4p/E5J+x7NBv2UCmjItGhNJ43aMW/fqUtQwdYcNTEGcQdlD2hrWA6jByfkGaG
         LmvpAdYCdxRKJxd/ZKuosYGDMEvebnJlOpSmvJj2DOz9RjqWHHo6sH4iUKrJWFX3tYw7
         POZw==
X-Forwarded-Encrypted: i=1; AJvYcCVNDF3bNMyf/PmZi7kXGBE1crxcF4OhRYy7rsiYnKisdGr/i0djEG40l9TwvLLz+wJx1LzNS6JZlV/o9anwcvezcoflCXsvPC/baA==
X-Gm-Message-State: AOJu0YzEghssDRigL92/m+kA/LXAsF/soGq6yGIo/nhEsR16hdN6p326
	r9+6Ci3ifwluYc/xW4v+/x5QdR/SiEEYR+vG5inGvgrASQGqoXuAySXx/A==
X-Google-Smtp-Source: AGHT+IGpl826vUP9xVNgNYcO5JNWPvOROP0I4Yi3KEgU7Ysr+t0wAmz891RTRbB0AYbb/CbT1QKMSw==
X-Received: by 2002:a05:6a00:2911:b0:6f3:854c:dee0 with SMTP id d2e1a72fcca58-6f8f3e843ecmr10371888b3a.21.1716810877830;
        Mon, 27 May 2024 04:54:37 -0700 (PDT)
Received: from rigel.home.arpa (60-241-107-82.static.tpgi.com.au. [60.241.107.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fcbea8a9sm4749256b3a.139.2024.05.27.04.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 04:54:37 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	brgl@bgdev.pl,
	linus.walleij@linaro.org
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 0/3] gpiolib: cdev: tidy up kfifo handling
Date: Mon, 27 May 2024 19:54:16 +0800
Message-Id: <20240527115419.92606-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is a follow up to my recent kfifo initialisation fix[1].

Patch 1 adds calling INIT_KFIFO() on the event kfifo in order to induce
an oops if the kfifo is accessed prior to being allocated.  Not calling
INIT_KFIFO() could be considered an abuse of the kfifo API. I don't
recall, but it is possible that it was not being called as we also make
use of kfifo_initialized(), and the assumption was that it would return
true after the INIT_KFIFO() call. In fact it only returns true once
the kfifo has been allocated.

Patch 2 adds a helper to perform the allocation of the kfifo to reduce
code duplication.

Patch 3 tidies up the handling of kfifo_out() errors, making them
visible where they may currently be obscured.  These errors are not
expected to ever happen, so this should not produce any visible
difference, but if they do occur it will now be more obvious.

Cheers,
Kent.

[1] https://lore.kernel.org/linux-gpio/20240510065342.36191-1-warthog618@gmail.com/

Kent Gibson (3):
  gpiolib: cdev: Add INIT_KFIFO() for linereq events
  gpiolib: cdev: Refactor allocation of linereq events kfifo
  gpiolib: cdev: Cleanup kfifo_out() error handling

 drivers/gpio/gpiolib-cdev.c | 74 ++++++++++++++++++-------------------
 1 file changed, 35 insertions(+), 39 deletions(-)

--
2.39.2


