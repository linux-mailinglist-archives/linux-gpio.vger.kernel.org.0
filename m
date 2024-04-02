Return-Path: <linux-gpio+bounces-4980-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AC1894DFE
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 10:51:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51C691C228D2
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 08:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35BBD535D9;
	Tue,  2 Apr 2024 08:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fZ+Mu4f8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A534CB4A
	for <linux-gpio@vger.kernel.org>; Tue,  2 Apr 2024 08:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712047857; cv=none; b=sFcEvdPN0K4fqIvdTKLXz0ifzGQq+fQFq4ywRoQwF8MVSlUXZ80c4GUe8rekJUO12imK7Efjapo5JpvAeJkpmSrYofgynf0BXUJJQOcCirMh69/16IsdaVe5clsEqav70cJE2rdQ9Pbri6vJ5MkSSzWgbjZ3RTYPaF5b2jowAGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712047857; c=relaxed/simple;
	bh=d56KSz8sH4cc/CJcFH4xN0gZ6zRS/QTrszJ0H2z6WYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LtRSAhbYw+d3B4b8lqAf5DvznKdXr+UkGeokuTJEej7dziHhuY3iy3+iMqRW+mDGhisz2zvrkX+mdhFBBB975+/Ctu8UlhFTVb1n+j6jPOQChaATqAcNarT22RA3qC2nrMwt7jIeVrM76y7WWppBDYG26juyYih7i+jfMlIZV2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=fZ+Mu4f8; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d8129797fcso27841291fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 02 Apr 2024 01:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712047853; x=1712652653; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wv6+xX61JtxGpKWZ45wliW2pFq+S5fBIUaTwceo8xO4=;
        b=fZ+Mu4f8Zv0Se3wyF76ZSUh2LSawVq9Xlnx6CMHyso6UY0M6IxFizcenlEQoi/eqq9
         oTpmzdbIVXFSJFjgwRp261n9N8+sasNx2AK0z66AVin8RRUIhD98g9qtN+OmQv+HwXcR
         VUzA42gllfP6CaraHvKbs1K2eiGKGQ2TVAGokFvuZpHUz6bOlFrUWj+64db1+mqu1O1h
         UD/q8qfv1SUkEKn1wTHpbadrh6X6JFi7Rx+f6Ya/sVTTadcDcp0QlG9JfY8rylpOiB8F
         3Wiq6T+nVEuqo2qcnNg3UUbps4Do1iLUQ4vhL9sD2Fszzv9FNadkDJ6bAjkLJHYm5E9I
         p3Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712047853; x=1712652653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wv6+xX61JtxGpKWZ45wliW2pFq+S5fBIUaTwceo8xO4=;
        b=v8pHnn5qQ+xFPCYr3jNJuqOruDKQO+rcOwT7Hp919rwyKzuGYfLOiUJ82BQM2AD5/+
         nAFhmcX0HPzj3ZmqTuQmD5kf+mqeDyDaUUJ5dq7ODsYodkwBbiSUNb6xil5ymrhEhiT1
         4xm3x5n0ZW2MADV7un5HCCIcs8sizlIWJJ++4hpJ+0EBmS0xGgxToZIVnMZtHw9Fq0oQ
         6bUhKVilZN7Tq/JzZxwwTCMdIG3ausPWtI9fBrDkpqdfREpS6kxk08fSD6+aDZb9w4pv
         hid3IcDRVvMyk5Ah5LVuitNg/j6gJRtKQxqMA4f1bGLOQaML+SDWOl1YrFJfCjgRI1gk
         AZPg==
X-Forwarded-Encrypted: i=1; AJvYcCW9I+BF9NTHx5FXotcABvjm06eJAW1iX5wpuO1NvzOaZvR+E+e9YI51oNC5LEe1iiFquKuWdJ/V6L+RR1bfBG7icCq8I3Gs0QDIIQ==
X-Gm-Message-State: AOJu0Yxh74ntZqkNPzaZsXxvWzRjaOOEG8luOMG1T4nfxoV0fljw7LqJ
	ytcw9J1TxWMdQ+/xIRvPcnyc5VrUMKnj8DN1oUELIQCETl0ju4h2XWAqHbtimctdywzsMY7RDGq
	U1e5l7mfN60DJEwgL1opJ17LehFrxvda3LMPO8OI9zwAZ4sjS
X-Google-Smtp-Source: AGHT+IGduSNxIydN/eNgINSn+xOiMxlwqSzSVthVPSafiIs8o0sXpk5/cAWBdV4gf12hs+oVvORpHioikkxS0Cer+n0=
X-Received: by 2002:a2e:a7c3:0:b0:2d4:3e82:117e with SMTP id
 x3-20020a2ea7c3000000b002d43e82117emr9024835ljp.32.1712047853624; Tue, 02 Apr
 2024 01:50:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240329144318.376939-1-dlechner@baylibre.com>
In-Reply-To: <20240329144318.376939-1-dlechner@baylibre.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Apr 2024 10:50:42 +0200
Message-ID: <CAMRc=MfUQ5+Tq3M8=gABA_t+bumWs8=5RZ8gVJXxFLg0cvcMpA@mail.gmail.com>
Subject: Re: [PATCH] Documentation: gpio: fix typo
To: David Lechner <dlechner@baylibre.com>
Cc: Kent Gibson <warthog618@gmail.com>, Jonathan Corbet <corbet@lwn.net>, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 3:43=E2=80=AFPM David Lechner <dlechner@baylibre.co=
m> wrote:
>
> EOPNOTSUPP has two 'P's.
>
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
>  Documentation/userspace-api/gpio/gpio-v2-get-line-ioctl.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/userspace-api/gpio/gpio-v2-get-line-ioctl.rst =
b/Documentation/userspace-api/gpio/gpio-v2-get-line-ioctl.rst
> index 56b975801b6a..6615d6ced755 100644
> --- a/Documentation/userspace-api/gpio/gpio-v2-get-line-ioctl.rst
> +++ b/Documentation/userspace-api/gpio/gpio-v2-get-line-ioctl.rst
> @@ -81,7 +81,7 @@ Only one event clock flag, ``GPIO_V2_LINE_FLAG_EVENT_CL=
OCK_xxx``, may be set.
>  If none are set then the event clock defaults to ``CLOCK_MONOTONIC``.
>  The ``GPIO_V2_LINE_FLAG_EVENT_CLOCK_HTE`` flag requires supporting hardw=
are
>  and a kernel with ``CONFIG_HTE`` set.  Requesting HTE from a device that
> -doesn't support it is an error (**EOPNOTSUP**).
> +doesn't support it is an error (**EOPNOTSUPP**).
>
>  The :c:type:`debounce_period_us<gpio_v2_line_attribute>` attribute may o=
nly
>  be applied to lines with ``GPIO_V2_LINE_FLAG_INPUT`` set. When set, debo=
unce
> --
> 2.43.2
>

Applied, thanks!

Bart

