Return-Path: <linux-gpio+bounces-26078-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE21B55302
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 17:18:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9903E171F3B
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 15:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81B473191C7;
	Fri, 12 Sep 2025 15:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jmvu3sVW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3601C31352B;
	Fri, 12 Sep 2025 15:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757690159; cv=none; b=rCdu2iRBkHQzqE3pbrvLTfRKV/uxGa8v/E9wShx9O3/71enxkpWNA8a1mFURQAbyJejM+R6cIpAboEv/JBZ+SZCYlUrtXPujfpI3cM4WzRjY2ZZJCUIrjB6kQuxaKlr44AIeVFMv4JbHyjnumqUTqYH2RxanzF5ZQcAEgHfNDoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757690159; c=relaxed/simple;
	bh=xhgQ+phyume8JNK88sBHYAzojU2fbVOtryATkCc/Gdo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=OzkUyyc/mSYwaYHkFnsztj4JZnN+r3YLl+Vx2moUjfO1XPpcxKe8GPG6D6PXuCS5UsFeIGZhcceN+11yiioqtqpdniAPiuxvfj7TGcHxZAVXlqJY5bz4+sm3lQBTbRAeObe3FRlOI/ZIRXHJpUjAD6vwVHdUBe4Ijv3n6Hy6UTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jmvu3sVW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D74C4CEF1;
	Fri, 12 Sep 2025 15:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757690157;
	bh=xhgQ+phyume8JNK88sBHYAzojU2fbVOtryATkCc/Gdo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jmvu3sVWY6OzUSwk0wXsSK6mUYqVAx09yDStz0z7tUt1FrXl3OdrC+3o1YBK4pig2
	 cYOdcVtJp086pE0ozLGtH3p1DiYeFO4NXtRPVStkTQ/xB6wVi9FFTtT6RMkW/I/hzm
	 Ij5VUDPHQc2YpDFaZM8q9Pr13rAvbwCYQnIc8bH2jQTonoJJTYwaKCcvRbsCdhvpmE
	 7uGBHQINGMDU85PTyjT0w2ttDNc/Tqvt204V0OqekuSNvmQThmn2DgVZvC2PHgiw7f
	 ZmtYjlI+ZTyENWxK1djqAGcgxWUh/cuG+yTgNQ8VSyrMo9snRAdr4/3uOkWnLfc5sU
	 IC+nGh8o0xHOQ==
Date: Fri, 12 Sep 2025 17:15:55 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: =?ISO-8859-15?Q?S=E9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
cc: Benjamin Tissoires <bentiss@kernel.org>, 
    Linus Walleij <linus.walleij@linaro.org>, 
    Bartosz Golaszewski <brgl@bgdev.pl>, 
    Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-gpio@vger.kernel.org
Subject: Re: [PATCH] HID: cp2112: fix setter callbacks return value
In-Reply-To: <20250904-hid-cp2112-fix-set-value-v1-1-17d2e26dc8c9@armadeus.com>
Message-ID: <22n5q16s-o283-q94s-o7rq-o92p6s248qpo@xreary.bet>
References: <20250904-hid-cp2112-fix-set-value-v1-1-17d2e26dc8c9@armadeus.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 4 Sep 2025, S=C3=A9bastien Szymanski wrote:

> Since commit 6485543488a6 ("HID: cp2112: use new line value setter
> callbacks"), setting a GPIO value always fails with error -EBADE.
>=20
> That's because the returned value by the setter callbacks is the
> returned value by the hid_hw_raw_request() function which is the number o=
f
> bytes sent on success or a negative value on error. The function
> gpiochip_set() returns -EBADE if the setter callbacks return a value >
> 0.
>=20
> Fix this by making the setter callbacks return 0 on success or a negative
> value on error.
>=20
> While at it, use the returned value by cp2112_gpio_set_unlocked() in the
> direction_output callback.
>=20
> Fixes: 6485543488a6 ("HID: cp2112: use new line value setter callbacks")
> Signed-off-by: S=C3=A9bastien Szymanski <sebastien.szymanski@armadeus.com=
>

Applied, thank you!

--=20
Jiri Kosina
SUSE Labs


