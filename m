Return-Path: <linux-gpio+bounces-4876-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A83892060
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Mar 2024 16:25:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 027D8B2ECA7
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Mar 2024 15:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2982069E0F;
	Fri, 29 Mar 2024 14:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="MJDecyS0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C3812E1C1
	for <linux-gpio@vger.kernel.org>; Fri, 29 Mar 2024 14:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711723425; cv=none; b=f116+NVn51FV4n5V+r1DBK/6vOK8XJHQWMlIB+8grHKcVTSilN3jVhySSceFm0Cdy+GOoqFTsaDkeT3xL6X9VwgxkHjRZA7FzIQ3rbfrFkoNKXpG8iY8YBOblQUKKyZgzUlknkTVkH+792RhsSUNaPrlEZJKgqyI3teHTpYO+Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711723425; c=relaxed/simple;
	bh=HWn+ubBw+z7uWmy+kR+A6/4Pj3cMxxSNFvxf72ie888=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=me2PGXsaGzaP5nuWeM5ZBx6Hk5tV251n3iEA2tM0RSWQbmd4YhAK+6IwpxpThEYFg/oBd6o4gsSgHX80U7QGHmK8U5ZyIqVNk+frRTXpq7C8Ks+nkBRRtmkU/Xq6k9KKln6nT2kmDN0O6+oP9f4dXJvRvkWULR7kYALfn5WHLxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=MJDecyS0; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6e125818649so688607a34.1
        for <linux-gpio@vger.kernel.org>; Fri, 29 Mar 2024 07:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711723421; x=1712328221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8VW51Lxzr9d+EH5PFrrI1HHmktk5YypVM0IZEzVB3Xc=;
        b=MJDecyS0be5LMcFaU6sbe2riez+grgF+Cb6Rd8YrVbWVUkhnduQiFSiMJe8eW0HKDi
         cZJBTT4DIzQjdUOmIuTt7rk+Sq81irAuXaSQhy7pVeplRGFDF5Ofe7wkoWp2a3r0CMco
         BqIP3lhjwyVuc8NgwJP1Y6ydFUUHQkgB+Xm3Xl7nTriCBf2mhWKFePDL7K761f/8Tl7O
         y/47K0CtpCapGbFWNPbAQPo5pdBl+R0bZngS7YzZWZBvqjobuaSQi+wGJKshoyr0sv8w
         x/L2IFUum+X1cdYkSSwLyJZUNnnBfhIxTYaIJ3SFO9W7XcXKzuSbLWgVYokbbHWcSFM0
         xq8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711723421; x=1712328221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8VW51Lxzr9d+EH5PFrrI1HHmktk5YypVM0IZEzVB3Xc=;
        b=CG58jIYrRCa5AW6DVEZX1xjXLqj2q3MJ/z8+pz8FV4FP8cFg6E5HLcd3iIqbmLpxlg
         vQPgeq1kuFJCmau8N4f+/0nT3B5oEU9zny/EFC9uxA04BDxdZfFhYz03NdWAOuB3rATe
         UlRIeu5pNCA1jvPA2lbBs5SqIEDuadAORsfWAC4xwf5mHn6NtZXwKeViU2AFoUw7RPla
         zXOPH+O62JDmvBoKrvRodQ1YWkgIseNiLpw5rhKr5Lbjq89mLGfHb+8PfCIqx7QpuEmR
         AG+q6VdHrjkPnAPR5icnLeywTf1edCww0U71TYCBmfwJbgqCxvd/q1Jy513NS5C25nJT
         YCFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVA3qummDH/1F1M6Yayz+sNqJ/+oy6AoRkjfSdPQFD5GEKzTg+uoWIqvHqdtn6m5/pLb5OWS/yMgEC5O/TLrdQ7ZG6p4gEl9NF1AQ==
X-Gm-Message-State: AOJu0Yx7JS6EuF2lKLLdFjpoXfuk3WlAHMRQVkfdPEa5nmkW1PQg9FFR
	vFLYr/tuKI7Fc/xkPp9LZcgMDtd8KhtbLenB61ii1bRJhLsYjr7iCNeToYW15M8=
X-Google-Smtp-Source: AGHT+IEjgbOCLxJSazq7Ph5qiPfP/D7Ytvy6s1ZfqZgKWOcT5fLpOo9CuYAo+RfvsUzjixtQixMAow==
X-Received: by 2002:a05:6830:1301:b0:6e6:d359:23e9 with SMTP id p1-20020a056830130100b006e6d35923e9mr2460279otq.36.1711723421455;
        Fri, 29 Mar 2024 07:43:41 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id r2-20020a056830120200b006e6f836aac1sm661687otp.9.2024.03.29.07.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 07:43:40 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: David Lechner <dlechner@baylibre.com>,
	Kent Gibson <warthog618@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: gpio: fix typo
Date: Fri, 29 Mar 2024 09:43:16 -0500
Message-ID: <20240329144318.376939-1-dlechner@baylibre.com>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

EOPNOTSUPP has two 'P's.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 Documentation/userspace-api/gpio/gpio-v2-get-line-ioctl.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/gpio/gpio-v2-get-line-ioctl.rst b/Documentation/userspace-api/gpio/gpio-v2-get-line-ioctl.rst
index 56b975801b6a..6615d6ced755 100644
--- a/Documentation/userspace-api/gpio/gpio-v2-get-line-ioctl.rst
+++ b/Documentation/userspace-api/gpio/gpio-v2-get-line-ioctl.rst
@@ -81,7 +81,7 @@ Only one event clock flag, ``GPIO_V2_LINE_FLAG_EVENT_CLOCK_xxx``, may be set.
 If none are set then the event clock defaults to ``CLOCK_MONOTONIC``.
 The ``GPIO_V2_LINE_FLAG_EVENT_CLOCK_HTE`` flag requires supporting hardware
 and a kernel with ``CONFIG_HTE`` set.  Requesting HTE from a device that
-doesn't support it is an error (**EOPNOTSUP**).
+doesn't support it is an error (**EOPNOTSUPP**).
 
 The :c:type:`debounce_period_us<gpio_v2_line_attribute>` attribute may only
 be applied to lines with ``GPIO_V2_LINE_FLAG_INPUT`` set. When set, debounce
-- 
2.43.2


