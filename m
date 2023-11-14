Return-Path: <linux-gpio+bounces-102-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D36F67EB0ED
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Nov 2023 14:32:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D6B22811F7
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Nov 2023 13:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 123DD3FE5F;
	Tue, 14 Nov 2023 13:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UO5mQh5C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B0E3FE5D
	for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 13:32:08 +0000 (UTC)
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F6A11B5
	for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 05:32:05 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3b58d96a3bbso3145487b6e.1
        for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 05:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699968725; x=1700573525; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1vUZuk20r1+GVjNsC7jKBkz3TTC8HOm2KVh27bZ33Zk=;
        b=UO5mQh5CGMAhgCvyRD0Ap4M0j4qJWCWUExA/SuRLcjRK21bq1cwjtSp5jBE3S6tIMX
         qqjXXzOUa+AFgLqhijn79VlbD1zFHKjqhsI4zn6V9dDNNEX0E/vznBe26lvA2gX9/QNY
         9KMlrYGTpCKEyEOsYtBh3cax9BEM5Q9Ahe6hUHQG0y+fn7Mn40TXhNkl1x9RWg3HgmzV
         kmyCq+QLGDLfvDc1jaazgmQK0MQHe/+QQJ7H/8JG2d210GBvBgBQb6DFYDuPKeyfVPai
         2BtsOpJNn3vm7H1WDgi/kYe41D+pVqGXY/sNL4lG6joOYD131e4l9PyOaI8cxTQd8/gA
         DgZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699968725; x=1700573525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1vUZuk20r1+GVjNsC7jKBkz3TTC8HOm2KVh27bZ33Zk=;
        b=W4RjDShPi0UvhoIXNMssLD122lFT5R4iTv5i6eBO9LUEQF9VNmENo6hw/qUIuGlKbD
         hR6MIudEWKCASmls1xl3KfAn6ZZ1n6K0F7Ar+HwbGlcSN4u3Vht81zoBp1BQhO7+Rr0H
         AWGgXWjapmGZhj3UhnCFCzJnX3Y6wtzrzHDErSt9oKcBQ27S0V4i6fAclYXMTqPlpXAs
         Omd9+I7wvbzVgKZXZaeVbBLOjdriRgpjgP/bpY+ek1o1nrdo+qgx6jRuA3c73e+Km24F
         WBytkrivT7gj8MRA1HYenV3OSL5l4Sp9UfdkeEpQVkxAzSXKJTrDiJAFemLG/CrKo5pj
         c5rg==
X-Gm-Message-State: AOJu0YwHkE9S/GyENZBMOvi7rJPQ5yN1zTJ0IcoToErSf7lzV4+QLKpl
	3I+VjIYDI52CjYWKoIUunps4qZj9O+DEEJToLNME7g==
X-Google-Smtp-Source: AGHT+IHqZdOXQdDV9VPmnwCxEgK4aPNOxm97uGZ843OsMAtoaqKZPV9nM/Tai7R80zUmpCVAX2nvML2llytyNxML3fA=
X-Received: by 2002:a05:6808:21a0:b0:3b2:f192:5a6b with SMTP id
 be32-20020a05680821a000b003b2f1925a6bmr13688708oib.16.1699968724871; Tue, 14
 Nov 2023 05:32:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231102101357.977886-1-eblanc@baylibre.com> <202311031233.sJVCIk08-lkp@intel.com>
In-Reply-To: <202311031233.sJVCIk08-lkp@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Nov 2023 14:31:53 +0100
Message-ID: <CACRpkdZuXk5F_C1id3rRpfA=WF=+VtUtRH_BTkQd5P9pQMGFhw@mail.gmail.com>
Subject: Re: [PATCH v8] pinctrl: tps6594: Add driver for TPS6594 pinctrl and GPIOs
To: kernel test robot <lkp@intel.com>
Cc: Esteban Blanc <eblanc@baylibre.com>, oe-kbuild-all@lists.linux.dev, 
	andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, jpanis@baylibre.com, jneanne@baylibre.com, 
	u-kumar1@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 3, 2023 at 5:44=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:

>    ld: drivers/pinctrl/pinctrl-tps6594.o: in function `pinconf_generic_dt=
_node_to_map_group':
> >> pinctrl-tps6594.c:(.text+0x139): undefined reference to `pinconf_gener=
ic_dt_node_to_map'
>    ld: drivers/pinctrl/pinctrl-tps6594.o:(.rodata+0x14): undefined refere=
nce to `pinconf_generic_dt_free_map'

You Kconfig needs:

depends on OF

Yours,
Linus Walleij

