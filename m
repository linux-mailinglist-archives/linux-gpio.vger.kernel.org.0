Return-Path: <linux-gpio+bounces-26649-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C48BA819A
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Sep 2025 08:21:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9467517F2B4
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Sep 2025 06:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B9402512C8;
	Mon, 29 Sep 2025 06:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="fN1fdFbk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC943239581
	for <linux-gpio@vger.kernel.org>; Mon, 29 Sep 2025 06:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759126901; cv=none; b=SreEfdqqNE6v/tbMuY4e81Ta+wMMa/5Pbzy+Tz6rHyK5w42QsxUmNjnVE6Lrty5fQVFgMw/AzVghsm7VGWTIp8m5tp3BxJSTyuwxRzVjveQd7WzoHpKbbop3tpW3X96Y1v4TOKsG1Zd07mzRMt5KdCMKXUcVQ9ONehx/djV3sZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759126901; c=relaxed/simple;
	bh=i/xkM2XQ64TByT9E7jHbqx4XQKl71CqpI/tFaMgC3AQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=kGXKAgUUnU5EpzLphvUG8KoDVp5sgS/g5ZlBuN5SsCstVj1pIv3RaZSIQHrHCezGHFxtQo43n8J5JroCsGl2wcJLgFaYQ5nkFBw+3dqAgWgyREglLf0HdDKVm4nQIRfpyOHqNGphpMthhPu5m9IZubi5iXoV0SlAHT2Rk1QrWWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=fN1fdFbk; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-77f343231fcso2386118b3a.3
        for <linux-gpio@vger.kernel.org>; Sun, 28 Sep 2025 23:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1759126899; x=1759731699; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3DYf3nZmZT9pmjpM0ozXYCHwHjXdP1i/O3gaW7RpZk=;
        b=fN1fdFbkhYEIT7E5QbWddxYCARU+uJ6ZZ7j1VBXgMf0gCEIKJIFF2GNR2kRLokCj8i
         hns/ly4fY81Foxpm0JqC5iPTUSaFnczRhr4d1tqaZ08RTFWdEYV8EEEUxi+LQWfgHe3B
         M/2eylUqedOrE2ClTB9i1970xNHljZCbbUgK0HzjWgZG15DJgqPDaff4/FsvMTuyNWGf
         JGWzKqiq3q0FxPFiTZKCQPW6rqBT0JXn4VPvuARF3Q7Xd/nxlIXLMZiDZc5z6APvGe/w
         Fxk3vH5dMw3WMhVAwHXvOsjldWkXpfMJ295Qcgj0U0h/U9Df/z/xshSWXs7gqFZ8QN22
         9V0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759126899; x=1759731699;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i3DYf3nZmZT9pmjpM0ozXYCHwHjXdP1i/O3gaW7RpZk=;
        b=iejCF86gI/xkhxAsf2Z9H0wPfz5US17L+TwCVIDEhPyde8oz1jlxZK+aNn5a+20k2c
         1v/od1fbkWyzaphAp6sGgFPCZuJlr6xJYsi9ZZMtWNn+OeT2ARvPTIJYcbgwfpVCjIfq
         h0iGD8TY1jEI9FOzReKSe4cy+0n5G7WBv/P9UOwRSqOp1Xn46bv73eiA2pyGXaM9ztCW
         O9ZP3LH4AllBuYa3LhhJif4kCFN3bxsSyAKODrHQXCuoLSO4coQPbZEUzYzmk8ErLA5g
         1j3Ax8lh+/ekw5PzDq732rYI1iNS4aqt2FHdg/D/Q1IWUIfWq8oB4xU0z3eLuIzNY41x
         zSTA==
X-Gm-Message-State: AOJu0Yyxy4OVIS5O7mUE3CUBVN1veToxmkYfxvpQX5rdzgn7bqSYLamo
	4Zn5ZawkvxqVxxnPtOZYMI6bz6tYG1sAfC6io86QzAqScajtbkQ7OyZ4hoTqIq69vX8=
X-Gm-Gg: ASbGncsbhVBQaWspDP0/RKFo4osomEikD6Q4cNaG5BNFkQUgfylfjZgQRRD8hRhw/fX
	OaTuWxzLZlKVJ1T4ZAElQ+LoZyLFb+b5nc+EvysQXqLpOZuilbw92+vJmbuGYeZ3rryYu6wi3zC
	yRSL7pOmbEwHmA7p6Q8BWDWZKVc+i7f/KM9xx2OBSPhn3Ho9gdAjD3fwVXWV/d4ulKScqpricUT
	nv3rlNIHFV8vn8f0rle7LeOGA/cWj9V4FslnGIW6RolMf4S/8WlCPyKa6kDTUIDTwSQC7upe2IW
	sRqM7aFWXSgdkO+wBbBfE6jLs171NkInl4+db5BwbTxuxZavtU6UQW6h+pd5w2NYp3Dl8HRN1JZ
	dNkVIh7H8Fg==
