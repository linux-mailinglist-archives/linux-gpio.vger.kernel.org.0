Return-Path: <linux-gpio+bounces-2802-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A5984428E
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 16:05:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B621828EB76
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 15:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C899012A174;
	Wed, 31 Jan 2024 15:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KrbaMlF/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13DB1272C2
	for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 15:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706713315; cv=none; b=i19SXZBHMyNFRbde3ubNzHrl8CRAvdAlJFyaQXijil+fYUjo3xCMS0wkFKmEVYrPpv5CbkD8Z7/sDHxGnQnhDA6ku4Z4IDeKPBmTl+R+OZ2FNevhnekZ0VpMAb2xalY2JFODC6SoCxZ9QJRK8ag4sAckNlZR0ljEWBQ2IWxHbNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706713315; c=relaxed/simple;
	bh=xJgiomH/cxhNerklilkmo8Jkr30cyTGtYIstcEbnxwI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=paPQHjpsEK3HV7GCPCdpMJLopyO0tV9f+6JI6pIH4k88mOiUFELL6SVhXV/an8veUKNc5GdaCEsrJqU8FpC2C0rfXZKAKDQZgHhQo4kkWKkKxHb927m28YdR2In+UF7XkDfi3Tv0UCbPYvN5gp53geZq72ezTeiNXQO4L9zG0Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KrbaMlF/; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dc223f3dd5eso5210107276.2
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 07:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706713313; x=1707318113; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJgiomH/cxhNerklilkmo8Jkr30cyTGtYIstcEbnxwI=;
        b=KrbaMlF//G6hmQx4cZpWswyDatjoEljWjUg+WbI41nmM1NgeXskmHV01TBv6dceIoR
         BuH7BbxtebIhYOe7Q+qb29jseht6htGJMnUfgj0941kmQqrf/pdPRGvGC1YU/hK5Ka3h
         zdt+U0C4xvqjK3bFJL9/rT89FN32DiK/maQ8u+fFy9WE+9tmSGHV4O1mgKS3TcC5CSB9
         YYkrrjU78MHOpXUZ3l07Yi3a41aCiNhpbjm+53IOq7/NEVy1p/M/cwLkhioEq/Tb4P+e
         3pGfNMxIZlltnB66QCXalWjSiDh6GH7cjqczJx8mHMwWcHWXmcLcPppdEvf6DI8hsMFE
         TQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706713313; x=1707318113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xJgiomH/cxhNerklilkmo8Jkr30cyTGtYIstcEbnxwI=;
        b=t+X0IzdPkiQk7LlS/YJyff9mhgAjE68sgE963d9he59R+ovhRayfJFcExCACUSjjfk
         qilHwTd1kbNVHq0XhAK7FVKBVM9sr8FYdjXKahfcjH1hfz3NEcVIqIqOC9XerpBreLQ/
         /BhAiLTtVXPyJ09J5CiBY9Gbpk/+i8TJyxRI02TKB6sptVH7dNQxqLCkCR2wSF/T9X46
         j4u6RNnqItJYLwwEQsJxFG1go/xcFYs/dStvMVAMRY+r8t63uXUalnNP6fHe5Fxg2Rvm
         cbqws/omHJW56SENZfdqa7FjQPiNGYmZw8P2S1ElmBtGaRdmoAByFxTqtAhHRMUiJd0a
         GfLQ==
X-Gm-Message-State: AOJu0YwyUoIwu7sqpSMHN+HheUvLL5f7UurV4ol/h3zBph4Qq7dqmKsI
	HFJ7Rbj54/nk89S/wvf3zqEqdVQmod5Xmh1aL1fR7YGWwLLUmE1LHpwKVwYdza8jzl4PJzAw/9P
	b59k/mZ2ln0TLwXtwb7hSSUfFjuP2UUHOD7sFYw==
X-Google-Smtp-Source: AGHT+IGo/UNwy31dC2Km16vUlIHGiZR7sTpkb7DK4U/zHc/wAur+SRYdormF4CI++5+D4jBsjAgBxPkhsTfW9ODgY9Q=
X-Received: by 2002:a25:790d:0:b0:dbe:ac3a:9d07 with SMTP id
 u13-20020a25790d000000b00dbeac3a9d07mr2023767ybc.1.1706713312776; Wed, 31 Jan
 2024 07:01:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130124828.14678-1-brgl@bgdev.pl> <20240130124828.14678-2-brgl@bgdev.pl>
In-Reply-To: <20240130124828.14678-2-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Jan 2024 16:01:40 +0100
Message-ID: <CACRpkdbJOqmPH8T2_MAbNHWVboudDNXpCPc8OpLzB8z20axxfQ@mail.gmail.com>
Subject: Re: [PATCH 01/22] gpio: protect the list of GPIO devices with SRCU
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
> We're working towards removing the "multi-function" GPIO spinlock that's
> implemented terribly wrong. We tried using an RW-semaphore to protect
> the list of GPIO devices but it turned out that we still have old code
> using legacy GPIO calls that need to translate the global GPIO number to
> the address of the associated descriptor and - to that end - traverse
> the list while holding the lock. If we change the spinlock to a sleeping
> lock then we'll end up with "scheduling while atomic" bugs.
>
> Let's allow lockless traversal of the list using SRCU and only use the
> mutex when modyfing the list.
>
> While at it: let's protect the period between when we start the lookup
> and when we finally request the descriptor (increasing the reference
> count of the GPIO device) with the SRCU read lock.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This looks to be doing the right thing to my RCU-untrained eye, so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

