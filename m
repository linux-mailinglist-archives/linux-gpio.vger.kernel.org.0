Return-Path: <linux-gpio+bounces-8168-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1628A92D212
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jul 2024 14:57:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EB511C20F47
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jul 2024 12:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A105D192460;
	Wed, 10 Jul 2024 12:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="YB3B3WvO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FAF191F61
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jul 2024 12:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720616249; cv=none; b=fFfHwS+O/Ia6FsyAxaLcEwJ/Iyh0PLkHceNEBN2Xrc3DdjOQsHdxCpT18Wu5ANr69TK2h0ZU1No3KGCQr4dwXtDWJ7DwIoTQ+xcQiu0+goLkH6IoHX3s875ChqaBb2UcJhsexk6viw5HmM1o/sfNGe+j4mOszPjayQnLEmZn7h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720616249; c=relaxed/simple;
	bh=gbLztkiZ4lQRzeTrjuRIDd4heLiC0qfVQ52UvOApuXw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aEgDZeCROaWlXhaktTrtNw7Ez5f4mU49V4yehNLLL+igM+4I8SEQGERFNulE+uXy7SGvVGGRbycdL5cp0GXc/FdzD3JFExiaDG0wrv8UATzahS/CuaOLJ01mhKYOVPq2u76+Qf01bWN/AzUInFTJ4iVco/aqIfbDmoprM4oIpms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=YB3B3WvO; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52e9b9fb3dcso7506932e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jul 2024 05:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720616245; x=1721221045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GeGiGsRsTx/+ykvWB+9ceKyLTfgTKnakNWjiLQki6aE=;
        b=YB3B3WvOaCDz/F6AWjWkKy24Qb8Zqxc4hM4VEcX5tbXUOvnb/Cty1LuIC6mGebQBMI
         HCKBSGXpOSuVLJs832lWfuVpWGjERsUOVEDVKiF2hzQ9lyzfdkDZr1SGYHKJrGBghVeb
         2YGkuIur3qVnoWF+oLKI5S2XUn9olvdVm+vuEZY25dILerYbs6lpv6g7kFkkDBG6OofH
         pvLQ02pNFcrlFvYEPHLqAB27AEou8vOivAOjrZ3HcWvAcvhgNqJuFAi2TPi4PVx7U4bz
         GZh6vxjv4xu8Gbebl8hjNhqF+1ZNNYGeppO7x2XpqTsD4ys6FgX0WjmqgyehiTBVqTm4
         ciOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720616245; x=1721221045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GeGiGsRsTx/+ykvWB+9ceKyLTfgTKnakNWjiLQki6aE=;
        b=NY6qqMOmddhF73tuet4ejs1lwLrHep6M7T3NQlYg1vWJpmGKCuuMKun6zkjPfHHm9A
         Rm95+je0iZEG3hJLT8fNRmx4wOJAIKMeNHg9WLGBmUSUjwziBy+pAr9/wmorebBG4hgq
         KvDLbXfkDYqNB2Y2Bi/CFhT3bI3iyvOOBBRT1KIRtD9DN8DeYQd9jVw2O9KngTZ+lO/m
         euy8UZZoNnxvY6gGlTkfeo63lzXSgr2mk5/2TXE0t6TO/38CNtn3pN9oRFbutDN7ohSl
         QukduCdXpJJWVTjaSbsKAszvM60cM/TMljnU6Zc3nE5313XcgU5rUOyCLEoLo+BdfK7B
         zz7Q==
X-Gm-Message-State: AOJu0YxMRKkaP3m9GTYu2fIa+3A79eTWSUKYs8utNmcs1lO5OWHkA53W
	bckGmkHZHVDAlpTb/tGzz7svHepa6rR4o0VwrxI/QTr8ko1KrXhSXXkku7UOE6B44MLhufB5tAt
	2
X-Google-Smtp-Source: AGHT+IH6hku6EW2F9IfDNZ7b8kjlAMbsQcjp9nP+AqD2ur3PDLQrzGef6PK9cdl0U4uD1ONZAmJOmg==
X-Received: by 2002:a05:6512:20c5:b0:52c:de76:109a with SMTP id 2adb3069b0e04-52eb99d5d81mr2635819e87.67.1720616245531;
        Wed, 10 Jul 2024 05:57:25 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:5d33:75a6:b07c:5579])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f7416bcsm81426675e9.43.2024.07.10.05.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 05:57:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH v3 0/2] bindings: python: fix line request by name with multiple entries
Date: Wed, 10 Jul 2024 14:57:17 +0200
Message-ID: <20240710125719.33655-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We haven't heard from Chuang in two weeks but I want to finalize this
series so I applied the hints from Kent.

Changes in v3:
- tweak the commit messages
- change the test class name
- improve the test case by testing one more line name

Chuang Zhu (2):
  bindings: python: fix line request by name with multiple entries
  bindings: python: tests: add a new test case

 bindings/python/gpiod/chip.py               |  7 +++--
 bindings/python/tests/tests_line_request.py | 34 +++++++++++++++++++++
 2 files changed, 38 insertions(+), 3 deletions(-)

-- 
2.43.0


