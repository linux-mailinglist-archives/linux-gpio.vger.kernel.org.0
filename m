Return-Path: <linux-gpio+bounces-1270-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB0980DFA8
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 00:47:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0240AB21531
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 23:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA40C56772;
	Mon, 11 Dec 2023 23:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OVvOwT1J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98DDAD0
	for <linux-gpio@vger.kernel.org>; Mon, 11 Dec 2023 15:47:11 -0800 (PST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5d74186170fso44795647b3.3
        for <linux-gpio@vger.kernel.org>; Mon, 11 Dec 2023 15:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702338431; x=1702943231; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ArXTC/xeZqxu6gWS7eaFl9W6mwBJ0u0LhdXscG2ZEs=;
        b=OVvOwT1J2lzSsdsNN3owuRtlNuxnPtmYu+d/jvO7GuLOA+g77Dcz1XGjdtb9gI1NY7
         MD9ELQgpKVLo1y7n55OKuWMw2LsZU1PTNOxb3HI2y+lY3ARRVwlFlD5w8h1yPKpDPmHZ
         syFSAroyNsMyW27GGBCskTlrgOV+gDmiFSBi6vle+gR8Yv6Ibl+wV0h6arLkXQMWGvci
         yQE2yGVpId6vNXvwigz8uFaCYprLu2RqnT0f2kSs10EoR7y7uHnL9HkLqyxU4C0b2rLx
         J4AnS5ifoHLWyvci561BmDe7gfHibkHBo6rBD58/4gh5F5/lthNmaVE1jsn+qjtt48aL
         pqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702338431; x=1702943231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ArXTC/xeZqxu6gWS7eaFl9W6mwBJ0u0LhdXscG2ZEs=;
        b=r7k4iztRyoUOmJ46KCWHe3odBy+qFxC2ofWMzYgvmFfqtDl3JS/yCNAM1iT36W8lT0
         64Ry6FVtkxj4++Q/xP/tIkETlOE65wTsvvy4KhwEcyv7/tr6ZOmIscFj3b2r9iUf8rIW
         Pl8uNknoR3ZuR9eC66U5cqasgDK3/vmdplEWGzkB80u2B6uRX3dye2GFepg6T7OELhWe
         HDJ1ijImvhB2n6UKEU23y0dwJdqATOMH2h7NsIRDrxcIvxvv88HC+PjwPG9gDerYzVo4
         DVH7ZSxyEfihOUomVNbxvvpaCrELyUER99oXgDDWTbUwKuntcHF8fWQCh6SZJU/tiOE6
         05pw==
X-Gm-Message-State: AOJu0Yy/mUNfeKFC+ZZ7wLZaRugX1mP39Oz8Wl/7y7ZndhAQJAVE1ROX
	6bnB4fj7+kke9jeoHlXiON21pKz2VP4I9I5JkAKVeZx3vyrTLZ7x
X-Google-Smtp-Source: AGHT+IFK9uYJuRbHGv1SXFtZuTcuj72PKdDKu3s4DZM7a8oXOLoxkotONFx2SVn2whlKcO3Jb1pkCctyu0Vb136hGn8=
X-Received: by 2002:a0d:e652:0:b0:5d8:21f9:4efc with SMTP id
 p79-20020a0de652000000b005d821f94efcmr4077957ywe.14.1702338430812; Mon, 11
 Dec 2023 15:47:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231208083650.25015-1-brgl@bgdev.pl>
In-Reply-To: <20231208083650.25015-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 12 Dec 2023 00:46:59 +0100
Message-ID: <CACRpkdb1FAnTupSASYgBTm4mWizz1Z0Pi6QBnXeQxxzsPZHzYA@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: immutable branch between the GPIO and pinctrl
 trees for v6.8-rc1
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 8, 2023 at 9:37=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Linus, Andy,
>
> Please pull the following changes into your trees for the next merge wind=
ow.
> These are the patches providing a safer alternative for gpiochip_is_reque=
sted()
> before we rework the locking in GPIOLIB.

I pulled this into the pin control devel branch.

Yours,
Linus Walleij

