Return-Path: <linux-gpio+bounces-21050-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36494ACF0BC
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 15:34:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05B243AEC28
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 13:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 724C220C01B;
	Thu,  5 Jun 2025 13:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZTgtrG+p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7010918641
	for <linux-gpio@vger.kernel.org>; Thu,  5 Jun 2025 13:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749130313; cv=none; b=gw0B19VwMv0BC7L3McKFCb61QgtEP8HDHGahUXyTqePLz1L5bLorKPbWScOdqKNHJCv6AUIgdljHHpKe4SDTAgRCQKArz2Tlgzb6/PppqWOUH6EaUnIsKKNtKAvaP07rTLg2QoKWC8VHfMFLZp2zZ4Na+fKqF8424ckihwqiwRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749130313; c=relaxed/simple;
	bh=3Xp16Ul5W2xdqpl8OIkvkRsLmilUb5eDdkpE06xCKR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HBhpIY7qfLV9xhiSoLnAqow3bFzoV0ETgi6uaWBFGiZN2vnvIIegPW5EcA59opDIlPuod/8cQv4tHa6T5OYLVHoebdrluXI4epE9tgX1rqmkczFAxnmHsU9IrqX1t6mCVaFxb3e7p8WrWGQxKIgJro5xL7VrFbwhJ7P9UlBtaDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZTgtrG+p; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3105ef2a06cso8078791fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 05 Jun 2025 06:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749130309; x=1749735109; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Xp16Ul5W2xdqpl8OIkvkRsLmilUb5eDdkpE06xCKR4=;
        b=ZTgtrG+pCz+16QVRtN3gJYSXhZaVSvIuOEx9hh4+3y7ImKdbCNdu3jdznAuDhBm90y
         TSBGxiQP0Jd1xwSeZwlwrr5r+NZXG5EworM7T+9NAhkaIHI67GtG+q6lwN7wKdVf4v1g
         ljSNnA4AU6pYtWavPYG7H4RhDQwEQrYz3z2ye57FgDwEhMBBqo/oF6KTO5mKEvl0Dpja
         fM+gJu/x53Wj0f+GC1zLxBP+KhkBpQrNw7bC9Herh4sHf5rHNQ+ETT51gTHzDz48h1qK
         qgbvmOpP8kK7G3csEC8bqA0+KeNXHOnoxw28UKW+RQCsd9VZYk2fVhC97CjBHlHGvTQn
         vxLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749130309; x=1749735109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Xp16Ul5W2xdqpl8OIkvkRsLmilUb5eDdkpE06xCKR4=;
        b=dCS/XL64L1ye5ewTq82GCuQUiY+2soYcSw0fJDBien7y0IKaUIci4MQ2/Ay2EV7Ml5
         bQ218faui5DQyremSpIog6ETs50BHE9rKjTrDO5InO+GLsIXiCBEpXEFNJ+brLpEguEa
         ZwsNtt+i9HN8TDWD96norpFXo+WJezrjQr+LoOflnd+WLh/LIKAGwdyGO+nF0/nxBQFV
         DQ1B5pfUkFuD/aZcYttyCHCYSdLm6bpcbmYtdmHOlSpRhgwcKgFFux+7XSKEdZMJhBzR
         igNVmGFZ0Nm6nkOWMduu+GmJwAjZpZxQBziD+SrZgY33jhapJLUewzViXYrBInKI7qNk
         xpuA==
X-Forwarded-Encrypted: i=1; AJvYcCXrapaycFwiDdF70CU/1J30lP1eXwRu/GDAbN2cvGRfIMkJJ96EaTn9g6GBZ3qxH0Q8AKbMJ8Mp0CBj@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6KEI+9hOQfDNUszbQW9CWrslPC5UBf+q5sfOduBs3ua1D4/iZ
	6W2CrJgbvbBYxrcHFvgijmrBOBu9nX7hI4S4ZDK7Udfu1HAUbT2jjtdWt05wSkgo1RPLml3rNQw
	eYgo1xrh8auZ1glzYT9TB1MojNq6+Xeqt6uIqyes1mQ==
X-Gm-Gg: ASbGncsOGEC5YOeyaSSmwvm8OkHnzRgPhHw8J6J59z/EuW40glDVPugY+s/4+M7sGkg
	nuA4wZ/B9HsKacZtAGOYPZbWXC5y9kGuZUiG7/ayF+UCaojfDg1My+aPi3CpYCTspzVW3hE81sK
	RIoa05L+z7FjMeY1ugBJFOJYf6dbDcoFca
X-Google-Smtp-Source: AGHT+IHSnKSDNQUJOOGzj78O2oKNC6lGuJm7j4wb7PTPZDyANZnfX0CVuXsuVoOMf6kUNk+ATNKuvBm/XvtBIQhaxeY=
X-Received: by 2002:a2e:ae13:0:b0:31c:31a7:4679 with SMTP id
 38308e7fff4ca-32ac7258010mr17887721fa.37.1749130309416; Thu, 05 Jun 2025
 06:31:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250531195801.3632110-1-andriy.shevchenko@linux.intel.com> <20250531195801.3632110-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250531195801.3632110-2-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 15:31:37 +0200
X-Gm-Features: AX0GCFsbnofQ22BvZl1sODGZD9DlgA1gYR1ngBlv5uhGKV5q5X97cgJTuxkbKFE
Message-ID: <CACRpkdZhBDCZi=-wdK=tNhgt+K=jjgScF+7FMN_Q=ge6eRrJxw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] gpio: Remove unused 'struct gpio' definition
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 31, 2025 at 9:58=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> There is no user for the legacy 'struct gpio', remove it for good.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Good riddance.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

