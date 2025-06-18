Return-Path: <linux-gpio+bounces-21765-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C236ADECB4
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 14:39:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB551403966
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 12:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 819642E92AD;
	Wed, 18 Jun 2025 12:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LLCARptI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7352D2E54D2
	for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 12:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750249984; cv=none; b=Ro+b9G511/KnCZwoKVZOdeOSoebeWmkQ9a3QIElrPclzRDX+47AZkxJSOIO3MNfP0PAec65mlHxHGLJNUyxmvfhy0sLn6qFGOBZ4QqFvvJ6dzeMMLs/8asFi5r5K+1x9GrgWQ47Vr8fJhnzM44/qBZQAose+P9g6MAfr0eapKi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750249984; c=relaxed/simple;
	bh=er9GV70+n6drdF5uljPxPj0kVCu/2tf7ro4DCkzk2hA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bTt2Yr+fJiTr73f9eUr0ZH8JKQDk0yHUUVqra5pweUmVV8KiVZ+Hut5lfQZsFj3jRbAg4pv2Zh7YSwp3PRyNQ7YDRj24I0D7FbcIIPABYS5u8oJrOVERR5EHTDiWjOACQcnfgpvoREFXu1xPwpZiAzJw1Y6FxU+0mq0k24N8fd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LLCARptI; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553b584ac96so5324884e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 05:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750249981; x=1750854781; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=er9GV70+n6drdF5uljPxPj0kVCu/2tf7ro4DCkzk2hA=;
        b=LLCARptIersXCToPoA6P9kUhFEBGRn/tLy5hR9gXwal/nj3Ij6YoUjCxIBQR/nXq6k
         Rh4ANHZCGShUxlpm39HznVrnsUaIOU8bcQf/7rn80t4XEMHMEDaZqwvcW1/De8t+EjYp
         RoBTtz0zIh4rfChR7boxvQOcmMdVuaPOFVp5O0I4ZacwrdIyyDp3FPM4LsW9I7yk2yU4
         9OsP0EoUgGy2suC+lNTqx9qc5D4et1lYi45TpjYJfFm71lOmrYw5WdR9RnS9Jr7O9naO
         cuc6U7fO6sXu8NO7aJ78bhow/X6OblyEtEkJlp4IgOpMKnpuz8JUtmQQ8h3YeIGjxupp
         9jZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750249981; x=1750854781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=er9GV70+n6drdF5uljPxPj0kVCu/2tf7ro4DCkzk2hA=;
        b=W0xKudstbRdKEKt+17IcUotepTO+xvszXeIwHWwAqg0HfhnuuDJqtRSKEDjSb1yMjs
         4Yu9jqlUuD+UOlLuAlOAdiRaZI2mdHTgjLkBPRINKzwr2hqVDVBwZvjBFa5Qgv2/bGn+
         lzOAHjLA5eUqze2w6mRYHEza9bnkK6i0BQ9azQiK/D5au4VrbDRMvJcGeLll+wFUO6+z
         HufkFkxZanSc1F48XRYyB6Nj+McUUM440ktSH3puXTWTPou/hTZpHv6UDG6Qz917F7ZH
         YPsE4VZp7WbZ0vE2Fm16XLadO4szBfnjHjmAVh5FngT36zRTPpOTYOqGdWrhUgprLz7p
         G9Yw==
X-Forwarded-Encrypted: i=1; AJvYcCWXaLeOee8GX6ukD9sM5R0Zv6slaai6sYgaCnxHBksT7no+y5KcGs3huaOradlcOZfGRB2tzrmEp6w9@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6ZWLOFHqZh0cpiMLwdc4NST4Yel7oC/qYLAyGsiMbNNaMVw/w
	vrTxcpoUJJicOBaRK6h6I4xalbAxjZx490euZL5tmcXPuTEooLP8+awdXuMvq61KEc9RhCeirDD
	SLIO9diyqFgv57lYfEAprXrJrDajSMN6/HOQ1qO5kiw==
X-Gm-Gg: ASbGnct8xiCbMiWxGwUXkEQBlbr82Srt9tBWyv388/GqWgJVSjdEWYkCP0XgsW9U5UD
	R7hHpzsZBGnNLhS52PwWx/tyFMX8O2+lzRV8tUlMfI9CdRf9YyCEYpOLf8euuLTNZoFyqeb6JhB
	1VTEmWYF0DJJxUL5/xKgxojk4M1qf64CIVM2z0m1ni2LU=
X-Google-Smtp-Source: AGHT+IHq8x+MK2Q+KzO0wn+EOPqwTKlQ89Mryv/yfukFFFcWkFHUwXTR4wa+yfRd5KaBrFwNGubCyPjw0k/OwXSOfLY=
X-Received: by 2002:a05:6512:3055:b0:549:8b24:989d with SMTP id
 2adb3069b0e04-553b6da8081mr4547256e87.0.1750249980579; Wed, 18 Jun 2025
 05:33:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org> <20250617-gpiochip-set-rv-gpio-v1-4-903703881fa2@linaro.org>
In-Reply-To: <20250617-gpiochip-set-rv-gpio-v1-4-903703881fa2@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 14:32:49 +0200
X-Gm-Features: AX0GCFsjhUtynB_l1wpCuP4ZMWcDzuGMXSliazPojtQjqWcgC-p_VmDP2UNLCdM
Message-ID: <CACRpkdZPPh4zjL2+2e1_2nsU13TyyDCcAhOok2cF4PGwnqA5pw@mail.gmail.com>
Subject: Re: [PATCH 04/12] gpio: pl061: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andy@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 2:24=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

