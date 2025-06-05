Return-Path: <linux-gpio+bounces-21034-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C75A3ACEB89
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 10:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45C963AAEB8
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 08:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E006220299E;
	Thu,  5 Jun 2025 08:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gPwfH3v0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3029B1B3930
	for <linux-gpio@vger.kernel.org>; Thu,  5 Jun 2025 08:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749111210; cv=none; b=OeSL3kO4jd9782zJfyEueNHLQq0QIyAhK/6KPvjW7UB57I7YeP0HZ6U7tbCMpxXPZik2n7WQjYkXegyMh02zVWQxpz2I5nO5D46kQGnL+7PTvlgPIy4OcjHmWxNPF1Ni0+og6IA5gKKJzRmmpNp86FyWUfULlLZe+17iy7jiFKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749111210; c=relaxed/simple;
	bh=7/Oha6Eo5reH/Z0/Jyw/NK0zfRkA124IU42KP6Bsq5M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GkcjOGezDHHJBptilNDtoT76CIDoavEzddslPxAnR8Xi6VOcuyOn6lGPqBX3EA6jPegzonH6QK1x232b/r0y1HySdokgZntxPpUSnvHAjnVHpjXbsv4WfvFfUpKb0tp9P3YI6F8/z2mpcM3T3366f3kYxEYrm81vS/ShY/4P0zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gPwfH3v0; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-450caff6336so3749125e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 05 Jun 2025 01:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749111207; x=1749716007; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=So+7bY5B94Wz+9+ULUTh8P6IFbxeLILw2vz+4Ibi8P0=;
        b=gPwfH3v0JW2HOZ+qnLUZNpevTrsDSgyI5gquXHeyQKQgdzDr4QOv5FwUb65xOk/42N
         sZqfFioKOBc0XqGi3FqC0GKvEMavY7zaY5HFeSnPHAoZCapBX7pRQOczUyT2qR9xbvhf
         cHeaR6fp0LbDInvQ1s7T+/hYniMmry9vIElAQHSS/0kQjXMEntHp1/j95x8PY9gBvjPu
         NC9R/sDakCKgJCSwJYabTZYl/SwXhjO+GBP2I4sJ5mG1YpA4buO0fjf/4tdc75MVxG1Z
         7+Nfu+9xxe9I0J+gwBSqyScEHs8Z13PIeQ4hyouKhSQCKUsM7HBx/Q4x458zPts0PATk
         w/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749111207; x=1749716007;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=So+7bY5B94Wz+9+ULUTh8P6IFbxeLILw2vz+4Ibi8P0=;
        b=q+X+SNaqOko+ZpW09uzt+/x4ba6zbhOfiv0nyZ6rGI6ouNVk973GHx+dX4gbn0a/y+
         t0x9GT3dznESY5Q4yEafveZU4i2EPQOyxtIX1T9kbipalSJ9RQC4vWYFvV+sOpSr4+8x
         1KOjBUFBrlqdaWPh5LxHj1rymbN9Hrt94lXpcpxhCMRWtzSkQ40h7EMRXOSwx3zc9OFA
         gzGqPRAJl6g6bzgPtBpdgaKWhoxuY9688gH86s49HwDRT+t7bHH3nxkZA9GP8NMq087c
         lsZvAuroX5lNlwtDKOpj58tV5lNLbO058s/oRLQGpZcscoCDCMstVA11fq1PKp0eLG5e
         nesA==
X-Gm-Message-State: AOJu0YxQk1QJZ18ibwRDMgRQSFsZcKMbvsQLlPgxNpB3GQ+3vQAyQ0eF
	7vPMwruvnJtoW91Je6n/GsUsvHiVpyy4fWM1Gqq9hwYkEcZtWg3O44SYZtxPW2DCPWl77nCdqYH
	kKIfF
