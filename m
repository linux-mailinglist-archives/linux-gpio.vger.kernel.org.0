Return-Path: <linux-gpio+bounces-1970-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EDA822494
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jan 2024 23:13:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DF561C22B48
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jan 2024 22:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CA03168DC;
	Tue,  2 Jan 2024 22:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HsilkCjj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2ED171B6
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jan 2024 22:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5edbcdc323dso53492907b3.3
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jan 2024 14:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704233578; x=1704838378; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UGUJijc4OnYyIel7J37KEqrTE1jlQtmqCqdxc5ZaayQ=;
        b=HsilkCjj24/HE77B6kTgN6uROOSOGzxYdIcPPESg82BkeLzb8h+QXhqf0wnKXJYQ78
         MpTKdcexihC70+CRpZjUrNM/wOvA+VO4Ee9LxR+iUEENR8cDCqvSFoyYrGxzF+ZPzlN+
         r+NyQzTPBEM6U9LjXAZKK2jSaw4hLaiiH0+dRYMZ7CNhDUPRGHxgIZAFho1lppSTNb0C
         ROUULkq3g8Ie4pB4dHTl6ltNFvgNhAQ095YJ3E7hTsv/KqX5jkyfJKAnpzwgURtTMkl1
         2oAanYqhP9GpGXo6FmK9mibEuBKehARNX1rGiZ5pl4d++ylyIuwzIaCD/Lp81xo7iou/
         3Ysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704233578; x=1704838378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UGUJijc4OnYyIel7J37KEqrTE1jlQtmqCqdxc5ZaayQ=;
        b=RozxVzNPndRivwXAYmWy+E3a7geU5gzSE4T1ScOzPMIDv2yNJSMJRPbhDqEK0EoUm+
         G9m6yxwstQdg7Zs6+818DVtIkTAC0Ff7EWTyqCUdguDig4nuMtDeqYzDEFgqFN6uPAvl
         mvFe+4pVjC6AeAwwFAWBmKQ/5i5C1oVgmGgbI52xkjzyihFgjPI492DKkrtBPpl2Yf8S
         K/pxkbuumRbGVGMUc08sw9HAk1upMrO3Wcat0p/oaWzQyTEXISH6dnawfVUUKNURXau6
         VYL5E884am60oQEo65gBUTImgePG2vL3urFNh+7XfD0qUMXmFTkYFzPOAE9QHBw9CznX
         0zXw==
X-Gm-Message-State: AOJu0YyxDX3n6XLpgxvAQGZ8EAX7bi++SI3uHVCUaSSBUuqTY53hIIkx
	qACFvf/hzSVUB0iAP3fCO1y4p/e8rJgZNWr18i1OS0BEvlZJtg==
X-Google-Smtp-Source: AGHT+IE0xJZcg3E/ZTqtVst25+xM6cxuIjy2yKCWB3vdCkHEi2RBGv/FY3KBQnb54tf6I1Rn04uiu/lUVOVp+Gc9dWY=
X-Received: by 2002:a0d:da46:0:b0:5e7:8d32:dbd5 with SMTP id
 c67-20020a0dda46000000b005e78d32dbd5mr14305900ywe.41.1704233578063; Tue, 02
 Jan 2024 14:12:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102155949.73434-1-brgl@bgdev.pl> <20240102155949.73434-3-brgl@bgdev.pl>
In-Reply-To: <20240102155949.73434-3-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 2 Jan 2024 23:12:47 +0100
Message-ID: <CACRpkdZ6ZUp79OqtWKSR9teqRcrpX6DwmsDmRsh2yxFaX5mTZQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] gpiolib: replace the GPIO device mutex with a
 read-write semaphore
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 2, 2024 at 4:59=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> There are only two spots where we modify (add to or remove objects from)
> the GPIO device list. Readers should be able to access it concurrently.
> Replace the mutex with a read-write semaphore and adjust the locking
> operations accordingly.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Looks correct to me.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

