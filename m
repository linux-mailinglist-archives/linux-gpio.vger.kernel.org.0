Return-Path: <linux-gpio+bounces-7483-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B956090A870
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 10:32:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D62C81C20FCD
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 08:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC54190466;
	Mon, 17 Jun 2024 08:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="grK87cQe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FE117F5
	for <linux-gpio@vger.kernel.org>; Mon, 17 Jun 2024 08:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718613138; cv=none; b=MvEP7tADRDSIRkhPqp3+Apq7YuIKXXuKsEfjyQXPpuKG0s5JteshC39D6DH8mN24lMEtt8FQkTAg5vAY9qxIknjwrD4lnyl4YZuoMu72BbANAYywUql7tXvT6Nn1lFBSeGYh4Jv8Ul1+kIMR5wUcSo6Tmz0IxOJ9EDBHoxdIN2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718613138; c=relaxed/simple;
	bh=FE3iEKlKCJMVD0D4H2XPGzG/BmtORvHVK64W6Si+9nQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HpF5lq2JClHA6SL4HLARTLM0kv9CGfISvk6k2B174xRK3PWZv8lkWT9uB3PdHwJLj++l3GYHo+MHzle4RVxR1xbpxghdnQw1DpxmVv0xf8x3ZXeK58EQuhnXWb0eJyAOTy34zFI+styjFNL+Wz44TjfKQs4pL6k9DLNz4/8T0ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=grK87cQe; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52c7f7fdd24so5262432e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 17 Jun 2024 01:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718613135; x=1719217935; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FE3iEKlKCJMVD0D4H2XPGzG/BmtORvHVK64W6Si+9nQ=;
        b=grK87cQeKpfsLVcKCca1WDRZfiAillk3uGlqF4TBka8ly7gyrrLwYHQmjgIIuQn6Vo
         /bNFKb+oq5H0mj+nd8rP+klbi6RiBJ26w4J6nXM6GCMLvEawuBgRZatOuj7ZUdJwIVlr
         EaNeTHe/JH0TeA4TaQJvNgxTpLEox8vUNMQbm97vhscZAoqy3C5p6Fen+PVgJeULr6Na
         m2pU1l6B/CczzRN+D8a9tZ1kw+y6iMxMwIG0MqsljWG3wDXK+Gv6HKuyfYR2zQLFvdQD
         mDkkyTiTdcJn+Xxi3+/UPRCoKW2+wFcBWnbNDhExAhNrgxYXyfXCKt18vdrUFUG2Csol
         2CXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718613135; x=1719217935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FE3iEKlKCJMVD0D4H2XPGzG/BmtORvHVK64W6Si+9nQ=;
        b=Z462dq+hHu3apeCvZ6Kt/4xZDfo6SARdkaz3SKy42XuNfNy8uOGPppVgT0yBTpEJ34
         FSeXAjvzRHQMkOI4Avpu4XnIvGCzwYo8IoiHEkhdMAMvGkq/HE4pCNB3/IsVUjLsrXB2
         rxQ9pwbUdHTOOBOEzrc4UDGG+I8jjxznLIKTq1Eq/3YyAzxUuScnxhnO1J0q37Y8jKlK
         132F4ApAUIPFWQHSx2Zyy6udJ5ght6EsrszvGlSu8T8sfA9UFMm+jdF1gkDAPUykCU05
         OvTawLInsST3sJU1GqWpABuxmH9JHZ0LgNY1X/aFf7sVuWXiMyy9DZ6vdVa/QjUbYnJ1
         ilfg==
X-Gm-Message-State: AOJu0Yzrf+VMOip4uNJAlBpC2W1nDuNYRqXaN7pn9JshQhtynq3sYfaL
	2zB87uLYED7YChBqprK9Tk8MuOpLZGdwysVeFgzAUPyFe/sY6+Aft5kW0pYNf4NyBxECfWTn2xp
	35Nml7Hbz5iYGnp+16KhQhLOKLgo6pLThuICq0Q==
X-Google-Smtp-Source: AGHT+IHsGlzkH4ixE2I4yC9Apel6pNGxFLAlaESfH/KyLi3NbHz3v9EPdEBe+o05FhL2D2zPDZO2on8osUVs7OTikn4=
X-Received: by 2002:a05:6512:104c:b0:52c:818c:13b8 with SMTP id
 2adb3069b0e04-52ca6e55abemr7654865e87.4.1718613134835; Mon, 17 Jun 2024
 01:32:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <3f6fc17e-2ab4-43f2-b166-2393a369a263@web.de>
In-Reply-To: <3f6fc17e-2ab4-43f2-b166-2393a369a263@web.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 17 Jun 2024 10:32:03 +0200
Message-ID: <CACRpkdanLmWrDD6AdzJJx3fJsQWTE64vh+MjOtDTkpzwqqPkuQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: pistachio: Use scope-based resource management
 in pistachio_gpio_register()
To: Markus Elfring <Markus.Elfring@web.de>, Jonathan Cameron <jic23@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 5, 2024 at 6:02=E2=80=AFPM Markus Elfring <Markus.Elfring@web.d=
e> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 5 Jun 2024 17:46:52 +0200
>
> Scope-based resource management became supported also for another
> programming interface by contributions of Jonathan Cameron on 2024-02-17.
> See also the commit 59ed5e2d505bf5f9b4af64d0021cd0c96aec1f7c ("device
> property: Add cleanup.h based fwnode_handle_put() scope based cleanup.").
>
> * Thus use the attribute =E2=80=9C__free(fwnode_handle)=E2=80=9D.
>
> * Reduce the scope for the local variable =E2=80=9Cchild=E2=80=9D.
>
> * Omit explicit fwnode_handle_put() calls accordingly.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Looks reasonable but I'd like Jonathan's and Andy's review tags on this.

Yours,
Linus Walleij