X-Gm-Gg: ASbGncs1PPdCyliIuRzeCB9/zIDQ0TREeqPaxOGnMo6xHWRYuLK9hr/71Q6B/w4yaX3
	XwtZJYQbboy9BZlDN5uTdQp8Yr0lGXlEFPa9maO0sXVdO5Dn0lPDFWzdLX2vUJ0dpnr4vrIrlZH
	PO7iKFe0HjdkcyVMvnxMe978dDe2JmQEAE/D/lPnd9tdq5cnql7VagzYfGNb7X4tbVmvCIdrNbO
	8I8Pd2jAbfYR+Ej0c+OCdFrwqAjwk3xYLQcy4TxRbGhQACDFn4v1naJhOF2A81L4alOOEmmtWhG
	JrmlJDRPVPZSmktoxrTAne5QQQu/agHQ17CGVSeUVWvDU1BOMmWZLAk=
X-Google-Smtp-Source: AGHT+IGhgL8/LAJV0I9Aw/jHPqDdE7psMD6NlA7NqyK9PBOX5bOp0zAUEx0K/LMd+/SvuGamKfTbTA==
X-Received: by 2002:a05:600c:8509:b0:43b:ca39:6c7d with SMTP id 5b1f17b1804b1-451f0a6afa3mr57243495e9.3.1749111206968;
        Thu, 05 Jun 2025 01:13:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b79e:4a6:355b:c44a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451fb178ee2sm10010865e9.15.2025.06.05.01.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 01:13:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 05 Jun 2025 10:13:19 +0200
Subject: [PATCH libgpiod v2 1/3] doc: reformat conf.py with black
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-rust-docs-v2-1-883a0a3872c0@linaro.org>
References: <20250605-rust-docs-v2-0-883a0a3872c0@linaro.org>
In-Reply-To: <20250605-rust-docs-v2-0-883a0a3872c0@linaro.org>
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik@riscstar.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=683;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=duFNkABcyruA/b+8Fi1QG2o9TAeLhkObsX0mFxW/AYs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoQVGk6A7l9Em+w33riPJNU8tj9CVzXkLeSMyQJ
 sH/pGxgje2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEFRpAAKCRARpy6gFHHX
 cl4kEADb46M55mpwFscPKLOl1Gl2L31kznybFKZBE9DR6hBnhNPi+gzXtoqoYKKvnK6TxF87BvN
 mNwF6MJrlHnLtz+wiJLx9elQWWv9jn9n5FR/6VcrPo/nRryPMhie1azgBPZRb+PGmkL+4OOhGiz
 88kFBV5bKVYRFVM6Bdqxw3IbL9q0bSUisNvOwXhIezU4lYn7nbcGfxeY9q7MQ+sY3l8ZUjT0D/X
 Z3aCpa2AjGGryWXmvTayVw1ZWYtzgM7xHUIRh7ivZ/Gr57g07AMjjfRFQLzyMrY/rlTiGfWI4CY
 4JdZstEzMI9WDia3Wt+czGyx+MLyNQ5Ay01FzdKo/gcv9yle0SuqW6ejj4fKQUu9QkfOIxdjPuL
 1cXJBCWh4aO6TPgKoajwMg9Zko2NBQez/teujVpTi/mTpX/0DSFa9glGL46vg8yWAEazccDttcn
 h9Xy8dkSpOepiPMUJ57bj4XYnpTXu27MRc57oliihKTQSvlfMvtH8aNbmWm/G1rtsJ2wQD4jz0P
 pkP6YcdpWf5LNkE8DY5zib1kxb1dKRNlcowAfpP/YiMN11A6Yqd4WIqQQedrmINzsS2suxZgOQh
 tonFICy6ze8ezB/aajHENB3/LNAZWLtxewsySWUqOHJUQhssy2BuUMEFS1Lt2JYInFik8AdeIP9
 Dvy6XWRxXccYbrw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There's one missing newline according to black so add it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 docs/conf.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/conf.py b/docs/conf.py
index 6fb399dcf195bd01d1fa739de89f142672f3f16e..d89c13454baa8fbe9dab17b7c3fde6fc59b577f1 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -54,6 +54,7 @@ except ImportError:
 
 html_theme = "sphinx_rtd_theme" if sphinx_rtd_theme else "default"
 
+
 # We need to know where to put docs generated by gi-docgen but app.outdir is
 # only set once the builder is initialized. Let's delay running gi-docgen
 # until we're notified.

-- 
2.48.1


