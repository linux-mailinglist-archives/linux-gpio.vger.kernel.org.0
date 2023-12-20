Return-Path: <linux-gpio+bounces-1705-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C89819DD0
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Dec 2023 12:18:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 115C81C25C58
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Dec 2023 11:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FE0121119;
	Wed, 20 Dec 2023 11:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xcw6Ze/2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BB221110
	for <linux-gpio@vger.kernel.org>; Wed, 20 Dec 2023 11:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dbdacafe012so354784276.1
        for <linux-gpio@vger.kernel.org>; Wed, 20 Dec 2023 03:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703071078; x=1703675878; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7nJTG0ksd0dIqzS4wveRxbem6Vl/tCOC3BG2PhGa4/s=;
        b=Xcw6Ze/2f0ywoX9xSjDFQHMN7AVqn+C0yf7Tk0sGcxOxmfb9MU9Nl6oBCaojgujn9X
         abKeHjzgQSVwykKaYRT6W1vlzAN9NFdZ3kmFGVyZ7ivkO36aeu3T1GRQ24ai0eaA7qGb
         kbXWqCKpzpPSx8Q63v+Ys0wzrcWANBsrqz7+2YuPk1qK5qBAvLfKZI/KT77EbwWf5DDH
         gorw9XyB4Y9oOZB9K7TMYrt79Uns2lX4NXfbU07lT1djZ36fq5s5ZH2Zj0s9d1Hf8Pf2
         43fjkxSz+wEZuRd8HVkXEs00mnqKaWlGGvqFdAtZPAZRKb0PCJFDlD/54lzH0vOsmYQv
         N5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703071078; x=1703675878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7nJTG0ksd0dIqzS4wveRxbem6Vl/tCOC3BG2PhGa4/s=;
        b=uF2qjJOh6fheBxs5oNnjE9Mxxr+eDfzf5i1jUeuAoU+0pu/+DqpBecNEEsRf6KRcW5
         n6B3Gx8xM25Llb7DHF9SzXuWN/Xb0BBCxQxnS9Ii4ACBcxqA0qSc8p4VInPYlobXxsVD
         wOTJCQ2XghWn4/fDMim3gtpGtVZif/rsYkK2weEX04EekxP9/Y6yGfQG6HtybXP30evD
         aBb6eeZHN7r4SQ/sdHRuXD9Quc4n6OeCq0h4lDa7yRzlfO8P+qLM4AUt4DUXb9QDE06g
         D1tS1RO33xlZR3AQyMMHZQk6+zzEE4QE+GD2rN5BCf6F/0GeFWxH8Ki5cFmG+8PsDREW
         PyqQ==
X-Gm-Message-State: AOJu0YzXLivfJDU4rJcqpyvfsUmZ7gkrtxvCwS3KJc+5v91Laxv4pDFE
	Yj6JMeuZCC9EZgvBfOqDAyLu8F54XFVlRZfZ7lrtxT/prjptkpkT
X-Google-Smtp-Source: AGHT+IFrVolfsITFdT8gAueqj3Ol3WsFvnrs3ZaizYL9MCiw0cxlXcnOnph16YBPZRvMSNFZBgwuXYYs+l6OuYCjbOI=
X-Received: by 2002:a0d:dd4a:0:b0:5e7:7a39:6977 with SMTP id
 g71-20020a0ddd4a000000b005e77a396977mr2290216ywe.53.1703071077953; Wed, 20
 Dec 2023 03:17:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231215155300.21186-1-brgl@bgdev.pl> <20231215155300.21186-2-brgl@bgdev.pl>
In-Reply-To: <20231215155300.21186-2-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 20 Dec 2023 12:17:46 +0100
Message-ID: <CACRpkdbNmhfYfWyY+xUjeBHLofwwd+PUH9tai4uYJGpqjiKc6A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] gpiolib: rename static functions that are called
 with the lock taken
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Kent Gibson <warthog618@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2023 at 4:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Rename two functions that read or modify the global GPIO device list but
> don't take the lock themselves (and need to be called with it already
> acquired). Use the _unlocked() suffix which seems to be used quite
> consistently across the kernel despite there also existing the _locked()
> suffix for the same purpose.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

