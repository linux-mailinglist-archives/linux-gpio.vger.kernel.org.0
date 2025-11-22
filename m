Return-Path: <linux-gpio+bounces-28977-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 21057C7C586
	for <lists+linux-gpio@lfdr.de>; Sat, 22 Nov 2025 05:03:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7F344353234
	for <lists+linux-gpio@lfdr.de>; Sat, 22 Nov 2025 04:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 563271A3166;
	Sat, 22 Nov 2025 04:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gsQBhgDJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B957C165F1A
	for <linux-gpio@vger.kernel.org>; Sat, 22 Nov 2025 04:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763784200; cv=none; b=Up5Qa3TBivMh4/s2atdY6DqzzbBmueHoKIdDlK9yVSDfz0z8HBRSfTFZaL3pdg1yUKw8C8zAz0EdObx8hMZpkG69m9F2Y+0ia2F46cbaeRE3fNn/t3OYZRSXCujY/RC2k1g3OWZlSvMb01co10EKDIbZEI9zC/Mtt9b5VIY4LYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763784200; c=relaxed/simple;
	bh=qyMzdzHYDMYqFQzW2ArNvJJeLkLm3tCCW/4nC3IuBAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pG5fs89I2nidoKyvfX1g5jNUXJ3LTHyW2ASh2XSxoBmDpn1KeWYY1M9lbtw5r+EZ45ISkBGi7w77dqBE8s1qDk2E9l/yZ9h+/6UVQy4+2VYJKdfVYGjZeswMK7ZwS8jf0haO1WiOnE0Eh3c+Y1Q9mIubQCSjOQTaA9eKN4CaIcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gsQBhgDJ; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7b9387df58cso4229253b3a.3
        for <linux-gpio@vger.kernel.org>; Fri, 21 Nov 2025 20:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763784198; x=1764388998; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iycavRWRgKLLyhh6xJLlNPBSnn2IV9PunT9+kNEJQN8=;
        b=gsQBhgDJkQBE8FhyCa/li9K6vVv4OJGf4b8vCRfthyKsl0tSKGRcOuEnJCliMiswd+
         W0i9mU4sOc7U/WPnLyPA4wegQGGRkMguX85VcipSI5T0a0LmNTqus+lMPiS3jw0ZP9Zb
         2CWr9N/eEOyqTKO+BbiaOtpvCPJjl15BIDR3gBM0U/I4icqIfcy3x6l2wPG46KX9Zy6Q
         XLROwuKDCdOM0CEK086sU8jlytrCwjviNyEGip3GVNrEG2nobz3t1Qsyrmb1duetQWbQ
         rKlNeATEmoGbUBJE5KcdgSCrz3lgYDvcYtzi4ql/VgjsKaXGMN0h8bvkhWRBRtSzUIiM
         qojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763784198; x=1764388998;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iycavRWRgKLLyhh6xJLlNPBSnn2IV9PunT9+kNEJQN8=;
        b=Xt7jgL9lnUKXmPxGKNLaGw1O1wrU/3Wc6DfUUot5y0Opc2N2O1Ojojpyru9gr6jqSS
         hJ1b9L4tkni2QCdD2EENcrRP941/Qn1bE+8DtCu+jl53oYHCj2QWg9lqnhFPmopqpv8z
         OvXV1KWKgfi71rDGyVR0BnQrC0Eb4oxXNA22yHUZ0m8tPON39hDLFwEyQWqLQRH8hps0
         4stYZStX28qYg4VjGBW6ZrCw3WGAkbTvxgYUK8NPaY/UYbAeGovzK4OekgijkcKCJVVn
         vrkPBELOOXnXfhwQks4OttXtL7pxo6dztrJ9c07ViXQO8y3jt1WOwbNd2O7s0fta7hHe
         J2AQ==
X-Gm-Message-State: AOJu0YxT9n7SQrAEVAKZCNoSKPYdyBUdLG6ckF+RIXtUjLfSFZ+b/EmX
	S+9eUMmteCmUecBZob25U6kf4+nOmT6ekLPNSeaCyNHdzmuTDn8hOrByEliP2Q==
