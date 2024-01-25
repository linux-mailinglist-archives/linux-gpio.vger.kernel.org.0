Return-Path: <linux-gpio+bounces-2580-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 059D383C4F8
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jan 2024 15:39:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8325A2934D8
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jan 2024 14:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E189B6E2BE;
	Thu, 25 Jan 2024 14:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZQmgCNjI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4EB4F218
	for <linux-gpio@vger.kernel.org>; Thu, 25 Jan 2024 14:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706193533; cv=none; b=Pjtv3OaECkaMAfSAlavHp+FOVGpXzgmOb0MeWlovORiFF9MY6R51KR9T2+wdtixa96ichvcIJJJNHG5XgjZl6dWinuaM5XoN7WY9O9GSYXBizX5/BSbx7SX0N81FRi9KieADed39IxHqsCJAOrF/ob9XBsG79HJNValNxtWQKvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706193533; c=relaxed/simple;
	bh=gcL4ZykrvdtZDWTE2yY4JbplggfrsFuT/sM61rEdzmM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bwkIcUWobfsAn8pGnXttiQPuxecxIuwN2X4tODix9kEszYW/LlQFP8FnUjXKWa4oth7kiRbaR0EBrAAli7NFqoXAuMhzPhjGBL9HCaBwLd5CiSvtrcLVLeWieVuTXSUn6Dai0LUk5sZH2c9DV+3BxhEvpj3DUnTMn8wA8R5bH+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZQmgCNjI; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-db3a09e96daso5990965276.3
        for <linux-gpio@vger.kernel.org>; Thu, 25 Jan 2024 06:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706193531; x=1706798331; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gcL4ZykrvdtZDWTE2yY4JbplggfrsFuT/sM61rEdzmM=;
        b=ZQmgCNjItwrWkpLqu/9tkza101j5FyrFzg1D76k2VfYoO5xA1fUZnzgGqroEXdltPZ
         YhYxQqfiJJ9E7XvLtwlNZ8oX8v8TxUZomhDxoA5xzuavoxsfJxyaH8PluvwFgtQKldon
         dJ/z/2FFreit+sN0wXUKi3k/QRmlVeN/7Ihj5ukzRHAnXEzOeU2/YwLZ2jrFgWYO0XW7
         x6i4ZduKfoYKtQDhcIPL0rcszaPSwR2f92ei5Y44KEitcNz5Vj8ckfmHEPjzYQAd7g4R
         xwXWvwZbmZs9LD/folaBQDcY3ZSRZ4/CgOwmdryvcOfNoVlOUQCzhIwMTJKCwuosvpn5
         xXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706193531; x=1706798331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gcL4ZykrvdtZDWTE2yY4JbplggfrsFuT/sM61rEdzmM=;
        b=QRmSbMWml/Zcr6ib8V/9qpeEUUuw+X578i9vhCU1ZiulQaPdZpDQld5J22Bk8gaNuW
         XIVmXEOoO7n00rmuhuVuAwGSqxVoqa2nYKAKoZHcEkcucx15BDfSctoCf8x0UaA4R9l0
         IXS9/n4AdCV7VhI9DFY0tO91ztq2ifx7/EOetIYIiNBli1YLl3I8QVhRXccdwULDIdK4
         QCJxoIGMmwdgmq+uSeIkoH5wqUVF92jfpc6C8dBKMw7ghXblcJCBlMKsSqjIvjht/5HX
         Ah0xKRJeog9apJB+hLGvq25FQPj4AdFCw7KwoGGRF5mnQdv285+znfBUQwWJBT8/X7IK
         8iDA==
X-Gm-Message-State: AOJu0YwyZdpuI3vqGovU8GIw0crZvt5ny7+I1cF8s3TQRdeMF9xnUpnp
	gePU1pp+YVpLQ7mqEX8JCam9EtTybpi8aSqQK2Y/ook3pULOyxijI0sojJdQnqmwlQjZKkWzW6z
	SQzcicijdI/uwSyM8S+ScWYC2K9Vh+bcRQga39InEgD3cr8JR
X-Google-Smtp-Source: AGHT+IFEWOxAQaxmYmMzQ+eU4VlPwsEAGXj5ix940GFvBS4O5lccUY+lbStMqVk40d1DzfaU3/ZUeXkenQqLU16Cv5k=
X-Received: by 2002:a25:acd7:0:b0:dc2:4dd0:207c with SMTP id
 x23-20020a25acd7000000b00dc24dd0207cmr737847ybd.75.1706193531271; Thu, 25 Jan
 2024 06:38:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1706182805.git.u.kleine-koenig@pengutronix.de> <c57f631ef5167554a30d627320dca617cd5ef210.1706182805.git.u.kleine-koenig@pengutronix.de>
In-Reply-To: <c57f631ef5167554a30d627320dca617cd5ef210.1706182805.git.u.kleine-koenig@pengutronix.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 25 Jan 2024 15:38:39 +0100
Message-ID: <CACRpkdZ2f-3srhW6hNxBLpPPRGTGC3RWMo+TSqU1YV4A4vjh+A@mail.gmail.com>
Subject: Re: [PATCH v5 103/111] gpio: mvebu: Make use of devm_pwmchip_alloc() function
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-pwm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 1:11=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> This prepares the pwm sub-driver to further changes of the pwm core
> outlined in the commit introducing devm_pwmchip_alloc(). There is no
> intended semantical change and the driver should behave as before.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

