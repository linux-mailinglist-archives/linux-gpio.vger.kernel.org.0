Return-Path: <linux-gpio+bounces-15834-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E2FA322FC
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 10:58:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FA163A4CD6
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 09:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22DD8207A20;
	Wed, 12 Feb 2025 09:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EhzYAVWi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E7B207678
	for <linux-gpio@vger.kernel.org>; Wed, 12 Feb 2025 09:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739354307; cv=none; b=aOAZIBCR1ndYxyz3YyXUtMpklmC9lDvrC2hjadtUTmK0MT8ymrwC/sh5aK2Y1tYIhm20+/UQGaW0uRMHKyJMTIB19xt+v8/ulgS/SCi6mSnAIdCKCASQIGGWT435IHGJL+FyV3Xm43M4EJtOdEN+balRQJukchaIGXOe3EHv6pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739354307; c=relaxed/simple;
	bh=S15E8A+hHFoDG1C4WcwtVn82iNSvGavQW2XFU/NyIIM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QM/g9/IWVagUr9E1iFrvooOZCh7KqqlYqfbJE20EFOuMxn9WnAMXCgD6zJ4Eu0J5+1ecwh7eis1b/RSLnYa/lG7NH4KevlNXeFnn8Qmp577MicMK30W7esTA+eeyBlbsdBYjNZXGO/rCUsP5nPtbay1GELAIE2qJh0ivMOBUkPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EhzYAVWi; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso45812925e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 12 Feb 2025 01:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739354304; x=1739959104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tXCdN+0JkkY18KL8OSU6hHNRFl6UAgJHQfjogbVCiA4=;
        b=EhzYAVWijvCdbsSuuprWmAysDztwNljyO42mkb4vw85NF2y6faxwbwq7sU16hZ+26I
         Kbw5k4wcK8gZEy+/zSqFFipoD7gAjRovbPPNZBZE1r12820nX5M4NoSZozjpbCXjVaYN
         p/62bJeMZMTPVrBxEnYel4FRzr9DBGzvjwhodcWH4L1d2R5wGz/BbxjK8yBI1tI3xqyT
         oYzDJAxptsxnqtRZ9FgtVe8nygtL4KRIQb6JrcBnfjvYxFelSG+lCZLbDvWw5HV3NFLk
         kiDZkHOstIlM+I1FaJlc+rYp+um7HWelWrvjnjYuHSQ0m0qCOdAOJ2E9EA+rNyfhyb6x
         gxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739354304; x=1739959104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tXCdN+0JkkY18KL8OSU6hHNRFl6UAgJHQfjogbVCiA4=;
        b=uyfIORL1fvPMyReSZ8n9FRVOdyXhyNnkhf3IW2ee/AEgqLqm+DfbweN9PaH8jJRo16
         D2ikQAMiauQ95g0OwT+cJshT7Pbfb5l0ba8TQuA/Nl6oQT9GczbCDFtDwjZBVJHNzmK2
         sQBmyiFlKZMoK/OnfIiNaKY65k2uc4uaFkfJDIEhMZ1lfvnZH7wBJ1HfA8jGLBLSO9VW
         kaMaVQ8bt8BzWegMmJlK1okh/cDyrB6mGILvCBUOcqcuoZ7xR2JEPFx1bwxtN8oLxkE5
         baMYnohraKi5JNjj1lKyKFfk0tlnnZYBYGszzNcMS47BjOHX+7E6j55/BI6iDqn7IMFZ
         CekA==
X-Gm-Message-State: AOJu0YzCp4cuDya3+PzBenZgfd76ogUB5VHWAeYtiTXCjFUBmPTfMdvN
	2DRwOjxUViAYBQtPFRgTF4AgpoRDLbwCQ2j6nqb+iikDpF8rFajrX3uOdfdM8j4eCqZfn7XRpu9
	XOOc=
X-Gm-Gg: ASbGncsOR/EntHyu+N8WuYDXQYhBIjIy06wwfm2f5zXbsTFJ/5OOtyeld/6j4Od3JX+
	2oMfnkh2OXWWruVmztiqAPNiY9B32/k34BrfQ8QH4F1JPAi5+lG68lH98XZ54P4dpJuVKpmmLyq
	Y5aWXfVLHlXHkbPv0duVi76Szj14T/ECrC0TdRE7sjmdN94Yhrf0EN1G3dBwUWVecItLnjqnPd9
	/F7MdwMj2s2fkH8+TLiNbZ5trOht7ti5J4ud9RP4oMgoDJpirv7QAKxBSlIuiyULPTcLwmV49Il
	JxINcGCVkj/rYjk=
X-Google-Smtp-Source: AGHT+IEC+Gn+QY0QYIabf+Hl3KXlYWU8d1F0mJV1sCSbwbfbBxRgth+shDbPFtARl1s9kroKk18pjA==
X-Received: by 2002:a05:600c:444c:b0:439:477c:cf73 with SMTP id 5b1f17b1804b1-43958176299mr29395355e9.11.1739354303696;
        Wed, 12 Feb 2025 01:58:23 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:521c:13af:4882:344c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc5e6f027sm15055093f8f.4.2025.02.12.01.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 01:58:23 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 0/2] gpio: xilinx: Replace custom bitmap APIs
Date: Wed, 12 Feb 2025 10:58:22 +0100
Message-ID: <173935429949.14007.9294735731624784387.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250205093200.373709-1-andriy.shevchenko@linux.intel.com>
References: <20250205093200.373709-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 05 Feb 2025 11:31:09 +0200, Andy Shevchenko wrote:
> Relatively recently bitmap APIs gain a few new calls which may help
> to convert the GPIO Xilinx driver to use them and become shorter and
> nicer. This mini-series does exactly that.
> 
> Changelog v2:
> - fixed a regression in patch 2
> 
> [...]

Applied, thanks!

[1/2] gpio: xilinx: Use better bitmap APIs where appropriate
      commit: 2af1f667532013eb354c783514839f89d9923240
[2/2] gpio: xilinx: Replace custom variants of bitmap_read()/bitmap_write()
      commit: c11708e2b66b56f102bac83980a52661996c2a21

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

