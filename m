Return-Path: <linux-gpio+bounces-7836-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B3C91D2E8
	for <lists+linux-gpio@lfdr.de>; Sun, 30 Jun 2024 18:57:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5D5028151A
	for <lists+linux-gpio@lfdr.de>; Sun, 30 Jun 2024 16:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 279BB155355;
	Sun, 30 Jun 2024 16:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kde.org header.i=@kde.org header.b="C/NSTvYD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB48D152E06
	for <linux-gpio@vger.kernel.org>; Sun, 30 Jun 2024 16:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.43.1.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719766655; cv=none; b=dXCMCLxxpbq+aRWVVg4WY1F/2L4St5uKhrv1i5zOJMiy/fPpTN3ZmQTlFjy/TVjG2RugMqIpCfeW1m3afSqFwhuE0pCz73b8BZR7mU6Xdvtrdu6TSdQGrmmHLdBnaDXu4ieuTM6kCpk78CpiKtr+LG1UsQGOnREkEuLHq6nQBJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719766655; c=relaxed/simple;
	bh=qquErRU7TLq2+i4bAyoWKaHfv8P5SDkPyxWoojQtmAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jPMHJSCTDMoc2WYKaKxFinFZvmE2GRYE1QdKHAmDneBVrjGHVj4iPoEIY7KCWF7YGRxtcD/gt3GwoSfuZRPEW1cUPsXUi1kpgR8ruHBgqijU2fcYAHFpY4r802xMumPiDbdNZ0EZHnPrvo7X1NffhDYSBQkLo3lIbfESLSLapBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kde.org; spf=pass smtp.mailfrom=kde.org; dkim=pass (2048-bit key) header.d=kde.org header.i=@kde.org header.b=C/NSTvYD; arc=none smtp.client-ip=46.43.1.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kde.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kde.org
Received: from tjmaciei-mobl5.localnet (unknown [IPv6:2601:1c0:4501:635e::1002])
	(Authenticated sender: thiago)
	by letterbox.kde.org (Postfix) with ESMTPSA id 03BB032620A;
	Sun, 30 Jun 2024 17:49:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
	t=1719766179; bh=YNU/XwhVr/P963mcOyc4Opwj3KsTLSEEAxnAZkDs5b4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C/NSTvYDBFIQhT6KqLHDg0+2bBIvimE1HULysdV+UkzK+x50cQ0HEattNPP+qh5fa
	 iGJ6zKvoZgZHkaGy+mw/xAq7QGBI21cvzLzJYMP1c5kBhj6/DAxUA4SAHrpsUCnjxH
	 sQC+bd6x1RGiKNZNQ6eJivcq+KCAiYQkMVuqyjFBUL5oJsuAM/iK+o2+nqFtCHNJ5e
	 Tlu+jm+smjt89j3ZWuqZc84bkOTV9fJLX0anPUZ0ssCGrN/ggV/IYVzE6FoQhzCxmB
	 sx96b1eMob4eb6mE6/cgtoUy/v1vGYRGk/Myf3AVaJZV80QVy2UPpq+spyjSB70U0y
	 fl9hX2XOQhfPA==
From: Thiago Macieira <thiago@kde.org>
To: Linus Walleij <linus.walleij@linaro.org>,
 Kent Gibson <warthog618@gmail.com>,
 Erik Schilling <erik.schilling@linaro.org>, Phil Howard <phil@gadgetoid.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Dan Carpenter <dan.carpenter@linaro.org>, dbus@lists.freedesktop.org,
 linux-gpio@vger.kernel.org
Cc: dbus@lists.freedesktop.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH RESEND libgpiod v2 10/18] dbus: add the API definitions
Date: Sun, 30 Jun 2024 09:49:35 -0700
Message-ID: <1917470.LkxdtWsSYb@tjmaciei-mobl5>
In-Reply-To: <20240628-dbus-v2-10-c1331ac17cb8@linaro.org>
References:
 <20240628-dbus-v2-0-c1331ac17cb8@linaro.org>
 <20240628-dbus-v2-10-c1331ac17cb8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Friday 28 June 2024 11:58:29 GMT-7 Bartosz Golaszewski wrote:
> +    <!--
> +      Used:
> +
> +      True if line is busy.
> +
> +      Line can be used by gpio-manager, another user-space process, a
> kernel +      driver or is hogged. The exact reason a line is busy cannot
> be determined +      from user-space unless it's known to be managed by
> gpio-manager (see: +      the Managed property of this interface).
> +    -->
> +    <property name='Used' type='b' access='read'/>

What's the point of this property? It looks racy, as the user (whichever it 
is) can stop using it soon after a true read, or the line can become used 
right after a false read? The latter could lead to TOCTOU problems.

Wouldn't it be better to force users to RequestLine and get an error if the 
line is busy? Because if it wasn't busy, now the calling application knows 
nothing else can grab it.

Speaking of, RequestLine should document the errors it may return.

-- 
Thiago Macieira - thiago (AT) macieira.info - thiago (AT) kde.org
  Principal Engineer - Intel DCAI Platform & System Engineering




