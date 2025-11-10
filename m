Return-Path: <linux-gpio+bounces-28328-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C649BC497C9
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 23:07:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B8BE3B0198
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 22:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E712EDD57;
	Mon, 10 Nov 2025 22:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PnBjFurj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C8FF50F
	for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 22:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762812458; cv=none; b=aYkkN507+12J6yf7rAtDql0d4GyWJu697nwldJMeeckXufmWAYNWahlaZw/Sx/uqNJATRW3B5sfnXHndUKKmMQ8R09riz6xExRJ3yvqlxdekoSx7MCjF1BPFolVsagt1TzZHMBNAilEyoXq/7nRsPObcP452vtNGp4bgyQRqbbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762812458; c=relaxed/simple;
	bh=OGj+tW/gERiPg6ovLrbDorBP/2ctTbzRHZvS9D7zaHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GTLO1PyOpvYTo+AwaQsisFFNe9v0pVeDalgxvpYDj4C4qUTYtdoLsUQ1A/jJF9bgNNEj7wrpjUCPdQ7pZDTRaSYzOa5j6DhL2Yx/wVefUsNpdgy2rB1mwO36vKVmgVRXJemiDSSJREEug7Li5daplxR3ZzlFbZtW8K7dHfCgsy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PnBjFurj; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-592ff1d80feso3818860e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 14:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762812454; x=1763417254; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGj+tW/gERiPg6ovLrbDorBP/2ctTbzRHZvS9D7zaHY=;
        b=PnBjFurjWMAJVBosb4KUBIiBlk1TLii/Oq6w60U5dMtUQgVTe8JIz0qjUP/k0+qwVp
         CJjARiSejtAZNhPkOFMIpKmtXc/B0ZmpK2wWtO/OqngQJkO3aYN1JQVhfh8NGEPU1dHG
         ZRloHIYlxE38sEwAkUg/zf406FhZ7JuwIArwU3mdnmlgf+ZoxSiZdw6ois/C0YTQkmbf
         fCLphApKr1QQspCFpzpkkViIJGEs8dBgWWJcNwLJsJu1L5nTTmEMP/7lK9QERq3Hl3JW
         X0ytz4TLHdBZ4NEfdbnlBH+R1xPXt/D97WjvCrif+I+U4EsFFyI1F0K9hpw4GNMJWafn
         Xmvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762812454; x=1763417254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OGj+tW/gERiPg6ovLrbDorBP/2ctTbzRHZvS9D7zaHY=;
        b=qSp9VW/gSIiCbDP/Hb85IrHEF1hnLmVcBTk9FNArin2iIpZVvUXGd+R6MCMY2Vvgf6
         kOyPy2oTL+Z41lXQQBlPB7NPr4XEHl7n54nHFk9pukWNCSMYGF3CT68FO3yEEg8c5ORO
         JYoRZ8ek4rD67lKKDTT11vBkJte9Pm6YI1ePuTDSGHsVeKq/R8vocZQylgC7UFIONlh3
         Kd3UY3dDvPNhcQLAXxl4LPuox29afgvQhrmmxPQXYbOdLSTuNu73XW7mfji/t2ADmgFT
         XORodfvB5OUVgsxmUxW+dpsVARL+v2N8aPsuak+WbU2K8FMlUmooNEFXSQPddL1lu3bF
         QmCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsdG1BH0b1Wg5jaS478p9T4I7L4kFYWpBik/4kTBl+KObJyP4w2zZF1fqXaZTOopnkzIbBP7eyqzYl@vger.kernel.org
X-Gm-Message-State: AOJu0YwRiQkg8ORQKntHZZu1s/WYBQ/H+rxcSO6H3sI8K7fUltvH5DDx
	5LOluh3ZY7AXlVVSSNG2NfJN5sGbcNjDvNg9IgjQl4/uy+1F1iuNSJiiS3DP3aqVZ3c/iZ9S4Mp
	qBvL9Y3O0MTfUx2oDCCJiZEqsq/FyXDLyolZciS2TFyClZ7OV6XeKofc=
X-Gm-Gg: ASbGncsdTXG4VeQ5lnPohwEPwHaZPrdwSC3ElzsMkm8dJdyDdA/cjgJnBJaJWJTi+ob
	LEM0Vw8hEj7J2kMbeBek0p2PQMypG0lhijoAFnYG3A6g2whXtoTZdZQj4ISKp33ltbDPewbi5YZ
	cGsiU8LmXAcUJFOKk9/aRkY/k9LFKzUti1BRSIzGYoMgS+ew7xWEz7WRq/PbnbMNwBdiEKzdknE
	Jwkt4DG/URG/7rKjI+O/HpoWdCIrXkimhhdGQWDX6jsGeUIEbUvaWQXcq8fVghTxapaa1TX+KL0
	tTsBEQ==
X-Google-Smtp-Source: AGHT+IELmN97oDj+g7CBfAP1ZmJlELbQtkd6J2V6msL1wsAaOrCEOc8jvuEkyDFsYcjc42sOt9ara9p1wa029H6R8f8=
X-Received: by 2002:a05:6512:3ba2:b0:594:2c1f:75cf with SMTP id
 2adb3069b0e04-5945f21a3d9mr2705379e87.57.1762812454506; Mon, 10 Nov 2025
 14:07:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251101074131.353640-1-dmantipov@yandex.ru> <20251101074131.353640-2-dmantipov@yandex.ru>
In-Reply-To: <20251101074131.353640-2-dmantipov@yandex.ru>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 10 Nov 2025 23:07:22 +0100
X-Gm-Features: AWmQ_bl4Do8iVs7Hdq97c2K9vtKqjfipxwVKEe-AUVPnP7oWb39so8DNKc_Y3PI
Message-ID: <CACRpkdaLSM3jDPSL1oQiMhyoMJ4dkcvdL7hYsCimM6E9+=76Kg@mail.gmail.com>
Subject: Re: [PATCH] gpio: virtuser: avoid strlen() in gpio_virtuser_direction_do_read()
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 1, 2025 at 8:41=E2=80=AFAM Dmitry Antipov <dmantipov@yandex.ru>=
 wrote:

> Since 'snprintf()' returns the number of characters emitted and buffer
> size guarantees that there will be no overflow, an extra call to
> 'strlen()' in 'gpio_virtuser_direction_do_read()' may be dropped.
>
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

