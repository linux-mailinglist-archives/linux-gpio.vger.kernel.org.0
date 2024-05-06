Return-Path: <linux-gpio+bounces-6126-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAA98BC83C
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 09:19:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD4B52812F7
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 07:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 775EF757EF;
	Mon,  6 May 2024 07:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ayoeRg8p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97CC6BFD4
	for <linux-gpio@vger.kernel.org>; Mon,  6 May 2024 07:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714979951; cv=none; b=Ompd57l3dPvile2qs+rwJ8yGg0tCQj3QUZWsAZyk2yv88yOkXGLY2jykjaQJQt9b+Ye5v4az3bNkjJ19g7YuzFhL3U+D95FP61RE9jawZx+ZgX2NvINFa9U6izXStVvSnFme2UfPwFwQuNPJc20qyMNQ9jbPRWHTOHLotuPth9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714979951; c=relaxed/simple;
	bh=BcjeHuKCFNt3g0xtf3X7hwL26jrEaUX08KPgkWV/Fm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mxo7NblXBWgicgnM2n+t9C4nD/tZsV5BqfzVDjHFopXHZ5I7hyKiFUbJTwxwgqZ0L6e8GHoyw1jgJHz+bGLPqYyyzYkaAjM4bQrXyMJFb9eb+vxFm2F9mDPh8RjWjePR3g8t71nNUJXqhL7UZZ1IMtt5gZpvrCDsmT88t63/ttk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ayoeRg8p; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-de5b1e6beceso1754262276.0
        for <linux-gpio@vger.kernel.org>; Mon, 06 May 2024 00:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714979949; x=1715584749; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BcjeHuKCFNt3g0xtf3X7hwL26jrEaUX08KPgkWV/Fm0=;
        b=ayoeRg8plY6k2zAO0hGLqfqQUHiFqYC3XSbQ5n6VYswp/HLe03594rVXUY38ANM1F9
         XLdnIRilVQ8ketGFiwMW+s5U4NkVyD4WVZjf+TLSmNZAMCd5+Zv9X0X+AdpqhxIjhED9
         ijtHQ57Ehck/6W36SvkagRR9tu5PPUw5oYgp0pss+Rasv9CxoQHaD+CskIBG/I2tN7TY
         m7AH6p7DnKTvxGWY0dXBvkCDEBFdwnFszxfahUgCLLIHz6JNltfNz6c3jf0B3g2My8g7
         rw6fbV+Sfos0PXu3OQSvl2RJ+5om/PrCcioTBQ3TttjYSK+wGUyC+m2OqVzEju4EiTCS
         Qr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714979949; x=1715584749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BcjeHuKCFNt3g0xtf3X7hwL26jrEaUX08KPgkWV/Fm0=;
        b=jyeosX6JHyPcnjUspZ8dThIbRDyJvYjR38Op2r9vPRbvMNMd9ix2jCFKDfBurMHbej
         UG97ugiG9xkyiheGfaD+kfYDplROlnaFQLiTxodsZkCyK5lfA+zZjDC0pfWKq75BydKY
         YadAD6HreOQCBFbddLvBCDsPnTV7OErG7RkTDgmratLeyPOO7Xwo89lW85bEALWWPX//
         XIDuqgJeLOoelAWLogAKBboYHNaSzOUyoy9sFcyCcxBq9EJvEFI45PlO3UFhALNoS3/i
         3awOxZUOrXXeR8gq/nonaXiG6YgT8YtmPebF+0xWR/aVhGQGsv2yPsY5+ehWGNOSXFgz
         nQxg==
X-Forwarded-Encrypted: i=1; AJvYcCWt6+Mn9VVsA8vbHroREObB8kCrsxl13xbAJHjAEftuoiHseyz6ENZ/Y6mZHdKxdNykmHR69zXjKZvNZnCzo21il+D4w0UD8lOUOA==
X-Gm-Message-State: AOJu0YyuYXq5I9hrJ/UYNORfNru+WdLm9t5E5pcKBKKCt+OcQjqVTAY6
	MMBqGqOAKsT797TsmqdaaUeGBwFOKiPJtFTacq4T6hf93d7MsW6eKU8/aRQsyu+ZSyxYRul2LhN
	F1/n8JS8TlbyuLdFu/O1F5V09+KerzrTc1Oy/7Q==
X-Google-Smtp-Source: AGHT+IGoDixNoUaDnMBz7LuuCzUKda16Cqz3qmrnX+jMYQez9FjCtQ5nkqPx8YFJMFywsbQfbLrvit76T/JAbCJBsNA=
X-Received: by 2002:a5b:e92:0:b0:de6:13a2:651a with SMTP id
 z18-20020a5b0e92000000b00de613a2651amr3365815ybr.39.1714979948907; Mon, 06
 May 2024 00:19:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240505141420.627398-1-andy.shevchenko@gmail.com>
In-Reply-To: <20240505141420.627398-1-andy.shevchenko@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 May 2024 09:18:57 +0200
Message-ID: <CACRpkdap=KXuyoCjWt_v53ArRPynDQndAjjHfvapLUM7VWbbdA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Discourage to use formatting strings in
 line names
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
	=?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 5, 2024 at 4:14=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

> Currently the documentation for line names allows to use %u inside
> the alternative name. This is broken in character device approach
> from day 1 and being in use solely in sysfs.
>
> Character device interface has a line number as a part of its address,
> so the users better rely on it. Hence remove the misleading documentation=
.
>
> On top of that, there are no in-kernel users (out of 6, if I'm correct)
> for such names and moreover if one exists it won't help in distinguishing
> lines with the same naming as '%u' will also be in them and we will get
> a warning in gpiochip_set_desc_names() for such cases.
>
> Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

