Return-Path: <linux-gpio+bounces-26662-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C549BA9607
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Sep 2025 15:41:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E33918917D6
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Sep 2025 13:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01D393074B7;
	Mon, 29 Sep 2025 13:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Yfmrrfy2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF74307490
	for <linux-gpio@vger.kernel.org>; Mon, 29 Sep 2025 13:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759153284; cv=none; b=HY3xqxo+ZKRHpwfEMejo2zfGwOx7KhiN5XvbNmQA8J9JPVNBfCcAtJBE4C7NS8NICkQ2u0VgCzhCBD7i49o3+Q1i2jTqQnnDdEWTH71gdSrKy9GbdzHGn91sipywDAalIYrTfTt6qdL4sgVN1lxUq3JQBlDKzwI4nmw1+N5ZUdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759153284; c=relaxed/simple;
	bh=5uahX3/t/qKl+AWu2lHhkUSygd0Oeo7v5srfItKOpo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uVNV8qKJkN8xfXv/2FjQ9KIj6u9Qpb/TFuYaFdF5iXiqLpXZlhlyV6RhqxKK17cYNfW7+asnkQa3U7+ulNHbm3I5AolLotisjxCte13AehPXd333qWzakaZNNxUtcHIthaBYcpoyxEhT48XuOTKPC+bz9HXGXe9dKTNjFsMUN78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Yfmrrfy2; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-57e03279bfeso6576090e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 29 Sep 2025 06:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759153281; x=1759758081; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5uahX3/t/qKl+AWu2lHhkUSygd0Oeo7v5srfItKOpo0=;
        b=Yfmrrfy2+GMnQBf9zFdyVUDEWWBk7u2IspZC66fvQ78A1OHbwndRgBelIasgsZpbpL
         Myh+TWMFO+toEbK+5IE/UW6n3CRi4rpIoKJho27gz3Yp+1um0S1UYJKGmUzyM3TRVZbX
         a4W+eNLF1Ep145PoknDbfr0oqYv5FrdInBntIkfrZ48eL2YuJnvPi81RCCPrT32tIbtO
         Tj/vuH2BUk8mCzL/Z6O9F8NOCgAq9xsg8knlI0Fea5zcpL9O1J9ZKrRG8CvXjpG62Zyw
         2mDC8jahuA1b67ayY4OTaO82SbTCBPUT4KxWBXuMIpdBMmukJervGKJwOA5gj8OtkR6C
         3GGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759153281; x=1759758081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5uahX3/t/qKl+AWu2lHhkUSygd0Oeo7v5srfItKOpo0=;
        b=EFsz6ZlDfXMDSz+H57/gvxqS9G+M+r6sl06tknjPOAXPUGIB2ugcHpLdDwxPu75swv
         bSIPGf7QCL2+Po84yHY1vXMkep45zAXyTkmj4ZDTX2qtrPc35wnf/nsnFHLEHwMfgs/D
         azvHhprk7E9TVdaqwYwQNu0iXMWQp+mN5QWSvHFFIW1ZFwfEfnR7YKMkWc7HrYdLucqx
         2CZwAbqMaB+SM+lxhjht/TLDEek5NeMDhufNt6JkaRMtRKd6pI3izHb7U8DQHlrOt+aC
         19LDFbMIBf9WF2s8fTEcx3qBYk/PqCAG0H5r+urWKpVfkIlWmf6ttMwharBmOOEGS7V5
         Eb4w==
X-Forwarded-Encrypted: i=1; AJvYcCW28A68dyAy5y4qbXA6Wr6t58HpKsaCN+2zL5OJ8C1DjaC/R8duvvmbunwCRma5Av/GFOmOB8WtZ4b2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4lB6KUG4oGZ2ijwn4ofBunTiJUePgXdBBTIA8Zc0ioRPqAc8E
	KYCAt1oisDk9Bxb33aOgMkyYaPyShDRJs88jR8ll8D5DDr3xPKzpGnymOoOww5tUN53rZ5OkjK8
	mI4jUoDlfZsF5hf2tjwvVlpK1cx6gY2x6YmHvL7/oOA==
X-Gm-Gg: ASbGnctfHyrezY7w6NAghoDY9hzhAga0D7cjFDUuxOAWE+HlMcnK9jbG60asW7Fso6p
	sX84Sm4Lby7Lpuo9Q7padvGk3hpzvWXPwl8w+IsFUjADe3MBXo+KWdd4qGtJBq/aTzJSRE6LvXu
	3XQHcyakYOh9wSZv3RgYBzC+V6EHYohApjj1OshYQzxjlDVMK8tPdlDI9riwqLj8q/uT3h62O7V
	4hAhigFcNHIlirEgzlB9FQztpVb010swxcwRyA=
X-Google-Smtp-Source: AGHT+IHVwcUt8n2Dr1HYLUuIj7lg91of8OCj1ZiQGHG98cWyZH+Ddd15Wdp2OohNipHuMRCcT2tzkYcUlRcdG1A1CM8=
X-Received: by 2002:a05:6512:304b:b0:57e:3273:93a7 with SMTP id
 2adb3069b0e04-589842801c8mr179708e87.21.1759153281232; Mon, 29 Sep 2025
 06:41:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250919093627.605059-1-kkartik@nvidia.com> <20250919-undusted-distrust-ff5e2f25cdd5@spud>
 <f6c001af-bfaa-4d1a-8c32-1e2889e78650@nvidia.com>
In-Reply-To: <f6c001af-bfaa-4d1a-8c32-1e2889e78650@nvidia.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 29 Sep 2025 15:41:08 +0200
X-Gm-Features: AS18NWAjOCk1Qe6m9A7AF8f5gOU-rIzmkU9f6UFIkGdqyVsyB080HPyzY-M8DlA
Message-ID: <CAMRc=Mee9JvcOCAqQxcCMBE7gUQWvZaM=wDAfyKTG5bKyZeHTA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: Add Tegra410 support
To: Kartik Rajput <kkartik@nvidia.com>
Cc: Conor Dooley <conor@kernel.org>, linus.walleij@linaro.org, thierry.reding@gmail.com, 
	jonathanh@nvidia.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, 
	Prathamesh Shete <pshete@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 29, 2025 at 9:24=E2=80=AFAM Kartik Rajput <kkartik@nvidia.com> =
wrote:
>
> Hi Conor,
>
> Thanks for reviewing the patch!
>
> On 19/09/25 22:44, Conor Dooley wrote:
> > On Fri, Sep 19, 2025 at 03:06:26PM +0530, Kartik Rajput wrote:
> >> From: Prathamesh Shete <pshete@nvidia.com>
> >>
> >> Add the port definitions for the main GPIO controller found on
> >> Tegra410.
> >>
> >> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> >> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> >> ---
> >
> > Why are you modifying a binding header for devicetree when the driver
> > only appear to grow acpi support?
> >
>
> Although Tegra410 is ACPI-only and does not require a new compatible stri=
ng,
> we chose to add the GPIO port definitions to the DT binding header to sta=
y
> consistent with previous Tegra SoCs.
>
> Thanks,
> Kartik
>

Hi!

The kernel policy is not to add symbols nobody is using. Please drop them.

Bartosz

