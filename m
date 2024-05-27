Return-Path: <linux-gpio+bounces-6646-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BEA8CFF86
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 14:03:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B80E01C217D8
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 12:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C39D215DBA1;
	Mon, 27 May 2024 12:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1z8jXHRZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7949134B6
	for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 12:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716811376; cv=none; b=H/h9wMM6EI97iYi8TL0DbhS/pGp5qltX1NkARLXsKIgiI/QzHj2HMjafX06VSeEjBNs7vrtqHpAvavaTpf+cKQJi+gUJUUujmkxdYlX2wwllWES2lUpz2uOnVJKYAdXIrXgMcLzJTTgKnVMK8lUqoJWqLPIz9xuOidJoEIeor+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716811376; c=relaxed/simple;
	bh=dQlKf2P8NhycSKfxgdxyhvgM4kDcwJ3ptIXq7fM5MYY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rbxdqCZZSLPMw3sErx5uaxjKkOnNqYFhP+j0SCSiUVp+bwXEtwNYRxJn/feoACBT8lfEJ3h2ISwMNFcxvtzyNqC74n/Ou1oKjAPk/ZKYqKZz5PJ4mGNr03YGmIhjSUqHIpqXWJRqgpcKw2pbmzAoU/RD/7lpAGUS6MaEDBHjvNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1z8jXHRZ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-354de3c5d00so2591691f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 05:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716811373; x=1717416173; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JyBeEkonFAYJK+tRRWSaVI/BvsYnZ1TXG9BSyaZ4TfU=;
        b=1z8jXHRZQyNO65gXY9Gq7eaJLVepBOBcoFDwJOagFZ7ZQ/tHOjFtEsDEXQ8ygnCYsR
         WRdhN1r6s631Xr0umuwKBweJ1syDeIgp1DsK8fa2M2k9pIT+qxm3tSyoRTec4RPU7gZz
         g67tp5+JuQ7x/kgdwKaPNwxKydSnT5aemJm//xahnlIDs5ByTKl3n1CLyYfTqdVujf2B
         VnTvxVXrqS9dRIrLSQ83acP6axoNKBcDQJvTFJOcd5QyWr/TfhQfjujs+l22REKiz1T+
         1jdHsBSxr7PpMlmPIbJpkwEFuFZXB9KwKra8RiOe0xwEJXXz8qQjNIabLzpzoANs60VW
         leZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716811373; x=1717416173;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JyBeEkonFAYJK+tRRWSaVI/BvsYnZ1TXG9BSyaZ4TfU=;
        b=wAvQHWCxxRu/NF0pnrEfnCF0zxWSHkdhDJ9C0Hz4AprxOYMeeshpDvp8nIYPfxWSmK
         +f4M7wuI2MO1thGQHHe9B/xzz6h28NVWPplsAZJoPnuqdi0PRdM83VRdYRmrpVrlCI4N
         cm8NShJOkumUKP4nkGAory0gZhyShsx2Vcus9o3V3aFve+Lxt6urOF0WkLBCXxZ6eHiS
         VthrSB2l7errAT0n6/vIUfxzlbg3ui8s9JHWhXc5IhSTn9uPhS7sDT2zVI+tGMOzHw5H
         MaLDvWrvIoI12ROcVYmd6eUdcSkUVab4EV4Gj+JfyqexBNx88E47FadaMHFISJheLsAv
         J6Vg==
X-Forwarded-Encrypted: i=1; AJvYcCWya7fbvKpp0inxo9xWO/AzzuBkArh3qGFVFhkK851Bbn2/ZWDBK3Hd5+eZVpR4yWCwJGVc7V09z1Pj2pRLrix2XQXFnFpsyFUCvQ==
X-Gm-Message-State: AOJu0YxsA2epN5Pp50zfQbnNi2uSATtqGfEA6CWWvp4L1HBzPa92d6sq
	55mhZqsmIEDZo2cc9z4jBhQiwBx3NXcCs9XNW1705i7jGBtKytQj/U9OzmKI2yQ=
