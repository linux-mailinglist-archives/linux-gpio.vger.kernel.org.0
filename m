Return-Path: <linux-gpio+bounces-6846-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E20478D376E
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 15:20:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F1FEB24C89
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 13:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 576BE10799;
	Wed, 29 May 2024 13:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WFXGzXcD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39DA101C4;
	Wed, 29 May 2024 13:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716988830; cv=none; b=uVHE2RwKpXXpuIRvuqdTsAHfpaMhyo32C4VBGZs1ET9nH21NJzzxa2gsfLRc0JAUvX1KXuvEFVBiEpPWPS3zQ5G439VC7jM7v5PEoFkvShWc0zKi9b00yLwtorHe02Y2Cta1C6LUP6d+OwJPDQdpbRJVjK+cUYuB6biwuCLyYw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716988830; c=relaxed/simple;
	bh=77FJxzbJwkAV/vX2pes1cUysbuFqQ4/zST/FA8RgZlw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fiKP/jfLlgljbAicz5BygsAy0ql8miQao1RjQLHgVJmhjkRMkHwLW5YLYVNcr7ObTRq+ku9M+dupRYBFEFLaj6oXnGT7+48XJVkBWUvnuUXHEKiloV4NQzu/IvYRjqaeIT7DX4dCn+nlxuQuo1y6sBXblkZoM5uuGrD+qh8XtgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WFXGzXcD; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-371c97913cdso8926465ab.3;
        Wed, 29 May 2024 06:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716988828; x=1717593628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yR4dedrVIaiFGbjXv3UMF7WKKo1vtqN/Cx0xuRTMYkU=;
        b=WFXGzXcDZ8S9jn+9In958OVvvi2haRLGxbuW4KFor5sJ62+v0rdZ8jjus+lpS/4fUJ
         sYSrzRWHObTau4DdXlPLwlXrB9GmMR722vv8lHc/FcCEqm5FloKllqyLR4CGbzl5bAu1
         Xan2xyIz1nVturnqvXXTugJnWJgAFPOdnbSSxcJYvKRBI6zE9Zaz+eQjkoIWRy7nF4Fh
         gIIomG9RIiXN60/bSlptXvapJC0c+drvRFpbF3AUTtcIIn0/0FpRaLV7A4tLZm8ZO/O3
         3ngaxyBDEMItubjfWMxpewjbcNszS9XrEEBlyX3GRTsi+zLlH0gkZKwv3j3QZddRzRYC
         NDpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716988828; x=1717593628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yR4dedrVIaiFGbjXv3UMF7WKKo1vtqN/Cx0xuRTMYkU=;
        b=it5oO+dnwjYSKW/AkiJLhfTzOL+L9bTd2+/42T0WSEGzG4txHoIKxVZmqEFrK8p5RE
         xRmotaiIbF4YQYzRICuFfr97nnpI3UZfNiJz1d5J2HS2W0e4Ee7PREHrP6vRfdz3t1EN
         85To+dJoLAbtHjqMKQ49G8WZo9mXW7gLMk8igxwwXo09btF4JNCKf80WCyxYY9QPOgL/
         MOMQPWcFsVy5vZ7BtoNEYK885eyJJ1+L2RwHCM5y7/JA+zsy/uKGtmKs/wNFNB30nffW
         nJIAy7TvnP7R4P+xOXOvMJLh0/t6ary2DaPCUQLzdcA87XCJ8MlOLTAv311BoYtxCD3L
         Z7jw==
X-Forwarded-Encrypted: i=1; AJvYcCV1NVZ5c7624Ks+kiwMJxCITEIJXpjYg+fD6DUh5RnWZQs1JX20NVFGi6LIOHtv03lAOoHCm9SMa1xJBWs5VJ0Ot886DYAz65Igbw==
X-Gm-Message-State: AOJu0YwQ15k+Wqi7aLLuQCu3PCRZaHb3XH7hPqovHXkc21ktiNNFghf7
	zrs2OkT384GLTmxmOjnW8XREuCdEME6bfRdjLE3IwrFwbgs4H7Y/E96BfQ==
X-Google-Smtp-Source: AGHT+IHSdhE9iZ7Xr6PKBkv09UcTPRyYwETSVFj98ohkoTkQgCPgLnOWaCDDC5nyFQs15CNFlKKofg==
X-Received: by 2002:a05:6e02:b4f:b0:374:4ee3:13dd with SMTP id e9e14a558f8ab-3744ee31563mr116312835ab.4.1716988827724;
        Wed, 29 May 2024 06:20:27 -0700 (PDT)
Received: from rigel.home.arpa (194-223-191-29.tpgi.com.au. [194.223.191.29])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-682227f1838sm9121844a12.46.2024.05.29.06.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 06:20:27 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	brgl@bgdev.pl,
	linus.walleij@linaro.org
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v2 0/3] gpiolib: cdev: tidy up kfifo handling
Date: Wed, 29 May 2024 21:19:50 +0800
Message-Id: <20240529131953.195777-1-warthog618@gmail.com>
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

Changes v1 -> v2:
 - add WARN() to patch 3.

Kent Gibson (3):
  gpiolib: cdev: Add INIT_KFIFO() for linereq events
  gpiolib: cdev: Refactor allocation of linereq events kfifo
  gpiolib: cdev: Cleanup kfifo_out() error handling

 drivers/gpio/gpiolib-cdev.c | 80 +++++++++++++++++++------------------
 1 file changed, 41 insertions(+), 39 deletions(-)

--
2.39.2


