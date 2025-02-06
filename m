Return-Path: <linux-gpio+bounces-15427-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B467A2A48E
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 10:34:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BE8B18891B4
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 09:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4B3C22577D;
	Thu,  6 Feb 2025 09:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OxNOUIG+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E37226194
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 09:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738834214; cv=none; b=pKcF7BvnR9GBMYg1PLk/srt9npkR2/7Axr5ImC9o2redIp6S+/4kq20bYFXR2GGuUkemtpT8oR/zd8hZgnZizACQgTAwiRMGUL6YB5HUJ/akqhwU9x3PDt2+lrUVTdI7B0/1INWkV+9ZChOOxZH471hU2+JIaz02y9ZfTgnT2MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738834214; c=relaxed/simple;
	bh=SdgHInAsUXSdKixwpkgWNZ1b6pPlCjYH0d4wlVq+enY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h0jK3H2CfIlfCgy0oJjF7wbKdZFIQMJbdtUK2vYYawXD/GY7/GPlPcoUll+XrmBPJXg0J/bTyj0JlFuqAVRwqbxtYZv8ktvdL6Y6m4hcZwCB7D4mDJVlbmOzV3WRuThaZpO0gnGSraLAdyeyK8k9fh/dvetCVVoGo7So/xPY3pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OxNOUIG+; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3061513d353so6929381fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 01:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738834211; x=1739439011; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tAC13CYCSM1LP7N2TeDcVK+j1mbZEQhsK8lcbic5FlM=;
        b=OxNOUIG+jXADCLJKP4P6wowQBrbW4U/BSzS4ME//2SNl39zdIkW/e5DAfRo29jsuu4
         gHVuoVlJiIRC1Ug6QM9FvE9FbdSWJhJczEoF/w7U9NW2kfMqCU8pWT8A3wYBJDtczRd8
         p6LicACJi7+eEt3nAj5+5bkBnsQeGseCWYwJhrXp15fO4OIQNGDQ/UR/wJwwzxV/i/PU
         Bz0Mu+enFvxMjHVWNgAQRULeusF8r2V1r87OLlSsWUyGtG1nk4FW+hC7KsRfLda5rUna
         FKWaOxKya3+x6nMJOhvYJh1j6qtkmsxuKdpo+39cFyetIwzh5v9JSVO7WvYN8ei7DVBT
         h/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738834211; x=1739439011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tAC13CYCSM1LP7N2TeDcVK+j1mbZEQhsK8lcbic5FlM=;
        b=Wk3qL7UMoVXcFd7E+/oRAir6hoxswAj/0gQXS4FSCr6GpDf5d8ZLXDh6h0ALuK1JY3
         RDC2LWL0Mp0EUMQ/n4HovwqK0DsaaalMY7O8LwYpCICSIWYliHeVxW55kNQ5pPUwXCkr
         YStii5i9qfNrWgKVIdl2g+1+0FiFmnHH1KrYx3/t3kyi6b2IqSLyTEdYMHUnT+oGSP6j
         Vo2X3DCc2Nu6BFpagj09uiVFrPkdtjC/4a9do1x1fiZuPn21PiApuPGMbl3N/mcpfzbF
         3P0w1OibQkrpXsRUp2ehqVVHRD4S8IZ6kJQ6GSd1pRZJbjlQKnvJFg9ZwJ1qFutBnF8h
         wuqw==
X-Forwarded-Encrypted: i=1; AJvYcCV+kNKJTO5BR/5+jddvI9v9yTHXmkTRdBz1W/uQTMgdWWh78oq4VdaMefDdOaWy3bnbnrxx3s5pFisC@vger.kernel.org
X-Gm-Message-State: AOJu0YzUyoA7PAHxuYGaGM8JiKvcJhyvVZZAQHEVGfGdo82z/mRouEND
	Kexv60EyQzjIUWI1GVTZ/8VJPDwJG+k+3OZ+n6VWlvM6jb6fQqTHcw1v1fg7eoKVvZXYhGxhgRf
	UrL3N5THGUKzgz7I18S7awSDk1P0AaKn6EJxujQ==
X-Gm-Gg: ASbGncthPTlV2SuR6u7c/AJ7lH/pUgWS7TcIcubijs8orHAazgRcdy0Z5ovI8pd2s4O
	PQL/RU+PbZX8jb+azJbo1mup0VRRyai4lxuxBJ2gPqKxa9/d0rA7h9YaYFFe1uPCdsmmwZV8=
X-Google-Smtp-Source: AGHT+IGCbK5+XwCvq93+VgFVenxmOMdhIuSf3XKRCy/oPksbUb9k5UbqbrA68zfdY7TzalRQv/7sFEWCNRM17b/N9ow=
X-Received: by 2002:a05:651c:2204:b0:300:1dbd:b252 with SMTP id
 38308e7fff4ca-307cf2ecab4mr19091371fa.7.1738834211024; Thu, 06 Feb 2025
 01:30:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129020048.245529-1-linux@treblig.org>
In-Reply-To: <20250129020048.245529-1-linux@treblig.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 10:30:00 +0100
X-Gm-Features: AWEUYZl5g2Z6K7OUBqy6qoL7Spv6SuqCSicSmBmwEYZK1dgCVgMzmZnyxigQlWw
Message-ID: <CACRpkda=jnUV+N_UCdh_c1mKboaxkK25UPTc0XyrUXNNX_EOug@mail.gmail.com>
Subject: Re: [PATCH] serial: mctrl_gpio: Remove unused mctrl_gpio_free
To: linux@treblig.org
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, brgl@bgdev.pl, 
	corbet@lwn.net, linux-serial@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2025 at 3:00=E2=80=AFAM <linux@treblig.org> wrote:

> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> mctrl_gpio_free() was added in 2014 by
> commit 84130aace839 ("tty/serial: Add GPIOLIB helpers for controlling
> modem lines")
>
> It does have a comment saying:
>   '- * Normally, this function will not be called, as the GPIOs will
>    - * be disposed of by the resource management code.'
>
> indeed, it doesn't seem to have been used since it was added.
>
> Remove it.
>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Looks correct.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

