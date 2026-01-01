Return-Path: <linux-gpio+bounces-30024-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EC7CED11A
	for <lists+linux-gpio@lfdr.de>; Thu, 01 Jan 2026 15:34:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3563E300725F
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Jan 2026 14:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F6E22A7E4;
	Thu,  1 Jan 2026 14:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="THVccr33"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6F6179A3
	for <linux-gpio@vger.kernel.org>; Thu,  1 Jan 2026 14:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767278043; cv=none; b=Ph5jKW9CXnIKJ9I1JoPcb0SVM+h0PFTkThYMschmog9TeqdPWzDIoktygzyKXoiNJzoIWEKztsMtaUKzJRQvQtQRR9pT4RNX+m8HsxVV2CugAEuw78qHRVSS4H5hQFakMc+nxeXPYHLsLxO6CKiigwK7OrtnsQlW9JpoVAfrSX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767278043; c=relaxed/simple;
	bh=1jbfehvip0Ck0xQ3ODNecVWR0kVC7HlpPrBC4wNGPkw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yok4YT3oDTHIdsx6WTV2jKX9E9o0/liEb25sHZZl2AYCG3amcLeGSl+4UgM+cnuizVHc2UTtkTF2rsYZEQL39MFmS+SZU+mEqzS8Snd1FGJjFGUSL85GO92xlImcdxc/RKEf1z1lzf6IWX9SKuL904E4dZeh8VaTngPj7fYQKAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=THVccr33; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61011C16AAE
	for <linux-gpio@vger.kernel.org>; Thu,  1 Jan 2026 14:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767278043;
	bh=1jbfehvip0Ck0xQ3ODNecVWR0kVC7HlpPrBC4wNGPkw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=THVccr33nqztO8STmXmHOaJoZAR9coSUTYdjqz9u2KVrpvYjQztHtHeb5/FDRlBvJ
	 wioibCvK2uz7Dzz2SaouJErY3WCFqvpZkT08nyVBuOl1Z1G5NYWkq4VMZmJIr6Ex9x
	 3jPU9dotVQrzhwgi/C0EQSPTNnqaQu+ViZC1i20hoWF7gQduXw57M+MsXJhITJ9V+6
	 rsZD21Zj1WE454JL7WO/3qDUrAlQuV+IM18SGHnZqVrE0EIJJvnZSul0wNgkRdgexS
	 gcWanPeiXZt4gsBqMbCXtYbLZ7XocKJNwASmJmw4G3IbzCyTXDoy/N9C35Ob/sAucO
	 crhkZc4/TNGrw==
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-64455a2a096so9181337d50.3
        for <linux-gpio@vger.kernel.org>; Thu, 01 Jan 2026 06:34:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV1svoR2kBtI8LxFK+gqilnz5Wa+wi1k4X2dJGx4Uw6W/fhO0BOo81J6xaMJFWnMBENDDGtrcVhz/3l@vger.kernel.org
X-Gm-Message-State: AOJu0YwqnlWZA3p8acaMdflesYXgTGa388bd+Yn9y/+I56Ow59441lR5
	GTrEEXkBoAQPPcKuVOX7f4Xg2Sgh9Oh6ugHbDUUinZD1fzdChio0QLNHFUAcDX3P+nZx4Mkv/qU
	Ib5XL7NjI4IYmMHHK0U4b+2gJzruAjRs=
X-Google-Smtp-Source: AGHT+IEuwPpLU6j9tE048N0Djk0oLF70SM5maQ2a+GO3o6GXjjIFNXznbtZsrDbH2SDpIUi60rv2RBsuKa/mir2emKc=
X-Received: by 2002:a05:690c:fd5:b0:78f:c1ce:edd1 with SMTP id
 00721157ae682-78fc1cf03bemr677785747b3.10.1767278042654; Thu, 01 Jan 2026
 06:34:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251219115631.218609-1-sander@svanheule.net>
In-Reply-To: <20251219115631.218609-1-sander@svanheule.net>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Jan 2026 15:33:51 +0100
X-Gmail-Original-Message-ID: <CAD++jLkN_9=jF1it3dBW7uMPqdriZP_MBj3eqw87XfJFbY0u4w@mail.gmail.com>
X-Gm-Features: AQt7F2qt83BaoZF2UNvp3emyQGZrdIDsBpWhnO38GP6gbfiEqf32whLTlcHSC8w
Message-ID: <CAD++jLkN_9=jF1it3dBW7uMPqdriZP_MBj3eqw87XfJFbY0u4w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: pic64gx-gpio2: Add REGMAP_MMIO dependency
To: Sander Vanheule <sander@svanheule.net>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 19, 2025 at 12:56=E2=80=AFPM Sander Vanheule <sander@svanheule.=
net> wrote:

> In line with other drivers depending on REGMAP_*, select the required
> symbol to prevent a linker error when building with COMPILE_TEST=3Dy:
>
> ld: drivers/pinctrl/pinctrl-pic64gx-gpio2.o: in function `pic64gx_gpio2_p=
robe':
> pinctrl-pic64gx-gpio2.c:315:(.text+0x198): undefined reference to `__devm=
_regmap_init_mmio_clk'
>
> Fixes: 38cf9d641314 ("pinctrl: add pic64gx "gpio2" pinmux driver")
> Signed-off-by: Sander Vanheule <sander@svanheule.net>

Patch applied for fixes, thanks Sander!

Yours,
Linus Walleij

