Return-Path: <linux-gpio+bounces-18678-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B21D7A84B17
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 19:35:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C913519E1484
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 17:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81BE71EE7B7;
	Thu, 10 Apr 2025 17:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cBacS/ec"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16071A5BA9
	for <linux-gpio@vger.kernel.org>; Thu, 10 Apr 2025 17:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744306517; cv=none; b=HO55PN5g/sVpAGzOzo545VkCknkih1Gv7lKLXQxIp2zhiXWZOgJkpxVZA+zkTyVFOllBln5ipuNkv4I4hQPO07/pxj18rWpxGbiHJwV5HUx8aGYUz05lA9znZwFKVIBl6otexgGvDcQ4bX7kOA3Ybh9I+0ykQveMxJ3BAU+oRX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744306517; c=relaxed/simple;
	bh=Bs09UnPrR/yEx4vgkFjGsVxDCNklQut3d22B0K98sRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=In7NsIZavMIO4HFsQam2QDKA8bqYuDtz1IEFG2TQlZtQ5ZsyRZGVlhmKUCj6BrEpByigaOFkQTBDtudpOCSzKUabOPfbpE7ER/u+qzuhGdJYGXO4nf759ceu8mxUAMWzdUW+5RDwth2/OTaxxoCu7z/f9Iln+OP5GWWWmCLsr7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cBacS/ec; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-acacb8743a7so45538366b.1
        for <linux-gpio@vger.kernel.org>; Thu, 10 Apr 2025 10:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744306514; x=1744911314; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bs09UnPrR/yEx4vgkFjGsVxDCNklQut3d22B0K98sRM=;
        b=cBacS/ecYLx3cXWBWGFNbS+gts2VZ+d4BEbll7FFupJxYPYMwkm/oWOLQwsNH4JWw2
         9Zr7hsoiDMK+ulLm59Rm0SvHf6T0SlCuO60uQZOxbq7SKCbkkUIAOXJr2ExJ8f33h1SG
         UhojmV/5xqCFjLTbXF9IUDWkholB93J3iL9wZdSFlKC68fCa8KOS3jDirGVSQ+9N1tP8
         /Uenjo3hOevxMn4zUHMpik5njfgx+lTpzN3sbP+OTRJiYQ1l0NTdFyFmYxcDynPu0nat
         X+9wPu0JU0VTDS5HHg2YS4SmIz74BYS4SMrrBmrcX5rhwNj4OgCh46chjlwt1MS6wWZ6
         a99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744306514; x=1744911314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bs09UnPrR/yEx4vgkFjGsVxDCNklQut3d22B0K98sRM=;
        b=C/1N6QxlPZEi52EPeT8ZNvPkc1EfSxHznGNNzWTr5afuwNmJxHNyM4c1B1NVhsBvvB
         Uv6boS/SdOtrWoqh+wcms0b/fn2V7Cg6y+Sr6uYHsCDqacxKofKTQ8HGBNLZXatbFTrq
         yP1SxATdNfcEE++qJRSw2dZQiazAfsjR86sTds9Qvkzs43go2v5ZMDX4qLSGoGaGaaim
         9uQfB/WuhmaKIbq9pylsLJru+Bc1dSXw6V6+86HGbd9gk8K3aAg6AJFIvu0f3KdRJHG5
         qS3rvQ9d7ku1nX4C1jwByS9wqb1o18t9hgNwfENVy3ha1yePZDF5TpUaoddXoNn42cnt
         Qeyg==
X-Forwarded-Encrypted: i=1; AJvYcCWbC9XUBlsrOg08Uwp8VkGDPhtb8qEyIBsQ7WXQPwZhGPbR+nDj3w0R7I5V03Pp1+n2ffDz/St7L0jx@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3rETRdb9O3Z8R6By/iidQ2ji2Lw2eZQ66Y55cEOuxLW5tmDIM
	Gxeed8nmIGZ7xXO2yfR51DOtYwycg+X4xkuvySkpMRDG06DjD9pGiGBBd1Qy475WnbTJeFWy6B8
	W7JUAYkHfV/qabjqfa2E+iHqRpNU=
X-Gm-Gg: ASbGnct9dOpB2qPaIU3+j4x1ZFoKOlTYR7vv6XoEEMFAKzck75VR1WCYDkbU/6bcrKU
	rcGKKXgvyeEILS0Gu/gkzK+2g34wgRnvAqe8pyHQja+Mb5IMwlec9dYOkzU8hIKTxFxwWlcW/vh
	yP4eJYMPQ+ipfSFy+ZEpFqyg==
X-Google-Smtp-Source: AGHT+IGSLgcQNZjvKOwvV7qjIau2oSiGqwFYsjas0vWycrEcWco+ZhbKfCTJW2yVtpa3kGyQ7+gN873cu1ig97w80es=
X-Received: by 2002:a17:907:86a4:b0:ac7:3929:25f9 with SMTP id
 a640c23a62f3a-acabc6c510dmr347478866b.29.1744306513642; Thu, 10 Apr 2025
 10:35:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410-open-drain-source-tests-v1-1-a062d2280cc5@linaro.org>
In-Reply-To: <20250410-open-drain-source-tests-v1-1-a062d2280cc5@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 10 Apr 2025 20:34:37 +0300
X-Gm-Features: ATxdqUGJ3MU97PsD3HT0IUcHzlbyKiJWFgyCHsXV1b0UcYOh_zi5gX6JQzoD-LM
Message-ID: <CAHp75VfMPGiv-oZb91OAr31GWtXKefu72syp3Gjods3r1=827w@mail.gmail.com>
Subject: Re: [PATCH libgpiod] tests: uapi: add test-cases for open-drain and
 open-source emulation
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>, 
	Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 12:17=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The kernel GPIO subsystem can emulate open-drain and open-source by not
> actively driving the line for active and inactive output values
> respectively. The kernel does it by setting the line to input in these
> cases but this still must be reported as output to user-space. Add new
> test-cases that verify this behavior.

Thanks, that's indeed a good idea!
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

