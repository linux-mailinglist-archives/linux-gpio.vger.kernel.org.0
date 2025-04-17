Return-Path: <linux-gpio+bounces-19014-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3520DA91B4B
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 13:57:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0AD4C7AA899
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 11:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B747241663;
	Thu, 17 Apr 2025 11:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VlawjmWU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FF9241136
	for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2025 11:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744891062; cv=none; b=iQ7d44QV22zCxWdNNeLXS2TrEElz3dgnjT/ZY1zvYB5ydfYoGX2jEsMQlabsJJxRjMWe04UMSpS4lAzcdrN3kdjSK/CFNsiHeKHmwRERpBy/iBAmRnLakw/GhjfTLCpJYD0l+KWgOokulaU6k5zjdyBpeTaHJaP1JLrkJ45y9V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744891062; c=relaxed/simple;
	bh=KVx8WKmih6vKKGr4uNwkQTb7gVMYZFyBqGp+HrNkqYE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EmTk4+w+3v1YdXm65lPkd3JzO6uWRQMRd6dX2bjCRvnUi5Sda+Ysba8fPgmASy2c8PWwBzdQwTmhN0v38ci61hHVoNQfAC7tv3Ubvt1uXdIen5GfIltdEE3c8KUWZQly1/V7ArdCrJh3krFP5meob86fvPghpBjeY7aZOIPqkIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VlawjmWU; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54c090fc7adso766917e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2025 04:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744891058; x=1745495858; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KVx8WKmih6vKKGr4uNwkQTb7gVMYZFyBqGp+HrNkqYE=;
        b=VlawjmWUD0F5zybVoDShijiY/XUMKaPVg0BrgS6F9huR/tVsgQCbFqwy9WIjj/F7q/
         w9yXJ9oceYQIr5nEycrXWpxogw7Gj0II9dES3ViXLIGphRCO7V2r40IxLyvhIw7/7v1s
         7I/jjMK+5fAtgA6OX2TMEzRkVX9bsV156Nob+1IR9xzfrbqej/IzlYV5qP+EvMOaofVe
         6QacPUi9TUUVMr3pTYNAEQhNvrU7kyXmFiCrx9kRIhnYyd7auFyHrsNsf3+nmP4RoZvF
         ux8wwVcpJCfbi2i0YXWVEURhaMETYrcteWT9fnIx/PilhBcMpWHFWUUYey5x4Px5MuVf
         75mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744891058; x=1745495858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KVx8WKmih6vKKGr4uNwkQTb7gVMYZFyBqGp+HrNkqYE=;
        b=gRSGD8EbS4iGAgWZC+3IOVqSnSWHfQ/CM10n0Gpdx9ZUHCB56RPsrXgK8gVgGyprIQ
         M3SHxDf/c1V1hfBVLcHkBa3MC2eR6Yyp8COzpZIX/JSuPKIqcBbblINlUl/cw+BiAcds
         +B+q38MEcLCuJAu/3gcA2tVlt5fI55NXIa6DM6w3tHn2wgqf+npiH7+9zUq72i+gb99i
         mUnKW3yep5Vpi/YeAEBwvM1+n5KiKLDrR30vlhujxEY+tP8YYlE+sT5ldn0eiUlxLo8U
         zKB86IAm+++T/XRkz6grtMllmlkgeT2k1d7ORPc7gaonROkrSpWUhBe72AGGVSGUukTa
         WREA==
X-Gm-Message-State: AOJu0Yx/nBCTlW17J5A7yfo6vebKaXmBXPLLUz2KjqUeNjGsNpxc851V
	XYn3e2voqLSGuR3a4PFxW7D2cEU7hbayF9GNjs6Y+FOAr7vvGK2AGbkAvJk9vTdkn9z8deQpX+3
	cC/mWsZ+nWoQe2lrqXvVwgKs6vXNwuYPOjts6wA==
X-Gm-Gg: ASbGncttz9UixbbYT78sDItod0zb/cQd/o/1vr5NU1QmhKrBnO/CV8yoGjvlSfvW8IW
	5P6pZYCEhhZq4RhhCPfNrR0QF8YOtoNtquujIck+KdP14fmlEwCDscxuftXRkq8rJP7VtHGExW0
	mBSY10fTC1/eKEM/GF1GIfPCOLV0Hkj45NV3KG/9r3F8fP7GcGg3zLFwg=
X-Google-Smtp-Source: AGHT+IEeiYtk0HBTKuDVztlupwWSfRuUo8RT61pDnZJPmFsX2h7TOOidEy7m9hfQetu7dYH1CnLuFFBE5Q3c8cKQfhk=
X-Received: by 2002:a05:651c:b06:b0:30b:c91d:35cb with SMTP id
 38308e7fff4ca-3107f68c2cfmr12267491fa.4.1744891058255; Thu, 17 Apr 2025
 04:57:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org> <20250407-gpiochip-set-rv-gpio-part1-v1-5-78399683ca38@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-gpio-part1-v1-5-78399683ca38@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 17 Apr 2025 13:57:25 +0200
X-Gm-Features: ATxdqUEK3uu-LOdkchvLQaZrXxJG2L5aKVumzM127nWeg-RbcMIq1bU1r2_Kqrk
Message-ID: <CAMRc=Md6Bi6ZT4tuyzRq3YfNe3FreMW7Yz77xy0tYcdaAqjWKQ@mail.gmail.com>
Subject: Re: [PATCH 05/12] gpio: allow building port-mapped GPIO drivers with COMPILE_TEST=y
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 9:13=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Extend the build coverage by allowing the port-mapped drivers to be
> build with COMPILE_TEST enabled.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

This caused numerous problems in next so I'm dropping it.

Bartosz

