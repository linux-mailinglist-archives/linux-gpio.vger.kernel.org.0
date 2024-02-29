Return-Path: <linux-gpio+bounces-3960-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 070B086CA66
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 14:37:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD66A2836E7
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 13:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E353D15D2;
	Thu, 29 Feb 2024 13:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F7PLT07C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3D97E578
	for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 13:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709213847; cv=none; b=gBGZXvj63qcMcReNoYYQ/1B4+kqj3I1k5yUD48R8Q3Ixdf0SIfYqJk42FvcTj+l8KcrlYGe2kk8nPbOj9Ub0Te21xuC1giGpafy3zG7bHSEkAJiQzg1u9Ux/VRlx9pRipXEResc0EpBG/zfCy5ejEHcqv7GRifVjd6NipFHqL6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709213847; c=relaxed/simple;
	bh=jRIC3inpQYVl05aLG7u0tOU2SIStN8WcCQsGMVDW6OE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hP82uBPzW9YeXV5usVzJo6VFfedpQ90+v1J6LLeQY3ejwn9YBFePXMVe9SaTSNw1fAWgNoeSx55UVp/dXdtjfITFTu9pvZm9+uauid5NJSMW4cdLz0YIccZOYMjGK1imZhmWWUib4eSeM0C+38JDFggeXbWDc75lC8oxFilBTF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F7PLT07C; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dcc86086c9fso1021113276.3
        for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 05:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709213845; x=1709818645; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jRIC3inpQYVl05aLG7u0tOU2SIStN8WcCQsGMVDW6OE=;
        b=F7PLT07CUmWk4tyrAfO1wpH6n1+QyJLoTISpZvypmFcFhldNT9lXL5ldbg2s5xOG7V
         Prm7i+RozSXzpoGxtlScnCDCGOh/K+JDpzOkQMxK/K/WiIY88gplfgzdodXTHHZ89lvu
         SZj68SX21GntFy8YZKPbZEgrevekkjVAYa2g7CpBv0LHOj3Ni8viSKpOn+aTPBjW1qI4
         moMnk7fldk3XUrfDU08zsQSmdIkWydaEOHZH0Czy6kPIbMwr16JjuBFGNhjTGQw/iEgi
         dR/OndMhh8MvweWVYdvbOQvA/hwt7KwIanTDUnrqqIWaMY3T8Ci4YXW4IMVUYLOJ9wEy
         0lNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709213845; x=1709818645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jRIC3inpQYVl05aLG7u0tOU2SIStN8WcCQsGMVDW6OE=;
        b=JmtYgB0z3G8CHbkcwnPtpSMyJVdvAYgvXdlS9mv7fllbpubHkB+bvotzo0VEhARZ5g
         6l5StEZ+zfb2IudQBqxDWdc01VuYMx622lFcyg+n3WLK+B+CMPu+5QbALHJRV0Pax+I4
         Jg7tsh479cD5t2s9yfOL2DAscuCFzIcfxdD9exvvGbpC1yPP0JdQaH7tKWSBtTcYAlmV
         mOUga9cQG7t/+V1uzvttHdM5xL1DDF5okn6k5sghCP0ViV8rgEZipFH7MjVEigpTnUGy
         qyRpLQtbr4CCRfWXNwBLhUZMuuehEDuESDDR0Pw1cofA60iiz7EybCFCaYDSvSolHG86
         uqiA==
X-Gm-Message-State: AOJu0YyHjilJMg13KZ/BzT5gQtbxZoU7nksZe0q9LBFIG13fz/35wftP
	kNmB4dqdiBQqFJmaGK1FMk1OumppGCA3nNKeTpCH3K8Jav4YAnWY+Zkm1pRzfpHf7GNga3G+x0R
	+E5bB6x/NN7IReZI2SrHsLI0v15aKL3FHh0XjGg==
X-Google-Smtp-Source: AGHT+IEMh6s/EUM+PFmpWfZpJLi60H0JYBSs53MwWi3aRXQ1sYvHhKkVKi/rHlsRVf1EVaybg37zMg1n7n9kjEny9V8=
X-Received: by 2002:a25:8701:0:b0:dc6:c510:447a with SMTP id
 a1-20020a258701000000b00dc6c510447amr2201760ybl.58.1709213845284; Thu, 29 Feb
 2024 05:37:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240223123214.288181-1-brgl@bgdev.pl>
In-Reply-To: <20240223123214.288181-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 14:37:14 +0100
Message-ID: <CACRpkdZ3fFS9yCRkr2iO2=8ftRDs-pVdArhScY6Fse5e6SmPSQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: don't put the reference to GPIO device in pinctrl_pins_show()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, David Arcari <darcari@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2024 at 1:32=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The call to gpiod_to_gpio_device() does not increase the reference count
> of the GPIO device struct so it must not be decreased. Remove the buggy
> __free() decorator.
>
> Fixes: 524fc108b895 ("pinctrl: stop using gpiod_to_chip()")
> Reported-by: David Arcari <darcari@redhat.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patch applied for fixes!

Yours,
Linus Walleij

