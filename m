Return-Path: <linux-gpio+bounces-2826-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EEA844812
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 20:35:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9016E289B85
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 19:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C4D83E481;
	Wed, 31 Jan 2024 19:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XvIdksbI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6784C3A1C8
	for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 19:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706729721; cv=none; b=mLpuoFWKHsOf8hZYbSG2L0oFus1kffm/cMBONzAkpnTkGnUy16MiENJTWsuUfsWjClzsULopRE8C75hf/85YaC4Q+hN4Y7FZeDYnF81471vROJ1+yTR9Kys+cemWfTuUrNoy5jFzFMVVATbx9JWXsVlys+P8eN+UiN1Y1uVWetU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706729721; c=relaxed/simple;
	bh=UDmCmOtnw8M0P/f5Q0lrehAH3NXDTmEoF/3d+TzNzB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rba0wjRWINQrnCJ/tdOBFVQefSd3lddsQs1HgQkG8QosqalMdEuwgXXvpoL3Z5C7PS5qQO/BpoV4Qd+6fjsiOx4ZieRmFQB0x4euqPPtc1ZifZkrl1mlZt7xWUuaHb8nfKWd58A5BstoLNzK5CUSPCPDM+tEACg5VSEgnh8ktpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XvIdksbI; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-603c5d7997aso1304787b3.1
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 11:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706729718; x=1707334518; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UDmCmOtnw8M0P/f5Q0lrehAH3NXDTmEoF/3d+TzNzB4=;
        b=XvIdksbIwvURcsyRbLLtSjazwD2J2t9XYDp/QWdJuVg+AFGMyl3weFYimWDsDZKGQ8
         MxVENR43W0EadA5G+qixVROVVA7ha/E26HqZR+gAoAwKeC+gf9fhDkKzptDljC9Jn2OF
         ZAVYJBYNVIMZFbGOvo46ruafUxLz4BrXXwxwqZNuy9bofdouhzJaEmsBolyK+tVdswb9
         LfS+EVTZKunL4/0inK+q++Ny8T8OlenU8XExHWSCoBy1b6+lBuPSaqBj4zy4imMW1Ifk
         tTRlW84+fR2BCXmMhquxBn1jtRziSibQTSRI04Xm0TNWawsuJzH28Ie3AQ2Kqm0LmrRs
         E/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706729718; x=1707334518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UDmCmOtnw8M0P/f5Q0lrehAH3NXDTmEoF/3d+TzNzB4=;
        b=OSdSs8Z2nZr7AISijpKFnem/w40w0vz5Vkj4d7rmxMTTzO3qVQRvbtwPsfh5vQkWpB
         jVdDHv0l+tMCVaSrBWr6VGFZga0vr9Y+fXwpWuBsnbkjUc6FbVnycIpPPV8CMpQpR/Zo
         n+fIfbzHncE0YT9nQ/k7IwA3OiuwadSX3Ytuf7ywy+vYsZIOqluUQcmzBjo9VDorTIAt
         uOA5/Z9oLc0NJnWNvYJED7Xyw3BiPkkqlgnILNkwxH487kcmNt069f+LkT0fm6FNi9N/
         RdFDFV2cPtzBR0rQK81qqkOU9koN4tTpy5B4ZclYINS3j/hzI1KBqXnhXoFAbDgfUTOl
         zJ7g==
X-Gm-Message-State: AOJu0Yz8DBnJN+xUq0RCWoijv7Q5QhWkVWJkgPZVuKpUSu2H3P8qvcQA
	14Q1KUR3YlQCofmR/tOzoFhnwNOwWYqh/I4EJbkMGMGZXUcuntFkdRGM/tzxhDg5UJj3hvCOCqp
	YP+3KqwbosAzFbqETtnKZZgmBfLhJ5LV4ImGWIg==
X-Google-Smtp-Source: AGHT+IHeF7jUdgGl++cSRvx+ErSHPKU5y6456vlmuHRMjFCbeGPWJ9PImNXQcwszPKmGPHWL4IdLlyN1GWxLsnxdVBc=
X-Received: by 2002:a0d:cc12:0:b0:604:2c8:e49f with SMTP id
 o18-20020a0dcc12000000b0060402c8e49fmr2039032ywd.50.1706729717963; Wed, 31
 Jan 2024 11:35:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130124828.14678-1-brgl@bgdev.pl> <20240130124828.14678-7-brgl@bgdev.pl>
In-Reply-To: <20240130124828.14678-7-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Jan 2024 20:35:06 +0100
Message-ID: <CACRpkdYwpPb+Cdzu_75He2YasLYzLaePvKpDLCeBPuATDZ=zNA@mail.gmail.com>
Subject: Re: [PATCH 06/22] gpio: add SRCU infrastructure to struct gpio_desc
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
> Extend the GPIO descriptor with an SRCU structure in order to serialize
> the access to the label. Initialize and clean it up where applicable.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I don't know the inner transcendental semantics of SRCU but the code
sure looks like it is doing the right thing.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

