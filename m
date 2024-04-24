Return-Path: <linux-gpio+bounces-5802-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3718D8B0458
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Apr 2024 10:31:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68E351C2221B
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Apr 2024 08:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 320CB142915;
	Wed, 24 Apr 2024 08:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="w+Id9W/P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80818D29E
	for <linux-gpio@vger.kernel.org>; Wed, 24 Apr 2024 08:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713947485; cv=none; b=SHLlCZy+LCnmQCF1c+sROb7unErB9cPux7PIRkMn+pioS7kho1xiEGdTNcNs916RSLCkCaOfSy6EdnZ8ujBtBEbi+pTL2CL3A7xKr4FF2kAJTxK2b3xfAQUYwp50OhOlYqoRgLLCiMcQA4QcZ7sJn5XEyZ7iz3mqqPDvco2F0bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713947485; c=relaxed/simple;
	bh=IjjbvorUSg6P4VFZn7dSqLjzf30JrNYIj5heKyHMN6E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F/5RzTH2mOizia+0/C+Xh5fcn2Sz3bIVEj+KgIEftIYfD111sGiW69uLiDpf7JhqU1c0HPJvxjSFK094jeMoLtg6OMPTYO2eElhFLTh3PyC8GN8qh0BhJ19X8r8UQl5rr+6vY8nAAn+8RTJn3rv2UAFe0gCmOFBR7zt6yMCmTPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=w+Id9W/P; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-516d1ecaf25so8543638e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 24 Apr 2024 01:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1713947482; x=1714552282; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJGoWBDSb5fGAuDy7m4mg3bWQD/UzHjf/v/1vmc9dmM=;
        b=w+Id9W/PgBlMXw4lM5uq+21DzoXXQW08FZFhJP9jHxL88u2/Ab1eAMg/6OHzzEx70/
         x77k/1eX6MBEw+D7mZN/Q2JCYxkOs1QeC2uWiuZ68mFaZS7qoOU1LdxEAHlSTzQzzJ+M
         fPg0ObSmd2fgkIUj7zHryuQenW78nnCUyrS4ZCB3R3XT6BICbxPkhAiRtX+jPeJemIu9
         s2B/CfZMtrxdjQxJKsboz4XDpJkSCqXmeatxkM67ok8vDWqX+3yR+8McSjcemUocHi1v
         3YkNmcm/NFEzPzwV5aLEaObkNz15z6v1hZN6iVSoCusgtaEFZXMVwqv3J4jz1JCz5wy+
         622w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713947482; x=1714552282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GJGoWBDSb5fGAuDy7m4mg3bWQD/UzHjf/v/1vmc9dmM=;
        b=NWvY5nMsYtTUj7RWR9exYEJG4j7Lw97HZCh8lMrn/JvFxo5tjoF0bKGgF26QrCDTL8
         E3c4OJZKG2ogglXa7yYDCa4KX+x/fiZ16fqrIKRtTjMbXN9+tnD7cGVw5xBjVDqZ2msj
         4nGR3BaoWQHcHlbFfIjm02aJ6FHRXOHNfemS+/I16dlXONb0aDJvhxQeB01qXBgiOKLa
         5Jd7jLmKHgrVNKCNLrMcH1oRePfk2+R3InPYIQlf7jglKQA/q82J8TsvyBEhsif3HhcY
         3ZmQ7Vg2lKVngoO+j8vSyqivMJPtYwt00ginvcV5c8KgK81MSXVzioHYCmOtampIQshd
         GooA==
X-Forwarded-Encrypted: i=1; AJvYcCV5sCqmTsdFYmxZ+BM2P/aOvT0gLr+zqdLPUHLkarqTgS1KIMONZPNF6RYR1BhN9zkyC8mOqrCswducyeOOcbVvF+vnoO9IMQCFIQ==
X-Gm-Message-State: AOJu0YxbuXr8Rot5mYVAgWRMLeLllXVXfgbqDep9xd+ZmIIfrt8dHIjD
	/HPUqIfJE6wEAafSM/F4lp2Zh6uvRe3H7FzYF+Ke05JfXSo63x4XFsE5jpCXlnW4Ly4BanI8V7+
	CJge+MD6zC6mucA/ugqz0bYTq9h/Q0cdSR33BOg==
X-Google-Smtp-Source: AGHT+IHeUW2RFaYOi3EycgzRf3cpJgpILPKKGH3hJf5GGNnk7Y0P6bC+UwOLzxXOL/FIEabzxw0/mhkkL0RbdpCF7HA=
X-Received: by 2002:ac2:5492:0:b0:516:cd83:71ce with SMTP id
 t18-20020ac25492000000b00516cd8371cemr1176615lfk.31.1713947481572; Wed, 24
 Apr 2024 01:31:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACMJSeu+fUdYoxue-q=DxFdvtopgshQY+i2kpZMP-RGOTqMu_g@mail.gmail.com>
 <20240423120011.21554-1-pshete@nvidia.com>
In-Reply-To: <20240423120011.21554-1-pshete@nvidia.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 24 Apr 2024 10:31:10 +0200
Message-ID: <CAMRc=MfJokORpEOMkOmQdzTuZxcUAcnmpdEyJWKqvT0gCpuzbg@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: tegra186: Fix tegra186_gpio_is_accessible() check
To: Prathamesh Shete <pshete@nvidia.com>
Cc: linus.walleij@linaro.org, jonathanh@nvidia.com, treding@nvidia.com, 
	sfr@canb.auug.org.au, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mochs@nvidia.com, csoto@nvidia.com, 
	jamien@nvidia.com, smangipudi@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2024 at 2:00=E2=80=AFPM Prathamesh Shete <pshete@nvidia.com=
> wrote:
>
> The controller has several register bits describing access control
> information for a given GPIO pin. When SCR_SEC_[R|W]EN is unset, it
> means we have full read/write access to all the registers for given GPIO
> pin. When SCR_SEC[R|W]EN is set, it means we need to further check the
> accompanying SCR_SEC_G1[R|W] bit to determine read/write access to all
> the registers for given GPIO pin.
>
> This check was previously declaring that a GPIO pin was accessible
> only if either of the following conditions were met:
>
>   - SCR_SEC_REN + SCR_SEC_WEN both set
>
>     or
>
>   - SCR_SEC_REN + SCR_SEC_WEN both set and
>     SCR_SEC_G1R + SCR_SEC_G1W both set
>
> Update the check to properly handle cases where only one of
> SCR_SEC_REN or SCR_SEC_WEN is set.
>
> Fixes: b2b56a163230 ("gpio: tegra186: Check GPIO pin permission before ac=
cess.")
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> ---

No changelog since v1. No Thierry's tag. Please resend.

Bart

