Return-Path: <linux-gpio+bounces-2839-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E37384489F
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 21:17:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED16A283BB8
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 20:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 450503FB20;
	Wed, 31 Jan 2024 20:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fDaNr2Ao"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F253F8F9
	for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 20:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706732252; cv=none; b=AfK93ZMAAZvrdyJpX/vEXBouSx4jgJpSqEf6hW9JAIFw3RSR3/cOT0zFjYyZ7YzXZRuh7j4sAuwD3irhMkhqa1yL/jU1jKI8cRXrYht46VUyeAOUt5mJgNCh0D0pHTbc8GW415TsC8I9RySm0PfF1qZCBcYfgRhyOAI15exFu9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706732252; c=relaxed/simple;
	bh=BTliOxaTIKtdhGrJh/+gt3GB4Eb5h9IjYdumB/YLq0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a54wSTljgoYwWxO5QUo+sqdm+zZZAQq3HyZpQqdv92Ur1Aq7THHjEvzHRvWmFKJ5ENvN6/92oZ7GWB2AeeWwV5Ha+BGtQVKwV2C7/BoB3xOonbMZzxteFCAFzWiA6HuLAtxN2xXdrC+gHGRIaMwGUUfznjYotzgaJubKcvjke2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fDaNr2Ao; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6040d0c9cf1so1889857b3.0
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 12:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706732249; x=1707337049; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BTliOxaTIKtdhGrJh/+gt3GB4Eb5h9IjYdumB/YLq0A=;
        b=fDaNr2Ao7hZVgSbDc7CNLOsmpj3bC+iwhd2SUj3SP+CzQhOMOsmvbfg34cmHtQNrYc
         Ef2wfDFIpj6Xvw8duIyahJAIcbpqmohmsaRLg9DGFoIqi0vRf6SzYxXbx0x3sUmN/Who
         G8Gtk90ShAagF1E+4U+nRpGF3dQyerPmDJspIHm/7pesqdD50fyj1JLp2EdggjsH0naa
         X3Shu9my5CTY8ehHsrd50zOJMAzD+08XFMGORQNsKZdupksGQ5tAxcGnz6iKbrXOdfCQ
         TGJ9JLKL0WjQ6kLzW7xnCd5I+HkHWtdYiMKRIVGWNiRUNSQolsQT8ThO8e0bELCc9sU1
         tvQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706732249; x=1707337049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BTliOxaTIKtdhGrJh/+gt3GB4Eb5h9IjYdumB/YLq0A=;
        b=UyDT9M+4yePOlJGL4kWKJ1UaXBsxaLR3U91iI53/71TWLMqkwIM7/49fmw03lzn2qG
         T/M51YxCy0TKRzAo1dz7nJHP8xmolvM6i5sqygaEyI+6QCSCl7lGRmdT+c0lwG4TEpFe
         xNM9O0VN4VZlENzP91W5/celGp3hhvdj9p3TFDqxxjqSKbeWsGuBwV5QcPyHso9RKrXO
         rP3Mi374IXouIGheOLIQxnoVPj0fQkIxzOyPITy/hoXncigVviv7UxKmkqxTKuegCSE8
         JVIzcrs/4XR0cQ61ambNuMo9dD8wRtiiKxg3LsgJmHbqbPcAUBEjoB7LJbB2PnkX8yYX
         7YiA==
X-Gm-Message-State: AOJu0YzyUe90cSFFxgeQOYdXipkFJrupyV35X0gctq4y8CzkvNTGDAu1
	kxRIbOB1IQDse4mibAXln/k1eObDHlNygfh8ylxLqFcQ5J6A39GRKEhPcwrEtf51zlksEG40w8t
	8TswaVwRnziOpMR+NzEYT2aQe7WhwHQ4zYx1ebA==
X-Google-Smtp-Source: AGHT+IEqmyTd4gqkQ6kqF8ce/gDvES+VmPNb/Xegyl4QD24HktmyP6vfTyAaWq3IqSksBdtOEL9MC58IPSh1Ru3fWGs=
X-Received: by 2002:a81:ae5e:0:b0:5f8:f50e:bcf9 with SMTP id
 g30-20020a81ae5e000000b005f8f50ebcf9mr2827329ywk.20.1706732249448; Wed, 31
 Jan 2024 12:17:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130124828.14678-1-brgl@bgdev.pl> <20240130124828.14678-19-brgl@bgdev.pl>
In-Reply-To: <20240130124828.14678-19-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Jan 2024 21:17:18 +0100
Message-ID: <CACRpkdaiECDm3g0HOvBgRDrEieM9A5+AMfN2GFkRhP05XY4L8A@mail.gmail.com>
Subject: Re: [PATCH 18/22] gpio: add the can_sleep flag to struct gpio_device
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kent Gibson <warthog618@gmail.com>, Alex Elder <elder@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Wolfram Sang <wsa@the-dreams.de>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 1:48=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Duplicating the can_sleep value in GPIO device will allow us to not
> needlessly dereference the chip pointer in several places and reduce the
> number of SRCU read-only critical sections.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

