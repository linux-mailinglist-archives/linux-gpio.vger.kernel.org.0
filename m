Return-Path: <linux-gpio+bounces-15702-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACD1A30603
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 09:41:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64E651648C2
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 08:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7DB91F03E6;
	Tue, 11 Feb 2025 08:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="deOZDTR1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F4A1F03D8
	for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 08:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739263298; cv=none; b=bem1NsCLVSt1olS8vttqFZnwnmiMDSws4XdaeE4eoShtIfa/gWHz6U2X/+e3w7GV0hggAbp6ir6qpR+ymTM/XZdBx91NkK/SNBAzW7GcrSSQ06CgVpuYSZAZU/18sudH7wkMwfpwo4bTAEhNTVP1MILldRw2muEaPhvfRpE28FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739263298; c=relaxed/simple;
	bh=pcZrX+J37mEd/JG2HKfBGz4YgsAx+tMGKxw2mQHHV/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ekfMrS8guYeMFO+KyE63vWYMzEr1/+wxfwJa/l6zoWmFo8MKA2ZBFRDS92qH+Gqjyfz2vEgF3z7FcPQ9HCe0l51+vYtFg4UeE8kIKYv9pIIJcvnrmRl+q6kQl+3eDu0Yy05sAtRZmtIJ1NzIxYW/upHA/ginCMIZ6lSLMcRSB14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=deOZDTR1; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-438a39e659cso36026325e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 00:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739263295; x=1739868095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aqT3P+FafKsTve9iwlQFfzcqESHrnY+X7Hzoqpf6cy0=;
        b=deOZDTR1akEYZAngizMvGEGdIitxRbrg3VAGN2He9JSwz8PGZYGIbPfziPbRU8PpZr
         9CqkxvrmyEF9zzhm7JhA2kCR+L3OlzKhXLcYlwFViolegwaWB7hq0VK73MeQiDuPpRQm
         nxUTrS2vAKU4p1HrjEjd/imIe+k9Y9daF7ddTFbmTb52LisvXFqnamywLJjNK6C62p6m
         zVmEXaqicgeJfRhfe63dxrVVXTNZtZ2MJHh1kcuJBx2JqHU/SQANfO15V/+q1BSHguHj
         pvV3uiS+xR34Nxi/xNnmkKo2NS2To6/V13AF13hEswBDALS+vDs316ybqoTEjizRIcjj
         USvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739263295; x=1739868095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aqT3P+FafKsTve9iwlQFfzcqESHrnY+X7Hzoqpf6cy0=;
        b=p3+1uH8WOxKFy/4vmZ06DMrCbPax3pBE7bXDHHzypkg/THQvBUK1UOsBPzq+xL4fPk
         xkjgGEDVsoE70BxhuNWtw/qBlBOy53kQ0v0Khsi/HZHNicE3IsQo+Ndhkoyc5q5f3AKF
         i3/q4LyjrJTgmtYFBhrs+VpFrwad73CK9iF5uwEpkKUat0HyIVbzH3ywSTrPbuASsfoy
         kqxqs21W62cc7/MfwErbpHDoLBYfYUF+T6OKTr3koOmdN5RiW4ol4fNV5IAlKlrI9gzg
         Qw+lQsyJiuP4TWUSxqH0/mMl7u6I3dBNZkeyRfh5n6ShmXtVDeDTBvTTQpwTnKCuWiNm
         +2WQ==
X-Gm-Message-State: AOJu0Yx/9GExzG2NM/p+b/CBvrLAoTqhLBxheLLoPQ5JFR8yGPYMUCzS
	QKRLKEM6LGCJIUV1Ehuxa4oZYiDHCtl514gjjSJQx9tluudx0WiAdywnRbZ0kJgitpR9tvyIsZL
	3IqM=
X-Gm-Gg: ASbGncvOc3vA/Roa1lXgkBMIab5I7nDHniXzuCF2Lq9hGHypre7yIqf055moOs4MWuu
	avP0mFFBPSNeiO/5rO30FcEFZyVYia158xshAS8EpvLTeActPyv3zxrCSyb6n4Xx1qrK1nTvJFv
	u88tcwkTnl3AofzBViGr/AfULLgIL8tBYIJHNfevWVEL2Jdr39Ymv6bMtZwIX9jSvl79T2E5XX0
	gC7k32vaczN5pWxzwu56jcOivHM04dnAxhIWBng94X+J9U1rsCVEYmxeOQ/GzAWOYqgcTAysIm2
	J3PK/9KBSUzALQ==
X-Google-Smtp-Source: AGHT+IGPEm991NB1BbIvptry/MmFm+kPJii/eBe5ogouwGf1sSmq4KA2slfZ+QecZeKet1nHZpZAYg==
X-Received: by 2002:a05:600c:468e:b0:439:47dc:e383 with SMTP id 5b1f17b1804b1-43947dce501mr55579065e9.12.1739263294987;
        Tue, 11 Feb 2025 00:41:34 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:561:8978:1d41:636a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dca34a8sm168723615e9.16.2025.02.11.00.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 00:41:34 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH v2 0/7] gpio: 74x164: Refactor and clean up the driver
Date: Tue, 11 Feb 2025 09:41:32 +0100
Message-ID: <173926329086.23265.1166908966030656021.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250207151825.2122419-1-andriy.shevchenko@linux.intel.com>
References: <20250207151825.2122419-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 07 Feb 2025 17:17:07 +0200, Andy Shevchenko wrote:
> Seems like I have had a cleanup series for 74x164, but forgot to send it
> last year, here it is.
> 
> Changelog v2:
> - remove ->remove() leftover (Bart)
> - collected tags (Geert, Gustavo)
> 
> [...]

Applied, thanks!

[1/7] gpio: 74x164: Remove unneeded dependency to OF_GPIO
      commit: cd323c6e62dd98035c141b6f751e5b2b7d490b2e
[2/7] gpio: 74x164: Simplify code with cleanup helpers
      commit: bdd603acf6a2b5056dc174e52bc8b285da529dc4
[3/7] gpio: 74x164: Annotate buffer with __counted_by()
      commit: d746cc6e64027e331769f871a595a3dd2c6b30ff
[4/7] gpio: 74x164: Make use of the macros from bits.h
      commit: e742e6b02d858ff9f6a7b43d0b1b5aae9c7e5cf5
[5/7] gpio: 74x164: Fully convert to use managed resources
      commit: abe3817fa1dcae480ec7b71ec1608454cb65d0b8
[6/7] gpio: 74x164: Switch to use dev_err_probe()
      commit: 9bd2dbe4066b3821b68f3e18ba91a3a1cd6354df
[7/7] gpio: 74x164: Utilise temporary variable for struct device
      commit: 5892cfc7db9814a71c991da7024fa03384e48924

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

