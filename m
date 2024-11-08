Return-Path: <linux-gpio+bounces-12702-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B0E9C1800
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 09:32:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDACC284574
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 08:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F901DFE15;
	Fri,  8 Nov 2024 08:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FVWctg8Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E1F1DF751
	for <linux-gpio@vger.kernel.org>; Fri,  8 Nov 2024 08:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731054723; cv=none; b=GP5DDi+nxM0zRHkCtUaULysvNw/5nCLHx8+7WfE0p7gXLquX+evQQOQ+hvB/MegBIauYpIoo+6htbB9fGBR9tIC5cH47Otq7l79/fXrZLOdJmduLxuLWpsEZiKDWcNXW/f1nvxKhm10NVyUp0ueME3u3TpluuEBZ2N78bEe+DlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731054723; c=relaxed/simple;
	bh=1ND9bgK3KQWy+3cq/h1wKxgWNdJ1WBFhWBNSE25A4wo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IW3KBXWGH8CN833HegAr74R+LQldAMResLoGSwjBzrfaV6qqEB4HuVtfwsjzzB88v9im5fc8iTLEaFErfbt/BLWOSbnDdaWjJ+nJlI43eHvPnB9cl3ofKsh/IAoMS85wmJu1pk07WGWvS0eVyvOccISfvpiVyb8ItznWobNgkCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FVWctg8Z; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2fb3da341c9so18277201fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 08 Nov 2024 00:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731054720; x=1731659520; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ND9bgK3KQWy+3cq/h1wKxgWNdJ1WBFhWBNSE25A4wo=;
        b=FVWctg8ZuaBYLWY61+0XodgtTtsSTBZLH+xKE5gTk6i5131Bf2h9l9VFvy8GxWGquE
         mYdH5VzV5eJafavG4oB83FZyBl5/wo2vy9HQZdt6uVd6BsCpqjmqbfaFAEZAaWJJ4ZWi
         V5b7Bdb4uNO8i170+yYvbv8CU0UiJVGdEf+ZcfOT8I5rC7xpvHPMB84HVrmBpyBNba9q
         /WNaeYv96bOJQGJW+2W0BKcpqYU3nNDZPfOKB/xwZFw7gHUYB2XHRMwf8FnPo+okd4sh
         Na4YdIxyp+IPiHinMKEA54aFJpTl0cn6VzdHiKbMApAXG0xNFp60yoEJR0aUSQ/X2+/w
         7AqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731054720; x=1731659520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ND9bgK3KQWy+3cq/h1wKxgWNdJ1WBFhWBNSE25A4wo=;
        b=bozyWE0Yot5JYcTfuPZi1xpBcwIylPQsOU8j6kB6k6386EpslxfxZFVkZtshuAZS/w
         aN8rYaKvIbOwlueZjOXrEuNeOZoIApFQ3e/+UqWYBrJ52cUGaqNQdxGFEw0R/SzII7mc
         D7ZwGclzzfqg+lzkqfqRahqDVHwMxILzruZgkUIhchmay1+E1wYPiDtdKD2sVB4f/gnl
         qMPYTPDrIw6aXf03vvNw7h77x4mQafEYfXtvm/5JE41W+Vtndz8Po+diTXP0U0UFjdmr
         l6S/5x7ZYSdbHWZwBKq9dmsMCYLq0MPZUtCujMpgBglf9iMSBILf92/+oLYDW1Nkw5ds
         CGtQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8LUXEpa72BJXHhKX7A4lohMF0VLC41mBflAA3eu97obqaL7b6HafPYRFQ7CHA/cvUr2LmohzsMbJG@vger.kernel.org
X-Gm-Message-State: AOJu0YwURIHIg1lKyJpKHoscfXpFEnVhWs03B2OvPlG+cqliIcBKdsGN
	Ekc2JVpfAcNnuoUhFSAITLTiv6NyALCyTSL8TCpi5Dgo8AGge0n+bmZcoKfdyO+KeHrpk8vZuCB
	65ofYaOw5mHn5FjTG1tTfEufUrYIfPOYySkM99w==
X-Google-Smtp-Source: AGHT+IHWAsQqG+y15H2WGwWZPQvCIg2GrPsoE8du8PoiicmJWn/4qgCjO61EIsCAk2BM4YFh3XSjkJBItIutIXE+if4=
X-Received: by 2002:a2e:ab08:0:b0:2fb:597e:28d9 with SMTP id
 38308e7fff4ca-2ff20188093mr8640431fa.14.1731054719602; Fri, 08 Nov 2024
 00:31:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104-pxa1908-lkml-v13-0-e050609b8d6c@skole.hr> <20241104-pxa1908-lkml-v13-2-e050609b8d6c@skole.hr>
In-Reply-To: <20241104-pxa1908-lkml-v13-2-e050609b8d6c@skole.hr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 09:31:48 +0100
Message-ID: <CACRpkdZCF5o=1bc=tj7VM=ie-iakmBC_oeJh-LWqtsASw4eRFA@mail.gmail.com>
Subject: Re: [PATCH RESEND v13 02/12] dt-bindings: pinctrl: pinctrl-single:
 add marvell,pxa1908-padconf compatible
To: duje.mihanovic@skole.hr
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, Karel Balej <balejk@matfyz.cz>, 
	David Wronek <david@mainlining.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2024 at 5:59=E2=80=AFPM Duje Mihanovi=C4=87 via B4 Relay
<devnull+duje.mihanovic.skole.hr@kernel.org> wrote:

> From: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
>
> Add the "marvell,pxa1908-padconf" compatible to allow migrating to a
> separate pinctrl driver later.
>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>

This patch applied for v6.13 so you don't have to reiterate it
after rebasing on v6.13-rc1.

Yours,
Linus Walleij

