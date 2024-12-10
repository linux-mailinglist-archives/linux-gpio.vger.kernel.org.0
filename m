Return-Path: <linux-gpio+bounces-13705-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F74B9EB126
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2024 13:47:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B556F16AB35
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2024 12:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2EED1A76BB;
	Tue, 10 Dec 2024 12:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="N5GTBVsG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6B11A00EE
	for <linux-gpio@vger.kernel.org>; Tue, 10 Dec 2024 12:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733834818; cv=none; b=Zt3dgUd9SWBgjxoHvoIblqK0Nisbdg0XRfJtVzGN94zD2LlI96zARPcLsWHGuW88AsRHvUZbcnvdMcIaf5hCvtKm774ray2Ky0n2Xdwqd8AyyAUSocXUOIQSz7QMQ3X72VcML/0WhvtXNSuSjLAjekMaAd7Zc5jSmaMVfXNzi/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733834818; c=relaxed/simple;
	bh=KX4EV3S5tpdSVPVaMW0IgVo/XNFVcw+zGMXFSjwdn4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EiRvtcvHODWNSN3ONUWlJNdDPuHeXRLFcZSyAETRuHWdOyFJsalmQBqi/iqxGmMK+YXHUrMGhZK2+Zl0KpIKLZPG/UrlpJXZTKebKLUtZ+qW4P3+sAStLy5g1peh9aU37cfthPFF/yuRtsBlBmghZyD5eWTOtnXlvr+czuB7MHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=N5GTBVsG; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30229d5b22fso16009511fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 10 Dec 2024 04:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733834815; x=1734439615; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q2gv17yRT4z0rHDfJ0xNPXvIsRkRnNe0DZfYlBqVB+Y=;
        b=N5GTBVsG2KMmwjiFXXNZANCiDdkUOMEhZXubJTwofUPnyPJfittosAC9P85mzVRcUH
         m1f6AVL/CWSwuJ/9xgi2NmpmQVIR9Yb32Nfsd7P6xqViG6WPfpSp5oCB/UsFnQkk9Cnb
         z1KIfeQUX1c0ob0E8NQmktlYOJTBjZlb+7YKZnCL9qrw3D1LUJuUBLeXxGF9aDR8alkp
         xmIZDjVBiYMtP6SDIvy559XqDYGBGWVQEscQOUVYL/uuqVKyZqI5U2p0I4dtUbViHixk
         WraUB39L/Av+uWRqoJfwJ6383htCur/3f9CAi1UskwuBuzUDkZnRB1ZEIlrdZLIJzCQn
         uBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733834815; x=1734439615;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q2gv17yRT4z0rHDfJ0xNPXvIsRkRnNe0DZfYlBqVB+Y=;
        b=jx7eZ6MnlqFVaw4ngfDnyW36XsMwWScmroRTdQkgFeJ0DtW/YmNh19jcQPOkHGMY8T
         ALcmkN8QpFYIgRZM7WdTWjwu0DJ5B9Iia/ydGRZSOg0D61TxoMiAc7AWzbY7P+azSh31
         gsZTGu6JRweN0EZ9VURrZo9eIbqoc0XtQcSNKfQkTzk9mEfFEdNtBSKwzXf2XhOK0F2M
         0Bo+PkssX5D3e3AFGv3Qz9aspYrx9c05Sc1pJeFvlI7e9izb2tbdf8NTpFkrXH0vQ9mB
         z/0EI7kzLelIBApXR7acrMxd7fTO6X3P2QHczbsWBCc3/O0EXLPJ229PsJYU/vTk0dDy
         +0nw==
X-Forwarded-Encrypted: i=1; AJvYcCU6BzBXtv/jc3f82/6g0k9DCcguXrTalcURTKpE4eoBvm5BlVtwdNwDXKBrCEB09kCDz5QLU5OCfQ/U@vger.kernel.org
X-Gm-Message-State: AOJu0YwFi5uxKT3LNTUBsW3m+dLZebt/oFJECmWoI0W8ngpGX6fxzkIl
	iEQJWQxfyrdgG9s2tlGPfGbXDXvr6QPBzrFktP3BgPtxkHUyZmznG9TGI21KOqGJDJ479+Klisb
	5NEIeYtTmFDZJtFOZY9vuWQuLn1iLOtA2HFx1cQ==
X-Gm-Gg: ASbGncuintjqCk34oFnx/v9nmEsbzNhQjmyxDrTDQHt1b+Og807Ky++R6+lFvuviudv
	0ntcKccJx8JVmH4jFMlqIKCcDxe3eDxVpm2l2Zv5NkyjQkb5Q2kp4NKF8ssuRL6laD44=
X-Google-Smtp-Source: AGHT+IGlGjnX41lf5nD3xaDqv4/+1zouMo9m8MDdOTdpToJj+sYN673kMGyE3ysEnuS7DFynzHplBUGfucHdrqsCYuk=
X-Received: by 2002:a2e:a163:0:b0:302:336a:898f with SMTP id
 38308e7fff4ca-302336a8a1emr6922311fa.9.1733834815083; Tue, 10 Dec 2024
 04:46:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210104524.2466586-1-tmyu0@nuvoton.com> <20241210104524.2466586-3-tmyu0@nuvoton.com>
In-Reply-To: <20241210104524.2466586-3-tmyu0@nuvoton.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Dec 2024 13:46:40 +0100
Message-ID: <CAMRc=Men4QM3a2rydxDYwLjJLYPB7Uid=y_DJ8YNa-So2H3NQQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] gpio: Add Nuvoton NCT6694 GPIO support
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, 
	andi.shyti@kernel.org, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, jdelvare@suse.com, alexandre.belloni@bootlin.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 11:46=E2=80=AFAM Ming Yu <a0282524688@gmail.com> wr=
ote:
>
> This driver supports GPIO and IRQ functionality for NCT6694 MFD
> device based on USB interface.
>
> Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
> ---

Looks much better now. Please address one more issue I just noticed.

> +
> +       mutex_init(&data->irq_lock);

This is never destroyed. Please use devm_mutex_init() preferably to
not add remove(). Also, the other mutex doesn't seem to be initialized
at all.

Bart

