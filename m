Return-Path: <linux-gpio+bounces-2830-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2558E844836
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 20:43:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D57F628EDCE
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 19:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDA853FB0D;
	Wed, 31 Jan 2024 19:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LIcyY7Z4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50533EA72
	for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 19:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706730188; cv=none; b=kQfH/vJ0Ttu8vl20v+zKOe+scprXbQm7yV8669gd0b3DKmLfMzdA8gI525r4OaTM3giSB2Sq+5etDNGMSKQZVyF7jEd2yz+JYIr2Nt59M15hGVAYP3jiGVb6/J89slEpMuAwKTJGp1/LPQlVO1Zw+OapM6SG0Jh/b+R+j1t74UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706730188; c=relaxed/simple;
	bh=5LurfDzDMlU/+e4WHlA9quWo6BsFXeuGeJjyZPZVAOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CzmFIf1roj8qRvgeVJ08PryjdmolbzHaFxk4AJPJiQ9E7PoHPrK7maceSe+LnCdbdLB37UWycDiBBUDBgr9+rvUMxR66am4Jl3PkZEkVjJ+VwbvdJ9ohMXIUmF+p9138+wp+Z3EW/NaTabNTxHsdGmL8Vss27z0YuStW57d0DQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LIcyY7Z4; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6002317a427so1194047b3.2
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 11:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706730184; x=1707334984; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5LurfDzDMlU/+e4WHlA9quWo6BsFXeuGeJjyZPZVAOA=;
        b=LIcyY7Z4JAonoXYcKTcEcdwcvTlh8lJffcT+NJs9VnuJiK8WaVRkDYji7C1SmHz1Dl
         SJOgCGV3kZDTBHsCMLYBanv63QrXIK6tNsIy15Dbae8K0baedqcGRI4G8v/NLh7qtWKk
         pN8vDLsRqC7lMjscShrbTTpUxVrdSpzjj7i0VxXsnIMzJ8vpHZ30J+uFlDv6blmMY70N
         Dznc8f05/WvYZc7DrBRFCqi5aQzi/JnC4kdd32jWPEW2bj4dTrvVsVP0UiSoy4jI3VUz
         RIuc88yiiYcT/VNI71y8OnavUl63P1PFPxKHty0wrbQtkyTsGFfUvYvKOgXH2bZ7vfxR
         RmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706730184; x=1707334984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5LurfDzDMlU/+e4WHlA9quWo6BsFXeuGeJjyZPZVAOA=;
        b=WE+9JQZPryesByFMlBlMIKDGZBwaN1wKHLhXpT6AG/5kg48jNyNsGaBBtI3AnV2S+L
         GeWyuE1ZrQImFWiPZEns4AdyofQ/mvuvOLTx92rNI35wL4nP/+Q2VGWkdTq6q+Rfh6tO
         xANuWSueemhXPkMCblBlntKoqr3uKVmYl0TZZF8yWiifm4O02fD6TT8iZuvNXrcEqMbn
         e/CD3iKJ2EXMUO1+6E+KioZP2bc7Qy1DYwuQpynMGUHO851BKTm5IYHOmEDKtetjPNNu
         c9ZSr4jb36SaGJjzfHxVmd1zezTPFhDVoCNuKrw7Zd7DH6ub3GDTDloB/d7U235pFK1O
         AlgQ==
X-Gm-Message-State: AOJu0YzUiWpWEiTXfMRaiHxiKrC0zxt4ATVe9BWEQaC+vpiruZd3ytZK
	/0FBLhwQ5dWokk7YS7NXS3itNWbHW2Ipw/loxrvfle0Esgc5ULVv5cKJEZHtZV8XKjvfAde4erp
	Y1BUJIz0dbCBWUNPJTd6F5XpUmeDIhhTJvEvDSg==
X-Google-Smtp-Source: AGHT+IFNchrTJN/laRoFT/serLUkj7SLPdu4ZsP2h1VQRwyjVfP96PoaTsrUDUW7Vv3PJ2nUnCiNh4c8poZyV3/bdYY=
X-Received: by 2002:a81:9103:0:b0:5ff:4b02:73b9 with SMTP id
 i3-20020a819103000000b005ff4b0273b9mr2679922ywg.21.1706730184634; Wed, 31 Jan
 2024 11:43:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130124828.14678-1-brgl@bgdev.pl> <20240130124828.14678-9-brgl@bgdev.pl>
In-Reply-To: <20240130124828.14678-9-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Jan 2024 20:42:53 +0100
Message-ID: <CACRpkdah4My-nArTpnhV3sovT9SaUZJjrMaXmm67MFfrhcW6qQ@mail.gmail.com>
Subject: Re: [PATCH 08/22] gpio: sysfs: use gpio_device_find() to iterate over
 existing devices
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
> With the list of GPIO devices now protected with SRCU we can use
> gpio_device_find() to traverse it from sysfs.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This is beautiful. And you can make the list private too.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

