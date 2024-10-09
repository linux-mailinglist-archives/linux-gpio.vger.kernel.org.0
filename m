Return-Path: <linux-gpio+bounces-11091-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D47E89960F4
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 09:33:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04D2D1C23D7C
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 07:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45B8017DFEB;
	Wed,  9 Oct 2024 07:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IgLJP5m8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5911717BB21
	for <linux-gpio@vger.kernel.org>; Wed,  9 Oct 2024 07:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728459237; cv=none; b=k7hLZ4miBCfs8DPkxrEwtAExQwTFzIIUAFb98tObD6uHuJj61bH4R6uXTjEst6+8VGgQAv8Z4AeIHLz2syAhaPOCSNLcZBZ34HzZLeIAYIe9gE3Kzl9h/sKCYY+leKKcAUO+evuQEUK1vDx89bB6o1QYs1mtaYCJMlvszztx0fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728459237; c=relaxed/simple;
	bh=xoYsQI0Ot1CbOvLzQlTfZUPtkMWLPuqSTyEDG/qQ7nI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sa2vDJ9Ug+eplUcSVuWmDXwvDyW94jEcHg39/IXH5knEY95nHsoQoRI9CmZoCwEJQW1mi7umitGEUcbYTG4IvqXbhxjOcsGhM0qSbIXPfXj0BL64q1f1XDoT8xM1i6Ju3jobyqw719HVhsKyNZ8QkIaYANw6osXpnOnuD4kUHjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IgLJP5m8; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37cea34cb57so3869589f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Oct 2024 00:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728459232; x=1729064032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tqw+sSRmZl4FCUBPrmIKCl+JYA1oevJoPkvWuRufHYQ=;
        b=IgLJP5m8pb0ZYenLXDjCtPGJsobsP0sA1fFyyBEZwTSjw9MNU/gysEUFYU6y8qzLXJ
         Lu93u33SoAGh3YtCUmxh0lfSNI4s/9eCAAist7XjHaeHTrZxOkakNtq7Hj6w70l1d4CV
         WYIeynnmh2LaVFSzdzmaWe4SHsKmobszKJGQw038LKg6XBuG96vIVy+0dtVli/eBzKbD
         4lMHNiGlMkwyNpfBe4O4g+/CZB8GSkNmZ4G6ddt1CvnHDnRqYIjhvpFMZm8xlgQlQxOs
         QERpPMr3kKgRUbyZ7m/HevS0isCfiYi6XGI83gu7IJMZqxGUTgR7H/Rs4Tx4v4nFnJka
         FPDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728459232; x=1729064032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tqw+sSRmZl4FCUBPrmIKCl+JYA1oevJoPkvWuRufHYQ=;
        b=tiVFGqeDvnYUV+rvWf+qsZIznSeVT/WUSCTYMlIWhI6zc0LTcLtwtS6qCFbvkWq4yO
         25KLGVsExxKKja5W0FwFAYJQZcJ3xzFdjicvcL48K3PGns7hrNeFmITrJmzlz4NOa8gY
         zU3Rf7tOCCZgsjw0mM2wMyFVLTIU6obeoDgQEPLRu+p6kffAzPoyDh75D0EKgV0bZQFV
         2sN7KyYhnHVPyRU+l558rpjGAvt90HUh+tfGtECS/ysP441CMmVRzbF7QBJuI6vspwGZ
         MXDTYr1nqSodx4A/pG9raqstYRXwySMg8EC8YLMuiHo+Jt/P5OrwETTTMADgdFvvkUAJ
         1c3Q==
X-Forwarded-Encrypted: i=1; AJvYcCV7Nj6fvL92/J2lCfadZNzqxKRYEeCrJVwqdJIPbbPFZlwybmt2kRAu88/psu9oKn3gY5U/yMppUoPT@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2Lk3hXo166udCZvnPUhUYi/DZOyfHB/TBPDhzX6Xv5FnsWloJ
	cK//AGkt9CgssELRBTBa/PY16F0y94prvfJW0Par4TLjKQ6ZdlunpAUVoXdHd04=
X-Google-Smtp-Source: AGHT+IFP4KfYk0ayRd8DBjO1psiVIl0YaztSNF22zfIBm6yBba9Dtmb+k9UzaELIx75mBNUdyV1HXw==
X-Received: by 2002:a5d:5d82:0:b0:37d:415c:f278 with SMTP id ffacd0b85a97d-37d415cf360mr344582f8f.10.1728459232381;
        Wed, 09 Oct 2024 00:33:52 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ff96:3068:2ae4:3fe0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d3f7e40c5sm492387f8f.34.2024.10.09.00.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 00:33:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod 0/3] dbus: client: fix memory leaks and errors
Date: Wed,  9 Oct 2024 09:33:50 +0200
Message-ID: <172845922864.4951.12121816627252233875.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241007-dbus-memory-fixes-v1-0-0d56d1aa032d@linaro.org>
References: <20241007-dbus-memory-fixes-v1-0-0d56d1aa032d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 07 Oct 2024 21:30:21 +0200, Bartosz Golaszewski wrote:
> The daemon gets good memory leak coverage just by running it through
> valgrind and executing the gpiocli test-suite. The client is a bit
> trickier to test so there sure will be more fixes coming.
> 
> 

Applied, thanks!

[1/3] dbus: client: notify: fix reference counting
      commit: c87847b23b398d0b62185cd8191aaa09113debdb
[2/3] dbus: client: notify: free chip and line lists at exit
      commit: 85471d394bab3c95e7b968c8a3df9a7ff894fce4
[3/3] dbus: client: monitor: free the line list at exit
      commit: 392cae9e4233040e1d1a171552490fa9be7fd6dd

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

