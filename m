Return-Path: <linux-gpio+bounces-2662-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E51D83F23B
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jan 2024 00:36:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16E8B281819
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jan 2024 23:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 295E120DC6;
	Sat, 27 Jan 2024 23:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GpfmGgUC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614A721A12
	for <linux-gpio@vger.kernel.org>; Sat, 27 Jan 2024 23:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706398575; cv=none; b=es0Ri1jLvyTblLS2s+gdsOhHvqxfnpvPvYu3hmSlqjGAnfyZJy9zYe0p1QiqsappB+JX+lD6mbNwfIeKl0/bUF4jS2Sk93q9vfpES1HibY8kpvelqu0ZBcZQr1Wl8KDNI2Q8o/Jw/Ig+aV0R0TTxkBIxHOCf8wiEHRxPD9KJ4dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706398575; c=relaxed/simple;
	bh=XVKbaMpkpPl4OamNNqyBIfrPPvBb/CuhmBwz5z4c778=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wl+BYUg5QjLarJj1G/SHHZjCvC1pq9/0kOH6pRdX4WlFCcBWQQDURid8mgRSvzmrC7tQ/kfLOvbFw+TVGj8qM9uTG9xD3vABNR3p7id5rG02t1Vqw3NEKzwj+zWfesrJhp/zmHtMQciStrBPmG++UO0Bql1uju0yj58btpkgdWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GpfmGgUC; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7810827e54eso151029785a.2
        for <linux-gpio@vger.kernel.org>; Sat, 27 Jan 2024 15:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706398573; x=1707003373; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVKbaMpkpPl4OamNNqyBIfrPPvBb/CuhmBwz5z4c778=;
        b=GpfmGgUCzBt6GWD8FZab7OoSg3wEV6+Q89BeHMQDsO/fsAkiSvbomXq58QNB2qAKgR
         oh+QeOn8F7vso94xK+/eHtvYcCkUrlx8h0MfcpWDqQBC51s2GsMs2Ux3G/Ku9gB6dnxx
         feqWCcLKGl3Mhw5ccRANO1MBh+F4TWD8XqPWRyueCVvduWZTJ8MTjUYvrjaq32Cxl6vC
         lo7zJyeqpS0IuCFAtPap38X+wG3BdqJ5SzOCfPeY0iSQkESRNm0sbfYkBZbZUj/6yOtI
         dmoTZPYcKpA/QHJgcNLVs6mwl6RvPw9o1arwbUZ+cAf2+sZjsPFh1fK3vlmCljDBAFw/
         QqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706398573; x=1707003373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XVKbaMpkpPl4OamNNqyBIfrPPvBb/CuhmBwz5z4c778=;
        b=kIi7406uWZg/wl8noxA+ERLUyVdVTpZCoZyEJ1eMHS+kerAECuJR54ES76gEFOsJRK
         KKFIKB+Wo8ljCQZzIFs7LcVMbmL6ZqeSgshrPw792cDiirCYWK0iKlMZlls9+po826aE
         F+S28MFj8ucAztAy0w2L9sqDbnjWX36eroBXOlo1zovCXGO+7UZjiLLbTL9vtjKC0xMw
         PhXwyrJDZ9p9MPuDA7wR3c21knRt1KMb+ymLcT9ANXFR2F1gse6BZC0rPHH0RhJDklN5
         5TRZ5hLkjJujN9qGHwbcaG+VN/jA/hrq3aSdKAj+KlSr8qLJwhbQPguL//uStT31JYtl
         DiLQ==
X-Gm-Message-State: AOJu0YxSl1hKeMM6xEz18DNJs+6pIdNAanLXhcQYrd9Jdcds1kiTavDB
	quWFCgCcI5U23mJ9yPgdHzAYKq+uwtWOPI9C+Zz452OfB9zysFiSxExHmQIJsn+Y8H7NxGIYSA9
	s0dvsOC0XpVzLwY+bilrfiTs53pL5aYLXymbGfQ==
X-Google-Smtp-Source: AGHT+IEgp6Wx5JnuWyXYHz8pZVr0cnqh2sFmftzNYViLIBvxeKcfFE9nBHRj3w+ge53ptzIE4c2ITaNbwP7ir3iKXKM=
X-Received: by 2002:a05:620a:20c3:b0:783:df74:8f97 with SMTP id
 f3-20020a05620a20c300b00783df748f97mr2269258qka.148.1706398573145; Sat, 27
 Jan 2024 15:36:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240110-pxa1908-lkml-v8-0-fea768a59474@skole.hr> <20240110-pxa1908-lkml-v8-3-fea768a59474@skole.hr>
In-Reply-To: <20240110-pxa1908-lkml-v8-3-fea768a59474@skole.hr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 28 Jan 2024 00:36:02 +0100
Message-ID: <CACRpkdaZGc1z8y7NmS=xeHBSFkOe4agMaSBspcikTnrbaeB8rA@mail.gmail.com>
Subject: Re: [PATCH v8 3/9] pinctrl: single: add marvell,pxa1908-padconf compatible
To: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Kees Cook <keescook@chromium.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, Karel Balej <balejk@matfyz.cz>, 
	David Wronek <david@mainlining.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 10, 2024 at 8:04=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovic=
@skole.hr> wrote:

> Add the "marvell,pxa1908-padconf" compatible to allow migrating to a
> separate pinctrl driver later.
>
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

I guess you will merge all of this through the SoC tree?

Yours,
Linus Walleij

