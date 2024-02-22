Return-Path: <linux-gpio+bounces-3635-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D1885F7A6
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Feb 2024 13:05:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81FED1C2411A
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Feb 2024 12:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 569394642A;
	Thu, 22 Feb 2024 12:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gW41vm9a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEAE41776
	for <linux-gpio@vger.kernel.org>; Thu, 22 Feb 2024 12:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708603516; cv=none; b=hFkp2la+JuJ3vuGGwy+zIUE+l1g4E2M3ElRVuw7KhO6jPw0F0K33H974oYS/HRcFj59k2PzB1B7uOULhWVMsM6/1uR8RtBf8OBhxDfVUZK1H/hUjXStheKdQn9ia4tD+4n+uBjI3BN6LAqt8ArSe0x9MTdIQwewQXbbZkstKIV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708603516; c=relaxed/simple;
	bh=dGWD6NHH548xIqityNEoCsAmU5e6mGLq00J6IaYPuV4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XnLxO9NqNYG/FU1nhXhrUzXQqmvo2pev8ihts1mN+nzLLriUg3peB97Go2lgR/bs0d5GeHkqcX57UJjeHxzL873Q2Sg8SO7/cZkHIsDxXzbYIknSx2OqWO82MAtUd/JmYkUWLpzAzeUA/FYXf+9asRZY4NX6UiFn5oy2K7WfQok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gW41vm9a; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6080a3eecd4so59084897b3.2
        for <linux-gpio@vger.kernel.org>; Thu, 22 Feb 2024 04:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708603513; x=1709208313; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGWD6NHH548xIqityNEoCsAmU5e6mGLq00J6IaYPuV4=;
        b=gW41vm9akcQB7AxMmihe453r38x+A2sdYdZTOW7UPg8KwkJXjdRYBYjGcWnJjUhdKw
         ayoIStKi1pSfF2uU2qH+YFUY7+Q0qA549T0mm8s/vjcxbp+KIM0ArRorrGFA0P795nao
         v1AoOI/6IDpWSW5DHX2EmSUfcKC0x7f+cRgzawlmFI8l11zQ6ROrwAkG1yMORZ+oeix3
         H69TJBjoI6mXOA/4kTX3WzAFQ0yK0pVHggzBzDGVqGJLZK2kswVuiUyMHFwFS7KLKotu
         6wIdx8t+Z5b8td8NoGJX+AgCcBGIzjO8TdSh9lXUEVzGMAsDAa7/I3PmAyR42bbAnrJA
         9z9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708603513; x=1709208313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dGWD6NHH548xIqityNEoCsAmU5e6mGLq00J6IaYPuV4=;
        b=qDzKn8Ds+gx+NNTzP1fiygi+yKvjZ2YCcnb8vTfv5wG4Dmu1cbc249Z+lt1R4HIUKo
         0+w2zUwwJxS2EAdBESX+/MnasHyInF+cTj4cgGUaLlE+ILd2NpG/QKGpESY1xc7Wp4G9
         s8XZ99EHGXNEK6XNcU4ZCuy4aiYcEn0M09VndL73eUEdyNeIgsOPsdd6TH2vjxue8GIq
         E4YgMn2mEqshHjTktA3caBZ1PS7Wgz66CHXXLKsZbGHOtxhJdRLAs9BTZXzGS8PCTROl
         DVeAV6UpfII7nqGG+8arRNm1cqLzUgBIL9CBQu1LS711gTXfCuwEXoO+i+Otvboyfnkm
         ZTTg==
X-Gm-Message-State: AOJu0YwVEfTxfiD0H/Ch18xR9Z4p2b8zaUh7re4fV6sCpGd1XDBVF4Ql
	Gc3PgZXGkjjwIKBFZQ7uQBXKduJNMDoY+06Z4fx+IzDUXrIWQVL70eXaurX1FtjxDvymhHwVngg
	oQkik3YkWM8DYR56mYAhJxXPi+1G7tgbupKbGvA==
X-Google-Smtp-Source: AGHT+IHkJyZ6/z/AqebANcuFmHUqMm2MbLgG0od5FktAoz/uxsuEctz7zm8Hhx2ixPA1QZA9dedCP3fZYTdMDh5FHEk=
X-Received: by 2002:a81:bc4b:0:b0:608:74b6:49af with SMTP id
 b11-20020a81bc4b000000b0060874b649afmr5838471ywl.13.1708603513654; Thu, 22
 Feb 2024 04:05:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240222102513.16975-1-brgl@bgdev.pl> <20240222102513.16975-2-brgl@bgdev.pl>
In-Reply-To: <20240222102513.16975-2-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 22 Feb 2024 13:05:01 +0100
Message-ID: <CACRpkdazuHcnXMSffa=hfHAT5nfZ0uHeDqStOBTOOsTZdmx3cw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: sim: use for_each_hwgpio()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 11:25=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Display debugfs information about all simulated GPIOs, not only the
> requested ones.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

