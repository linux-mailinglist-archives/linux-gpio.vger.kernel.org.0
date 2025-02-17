Return-Path: <linux-gpio+bounces-16119-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF786A380B6
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 11:51:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B751A188C271
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 10:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A467E217646;
	Mon, 17 Feb 2025 10:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Z01mC7QZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA038216E1B
	for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 10:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739789502; cv=none; b=e/+Xen/JQZrARBt53bt2GRsAX4NBMPKOLfLUCR0A8FlqriNkB4Tc328t6uGtJjVElkpdDBBEdG2fOUCM01zpaKmE4oN1qwr7epGzEFCieSIk2sdL6j6wXYmO4WGWRAa3tHAnAbmXZz2a3kYT1dDsfZ5fv1w9EiygsGh2TblvntM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739789502; c=relaxed/simple;
	bh=2a6DWia5aelo3+hT4preBpQwhiMBH04u1wwdvEZZTwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AIB7fWSKcfCHlVUl7fvoObgMHW8FFOQC6iXDyjKk5aM6eRiug/KTP20XNDH32b32yczNs1hWvP2KjkXk2zOGCtUh26y2E9/uvhPMu6hK+X8be+wf8anfaMNDlReW5nI6oSVue5LHJ/mR8Sc00TT/5owkA554Bl5Ba61ll5ahaAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Z01mC7QZ; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38f325dd90eso1275611f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 02:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739789499; x=1740394299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j9rL7BFj/LGtJcja3SBY10iTH0HmL8V8oaNVVBtRsuM=;
        b=Z01mC7QZwOxL1/XXOMz8nWKJZ3L8MAjS0d3cK2A7by6uQfstUzM4Y14rz6xBv/zpPW
         64ynFLrOUDJCWhSemDJkL5Y1xc/m+vkZLc5PegYqS35Z8puUwKjAGUYd6KuudKb09Aoh
         2JQrdPAOnccxglYFxBTqdOi6GVooWchcKg6q9sj8JEW/+5KYRi4XpXT1TrFzWPoFzBQu
         y6gTdKZQE5/upc1psewJIGHEays7sgTxdVvh9q/SKja/ilAM02ZZrDatrSwiJlR3Df1i
         cNqYmIiZ+SykBt4rivydr/pwudfbhl5nsqjxJtzmXRZMUNR/eF3Sjk7V0KtqmaNHnOXP
         ScZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739789499; x=1740394299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j9rL7BFj/LGtJcja3SBY10iTH0HmL8V8oaNVVBtRsuM=;
        b=sDLyBg25CVMsaYHZlusQTJyM0JxtyDfgTWqfwKUC2rqjm089phr+vN4P9G4yx6fvg0
         yfHFtL5lE21Z2qv1r8GfGmZdbN09H3fiWK69+mOhKjwx9XRwBpiujcC6URVb7yap9H22
         59TIaZfkj1Vyn2E1SCWnwHfCMqIhuLgZHTFWXvZ5JoK0ec+ICKHC34Exqu7G0ToYbCRu
         d/fcm6tn/nOzlceA4kHxIkoiHq3JqOsb8h8TrOviy1FsO6hDUQckq0A/vPorqgRUuPan
         MoiOhYPmpgONP5bHNbER/a/bk8exOrW+6CUqYQkiBfLYAu/Ffz3D9BV9vDyEIyGeOdFS
         2waA==
X-Forwarded-Encrypted: i=1; AJvYcCU7anyoo071z1LEUubYQdkxZUMpqxZpABZxWiYik8ok1XmV+UOtWrfEq4FLeomdW4Eak0UOt3rFBSz7@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6FI/V1JIyWZ40H3HaPmNN2gmwr8/kLxOF2PZXfRyo6gLa54dK
	gJcGPL38GGg9EhaFqYWW8I3/JWpKbQSFUePgK8nHDDsiHQ7WPvQL9uCvxHnQz40=
X-Gm-Gg: ASbGncsXIs0W9Z94EtFcQ9HTrYR1+qTbGQfbSmmBnYorh99ya/ArPWyuzZrHSdb4cb4
	N+ZBRt6JXu0ncJ77XKsiOh0/xm9ArSdYsZTq6G27xO2M3a4h9Rg97rf1ebvbZUp06UwVTuD2Doy
	aMD2ubnjW1OfkB76YJAu0x7ROs6OOInd3dEH6fciDCAZrXPLXR0NjQ5ZXu0Y5xOW/FLPCbviMti
	gPTt6ZtiT0uCRM9Bb+5PdAo8ZZFSfJb1WEZPJHGpecGJyTIh1cOQzrYcVrCHKhbhMkzm2b7ktRN
	ts4e4Rs/kWHJ
X-Google-Smtp-Source: AGHT+IEcFZLNABjtm5sf5QsAlzR9E7GKqtzQrNge8fNqrR3LiZfoVYgQ3/KTJrrfcZCS1hAQIBqFGw==
X-Received: by 2002:a05:6000:145:b0:38d:b325:471f with SMTP id ffacd0b85a97d-38f33f1f725mr7557321f8f.15.1739789499204;
        Mon, 17 Feb 2025 02:51:39 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8707:ccd:3679:187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f7b68sm11717692f8f.85.2025.02.17.02.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 02:51:38 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: (subset) [PATCH 0/8] gpiolib: sanitize return values of callbacks
Date: Mon, 17 Feb 2025 11:51:37 +0100
Message-ID: <173978946845.153202.10192575435977387116.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250210-gpio-sanitize-retvals-v1-0-12ea88506cb2@linaro.org>
References: <20250210-gpio-sanitize-retvals-v1-0-12ea88506cb2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 10 Feb 2025 11:51:54 +0100, Bartosz Golaszewski wrote:
> We've had instances of drivers returning invalid values from gpio_chip
> calbacks. In several cases these return values would be propagated to
> user-space and confuse programs that only expect 0 or negative errnos
> from ioctl()s. Let's sanitize the return values of callbacks and make
> sure we don't allow anyone see invalid ones.
> 
> The first patch checks the return values of get_direction() in kernel
> where needed and is a backportable fix.
> 
> [...]

Queued this one for fixes. The rest will be picked up next week once this
is upstream.

[1/8] gpiolib: check the return value of gpio_chip::get_direction()
      commit: 9d846b1aebbe488f245f1aa463802ff9c34cc078

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

