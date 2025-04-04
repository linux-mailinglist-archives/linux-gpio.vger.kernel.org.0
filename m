Return-Path: <linux-gpio+bounces-18234-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD0DA7B98C
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Apr 2025 11:04:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 617147A2526
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Apr 2025 09:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 143281ACED9;
	Fri,  4 Apr 2025 09:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pO89RT65"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38401ACEA5
	for <linux-gpio@vger.kernel.org>; Fri,  4 Apr 2025 09:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743757377; cv=none; b=H0FE+B6+GCFwOcoGeSWFSYSe1iK/pMXRJqkUr9QAiHml91VxEDCSJBDtzP0SAH1g+S9+9Ex+u+Fuh8eP2yzOQwsT4u1XCqZf9WY2TRWTZ/Fx3cR2Aot/f1qXCdQhQaojKWHZpirD+oyLP/gREpFlcbJZWcKCxVgHcC9M923PSZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743757377; c=relaxed/simple;
	bh=Odehsj2BM8XDwHtXWOi49nNg3uGWv5LoB0mRa3iuQTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iMkU0oNRlehg7D6UWC5Rt2ZA55fJgEcQGFUatv0y21Nf+QI3EVoAsUUDrBUzkblXfJ7JEqR4QhvQ3yh9sgE4+4Lt+ueTL/MsziKhsWkfgiPCLrhJdFvJxBzOnlBhWxrugt7o8FqduCKWeBcb382DrwZ81IfRfSxorLv0mVWfr6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pO89RT65; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30ddad694c1so19002541fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 04 Apr 2025 02:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743757374; x=1744362174; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AT0sYEXJkvVX4YpBmzj2OY2C1bjsMKeplWHZpo7aDCU=;
        b=pO89RT65tuUfGbKp88qFmapTtoQyH0zXgJeN1xxPXckoxqMXPZGby54DJOiqY+Bd+6
         X0Tz89Cqow0Pb4q+iMlY7Uo/nqKYs6g1lgdQdThcG2EB33pLbSgG/xiRAGNBAqXO2oMA
         XNVCqbi2m/bVTqbOQSSiN6GxPoBXIolVwsdT9VIpVkBXI0LDxxRduQLabS0ty3ByByoK
         cVmRzIrh2RBRmanOZlGTy9gYlo8Om0sZrNFDXYXEZ9aEroRoacSoO8hm/B50W5Wh8s+B
         g5JeYMij4/mVHopFJeWlYjzqF0FuxJyjUgx14aQ7bm+rW9gpYGTnDSSU+H7hMfxUyxdZ
         9jrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743757374; x=1744362174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AT0sYEXJkvVX4YpBmzj2OY2C1bjsMKeplWHZpo7aDCU=;
        b=BJyqREUqJpWt3LkFlB0UtahdW8jDkyGCs+40cEk+28lRuqj03RXwJy6qAzJl/Zpslu
         Fnyo51174+Fmk2gKpeDs5leadz7rI/1vuZJe5hJWOPAwDkZMp5RZYL8uzz9YtnqHm/TX
         /CDlZq31BKxjxNpHkSmOkQ+c8cy1zTHSL1eJZIVpBL4h4mwubGKWsCQaDc5353+qHkL+
         kvYuxT7Pkp3fM0lwRE7F7gKDYvEoKuXCog3PhagQldjf3sMC7HsTjrupMZMuaeMyQwCy
         xWBi/MJkmvgVJjselnXMJv8uwVUugs1pwBq3g8+XXYQv7n5YHDKrQ7DUJPQFoGTBpqzB
         vrLA==
X-Gm-Message-State: AOJu0YyhwyeoGDB37fAgKC0TxEiBRlDKKxluN9q6DKjrX5QuswokJ6a9
	TFmS8prswsnsRNXtI0EGdwipc4hpJ3SjNIK0qmvQ7CdLfl5xKPHUQpHcxRRmQzpWp9KsNMdYQe5
	5UhzYLx0vYqmldsos64ImW4EgldnBVKuckOQwTg==
