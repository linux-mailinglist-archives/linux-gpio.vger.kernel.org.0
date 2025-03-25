Return-Path: <linux-gpio+bounces-17981-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3818AA70BC4
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 21:50:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0AD45188EE59
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 20:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ABAD266B41;
	Tue, 25 Mar 2025 20:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AAJDdt+s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D15942A82
	for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 20:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742935796; cv=none; b=MsRF+7fyhaKXQRPk/U4L/gWg28/2YfRYpCd6YqrdJhN/3U5K2VuH2u5KB03uvaZEK/3XdgjbK1dbWZZApBL3PB/CyJZ/UAGBpUkfw6yXo2Sh3iz1zIQvN6CqjwQSxXJ9gs6E2I3CTSWn9nsb6BvY6GGIpxlfkPL4JBu+N53Rz8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742935796; c=relaxed/simple;
	bh=aSGZCgSZyiCMLm45nefLbWbreHawZ4HrRM/1I0jgflI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rshqG01h+bdMA8uhFbCJL6FHIy6hPzuF0NyOZJviLAZl/1icKRjFci4jyc3ZQuIaSq7wa3iKwQvFPB0b6JlFqSylDKdCSDOwx/FF8QYHCeX5BnM6KE0Y2CH9UO5CLDxWsrC0F98JikN+WpQKbxQN6b5wkGwh1KCx/Y67VRn29CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AAJDdt+s; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5499c8fa0f3so6994495e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 13:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742935792; x=1743540592; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSGZCgSZyiCMLm45nefLbWbreHawZ4HrRM/1I0jgflI=;
        b=AAJDdt+sXp4FdLqbKqwWtcEA1l8IEToRLd2MRSBSujtcJiTSFyk5GZ+dX1iuBCGUL3
         cFJAUJ0qg4TmQ1Jt067OtI/JAL90eXjeapQrNJQyHfOyYoPa9U/b4ESy+YHUefK1atgp
         n6vpOWmCTE70yvkSr8umlCdl5bVoVtx6aLfNvD9HFN8NQsCL2+aHjAxygQj4wmJOyY+y
         e0L6IyXVXl5cp9mr8oiPG+1D42ByGT/SzI4GbNqXKr2+ZWDvms4b5tbYT1boKtM2vzBW
         W+7R2YC57yzQ/mqskZBQDQSgi8LcBXs8rJ2nIOOjaykg5B+rsg4kIEZipD/F00l6kuQv
         /ceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742935792; x=1743540592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aSGZCgSZyiCMLm45nefLbWbreHawZ4HrRM/1I0jgflI=;
        b=cAwjIiemFMOWEFifO+ZzCw4VSu/bTuIpL+s0MJgEB/Y1nQ8BqNmkiUkKUlys6Oc93T
         fxnARhsoKFIWg6bhW73vjcid6lC7tAQXryt980ed1m4AJ/Sn8NFpZFRwa2ezRTHlIBH7
         vQg8AMPlK4bepYXeHZhLhsmH+yCSQfjStOaeqT3XhmEy7lK+hqOvIMSvEZmcbAUscs+z
         7f9X84NR+CVxD7Tqnx8kuu5fcPSs7OmHaOLy4ezLJovjw4PzHSWo5jqMzITD0J/Y2mnD
         1WNI6dirHiH7NaX91xCE639kPhqXI3EsuGB+rZAkmpUULIJ1i+j1alR2J7xIJRp9cPfs
         MgbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYSzwG4b4bj8Br/AiS/qm3wgpklPEjyZJbiYGVQVFYQU+bsuXYo2YgVFNlERySD5OHJCqXRx2aGuCG@vger.kernel.org
X-Gm-Message-State: AOJu0YwxC5AVPR1R5eJUSxhcHwb4ud3o94G1jzc+4C55qo8rRrbyyJmW
	L/M3vJ43J7qjvAb4AszY0hVJq/LgwEfkzEKrpdvJKoGTlwQYfeNhjmlCAYyc2wS0R3n4LhwW3pY
	D8p5nzGwDE6Kc2nRvHEdIwh47Cctdzmekgza/ZQ==
X-Gm-Gg: ASbGncsJ7KLqxWW1fdqM3NTMn01D+F+DbYuo/f2PYhc1+Zcz86Vyr8HknFzJjJMsMMF
	qM/Q22O/6JWEuqK4UF0ooRqRXKK0krEUqE+5aMpiihd5Vw/XvxQR4oX92MkNIHM4eBs0kxLQZTx
	MKaH9p0X1ZinqzjIStvy6hxAs=
X-Google-Smtp-Source: AGHT+IEF7yyIMMixqctwMg+s9HwHl4A28PDbdusJ+Jzb/Ti0VnewpkU2St5hBerQF3oHbdQtAZyOW4J2NRWiTUU6A4k=
X-Received: by 2002:a05:6512:ea8:b0:549:b0f3:439b with SMTP id
 2adb3069b0e04-54ad6494351mr7341343e87.16.1742935792230; Tue, 25 Mar 2025
 13:49:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325141311.758787-1-emil.renner.berthing@canonical.com> <20250325141311.758787-2-emil.renner.berthing@canonical.com>
In-Reply-To: <20250325141311.758787-2-emil.renner.berthing@canonical.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Mar 2025 21:49:41 +0100
X-Gm-Features: AQ5f1Jr_QmG228mTrT4635Lxbqc8kIEzoAGcZXgVlRpA7Hs97jG_kwma8QcfMxU
Message-ID: <CACRpkdaJPXbc_83PdhjFDbmqcrV61k2NgtPjyA7gQnoBGRPgcA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] dt-bindings: pinctrl: Add eswin,eic7700-pinctrl binding
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>, 
	Pritesh Patel <pritesh.patel@einfochips.com>, Min Lin <linmin@eswincomputing.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 3:13=E2=80=AFPM Emil Renner Berthing
<emil.renner.berthing@canonical.com> wrote:

> Add device tree binding for the pin controller on the ESWIN EIC7700
> RISC-V SoC.
>
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

This looks good to me.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

