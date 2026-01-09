Return-Path: <linux-gpio+bounces-30323-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D0AD086EA
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 11:08:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 598EE304656D
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 10:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D822B2D9EF3;
	Fri,  9 Jan 2026 10:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QfR7wV4L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C68329390
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 10:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767953312; cv=none; b=P9jS/Tn3Usaie6k7Ydl9AiyKCYaK2C4U7EYv41B0j3Zi61ibf9GkgQkhgBr1JN7cH4/3DkkCHeo6qNJ6XHfhO1gQ0ooYqn7F7u65hCBT6pFnKV15Ht354fTjs1KmrQq7Wj5HQRSsKvpmL6Nx+LcRGDrmrPlO7JZ6XCctGyv2YvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767953312; c=relaxed/simple;
	bh=lcoaRbKgklCv5Ozju9D5Y7iqNxDrXNBFR4KGkZu7LFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ApwNxilMrYXEahv4g5JKcFqlHjxayfhNZQ5vSmp7pedoZ/xIpFPc/WGfCjN7eeVJwO05k6IF0Y5CtUjfC+/Lq60nY3tbLFPk47LWGE2JHrZ8piF8uKpKHU8WjOrVt2OXmwfKzyY3/F5elALNYfyn1v1FexlDBO+HrIMu4k187aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QfR7wV4L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ED95C4CEF1
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 10:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767953312;
	bh=lcoaRbKgklCv5Ozju9D5Y7iqNxDrXNBFR4KGkZu7LFg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QfR7wV4LCKCZ71Bviyeg1ReRgFfkg4ECZHlSGg4cQ59wEtcs+rUMaoW65y68JEOkT
	 dTPW8ymtjnYY6JOaGuhbGn6//SQk2H/6JVhzYHH8qmtj9Z4bjqCCaGPl6dLpbZVOyd
	 ahbPjArUUHascpMGNgXWrNX8rUX3J8qdTmuEO7ZSqRlvSuu12QwMUku7+zKnCuf0oK
	 U0Tma5BAJn6gGybTvGTirKmlssR13Kj9Lxgy/pu69aCM7lS6pIvZXPDEAbfX3kx9DZ
	 D3fnI8b7/lFGY7vGx9sHEglnTmOE7PUHlby48sRETXnkEHVWbAHe9ycUO63kwYWRh5
	 S//TvkbwvSpJQ==
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-64476c85854so4043201d50.0
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 02:08:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW82FrXnyjsq/XWRd6GWHzOuClnfuqkPfImU+GlsyLDeikauW1+9Wbuoc85mI0PUj4x5FaSvTkS4bxX@vger.kernel.org
X-Gm-Message-State: AOJu0YwgDKGho+UAIVrBOVlAEqBjCvIKVKA4hac70Oev4zFultYEB08y
	H5GRkH0r+cvBVOZPw6iOtDzCtyq8DOPi/udellg8/UGSMGaj0zYTlzDQjwR0O2r5u6io7RqCbLR
	fL5criQ6Dsnbd9nVuseKsoC0YW5WPS0E=
X-Google-Smtp-Source: AGHT+IGIW2mkwPPw6w+QEaIPPoKfaOq7IWYJoIsilzo67O15ekgszcApUy3fF8Eo0fIrT+0A1VkZqkjkBbHIdWaHSgM=
X-Received: by 2002:a05:690c:e0d:b0:788:201c:a170 with SMTP id
 00721157ae682-790b58002a6mr177660677b3.42.1767953311626; Fri, 09 Jan 2026
 02:08:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260107093125.4053468-1-ernestvanhoecke@gmail.com>
In-Reply-To: <20260107093125.4053468-1-ernestvanhoecke@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 9 Jan 2026 11:08:20 +0100
X-Gmail-Original-Message-ID: <CAD++jL=VQXxZysUMqLOQC8ayaqvuOZe+mWGLvm6o0T9F+2UjGw@mail.gmail.com>
X-Gm-Features: AQt7F2qux-sXrQnOjJuHEmhzwWylBmv0KXQdTBvBJ2ldt0S4sCYy6As4TJM9SyI
Message-ID: <CAD++jL=VQXxZysUMqLOQC8ayaqvuOZe+mWGLvm6o0T9F+2UjGw@mail.gmail.com>
Subject: Re: [PATCH v1] Documentation: gpio: pca953x: clarify interrupt source detection
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 7, 2026 at 10:31=E2=80=AFAM Ernest Van Hoecke
<ernestvanhoecke@gmail.com> wrote:

> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
>
> There are multiple design tradeoffs and considerations in how the
> PCA953x driver detects the source(s) of an interrupt. This driver
> supports PCAL variants with input latching, a feature that is
> constrained by the fact that the interrupt status and input port
> registers cannot be read atomically. These limits and the design
> decisions deserve an in-depth explanation.
>
> Update the documentation to clarify these hardware limits and describe
> how the driver determines pending interrupts, and how it makes use of
> the PCAL input latching.
>
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

