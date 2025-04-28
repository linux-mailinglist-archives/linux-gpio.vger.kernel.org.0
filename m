Return-Path: <linux-gpio+bounces-19383-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B52FDA9E9E9
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 09:48:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 26A9A7AEF6C
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 07:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 485B41E282D;
	Mon, 28 Apr 2025 07:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RBbJO0bL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5884C1FFC4F
	for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 07:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745826357; cv=none; b=bAdr/4rXcrYTQ4iHc+urCjYLNt22OmPJiJATGxjBJx1ILz/EYcEMOUE/uNHbRXxn9GEFANQacnkyF27enZeMnHxShTG86DvItnWS7I3JyN7EdlCsOfiuvj0ByKUB7jRatZ1fIY4IUU93OPj9lS6ymksgHRe2CMA14sx6HaCx7lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745826357; c=relaxed/simple;
	bh=A9JZF2x0XBPNe0xhvFBjMVJ04N3DDFd23ten+mIE6ZM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c+dKQ0fYkvBl81Sc6pw4HGitpMLUAsIOo4l/excr8W60f9CiQesRD+DOO+Ct2A0pRtjF0OgPPrIG7OAvnIW3jWtc61H4Nh+S6WlAUIVxS2pX9eHFfmkqgXH8NIh01/RefONDRqZsDc25G+TNZUwBnf8DJAd9vbNJY/F/9giV1Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RBbJO0bL; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so29197655e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 00:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745826353; x=1746431153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cn3fzPLnrYDZ8b8q63yC0G6po3q9MyCtc16aUo0tzk0=;
        b=RBbJO0bLPqiovucsfsoHIgzN6gC9ETDcQaWadaot+VSdpBc+8HV/C2iF2veZ6jBFJc
         zVqnmoqOktwmiAVC0xMOf4cELe42E8+mbkW5oEma4l9K5lh8ARpg3Kc3LA5Gee1X81vp
         OpW/15eb/MnCS9wvFUe5XSkS2/XZ4TuC8fq7JhIVCl/jDdugipQBH93Iveb5Tl9+QH2w
         HvsNo/g+4MeBmvgQbxMywLD/S4eHqkvDPnluoREpumK8En4Ar71h9dKp1qyaUHosdcDK
         m3iHIVlzrZZzalrhYlWHnwSsTuViIazrmKou4QsCD5hZKFAAgcXORlZtXuA8qfM+TNA+
         E/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745826353; x=1746431153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cn3fzPLnrYDZ8b8q63yC0G6po3q9MyCtc16aUo0tzk0=;
        b=f4Urm6OlHJdrdCrj+zh1Buw0TwZ/0LxDIQg2dROHTuxAF83rTWeXWLn3QsbcdPZ8/F
         63w+SigJdlyWCA2yxvxbILgDjB2T818SaJMyhG7Nn9dmtgI7XunKBCP0c4tkT2LWfNxF
         aoQDdy3KxTACmABYYvW048lGbR6kIYtC4kaP8lIC9wckCMdWWC80dqw8Kz+HlXeOsHmt
         LAi3byUhD/VgFCCbcSVyWWvp3m4zzqhPhSViEo+eo2f2KI38FQmygd17Fgmhn4dLmbVT
         bsPVTJJUKVVE1bRsl/iA6vupqkCrGvAyBnr8pWze3q6nAeiDGABcRa1Y2Hd2pqoIBQ/d
         T8MQ==
X-Gm-Message-State: AOJu0YzKe9At3vm9wiY1KKeMlRS3rUV77ppNmzMWML/uNGx6B8wkUKna
	M0MT5CJ3iXKHGw/GVMI5407y8bo9fM4chD92gFhvBiACRQjz47SJHH2xqBIP1lk=
X-Gm-Gg: ASbGnct4eS2yQ/sCrihZkJwmAFa+AQnQ1UjQ8oUgeEiTz/8gbmhk/fto+GxMkbREXsP
	sgnjxdztazrthNSnpqeV4H+cSdLUElBmSuQlVqqdwvfRqwabSDviiOZX7Cpw7ffSWNd6Q4SJEY7
	zfrq84QLGFJNr+MdcX/tKkj5DKRQWAv/rvITlGaENPJ9AKbxTpk6xkQKd1A6LYOjitw6xC+GIBQ
	PbMrC1IcG31GRQaT+/w9/pz7i07eYt2Jw1Ny1VBnxWj2WOVV6ty0fvW0ayblAes8jVDQWjxWJiq
	nBS8xTtkHTUc5HWiv9rxAlb3IsVDX5g70rk2RTY4CdFLWoQ3890=
X-Google-Smtp-Source: AGHT+IFXl+ZQU0ypFUQJa+vOS+GCJuZ5zXtYcKI1hR5mhmtP9vTQGxLja6fjO+0lItJcB6b/6fvuwg==
X-Received: by 2002:a7b:c305:0:b0:440:67d4:ec70 with SMTP id 5b1f17b1804b1-4409c48b0e9mr101655345e9.8.1745826353516;
        Mon, 28 Apr 2025 00:45:53 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:96f1:a768:3c75:f123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f8909sm120179695e9.2.2025.04.28.00.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 00:45:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Raag Jadav <raag.jadav@intel.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio: immutable tag for the driver core for v6.16-rc1
Date: Mon, 28 Apr 2025 09:45:50 +0200
Message-ID: <20250428074550.16190-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Here is the tag containing the driver core dependencies pulled into the
GPIO tree to enable picking up the final commit from Andy's series[0].

Bart

[0] https://lore.kernel.org/all/20250220162238.2738038-4-andriy.shevchenko@linux.intel.com/

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpiod-devm-is-action-added-for-v6.16-rc1

for you to fetch changes up to e383bb8f958444620d96386811aacf6a49757996:

  devres: Add devm_is_action_added() helper (2025-04-28 09:30:41 +0200)

----------------------------------------------------------------
Immutable tag for the driver core tree to pull from

devres: Move devm_*_action*() APIs to devres.h
devres: Add devm_is_action_added() helper

----------------------------------------------------------------
Andy Shevchenko (2):
      devres: Move devm_*_action*() APIs to devres.h
      devres: Add devm_is_action_added() helper

 drivers/base/devres.c         | 11 +++++++++++
 include/linux/device.h        | 38 --------------------------------------
 include/linux/device/devres.h | 41 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 52 insertions(+), 38 deletions(-)