X-Google-Smtp-Source: AGHT+IElzudef1mHzRka6HntOcA1ZSa3I7RW8h194yaKUvNwacDZoMbvivoUrohpNxIWRkpl12qY6Q==
X-Received: by 2002:a05:6a20:a126:b0:24c:dd96:54f2 with SMTP id adf61e73a8af0-2e7bf47c13emr18700443637.1.1759126899058;
        Sun, 28 Sep 2025 23:21:39 -0700 (PDT)
Received: from localhost ([2001:9e8:d591:9700::35e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c53bb97dsm10247741a12.9.2025.09.28.23.21.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Sep 2025 23:21:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Sep 2025 08:21:36 +0200
Message-Id: <DD52FVU1H3GX.J0F1IBTDKN5F@riscstar.com>
Subject: Re: [PATCH libgpiod 0/3] bindings: rust: pre-release tweaks
Cc: <linux-gpio@vger.kernel.org>, "Bartosz Golaszewski"
 <bartosz.golaszewski@linaro.org>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>, "Viresh Kumar"
 <viresh.kumar@linaro.org>, "Linus Walleij" <linus.walleij@linaro.org>
From: "Erik Schilling" <erik@riscstar.com>
X-Mailer: aerc 0.20.1
References: <20250926-rust-release-tweaks-v1-0-beae932eb691@linaro.org>
In-Reply-To: <20250926-rust-release-tweaks-v1-0-beae932eb691@linaro.org>

On Fri Sep 26, 2025 at 4:35 PM CEST, Bartosz Golaszewski wrote:
> Here are some final tweaks before I do the 1.0.0 release of libgpiod
> rust crates. The first patch completes what I though I already did last
> time when updating the examples but I must have borked. The second patch
> just runs `rustfmt --edition 2024` on all source files. Finally the last
> patch adds some examples to the readme so that the landing page on
> crates.io already shows how to use the code.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Bartosz Golaszewski (3):
>       bindings: rust: complete the unification of exports in examples
>       bindings: rust: update formatting to --edition 2024
>       bindings: rust: add examples to the README.md in the libgpiod crate
>
>  bindings/rust/gpiosim-sys/src/lib.rs               |   2 +-
>  bindings/rust/gpiosim-sys/src/sim.rs               |   2 +-
>  bindings/rust/libgpiod/README.md                   |  78 ++++++++++++++
>  .../libgpiod/examples/buffered_event_lifetimes.rs  |   2 +-
>  .../rust/libgpiod/examples/find_line_by_name.rs    |   2 +-
>  bindings/rust/libgpiod/examples/get_chip_info.rs   |   2 +-
>  bindings/rust/libgpiod/examples/get_line_info.rs   |   2 +-
>  bindings/rust/libgpiod/examples/get_line_value.rs  |   2 +-
>  .../libgpiod/examples/get_multiple_line_values.rs  |   2 +-
>  .../examples/reconfigure_input_to_output.rs        |   2 +-
>  .../rust/libgpiod/examples/toggle_line_value.rs    |  17 +--
>  .../examples/toggle_multiple_line_values.rs        |  17 +--
>  bindings/rust/libgpiod/examples/watch_line_info.rs |   2 +-
>  .../rust/libgpiod/examples/watch_line_rising.rs    |  23 ++--
>  .../rust/libgpiod/examples/watch_line_value.rs     |  25 +++--
>  .../examples/watch_multiple_line_values.rs         |  18 ++--
>  bindings/rust/libgpiod/src/chip.rs                 |   4 +-
>  bindings/rust/libgpiod/src/edge_event.rs           |   3 +-
>  bindings/rust/libgpiod/src/event_buffer.rs         |   3 +-
>  bindings/rust/libgpiod/src/info_event.rs           |   3 +-
>  bindings/rust/libgpiod/src/lib.rs                  |   2 +-
>  bindings/rust/libgpiod/src/line_config.rs          |   3 +-
>  bindings/rust/libgpiod/src/line_info.rs            |   3 +-
>  bindings/rust/libgpiod/src/line_request.rs         |   4 +-
>  bindings/rust/libgpiod/src/line_settings.rs        |   3 +-
>  bindings/rust/libgpiod/src/request_config.rs       |   2 +-
>  bindings/rust/libgpiod/tests/chip.rs               |   2 +-
>  bindings/rust/libgpiod/tests/common/config.rs      |   3 +-
>  bindings/rust/libgpiod/tests/edge_event.rs         | 120 ++++++++++++---=
------
>  bindings/rust/libgpiod/tests/info_event.rs         |  58 +++++-----
>  bindings/rust/libgpiod/tests/line_info.rs          |   2 +-
>  bindings/rust/libgpiod/tests/line_request.rs       |  12 ++-
>  bindings/rust/libgpiod/tests/request_config.rs     |   2 +-
>  33 files changed, 276 insertions(+), 151 deletions(-)
> ---
> base-commit: 97ee30872853b2c9fbb448240012909d985f2e19
> change-id: 20250925-rust-release-tweaks-d1a94bfda0c4
>
> Best regards,
> --=20
> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Erik Wierich <erik@riscstar.com>

