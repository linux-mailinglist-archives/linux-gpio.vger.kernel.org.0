Return-Path: <linux-gpio+bounces-30477-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A34D18223
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 11:45:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4BF5A305572E
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 10:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A07BB35CB77;
	Tue, 13 Jan 2026 10:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rHNHasLZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7B433F8A3;
	Tue, 13 Jan 2026 10:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768300982; cv=none; b=YA5rwWtFDzSgT5SnfGOkKp7u/01bDu6PwMb0Sxj7MW7tmsYoUDW8wAccDRLDVy+hw8qEYMpZc2estnAAncQ0KxAAi7nLVxunV4RKbNtfcMeuJhxXGJ7sk7FvvDLt5bc0oB7B+lRDprrQ3EymdOG00LGII0x+goza1RvATZOmRkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768300982; c=relaxed/simple;
	bh=4wycElxB14mKcIvLi1UyjMYoZK5Vi9O4AMCBHHzX0z4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UhYjq/Fxth5qH37j/PWew5U4cqEQy30Z5WNBjyQWUldRHgYRz4sCpI7qBm7sNKMLXCCDfJs15e3sZ2mUZXHz09oyX4KkLMNPeDMLoj88fH1njzB7yICRPQJjXm6Q0Ha4ukhN2V4dD6go/rGcVsIeIvm6vW7Ze+QfgjfgmRNO65I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rHNHasLZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB5A0C16AAE;
	Tue, 13 Jan 2026 10:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768300982;
	bh=4wycElxB14mKcIvLi1UyjMYoZK5Vi9O4AMCBHHzX0z4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rHNHasLZpv+f/d9cUBB++rxR14dVfdYgAuzRZxJGMVUtYGLldSThMR6JsRsTXOR/T
	 78sO7K0cJtJGtOB3fGFWw2OmwMqlsNNgRT1DGDtUOJyaZdSJamKZhS/Zi+l4LsAliA
	 qrUA+kjdxmh8ixJbk5X3jUOeUe0P7J+iq68Stknv+tWSlmSR6mJp/N4s8Ui2J+NgE7
	 P7FrKLAl3GI6jNxz3FK2xO9k2V/AsZd6tgd5zMfPdCC3KGyhXxu3Yojs/6JpuyL7LI
	 VeKBIxJzJZHkE+9FgMGUO5RxSciGk1RuDl8jYxuG0CQ2SnX2qrQctnBNrR3dvnsF6D
	 RZVGzJjEb0mmw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Linus Walleij <linusw@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Robert Marko <robert.marko@sartura.hr>
In-Reply-To: <20260112-mfd-tn48m-v11-1-00c798d8cd2a@kernel.org>
References: <20260112-mfd-tn48m-v11-1-00c798d8cd2a@kernel.org>
Subject: Re: (subset) [PATCH v11] mfd: simple-mfd-i2c: Add Delta TN48M CPLD
 support
Message-Id: <176830097951.2766066.3185432253526354233.b4-ty@kernel.org>
Date: Tue, 13 Jan 2026 10:42:59 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Mon, 12 Jan 2026 17:14:52 +0100, Linus Walleij wrote:
> Delta TN48M switches have a Lattice CPLD that serves
> multiple purposes including being a GPIO expander.
> 
> So, lets use the simple I2C MFD driver to provide the MFD core.
> 
> Also add a virtual symbol which pulls in the simple-mfd-i2c driver and
> provide a common symbol on which the subdevice drivers can depend on.
> 
> [...]

Applied, thanks!

[1/1] mfd: simple-mfd-i2c: Add Delta TN48M CPLD support
      commit: b7fb6b270bd3b772c09151e71760d0ec5b0b61a6

--
Lee Jones [李琼斯]


