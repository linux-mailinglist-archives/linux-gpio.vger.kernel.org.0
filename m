Return-Path: <linux-gpio+bounces-23884-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 975F9B15347
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Jul 2025 21:10:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F6467A660B
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Jul 2025 19:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C33C724DCED;
	Tue, 29 Jul 2025 19:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="S4TrubPv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C0F34CF5
	for <linux-gpio@vger.kernel.org>; Tue, 29 Jul 2025 19:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753816214; cv=none; b=XMxfvYlhhKRZgEzQJljFigYW6nsijgoRptUNGBdGzEVqkp2b/lXvmxexSSli6ceCLvoQJonaAU2vZlroB8UsKahPuyfE9V9cAGMvlSlrryWpwnTrWDDxG75LyuDJdjVO6MpJBYOmm2y76ECDPMHF1QF9JM6yklsqVbyTLBmnji4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753816214; c=relaxed/simple;
	bh=gZh8ljut1hGoGNyKv+aXd2MxvgIj9E5doRM7TfIUD0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CmDAL1Fp88taOgqI2o2cuH5Hu9fE715ZervnBzwm18vmqgsDZzo7P78nwWoY3M6jFsmSOL0vlv/1P/wG6hnkXbubK3iWXoXo+rcTfJgfsN6ViUwJPfhaA2Cz7/lQeVyCdm17bQneyozXBfyuXuzGYENVf/n8swk1wGAJA4EhBO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=S4TrubPv; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5561ab55c4dso6187841e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 29 Jul 2025 12:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753816211; x=1754421011; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZh8ljut1hGoGNyKv+aXd2MxvgIj9E5doRM7TfIUD0w=;
        b=S4TrubPvPkGrV53uupK3v+KnEv5JZEMwEGTQ47sO6+UUddXC1vvDWNh9fIuX3djH90
         kmRdan9QAZDUuZ2bIaQ+4bRXyDs975mtQ4N65BTfdBjrqtPCJ4JmE5tR2pxIh/EaA7r0
         zUcpYQtNi5MLA3R6HLzLKCSjj7vylcZsKY7+R84IXPPZUu8RhiMqd6fLrC0GVv4/wjZs
         TL190zqcW1Kn2/dyL7CZ8PgYELApQkfdyDbH1a8AGFLwuJrZtRi8WOJX4FIZE3s7MGc1
         AY7brdXaFmU1pmJtK6ZCle5Qr5rQMq0PHrMcfRk1srSQHEcm5YB7Gxj8XCF+wYpfu4fh
         gGTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753816211; x=1754421011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gZh8ljut1hGoGNyKv+aXd2MxvgIj9E5doRM7TfIUD0w=;
        b=GYUF9CTTF7K4iEZb9oD9BBPB/JyCBVpNogg3jpupOYCRHyFLPnsmu9VD4L5Gjjq6Ri
         ovurFICEiEPlW7KcoqgbGrpRUIfVJW5xr5nJfz3mqwrmn4a1ZNgMUEyoJ80fjgNBaG1q
         hF5MxDUtY/Jv3YqakY7oQiA9+fS7FnT+6c/VWIaJzRiBd+gvce+e3MJVNoipTAAotYm+
         tWwcITVXR5qleV77B+QRZ5x3Ke7SdQx0a9tTBrTw1YFVP6gSvV7e7nJG/EF2X2YI9wQW
         Vr/F/QdXfJnFmlybwl4AXYMHWzV9m1myF5EgYI36y6bYIoNC8D8OUduZJ1wFoC4GfJ/g
         jNnw==
X-Forwarded-Encrypted: i=1; AJvYcCVPGL87cijhMeit5HHfkXOlLrDigF18DCN5ecHXvaCCSY35ydQHxEAVGA6KpnCXGibW8S57cte/uBDl@vger.kernel.org
X-Gm-Message-State: AOJu0YznkEzmBD+jzZLNZRrzPoYOcGeePiyZ7ABkRtYdT11uOYLIFeGs
	5OMSqsiip5vR/AgYxC3lRUmo18a0RJKwVsKErr+1sqAi8kft5pXN15UKg5n5FBOaZZVPY7TI/3b
	EJJ9XIx5G377odR5/tWYGqU3DwfvFxmlj6CsR0vh6rw==
X-Gm-Gg: ASbGncvtg4HMTA2gQXs2jKSwLQrav9cvlZ6u+4Pb9quOnrRKZApR3e8hADX4gpwAyqD
	c+gLsSMwAc5Y1Gu3KXZbC5l3Wo3dX1DPFhperiIpWqmROWLV25JqHIlQP5DSnEXmzJx66Czkn8y
	akDCsg1vAQP4MDxFZHC2lcNl7+NIqcEX86H3q8FMrbhyQh9bNQmoJ6jek9XUGJd1gYNo1+0FsAi
	VPKTg+mU10BsFK0UvLMB2dzR4x7zFJA/Ya1SSs=
X-Google-Smtp-Source: AGHT+IFjLccy85WmcIVxX8iXMCVZgbVynIqh/fxN/Cv8LDdpotCFZGp7YpefT04NgGb7HLgC5E0eAwYQX1WWl4vrQhA=
X-Received: by 2002:a05:6512:3daa:b0:55b:5a31:51da with SMTP id
 2adb3069b0e04-55b7c0620a6mr193225e87.40.1753816210554; Tue, 29 Jul 2025
 12:10:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <3367665.aeNJFYEL58@radijator> <13840884.uLZWGnKmhe@radijator>
In-Reply-To: <13840884.uLZWGnKmhe@radijator>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 29 Jul 2025 21:09:58 +0200
X-Gm-Features: Ac12FXzJ4Le_pN4OWiJEdYoeOUJ9EgHbsU3XKmT-FF7OdQllnVTNnKf4Hb8Q6Pw
Message-ID: <CAMRc=McizcAXjr9VNOQnga0P8HJ9aR+X7njnSPMb4Bc9GU7GiA@mail.gmail.com>
Subject: Re: [REGRESSION] samsung,coreprimevelte oops and lockup while probing SM5504
To: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>, 
	Peng Fan <peng.fan@nxp.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev, Karel Balej <balejk@matfyz.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2025 at 4:48=E2=80=AFPM Duje Mihanovi=C4=87 <duje@dujemihan=
ovic.xyz> wrote:
>
> Hello,
>
> Friendly ping on this issue. The issue still occurs on v6.16 and is still
> fixed by reverting commit 20117cf426b6. I have found that the root cause =
seems
> to be a bad pointer in gpio_chip->gpio_device.owner, but was not able to
> figure out why this happens nor why this only happens when the IRQ chip i=
s
> immutable. Is there anything else I can do to try and get this resolved?
>

Peng: could you please look into this? I don't have a better idea at
this time than to revert this commit otherwise.

Bart

