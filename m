Return-Path: <linux-gpio+bounces-24399-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B005B26F8F
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Aug 2025 21:14:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2BBE600622
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Aug 2025 19:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C68F623957D;
	Thu, 14 Aug 2025 19:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Sle4eZc+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414371E7660;
	Thu, 14 Aug 2025 19:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755198876; cv=none; b=hzUakHB9B8vK7ZykFxn5fFFxzX3Bm8sW+zC8gGhjSujUMa3QTnUQEmaR9NF1fqRV8rCbtlQYgT1ViPrLjjnKprCdJ02vM5qRdt9pBnpAgNADPCB0Z6OMj5vAl520MkULYwOI4BbT6xtItfZhO2QHrJM2NQ05UosKaIeN2vK4zBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755198876; c=relaxed/simple;
	bh=MynYzWSWBWqEUHcEBQjDGSL1KC3nkyCQHmVsRTqpkgk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FmB3oQj7xKAX1+q5BAOWSR6YBD4NX03GgP4ld8GCzOqXYUYVQkuKlEweMn3ovk3yQm9lWyEfkrAhSG7VNb9bqBRAY1rBZE39Iogu0JUs0RuT3xRvHxgOXuQIt4dhhLNv3nD2b3GdNHPVR30BZvDXQLtJ+tpNyRGlzzHJbWsF10A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=Sle4eZc+; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-24458317464so14789855ad.3;
        Thu, 14 Aug 2025 12:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1755198874; x=1755803674; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MynYzWSWBWqEUHcEBQjDGSL1KC3nkyCQHmVsRTqpkgk=;
        b=Sle4eZc+sTl/mX+ZoV8/gPqIyAUeL1Al2owt7F/oq3wznc8+GR/aw7Ei6wOnvN9oef
         WiP+Taljsgd9sFnKyFVYizBNwlXenGB6kpwt07bp8PO3lFlOSjb7ILBPykQZxTxCYG0h
         d+Kvz8fD1C+OjB7EaindarMqyHuL5e2el27EwbJBkA/uw2cDhKLw2O6BayhUhbahAzRi
         lERB87qewLpNoA1+j4ZL+qLH7r16Sbeb0SOfCeVlvt9eY4x1icGabnH2/CK1XoAR38wb
         SBZsnpFB4sc1RPFCW6OcAEjt+SbcxJdZUaTa8RVONEJ2gX/j3wmUGkh8ZVpUtRK+H4iL
         VlNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755198874; x=1755803674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MynYzWSWBWqEUHcEBQjDGSL1KC3nkyCQHmVsRTqpkgk=;
        b=qg4jxX4EGZBcmxGVk5CzQk+UaUVlsSQH+8zVjY1NLxLrbX/cFUg4zt0ejOvhuITC6u
         n6yiM+HO6BhvLJE76bvLOdO4h1csMTXwY3osbcfPN59YkKHdUra4l2pWPBCQ6DRdp/0k
         iNNbN2k7W7+DKQTzNmSgZtWg1/s1ha7qKC21JR9iO6EizlpgEVjy1PJ2mTn5pHlVIlOE
         3bsM0+j8tlTmoGdv30oKYfAg5fp/DgNVRFEd7Uz0XOYNAHuYx1iuVC9g7C5i7nanc6Mh
         FznxREga5aYRoDDXKU6cWZvyw2i67rvkfmUqrrZnl74Wnp7Dd88JlJBYrOGo0dGiiddR
         META==
X-Forwarded-Encrypted: i=1; AJvYcCX309OtFYKln/bxbIoh6NriicdKdQNsx/eYU+kfq8MS2MC4+onGL1rkUNe8wKC/qH5xDIEf3BxnF2G9@vger.kernel.org, AJvYcCXaFkELrzD3t4wKN5heTtlev9J8Gsyh6X7i/NqVZM3Pzkr0abhvCgIjr/fLiazSRrObL82odotKzNcCsYqq@vger.kernel.org
X-Gm-Message-State: AOJu0YxmlxlkcOdMuMHYLHiVKQPShZg5Qe2nLJd8sjs923jGgIshijAy
	Dc+GgoKftdUkdXfkUxk8gfoFcz5KeIBx0G29nQYd39GfdPcIAYBPteO5A//A9n9hN+7//Dj1NRQ
	lOadYahY2Xq2s8k5cUCn1n4kU4E89jeE=
X-Gm-Gg: ASbGncs7ZA9K23NKQzRUcm775bN2rsU9crE2pl6mKWCyqUR+p+EfMBq7HFWXnF+7xHo
	pRMp1lQfPwW3/+L16K8yD6EKU4k72b2hDQ67cT0lXMDVSEjlcjwFSNgQCz+pN+8x3b3PyBXPFOp
	OduSnvo1NF11lPn1VRh8JdJ4F6024LJorZ1HQXz91aybfvPu2XeTh90LQNu7RZ/dg7CLVmHk4qs
	CLA5GBBesrDwVyOkLSL1qFkHGAvS5ocUYyXUou1
X-Google-Smtp-Source: AGHT+IEl//8qkytmSUYBnvYyuackNdjxZ2mG5UEdWxd9HJ7XZI6KUYhtofURa9ECsi60YB2ptnDNUZCTERVVEGpyGIY=
X-Received: by 2002:a17:903:2d2:b0:240:640a:c560 with SMTP id
 d9443c01a7336-244584fe05emr72033805ad.24.1755198874484; Thu, 14 Aug 2025
 12:14:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250814181236.1956731-1-da@libre.computer>
In-Reply-To: <20250814181236.1956731-1-da@libre.computer>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 14 Aug 2025 21:14:23 +0200
X-Gm-Features: Ac12FXyB0zZLw1V5fvwOol8H_DWAY1Jzv9fmSEHz6sR2a-0EHmkZWmdJokkx7Zw
Message-ID: <CAFBinCCqdhdDGw+e=NQiLz3iSKb+nec4h7m1n+2Cg7TPQ0-3aw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson-g12a: add GPIOC_7 pcie_clkreqn pinmux
To: Da Xue <da@libre.computer>
Cc: Linus Walleij <linus.walleij@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2025 at 8:12=E2=80=AFPM Da Xue <da@libre.computer> wrote:
>
> Amlogic G12 exposes PCIe clock request signal on GPIOC_7 pinmux func 1
>
> Add the relevant pinmux and pin groups
>
> Signed-off-by: Da Xue <da@libre.computer>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