X-Gm-Gg: ASbGnctgQydKUNzkLaWs1z8p7Z3w3xBV7TXvBWvtyivs3WI6KeOLlUwwRLjiKVZokAj
	Yl89uUyFyKLeejWcdpr9nodZPpiLOihqQ70Ce2maek86uw9TNxn6jJ3V/KkvgU+Sqc6YX0UJkMF
	Y4YOlofunLSdlb6QbSjyz7rfjALyoP1p1TdfR2eYnqIi9k0tj2j1wxZPbrjUIU7kdNs1wkn7zLc
	m7FyRB6QKqWrlU5gvzTzlymnEHa0eOceBsXBD3Jpy0FMDogZZmxPxmfO4oO9T8O9c/V9i2IREqE
	jmoBFXelwos8uyy4zWsj7PYxmVIZlXVuDoV1kgGV0MBGVfdUo/vW9RaOIn9y9EUPRPhnKbOkQlq
	0og3zB+FwDtVpECYKw1bIk3j5e5UxJ9584dK5LsfXw8poXWcfrtA3aAeW7XusjJZUsW53hRMr6i
	EiIGoDUP0/wrAeIA==
X-Google-Smtp-Source: AGHT+IE3jKPOaur5eps4MWPr4XEYKybV30Y8+rLr+6clRzTzijxS8UqOjDCJsoY6kylVS9TEg57eaw==
X-Received: by 2002:a05:6a00:22d5:b0:7ad:386e:3b6d with SMTP id d2e1a72fcca58-7c58e113265mr5277184b3a.21.1763784197870;
        Fri, 21 Nov 2025 20:03:17 -0800 (PST)
Received: from rigel ([203.220.65.85])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f1264210sm7534223b3a.60.2025.11.21.20.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 20:03:17 -0800 (PST)
Date: Sat, 22 Nov 2025 12:03:00 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Matthias Urlichs <matthias@urlichs.de>
Cc: linux-gpio@vger.kernel.org
Subject: Re: Open-collector GPIO usage question
Message-ID: <20251122040300.GA9997@rigel>
References: <fa30998c-db6e-4ff3-b327-d8b6270979fa@urlichs.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fa30998c-db6e-4ff3-b327-d8b6270979fa@urlichs.de>

On Fri, Nov 21, 2025 at 07:59:47PM +0100, Matthias Urlichs wrote:
> Hi,
> 
> so I want to efficiently implement a bit-bang-ish protocol, meaning I'd like
> to use events instead of busy-looping.
> 
> The hardware uses open-collector wiring.
> 
> This doesn't seem possible with Linux GPIO.
> 
> I cannot set input and output flags at the same time. Getting events
> requires the input flag while the open-drain output flag requires, well,
> output. Owch.
> 

The uAPI supports either a receiver role (input) or transmitter role
(output).  You are not locked into either role - the requested line can be
switched between the two as necessary [1].  So half-duplex.
But, as you say, it doesn't support both simultaneously, so no full-duplex
transceiver.

Should you require that you have two options, either a use a second
pin, an option you reject, or write an in-kernel driver for your
protocol.

> AFAICS all of this is enforced by
> drivers/gpio/gpiolib-cdev.c::gpio_v2_line_flags_validate(), so not gpio
> driver specific.

cdev is user facing and is validating user input.
It does not follow that it is the source of the restriction.

> 
> As some hardware seems capable enough to trigger an interrupt on raw port
> levels even if configured for "output", this seems overly restrictive …
> also, I happen to not have enough GPIO ports to use two per wire.

Some.  Not most.
This is functionality that the vast majority of users do not require, but
if you think it would be benificial then you can always submit a patch.
But, to be clear, this will require more than removing that check in cdev.

Cheers,
Kent.

[1] https://www.kernel.org/doc/html/latest/userspace-api/gpio/gpio-v2-line-set-config-ioctl.html




