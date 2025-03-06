Return-Path: <linux-gpio+bounces-17202-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8987BA558B7
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 22:25:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65A1B3AC1E5
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 21:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6146272917;
	Thu,  6 Mar 2025 21:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y8yXhYxb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3103207E15
	for <linux-gpio@vger.kernel.org>; Thu,  6 Mar 2025 21:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741296313; cv=none; b=mxC6tjycaz/gFbVd/bBzDr5hQW3EPAGC+QmipnVYQIC83IZ7X5qkjJXEYgpkO7XQ/pWVnqJ8u2Hs5gYZAW/4oPkQtU5Ui/tRzF5G9t6pek4HZn2vVSG1kAEHjPiEfx+qwEr3Ob+z0Av61yWlzdOBsF5u7tMCYABTyGld10q9v1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741296313; c=relaxed/simple;
	bh=6nLUeGZBsOZaxX7lD0yAqrwnU/9EkCCEKqX2KbebjDY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aCC5BB0g0ZacenQDL4TpZ0jkMmiqvTdNzIIUQpWL6no88wGuuJW/yB6A2n5yN1feyUIKPRwZk6WWa6MVh0YAcaDNTZlh0Cw1W0vWx4eRAj94UsrsYe2iJoq51TxzS6IKx8PT6saQ8uN5qV805Z0O6KKKBLVaK+PvQOxNfgP1inY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y8yXhYxb; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-abf64aa2a80so221991366b.0
        for <linux-gpio@vger.kernel.org>; Thu, 06 Mar 2025 13:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741296310; x=1741901110; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6nLUeGZBsOZaxX7lD0yAqrwnU/9EkCCEKqX2KbebjDY=;
        b=y8yXhYxbNasZPZMGQjweQq91JrwF0qwIqKnhDD00CsLW1+uxQB96aHu+/RgxhmQSyY
         ocaQgUQameDnuXFZnKF53BOYjaCdlipwjqg0e4znaayu/EBBoiS4qIYFN0Kz+bfvuPAz
         rlyEmStL4Fr0rQnC7O+dx3Jzqfcvs3t23rGiqtMrtKpJs5Srhr7RkcgkXI6GsbHZjyTN
         5TV6gNy3GffpoEtc7HPbxSCUxOkgp5Y/PXiqB4pvr81Jwlcl/4ThuqsTv8Cz6c5JmbHA
         xPGVmi+wUAV8Om/qWkYPC4VQJBgMRtrYgSPSddxu1KfJ5IgQbEOlnGGIZPr69EdZPBLi
         ST9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741296310; x=1741901110;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6nLUeGZBsOZaxX7lD0yAqrwnU/9EkCCEKqX2KbebjDY=;
        b=cdZj9M8R2Fz+9z2hHUZG0qrXfzCC4L9Z5DyR1PpBCoTAft8syg21cu4n/9zvCywwX9
         dCWUQYcocW4lbtDSOkCu00sMFG8IcUYJd4oJ5jgd/gygP+sSoXJhvIW5MeyuM9Ny5O2r
         47L9mIA+eaV16HO4ufZ57/b2/ho+vsj3oM/+4PoyLuepu9OW4xLcJnbcsIsknpu1hynT
         lcGKY6jAu0FhlQ9BeCtjymmuugEYkiqmtTCEQezlwsjz5um2N1PkYWOBKDk7A53q/ZTX
         9NtNf8PMVtmXJbilXIQ3t182t/dxDaQeqj2DiM3vXg6ScmdozNd8lLVgLmlZQT9hQ4+F
         u1Vw==
X-Forwarded-Encrypted: i=1; AJvYcCVfaxmZIELT686yuSFrjIFS4nhH1yXmqvC2sHTi5c+zK5eL6VqAsGKyea1K5evzAJs7hjS3MgpENcVY@vger.kernel.org
X-Gm-Message-State: AOJu0YyRFV3qStS8UR81BS+gukbu1ptUk7h9ddpNPIbZ6FDgGliA1/ux
	3s2P2BvXTLbzq8k5tU56FL/9vK5L9lSwA+8Ontrcx4a4mMK9Sjbpg6jCLH1idr0=
X-Gm-Gg: ASbGncuktwiRr0usWgRFii5QcLbBh/hIfT7c19Mnl1P95CU12yup6XaYvUi3vmNNA0A
	RE7D4S0DnIcSfue17OBEAg83L5XsnrZsd2YYTLK/1WaMBl5sUXiBHK7O4F7Wef6VpiOpdUb5uea
	ItKayibtRDuq9A0cxjRD474hKqqSk4r73n4nrGsmJHc4sio8havNHGGznzqwfZ7dw9PSgnkIOqd
	PD14MLywoSyk87jsR/e3VPrupGxeGZCHVq/1+Rm6qmffwC2mLgo7XVrHP9pybJzDozdt+ZrkkR0
	mIXQO7aa6X6f7GXHLStLD71nXz+7ThQrXJFw3N0UTR1GlNE=
X-Google-Smtp-Source: AGHT+IEfkrY7UVJaq0/ND9NEi5g0hc9ml44W1eaBzgh92FLmrsjRrsJKvCEmtLb9GKZY9TgjXouEaw==
X-Received: by 2002:a17:907:3f9b:b0:ac1:ddaa:2c11 with SMTP id a640c23a62f3a-ac25210ff7emr88036066b.0.1741296310064;
        Thu, 06 Mar 2025 13:25:10 -0800 (PST)
Received: from salami.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2399d7da1sm156779066b.174.2025.03.06.13.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 13:25:09 -0800 (PST)
Message-ID: <2c1cab545cd3b57a2155df2e87ad9830b2b94ab1.camel@linaro.org>
Subject: Re: [PATCH v3 3/4] pinctrl: samsung: add gs101 specific eint
 suspend/resume callbacks
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski	
 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
	 <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tudor.ambarus@linaro.org, willmcvicker@google.com,
 semen.protsenko@linaro.org, 	kernel-team@android.com,
 jaewon02.kim@samsung.com, stable@vger.kernel.org
Date: Thu, 06 Mar 2025 21:25:08 +0000
In-Reply-To: <20250306-pinctrl-fltcon-suspend-v3-3-f9ab4ff6a24e@linaro.org>
References: <20250306-pinctrl-fltcon-suspend-v3-0-f9ab4ff6a24e@linaro.org>
	 <20250306-pinctrl-fltcon-suspend-v3-3-f9ab4ff6a24e@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-03-06 at 20:42 +0000, Peter Griffin wrote:
> gs101 differs to other SoCs in that fltcon1 register doesn't
> always exist. Additionally the offset of fltcon0 is not fixed
> and needs to use the newly added eint_fltcon_offset variable.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> Fixes: 4a8be01a1a7a ("pinctrl: samsung: Add gs101 SoC pinctrl configurati=
on")
> Cc: stable@vger.kernel.org
> ---
> Changes since v2:
> * make it clear exynos_set_wakeup(bank) is conditional on bank type (Andr=
e)
> * align style where the '+' is placed (Andre)
> * remove unnecessary braces (Andre)
> ---
> =C2=A0drivers/pinctrl/samsung/pinctrl-exynos-arm64.c | 24 ++++-----
> =C2=A0drivers/pinctrl/samsung/pinctrl-exynos.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 70 ++++++++++++++++++++++++++
> =C2=A0drivers/pinctrl/samsung/pinctrl-exynos.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 2 +
> =C2=A03 files changed, 84 insertions(+), 12 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>


