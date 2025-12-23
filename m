Return-Path: <linux-gpio+bounces-29843-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B504CD9E76
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 17:09:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACB223031CEA
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 16:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B40232C237F;
	Tue, 23 Dec 2025 16:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="acD1RMhj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BB32C159A
	for <linux-gpio@vger.kernel.org>; Tue, 23 Dec 2025 16:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766506174; cv=none; b=DeWH3s8CHEkwgFOjqEoC3PjOH2r9I777pryIM8BZ6+q5GmtfqfaQ4w2u1qNzzzDFnegu/p+tZNJsq4DZXsi61+gpx0s/hNmQkha4kVIwKAADqhvYvd5AWpfx2Fd1d53lHTMyV7AKvvOO/mp1OIvhVpYlttdweN1xukSEyZwk+so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766506174; c=relaxed/simple;
	bh=sYMwkmQi/E32TipE37W7r45ZiTnG1W6dlwO+cXCMkao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dYO3Cam/fccEW0OjvQqXMJR8nyuhWlh7qZs4A1Q4Ogrec27pRqQy3lE6ObWMuik+5WQYBLN80XUyL+E8aSTgioNYMmpSowBvsJIL1JSvppIN+i2xqv4n36Ud1NHmNk2jyS71/2ctmmcpZV7ICDP+mtN0aajeXKITK4yexWNBris=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=acD1RMhj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11C65C116C6
	for <linux-gpio@vger.kernel.org>; Tue, 23 Dec 2025 16:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766506174;
	bh=sYMwkmQi/E32TipE37W7r45ZiTnG1W6dlwO+cXCMkao=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=acD1RMhjEgNjFoA9eo0n/785A/eHP9gWVKp1hdpNi7Lxi+DNr4mzs2Odq2Mx+3w11
	 k7J2wYDBNACxzD9vMzcdW8nDyM3B7M4Yne4xcqEypuVl2L7ONnwhtk6IwpNQQ5bR5k
	 sHZtIDNdEsMNL6zl6bGoUcFbGGiIJgTgtVbMbsYJt5vwe74jnHp2uc8NqxicOyFVw7
	 9TanBSX5boV62BEXsmIH1PiPbvqnlkc00Rk9xjvRCjKAVlqCeE68NIYfrYRBtDJxGf
	 JWbTc8aUHv2IB8bHw5zHMg2NkPHFAfIGqW/anQ9hz+/jqnLxs9EzWvzX4irgQRXg0Q
	 H73Nxg6WFH5IQ==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-37fd6e91990so39064431fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 23 Dec 2025 08:09:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUVVxYUVVSTM/cFhSNhMZ9fLqOfvp6Kd+hxhNJJwhrc9KephY5nTwFqw5bDgu6hkeMK/0mRu4rm9Frh@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk8YkXc2yQO0yCmCyN8AoWNDfYWtBhCxAYZYkIR3Cy4PH5cxPX
	1K7RzqhhoFqEPc47IWl8lIJP0MJ9wuQM+vp5nBRNnjagO6GGsD6UIZNT+QJFrBDXz+lcTTdL7FU
	7122hv9hvcm9KFo0yl8LeA2r69GjTYMPXLlJ5d03IIg==
X-Google-Smtp-Source: AGHT+IHtyM9WAchHOUKa8BcWkk6VFC0AU430UdpcdeTckkiVBu3og6q0OXBdqhQ9LMbEPiz51SOcyAPtSXuVpi8n9Gw=
X-Received: by 2002:a05:651c:3135:b0:380:989:f623 with SMTP id
 38308e7fff4ca-381215e84femr49587261fa.9.1766506172719; Tue, 23 Dec 2025
 08:09:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223065306.131008-1-nihaal@cse.iitm.ac.in>
In-Reply-To: <20251223065306.131008-1-nihaal@cse.iitm.ac.in>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 23 Dec 2025 17:09:18 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mcsk3dHR9c99Muqqej789YzMmamLfays4LiTRV9jn=+Lg@mail.gmail.com>
X-Gm-Features: AQt7F2qSLmI91VVckvIzdx9xvf63VqFIL_4VpWX3rMCjnEOrhJn4HM4UFDy-9aw
Message-ID: <CAMRc=Mcsk3dHR9c99Muqqej789YzMmamLfays4LiTRV9jn=+Lg@mail.gmail.com>
Subject: Re: [PATCH] gpio: mpsse: fix reference leak in gpio_mpsse_probe()
 error paths
To: Abdun Nihaal <nihaal@cse.iitm.ac.in>
Cc: linusw@kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 23, 2025 at 7:53=E2=80=AFAM Abdun Nihaal <nihaal@cse.iitm.ac.in=
> wrote:
>
> The reference obtained by calling usb_get_dev() is not released in the
> gpio_mpsse_probe() error paths. Fix that by calling usb_put_dev().
>
> Cc: stable@vger.kernel.org
> Fixes: c46a74ff05c0 ("gpio: add support for FTDI's MPSSE as GPIO")
> Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
> ---
> Compile tested only. Issue found using static analysis.
>

Hi!

The same should be done when the driver is unbound. Can you simplify
your patch by using devm_add_action_or_reset() instead? That way you
avoid all the gotos.

Bart

