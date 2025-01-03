Return-Path: <linux-gpio+bounces-14474-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77128A00BA9
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 16:48:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55317164268
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 15:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5728D1FA8E3;
	Fri,  3 Jan 2025 15:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tt/kE3Jp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E3A1F9416
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jan 2025 15:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735919334; cv=none; b=Zb07Dz5hczJzgD++uqBWsSRVkjogZ1+rcB1d41JNCSkBwhCKRSOob8jzxFBVHNZWtpo5j6XglEjdyEoo7/k50y9difzydTzV1ls+QSL6aur3rncahxZ+KredRtP2nPKfOBWFL5Gwta19hV8KjJkS5ksi7bcFWDOdIn3vEPDQLlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735919334; c=relaxed/simple;
	bh=PZoBhh4+BMjnN5KP6yxyRve7hsHJGLExrbP69rfNtdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WkajqBF4XE8yIfGj9GVVDqD4NYj0bPCbOF++AzepdCSCtXja+QVLzBQl5UusXyZybR4llzI2ACXPicP3Smhz+uINREV46ay7e6h52ZPOKV/htFBfMPXbN5mQY89LQvYhB4GvzHqS6I2z6itb4VMEUQU88sUphAJ9/q4jisynSqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tt/kE3Jp; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43635796b48so75197075e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jan 2025 07:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1735919330; x=1736524130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WtzM8lgvNI0RPO4y5AVcHoc4hBJaAQrwmurlBKlrLgc=;
        b=tt/kE3JpWLtECkS2LV2tplEsisjwaWlTYNYV9pNjErMonjHrgzwTmUvtZn1axmS8pj
         AzQ5ojEabCvSoZ76kTVo1+23JvsEoP1KhNRo4eUC9+A5+7LF9q40rnfT+CQRCja3qZO8
         OiBoU5Ud2KZgw/jiIJmUHax2o9LW6R05OS335K55T+dY6X7GglkN5J3TqDzS3fm0NMo5
         uLyM4HRyq+2r3DjCvNn94G55fwRbVqJPbks7oZVdpQf7Adzt+j5uwFkxrJqocNBP3Ry1
         5RM6cK9qwYW/5+hWYZS78s2iIl8YrMCwHOLmxQQtNxdw73Z3r8bVelk7C6Wgz8ajtYWX
         uFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735919330; x=1736524130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WtzM8lgvNI0RPO4y5AVcHoc4hBJaAQrwmurlBKlrLgc=;
        b=u+yv1XHPCMzRdyfnmeZEdb2rhVSd2N8Ut1/CLaN5JIYKWINdZAMYSVEPscyaVN9kJ4
         SKryhwUYUydofjhsB6u+dGPRuYvL/KjG64lReJEmFZ+Rh5sM768O5f/i2atUMN/WrYWz
         GCrLfoYhnLz7nffOEyGW+Owx9kHIU1gqts7vcu/ENyTG9mbsEyTze0dYFxzFlBLe9sFw
         ZfydKJ1WIr4Swl4aAozESwWSjqvriUP5wlf0fIMDozw4+/1+LkURuQKO36e0xGvHrTBk
         +qNIvP4/+kRVqZrlj892/K/fgy0UnqgfoEOZQ+nuQoINu77B7YTeprDY/iRcTyff1B6H
         RmIQ==
X-Gm-Message-State: AOJu0YxSfpf+TYk5/DPwMS8bz1zWXgGScJ1Xn+e1izEz0G/6FGr09te8
	y/RK+9FG6/YfpgZ/3jQW7keRQY/YK9yeo5FvmnqQrZmTKKxYhDcSMO52W4nmqlB6+8Y5791Xc/w
	3
X-Gm-Gg: ASbGncvPB4Su+uiFCjKZuqQAXtikWIutdvLoczqgiq/f8NZnkDZlrY/R+Vc3lc99kAM
	HWVjQFqnHZZisnX43IhuE+YuPg4Sv/MQWNj0QycVTOLQ4p1ZVvMw+j00YHavG/ItmB9ZypYNNU9
	w09eN6f/ftZ3USzVyyRbtsUDw1n+jH2kYm+EKii4BAJB2LFm+sCo7xE0Wj9D+JCMguwlwVHEbLA
	UIGAJHQmf09QUqXq9dseDqFMSXmb0V76ouU/kt7+I1Hx56VFNrNWsX9
X-Google-Smtp-Source: AGHT+IG/6/85ILhiqiq3CjSpSklhX1Xx7T/mWfqvKVl1VMPLyWEATa90uMKogaWCqyaSyjRZsIQfWw==
X-Received: by 2002:a05:600c:4f4f:b0:434:fc5d:179c with SMTP id 5b1f17b1804b1-43669a25fb4mr422639415e9.13.1735919329685;
        Fri, 03 Jan 2025 07:48:49 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2e17:369c:dc82:262e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43665cd9c29sm468634745e9.14.2025.01.03.07.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 07:48:49 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linux-GPIO <linux-gpio@vger.kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Erik Schilling <erik.schilling@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Kent Gibson <warthog618@gmail.com>
Subject: Re: [PATCH libgpiod v2 0/3] bindings: rust: fix some compiler + clippy warnings
Date: Fri,  3 Jan 2025 16:48:47 +0100
Message-ID: <173591932469.198636.18144070232800372026.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250103-lifetime-fix-v2-0-63902dc8cae1@linaro.org>
References: <20250103-lifetime-fix-v2-0-63902dc8cae1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 03 Jan 2025 16:00:14 +0100, Erik Schilling wrote:
> Triggered by the discussion at:
> https://lore.kernel.org/r/CAMRc=Me-QNmJ2L1K-gGzFtVZacsDiLsNUfh3QaWPdbVzyxUduA@mail.gmail.com/
> 
> I also found some clippy warnings that I fixed while having the editor
> open.
> 
> 
> [...]

Applied, thanks!

[1/3] bindings: rust: libgpiod: make read_edge_events lifetimes more explicit
      commit: 314aa08822da6e518562ba79a2e89eac92b4cea1
[2/3] bindings: rust: libgpiod: turn standalone doc comment into normal comment
      commit: 520f9c9419b033e3f9e7ec4902cc076258e34822
[3/3] bindings: rust: libpgiod: fix clippy::empty_line_after_doc_comments lint
      commit: d6457b28e29a8edadcb619d389878ea99cd4bab4

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

