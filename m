Return-Path: <linux-gpio+bounces-27202-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A321BE3003
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Oct 2025 13:05:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6BD804EDC02
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Oct 2025 11:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1E2C21B9F5;
	Thu, 16 Oct 2025 11:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pRpluJdy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57AD26CE25
	for <linux-gpio@vger.kernel.org>; Thu, 16 Oct 2025 11:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760612702; cv=none; b=OlRnVCuHJSkjcDLZMYbqnDAIOM8A1DGrHfYxS39/WGscTix1KceC3f3EE+uFayLqjO8ocVmQy1xqx8dm34d79L5P63RoENf88tVFzud+zfgGd6J3AjRsQG7Ty6ylrhdc+br8anLzlRXoxrBWVbQ1RtPcfcCs1HUn+JMy73KK7+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760612702; c=relaxed/simple;
	bh=yNh22VpgcD5iZWVVFSioXx5eXaPdBuNnJFKRzPH5pTU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kHlW/o7DfAIY8Y8hV2O6KyPKSWMoxMYEF0sLeZ2pMDNlyhheTb+UxVvzybjPFZMRMJalp0yVDL0PMTa7mgAyQ6jNd06cHdRLZ1gNTxHuIzcEhXRNQoY9+NZ80W7/FIpRP3LF4s9ApKYUXZdnSFwpteH/AShlKAXTBmQdxbodH2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pRpluJdy; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-58afb2f42e3so718899e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 16 Oct 2025 04:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760612699; x=1761217499; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yNh22VpgcD5iZWVVFSioXx5eXaPdBuNnJFKRzPH5pTU=;
        b=pRpluJdy3S+CmDzXCmPjKSBJfhuP8TPPFH+u7ATDkyoMP4R+1l2RoPyVSN67iquszO
         o4uB/WoV0GiLeWx3LNUficLXtDZf9+DTS7qZp5r6FyZoI6UGU/oJV26rioeFEIdxdq0y
         4u5vJiFENGLNf0xFDUyhD2pasms+CSYyW/T4H5SkdsTXToFJJH+WcvyYDho6hgeJIwZ0
         /P0Nvx4GD9Y8DzA4RtPNCo5UBJoh/wFx4LZjE8ECuRJqRNaUQzUNu7p2tP58RlxzBA+V
         CfVmdl4S62YC3zNQhwHKlA8JpONHFDxSrUjfy1KxGo76NQw8edj65PWMQfocxX4/JBue
         trzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760612699; x=1761217499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yNh22VpgcD5iZWVVFSioXx5eXaPdBuNnJFKRzPH5pTU=;
        b=GJV7NrFK0NlPY8xKxpcV+Ff9/GEE7YT4w8wvPknrZy1VnzN6A3BowvfEOGe3bLjKDV
         2XT6ios492VPtR5UYnXF7S4QI2cPxB19p4biBHgDsVOkmqe9G4X2dcyFdlFbvEk5uKVw
         vKC41dMS2KdlNtCTGFlmXdluUJ5j7Yr61bpDnlSRbR61QwknZN/RDhezs68ArkmfvVrV
         PN2K/RBY+STrPBKslfrFZJ+pKwYXO7DNmO1Tsl/5JOkCneRUCnpbjejOAKtkVE1OYeId
         7hSVWkVqWoYxqpWuJfQQmlquK3g723MoAYNiKLBM8Tt3ha9U4NbpmKG1xUfK5qqBEyxl
         n1HQ==
X-Forwarded-Encrypted: i=1; AJvYcCVM6DbaVlQr3Y0sNDw2NGOQt0VMo7SzkywL3oxICdYCg7GGwKdnTz5fB/+1/kwinWyMm1NvEz25lDUt@vger.kernel.org
X-Gm-Message-State: AOJu0YyByupfJK+WDjUGsR+Env4POXgubtV4ewTcB53hBT9Ynb9eNIXL
	X1V4IpE9cdL7a0bZmB99i5wPP8jxX1ycdVWBbfs8qoi26Ub7rXWSWeloa9RFA35JmKyT+C3gHax
	Qtx+g+uogKKFyK6dIHn4q2ImXPR0ZAuh+hj2045DvAw==
X-Gm-Gg: ASbGncvj+DwyA+A2jo8Bly5NFKjgUJA5TvxcvmVFvwzkICnWYqUWcwCR6gzG7/EZR+A
	g8aO9DkTIiMq9AxrMGpWOGNIQbTq6a2dDv7fCBdmwbABpvypmAHZ++7clCxN58mX2qudW9Zv9vd
	xcEeLU2bhMvGGaeq3I2/aMZ8WGnMirW1D2naRplPAPlrmd7l6/fT5a9cYWRjb+Bq8dUN5Y5VWON
	nZGO/BAURQ7AwjDxMI5kzHDApQF9nu0sMbo3y6Pc5aw6DjAjH/3DRZY9JubfynYZRQbI06suwKF
	3NnE5AP/qKGgkVQNgoCzJvGQugY=
X-Google-Smtp-Source: AGHT+IFayaCD0pSGBkneNyn/a6xVpthdUoJp6sRMc3xLlMt0uMSjEDaswBOJxo1hM6bEJaYHKB510/0SUrWtiIUFhV4=
X-Received: by 2002:a05:6512:1510:10b0:591:c2f8:9a60 with SMTP id
 2adb3069b0e04-591c2f89da8mr2767654e87.31.1760612698712; Thu, 16 Oct 2025
 04:04:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1759824376.git.mazziesaccount@gmail.com> <ed65074dbedaf2b503d789b38bd9710926d08a55.1759824376.git.mazziesaccount@gmail.com>
In-Reply-To: <ed65074dbedaf2b503d789b38bd9710926d08a55.1759824376.git.mazziesaccount@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 16 Oct 2025 13:04:46 +0200
X-Gm-Features: AS18NWBwUA24uaqVHxHl7BqIfjkNE89oORmb5j7GI3HGq5QpCdYV7wiF_boIXL4
Message-ID: <CAMRc=Mcv3Mt1HHBtJtC4ZQt-RL=0UPODxWmab8Sn0-TA1fTtzg@mail.gmail.com>
Subject: Re: [RFC PATCH 09/13] gpio: Support ROHM BD72720 gpios
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Andreas Kemnade <andreas@kemnade.info>, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 7, 2025 at 10:34=E2=80=AFAM Matti Vaittinen
<mazziesaccount@gmail.com> wrote:
>
> The ROHM BD72720 has 6 pins which may be configured as GPIOs. The
> GPIO1 ... GPIO5 and EPDEN pins. The configuration is done to OTP at the
> manufacturing, and it can't be read at runtime. The device-tree is
> required to tell the software which of the pins are used as GPIOs.
>
> Keep the pin mapping static regardless the OTP. This way the user-space
> can always access the BASE+N for GPIO(N+1) (N =3D 0 to 4), and BASE + 5
> for the EPDEN pin. Do this by setting always the number of GPIOs to 6,
> and by using the valid-mask to invalidate the pins which aren't configure=
d
> as GPIOs.
>
> First two pins can be set to be either input or output by OTP. Direction
> can't be changed by software. Rest of the pins can be set as outputs
> only. All of the pins support generating interrupts.
>
> Support the Input/Output state getting/setting and the output mode
> configuration (open-drain/push-pull).
>
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

