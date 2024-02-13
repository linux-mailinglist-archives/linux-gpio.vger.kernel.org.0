Return-Path: <linux-gpio+bounces-3248-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAFE853D36
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Feb 2024 22:34:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8589F1F22E31
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Feb 2024 21:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E284E61676;
	Tue, 13 Feb 2024 21:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mk3HhX1S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2280D629
	for <linux-gpio@vger.kernel.org>; Tue, 13 Feb 2024 21:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707860039; cv=none; b=ZyYTq1H6miM/DM/HxD7Drrq2Yj3tCCfSeeBXSMGDsYcZtb9pkztfpDexGwqu4qTTFTYAfFoJ+RU6kbPKf7UmxQyAgm8asz6xO2YR3CACZKrg7q8TB6V3cZ3BzytJOluYt4SeU7VZPDkwSurj84DHAn5/xS8QSnrqjWNbbk1402U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707860039; c=relaxed/simple;
	bh=dPrrXtUFDA/aPNkcV7uPwb86n8qu+g5IfAXRcr4JbEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HROOeHuoFEpMQPERq4JQnVDZ2jYxBB6JsZNzf2cTjLG68AWOAaa/lGsxhwN8vhWM3kTqe+/NIi3rW1lr4IIW6fF+1raajQHT17wt9hfVBQ9xb1gsj2wHwHCLdcjTGOyOoiBXn8+WrWSonE2ngV7nJenu9VzUhgZu2dRl3eFLyi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mk3HhX1S; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dcbc6a6808fso2051498276.2
        for <linux-gpio@vger.kernel.org>; Tue, 13 Feb 2024 13:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707860037; x=1708464837; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPrrXtUFDA/aPNkcV7uPwb86n8qu+g5IfAXRcr4JbEY=;
        b=Mk3HhX1SOIpYSZbMjz1+YZYfLdoW07ghN51SGBx4RMJDurH4iigF9edLE+S7ltqWPD
         0TWwXR7+110wWVCMHIZzvYP6v7LmcIWlmpiIfuLAZ2qc8TihejnEJAVeG/NBnH7ji1So
         8Ws/LIxcYJfqa/XbUdX2DqrXcLZ2C8ahSyU9rWMNj0tDaRd3g8vFv1c4yv+PkYKq+i+x
         qUsSZopIFSf9Kxw++m/ncioMHBEuuVVGvOhCfFsWcOwArGaQTm2YHrsNOxMxvdejZXx4
         wROjoWiB27j1bdiLV9cufTTZsxG+WPgcIjO9Ylpx75ERmxYNb+Ma1qWwrC7Z25rDrIMA
         v/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707860037; x=1708464837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dPrrXtUFDA/aPNkcV7uPwb86n8qu+g5IfAXRcr4JbEY=;
        b=td8tjWZAvfwCys6oJ+63xP0qDCM4uGj3+5N6ODiBpXMUE68prMvowkjqrr8uyZCMMO
         1ICd84wnXl9XyTTRtEAhhF+bkITLT+Dkuopjy4BnMzRcao8ZTcDeMk16tW9g+IGZvjL/
         XqOgNgjQNQE4mTpm3sazgN8ixN+10To4rY08ebUmschvvF8/cFtbNiK8E/ItiLogdUDK
         nCc8e52iA8xYv3zmO47vPSG5CtELoUXiBQzl4k64JSEttoWJnWdUdkk9FgzoLwl+BCn0
         z/gTkb/sqzhmOFn7NjhuXMd6UejZQreNMj2S/5iE1BXUq/ci8SUjc+aVGZZ4HQFWwQ/e
         hyQw==
X-Forwarded-Encrypted: i=1; AJvYcCV0c+YnqEiNyoem8Ge3anuFozsh63MZR4+9RSsXcMaFD+z/JOgseDXQ4JcL3FfhkXsbpCoupS/8LndoKf5XSY9nMnNxSBOejXL3lw==
X-Gm-Message-State: AOJu0YxZl6UfWqhaVo6cldbeUfASJJm28YVpk8iCfsET9ImUunlcfNdY
	s5e3sG3ae5KeRJsIE2Yd7+z2SJZMri5sUANgI1DPGj+aPeB2/mJ6kGtYwSU3UoqPB3ifLra6oz3
	MFKghPEaIiwMbW72e2M3G/THfpD2zqR1REttBIw==
X-Google-Smtp-Source: AGHT+IE8VfqsD0uTdG/aeXwz1tBQu3evMyjL6FRuGSeeGZJLNoEkLi0+zH8NDzaWDKXgLBog66EMzE/k98ESnu4pSWk=
X-Received: by 2002:a25:838f:0:b0:dc2:1f53:3a4f with SMTP id
 t15-20020a25838f000000b00dc21f533a4fmr390290ybk.5.1707860037159; Tue, 13 Feb
 2024 13:33:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240213093108.13922-1-brgl@bgdev.pl> <20240213093108.13922-3-brgl@bgdev.pl>
In-Reply-To: <20240213093108.13922-3-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 Feb 2024 22:33:46 +0100
Message-ID: <CACRpkdYbfU3LV=+xEiE=+MN4xc-_zc_6WiNOP84_PzqttCsQTA@mail.gmail.com>
Subject: Re: [PATCH 2/3] gpio: cdev: use correct pointer accessors with SRCU
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kent Gibson <warthog618@gmail.com>, Alex Elder <elder@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Wolfram Sang <wsa@the-dreams.de>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, kernel test robot <oliver.sang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 10:31=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We never dereference the chip pointer in character device code so we can
> use the lighter rcu_access_pointer() helper. This also makes lockep
> happier as it no longer complains about suspicious rcu_dereference()
> usage.
>
> Fixes: d83cee3d2bb1 ("gpio: protect the pointer to gpio_chip in gpio_devi=
ce with SRCU")
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Closes: https://lore.kernel.org/oe-lkp/202402122234.d85cca9b-lkp@intel.co=
m
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I had to check what rcu_access_pointer() does and it's clearly the
right thing to do so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

