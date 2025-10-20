Return-Path: <linux-gpio+bounces-27325-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C8230BF3B33
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 23:20:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 709164FE75C
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 21:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 312DD33436C;
	Mon, 20 Oct 2025 21:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X7tszPtK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EAF33373A
	for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 21:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760995128; cv=none; b=UnbL8nQSdyHjWbgJaJXYrpSsfc0Ei2SlXV0TBeDPlUopflRa0QLzqWz37ZNuhs0aTaLiyUlU3QSDkj9ZdampY/Clv+3LI4+tvUW3g3BSiUc7+yalOXcqpP1Wgzm1HDOpdox+S7DVgo9nknm3dHezynnKvOA57YMRrqfYwVhVIiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760995128; c=relaxed/simple;
	bh=vhqFHrRS3d75eDys2Z+xSehOZAf3EsLGfFSB3bsNLdE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pqMrS0aMp5vXgmxe4hvS6r6d2qK+NnMnS6OW7sgXhfV2FvfcZAK4eoncGOhk7SIs83QVA9+uWXB5+TGOQzh8bMxfZqUcDvA+gBjDUUKwcqai8qnYq6QlUFAF8ixEHMKJaO8ymSNY5SJXuz65VzjcmJCeBii2dxR8xlJik/Sz2Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X7tszPtK; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-63b710f276fso5198716d50.1
        for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 14:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760995125; x=1761599925; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhqFHrRS3d75eDys2Z+xSehOZAf3EsLGfFSB3bsNLdE=;
        b=X7tszPtKLw4/vKZKMBghDdbYDxbbqs+2k2i8OhM8Dq4Vhq1mCSLMPTQoFzxhAd9WeB
         gLuTavlTThQZeBsoeOexRcLpa1u8eQpmb3w4uApzAMyLU5CLCl4Nkfb+vSGQ7iYgayeG
         E57jBxXtG+4FAOooKlD6i5bvlSDwtmk7WOiF6s2Vu/Zmh/B9YK9Wx8oVuImcWoLC3sjs
         VsOWXuMW+t731ebas0G6jQZIC50omETTMOjXA22Cwo8K631sJeQzHItD7Md7FF+yZEp0
         nXl2apPKIkW9wGtIEVovJMM4TqqwqnmgATYoXKT9SneKPsL3DPOOw7V+qjJYPH/Zh11H
         wx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760995125; x=1761599925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vhqFHrRS3d75eDys2Z+xSehOZAf3EsLGfFSB3bsNLdE=;
        b=esNzHrnRuPiYR9FnHiz0lQsAkMtBsh3DHnKOjaou8VPYjSDoVYgDxCErfWd5P6o+tL
         r2wwjltSrkNXb83WApynveU9aVcYRChaQZ0LKoQ0Tq6EkjXCDDen87tcGk0wHGJC3zKA
         iSM4vwCqaIFr+87gAB7hmrBr4Ru2sqwG+rnO/M6L7T0iR1QeFOD6xhJuAUZq9PlBhfjA
         D1fbLZmrJXKVXDDfT1TG1S7jTuO3wKI7zjk50qd2iI8WoOj4tbRzFIzpi1D89Jda1BNX
         RIOLJMsCxOik4z5s9CDLuP73CMbp6mtELU8kYbE2QRTdZi4kVQk9C5eiXDLq81cm5Pt/
         aIQQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3QmmybaASNfy5lwXMAvfjF9tq3GCiIPjGAVjQM9p2MrUwyxAgzeb5KA7MDs8MD01nQHctCnV5IL90@vger.kernel.org
X-Gm-Message-State: AOJu0YwkWlzzeN/b2mra+i3/KoY5el2jdixW5Bwhtj4ksuVrRAKuE8c8
	PblzkerHayC0Bvik5ePoQpWv6gLG5tG+QsnkMLq6gcVmp8Oz0gonSAnYMiy08zj+kcAVRtyEXF3
	VXOCA+hxWQQFyIQJ+h5+Ts9QRGBdzw6LaKLtkFrmULg==
X-Gm-Gg: ASbGnctzlXxs2va49yvk03NF1zlxHLp6Mmt19cdKPA0d8JIE2WzOH5ig9RmbD/5S/u+
	rp7Y8SdygrMqaLcTSNwhSZqZFRp34hnJLnqB2D6R+t2VkFZLlu39mUr84BRzd/IV2svcicwhVtu
	QpKrIG5fDs7A1WuuadJoBqdboj9+o4H9W+p90uRGMXtIVb7n0dyQLg8k0Iwa1XeIkKmJ9ZSX+bo
	LXiNtdUQ9aP5a5wRQKg2Gk6fJ78UcuWLVn4sIQXySZcNRC+HV8gq5ugK/E2
X-Google-Smtp-Source: AGHT+IFFZqDcL4OepPtxgrUsn0uFlGAddlKxRV2+t2Mk3zg4gYMTrsR7MP8K72yAWcdPfCwzSDaFW6FFblpoxw0wji0=
X-Received: by 2002:a05:690e:4146:b0:63e:2ac0:9019 with SMTP id
 956f58d0204a3-63e2ac093a4mr6782178d50.11.1760995125154; Mon, 20 Oct 2025
 14:18:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251016-aspeed-gpiolib-include-v1-0-31201c06d124@linaro.org>
In-Reply-To: <20251016-aspeed-gpiolib-include-v1-0-31201c06d124@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 20 Oct 2025 23:18:32 +0200
X-Gm-Features: AS18NWB4E75rklCBn_aAVgvDZT7FC9Ws_ryqXE76wQ-YtpEHMi8QbWqbrDo34Yk
Message-ID: <CACRpkdbLRKUNUT8HfOPN9zOa6u3JyHO+K_tn76dW-CQT7oyoaA@mail.gmail.com>
Subject: Re: [PATCH 0/3] gpio: aspeed: remove the "gpiolib.h" include
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 16, 2025 at 11:09=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> gpiolib.h is a header internal to the GPIO core. Drivers should not
> include them. gpio-aspeed only needs to be able to determine the
> hardware offset of the GPIO given the descriptor. Expose the relevant
> symbol in the consumer header which allows us to stop pulling in the
> private one.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for cleaning this up!

Yours,
Linus Walleij

