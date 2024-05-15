Return-Path: <linux-gpio+bounces-6380-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF578C6355
	for <lists+linux-gpio@lfdr.de>; Wed, 15 May 2024 11:01:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42E631F23947
	for <lists+linux-gpio@lfdr.de>; Wed, 15 May 2024 09:01:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C08B53365;
	Wed, 15 May 2024 09:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rn5KWZpN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B2C59160
	for <linux-gpio@vger.kernel.org>; Wed, 15 May 2024 09:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715763696; cv=none; b=ib7MwWVJz0eRcdRW5g17qBr5VrFcMCN8MnUvooi8xER81vK5EZQ+DWlNBtO3VBAR96aPnOT2/4+xYcUm8gba+Jy6I6e5U/CzZartmDVEb0hmZvqMWMgQERyBaSt91VbE80q/0EyYYMFsg1ElP+UxWtj5popkYe012DltaCoKUnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715763696; c=relaxed/simple;
	bh=OIdeNrJ5m45u6n+BGTaPQOsceagFKwLgFh1OCqpPfTQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tPh0FPuccIgt7u7nkUTAKLLL5GFUBtvyEWhMHpX0o0NCqx/RVJggDQqcCJOHmTTRINMR3sWOEiUv2BsAk8/ISUQLmXCO8hLLcjawmFWJNheuIsZyEhQj+BnuRk6gJ1SQqTCWDFrO0KNCI95zaHDRIsRiajtFIfiKWZ2rX8rcEzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rn5KWZpN; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-34f52fc2191so3462068f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 15 May 2024 02:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1715763692; x=1716368492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=66c9ZsX59Jv3eo88KAnODpFWcollffmpvZJrlc0woxg=;
        b=rn5KWZpN273eEVoVxNVJskH9FGg+dpf/O9SRl6T6IFNTFhYwfQuLVqXdWKEPEzgnRp
         6Q7CqqHBZ1RB38fOXrHk9W/nk1KqVOKrpTBG1vXjiV7FQo9e492B/2U26aRQX/tBLxC7
         v9FegqkmSGcVlhGNSLUVkELd/N5GEIzGy10S8RgqcYE+UQKMuegmwrnrMg90OgFMs8TZ
         QGpwqmfKl3Mwx818jlqt+TZetOjtMDPn1lXtFd+nNq8g9eh4h6+/J6ENC3nLJcXFPoyz
         3SF2v+CzKu778okM0jyponWU8yGMTkdxh0iuii9SXaXHIzKXUfV1ynIRwVUXR+O9G+H2
         2n8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715763692; x=1716368492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=66c9ZsX59Jv3eo88KAnODpFWcollffmpvZJrlc0woxg=;
        b=E5aNUEReFJXleC4jKWEuAj1tUK0L4e02R0/HsdFYux94LtMYOgz7KrC+1KpCytap0L
         MxrlKI8OAnJbYnnfrQwEDxLlGzFNiY+dwNINw5snLQ3wDpeTIvJQwqFvvfvUGe5c8MRn
         MdECzcfjVLlgbMRu+PyygW+cGvnfS7rjdMLM3gZFtQTL3M8g2LKyUS88iUhjRzGHMotm
         FbH04ymjDHREdXIQak5/bZ7RSopiO8uq5jsBQOW1sFITb6EdADi7M9Pzmxbawxy96Cpi
         tJYHJGnhrYzKp463RiMbVQkJW7afan+b4krnPVCimglbIXktAXiA9ibAcLRGftMijxOy
         42PA==
X-Gm-Message-State: AOJu0YxVY/ce0FVz4vNumjnkwiv/c3M5iqQ/mYQXnMCgw/jH4x2xmfCt
	/eQT1ouNJ+RyWt6SK1ukKgzgfi4eK/zXjWQKhIUH0RCDKgIHbKeaEL05YLT8AvcCrSJtEEToZss
	XGlM=
X-Google-Smtp-Source: AGHT+IFOqMXNMDaraHTSxxfEwtFaEE5+dSpo6Zk/QYWrTzG+QP7z0ka2HGP6PuS4Cshhf3WmYxvOFA==
X-Received: by 2002:a5d:5351:0:b0:343:e02f:1a46 with SMTP id ffacd0b85a97d-3504a62fb12mr11918577f8f.2.1715763691660;
        Wed, 15 May 2024 02:01:31 -0700 (PDT)
Received: from brgl-uxlite.. ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b79be05sm15984277f8f.9.2024.05.15.02.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 02:01:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl,
	Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] tests: add enable_debounce_then_edge_detection
Date: Wed, 15 May 2024 11:01:30 +0200
Message-Id: <171576365891.43175.8496638797441038281.b4-ty@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240513160031.309139-1-warthog618@gmail.com>
References: <20240513160031.309139-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 14 May 2024 00:00:31 +0800, Kent Gibson wrote:
> A bug was recently discovered in the kernel that can result in the edge
> event fifo not being correctly initialised and stack contents being
> returned in edge events. The trigger for the bug is requesting a line with
> debounce, but not edge detection, and then reconfiguring the line to
> enable edge detection.
> 
> Add a test case that triggers the bug.  This will fail on kernels that
> do not contain the fix for the bug.  The test is located in a new test
> file, tests-kernel-uapi.c, intended to contain tests specifically
> testing some aspect of the kernel uAPI, not libgpiod itself.
> 
> [...]

Applied, thanks!

[1/1] tests: add enable_debounce_then_edge_detection
      commit: 0a552e7908896b7b96fd502052fa7289af9f6e7b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

