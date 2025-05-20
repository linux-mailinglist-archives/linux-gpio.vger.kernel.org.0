Return-Path: <linux-gpio+bounces-20330-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95794ABCFC5
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 08:47:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 836EB3BAC1D
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 06:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1C6125D1FC;
	Tue, 20 May 2025 06:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LcxCljz8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146D52566FD
	for <linux-gpio@vger.kernel.org>; Tue, 20 May 2025 06:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747723548; cv=none; b=uQ5rl3YHlUIa3FkFWWWk31Ku+A9KFbOEXmI7J1N1cCS1kUhCtQMT2j+lHzUrD5vHJIb7yfULaseMdVMyfH9FBrPJFZtXeUF3BOtVGMv4tOTsC82vJG+8pv+FjRlbiNU6x1BdG1GDaRjfwqeWYZWsPyWX4XRUPr3DgMhXxeaA56g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747723548; c=relaxed/simple;
	bh=P8d/IuXP++zCB6Blh67Pa80slPlhVjST05vmIgCy2lk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AbPhDFw0wZnJ1JsG7Tzln2HHFVei3IcWoBWdEjOMORwJugR7FZNDXMpc2GMotD1fcedureY++4wG7Q6LzzAJvcB8fiV8rUf9oi4EQ8D3I3o6qeo3Xb/EmBNa8v8lOgQTCVECz42aRrzPigtGqgSFLlaXr8aKvWYO7q4y7pphlLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LcxCljz8; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a361b8a66cso2220566f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 19 May 2025 23:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747723544; x=1748328344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SAMPdzl2AAvyOPiCE2elPcygqsOszaH6ctA4iqiXgBw=;
        b=LcxCljz8a/UzA+aCnxbcMBhAzOGRRhjZVlkbi5tG/z066zJm5d4/ArUWEMFn9PJOkx
         FgcuOrVWLNn3piKqEFctdYMSAOHOotgop5WDFO9HnzzQRRwA3scv94ooTJkHZMrmsu2z
         NRkrRpF/WsnvEqdvbvYIS4TXeSfPIfYS+u5aqKmDSbNDqkmMbVKmUXyJI2euhyBi0VYL
         +6fejcMZi/OFCC/nA2U7CbBaTaSw7BBM6TKJIPMVhVdAxbXPqEdGXrAt110DGnRGW573
         Q3k+LcuJO4fzoz5odiwJ64qbAnlh9Wru4UHZjATz/U6VrnyIL/KQ/wBt8DVeK2YDYCG8
         YUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747723544; x=1748328344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SAMPdzl2AAvyOPiCE2elPcygqsOszaH6ctA4iqiXgBw=;
        b=DIHUuhwUbwb7fJT1UAYhLd/iHMLpmGXhk1oHJZAlAEJMMJD1zfbKI/PVwR3N4gKzKp
         vNIYDduARoAISok3XbDzvYOmgH7OihrrQm+uWpAwVwTiEWApVd/7G4cdxTEtKf4ZPr5u
         8acI1XADQxFUg4CZYe+RK7gznutHuRlHLbIG3A3XwWsc3Q2Dz1SI1Gntl8DVXdYj5HHw
         Z13LQa3/dG5lAA/nG+tgjVJNn6XAGYRpMHwmjXxArSkfEIG5pwBp1jD75IkG1Wc2t5U+
         PLZetYmv4Cr4pVxbkiLF69KThZl4p43g+VxkM0xIrge1l9F3RQ37+ptKhO4jgbHywxqz
         uvwg==
X-Forwarded-Encrypted: i=1; AJvYcCXQiJC6ra9vf9rP/v2IT+v2stl94h/rQeDMAIj9vZTOv/adnN/3ompp+nS53pC1Vtv4CRn+D5EzWiIs@vger.kernel.org
X-Gm-Message-State: AOJu0YynVIG4ovM0eJRXLhS7WOkUXJOmz4HKSPR0eYVKoowv2oSzk86C
	yJ2hHVfP7vZL9TIXCR3UClQs3Sht3degfRXtWhLYfWvYrXcO6oxmdTTkM+yPS8mzGEk=
X-Gm-Gg: ASbGncsGXQCuWPCuslp5RJoBTJ7RJtTrfh/7D9UErH8Gz4rj5FLfsaYPAi2Vm6x/oaM
	TkWGhFcgpkkXeMCrSAFdua5UdrAgdFa7trlw0FOj3+dlPRg0ekvkkicnLIpeNlxWGj7fKn3RBg1
	JG/OD3Noq8fKdte0qtC/VwwIF5yV0yGUpSxRab43hn409o+8HzpWIExnR7/AV1A73wYzeVfXj9Z
	cYZmJyb3/TDjWp3x83eLq0yQdaql+NbOpa+ABa8xYbM+9WM9KGGGr38LO9sfX2QOrqLse99sXp7
	3twrzWzyfAR37tZBNkqzEhez3+up+/ZMq1fEyTVwRHzRUKWG/fHj
X-Google-Smtp-Source: AGHT+IH4cIKivXXpB58yg2kOD6SRNlcLlJhLLGF+B9dpXs2VRqbmf/U9Mj+4c+Rz8jNw/vz9uz6gpg==
X-Received: by 2002:a05:6000:186d:b0:3a3:6b0c:a8a3 with SMTP id ffacd0b85a97d-3a36b0ca9b1mr6519169f8f.17.1747723544128;
        Mon, 19 May 2025 23:45:44 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8de1:6e0a:4ae4:1cd5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a365bc0b5esm11585660f8f.9.2025.05.19.23.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 23:45:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Peng Fan <peng.fan@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 0/3] gpio: fix Kconfig issues
Date: Tue, 20 May 2025 08:45:42 +0200
Message-ID: <174772354096.8700.10357878300665068417.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250519-gpio-irq-kconfig-fixes-v1-0-fe6ba1c6116d@linaro.org>
References: <20250519-gpio-irq-kconfig-fixes-v1-0-fe6ba1c6116d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 19 May 2025 13:10:40 +0200, Bartosz Golaszewski wrote:
> This fixes two issues with the current immutable irqchip rework
> signalled by the build bot.
> 
> 

Applied, thanks!

[1/3] gpio: pxa: select GPIOLIB_IRQCHIP
      https://git.kernel.org/brgl/linux/c/e2d9a7ead8ffbf562c4f38d3115f98d1933e360a
[2/3] gpio: mpc8xxx: select GPIOLIB_IRQCHIP
      https://git.kernel.org/brgl/linux/c/8da238b15cf5eb8a8dd318bd47e4d6050f5ca5d0
[3/3] gpiolib: remove unneeded #ifdef
      https://git.kernel.org/brgl/linux/c/274fd5fe911956cdebeeed65981b7182d57c2773

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

