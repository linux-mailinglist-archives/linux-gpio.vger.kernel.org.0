Return-Path: <linux-gpio+bounces-12869-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 892D69C5871
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 14:00:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E37128497B
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 13:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C0E07080B;
	Tue, 12 Nov 2024 13:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0yTHQ5jL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5278E1E4AD
	for <linux-gpio@vger.kernel.org>; Tue, 12 Nov 2024 13:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731416411; cv=none; b=A59oDQPgmrl6+nP9u467PtMGNsWYyh1N+mVYBADG3SQegv05TEREAugajOKD6Z/kJiZQvOVZkihsf4dcGu9DPvYrOTmkCebza8FV+I2tJ31BeB1Xn3ZoYMS22gc9ly6AmzGeWsvUFv7aqDF+82YhbN3xdIQrjWrOoD365BjY6Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731416411; c=relaxed/simple;
	bh=przR0o+4dJiv2HvVZUwpbsLMam/iB0nAbpuPKyvEzuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=skmkEzbJOH/Ku2fz8mm+LLzFKdOpAFfXbfzHmE0s6twBjSr/KYTCEAjULScMwUnqEWHK6cVosdsaJmNDFpxlwf9dVUYLMAjKNQsen7IHc5cOB2HwvTwO3th/CWFp0hcN42WlCkIGmfH6jx6TGQBuars612eZobNtx0CUSJFf5kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0yTHQ5jL; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4315e9e9642so47063495e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 12 Nov 2024 05:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1731416407; x=1732021207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UG6eWghHo0IKDGANtTYFJ9ugpEonoAP4EFNLNKqwh/w=;
        b=0yTHQ5jLJ/WAb8mC4JLs7YgDZw2xloxzXuJMvNZO82A7P5GCXV+CzRgwbeUQQv7PAW
         ZEFvKMGdv4oj4TAded9bhu0s9jdmTngs5Yvx5SpdJs90HPnGw0l/Lc6SnK9mjH4oZyh/
         DSrazHoJoSCo4fk6Wrhj3+Mo/JZlEOI4XwGYAHlmymu3z16S2QA1kHkNH8JehFAop26g
         fI5CQpW2zdF3iruuhPtwX5k7mU7YQ0myVbRUW7uat3V/QA3Du0y/dt42V/HPDILuVhp/
         7+z2BCKij3C64Hu6cRtjL8aQIe1fGxlnGei7sW2DpIw+XE4n9Qp46BchqCIa7l+yjpO1
         uRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731416407; x=1732021207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UG6eWghHo0IKDGANtTYFJ9ugpEonoAP4EFNLNKqwh/w=;
        b=wn0mlupaIHOKnLwvBrURJayGMk5XdPrNj0GFYUoq7D/fP7XkWNMY5vJVB2OKS7Ja/J
         tde2Dtf58ZgCwP8kpMab11WIigvUy9PJ6Bcblk9n1UJN5OLnMFAKJ2K3Cg/xqBhVoKLU
         pGbe9snO+NK0dhLHvlfZ6TUeaDV4ldsWQnJw5C19wbOFs8Bgaco9pfCHrMsFxeUwbwEz
         T37afIQh3cNDY2SSqIK9UlP/YxXIs9UxxnAoy9CH/7DT4sD9NiOrqRk/5AuGo4CaHbPi
         nRGm91gKok9tocraCVUWb7nnK+4b1i7d0weq6U2eU1G96Iy2atiu8gEYNfFdVjGj7DQY
         QYJg==
X-Gm-Message-State: AOJu0YxAgENlZMw8s6kFUbm4qLj62lcfNHQIOJIazXQYFeW9JFK1hRAm
	ToqJjjdbzGUx27qEvzS2Wj9YkoBpKLr5yvqhK6N588Vo4Gc5E9iqqP2hbDXT0Oq56mW2yfwWCeI
	c
X-Google-Smtp-Source: AGHT+IFTEJSJBwl2noRjJmmMnLq9silUlmrpej3ovpUk5QlsnXA7D4Z62DuJ+DZN5W/OSh8+YnJT1A==
X-Received: by 2002:a05:6000:470c:b0:37d:4744:9d1d with SMTP id ffacd0b85a97d-381f1828cabmr12517141f8f.35.1731416407275;
        Tue, 12 Nov 2024 05:00:07 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:94a5:ced7:f64:fdaf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed9ea93esm15167172f8f.66.2024.11.12.05.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 05:00:06 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	Vincent Fazio <vfazio@xes-inc.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	vfazio@gmail.com
Subject: Re: [libgpiod][PATCH] bindings: python: generate CPython 3.13 wheels
Date: Tue, 12 Nov 2024 14:00:05 +0100
Message-ID: <173141640235.58678.9648764680972480847.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241106142248.305219-1-vfazio@xes-inc.com>
References: <20241106142248.305219-1-vfazio@xes-inc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 06 Nov 2024 08:22:48 -0600, Vincent Fazio wrote:
> Support for CPython 3.13 was added to cibuildwheel in 2.21.3 and
> advertised by build in 1.2.2.post1.
> 
> Update the dependencies used by generate_pypi_artifacts.sh so CPython
> 3.13 wheels are now generated.
> 
> 
> [...]

Applied, thanks!

[1/1] bindings: python: generate CPython 3.13 wheels
      commit: e376cb63349c7f78ac97d7c2208b5330a7351a9e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

