Return-Path: <linux-gpio+bounces-30321-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B21CD085D7
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 10:56:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7CDE8302AACB
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 09:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20BDB334C2B;
	Fri,  9 Jan 2026 09:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rjH/mdA2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C2E3328FE
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 09:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767952563; cv=none; b=UcHdzVvU2U3/DQMQpvIRgBDfIiUMrpMZ4EaRaj/XhXcavM1/pMJbRB6WbbLkUgC87TDthjmQwNVTSVcxhwbQnr4w+Z5xizt/PEq7brCERpf8ubld900wTIZ0YLJAqFBeiucEBzm8XqmDGgBNdSuV189PRK75ig7srofeNEYVVqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767952563; c=relaxed/simple;
	bh=DSyNbAvOTaUzouhjCtVk/rpg715I1crhI66xNFxS4AA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EJD1qef5RFuhrTZ0URRTINKNnU7HAGFjkRY/FzI0tiJpseqrsFDRWkOQY08JkXlDcUJqEM/FR5roUhz4/qlryTZdYPjjU24zfmcXGTjLArrtYYWPk6+TCi1dy8h3RToe1oFBaOG2SNywo4QkBKwhjfTQdLBtQP7n4JQeqTi2j2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rjH/mdA2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8563AC16AAE
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 09:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767952563;
	bh=DSyNbAvOTaUzouhjCtVk/rpg715I1crhI66xNFxS4AA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rjH/mdA2srq8znT1uGJDItvQmegEyur3byLKEWO8jTkQlz1Ot2IvCPDxqu41XWSbh
	 Mc5/Ad5wfK69UN5idior2Z7GZG3H3CRIvvJn1yBBZZX9j6HG/akUN/xB6SSAPfoDRD
	 AirTojGgb0B2LPUPI70QcpD+6KPXkM7VLRwllEIXXWPsgKqN599GxGfwFCqs4tj8lS
	 6eog5dJO0zHjCVnFH1SsofRdorO3fIgfkA+T3G8yurYjwUq0pUH9V7x7qCbK7BNFPt
	 vAjHvTXb2f1uNyhGWTGs9oy9Q0PIckP74QX1w3QZZ7Zhkr6zYCBmQyXQ8LhkpDJNU5
	 1BCueP/70yj7g==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-78fd0cd23faso42134417b3.2
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 01:56:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUvgo1VrKfLqZq7OifX+qjMmsk2ztH61g2lJbsN0CuZ2RKipcFrHIrqlim2fcGl1RcqMx5zcux6M0Q5@vger.kernel.org
X-Gm-Message-State: AOJu0YxUyD/Am72YKttMAtLHlvYxSy3t5TrYR+RRJlMfI4JP9JaTfPqa
	0dmd5QiHTg3D8Wiwb5LCPs7AMLWuf9v0CzDl08iCGHuXJyCsL3tG4ZFc6Lvu56G24Oej+/3r1GG
	ebsYxLVOtXxTSfHcVCEZGtjxnAjK2Jl4=
X-Google-Smtp-Source: AGHT+IFgkGc+9WHxgyU0wVu1UsG1ytYJawwgRqc9XY8l1kbWk/e0y0zH/hKYorgli16modqWGQavb0cGATDvK51xbew=
X-Received: by 2002:a05:690e:1486:b0:644:60d9:7524 with SMTP id
 956f58d0204a3-64716c42c66mr7824043d50.86.1767952562943; Fri, 09 Jan 2026
 01:56:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109-axiado-ax3000-cadence-gpio-support-v2-0-fc1e28edf68a@axiado.com>
 <20260109-axiado-ax3000-cadence-gpio-support-v2-1-fc1e28edf68a@axiado.com>
In-Reply-To: <20260109-axiado-ax3000-cadence-gpio-support-v2-1-fc1e28edf68a@axiado.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 9 Jan 2026 10:55:51 +0100
X-Gmail-Original-Message-ID: <CAD++jLn6yp7rej10rLu2rXU5Tyr-U9AXr92qXha-MX382DNKrQ@mail.gmail.com>
X-Gm-Features: AZwV_QjOJWf6ERPWnlhe66TBqMc29KxRESN5EqmejvusCRWoi1K95_C9T7bF664
Message-ID: <CAD++jLn6yp7rej10rLu2rXU5Tyr-U9AXr92qXha-MX382DNKrQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpio: cadence: Add quirk for Axiado AX3000 platform
To: Swark Yang <syang@axiado.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, Tzu-Hao Wei <twei@axiado.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 10:26=E2=80=AFAM Swark Yang <syang@axiado.com> wrote=
:

> On the Axiado AX3000 platform, pinmux and pin configuration (such as
> direction and output enable) are configured by the hardware/firmware
> at boot time before Linux boots.
>
> To prevent conflicts, introduce a platform-specific quirk triggered by
> the "axiado,ax3000-gpio" compatible string.
>
> When this quirk is active, the driver will skip its default
> initialization of pinmux configuration and direction settings during
> probe.
>
> Co-developed-by: Tzu-Hao Wei <twei@axiado.com>
> Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
> Signed-off-by: Swark Yang <syang@axiado.com>

Yes, exactly like this!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

