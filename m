Return-Path: <linux-gpio+bounces-30416-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B35E8D100E5
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Jan 2026 23:25:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C3195301075F
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Jan 2026 22:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CADCB2D3738;
	Sun, 11 Jan 2026 22:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="td4nRqJZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2AE241CB2;
	Sun, 11 Jan 2026 22:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768170314; cv=none; b=uIvZ/LTJdegamm+mS8Y+kbCGLoQWpASpXu25EUiw3QpzVKIGO80NpDqQ8DFf0D0Q9XK+CcgDeI1z22+7c6hzYND7caKFhlI47nG2aD/TxVhR2ZiPEFBUTsGTXlA9xVidq27e6TN91w4+xVyB8mtGFD4RnW7NaMhqPQT5B2l1Vkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768170314; c=relaxed/simple;
	bh=OguSzA8sVgcIVytHQtpBFDSEbItc4oTWM4Bzc3s71Nw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XXFd2GrIJyNcyNoR012jlcos4B92+o5HUzNSOUnB1kIZxuDiy43ORUWoCwAg0aM09J7zuhhsDrMpch0n1/7FkoW658AZvJRKKPZfhxCCLlY14qE3WqECtI0fK4CVsxfSePUic+MyrxHDcU2nHXL7HiM00ari6o7psMEOqTrnhxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=td4nRqJZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BF31C4CEF7;
	Sun, 11 Jan 2026 22:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768170314;
	bh=OguSzA8sVgcIVytHQtpBFDSEbItc4oTWM4Bzc3s71Nw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=td4nRqJZ/5hUdA97a8i7BphQbdnT19zmpR7u0CbnG9PD421n4PNQypSfrVCeBqgbm
	 I8Pk86W0xfLAdAEftenprMv8nY38LiHrDl0+Hr7ghdrOwEvkKq5uKfUkepHUzOLsyR
	 Y477lSOp0UOxJHfI/rNxZ5MmT8A7W6dS3b8BwTfroBc0boYH/XbvuSB+vpUZxx0UG8
	 g//86ObVy0ZRD/XW3CGgs+mHGoaVDILoZgaZqRDlwELK1el96k/tCt6UeR/EgvdgYO
	 lfcDJyeK95gqDgcYtlilnNZvoJevj8dFBoS0n4O2t/pv17qZCbyMpD7gsjDAzcN0NO
	 Ebf5RELVlsMtw==
Message-ID: <b53286ec-5c3a-4f8e-93d4-de5ea37f645a@kernel.org>
Date: Sun, 11 Jan 2026 23:25:10 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] RFC: pinctrl: apple: Implement GPIO func check
 callback
To: Linus Walleij <linusw@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Bartosz Golaszewski <brgl@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org
References: <20260111-apple-req-gpio-func-v1-0-6deb1b695371@kernel.org>
 <20260111-apple-req-gpio-func-v1-2-6deb1b695371@kernel.org>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260111-apple-req-gpio-func-v1-2-6deb1b695371@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11.01.26 21:29, Linus Walleij wrote:
> This function will check if the indicated function enumerator
> i.e. the value set into bits 5 and 6 of the pin configuration
> register, is zero and thus corresponds to the GPIO mode of the
> pin.
> 
> This may be necessary to know since the pin controller is
> flagged as "strict": once you set a pin *explicitly* to GPIO
> mode using function 0, the core is unaware that this is
> actually the GPIO mode, and clients may be denied to
> retrieve the pin as a GPIO.
> 
> Currently none of the in-kernel device trees sets any pin to
> GPIO mode, but this may happen any day.
> 
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Just took a quick look: When we use them as GPIO we always set those two 
bits to zero and all "special" functions (like i2c or spi) always start 
at 1. As far as I can tell we can still read the pin value even when bit 
5/6 aren't zero (and e.g. observe i2c traffic that way) but we can't 
drive them anymore.

Since we don't have any documentation for this hardware that's probably 
as good as it'll get:

Reviewed-by: Sven Peter <sven@kernel.org>


Sven