X-Google-Smtp-Source: AGHT+IGbNlTgegYZQImWQA+KSG30XGZuwSOBHQoJ8F/TkX85DT73fOXY4zhdgWu5OtxQZWQ9QXudrA==
X-Received: by 2002:a5d:664c:0:b0:354:e237:83ca with SMTP id ffacd0b85a97d-354f757a630mr10166350f8f.24.1716811371121;
        Mon, 27 May 2024 05:02:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:c322:131e:ff9d:ef41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35579d7ed6fsm8948032f8f.9.2024.05.27.05.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 05:02:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH libgpiod v2 0/4] tools: tests: fix a few issues in bash
 scripts
Date: Mon, 27 May 2024 14:02:32 +0200
Message-Id: <20240527-fix-bash-tests-v2-0-05d90cea24cd@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFh2VGYC/3WNzQqDMBCEX0X23C0xP4b21PcoHhKNcUGMZCW0i
 O/e4L3H4Zv55gAOmQLDszkgh0JMaa1B3hoYZrfGgDTWDFJILYzUONEHveMZ98A7o9HGT7LT2no
 FdbTlUBuX8A0L+bhRGqGvZCbeU/5eT6W9+D9paVFgqx52sEpY5brXQqvL6Z5yhP48zx90koKdt
 wAAAA==
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=865;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=dQlKf2P8NhycSKfxgdxyhvgM4kDcwJ3ptIXq7fM5MYY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmVHZmGBkrvx2UyBP/atI9rvafkUyD3yXDQl4Je
 IYE0wJcKUOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZlR2ZgAKCRARpy6gFHHX
 cry3D/49nrGYpFU4qKoj2TOQkb9YsRmP2X1zt7bjzocXvTs6lcgMotoX6m/EH93vnnl3gKPLHfO
 yhtixwi3n9R9P0V6NW0ppQ5nsu4bCHpjTHM2rel7AFiRpi02+U0yz3CVwvIqI/6BW9hk2ZnhVhS
 Qz90ZmR1RtT5MRlJnmSG9EyTvKy0cua7oect0aaqC7goqyrGcD8wOFOJwHfnm0oEOnv2joQLil/
 x1M5hra8tZpZvV6s6B/odp+AWexi9PX65MpROqxjs9JAMG14iQyrSecRd8strt3CF9JmVv7LNN/
 z+wVP1fPJMSNK50OvOMZvDgnmHgLpj61cYy4Q56Oj4hFHutShW1rI8NhoF/uUENBz1nt1H+RJi2
 N60SrtuT03Wk8YH+mdMQIu+LThUxgrtfMijnCPb2yUVvwXzEioCjV8ladAhQIG4Nx6jNBIECPa+
 L9zWLcTKioIn0FGuFek8MuH2Xjq5U27x5Cb4KOTA5A+iwWkfy5ybzrn0pc2KvvT6qusK5L8Au9x
 sEdLJd7V01eA40CoGLA0q6MMbnoiPWSdYdD7/+LRgS+AlTJCSbu4epoWb5RBRXMlyFq1Yif0NBD
 2MQzx9Us+cj9GlY1bgrqH8eoNSW/hlcBVZcrX5axSUNeQmRwYtl+U8fo5VjeB0PEFBg1Gmy7ywd
 J8krJ3HyPqIacRw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Fix a few issues with tools tests reported by Andy.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- Use double quotes around $@ to prevent globbing but allow variable expansion
- Link to v1: https://lore.kernel.org/r/20240524-fix-bash-tests-v1-0-1397c73073a6@linaro.org

---
Bartosz Golaszewski (4):
      tools: tests: use tabs for indentation consistently
      tools: tests: use "$@" instead of $*
      tools: tests: remove unneeded ';' in while loops
      tools: tests: remove dependency on grep

 tools/gpio-tools-test.bash | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)
---
base-commit: 27fe10150f6d5fa78d1a1ef1e922dc8395d1154d
change-id: 20240524-fix-bash-tests-545bf26447b3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


