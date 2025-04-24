Return-Path: <linux-gpio+bounces-19274-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CF4A9AE83
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 15:10:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C2CD5A250B
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 13:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1F1D27FD50;
	Thu, 24 Apr 2025 13:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tkwbALMT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C101327F747
	for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 13:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745500001; cv=none; b=t81fJy3fUQsQrXqVmzbesJWmPgomvB3dehxq5xn4Fto5MYzcLhxx4798veoJrfrdvLfp7I6NZ+3jBxCB40+8wRYGn+ttWC3EMOL+nAdaTqCDuRWb2yjG4/xUZCHX38LaRER4xm8TZJzLwwNKhLyzM/2P/NrWRa36m8ZtY3opN1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745500001; c=relaxed/simple;
	bh=mWDw0hWwm0dea+mt+Eev9+17u4CLGz/EJKscfliQcpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bJqNdox1p6n0E3M5sPHVt7leX62VeKPlfCpcjuZBMj184kJXfP7awnAgnYzmp4ekq1JZZcZADvxq4xm4T+11zQbXJAyQkHQooM488A/TUWwomNWs0UugZccFN+6ItE0X5NRYf+UDRHuRTGvU6UoeJlKYQx4kfrjTwHqup+s7+uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tkwbALMT; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfe574976so6938315e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 06:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745499998; x=1746104798; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VRx+M24c9PeAFqXYodIH+XSda/6z+9fTtNDSYkvn8QY=;
        b=tkwbALMTniQjDIjCysGe7SGJd4zEuWbpLuwSo/8vVkWbiCQtRMSgFR41oOpc7qWISJ
         UW2X/hrPbn6W7RqVeOC5N4NkZyGagU2CNZfyu91YLmq70hOMFFdqHzBvJGLrlMtxdtvC
         uhFwqQvlvm+40LskscDkhQA4x1hNVp3Jn6SWe/rES+j7q+EtbCb9rob0eHn5iYT1f5Aq
         3qchOtq3cshhUXOB1bgcvC1KXxFUejG8x4XEO9Ny2Ht+hcUO5KlTT22mDtuitUlSEq83
         uy/pBz+IhOsHhsmmuPCk3PmuBsfAReia+ErjbeUbkkUFOz3xEYrV1t3c0sQGdkcD1AnM
         6o5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745499998; x=1746104798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VRx+M24c9PeAFqXYodIH+XSda/6z+9fTtNDSYkvn8QY=;
        b=R1MvLF5eZd942UQwqQYI4MkZfrBmzwFaBEDNXazVYiqYzRQLrPI7A3ArrRsEOlqzH8
         C9pohAf3aaHm1lj7SyLNo15BP44I22MttCs2QtNmac+ybdU3azzI9C7yiH6umzB56iNX
         zk6pQfbYXnRSaQtXmgCn5v3wUz8Lq69gFljoChDl51+Aq7iaZvrPSu6daWrQhmQhomrS
         cqcdMMtUIGZegMxxOdlCEGGjPuIWfYjyDayrFqxX10CbHPGkB3QzOtlO/rE/bboYlB4X
         E4gINcY3/K/kjpnyYA3v9HVGDXHFImkmXUKFo/OmEKL51cVNbfmVEF2+YHlszF0jUUmz
         2VFA==
X-Gm-Message-State: AOJu0YyDhost44kqAWHAnhOwwwx0wO8/IaJtmJ2TRhOVmF2pJEDeFr6h
	w+chQFSKDEX7TCfhzUt2JI0g8SJF+vQUla2XyyabY6o/UUnvmfJKCL4i3OlCTmw=
X-Gm-Gg: ASbGnctEt5oSeVAofSWaglmAhM1QnzKAHvi3G92xhpOup9mOjGotxNPBhHDIZFZxxxD
	42KWMlOo0n1aTnw2pvGN1ffvl/r26igxungecuz/rHyktICp/6UPH1umFC3yKYqpTfiigoDDj6o
	WZDtfwDmpPlhR3XABYpSI3LNJ4S9/h98uToWfqMT4Z3YmI7vx28+6ZVVSj5BeIwawaX2KZtTF2z
	hGnagER1eX8i0/rI+/LmQ0fmxpQo75y1NjiY4FK7KvPcw2U5yAR+sR+QIFStlN4fiEIWlqaBwvL
	/YY8z8v+dgt60LiQRAQn91h/YJh7aNEbxJsCFCkKGq7w
