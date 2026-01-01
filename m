Return-Path: <linux-gpio+bounces-30029-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B37D6CED765
	for <lists+linux-gpio@lfdr.de>; Thu, 01 Jan 2026 23:35:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0D79E3004786
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Jan 2026 22:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F40B930AD1C;
	Thu,  1 Jan 2026 22:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ARDQFd3m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B496130ACEB
	for <linux-gpio@vger.kernel.org>; Thu,  1 Jan 2026 22:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767306953; cv=none; b=gC5sqotY0Uz4JFSC4kzJc53M8zhqlgcT0bvg3bsIBlQaCgjUSDZGUKyLXAJA4M5eH063Is5f994tmYwM59Sx579ZQbHTkoaW2N8iGlW2KneWeO5vd+XBEiQ3d4zAUDTETMsp97d2g6Ci+jmPT7hX/yLDYFY3kVD3ST1eY3BI74U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767306953; c=relaxed/simple;
	bh=QMvcHOsvbeq/KIs3IJ0EOSwRJPyItWeiXV1rTu2E8c4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fJu3fu5OmwE9wzhQxzBoMGhX8AbTEyaUwEyhMUItQ6JMfhuHyR4iRL4injtD/OnLJEAcbPjS3Ex+PbMcWLlFTxG4aiiOq3+OsWpAn1SKfHkqCkN6nlsovBRl881W21uGkwEMJ5kHeMk0g4gaA/WJBwqvOE9kI/QDvSDMXEdj+I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ARDQFd3m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60502C4CEF7
	for <linux-gpio@vger.kernel.org>; Thu,  1 Jan 2026 22:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767306953;
	bh=QMvcHOsvbeq/KIs3IJ0EOSwRJPyItWeiXV1rTu2E8c4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ARDQFd3mCt2DaYFGg/b/9e2OzjeJMyTHTfHfbHc1gRltyJ+nwAybteBDFXStaxlkQ
	 2wF8HDOShZoeylzP//GZdV7rN7IcdUoToWPwyoQxigyz5AJSe8kSDnCaLLiJgEU2/E
	 8ENinOEu0Y/Gjwf4nZCARWwLwW2h+OSR8+VaR74byBckfg8NbON6CgwS0bRKKWjIlf
	 6FVSMTDeVW1ob4uPpC8oqfG/vQorNXwr76zfrmyHfx5pTDPnQIuLYDxa4cDKWBlOV8
	 S1Nd0uJqmCRtoULiLAXYSSRPwlwVUfgy9Xyec4qyb8YCazElBH61ML870G+uuEgz4+
	 mxHWn2dP9G8LA==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-78fb9a67b06so90589087b3.1
        for <linux-gpio@vger.kernel.org>; Thu, 01 Jan 2026 14:35:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWgGvCfuha+mJRJ4OMGKXdCQzl15bmtaI462CaIaHqXzw0OjvBkmfpAuD47rP+UOB9Mx2R62pPAtjC3@vger.kernel.org
X-Gm-Message-State: AOJu0YwinoNLmmZ7G182FXT9lpAbXjo3ldhDX+8wkZ9nKLYCghO3noxa
	kFOUq0/OCuXZzcQvqhBV9HCGrO8me93PC9JFk+LLGmjYepOCX8M1diD5VtOFaoNpXR7V9urVhUd
	4XW4DUZil7uKaE8SgXj3mTld4ZYCagDs=
X-Google-Smtp-Source: AGHT+IEbScPl11Wd17XFYMap12LvzWfJ4p/Vjq8yPw63OOIA+tKxG0Z0war/aoElpBRNBkuJ5ynYi3FD1FVnyPhQPxM=
X-Received: by 2002:a53:e01b:0:b0:644:6c45:4ee9 with SMTP id
 956f58d0204a3-6466a8c4e2emr24775256d50.39.1767306951744; Thu, 01 Jan 2026
 14:35:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251219-gpio-of-match-v2-0-5c65cbb513ac@oss.qualcomm.com> <20251219-gpio-of-match-v2-2-5c65cbb513ac@oss.qualcomm.com>
In-Reply-To: <20251219-gpio-of-match-v2-2-5c65cbb513ac@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Jan 2026 23:35:40 +0100
X-Gmail-Original-Message-ID: <CAD++jLnfDotbsE8fz_xFK4RhbAUO_PXrDECgT9mgnCO3Ek92UQ@mail.gmail.com>
X-Gm-Features: AQt7F2rgsNyQ_sXrUoBKmwhd6vUxSgOicBOQWjF3aplz2un6xPpf3QX8VXVj1OM
Message-ID: <CAD++jLnfDotbsE8fz_xFK4RhbAUO_PXrDECgT9mgnCO3Ek92UQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] gpio: creg-snps: Simplify with of_device_get_match_data()
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 19, 2025 at 11:12=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Driver's probe function matches against driver's of_device_id table,
> where each entry has non-NULL match data, so of_match_node() can be
> simplified with of_device_get_match_data().
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

