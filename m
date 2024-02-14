Return-Path: <linux-gpio+bounces-3263-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0FE85453C
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Feb 2024 10:30:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF8D61F2BF73
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Feb 2024 09:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0490412E6F;
	Wed, 14 Feb 2024 09:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="T0EctImZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6805812E72
	for <linux-gpio@vger.kernel.org>; Wed, 14 Feb 2024 09:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707902978; cv=none; b=F4TKnSDI+7IoCwnA4eXGaCIJiJIhtaeVfYbaXKV/ASuQjuMGzL26RNedJBKPO8d/KLQyKxdB+IDG9KtB/3brc3uRw8duDv/zUew3w2Fzgg+nVBZEP8OrAkbX7L1Zszzlp7McFYIa9rm/h7M4fl9aKflkMsNPIFl4411yzmk22Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707902978; c=relaxed/simple;
	bh=QGJGbBcSxuCx9Avf+9BT92M2uOkRt65tIyJgEDued6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jrKWniGow+esLwLZZ1ugkxStWpkLmcOuiFtDQrHyXeS+FekUJp54/hZqRiBcVBvFPDKZqQ5bCdse4ZZD+bFJQcpJH4yW3HwyC0lFiA2zn02xmRa20pG8A/dHGirQQGMC1SIrm+LhWElNDk86Pf9GU5495vadb3RxO5D+/Tdnuf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=T0EctImZ; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-4b7fc7642fcso1754863e0c.0
        for <linux-gpio@vger.kernel.org>; Wed, 14 Feb 2024 01:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707902975; x=1708507775; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4NTlOSe5fjimviBpJdsalrhomrdPQE7oNI7Qj6Alw1M=;
        b=T0EctImZYwp0q3bNcDuI/KHQXguCPWhQPhBEeNS/Y9BGb6Gp+aQCIMaE6Pj/JADY50
         v4xxAiydJaGS20EQkjXt4c6NYdOEVMDMY+0AACTnbSgiCke7pbhmVz74oHowlMaqWVIq
         2T+CWhG9nTDTQhw59tB7YBTOGSv0pGmw52NgVWVWzyA6TP4mERn5OUeo20krThvmmo1h
         cP0/iN4SR+6a4b99EC7SDvsPE1eE/tE/oL/EcFpF/eIDbY6U3GhIt9+5EVO5X8B2cHLp
         Y4WEH67iirem+BIucQ7fru3vIkEQ51Ghm1I1n/odNCJvWAfopng72fJyXMUnauxhJ4ro
         zTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707902975; x=1708507775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4NTlOSe5fjimviBpJdsalrhomrdPQE7oNI7Qj6Alw1M=;
        b=W+9Trlw8knzDsd5xZedM+Pzg1zei7iufraExowe55+Y4hT1wS8vSIwpHbFj+Ogsl0s
         mtXU0bL/EmGWePOwB1xj01R8eVhKwgB0PAyT5xbW5A0tWrkG7f8isi7KCZKo+cjxIBjN
         I9Aj/LjfqrIEfs7vMZgZQncF6I0DiTSXfW/TX1LxAfSn0rm4m5hj1V19qH9cMt7JbDuL
         r9120nvMWgHJS2ipBUgpSPScVFZheREFXaaxqJvfeAF9uT9VLcZcnsM/NLPwhWfbWh5G
         TuJeaLdh1eKt+HJAOIIcN/quNL+2vIgqi4QtDoUcZqsmbTyeAlcw+KTFfZwtE40Ywdeg
         4ang==
X-Forwarded-Encrypted: i=1; AJvYcCXwoY5TlaMyo4CZosBJEmYepr+xY+6Z5omIkLxpr52m/JO4WhkiIYhMP85t5c/jIGDYpvWZ/Jbadm8R9NywAyUgpn1EL3kTG6jdWw==
X-Gm-Message-State: AOJu0YxKWhpwNufQuYF9i3FTzzBbgM+t0gboy8WZyJTJIE/+AOVNue96
	WagealgYWUdO0LgWwtdJMi+eDSyjk2JWbyHTufMx1A232Q9C5JmlhWAqxAfosbpNaH9fAD5pNqM
	VCvnUpssBD9Tm4yYY13vsJfFZqSEXN9kH6ySoAQ==
X-Google-Smtp-Source: AGHT+IH2j8d++4e+u1mW346Mzu8bIt7wE9r3caRvalw9/NdZqNB/8dU8pyZv7IJ5KcYwAbcnPABW8sixlqBXfX1Jc1I=
X-Received: by 2002:a1f:c787:0:b0:4c0:292d:193d with SMTP id
 x129-20020a1fc787000000b004c0292d193dmr2079166vkf.12.1707902975308; Wed, 14
 Feb 2024 01:29:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240212093420.381575-1-warthog618@gmail.com>
In-Reply-To: <20240212093420.381575-1-warthog618@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 14 Feb 2024 10:29:24 +0100
Message-ID: <CAMRc=MfwCQYuouRfU7i2C-YKi64_pTCRCs7jj6evBefj7=Pbog@mail.gmail.com>
Subject: Re: [PATCH] Documentation: gpio: clarify sysfs line values are logical
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, linus.walleij@linaro.org, andy@kernel.org, 
	corbet@lwn.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2024 at 10:34=E2=80=AFAM Kent Gibson <warthog618@gmail.com>=
 wrote:
>
> Clarify that line values are logical, not physical, by replacing high/low
> terminology with active/inactive.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  Documentation/userspace-api/gpio/sysfs.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/userspace-api/gpio/sysfs.rst b/Documentation/u=
serspace-api/gpio/sysfs.rst
> index e12037a0f2b4..116921048b18 100644
> --- a/Documentation/userspace-api/gpio/sysfs.rst
> +++ b/Documentation/userspace-api/gpio/sysfs.rst
> @@ -87,9 +87,9 @@ and have the following read/write attributes:
>                 allow userspace to reconfigure this GPIO's direction.
>
>         "value" ...
> -               reads as either 0 (low) or 1 (high). If the GPIO
> +               reads as either 0 (inactive) or 1 (active). If the GPIO
>                 is configured as an output, this value may be written;
> -               any nonzero value is treated as high.
> +               any nonzero value is treated as active.
>
>                 If the pin can be configured as interrupt-generating inte=
rrupt
>                 and if it has been configured to generate interrupts (see=
 the
> --
> 2.39.2
>

Applied, thanks!

Bart

