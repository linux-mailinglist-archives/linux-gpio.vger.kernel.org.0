Return-Path: <linux-gpio+bounces-17199-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0531A55884
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 22:15:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D83A21712B5
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 21:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9757207DF0;
	Thu,  6 Mar 2025 21:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DsIj3VKe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72569206F2C
	for <linux-gpio@vger.kernel.org>; Thu,  6 Mar 2025 21:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741295725; cv=none; b=FCutWV76okYG+PiOb1MhTT4mIxznEKOYkCJI95LNZSrShtkotPCbk0IJkwMqN0T1ByBDEhaPFmDxmjzgnqgmnsXIjrjb9VAJq+77FZAByPbrEVP3FW+5gzBdLfjNJiO9DEcQ40XwamqLKiEXtAFf+KUENbELdx/J21YinnzpAdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741295725; c=relaxed/simple;
	bh=vEXvflwEV04efj6bnvhXaeOA0qHCeEgvrAzgI3xl7wA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XMdEe5gsrRfwMclF5Sh2T8dA4kkziMM2KcxqaACE35u3NSO/6ujCRZLmuPox6vaumpMt7qT/BBzxggx3ZWSMrP1Za+yWbLD2Fj+pTQEXd0ymoYDPdJv5j3Ye/8BiprPGID90P6ktChE2ovGw3AXgZCKt1KEe/e7mnq3YAH4rVkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DsIj3VKe; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-abf538f7be0so217001266b.3
        for <linux-gpio@vger.kernel.org>; Thu, 06 Mar 2025 13:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741295722; x=1741900522; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vEXvflwEV04efj6bnvhXaeOA0qHCeEgvrAzgI3xl7wA=;
        b=DsIj3VKeLHdEyUqNenk75PVHmr8R3bDFxHIWKbBzLV/+0mAd0/srz+KYSKWiz2/Umr
         8aP90On4uip1RVIyis5A7XDTvaQvSkbzaEsFTUcQIQiE+0wgi7zrAxcjbtOn+PDpwmYD
         1isxmiCG8AYjQBHJJBIfU4RTk4NnkTmz8bCK3tljJsgPH84CH1mTFV2ISaQpXFap0+QO
         5/RnMIg6CXAXtzsr2Perikh4yO9hvO3xyLEsOWR4AvnvoLThDXGaazwefn440UyiZhep
         +SRm5p59fyIZ5GLedeoTbF8R54phMghDPDnT/LDfVq6z6t56E2BjqzgpNmjyg+tijrfI
         M5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741295722; x=1741900522;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vEXvflwEV04efj6bnvhXaeOA0qHCeEgvrAzgI3xl7wA=;
        b=w0edHD7Ffldxm9/zXazY1slwrzDhGe8V7AJ2yvG0iRsJ/m886KMRqZGjDcA99JMDxe
         eCiS/bss2Fqwh3fJL1vq/bJRd4ZkrG7newg/7W7RA0j3Eviay9wMSh7IGuWurp4yvaO2
         lyuzJ35CO0+F/AqdF9KLQdvYeIFIhuYXcd3yP/cZzQG+rog1PfRZA1clb0Wd32GSueX0
         TxJnRxPJxevYC3YRRj/FLWgBKj79fkptjQher+sTyCVd3Z+wAjShnkSXopbjn6O1fEF7
         nwPo3a3myU3MAsozwzaZNTJ0TY28WzNFkfAXhnEkBbdCQuaSpnYMgBsaPlEwJcVwhBC8
         5CEA==
X-Forwarded-Encrypted: i=1; AJvYcCVrT+CwVQhWOIhhb83iJAVtRLPOcyEoFNBa6+2ZNzk4TK8vu2g4nHJREFInQD/u652FGv/L/Q6dCpm6@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf5Gf1Qod0wRtfnRQW9wvnasdq4q2zmV1YbeuB8sXvVwdnqypy
	R/sDjvAJnKC3o0VlrAzt7JifaSZYXMNd04oc6J9zo0dNUhihmGFQBB3jLttbKbU=
