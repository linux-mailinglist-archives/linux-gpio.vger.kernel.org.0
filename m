Return-Path: <linux-gpio+bounces-5711-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B238ACC6B
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Apr 2024 14:00:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89E921C2148D
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Apr 2024 12:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 984E6146D53;
	Mon, 22 Apr 2024 12:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hs/ADaL5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE3B146A93
	for <linux-gpio@vger.kernel.org>; Mon, 22 Apr 2024 12:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713787222; cv=none; b=UULhIjaHtCNpcF+XqTTzTmNgjLVMqd/ue85Z1SgQcP5ExruWk8b7adx4GZhj33HKm1mLGX12mLNowGl+b12JQzHDEYU2+qa7vmRRlVSUB8v/ClEdKqTtOHOLcxhlCvh3aEYrtJ4iH55m1AH3ug4bfH1jaNMWY8UtD0QbcVOKpho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713787222; c=relaxed/simple;
	bh=aUeq+9HkfsVjUgeuRNmXM/3pB1Vpk83CSga7MypB6ao=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uc3QW0R+YfGAY5CRH1PDvTI0yIFyF9i5qWiepdznjZIR2pIvJ+V3VTxffS94Pg3ErT6TguRyr+tI4Z9Rq0LIYOwwm90BkeXEs4iCHGCv5J8kpwpQHa/nT9nW2+yzvbrlhkmSJnsN7ctACxcLJr9AFV+AkyDc6K381bgLX0VpDIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hs/ADaL5; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-34665dd7744so3251773f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 22 Apr 2024 05:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1713787219; x=1714392019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=urxXw+V78rgcW1lZLXZyUF//DNEOBPjNxOQ6gmq3Soo=;
        b=hs/ADaL5XQflub4PnfAXm6i4tO46XfgwfaROOopWEOB5nLsMmGD9OKSJDlCNN2y55X
         6iRNJ3iij7neS5y30wVQ01jHjBhUOsAycORfm72NKkCqjCBg3NkuqmICdhwDBlRCOlg1
         CG1P749vKjBYHVTK9De3mlgzZ7q+XRTTNT4xdjefCFRfor1KNAa7Fw8kuPVRouimG9C8
         wNfcNCNtMDvYJ8rXYBnsu9MMRek02zv20Q7vGcbANhhjSgxoIWaXOlMJfH7jjSkA5ebZ
         lNWoLykxt7jfZrHXNSZ7yVWsPdTDHDJUB505Kwm40Es+uQ9syRQ/QHwDXtR9Jo7AIPW1
         0ciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713787219; x=1714392019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=urxXw+V78rgcW1lZLXZyUF//DNEOBPjNxOQ6gmq3Soo=;
        b=DVzkAnu+6oT3soMEy2SxK3lcQj6EgAFT7lYRnrT7usmUxvlCC7W85p6vl09bHVBhgr
         b0OjRswXFgsw7g3AMMW9wE4NnhRSvRr2vktxwTD62o+xZK1VgNGwnaCSZfrUpKwD5VG1
         jOHIaDnSOGV9IhEsptaS2zb8Yx6dI+WaYzz9tXQPMIaCaHGU3c4eUvXU3aqbYs71LItv
         aKxELnKzSFAaehBPLmrLkjj61JwVSgFN/vNfKES+GjwzOuL6XTVPTiExG8EU45TAFPgo
         okvN95T0E/v5raFcqwH0kvVtphnuQ1hSZRptKXiqk4aeXbNCcDNrswDakcjb9KxE88OM
         dnJQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5IFqS40kyWSP7WMgYDhF96NdNy3eF5qHcQzM1Kzx/cK0nmH8s7/AmJUEIEkh6zOzZIn8JxcvemQkvYP1W8HK63xkSQ6khEd7rOQ==
X-Gm-Message-State: AOJu0YxA/bV6h9rVRO5pXJjzna3+jD88R+MKnTz8+p/wFpInFshDoyug
	T7oI1oKO8JMpGe0K7q1xjh1DCSigwGi4K2DNUQuWb1EGxZQ7yZ8/SM27c5yV4fg=
X-Google-Smtp-Source: AGHT+IFPgf3HiKn+4jFSXKN3g9758WhcGHBHRQ0cOG5FAatrz+fIXj1Wgb8/4aM1NSTD8APlUfaM4A==
X-Received: by 2002:adf:eed0:0:b0:33e:c410:a1cd with SMTP id a16-20020adfeed0000000b0033ec410a1cdmr5903847wrp.69.1713787218679;
        Mon, 22 Apr 2024 05:00:18 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:6981:a121:4529:6e42])
        by smtp.gmail.com with ESMTPSA id p3-20020a5d6383000000b00341b451a31asm11831720wru.36.2024.04.22.05.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 05:00:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	jonathanh@nvidia.com,
	treding@nvidia.com,
	linux-gpio@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prathamesh Shete <pshete@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	mochs@nvidia.com,
	csoto@nvidia.com,
	jamien@nvidia.com,
	smangipudi@nvidia.com
Subject: Re: [PATCH] gpio: tegra186: Fix tegra186_gpio_is_accessible() check
Date: Mon, 22 Apr 2024 14:00:06 +0200
Message-Id: <171378189683.23616.223081945525265669.b4-ty@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240416123501.12916-1-pshete@nvidia.com>
References: <20240416123501.12916-1-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 16 Apr 2024 18:05:01 +0530, Prathamesh Shete wrote:
> The controller has several register bits describing access control
> information for a given GPIO pin. When SCR_SEC_[R|W]EN is unset, it
> means we have full read/write access to all the registers for given GPIO
> pin. When SCR_SEC[R|W]EN is set, it means we need to further check the
> accompanying SCR_SEC_G1[R|W] bit to determine read/write access to all
> the registers for given GPIO pin.
> 
> [...]

Applied, thanks!

[1/1] gpio: tegra186: Fix tegra186_gpio_is_accessible() check
      commit: 62326f7cefc21b4a7e8a1b413bf1e8bc07df1115

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

