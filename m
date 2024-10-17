Return-Path: <linux-gpio+bounces-11514-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5249A1D85
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 10:48:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 789AE2815CD
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 08:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 450601D2F6E;
	Thu, 17 Oct 2024 08:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="clhXxSLH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB9E154454;
	Thu, 17 Oct 2024 08:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729154883; cv=none; b=tHcuQNzP0B/wmzelAmSnHAnguaTLgKEQt9bC4zkb/1I2JFbSbqZt+QznV+GZEOp31z+1q7EWuGAshspzEM0wSYWfO4t9HjzJzjIRvBRXpNIsYL9sW941un8PQyPW0KHcaTXsvJFzGE9TmAIWITg9pmeaNtz8ibuwiPuIgjRv8/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729154883; c=relaxed/simple;
	bh=s+MeVg3x7m57UDOxjqm6LcVJBnNVn1ki+uW1xlYsqTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sUOrUd2PShTmLLwgLkDyJmgW3df6l+RWDtDKJgjjKMYtWjV00qZRy5aPkYf+Gza7tNwQCzkBXaZ67+GG5uuL8JtWUogz4iDtk4LswvjPRV+kr6s+yHv83GTmUlQbQbeAsUwW3oVUZD5evNWfV1P7gjxpYpBiJUlD0w8GqgXc5uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=clhXxSLH; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-50d2d300718so239980e0c.1;
        Thu, 17 Oct 2024 01:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729154879; x=1729759679; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s+MeVg3x7m57UDOxjqm6LcVJBnNVn1ki+uW1xlYsqTg=;
        b=clhXxSLHR5yirp2a8nko38GU5fmVYmPqFXngQz15cq/DNXq8ig4PGIolV1lSxUR6r+
         uyTyApsyjLXZ9BKq7CKEQN7dmPDAai73N9sM2lQm3EIAH1cmNCI1OkaiTKkF+I6tW/9u
         hhgzEXncifWxpIfWO897Ek/2BkG6kFkvKfyAGSOpN6U48QxNq5sOIRmhaB8lXG5NVdwT
         U6zkaAN2+n8HbrpvGcHLX7QBXbDX66Y+Gm9D08GCmV5QKvJ2SNhEyzlenLAUhE/aXyl/
         kBSlvw9Gb3msoN59aqtQ6nH9O8XlFTNWhzc5iZ9sPZQy55MBCe7px/cpj12HYfwsBCO9
         HjAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729154879; x=1729759679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s+MeVg3x7m57UDOxjqm6LcVJBnNVn1ki+uW1xlYsqTg=;
        b=Uj20Yh2ZdmyKeIRyXN/GWPPHBwUqAOe/Ujaj21GWYrGur1hFeioUoekPm3Ao89P9PM
         oQaHhlqBwMvxsjiUbWxuoW0uqpKuUOgeMEzJ3zb52ZURg6w/MMpV8XmwLUaYfqbLFu0v
         e+Mlza9tCGX6dc5Dxmrw9kE9pgcjvnQl6nZMfu2eb/5dqAJQOwsBdyNzu+TUJmwwvb2O
         4/fwoz700uQh1rzuLcvakpX7uNiQRQbAIJjhr6jZx8FMJNIFte5iuzDaudQKTdDp38SG
         YgrKw3MTnmSyf3vzaJuwIO40bRrWOGYcJkJk7KHZYZM8UnbB6fvr0Sf+Hx6o5uQ3Usd+
         SYLA==
X-Forwarded-Encrypted: i=1; AJvYcCUYLNvTnk4HI3Lds9UdIKkOv6R98Xn32hS498FgdiTdPupqNitXmkJiQEXpOMxFkaToa4O91WLe/bQ2@vger.kernel.org, AJvYcCVPTb7K44GSIOLGu1dmeLrMWE54EkNiLn88h83IPRTiSIEiUt+bCg6RBlVBtgpmnj8OCE4MidHig5zqExd5@vger.kernel.org, AJvYcCWatKarmYiGo1jmr36IhyLNLxC4L7gjQowE9uEMWHT1uECN5n3TLj8uf6tTwKhXneCh++nP+IJVUAOlt8gUxoA9P7M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzU7b91SYqlCg71OqJIDjunS2DYn01P9mfdCW8ywp4hylA6tf7d
	uMKUbXN22OE+sD1LsZS4JdPkUl7ulftOU7S5hpm8GbfA/fL7ggXF2aOu7zXofQqvwF8JKjzxOw5
	Ge6bPEnYvs4R+XFUJV9RNYLvVNnnsc7Jo
X-Google-Smtp-Source: AGHT+IE7p4vBxhyKhMfPj9Zsu9KwmHOroZ9yg96PlQ/mdug1V3xaxP/4CYVU2s8CSkR7fJa+NSkXTslvVMVpxYnDbLc=
X-Received: by 2002:a05:6122:32c3:b0:50a:36ab:c788 with SMTP id
 71dfb90a1353d-50d374a2d79mr11483661e0c.3.1729154878732; Thu, 17 Oct 2024
 01:47:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015162043.254517-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CACRpkdbYF5WCy7yc3t6VSU8CK-MKpxQnVWmRE-YCSKJ1hJDkug@mail.gmail.com>
In-Reply-To: <CACRpkdbYF5WCy7yc3t6VSU8CK-MKpxQnVWmRE-YCSKJ1hJDkug@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 17 Oct 2024 09:47:32 +0100
Message-ID: <CA+V-a8vQYJKqxKkGtduFuT9865jscn61gTw-iQHcyfh9O_9UzA@mail.gmail.com>
Subject: Re: [RFC PATCH] pinctrl: pinmux: Introduce API to check if a pin is requested
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Thank you for the review.

On Tue, Oct 15, 2024 at 10:43=E2=80=AFPM Linus Walleij <linus.walleij@linar=
o.org> wrote:
>
> Hi Prabhakar,
>
> thanks for your patch!
>
> On Tue, Oct 15, 2024 at 6:21=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
>
>
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Introduce `pin_requestesd` API to check if a pin is currently requested=
.
>
> What kind of function name is this?
>
> Do you mean
>
> pin_requested()?
>
Ouch, I will fix that.

> > This API allows pinctrl drivers to verify whether a pin is requested or
> > not by checking if the pin is owned by either `gpio_owner` or `mux_owne=
r`.
>
> There is nothing wrong with the patch as such, but it needs to be
> illustrated by submitting it together with the first intended user
> and show how it is used, we don't add upfront APIs.
>
Sure, I will post the patches.

Cheers,
Prabhakar

