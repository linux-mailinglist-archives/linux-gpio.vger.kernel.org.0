Return-Path: <linux-gpio+bounces-23563-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A859B0BDB7
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 09:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 773367A6546
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 07:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1499B2836B4;
	Mon, 21 Jul 2025 07:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="uGS9NU04"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413F5280A5A
	for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 07:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753083302; cv=none; b=c0RQ3PkshOBa6dPSZYDJ7JatykiSLzwFj9qBqCXDozgVNIcypnozyqiTdNmwxDQx5F1UeV4KfJxfhMppYr8o5M1TfdDAcDCsDBX5DrbUjPFWKXMxdGgYhDpwLOibxHMkMhS1mbJosO1bBh6ADe4TyOfgcYYFeMAD+PcFogbzJT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753083302; c=relaxed/simple;
	bh=yz43E9HwOrQyIcGQjFVhw0ysmkslR7mLMhzoAfQdblM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=e28mnKxYZ6Ldfh34C2NF7z8evVFei8+66cszsJugppOpjJYPc3ty0pWF3xn/NnBmnqgqrIZdGHDtJC02YKIpWKUMBTuZuIe3PhnnXFGTlbCm/2rSXpnEHO39S58WlhmI9RMASzQx/G/rf0yho6WuBUIhd/YXIhVZ3ywF0tQD25c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=uGS9NU04; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45629702e52so16507785e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 00:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753083298; x=1753688098; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LWp2MyyVfYFGJl0rTH3kTugxFWefqJzj0/q80QD8Olw=;
        b=uGS9NU04GvKadCx9O+ogzvEyvRdJiRgQw+zY1LTWOYfGCeInQggELd3HijXDOuBd1Y
         V1ufUGXKYb3uUB4e1X4x8td+uJKbDrSKkS7Qd0UsAB4PapXK2xNgQBFuD71GztRHO9ak
         MEYTzorC0lsUIWV0LRFS7zIDWqVIhz2qj5feSsDgHN1g8vpcKcB0Nv2eas+KgW8AcnwP
         kX97zPR/djc9vt67r50DYQRYidfwkhv4dmwOaOKYguwUFke363Q/zaSXs/LVnMJSNimf
         IBgXkOTirGToY3cnRezUHhEzLSUasFko1yN7r0Aa2wNW/OxOs749qD3R47wCYb+yvU6l
         1Y+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753083298; x=1753688098;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LWp2MyyVfYFGJl0rTH3kTugxFWefqJzj0/q80QD8Olw=;
        b=ODGi4J7evdivEiOweVT6hFshZLiWCjvurZ1hoViIyLdswlPRT9WLNVcu5EdVMehKAk
         RL8VI6IA933copaGxLb/Z2NAnwp1ipk0wetXgS3oKcrQRTPsKzeOGVwfw9KhEo+QXtCt
         ezgwNq3OFI6ipUPPyiEC+dnUshlsjlT1TT9X45JRm9XFeF1EZblCAkfYIma4G7tU7OPF
         8jdDCbMlvQ2W4AXVaI1zfGCsJiavKnCdTks61oxEkhu5A12hH3CBzR3/NL615B91I0uH
         I05fzWHYYcn7uXCcbqmHKzr3RumDZtOH9W+neiK0jVLba+iwkq7XKKUkhU8nIz+yaybo
         /foA==
X-Gm-Message-State: AOJu0Yz0Mt0ofjcU1Iz3Y0j4LldoajbT0Fec+ROH54mtvogj20W6isXs
	NDsDydeoG9ncis9LA9pHAaO50242/CLsa5Fwa8GaX7FsWywJdsQLCrCVDvOC2eOgdB0=
X-Gm-Gg: ASbGnctKQQuK3hAPzoPOc7jl0Ti+JqI3YoiCx+5U4uT5qBwtjTmXh0AUTeG6+zxiD9i
	1n0w1I6EoK+zFY/ipQfRCkhmjTDdJGKDvTWcPJiCuOaCGt7hu1qx02/Cq/3PMb6pwxWjcW2pSt7
	uTUj1i3G/kVp5nEOSu4289+uem9dtcuQxrbktPPPNKyB8TGQYCMv8a4cf3Aia7soHROIE80R84x
	wTGkf0cTDVxCoqWzT44P0gM2M81ZNnMHb1QZW1wtEVaKuOTeAFY1+rh3NHNXhVwyCDCkrOjtLfi
	mnD5me0eWx0dQhLz/faqoaAFTK6zrVoJ78nPEGXGkGG3CZSH5M0yLDw4VUK5AEcee6fiYcOsjQ=
	=
X-Google-Smtp-Source: AGHT+IFkAwBbS55Frvd2hLK7YWdtlrdiH+yc2Fymmwx6ztWURo5CZI0lzBbZYnXbPMyJC4iI44e2WA==
X-Received: by 2002:a05:6000:2f8a:b0:3a4:fea6:d49f with SMTP id ffacd0b85a97d-3b60e513984mr14569483f8f.49.1753083298369;
        Mon, 21 Jul 2025 00:34:58 -0700 (PDT)
Received: from localhost ([2001:9e8:d58e:7200::35e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca2553esm9314807f8f.13.2025.07.21.00.34.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 00:34:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Jul 2025 09:34:56 +0200
Message-Id: <DBHK5WGFR034.SME6DH80HYRV@riscstar.com>
Subject: Re: [PATCH libgpiod] bindings: rust: make
 Settings:new_with_settings() crate-private
Cc: <linux-gpio@vger.kernel.org>, "Bartosz Golaszewski"
 <bartosz.golaszewski@linaro.org>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>, "Viresh Kumar"
 <viresh.kumar@linaro.org>, "Linus Walleij" <linus.walleij@linaro.org>
From: "Erik Schilling" <erik@riscstar.com>
X-Mailer: aerc 0.20.1
References: <20250720-new-with-settings-crate-v1-1-a51392bd5b13@linaro.org>
In-Reply-To: <20250720-new-with-settings-crate-v1-1-a51392bd5b13@linaro.org>

On Sun Jul 20, 2025 at 8:16 AM CEST, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This function takes a libgpiod raw pointer as argument, is not
> documented and should not be part of the public API. Make it visible
> only within the libgpiod crate.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  bindings/rust/libgpiod/src/line_settings.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Erik Wierich <erik@riscstar.com>
[Changed my name a month ago]

But, this should also be `unsafe`. Will post a patch for that.

