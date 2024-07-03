Return-Path: <linux-gpio+bounces-8008-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB8B9260D0
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2024 14:48:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 704851C21D5A
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2024 12:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CB1A1741D2;
	Wed,  3 Jul 2024 12:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qXljRZKb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5489179955
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jul 2024 12:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720010925; cv=none; b=eeGgVtC61nSedh/CaRtKIm4v3oDkdYPnML8LCQZbIS7dSQwL9/AF6ezZrFSz29nLuOabFMFf9xnDet52r+oVHXw+zGqsM9xobDLBLMSXNn2YT5RHgZEWWbOFWBjwwhu2HJXrBqNl6DTsRkeNUyVEXyCoVw0IMGlL4NuOoj/Qjxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720010925; c=relaxed/simple;
	bh=3M92oo7D0GCuxKuFGIgzFo85A2FKnAzzgy4TTDdt9mA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YJCEsSuW4CvQU6/iFhU7PMKxIrtAsyHQ98Qk98qeT+CEzUFDn5uyoHQNt1P7IHkxsybRrhTG+L1gn9vyOm8+6LB5xZ0Fu6PjLLHBRH4e021llSnAWFGnkRGxsWX9QqUhdD32gUcDrIHhr7vCqhnjd7TXT3ssZOZ6kIXGgxryrvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qXljRZKb; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e03a17a50a9so1849349276.1
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jul 2024 05:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720010922; x=1720615722; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3M92oo7D0GCuxKuFGIgzFo85A2FKnAzzgy4TTDdt9mA=;
        b=qXljRZKbNQHiwKrg2WVTeyJZpUOz8tXoJA75hdV6K2x6CcXKZeZ53JiIz+TEOvsENz
         kMs63238uhuY9/bY/DwAjtc24QZs7Bysgy4IRsWzYW8YXpR3G2IWTIfTwnUev6Qgznro
         aLj5+u/sasZwyHHrwtEiBeBy9qb6ju/4WUKQOC+sk3OYGV2Z9owggCQAFC6kKRpZWvun
         cWOUfLjvESspaQBKipBlvxdeEHn/1Fao9lgkVi6FaCa34fY3So6Srtn+lF96wsnAJAiY
         +qL7DiiHqeg+whlJpAbDQyLfF44qyLK5/fhMMnPHOy9af2FgWRBAkcFPoOX7oGwTAehG
         46sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720010922; x=1720615722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3M92oo7D0GCuxKuFGIgzFo85A2FKnAzzgy4TTDdt9mA=;
        b=sIkjN11wRvhshYML2tSjFaooe+GCgwEjaYR9JLHYeMZg61/kqJEnpHKX2OgfRVn5oB
         uKAZkZDl6zkjgK5g1O8hqJ/uWDOyjdRvBkGL55Xl6A6GslbZ32SxFCgPDYhT9eqOHVTe
         sn3+fkfXwuDrwHv3GQ82IdXWMzp6QX8GkITGklKA2L5PTCRVor9Spcr3Vn078NuAU+jJ
         j2/Fyx/AWtLEQRqq1YcZMsz7nedrChaVMXTJPHoD9P+AIlzRvBDxzFjp8SNE0TxIrDr6
         jEq2CU5vZHgLKpYvgZeVl4BN5pfD1r+XOlb8osy+7my1EUN2MRLPSgnAgmW0JaTp4c6E
         CeYg==
X-Forwarded-Encrypted: i=1; AJvYcCVt7VUp52rf2T4ldnRvqTJG+sXJz5auXs6SsXuU88BwyGZ6L5jY+TyIxPQo5o6RXlSjjwSQmkpTg/wAdy42ESnVNcFmW8f1BOa8fg==
X-Gm-Message-State: AOJu0YzybZnPPqnXL490hVkZzzIyrfJLTDZxOU7oidWnN9XAe9PjYbOk
	WKrFV5r4o+73s8vPbMEXu6mBGHlBflFI6OqfCgBJcZFedO/LxNYJDzeSQ/wR8L9ANEFM3gQuctq
	rxc91VS45XZfcNc3mvj3npNEJWzOF2zYlqqqwWw==
X-Google-Smtp-Source: AGHT+IFjUoGWH3PFBnIYNiYrEoEkHea61nrLqNK8E7mLauuHE0kJwuMinNs3K6k/4bxMVi3XuQWPjA5JmPxbv0mcXkg=
X-Received: by 2002:a25:b96:0:b0:e03:4d43:658f with SMTP id
 3f1490d57ef6-e036ec6ceb5mr11316730276.53.1720010922580; Wed, 03 Jul 2024
 05:48:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240624093934.17089-1-brgl@bgdev.pl>
In-Reply-To: <20240624093934.17089-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 3 Jul 2024 14:48:30 +0200
Message-ID: <CACRpkdZh1RU43Y2PHwdUPx-K12z5xd5pZ9+dFVMOUc+Ze7mJVg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] gpio: sim: lock simulated GPIOs as interrupts
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 11:39=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> I realized that the gpio-sim module doesn't lock the GPIOs as interrupts
> when they are requested from the irq_sim. This leads to users being able
> to change the direction of GPIOs that should remain as inputs to output.
> This series extends the irq_sim interface and allows users to supply
> callbacks that will be executed to inform users about interrupts being
> requested and released so that they can act accordingly. The gpio-sim is
> made to use this new API and lock GPIOs as interrupts when needed.
>
> Thomas: if this is fine with you, can you Ack it so that I can take it
> through the GPIO tree for the next merge window?
>
> Changes since v1:
> - drop the notifier in favor of specific callbacks

Acked-by: Linus Walleij <linus.walleij@linaro.org>

It sure seems consistent to me and in line with how I once
thought about locking lines for IRQ.

Yours,
Linus Walleij

