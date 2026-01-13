Return-Path: <linux-gpio+bounces-30475-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DC3D17F06
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 11:17:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C9E99302DB03
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 10:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9479E38A9AA;
	Tue, 13 Jan 2026 10:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mBVUq+kd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5610C38A735
	for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2026 10:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768299436; cv=none; b=TQcEE6fBx7YqDRfcu2PudSkjui72rGdVYNvIINJzoXzmgteC/XPA+Ruc9uuc4g+EJZrAYjaty796cltQv5kNyOrNC9zoLs3bsaR1mB4k2CKHQTGfcp63YreM+UlIaUSdl5q5FCN5IZeLdle++I3VIMxZQTnVx1AB3Wthpqnorjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768299436; c=relaxed/simple;
	bh=bwhZZQmXnabGqrdZjcHRlc7ZAq93Q3ixLgelXAu6j3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TyGwiziUxNEGJBdiT2W5UKYsRqOCw8uLbwHy5cEfbdL13HtBREApxb/WmPcrn7XDAfKZd113dKhH5ShQUYbAzx+Xj6m161ksvdGcvxyLqNrnnNdsP9H+Kn5EB4/c49sm7v1T2Mk6VSo2jpEuYhXz0H1CdsOzSjr8K4Civp2y3Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mBVUq+kd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 025B7C16AAE
	for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2026 10:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768299436;
	bh=bwhZZQmXnabGqrdZjcHRlc7ZAq93Q3ixLgelXAu6j3Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mBVUq+kdOfhySWL/wRxN5TCt6YrMAZchs+4JTkINNuqpNrfiR1CtBQnkXOEvzo63x
	 6JKN5wsjzyi1VDyrKG1XqxP/123jkhF0GwAXDGQ4+QvjkUDBNupf6q8QPj+O3XONEW
	 eL0+0KLSBf25f7/zrnQWKQT+Rhvy4wyCt6D8bx58SyhFVr1fJ5bDiSrsIjd93Mlt+L
	 3FOfSo3JB0OsCRz1Y2os80sT6Gj4JUs7hBRuEDyGQjBg491qJHn9fWxBX4R/PIgEpA
	 If561Pd6tMrih7lZ55quZmx6LR1NI/gB2eZehl1TDzZqUdABD/R1y/mLaj87Z2rqQk
	 2eEG68uUV09Tg==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-78fb5764382so77620077b3.0
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2026 02:17:15 -0800 (PST)
X-Gm-Message-State: AOJu0YycXpNaB1yieSa7IKZ1meURy5itea/27ZtbNdyocqoPjXvvIqAS
	q+Au5oEHbIz5D+QGtPiy/V94lOQxGjKW2ybhhrDM5l8Vgc/rVDGypQVXs8aeHJRf7mgO3dK6XRY
	d0yse73g3Yj6sAz2KMoyv8PdBlBbzF5Y=
X-Google-Smtp-Source: AGHT+IHNd/w/xd71dJxJ3SseZKPu8xxoGoymgbHup4tpyxhapfDWWbOVyUapnY8z90Tt845Vky3x5oBTtN6f0mV9WGk=
X-Received: by 2002:a05:690e:1481:b0:645:556b:62a4 with SMTP id
 956f58d0204a3-64716b5fd1cmr17853663d50.7.1768299435400; Tue, 13 Jan 2026
 02:17:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113100913.136777-1-andriy.shevchenko@linux.intel.com> <20260113100913.136777-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260113100913.136777-3-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 13 Jan 2026 11:17:03 +0100
X-Gmail-Original-Message-ID: <CAD++jLn_Nbx7YMhe=N-uop49hvCLsBm7jt6wmgQhctMDw+VRQw@mail.gmail.com>
X-Gm-Features: AZwV_QgdyhLBbQ8BMgOdyWTqaM9PjiQol09mDLzfJ_nbWYePnwXKDctcyBuazvw
Message-ID: <CAD++jLn_Nbx7YMhe=N-uop49hvCLsBm7jt6wmgQhctMDw+VRQw@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] gpio: pca9570: Don't use "proxy" headers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 11:09=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Update header inclusions to follow IWYU (Include What You Use)
> principle.
>
> Note that kernel.h is discouraged to be included as it's written
> at the top of that file.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

