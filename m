Return-Path: <linux-gpio+bounces-8768-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AFB95462A
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Aug 2024 11:50:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97D48284C85
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Aug 2024 09:50:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25BD616FF27;
	Fri, 16 Aug 2024 09:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="H1yE1vXE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702BF16F27C
	for <linux-gpio@vger.kernel.org>; Fri, 16 Aug 2024 09:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723801811; cv=none; b=FSS4YFf5600Rk8aczS37MXBPlH7jEovE/c3RyCtjPMp9Qj4hQEA1RtOptGpXsBW1U3RhC7pj6EPHKiF0QoUq85KTEYTvel2mvyfVuXuRlZSoQ+QD/oUn4BlRmoevpJposfMGCBwHo5/0ltFVR65j1IIrMvydxjBZhtmsvKDdUlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723801811; c=relaxed/simple;
	bh=CHQ+NPmQVZFS37omHyDmVEDa/txR3YEvhn3ONo2BXDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=inOt1ixrB0KDvaimjZf/V1NGnrt3DoQ5ZmXPqRRDthgGWyuLEL5c97+nAKIZE/E8hV8+PLd5NXnc4iZCd/HhKlRuj6hn/ILt38ywUKgUA0Ol+eBgNwl9TdzFlu/JKS+CyCli9rONke+/bUrLvf9QIwL3ElDcqRnoCXmQ7jguF6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=H1yE1vXE; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-530e062217eso2367513e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 16 Aug 2024 02:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723801808; x=1724406608; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CHQ+NPmQVZFS37omHyDmVEDa/txR3YEvhn3ONo2BXDc=;
        b=H1yE1vXEE/mpxgeq2WIZdtPfiv0PvfNyc5hB1d8he2C4te0OOkgRcd+hCgj31HfWSz
         oYg5fPaT+h/tL33eteuOTQz+QTos9/NaQPVI2rCaAjYks+9U597boWTwWvRkz3/3xwz6
         a+efmoPUPF5yAXf/6nNOft8dVQ0eXXuee8h2/uH7Vh10WKSpnfACCKOnxZ6uXddlkTwJ
         Bf4VlBdoh6uRQ+ceqcEclNbGTxqXWgLzJ5YFBYZAHSVftOkj6EHJMWP1XkF/2OJKsP5N
         2hexUeNr1UXvA80ZJGAhw4j5BokJDKLFhMk+aY0CyzooJzZt7dIRXF5s78xMeQKvK9E9
         bKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723801808; x=1724406608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CHQ+NPmQVZFS37omHyDmVEDa/txR3YEvhn3ONo2BXDc=;
        b=h3TIQPmwKGLf4dWgsm+Vo0p1zGkmAmuaHAzS2a9QFZDilznPu2/Kz75NLRbprMj9XZ
         C3XCTgIQ1dXzbA32/POtTWm85TVznqoppWy6Wq4DopVK5SGJj5My2bOOnQBtNImKmr4b
         8GhMsNsGSrUoEJ2w7k9Plcx8gSusr+/EJWV9i0497xf7No8weAUxkH+/p/c5sUgIASJ8
         m9ngvnb3Edz/Y3EPkS0uDqH3fGEft7QjOFCnlvMb7wfOSBdk2qfRhhjkQJc3Tj1h23cu
         RV0Rwq0G52n6nXZyf6t30UzA8sm5zItNrR4JId6Pooqo8v6dCCVvpdG106cFn1T67Ph7
         ZRoA==
X-Forwarded-Encrypted: i=1; AJvYcCWgMDqvrfzmzG3hdQYYUGgyhr/rNj8maQ6U5Xw87FP9dAyB+YeXtJfbCQsJy4f0XdorHnsa2+et2VNwTodcS7BWaJdaDwTOrPwxSg==
X-Gm-Message-State: AOJu0YywYguna6DpGwY/tqVfTjVbCCpMu7ze9rITOJhTA+NfwyGl+i52
	zbhElasad7Xu9M9k+DCQ9dZ5WX54KdbOaFKqteGv94YQ21CVyaW6zNbQsPo4zMSOtnyZOmFEPTO
	zvrCACzJk3j0fEWSTGECQFJqh6gBRTeVcF/73XQ==
X-Google-Smtp-Source: AGHT+IFNH5mDJnOyEqPzpQTAY1AoSCSs72K9GQZ9BwCbH2cPCtVdHDWdIpfPEJBIGm2rXuUmgdKzj52MPIsWb6Io7f8=
X-Received: by 2002:a05:6512:1150:b0:52f:cd03:a850 with SMTP id
 2adb3069b0e04-5331c6b0a4dmr1426019e87.32.1723801807810; Fri, 16 Aug 2024
 02:50:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815071651.3645949-1-ye.zhang@rock-chips.com> <20240815071651.3645949-3-ye.zhang@rock-chips.com>
In-Reply-To: <20240815071651.3645949-3-ye.zhang@rock-chips.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 16 Aug 2024 11:49:57 +0200
Message-ID: <CAMRc=Me8OB6auZa0xrs3gBmGQb=UAeCDgczz_t2GLECW7xGQAQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] gpio: rockchip: support GPIO_TYPE_V2_2
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: linus.walleij@linaro.org, heiko@sntech.de, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, tao.huang@rock-chips.com, 
	finley.xiao@rock-chips.com, tim.chen@rock-chips.com, 
	elaine.zhang@rock-chips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2024 at 9:17=E2=80=AFAM Ye Zhang <ye.zhang@rock-chips.com> =
wrote:
>
> Support GPIO_TYPE_V2_2
>

I don't know what GPIO_TYPE_V2_2 is. Please explain in detail what
you're doing here.

Bart

