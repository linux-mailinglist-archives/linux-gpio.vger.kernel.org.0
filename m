Return-Path: <linux-gpio+bounces-2837-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C2984487A
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 21:11:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3B5F286D6E
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 20:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01D323F8F6;
	Wed, 31 Jan 2024 20:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DtJdp/nT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D853FB06
	for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 20:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706731878; cv=none; b=qEPHCVmlU+/47Fxggs8S1I+O1Ig1PMJjUqd3abdrx06YrjvZGmyOVJTP8xa5j1rfGnKHkkgozcpBmKfLFKSHGXeeX3tE0FdSdWF3JeZhvyNmSErPmjC7NzE/qG5q+GhSmd1PMqH0drC/JYD/LDNPB518mZuLjfn1sR3pVf0kgSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706731878; c=relaxed/simple;
	bh=/b/NKHSbr4H40q91xyzcHQnmbICJ5Wr3INyLptwHt4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fS4OzjIjPC/yDzck8T9XU2V3JggMX7nKz9RKzcbtZDRBChUthf+yZapIzmTmZH31F5sTiOZJlQQvygUZm/dA28DxR1AvYPhDpkuDsgTjLEwsqwuovJzVz/xuq/tYCPuXaK7ZekzOiRG0fLwzX+KII9gu/lNisXivJP9zCYGc4kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DtJdp/nT; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-60412a23225so1587777b3.2
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 12:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706731876; x=1707336676; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/b/NKHSbr4H40q91xyzcHQnmbICJ5Wr3INyLptwHt4Y=;
        b=DtJdp/nT5x+1WmTyIPpDAehld9BUlhpUGUezP4/+n9Y87KfEWKRp2+g8paIUfvYY/J
         fYjYEqnT/LxXIqW5JutFrUwuXt6LKDYfUHkuWnyviyOXuGKsh4q5nII8AWtajZBTqH8P
         +hkvxBkOv+o79y+CHW77TjWSJuD+bit8gMm4jJdwfTUuvWdjmnlYufSlXsUQIJbJfvzv
         CtGYeFWJWW9YjLORrzSE+sCV5yZitpWDvMXgxKJp2W8ieyasb5YZDVj59Djl4XlQKbCx
         Zq45PEm/MPcNHbUR04MdhK7BPmp5qwVtydQcZhjXQ0SWpK5dZEVCJpRpMZy3OGJHRyMM
         hGVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706731876; x=1707336676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/b/NKHSbr4H40q91xyzcHQnmbICJ5Wr3INyLptwHt4Y=;
        b=UIwrr+168emPCLZrndPsW48Ew0R6duhRRwp8Zs8acGU2jwJUaSRemK1LyQOusr90gN
         fhJ3cqzmKIyzoMfgg/yFyLu+bIbAv2T2wphy3dVBBBA4XjBxIH2GS7JGEdZwj4/sUCOg
         cNqxGn2ukQlWosTUm/8Ri73y0lwNURO2WofRIk6Q9WK3fKHSmtBUv9QFjR8YxH66EBEH
         GUIo+p/mLE0/6AvRQiVfvl8IDlN+U005m+z8IKuCrM797Ih72GJD3aiApKToVw3kwlCi
         6dcS55EFmJZLJLDjPeZc5fblaboXtVbZKMUnR87ssHRp8vlUwmOgCBq4v36BuUaW5xAX
         cEqw==
X-Gm-Message-State: AOJu0Yx/IGtZ80aebOcDzxS03OWThmTjyNSgr+a9Is/7suegsRsPB/LB
	9rFPdRugdEYOA2VU9AisWsuikmoMoggTgTjrnSoNkNQLbOkm9mt+gkbmcy/AeS+QQIVPsQhvRK2
	BZ5fx5jzEh4lkLHA7ZRioHou8UfXBo5HFHyFXMA==
X-Google-Smtp-Source: AGHT+IGlLPsNkAE9oxlj0N5QziDEbu5s/nVkNIBthD8+lhdUeAbPhSuhGDNpaXffCrXCBRGODkeRy7Ntii59QEFlOyE=
X-Received: by 2002:a81:8b43:0:b0:603:fdc7:2f93 with SMTP id
 e3-20020a818b43000000b00603fdc72f93mr2408936ywk.33.1706731876222; Wed, 31 Jan
 2024 12:11:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130124828.14678-1-brgl@bgdev.pl> <20240130124828.14678-16-brgl@bgdev.pl>
In-Reply-To: <20240130124828.14678-16-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Jan 2024 21:11:05 +0100
Message-ID: <CACRpkdaTeMvGqEY_9GYUq43js4rghAQGUV3PTwYtLuw5JQGAkg@mail.gmail.com>
Subject: Re: [PATCH 15/22] gpio: cdev: don't access gdev->chip if it's not needed
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
> The variable holding the number of GPIO lines is duplicated in GPIO
> device so read it instead of unnecessarily dereferencing the chip
> pointer.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

