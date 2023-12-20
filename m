Return-Path: <linux-gpio+bounces-1714-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C363B819E76
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Dec 2023 12:51:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80626287CD4
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Dec 2023 11:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 656CE219F7;
	Wed, 20 Dec 2023 11:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZzCWtjY/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C98219F0
	for <linux-gpio@vger.kernel.org>; Wed, 20 Dec 2023 11:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5d3758fdd2eso45721547b3.0
        for <linux-gpio@vger.kernel.org>; Wed, 20 Dec 2023 03:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703073103; x=1703677903; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hh9FsaGkEflghOxyUW77x/dPI2M6/UTNQwPdaRI2GuI=;
        b=ZzCWtjY/QOhrRcqn1esVAnWRmIY+dVHxra4zml5SvaTSs4Sij9b9b0T/KnZGiC432g
         9T8QZZFwwqjqP4gYYhf8G42ht2w/n7F300DRrKdUrZw6r0hkKOm22KQb41fJX4U2YbLE
         G98Mvh6kc0MR+4P179sL3uOJuaDqZ7WBRGvoLYnQ278cP4fEZHvbt3Z8xstVeMGx9vv7
         xuMAYakgAk5W+HW+PlIP8AjtCJP3POl1IT1fdx8ds7j0XACPMX2qvl8XjcwrRB1OGppQ
         f8rqsgIXolsh79wVkFgxduRxOP3TPPUCftgrupedyM3KRrQ3Dr3o0g7IDVDki864Apl8
         W7eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703073103; x=1703677903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hh9FsaGkEflghOxyUW77x/dPI2M6/UTNQwPdaRI2GuI=;
        b=GGPmM6V1V26dNutwNL22JE/NOGtSEgC6igrv7qgZznUD/bfqWJTnDEJi/ICXzXXyJ1
         nTzCiquK09jj3ZXUQXnahbjqab08BXa4Wc6pQ8P5p4Tad1yTHA3cGNmc7pvIFT4Skuo9
         LA6OfiG1hsQYgx4Doi7GnguXa7z7MDwYyG5Y4og5K7y+nVZYSE5cjVmP0Qt14Xlv2UD4
         GrplyxE7iVqCLFVMU5iQPk60fq6yOQG846tjqZPMWCvTGcLYRW58s5LUO4YlIZMbc501
         rPyXVa7I5eCg+pQHhqtorLtHgQsr901+8P43kYB1buSdkZxJZ1SbgdXUig0mDwqz5kb1
         hh3A==
X-Gm-Message-State: AOJu0YxxSKIF6ZQ0iD7K9RGIclLwXbWjflNch/BEUfmvdYKZHgqeur/T
	TGJGg29BqXjmMJ8ljFmpGpuRgGgepVr6lCpkl6jj+Q==
X-Google-Smtp-Source: AGHT+IHyGRouZU82OHXZbx+6D4OzfTkt4tW/DQrMOd1fK1qNzgXU9PHzPEhVuwJTq5DmPpg9O2NahTkYCVAhK7fDv9U=
X-Received: by 2002:a81:a18a:0:b0:5e2:f064:a5ba with SMTP id
 y132-20020a81a18a000000b005e2f064a5bamr8692245ywg.36.1703073102902; Wed, 20
 Dec 2023 03:51:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231220080942.8381-1-brgl@bgdev.pl>
In-Reply-To: <20231220080942.8381-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 20 Dec 2023 12:51:32 +0100
Message-ID: <CACRpkdZBzXOQORZWUG1+q8pE6vWd3-LpWLobAo2FOng_FS8Pcw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: sysfs: drop tabs from local variable declarations
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Kent Gibson <warthog618@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 20, 2023 at 9:09=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Older code has an annoying habit of putting tabs between the type and the
> name of the variable. This doesn't really add to readability and newer
> code doesn't do it so make the entire file consistent.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

