Return-Path: <linux-gpio+bounces-12700-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD429C17E8
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 09:28:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1C1D2867A6
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 08:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 777F41DE3BD;
	Fri,  8 Nov 2024 08:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ab3PzqSl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D031DD9A8
	for <linux-gpio@vger.kernel.org>; Fri,  8 Nov 2024 08:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731054514; cv=none; b=fhiwSXI9lx6AONyJjle8yLIpynliRM9ZE+hpu3DqLX2ebwmXUZLLSROGcGnh+u0FNr097BnueEFZq3j7hy5xJkXgOZnSHNiWLmKV9WQLoU6X89Jw3lcO2UXvYK5XEPVDQ7EvFVZpW28bF4m4KhVxzLfWRsGVp69/2wO6VQO1Xa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731054514; c=relaxed/simple;
	bh=kaMh04+CLb7ZuQdQwd4gSI6K1RpPGQ2X0wWmQyg4vCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eQyeTGMmFq9mb5fqA2pX6bpkpzTH74xH5yIgU8ZrQ3i4zMTchu7r88TnmhJXZ47W63Bv1tbikHCnDibPJg2fKvB1PETm9Om0kGD/KLI7njigQHnX+84wYfJtiAF7H4KYJQnaPl4HfDGCfsx6/C74BjDU/1RxJE4ipf/Qe8fnaMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ab3PzqSl; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fb58980711so17561781fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 08 Nov 2024 00:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731054511; x=1731659311; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kaMh04+CLb7ZuQdQwd4gSI6K1RpPGQ2X0wWmQyg4vCo=;
        b=ab3PzqSlh+7MVx9YgzYXwyRF5d8Ak1hp++oP0WU6CSdsgOfZLFYwigp8SuUPDYnZv2
         SWB55lgoIWt25cAIEA2sMVBp62vG+a9tKupB6vwwVihCXbr0al2bYlC31s/FXaUKtqh8
         5zNSAE5pgHA+9KHlGR92+NmjKygBBX1hu0hRabxDLTMClpHerk+ah+/DHiyrCQH2jgKe
         ZvGZfjzlNv4OxT5V8V8Ulu8x+6K1BL+fEAwQwe2ieGRGp9dZz2/7fO31ksJGGSU+9JDr
         NjoPhVaLYIXaTNxANlPIqU0/DWqqLOZbjyyf/pZCKi9U/iPCE1Tmlkpk5RxAvNSIlM/8
         nr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731054511; x=1731659311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kaMh04+CLb7ZuQdQwd4gSI6K1RpPGQ2X0wWmQyg4vCo=;
        b=dLlvClDSr//BrqfKod2nRs+1vYuUxM5duNDCQ6ojSKH0GalQ2D4DlEf2kVUAWlgYGA
         D2tbP2ZPYUWoozvWZ0jaMn1l20QpCZDeXjM8UTAe8xgyZraWVkpBCDaH9xOWULTtGHd7
         +6QR6tPKnzjwhxnxrRLykaHmY8eHULtmwyW4xN4sCxWfHhMnzolof6MILoYdKDf8p9ws
         oQAuppezvnAIjgpHho4WPDnphqPWNszK0kUhtzx8Nuw7+Efujhw84rwtgYTsDyFa5KM6
         nWx7xVjtRdfa6f00GD9M7Uvt/LfFeJ9AbYulxIRiw8+ct8eH3eFGcFiNdLUDLOiV0nU8
         R3Ow==
X-Forwarded-Encrypted: i=1; AJvYcCWRsos5neSZ5EG6iD01zsiUrvPCDAzwIPd0D6dFlWia0cifcfdmW/vSyyzFQ4bHumaST8vAxXSUB5Ye@vger.kernel.org
X-Gm-Message-State: AOJu0YxO/9V6JVERchuWMUSLCgD+Csd3Wl/3x6RiYOpm550KBe810S4U
	JteJyXymPxsaEEij1s61bASMAMxcTGS7hcqb8Lbw5rZdHZJP+UKtbw1GtR0hncgqNraQMFSrun7
	+gOJTkz+FtQKaz70Fz8IB+cX8iyr6x/iHbFmWjg==
X-Google-Smtp-Source: AGHT+IG+g9QB/Q7yhaX//JsVe1DFtQNOzLjrFeQ0iseJ97Cr2u/qsa6qFZ/FQqJfsYHVTCRrxZ6pRHR0v/dSmSX5cBg=
X-Received: by 2002:a2e:b8c2:0:b0:2fb:48f6:27e4 with SMTP id
 38308e7fff4ca-2ff2015261amr8351291fa.3.1731054510817; Fri, 08 Nov 2024
 00:28:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com> <20241104093609.156059-5-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20241104093609.156059-5-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 09:28:19 +0100
Message-ID: <CACRpkdYF-_6vb3SsJ9EHh1mCbqeW5=qoYkLF7Re+XyGq36OJSg@mail.gmail.com>
Subject: Re: [PATCH v1 4/6] pcmcia: soc_common: Avoid using GPIOF_ACTIVE_LOW
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Pavel Machek <pavel@ucw.cz>, 
	Dominik Brodowski <linux@dominikbrodowski.net>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2024 at 10:36=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Avoid using GPIOF_ACTIVE_LOW as it's deprecated and subject to remove.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Looks right to me, some testing would be even better
because I never trust these flags to get right.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