X-Google-Smtp-Source: AGHT+IEbrPTLxm6ibinThR1er+K39UiqDTz92Njoxpi7oSzYmDWVRWYcMe4SIKNlr7DX/VF4eIhsoQ==
X-Received: by 2002:a05:600c:3496:b0:43b:cc42:c54f with SMTP id 5b1f17b1804b1-4409bd18487mr25023475e9.14.1745499997741;
        Thu, 24 Apr 2025 06:06:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6266:7750:57ce:7cb4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2ad175sm20427485e9.24.2025.04.24.06.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 06:06:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 15:06:28 +0200
Subject: [PATCH libgpiod 2/2] bindings: python: make licensing information
 conform with PEP 639
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-pyproject-toml-pep-639-v1-2-8150d3d807b1@linaro.org>
References: <20250424-pyproject-toml-pep-639-v1-0-8150d3d807b1@linaro.org>
In-Reply-To: <20250424-pyproject-toml-pep-639-v1-0-8150d3d807b1@linaro.org>
To: Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Phil Howard <phil@gadgetoid.com>, 
 Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=AqbKXcZf/JAhk8SQkPA7DvRddQZZSHFB4MKxTB/AuG8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCjdav+dGPCenDmytq73XcL95VO+k0IuLt5dXp
 D5w+s3R4m2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAo3WgAKCRARpy6gFHHX
 cqRMD/4p3c9UgQLOdlqsncpD21vRt3p1+sAUsdaJsNu/leRu6GaT+VoiUokYQdYHYTsuFJV3Qoy
 u4x5WxOS8JZpZakt9L/WSNbxOFprATrhOZT9le+U/VZW8MWY6M8ctPYeVUTF0UpILmzr/8NY7rq
 vNFT9hy4Y7udziroidgz1PU+0osE7iku3wVxbWVcbCr9pktgt814yc56bsM3uzkjWm8/l1bVZWL
 Fii5W9HqOQHyWQJd61wYXULUPBE+EnlcPmvGSgNDCfVFkd5NHFFA2Ie7olwmYg8PgXZgFbmRhIY
 uKGpWz1QZcaBw/UBhwE+pruml+fnBo4/nMInLKram4vx+Q3i0gFSK6RvuiOd+kMmOeMs01IhNl4
 q8H/z0ua2gm2ESA3yaDeAoViXxaOlhiBO0kt+7+GqFl17ukOQ4N54i0JH4cpCL8e0nbzKScFmL+
 cTUp2SIq2qp8wMlNQ8DwrKxK1UpFB+JW0bu4PYdiiMu0Os/bVFvAtSj8QHuzvqIjT1LT5u9/NrL
 TvW0LBqLkJWQ1C2TuqOBIBRpeKOqScnUOvxjn7kr4hy4xh8TPpmtxXG0kqhywnA2gMrOFQ8X9Py
 9hS+1QUwVYbUH7QyvPxnZtZAYRtTvv2yeZEl4Fw0aPdT8snj5BPm5j+rlmrzRdoP16y/p2bw0Q8
 Sp9YcDspN5RXBqQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Follow the PEP 639 specification and remove the deprecated license
classifier as well as make the license key in the [project] table a
top-level string containing the SPDX license identifier.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/python/pyproject.toml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/bindings/python/pyproject.toml b/bindings/python/pyproject.toml
index 8f025a7..f0f8c29 100644
--- a/bindings/python/pyproject.toml
+++ b/bindings/python/pyproject.toml
@@ -10,14 +10,13 @@ name = "gpiod"
 dynamic = ["version"]
 description = "Python bindings for libgpiod"
 readme = "README.md"
-license = {text = "LGPL-2.1-or-later"}
+license = "LGPL-2.1-or-later"
 requires-python = ">=3.9.0"
 authors = [
   {name = "Bartosz Golaszewski", email = "brgl@bgdev.pl"},
 ]
 classifiers = [
   "Development Status :: 5 - Production/Stable",
-  "License :: OSI Approved :: GNU Lesser General Public License v2 or later (LGPLv2+)",
   "Operating System :: POSIX :: Linux",
   "Typing :: Typed",
   "Programming Language :: Python",

-- 
2.45.2


