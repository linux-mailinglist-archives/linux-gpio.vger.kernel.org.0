Return-Path: <linux-gpio+bounces-15832-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26244A322E6
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 10:54:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD101166FEF
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 09:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95E21206F21;
	Wed, 12 Feb 2025 09:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rJNs5C6o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF7735956
	for <linux-gpio@vger.kernel.org>; Wed, 12 Feb 2025 09:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739354042; cv=none; b=d9nHrF7zal3GBJ5XrUEMyn70iwmqQ/pxGvL1tEa6fbD60J4FHrMjXurDj1bWspfxWiswce/TTBTyn456s7+TOYCDy1B+LC9C0fP33Pffng4J3sexXV/PZMSUY4yhyXA5Vo5xyXjI5NVi/rH8GS4rwraJkADbJWFOuPormxpnRSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739354042; c=relaxed/simple;
	bh=PZMdbK+5409eVJVCWqtfrQHw1QcFuT5g6apO0nOaPtc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lC/Ho+CKRjHVHrG3E6vtwMPdig+xqagu9oUDB4tdryzuuCCgomxtwDQgVGZ8u+dIIx8ZG9qC56SEG0jhfq4YIksW4hfKHBLSJzd0G0IG2EYQ1q8vkU9Y/qPOlbxYABwb3+AXFqN/tOfz+yN6qyZObS85gvvl5BHJrk59M8ZjgIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rJNs5C6o; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38dc0cd94a6so3146972f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 12 Feb 2025 01:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739354039; x=1739958839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tIR7kxuCYlEHmDo3YVqs1C3HW9gsJqd1zOT7FkNeONI=;
        b=rJNs5C6o1myS/dabDPlyvOgRNVMkwHsc3AftOwVes5E68Oqlul7ykNq/gZNJkTRBZx
         Vx7SzN9uY4uSbn6ihsrFNgMDpzkKjH7HBv9qyaLSxfeaXfFcndkQ5MTy70IWc6hChzgV
         b2dTbhPcO7qoGWCbI9fWU23Lmt3U/5VThnSYqV3CwGiuAliDbIQni5/Fjn6lm7Xibn/C
         pSEJ+QGXP1uNk6tFBB7xWZf1ugfK5bK1H8aBaKIud6arS9XefFWZk0rkqPnnk6yzvS9Q
         t1XbsO4YA9AzjWQ40G7DNrNvIzBv2Sk7VHwUYk1Ys8M2rfECKiywBfjtEM5Pc1rDpAhI
         ND5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739354039; x=1739958839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tIR7kxuCYlEHmDo3YVqs1C3HW9gsJqd1zOT7FkNeONI=;
        b=jiuVQSc6Sj3wiaIa6wpHRNd/RNMBxVHlQR7ynbY43cxqfLwt3p3QqXn/X92xwcyn/O
         eHWZu/wvZg1rxyIJxGUqc2I+/Ukzy0DYy/POntADvqCNL9sHVAv5RKzQJE1LRW21IXfI
         6qy8/3Gi0hfxYqBjY35f/sTgVsKF3vmgYHylOfaZFy5wYNP8iesYV6chAcHpn1qS7cv+
         kMfkqRBIau2v86NelNBYLEGLK+JSyIEqFtVWCCFm7CeqPsWkUpkixvO2R4TwTeeHSH/R
         2eRjR7rkuG7G2/Jf2tKKzleJVAwIvDyF0WbcEdShQg0TfWdiVh2YOC3MKiH3usOugNjZ
         noJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXrCxGDQEUd+AW2YkuofSqsgLU9bxyvrCoDftCvAPL6zaF8Tg/RXoZmwMHijnYP/Ii2wr6mnV1iNAT@vger.kernel.org
X-Gm-Message-State: AOJu0YxfEnijx+shUwGOUcF6JVNgM+/A+MIyAVrvk9oV/Bj/YY782zhE
	cPwN3LjPhe8fS1fu/bheZKd+QuqpVoXeYKq2xMBsXmn4Rnbei9pnViIRYShqlBI=
X-Gm-Gg: ASbGncszPUeFc3qGUkBagZ4e+6jPpFx3osba6Hw4ZrQZPWoOHT3KLSWx6PyjXCoit3a
	6LZic9d05ankwj49vQC4pjcYBc8jQiuqgTbYLU4o5zv9qyheWWqZSOXDT/7qwe8/oJFYtw7Hfy8
	K/aPWqDvGuFZgZbwIw32PyKjJX7mdy9UNCPhLpK2fPM6eIaKmBz4q/zvr6AoZ4s20+JhZHz2yKt
	r6mate407xXcKaYxQIod3h1DV6nOq4ty355lbxbLgRvAkQoTql+Aqvae6lbxu3NQy6rlyNud758
	tvxqVwVvQ5xLkwc=
X-Google-Smtp-Source: AGHT+IE1AuIEYHupLeeT9Nxbe+qdld3vOkKKKz82MsP6O3GVbjl5NUVtbZU3jbI1vKhF91kVaT9XZA==
X-Received: by 2002:a5d:6908:0:b0:38d:db8b:f505 with SMTP id ffacd0b85a97d-38dea262832mr1371554f8f.17.1739354039252;
        Wed, 12 Feb 2025 01:53:59 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:521c:13af:4882:344c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38ec2d9b299sm842935f8f.56.2025.02.12.01.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 01:53:58 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Wentao Liang <vulab@iscas.ac.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] gpio: stmpe: Check return value of stmpe_reg_read in stmpe_gpio_irq_sync_unlock
Date: Wed, 12 Feb 2025 10:53:57 +0100
Message-ID: <173935403447.13404.4893974637827879328.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250212021849.275-1-vulab@iscas.ac.cn>
References: <20250212021849.275-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 12 Feb 2025 10:18:49 +0800, Wentao Liang wrote:
> The stmpe_reg_read function can fail, but its return value is not checked
> in stmpe_gpio_irq_sync_unlock. This can lead to silent failures and
> incorrect behavior if the hardware access fails.
> 
> This patch adds checks for the return value of stmpe_reg_read. If the
> function fails, an error message is logged and the function returns
> early to avoid further issues.
> 
> [...]

Applied, thanks!

[1/1] gpio: stmpe: Check return value of stmpe_reg_read in stmpe_gpio_irq_sync_unlock
      commit: b9644fbfbcab13da7f8b37bef7c51e5b8407d031

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