X-Gm-Gg: ASbGncuReWiWQqpBqrWm50uaLFmXsAhVEyzkLbIeMsT2SaPFWErTzWafsHnY3LIOgrC
	Cz61LJMigznTlNTgyqFSCnmzReuwzkxWyujwijWxN/oTbl7twgHZ9NY1V141EwWR5DuHbvdriid
	Ik+YITM8uSsTq8GaoJ2lOg4LQTIRbaLvrqS0fxr4/N9WtnDGRrLlT2zVl365GdrAZRrt5FeuZDz
	VrK/PIYBbD/5pm/ZMdOngr88uFhJK+s0Vpppq0Tu2u21UPqNh9fMY2HMhrnzuWhFPIqIUNWVO5Z
	4dJitpHP4bKm3YOEP9zJXvlabSu9c9YirAN0fzR2qQL8CmY=
X-Google-Smtp-Source: AGHT+IE+LHNfvlp8dFOhg8/hGQEzMaTOw9w3ZnSxV/FqKSm/TD4PkI2UTRYu6TY3+BOkP+WRqnVYGg==
X-Received: by 2002:a17:907:9490:b0:ac1:ebfe:fd90 with SMTP id a640c23a62f3a-ac2525980femr71342066b.1.1741295721652;
        Thu, 06 Mar 2025 13:15:21 -0800 (PST)
Received: from salami.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239887693sm152427066b.126.2025.03.06.13.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 13:15:21 -0800 (PST)
Message-ID: <1418fde488646160a1be14b2153e409488f3d861.camel@linaro.org>
Subject: Re: [PATCH v3 2/4] pinctrl: samsung: add dedicated SoC eint
 suspend/resume callbacks
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski	
 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
	 <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tudor.ambarus@linaro.org, willmcvicker@google.com,
 semen.protsenko@linaro.org, 	kernel-team@android.com,
 jaewon02.kim@samsung.com
Date: Thu, 06 Mar 2025 21:15:19 +0000
In-Reply-To: <20250306-pinctrl-fltcon-suspend-v3-2-f9ab4ff6a24e@linaro.org>
References: <20250306-pinctrl-fltcon-suspend-v3-0-f9ab4ff6a24e@linaro.org>
	 <20250306-pinctrl-fltcon-suspend-v3-2-f9ab4ff6a24e@linaro.org>
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
> gs101 needs it's own suspend/resume callbacks to use the newly
> added eint_fltcon_offset for saving & restoring fltcon0 & fltcon1
> registers. It also differs to previous SoCs in that fltcon1
> register doesn't always exist for each bank.
>=20
> exynosautov920 also has dedicated logic for using eint_con_offset
> and eint_mask_offset for saving & restoring it's registers.
>=20
> Refactor the existing platform specific suspend/resume callback
> so that each SoC variant has their own callback containing the
> SoC specific logic.
>=20
> Additionally we now call drvdata->suspend() & drvdata->resume()
> from within the loop that iterates the banks in
> samsung_pinctrl_suspend() and samsung_pinctrl_resume().
>=20
> This simplifies the logic, and allows us to remove the
> clk_enable() and clk_disable() from the callbacks.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> Changes since v2:
> * Remove useless init (Andre)
> * make it clear set_wakeup is conditional on bank->eint_type (Andre)
>=20
> Changes since v1:
> * Split code refactor & gs101 parts into separate patches (Andre)
> ---
> =C2=A0drivers/pinctrl/samsung/pinctrl-exynos-arm64.c |=C2=A0 28 ++--
> =C2=A0drivers/pinctrl/samsung/pinctrl-exynos.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 201 ++++++++++---------------
> =C2=A0drivers/pinctrl/samsung/pinctrl-exynos.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 6 +-
> =C2=A0drivers/pinctrl/samsung/pinctrl-samsung.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 11 +-
> =C2=A0drivers/pinctrl/samsung/pinctrl-samsung.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 8 +-
> =C2=A05 files changed, 109 insertions(+), 145 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>



