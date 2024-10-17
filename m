Return-Path: <linux-gpio+bounces-11513-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD039A1D27
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 10:27:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2104928B873
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 08:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 529261D0BAA;
	Thu, 17 Oct 2024 08:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YhO7YR+Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F286D199944
	for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2024 08:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729153644; cv=none; b=lKMyNhtsQcIB+/+QiWSHGq+96Pnw0FxqQea3UjscA70VaeHGZd2Q0Bh8F9yHwGGRj9iNGty8mTZ0+aa+9GZEf192E8riZ0JCm3zFbZulDVgpuEJwGFbopbXICfS/DLNKWxO1djCVOdLjl3Mz64L0NXlN78Gdgf9o0ZpP4VErPeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729153644; c=relaxed/simple;
	bh=9RuFKXOCKGYCpRwEf9eZyL6fG6HGSQQ0BYGl8jLj5XM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MRTfoSpir5MW+cz85o4O7NV6KVEKxNwBh1ekh+UzuDx9/cI0vTOzcedZTHvYynwMlV+8zQAujvFvVaZsjoBeL8jq9K5Y5BCS/DbS0GbkBCMzBecmt/kW56VtDzD82ehLjrqRMBfUfbOuwXoxcFXdnnrdmxlsdQ1nBV0md0V0EDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YhO7YR+Z; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb5111747cso8128581fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2024 01:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729153639; x=1729758439; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9RuFKXOCKGYCpRwEf9eZyL6fG6HGSQQ0BYGl8jLj5XM=;
        b=YhO7YR+ZJZMMxUQ0FU9xAsUAIERP47nhn6SP8ucU3ADPGryllAFNbHwtxtmfZ9tTBN
         4UjHlLXT3q52TYPuwiUrdyGV50s7nj5n26rU6zb40Lm65Bo5LHqV5CcW13edJWRfEsuT
         dpN4kKJlXRmJ5XjvktUpF047K1us+/j8dIELs6v91oNXmh4xgBJsrA7fFEiEa7zpE4P5
         ksMWfAUItaj/aVbgD7lqjdU4eDc/T8MSGApJB2n5sqW3WbfrvAbmdmtzQzK50wLy0tlb
         XjXqF9nICQYe+MH//GXFa1URrh5AEnlpna57gOeKaEA2Lh4x3vh+VLsiFYy1tA2hgylw
         cG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729153639; x=1729758439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9RuFKXOCKGYCpRwEf9eZyL6fG6HGSQQ0BYGl8jLj5XM=;
        b=Es/Pqepxt70HzN4jsyjaOG90PytcUf9NBIg21jruteX/pIX1JAJfe99Sz6a9HQ4y3O
         MJ7Twp5BViZ9GdvpbXWy45IQTjZHjvXW7PljvEHtSl/XbO0ctG3xafKxoXx4uZTgsTol
         M9HBsbZ2cQ9ujexwN+UIx+HfRzTQv13B9JXohCri3RKDfzNkv51un6JpK8AxudwDp94t
         pW+p0foUzitWJBtZqe/WSdaiTOLJel9L8qAeyMtypzxd8lfjveookYxnVx+WkvFpanGs
         j+Kj/4De8QwNLGi9U6z5R1XK9kMBtTXHWRrTHqga3AlgOin3xIxexPy0TBMWAd4zvD7Q
         nTuw==
X-Forwarded-Encrypted: i=1; AJvYcCUqTS+wTxR0oZ7qGbiOknERZx6mMWzijiWm1Z7f0Qn6vSW8bJLsL/hUE1w6eT8A8Qq2UYro0PdPrZ1s@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/VL1A/shmVYZIgM9JYcxC0O+K1KDIIveaMNSDfN0TyFQesJRl
	0JKfrlne5NGD039ZVUAZe8RcOsqYToNUFu26wDFSCa2k0TYhomjItvbvQ7OJSxuZ1G5otR9hHFe
	PhUmsrH43/Y/xEpIkiPUday4inZJvQteMkM/BLQ==
X-Google-Smtp-Source: AGHT+IFGp1jCZnmvHDvQ/rJ1b9yqTSHX/X7zZXCjm52M5WN86eDGAJcyc4neSjprAjW8t26MkeSMDc9bWn8TglCFYV8=
X-Received: by 2002:a2e:a58c:0:b0:2fb:266b:e3b2 with SMTP id
 38308e7fff4ca-2fb32b38547mr108340751fa.36.1729153639012; Thu, 17 Oct 2024
 01:27:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241017071835.19069-1-brgl@bgdev.pl>
In-Reply-To: <20241017071835.19069-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Oct 2024 10:27:07 +0200
Message-ID: <CACRpkdYeYLzF00Oa8QNo6MjcbyKdk4L=CE-a+8CXMK5soiUCXg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add a keyword entry for the GPIO subsystem
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2024 at 9:18=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Every now and then - despite being clearly documented as deprecated -
> the legacy GPIO API is being used in some new drivers in the kernel. Add
> a keyword pattern matching the unwanted functions so that I get Cc'ed
> anytime they're being used and get the chance to object.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Excellent idea. I had to patch out *new* users of the legacy
API in the last merge window. :/
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

