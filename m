Return-Path: <linux-gpio+bounces-25620-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E676CB44679
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 21:35:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A4DCA00DF4
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 19:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9621426F445;
	Thu,  4 Sep 2025 19:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xFVx0wqg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EB72459C5
	for <linux-gpio@vger.kernel.org>; Thu,  4 Sep 2025 19:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757014543; cv=none; b=IpLc7PP0qLB9ZFOasmCepgbTm93DoRmaBNM9gb6k2wZlrfCgAPeynl8MTHOk0UpIzJkQbVyh3fa+G1su3s3M7HzBAN8V5o3YrsZfnpJSQIqBLVNjobXr6j7AuM9AKpClnt7uKB92/rBAVAD6QdPkeALZO5GekQWwDXcMAmozmN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757014543; c=relaxed/simple;
	bh=32nYEhO3U0uVRAxCwAscIZa3xyyyN4IzR3cTBfcZ/4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aywn75A0q+RB8fL3/JhPagw1vQqGUF5fn/d8r9+E6mKyM68ftRpqC77eZUOi4FE2c2YyDx/QSweHG6hdcYhqigfi2poC4i2zA90GOBBAithFwhtA4+8sVdfADCblPv0Ty797BJ7x0ViindgtWxZq06mdkQsLu+Lic6tw+MFT0+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xFVx0wqg; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-336b88c5362so13675491fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 04 Sep 2025 12:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757014539; x=1757619339; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=32nYEhO3U0uVRAxCwAscIZa3xyyyN4IzR3cTBfcZ/4s=;
        b=xFVx0wqgOn7c2ZpHLjaVzxtGc4XHsgiAAS4p9qJLptr7Si1mgY+XmAKEpqRuYm/cdb
         7gVnfC9pGrukbXoiDPPavzOZlAmm0/9c+O9oHYeCUNkjYNXIC4XSXA3KyqDtQMM9CEcA
         dnvpTCRCQhKFaSlUw141azOpaLG26XAA25rM8ayG8IPDHMYs+4ycpmC8Fw8wM5F9aPjF
         cIiJWPxJqwiWszERMOUIaWOmGE2F3zptKsc/vaLgrO6EBD3f56lvBq7HD+xrH9Tl5o6D
         xT7YvowSW4Db+7wxPtJ1aXiJYQYhG4p1yp/Ov8ZHyIpHDSC9lt1D4LAMI7TQuRGB3x6i
         1N6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757014539; x=1757619339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=32nYEhO3U0uVRAxCwAscIZa3xyyyN4IzR3cTBfcZ/4s=;
        b=MerBqjaJ3XBdsy7jF6MkbgMt6ZKnNd1W6QB6MyfOXMXT6YdRX4JEZ74salyvFasGYI
         c+PorCjyAb9n97TNs87ZipPxNt4JYaYMX/ZpKYG/BY9W0+i5nODX2CwYvVBJaV69uyQR
         kmlkzWkt5MYFJyK11pXIvSsOoHsOofVTpwLQbK74yTuCGPucMeIFHDApsuU5/l97+Zd8
         cqbEX9JwmdyelRg4PrnICCeZYzroIvj2LUs7f4WzA1qBBVmJ/wnAkA7FlaBq5tJnlfhm
         W8iNnGAErTYcetAlRor5kMsIKFKaLMKx5n+hNujPqDpa+g0VcCtqN/hne9xtoRq5FZwP
         MEVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvsZZnG1lTHgCftIirMdFK7iaq31ai68VkI4WMTWpEN2dQ0vO9tRb/7ii7uv+R/anN3eQIJ0NZ2WY/@vger.kernel.org
X-Gm-Message-State: AOJu0YwypTNE1k5ctmuQL6MNGsPSdi/jE25qumb7GbY+xjuCpMOYXpU3
	8jnGllAM6g9CcWeU8tGbK6VKdmezbnBuDva+KruSTDJN2MCU6Sun9/rAPZm8PCVUIxAkuPc+Qvl
	dGQlEq2t0IQcCiAfC1S05GoOdsu0Thq/8iL3SaqV8+A==
X-Gm-Gg: ASbGncsgdGB5GWVfd7RxXrkKcOQ/i9HNZnA8gu2UFhOAJUm+xkmgbyHClYlM2C9QmvC
	lPaA65TtckMDBjgYZFnNWud1r3wJAKlTSqoS4qKSW88Hl7RVilh6TXosKVeFSPwLRwM782VqwU+
	qJFM2TGd7/TJNIeyQtPbVhM49TQ7etu1WO1YB5ZREAquFI6OtneqZKOnbWNg8CLFDZUVC7Tx9cc
	7lV8R8cdF3efiWcdQ==
X-Google-Smtp-Source: AGHT+IFk6qWrCgBCMUMmRXmwNfVdMojmRglmfhyiJ5psNymemT9FqXab1r+PbaMVvluse9Mju6Gt2tnrWCGHPJdZfDY=
X-Received: by 2002:a05:651c:1079:b0:332:3fd0:15fb with SMTP id
 38308e7fff4ca-336ca5c1a70mr38397421fa.0.1757014539436; Thu, 04 Sep 2025
 12:35:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250903100104.360637-1-hendrik.hamerlinck@hammernet.be>
In-Reply-To: <20250903100104.360637-1-hendrik.hamerlinck@hammernet.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Sep 2025 21:35:28 +0200
X-Gm-Features: Ac12FXwi4fLng12UMi28VuiL73WI6CiLUWCY-CJjaRNMNpJieZixpye9Zb1GrH8
Message-ID: <CACRpkdYMHMvFCzcA0G9sj+xSrjXROU4OmnV=x0EPfRBpVycQtg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: spacemit: fix typo in PRI_TDI pin name
To: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Cc: dlan@gentoo.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, linux-gpio@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 12:01=E2=80=AFPM Hendrik Hamerlinck
<hendrik.hamerlinck@hammernet.be> wrote:

> The datasheet lists this signal as PRI_TDI, not PRI_DTI.
> Fix the pin name to match the documentation and JTAG naming
> convention (TDI =3D Test Data In).
>
> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>

Patch applied!

Yours,
Linus Walleij

