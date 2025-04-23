Return-Path: <linux-gpio+bounces-19225-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F9EA991DD
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 17:36:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CDF61BA41D7
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 15:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6EC428CF65;
	Wed, 23 Apr 2025 15:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="KtkrAzVb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC8227933C
	for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 15:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745421383; cv=none; b=Al969WrMke9ENoeu1z9NxByW2cLCdSElY6rSdA593wSYD7kUGQMJzPM5WPdWGu/jsy8GqdvE8TpQ9xjT9eiAXsHNr6do17F/x6GXCleE49ogaeADGM89nTJ+3NVQMCl3o5zBzRbgv5x7mTX/yRIY3LzcIsPrjNXeNcG5OjTnOLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745421383; c=relaxed/simple;
	bh=qlpNju/NMeRKY1xUkgP16/sPqOPjSqfdYSpiJoQx0FQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aMK+tA81obTpPPU43jbTEuHqtBsEriRW9bPaL4q+CxjU0CDU430i1jCw8OlGHH2N6kQ3oLGHEtcwQmG1608CqxrSQkjXSEFRr800QHVfjfTZZRDg2HhOAxD4j4aDiwV/hfY5GIS8xf5ONdNyWCj9Nk27ZEdJR/oe/gQsqvB4c5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=KtkrAzVb; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54b166fa41bso7164183e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 08:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745421379; x=1746026179; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qlpNju/NMeRKY1xUkgP16/sPqOPjSqfdYSpiJoQx0FQ=;
        b=KtkrAzVbWnC0LPvAgOLoPN2A+61TYNZpdpMS8HMqiDPDU5u3rPwaINq3AkTeJqRuhO
         hq/7XSFcSSJ8RBQkjwlRg/0tfGFAyxTbf7yrMMkC3+J1zyxTTsf4oTeBaSG3D7oPYd3U
         jsRbOv8HNp5PtThDLiqEklscXZHuMMzg7nHZvv6h1xzh6B+KEtFCQokO5Npqwr33vG91
         LCsPvHcyiSq6ATiJvBIdLZ9AnIbVhZgWa+G+rduSj+TLtpJh99T+BdsHCuv6Vp5goNug
         /H1wT/HUr4LA2fVMTsuXyjvi729MuoVz6U5Qvhmp0iYkLGTaYjuTRQOMY1zqMzjK2s/0
         nXCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745421379; x=1746026179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qlpNju/NMeRKY1xUkgP16/sPqOPjSqfdYSpiJoQx0FQ=;
        b=eBLS9z+rIY5vOavhf2RSmc6KsMulbqLvvAamPd//dP9qxeNjCQAN67gd7xsD7nYIY9
         tSXrx8A7u0UdnFI5gf9nA123UTAnmAxtAgu2gr7fZLJA22fZHbEWtiIJS76cRnY+icMP
         O5nqDR8UvHBEBXFWjdA2lNtEQkGb5seXzo9sjmUlCxbw45MkCv4GFswCGCVYJLcpXjXZ
         d2j9w+fvCpEo8kBDHypGMv6BPuQcbjDnW51KxPM6HQRrzJzm85q6UfAEiGpapjEVuxcF
         91NC25pHs7zIWaN7/s+e7IPYLdnZYyPcGkmquGsqG1CDfz+Rom8iXC3QalBiexF37uZ7
         S1Xw==
X-Forwarded-Encrypted: i=1; AJvYcCVrnAMCnPmf7RzaKVxR67HfP7jJruomC41Jm8rsMWI1l5WOmoFJO+jp7+GhdewB+CT4raaBCztWxQM1@vger.kernel.org
X-Gm-Message-State: AOJu0YyIufAef0/5r97+s2e2bJ1KQwN4kDneOJvnWZeOh1muuOxIrXFR
	JbZGCJxSrN2+CNf6isfnCjL1qzNHVjtqT2bgMTyyvx1JcSGtnv3Tc7OaU+scf0Xa83KV2JFBNpZ
	RriC/TSIG6RGYPZGINU2Cw7+J+xvKk09qqthzWQ==
X-Gm-Gg: ASbGncuHRZSRUnvRrIxwOEugPTouIstGxx4cyMh8MCMjt4qr8U7bMpxvrcKnNHEeJMM
	e9FAG8kQWdhe51khCCkYXPiPq9gZtb4r9uQjj7/Gs6n4hgB2UjaaAC0hSD0+9z7rNzdxgd5PlfW
	/Lmt7Ej/UiNS5eWaQg3CSE18VCE3wMr0iS3zn7lCKx77VruTITu4pv5A==
X-Google-Smtp-Source: AGHT+IHI6FEFDrMfYDdXhYkYNDpHXaIiAxn1bvrzybfafv+pPojsem41Q9McPU1leKadb1ETRCZkCLPRYGg+JPXxqGI=
X-Received: by 2002:a05:651c:210b:b0:308:f860:7c1 with SMTP id
 38308e7fff4ca-31090556ab0mr67855181fa.30.1745421378812; Wed, 23 Apr 2025
 08:16:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409211243.20105-1-kabel@kernel.org>
In-Reply-To: <20250409211243.20105-1-kabel@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 17:16:07 +0200
X-Gm-Features: ATxdqUEu30-v4vZ_QcfqEo1SABrb4VJLmGibSpys6kuYcnJ0aykhfiWBeGUNa70
Message-ID: <CAMRc=MdAdfohV1Xa-2WAyKVr1sqQeE-=G7V8LkzFhMZZ-5-L+g@mail.gmail.com>
Subject: Re: [PATCH v2] platform: cznic: use new GPIO line value setter callbacks
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 11:12=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>
> ---
> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones.
> ---

Can this be picked up into linux-next?

Bartosz

