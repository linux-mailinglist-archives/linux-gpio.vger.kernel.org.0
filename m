Return-Path: <linux-gpio+bounces-7616-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B355491277C
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2024 16:21:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75A2728A8CF
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2024 14:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DA8C1CABD;
	Fri, 21 Jun 2024 14:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="C0V1Ihdp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8972C69B
	for <linux-gpio@vger.kernel.org>; Fri, 21 Jun 2024 14:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718979672; cv=none; b=X8YoNaO/IbXad55ajFrBYzlYP/TGgUHaFXWbBJs/cX6PUEBrejaV9R3ZKLZndaCrDB8tVIs9/x/VqWRCmMt0lwoxQQCD4qQmzZLjsJ/WoVDMY7f5kc7IrhJ2BQQjN18KGDS3SFtJ+QAPYtJQnm1NVW0Mxedv5hjnoHrT9uDx6r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718979672; c=relaxed/simple;
	bh=u643VJh2oU1OtvvUxbU6rDcSMmWtMVuATUFQDSbqB1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ch2sEPzYxtXtQzBtIJZa04C9rpC2EWId2vm8pq+oG/9AdG0ZFzl5wO0d6o29UyevjMtUfN+c/aSBznq700mu0xfJAvBcNMbJPb7jjyAKujurmJwYavrEz6exgg5ncsK1alpOyA6NXVXi7LiDCnKwl7es7AcIekt5DCVUoV8qHFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=C0V1Ihdp; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-364a39824baso1575839f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 21 Jun 2024 07:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718979669; x=1719584469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S207Ig52Bpf6LcZJI3z8V0iTOAy5HZYvaWdXquSHjE8=;
        b=C0V1IhdpFyuTAyHrjqiInka9RMNSdPSEYQZRs2PqrcuufYajytrgtpTeisEmrgrFRR
         iOO+32a9GtHlvajTaxxUoluZo6XmaNs5n4PMbzj8CECPbqOLBX/MxfvGSclHeJwfof6Q
         LBDkWeHet3l7r7nkY720VMJ6mMHsmD56SocUrywPWo2rmB6v2iMIsuKCsQ+uDrPBpt2v
         gOneD99QG2W7wj3TSvGWu0J0m7nJ+QZBEAuwsKFo9Y1quNIoZ4cD6VtSC2yUPAtAGigK
         Rt1KsP9grBX4s21nvLku0M4Go6lQDFa46wrUg8AwNK0X2SFZaAIY9HXKhSURkkeJ6Je7
         Txmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718979669; x=1719584469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S207Ig52Bpf6LcZJI3z8V0iTOAy5HZYvaWdXquSHjE8=;
        b=lK5+6MJbcoI3fthkl7XRdGUZW4P02ZDup904YAp//pglzxKP8EecX+6A0ZTJwPWaiB
         aQ18E0c7O+/3m0fiR8kdujUgQLs+hu6zZpmvJeMzKNuL3p+AigITUbdhvSao3PgV5f8p
         vIRs3LNE+49bEv01x2zwNNA/Wz05ukpnbAXWhmrC53/wHYrBOppD1qT7r7ZS1q8Qgqme
         YPr1vQ1kCRIwODxeK70V90EGRieU0XAA+icHCxOZqpBHLhTpjkCG6JdyOx5IXgzE/FfY
         LMdPL1hNUfFM/cXEh4P4bAO0HJF/bZSemy8YRFYOtkJnJ4vUFDJNJB6UROOOCKFuZwTf
         v5Mw==
X-Forwarded-Encrypted: i=1; AJvYcCVqxuOu5jRRs9fMcJezkXxORop9PeWIIyWxJlL1lM+psqQSSddqoV7PbqNIXtAGvm26fgfdjde+apny+KJkxOFuAKNtjnoA0OYW3A==
X-Gm-Message-State: AOJu0YzgE2/zUzaUv6UDTEsPUjsmPCEYanjCvog3R0sRM98uOdQJsLnl
	joMRdSZN0rK2gPf5xAH8amEIpFZyRUUI4BMfvxexRgLhfhBH2MhTFSd0AQp/3ug=
X-Google-Smtp-Source: AGHT+IHwelUxlHig5WHO7wvrctg5rxkqKt5u6s53c4sbYnwCFPVyK4QD9+b9IJ4xs7uN8noMbw/ZDA==
X-Received: by 2002:a05:6000:154c:b0:365:f52f:cd39 with SMTP id ffacd0b85a97d-365f52fceb8mr2356725f8f.50.1718979669492;
        Fri, 21 Jun 2024 07:21:09 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2c93:fc28:1af9:fa5a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a2f9924sm1886848f8f.72.2024.06.21.07.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 07:21:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Ian Ray <ian.ray@gehealthcare.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: pca953x: fix pca953x_irq_bus_sync_unlock race
Date: Fri, 21 Jun 2024 16:21:06 +0200
Message-ID: <171897966254.11715.12696876070141243343.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240620042915.2173-1-ian.ray@gehealthcare.com>
References: <20240620042915.2173-1-ian.ray@gehealthcare.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 20 Jun 2024 07:29:15 +0300, Ian Ray wrote:
> Ensure that `i2c_lock' is held when setting interrupt latch and mask in
> pca953x_irq_bus_sync_unlock() in order to avoid races.
> 
> The other (non-probe) call site pca953x_gpio_set_multiple() ensures the
> lock is held before calling pca953x_write_regs().
> 
> The problem occurred when a request raced against irq_bus_sync_unlock()
> approximately once per thousand reboots on an i.MX8MP based system.
> 
> [...]

Applied, thanks!

[1/1] gpio: pca953x: fix pca953x_irq_bus_sync_unlock race
      commit: bfc6444b57dc7186b6acc964705d7516cbaf3904

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

