Return-Path: <linux-gpio+bounces-28102-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 004C0C35530
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 12:20:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 596203BF33B
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 11:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 489AD30F817;
	Wed,  5 Nov 2025 11:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BnaV/dmc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A150302CB6
	for <linux-gpio@vger.kernel.org>; Wed,  5 Nov 2025 11:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762341416; cv=none; b=Lg4d+jz92tG1rgOV+AYR9ub0JPAdmgtvyR4WDOOwffVcFhMCQuVEqWvnw5rnfQJwd6W+aVSlBNsCGTclTtEjgC5AAxHF00ExIO/c6/JzXNgaMbqhfBpaEet2H1zsXOvp6wnrWr6USqeWWwNym98JXbymtH4h88Nt8qFKOKVYrj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762341416; c=relaxed/simple;
	bh=saldjFOUbFy0vrsys0GDe7EiE+em247tWnPIgjzLlW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aIMGUN28Gz5Ilvktz3OMY/eb5ewpLiaqtML2fiB9TKQ8RAPPV3U0Do67niAl7VMAIeoEXY79DXQ4P7HJy/rf415eYbURAqTNtndzoA3/te32IKCl1BPB/ovwptcMz2PeRC5oUpHLkWoO9cMvnG3zjvqvTWRmsSnkgUSkOBWzfWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BnaV/dmc; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b4f323cf89bso421515266b.2
        for <linux-gpio@vger.kernel.org>; Wed, 05 Nov 2025 03:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762341412; x=1762946212; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTF7DvLKPbjxj8wtbURsXuBguJh8nnY1X64Htx6feBI=;
        b=BnaV/dmcL5Oi9R3HrUSGFKq8h3/s07yzAdEllFfsGM7UVMeBfXQpa4MmauKHXc06gW
         bGb26EJ/6SNIs2n30LyQXVXZv2R21xLVQqJDLrY9VjyhkNJlRCKoOykgF4aOdUMJWlkn
         L4tqJWPCoJRXugCt99OURcCz7+7QifcLI8o/S4JhGIAmyjDz5s/32PQax1u98HOatIbX
         kJbxzb/cl3VHRv5QKcnx16FR5vJDvj/tKeKF1s+uQeGGPo/R0lbwfV99xW2rIfs1cHz7
         kGy5Pm50+4VzFzny2i8TdNqj64l4fkZDGGMtzYvboxcm4Np5rr6hhQ68lYNE8MkfYeos
         sMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762341412; x=1762946212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rTF7DvLKPbjxj8wtbURsXuBguJh8nnY1X64Htx6feBI=;
        b=VDYDGCkj4vRMvbnElwCFtTD0U4JgfupZmhnvW3DNZ0ik8GtnxynylHoxc/Z67OP2Kq
         tCgqG09eYdjh7y4ErWkgBm2/Q4knlAWiLiYzf2LOxDcWXxZRndEBOfUKS5ip/X4fstSm
         qPbk8e2tckcqXANzS7VL4pvO0/kD7qO6wT4+6KVCtNPrvFhjDbdiMsVfKaFe7iwadMxF
         A1y6a1wNwzTziDeK5tn/LiwP2YImILHUV6amfqx9AorOUpfmNUxK3SNj5G+8+suplKTY
         h9YRQUNkUhiTHpaei4h72SZcP1ib07KmXfCLKI31gxlowfCo4nXSzPkgk9q0zcj8uOWW
         tn5w==
X-Forwarded-Encrypted: i=1; AJvYcCVl09v1gPwn3YoenFu0mEi/+X93oEgG09/EKrUbUH9EoqE7tGn5DWOzcyfcDXL1GMsCWv/rRQH+LbSL@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/HIHz62TGrIUmYfrhb1uuMu7/RbyC+kaF7bn9Cp3nfV1JO13W
	HjYOIw4Vn90dMm3upudn6MRB/HGN9M1QZbwFstKej7G4A4SIrqv6T6uOmHNUQpcf9oVEJcUfs7P
	rEhddCAUAsgbVTWC6lJNmqfPX2vmuVqoZL2iF7fAOlw==
X-Gm-Gg: ASbGncv11M80R//G6AiBkE5RY76Bspe25Cy5MB0LmNAgAriau5ZlsQc8NRiYy28oo2U
	gzJYcUuUJXEd3hnMNg6RQdk08xE7h+0N4QiBaQLUaOUsuWTBNyQIY99udOSJE6TQnIb+TfO1Spb
	xv5OkBxVagSBNXP/ak9SzxOZX5HyErNfLw0D1hQTrue3MjxVnhDV25UOh/x50KCfPe93JOCbo9z
	NjVsPTlfKrMgzpUwroBICNP8khRgA7vlpXgckrg0lNNkiJfH3kFbnDPYwA16qLmdh7p80jhkD82
	aBTHyPlCyiR4On2ouQ==
X-Google-Smtp-Source: AGHT+IGUNnhrWpyEmbPXCObq3MbaALPyRfW6eLJvkMGh9d8tfDubqR6helivYq4se2fxdAEGgjMrTbApk27jvITBJR8=
X-Received: by 2002:a17:906:9f8c:b0:b2d:e514:5348 with SMTP id
 a640c23a62f3a-b7265587c24mr282789566b.33.1762341412432; Wed, 05 Nov 2025
 03:16:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251031111628.143924-1-marco.crivellari@suse.com> <176234128319.20998.3148035011153421288.b4-ty@linaro.org>
In-Reply-To: <176234128319.20998.3148035011153421288.b4-ty@linaro.org>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 5 Nov 2025 12:16:39 +0100
X-Gm-Features: AWmQ_bl2iHwLRhw-_ZWGpq1wrABuhpeUymsVotiCEBTNnR5y2JhagU7gLKQavp0
Message-ID: <CAAofZF5oX77jQeYZvAnNY1+Hsk-8bTA3yrfSUNi3f1Oi+2_y6Q@mail.gmail.com>
Subject: Re: [PATCH 0/1] replace uses of system_wq with system_percpu_wq
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Tejun Heo <tj@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko <mhocko@suse.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 5, 2025 at 12:15=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>[...]
>
> Applied, thanks!
>
> [1/1] gpio: cdev: replace use of system_wq with system_percpu_wq
>       https://git.kernel.org/brgl/linux/c/b6d31cd41814a33c1a22b8c67613182=
0440cc44e
>
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Many thanks!
--=20

Marco Crivellari

L3 Support Engineer, Technology & Product

