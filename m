Return-Path: <linux-gpio+bounces-30447-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEDDD11DA6
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 11:26:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E9FD30D614B
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 10:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 188DA28B4FE;
	Mon, 12 Jan 2026 10:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YLNlIlr8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D088D28C866
	for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 10:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768213326; cv=none; b=TPkIBwrY6Mk03qnLfV7AwJX8PW5JOUly/pR274Lwbwyvv8zadxDgBVxrU8iFekmkLQehCBL3DkgnWUCNZmRVSZPeUFo0vhvWM+/9T4lwF2oK2Ypa2qkELhIMruIcGpaKk+zY0zDFY7/QSbRwfMjvEW2U0TTNswPWofMR88KEtA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768213326; c=relaxed/simple;
	bh=o/8sHaZC4LX0Y69BR6kSK5B7mTzYLr0hcp2Ggl+x99Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b6AeC9qYd99pxUBJe7AIkKWRJQ4Uc6Err40TE1DvMuQMjT76v5Amy5Exou1MJiyzmwKNQcemTJph+kKbLoiBb0kZpfwIzeUqChv5BnokhTB5Z00GFR9BRP7tO3DVlCwdXQX7WEg024abPSwsPPhCbhBFLah/PKKqgGKK3WvHFmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YLNlIlr8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B73A3C19422
	for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 10:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768213326;
	bh=o/8sHaZC4LX0Y69BR6kSK5B7mTzYLr0hcp2Ggl+x99Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YLNlIlr8ZdsfPxlZb4V2g3vHi5xKz5WnZBjZrHra+tDZeJIGtX9QGehj3PIvHtUUw
	 N0aJ2ohdw9a1Kbzl/Q/Md/ny2YRISd3Daaeh/jEphQQft71L0LryilnBPoZKjsVSqv
	 oZWIkLHXFX1UU2C3u/pg4oaE8IVVsJEX5U47UPKKn7Gs990jp/+sSuYGQDKnLyzpeo
	 Rniz43bt+dS9mJ23T7xoESubI4cFx7zDjXKJ2oT/LnIj6b+FwiUvY2WrLAWyhG+P8Y
	 wTAlm8Vtn5HxkrliBohDUidjmLBQ5K+T9ryL9rxAoEJiQRhSazSzyY/8OUc0Jax4aC
	 /5yGZvFRD/n3A==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-79276cef7beso12201207b3.2
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 02:22:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVJIWzqcTqXtXyCF35//ZFN61Wdp8McoXuWejxa+9myIufMrhyLJsOtK7g4g/4lZPe1EIZoIxJQArMe@vger.kernel.org
X-Gm-Message-State: AOJu0YxZmH4BUK0FqE4qmGrH3gJPHDeA8gz7YiZazB8mtfQVmykaftCW
	hHjZfySIcmZkajJP0QgPWiQB9y4VITvroR3yGpndXd2CQyCDYDEvCNyKjILMOB921I3CnreN2n8
	PGgz59DJqkMFfUxzKvTpj0sCNcA4n62U=
X-Google-Smtp-Source: AGHT+IG10dAfDMFOQk0v7FHCmD2QtEm6fE61VFmVKvB/C+Cjp7U6cGxcBWoDjGWykO0wptxFXdTI2qoPbVNR6dMCGbM=
X-Received: by 2002:a05:690e:1446:b0:63f:a2a7:8f1f with SMTP id
 956f58d0204a3-64716b20497mr13720070d50.27.1768213326081; Mon, 12 Jan 2026
 02:22:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260112093651.23639-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260112093651.23639-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 12 Jan 2026 11:21:55 +0100
X-Gmail-Original-Message-ID: <CAD++jL=kzRUG2HBY4UOfHTHcs=o0eQ0z0QH+HdDvP1qt08g1iA@mail.gmail.com>
X-Gm-Features: AZwV_QjnYeUPWd-VqpU-592sAxkfnkM2opqyItPqWOyibo7T4VbGaYHH_ZlAnx0
Message-ID: <CAD++jL=kzRUG2HBY4UOfHTHcs=o0eQ0z0QH+HdDvP1qt08g1iA@mail.gmail.com>
Subject: Re: [PATCH] gpio: shared: use device_is_compatible() for reset-gpio
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 10:37=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> reset-gpio devices now can be identified with device_is_compatible() so
> use it instead of checking the device name string.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

