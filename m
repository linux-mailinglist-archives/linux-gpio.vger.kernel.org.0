Return-Path: <linux-gpio+bounces-17497-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97821A5DBC2
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 12:41:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EE6E3A2EAC
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 11:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D7B423F371;
	Wed, 12 Mar 2025 11:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j7ONB6CC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5507923AE64
	for <linux-gpio@vger.kernel.org>; Wed, 12 Mar 2025 11:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741779669; cv=none; b=umeH4sY1SNm9CwPOiMtrfASV42uYO/8dMLbAHEybXpkgt31JCdemLzL/vXEyN9MgAoswgRXxHRZ9rbQD1LYVjA7mp3p3qloLLx5ZiRNC2GiwfwekIbDGfIIgDHZjIqaomtUdsFJRl5gbUvDzsJUB/7OXiaAKSZ9fNnq+l67JyLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741779669; c=relaxed/simple;
	bh=BoyRVgku7EChH42bDwzZAFPngPMwwosKhAXjk4aoYAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lArpJZmEbgb3hHrrfaLdvpR7nfq3cSLWUBKgF+TLd6NvSHuToykVV396sPgTktaBbtlcwKSyTqomXfml1CNHirC1XRbgBoTbUgGRauYQAI2UTqYJbE7Zeyk7ypI9m3eTHpo5guXqwWER/tP+yyx49WHGH3N/BjC6SsZqmffLj/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j7ONB6CC; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3f3f4890596so3435791b6e.2
        for <linux-gpio@vger.kernel.org>; Wed, 12 Mar 2025 04:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741779667; x=1742384467; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BoyRVgku7EChH42bDwzZAFPngPMwwosKhAXjk4aoYAY=;
        b=j7ONB6CCbuvks9c0xdPVkFYaWmfkmXCHj1CLgF2nBNWa4+IjkWEI7PczAsSbz0Z13Q
         QCg5vUcxLxh+/9DV805Nn2jASqWjvviBgOZCcWT/8X20cfTkGHg/NPlGN2QfRXN9gDCL
         ihqvz5syShS+YkwhdEJAfJ95urMtZIdN0BEzD1jEeBV2ClXRsCPtsbDhcNl1pkOEoGTx
         BvdMHgdxD8NURC5KLw8SAbc/rjGyysyXS4BVwAaDS0OAunghZi/9m09kuCkLI9YTCq0R
         uC/F/mqbXOg1fnjVX7oAwoZEJDe6ErP0YcAadHBHfoenOBh/FRhXSvk93UBH5C8M0WFe
         GcGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741779667; x=1742384467;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BoyRVgku7EChH42bDwzZAFPngPMwwosKhAXjk4aoYAY=;
        b=ggsz+lwBCjBqiuH+ZLHiYlV9diJh8NL3PAuDGuLCLOZQjS9GlYd4n7+r2FTDMd99hM
         X4A3nG/efgpqY2nw0e0YfRqcZwh7JChHLaaFef+UzqYIVRdLuOuY0dDjGWb8t92ncEgy
         2JMVUFk8/2zwMbJpnO9RydqoKN+lAJJcke+6DmfXJnJr6pkmxQdEVAvQ82XZ3DbPETkk
         PAwmAOLJ01conu1FrMK9qYoOCvCWMdCam3rYjODS8yiQ5waxDOuCKuWG8kTY0V7RXvP1
         H+t0eTHydquanlbLLnGJ7h9TSuBZ5YOgEFaR3ZF0qi6chLO/PT7FbmtW2k4534jREBdJ
         nvsg==
X-Forwarded-Encrypted: i=1; AJvYcCUVzBbuWWsWEzqtPCbry5UiCNk+WLmdzt9by9fHIUpZ+ndQvEQxacixbOllkE4qnAPtclEAUOJ/1cDV@vger.kernel.org
X-Gm-Message-State: AOJu0YwpbpGxtpWO98/mzBududVwAcvv8eGVJj8JWydJ5RO1AkBjNUIv
	lA012C41G1cyy96wuvw2+1Km6rqBvD5HIHXjW9HybotkB1tghg+eSQKJEE8EIODjHavjit0YFnb
	nbpfiu0k9GG7zgJmWdQWt0NKPXjIKBHHhUgcSQQ==
X-Gm-Gg: ASbGncsNJUFp4DVuJ+qAeHSYvfTSkmE91+0f4dzvPpyfieizHHdlRs1WqNBYqA5ywwn
	IPZO1F4tJwiWOHeKf9OidU6f3rCRLi0a+2QQRPNwFWm5oTKJ5EMXsJKyZLXXXJocEk1bbgV8F+r
	EPj9AS8mq6Zdah2Lma4gE2BVEkA+5/
X-Google-Smtp-Source: AGHT+IGaTcw1nD7VE9rPLBX0yt54Qbx8fd0Q6JwdK4QExiQp0aQKu5cOr0s66LDn5WLcu2ofBIiUC2KaC5xcYi4Kn9k=
X-Received: by 2002:a05:6808:13c3:b0:3fc:219:c620 with SMTP id
 5614622812f47-3fc0219cb8fmr496004b6e.23.1741779667314; Wed, 12 Mar 2025
 04:41:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250307-pinctrl-fltcon-suspend-v4-0-2d775e486036@linaro.org>
 <20250307-pinctrl-fltcon-suspend-v4-2-2d775e486036@linaro.org> <c2e2c78c-e85e-406a-90a7-07d5b4fa82a6@kernel.org>
In-Reply-To: <c2e2c78c-e85e-406a-90a7-07d5b4fa82a6@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 12 Mar 2025 11:40:56 +0000
X-Gm-Features: AQ5f1JqdFxSd55M07UVZhyjzfxW8ipmSisfDvd1eSlj0E3xpeK33pLmIlqctOpA
Message-ID: <CADrjBPp9suYGifVR405k5KWqmGRnO1W5A6J28sWJVT2nGut1ag@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] pinctrl: samsung: add dedicated SoC eint
 suspend/resume callbacks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, andre.draszik@linaro.org, 
	tudor.ambarus@linaro.org, willmcvicker@google.com, semen.protsenko@linaro.org, 
	kernel-team@android.com, jaewon02.kim@samsung.com
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thanks for the review feedback.

On Tue, 11 Mar 2025 at 19:32, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 07/03/2025 11:29, Peter Griffin wrote:
> > gs101 needs it's own suspend/resume callbacks to use the newly
> > added eint_fltcon_offset for saving & restoring fltcon0 & fltcon1
> > registers. It also differs to previous SoCs in that fltcon1
> > register doesn't always exist for each bank.
> >
> > exynosautov920 also has dedicated logic for using eint_con_offset
> > and eint_mask_offset for saving & restoring it's registers.
> >
> > Refactor the existing platform specific suspend/resume callback
> > so that each SoC variant has their own callback containing the
> > SoC specific logic.
> >
>
>
> > Additionally we now call drvdata->suspend() & drvdata->resume()
> > from within the loop that iterates the banks in
> > samsung_pinctrl_suspend() and samsung_pinctrl_resume().
> >
> > This simplifies the logic, and allows us to remove the
> > clk_enable() and clk_disable() from the callbacks.
>
> Can you make this a separate commit? This would be nicely self-contained
> and without any functional impact.

Sure I can split it out into two commits.

Thanks,

Peter

>
> Getting own suspend/resume would be the next commit.
>
>
> Best regards,
> Krzysztof