X-Gm-Gg: ASbGncsZEqsAl6trO/WVeYa4+M/M2cm08QFJA27VtIHsvW5cSpuZPnI8ZZKKfGUtFhe
	sEjJaMepaVPhOTmE9gBTgjI983lREEqNAz9eVKUOyazBL2gpJhCIQ+C8j4RS0lTjLv9IYGz1Iqx
	ofCPlLi6d0Tm8FNVZ1nT9X9oQ=
X-Google-Smtp-Source: AGHT+IE3c8J5XFi4Pog/UFlbZxenY07T9F111peneZ+Nl3svAw6cNIj7qt8tUyUvZtN1WK7vFyYtoxkG2auhvg4tpbM=
X-Received: by 2002:a2e:bcc4:0:b0:30c:12b8:fb9e with SMTP id
 38308e7fff4ca-30f0c061ce6mr6442821fa.37.1743757373833; Fri, 04 Apr 2025
 02:02:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331-gpio-todo-remove-nonexclusive-v1-0-25f72675f304@linaro.org>
 <20250331-gpio-todo-remove-nonexclusive-v1-3-25f72675f304@linaro.org>
 <CACRpkdYMRnmYD1YRavZs7MHEVFM42bOL2=6s4rJzFDnfLJ4fAQ@mail.gmail.com> <CAMRc=McBWncrCcX87a3pYeZ3=uYGNhpSrK74hDP-XNYrT8WMMg@mail.gmail.com>
In-Reply-To: <CAMRc=McBWncrCcX87a3pYeZ3=uYGNhpSrK74hDP-XNYrT8WMMg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Apr 2025 11:02:42 +0200
X-Gm-Features: AQ5f1Jro8WxWYYgBK-u74u_UUFVf1ElCnzRI4WgZMQgyCFcbCXmRoZirkubFn-w
Message-ID: <CACRpkdbeObj7t=quffRrZtZQRRSr6GBeayN3o_8H8zGDD22XpQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: TODO: track the removal of GPIOD_FLAGS_BIT_NONEXCLUSIVE
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 10:57=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> > If several providers with their own struct device is using one
> > and the same GPIO line, the devres consumer is unclear: which
> > struct device should own the GPIO line?
> >
>
> Well, other subsystems just use reference-counted resources in this
> case but see above - this is not a good fit for GPIOs.

So to rehash, for example clocks and regulators are by definition the
equivalent to NONEXCLUSIVE, that is their default behaviour.

Two devices can surely request the same clock.

They can independently issue clk_enable() and clk_disable(),
and the semantics is a reference count increase/decrease.

They can have the same phandle in the device tree.

But GPIOs can not. They can only have one owner.

Technically this is because the only reference count we have in a gpio
descriptor is the boolean flag FLAG_REQUESTED, and it
happens like this in gpiod_request_commit():

        if (test_and_set_bit(FLAG_REQUESTED, &desc->flags))
                return -EBUSY;

This semantic is in a way natural because what would you do when
two owners make something a GPIO cannot do, such as
one does gpiod_set_value(1) and the other does gpiod_set_value(0)?

This issue does not exist in resources such as clocks or
regulators that only do enable/disable and that is why GPIOs
are different from other resources.

Then we can think of solutions to that.

One way would be to add a new type of refcounted GPIO
descriptor for this specific usecase, like (OTOMH):

struct gpio_desc_shared {
    struct gpio_desc *gpiod;
    struct device *devs[MAX_OWNERS];
    u32 use_count;
};

struct gpio_desc_shared *gpiod_shared_get(struct device *dev ...);
void gpiod_shared_put(struct gpio_desc_shared *gds);

int gpiod_shared_enable(struct gpio_desc_shared *gds);
int gpiod_shared_disable(struct gpio_desc_shared *gds);

So this compound struct will not be able to set value
directly.

The gpiod inside that shared descriptor need to be obtained with
some gpiolib-internal quirk, not with gpiod_request().

It will issue gpiod_set_value(1) on the first enable and
gpiod_set_value(0) on last disable its internal descriptor.

If existing valid users are switched over to that then the
NONEXCLUSIVE stuff can be deleted.

Yours,
Linus Walleij

