Return-Path: <linux-gpio+bounces-13301-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 639399D9FEA
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 01:13:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6182B23C4F
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 00:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B1FBA23;
	Wed, 27 Nov 2024 00:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TxLKd3SW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4428E28E8;
	Wed, 27 Nov 2024 00:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732666393; cv=none; b=g1mp7gzv+5SYmvnfynkQPi/KjB9qnvcNPiJnaj359NEj8BDXAxw33wOmYBiz5u5bYoWCIfnraMXk1IATaqwBmlunTvWT1xPSITcQMCoY2xu/x9eWQ5UG1Ho5B3KrxSjfLlUCEkHLF0JKOhwjcVmiodUQF25HyS2aJoLocl0oav4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732666393; c=relaxed/simple;
	bh=1s0GMdOaub6JZFEU/3kZ6RzEwRPZmYNpUF3LvYdjTPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kL9SRWkFyIZfNVK9giyWfliad3iY1/VWwfakNulvTjVmE5SnqiFB58OnVaBh3IDicRClUfTXuCcZi+JM/oyx70qpBEdqszr06WIYNalkebBQkYXkPgnbNNKGM8L2xrHvQ2aUBG227WFJgm0JpnJ0cVmhHE2hUWLSy+96QcTiIpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TxLKd3SW; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ffa12ad18cso72047941fa.2;
        Tue, 26 Nov 2024 16:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732666390; x=1733271190; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1mHAZtZY187R1tmVbvpFVMB0HrZE579WEANnpnfyzOs=;
        b=TxLKd3SWT32GNJmQSsiR8G0FTHtZVuG5Pp79FVhIb+e6oOcEm3KkW32h1SNFTyL0Cr
         mIAUkBHvfzqDqycWMq5ERL7hnn4sWjtqzhFWY0BKbHaL+Es39iX5OT6L5510XN/Ng0NY
         Mo1au+3fGIZRo1Q8VymfabPuRuQkx9dG8M4+s9RlDQVfyBYpqJgTYPDnzIkzwK0NgiVi
         cCJ9qCRSiY5DggoWw/0hbt8M9Y//hjgU0km7hxWAg+DppBnpIoqTxvbspbNSMLHJxbcJ
         ia0GTg5p4vFqb4+C09VNHV6Dy4D6/PivHI9zufG3w7TcZgXqtCS+1lN9vAL9O0pa7zDh
         +x3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732666390; x=1733271190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1mHAZtZY187R1tmVbvpFVMB0HrZE579WEANnpnfyzOs=;
        b=xSx0a57hh7YZDenRK+XdqyrqSfGDUZb6x7W6H6q8kxYjsWGagz0zFOVjSSJfu+2hlc
         8ILn4dG9hk1ozv+rkfl6MrpP5cRyXokAMw/DSKm+8W5Y6ZksCC2LYzaQeGh2zS28j0Rw
         xUBli7po/RrUh5Jjk/mHdt+p5NlHSbizuXTASN82/D19e5Rs/Pr6s2RYIa/UMw3HGgYh
         X9/dQCmvwfWi2gJZReNaIDEOmcK35U65QFpWhaY8bIBiHEzseD1Qrv6FvUamwLYC8LPM
         VNGMVf+9al8JC86gz72zM9YXS+VrGNHNu9L9IqNNAzqbRSw+XiKVOB28E+aI4sKNtyc2
         u7vw==
X-Forwarded-Encrypted: i=1; AJvYcCUP+EuZMtKtYRgydFpf2HWA5T8dKmRc3WhlQ7YxQ9c976+5dKCDcOAoMflOyECr/gchfuM500qDhmz2Bwnb@vger.kernel.org, AJvYcCVY+IgrbmY+EKut/kH0TlW4SKPO++vD4yBuGdQ+A6QaswQ7No760866eKgWFm5+tL98AhHBzTDnXXb1@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyb5dJ+zluzqlGp/2x+og5SU30VyrCp07t1T6jY8YT/TDlTu5A
	C0NtaLn9mKHO7R6uag4SLh1e5A9xmexkMK4AOCv10qox8MyK7i0lySA26QYsECDW+IuAFIscdv1
	KjAqm9gAYKJDH9PUzqMLBFtIr+3M=
X-Gm-Gg: ASbGnctkIW+4MFbFp+F1i3aiIuMh0sMOVSrbfPhp4SWUYCO93ISrvwTq+Y/UUfVnwH7
	JBcTjglUilWX2pk0FIcc+pYnqsUsarBpxkgnk6ty1dU9K0exMC3ihpGdChAt+w4Y=
X-Google-Smtp-Source: AGHT+IG8q8GRhyD6Rb04/tM7viMaskxhAL4cx8GuBAEbIRuca10p/iXJ1l1H05icicDUVP5+9Ae8JTKFG8Cdjh4SJgw=
X-Received: by 2002:a05:651c:12c4:b0:2ff:54f3:a91f with SMTP id
 38308e7fff4ca-2ffd60a5943mr4507171fa.24.1732666390097; Tue, 26 Nov 2024
 16:13:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240506-imx-pinctrl-optional-v2-0-bdff75085156@geanix.com>
 <20240506-imx-pinctrl-optional-v2-1-bdff75085156@geanix.com>
 <49ff070a-ce67-42d7-84ec-8b54fd7e9742@roeck-us.net> <CACRpkdaBR5mmj43y_80b9jd3TAqRWMdCyD9EP6AY-Y0-asz4TA@mail.gmail.com>
 <1ff005f8-384d-465e-9597-b6d5fd903862@roeck-us.net>
In-Reply-To: <1ff005f8-384d-465e-9597-b6d5fd903862@roeck-us.net>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 26 Nov 2024 21:12:58 -0300
Message-ID: <CAOMZO5DW3t-sof_uaFa_qJPE3WFq_155mFTxGMWh0m++csgopg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ARM: imx: Allow user to disable pinctrl
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Walleij <linus.walleij@linaro.org>, Esben Haabendal <esben@geanix.com>, 
	Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 8:53=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:

> My understanding (which may be wrong) is that being able to disable
> PINCTRL was the whole point of the patch.

Exactly.

Adding back the "select PINCTRL" line defeats the purpose of the patch
in Subject.

> Fabio submitted a patch enabling PINCTRL for imx_v4_v5_defconfig and
> imx_v6_v7_defconfig explicitly [1]. I don't know if that fixes the
> problem for good - I see CONFIG_ARCH_MXC in other configurations as
> well.

Good point. I can send a v2 adding CONFIG_PINCTRL=3Dy to the other defconfi=
gs.

However, after thinking more about it, I wonder if the patch in
Subject is worth it.

It can help reduce the kernel size for LS1021A that does not need
pinctrl, but on the other
hand, it will cause pain to lots of people who have i.MX products
running custom defconfigs.

When they update their kernel to 6.13-rc1 their i.MX will not boot and
that will be a very unpleasant experience.

What do you think?

Should we go with the approach of selecting  CONFIG_PINCTRL=3Dy or
should we revert this patch?

IMHO, the benefit of this patch does not justify the bad impact on users.

