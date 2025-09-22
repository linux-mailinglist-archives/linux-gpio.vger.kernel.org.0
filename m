Return-Path: <linux-gpio+bounces-26460-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E23B91A85
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 16:24:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30EA82A5349
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 14:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC214212566;
	Mon, 22 Sep 2025 14:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="S2HgMCOH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5831EB195
	for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 14:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758551071; cv=none; b=CvZY9aVjTrS656RDdAGGUKpdPGp8DvVGQ3PqYeupV/q64oWov7HzOiP1c9aLy8lYwTRGrNTG+q64HcSg9zMaJfAkWGWzV16ee3W7ZlFi9PFYWyQqYMvxLRczvtDMBTdt0NO76SEGKkmP7rm3QEDqMdxLNe0frJsNUGMe1E9T4Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758551071; c=relaxed/simple;
	bh=Oe74uDY3qf44VHSaAlFOrOAr91j7S+C9t3V0aNVHzxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PHPkFUQ6HBVtTbevwXFkeT9p6UDZZJswJ2c+clFwAHNAqa86gs/cizDkuyAN7mKS0lEhZNK8uxbLrLQtTAcpulhKiR6fOAjRYILz4vwc4cMZ5uLU3ocd2D+OAASR51VPKyNQie0Dve/6jNmN1GVCXd1o2Qd6pRuHIoLvTan9pxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=S2HgMCOH; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-46cbdf513d7so13398325e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 07:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758551068; x=1759155868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NoE5pKWbt7zgWUP4zjAVnETbjrj2vk0DVBGqfLHW5w0=;
        b=S2HgMCOHWsdfAm+QBSYNwOv7x6RY5yH0ezzcejVL4s3XNMr56CLYmghgXf/UcwYKfN
         95IjPdHD+A1TzpFANWGcmJsiJE95KvyutAXjGI1uky3gqBoOQoQubRQTHwMqa04gj0Oz
         yyBiJLWVZLU8ollgtcwzAnfzqb7PkpVqd+oFidJt3ZxZGJl2WPkJBsfVOCVhzPH1ssqH
         Yc3Bl3en9O0//fd5qdhLi1C4IJTTi1RFjsW1jf9UwKE8jXGjxt27Vo0fwxY9EhI+Ybpe
         nlcTKtP2ozkVp2OoO0hd8KI+LP1uwhDHZ1FxXgBUXKnxqvefJfNur8EuApQZweDpYwFs
         smZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758551068; x=1759155868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NoE5pKWbt7zgWUP4zjAVnETbjrj2vk0DVBGqfLHW5w0=;
        b=HRe8nWVsJQiNz0VVF6DuQT1KR3RRglocjyrayF/wzHzfhlHeO6DoCpfh2WsGwi1t6g
         29TYeOWWbEDmYNt1cxXuLWIv43FvR6Y9Sg6l++E3tC4Zy36FWvaRDlPIUI5MVZIWksT/
         FSechHnR7UmjgfzqFMB3U9YQEsl4GKq3iF8QmhFXY/TrrZ3e17O2kGnTmaLRhgucu3ud
         DhMk/5+W7Fz7zETmQXu71M8sbxLvOv58b6PlWUiyHxRGHBfijVQ565/pEo6obVdDshz4
         4ugOpY+h7ZgBGL4XXpxdYOBUay0VTrAWFbZNtjKINdADGT5oNT+c+Z2d4CnwlnOdPzwu
         mQXg==
X-Forwarded-Encrypted: i=1; AJvYcCUbOuPZ9AVGRLqdTHXMBu9Cayzo2lgLTGxV+NZVVrvGn/zLPMFRJeLq57AsjfhFHmOXL7W9pfr33zA8@vger.kernel.org
X-Gm-Message-State: AOJu0YzHDiPdKdLzEodZZMey8Zs6986bGLzcHS4WcWEtgfh0qQl2U4Gt
	RKsxClWJlO7+b/qvVaE7lep2SHn8Leub3/lqNgzGSHzoWlfNAiZdLMzIuYpDWahBaMM=
X-Gm-Gg: ASbGncsOtdqGDhAFJSXuqcBm/QitCuIdCTgKaUdaaTNO6wqvC5FJe/EQo28Qj9orA5X
	AoLdHvSq3S49e3bdGeiR4bZpPFJ+JygsqycdX5phlziGPg54ivkAi2AbKS4W561A57Ug05mulYG
	WieYgt3ZY9QHVENTbRJy99zMaYbPb+5A5cNf+EaFs78R2bX9Pwa49QQeWr7u5fUGx5k/xPigQq3
	0f2/xngUFXy2X9p8I1RafucaMtld0u3jQgrVm2LsZvZSYSeaQYZHUjsozh34genKtg9534g8H+K
	nwrlbqZGHVoABhvYBd608o/YIzuf8cURm2skb8C72gjW4NLiAQpCCBZHCH2xiL5WLEMu6P8MNog
	Mf5P33YT5cNiBBBPJo5AJR7HiLlJsDnKKDQ==
X-Google-Smtp-Source: AGHT+IHzy2P+yoAem8bjuH51YJsL5dj6hh0tzCeowwKpBsTfXqE4o0Zpx0SdTP2F6am7I+7s/9+zzQ==
X-Received: by 2002:a05:600c:4fc6:b0:46e:1aa8:44a3 with SMTP id 5b1f17b1804b1-46e1aa845c9mr13120055e9.37.1758551068124;
        Mon, 22 Sep 2025 07:24:28 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:824c:ead0:65a5:c51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee0fbffaeasm20106161f8f.62.2025.09.22.07.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 07:24:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Hans de Goede <hansg@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] gpiolib: Extend software-node support to support secondary software-nodes
Date: Mon, 22 Sep 2025 16:24:26 +0200
Message-ID: <175855103332.80479.15136170507041580366.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250920200955.20403-1-hansg@kernel.org>
References: <20250920200955.20403-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Sat, 20 Sep 2025 22:09:55 +0200, Hans de Goede wrote:
> When a software-node gets added to a device which already has another
> fwnode as primary node it will become the secondary fwnode for that
> device.
> 
> Currently if a software-node with GPIO properties ends up as the secondary
> fwnode then gpiod_find_by_fwnode() will fail to find the GPIOs.
> 
> [...]

Applied, thanks!

[1/1] gpiolib: Extend software-node support to support secondary software-nodes
      https://git.kernel.org/brgl/linux/c/c6ccc4dde17676dfe617b9a37bd9ba19a8fc87ee

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

