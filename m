Return-Path: <linux-gpio+bounces-2825-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8DF8446C3
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 19:08:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6677828B946
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 18:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E758212FF8D;
	Wed, 31 Jan 2024 18:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nBHmYp1U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FB512FF69
	for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 18:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706724517; cv=none; b=dUoNS2H6YV8SxTdUsQBAoOxXkjf7VqMZA+ZWp3fJpd5fXVgMs7D/Qxmc1kJBHCn9MlH/rdvzKtMJCsqRrlkQBpBZ1jHePRJRdef8vs9wRwztMFIgL+QK2yHDgoHpKIIMp4HMKGiWPhrt0Epdes9yvRaeAJ1AHNX9wqPpZeFq+XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706724517; c=relaxed/simple;
	bh=/TqVe9oPbkha3IG0Da9VATsWwyM9nTOpqGNcQqestL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VKR+eDxAM9mLq9VsMaZEmaSznXzJzrBdhcoRMn6C9NOskveiXl/6uUxUy7NoABQQypTU0kaQWDNNjqHVvmn1CVPFGZqXBhRCxyScjOwLxrq0EHlvg9Qwj/0WZsKDFF1u1rvKayBEpoSu+9yj5H3LFRDiqn+lZbhcq+Hg4Ur1xpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nBHmYp1U; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-7d2e1a0337bso44376241.3
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 10:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706724514; x=1707329314; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/TqVe9oPbkha3IG0Da9VATsWwyM9nTOpqGNcQqestL0=;
        b=nBHmYp1Uuxr1sHICTyKntcPSlpXo1fWE5HjCLJIic/Hixx4NPPhedNhisc13iwB17Y
         ycVd8mfBia/+ttcqR3ou6ZHOiK2UUwB9SaDzPm42W8sXxyxgSKRVVTZ/PJ9H5hnlpxTS
         AFi4t6moy4MAbB8OPH1RcinD/YV2byiba89GQf/v9XLnejCPwas19onM6hBpqdzUQn8X
         LKZLOgvYGIqtDTnjR3RMA/i+JH7edHR0LHYUzaPFABx6zgsnkODIqVqXO/OwY5QY/9xM
         bLQhVROPRMeSE3dv2bXK+TaD5a+4bu9tpUO3O9PPysFHmWfsoZH6jzl5PbI5p3KlIbnD
         F/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706724514; x=1707329314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/TqVe9oPbkha3IG0Da9VATsWwyM9nTOpqGNcQqestL0=;
        b=XK5yhUnMUIYycVnMwyRrCi4XGDNhVlKeCueZnZrXUDaooWIk0Cuqu+scok+FkvMBMV
         s5k8+D4UuF5eZlnVF85vfapyBiagPtK9Cng8LrJN5YNx+TF4JYN09xSoy7lU+jrsbZAJ
         UsFkNo4vyZqM/TG9FIIwA3RbNUUGHw07W6JvFgjmhuHc4tEnDsDiUJ7iEuhnYZXWYP2e
         gJ4HQ72RM7zsALoJv0vLyTXjle7Pxu09En9lWRh2QYINaNmarsBceR4UWk1FxVCUtI0N
         OLumaMTAoQAGckO+dkx+Yc5yVXxmaKUMI9vjpDEvZ56rXwpQslGjhRAmathl8I76gAHw
         YomA==
X-Gm-Message-State: AOJu0YwoLyUuezIgBSKkxQAeGrgZNJ04ohKiq9WIOfXZ0VeoIwYhSrPg
	hCkFMyS5ryZlEstu88zJ/ZDLD/JAHjxcxs/LDxW63he9cfG3EKxFIjf9mNi/iTR9ztAZlKbxN0K
	2ddyHgx8Z0vX3mbVVxmr6eIS/fPIrIrw7Ii0PVQ==
X-Google-Smtp-Source: AGHT+IHSR1zkm9u0xTdCg4AnwUx5UxJxm92+kZ7qjzL2ndLDeyODEpEu4Tn2VdVNfFi3Lzs7lb3SIDs3OHvqs+2kpEE=
X-Received: by 2002:a05:6122:a20:b0:4bd:4356:40bc with SMTP id
 32-20020a0561220a2000b004bd435640bcmr2650075vkn.5.1706724513929; Wed, 31 Jan
 2024 10:08:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130124828.14678-1-brgl@bgdev.pl> <20240130124828.14678-4-brgl@bgdev.pl>
 <CACRpkdY_9=2Uqo9=ZEDrn+RFGdPkq73ZRYLVCbh6BLMzU9LZ_A@mail.gmail.com>
In-Reply-To: <CACRpkdY_9=2Uqo9=ZEDrn+RFGdPkq73ZRYLVCbh6BLMzU9LZ_A@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 31 Jan 2024 19:08:22 +0100
Message-ID: <CAMRc=Mdh5f_hrAh8BO4P9s0o_t9cT8FdfiY24-PQnPVz7QRZFA@mail.gmail.com>
Subject: Re: [PATCH 03/22] gpio: remove unused logging helpers
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Kent Gibson <warthog618@gmail.com>, Alex Elder <elder@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Wolfram Sang <wsa@the-dreams.de>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 31, 2024 at 6:39=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Tue, Jan 30, 2024 at 1:48=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > The general rule of the kernel is to not provide symbols that have no
> > users upstream. Let's remove logging helpers that are not used anywhere=
.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Seems unrelated to the rest of the patches but OK.
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Yours,
> Linus Walleij

It's kind of related because I'm later modifying the logging helpers
so I'm saving myself some work.

Bart

