Return-Path: <linux-gpio+bounces-407-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 613F67F6214
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Nov 2023 15:53:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF20FB21585
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Nov 2023 14:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DF2F22EEC;
	Thu, 23 Nov 2023 14:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lCFmi2Jy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 649F0D68
	for <linux-gpio@vger.kernel.org>; Thu, 23 Nov 2023 06:53:14 -0800 (PST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5cc3dd21b0cso9129537b3.3
        for <linux-gpio@vger.kernel.org>; Thu, 23 Nov 2023 06:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700751193; x=1701355993; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ceo2cl5GUrT1DdR/i+vAheLeBxDK4vsJ52Urs/B2oaA=;
        b=lCFmi2JyAzfLQJrsTQ8r0bqzFjkaKXiYSL94PXjgaeAUjlvXjBmJW0qRW0MFopG4K7
         s1AG5yhwx5uIeqKJcFu2PfbiPcibo2fhwYDf53Mlgj+x9VJecNqwc9RUs47wI7Umf6o0
         LZvaqSWztEoXUopoJRQfXOyPlupVSKEKoLTidd3LIyJ9LmbP36aLT7J2BQs11sRrEimD
         xkn5DAm7orzI4wS/+lF/PA/j25DAOIBC1jQSZqIEaeKphKgjXjNA08217sVlhwInawam
         k1CzaHNs4Xvq61+c9Ckdb7M1KlFPvPy7aZuIQNRLOlwQgyFlfcYCFOL11rd2tOTfEm88
         eHQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700751193; x=1701355993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ceo2cl5GUrT1DdR/i+vAheLeBxDK4vsJ52Urs/B2oaA=;
        b=ebBWqxOvyz30PmAbcsX0FAGiJUtezrZCXx9cdJ0EO2vSRUmg+6JHx8FtsnYUd9xekp
         L72npDvBJ+3omSphTTI5auPsR/qDUCUO0W0CdJBd/DlkSFCiX9qwx0Ff8+HSwV6giCAZ
         3JLrxWfImnrtHIC+hGBn+413+PzANBksjeW3Cs+YpYYSB3sEjzolN1V90YdIEq6Nughf
         EIlr1LqInBuNkxSZpmXPmWZlf9aqxWXVIVMQ9Tfr7pNsGgmzIQFXsUx+fUl1eTVmRuzd
         rTef4sq3PBBZdqIevVqLZu0OR0p5iADnKaea2HLkZvfkAPpX78fU7NmFXDBrhukYYIgL
         oWmg==
X-Gm-Message-State: AOJu0Yw8tKsGxFXYS0CG3iqGLilehNF7GUrF0kD6IgCESEWbGZduMj2J
	r6/Yd3UnfLW6gAyEqfpm6skyhmzyQDfvkAWVLNxtWg==
X-Google-Smtp-Source: AGHT+IHlbt3Gav3a2shSJGciFVu/l8CjG3rfcS70wZGTyD89Is9hFwjeBwrxIZTVX0BvtJZ/yiGQM1++SucNYx/w5BQ=
X-Received: by 2002:a0d:d657:0:b0:5cb:249b:4482 with SMTP id
 y84-20020a0dd657000000b005cb249b4482mr5697795ywd.17.1700751193464; Thu, 23
 Nov 2023 06:53:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122175444.2316719-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231122175444.2316719-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Nov 2023 15:53:01 +0100
Message-ID: <CACRpkdbXCYB3NCqOdWC9x2HTEAVb2=PNGEUADqSC5N+1iYLfWw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: lynxpoint: Simplify code with cleanup helpers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 6:54=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Use macros defined in linux/cleanup.h to automate resource lifetime
> control in the driver.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This is really nice.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

