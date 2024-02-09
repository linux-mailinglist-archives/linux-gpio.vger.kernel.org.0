Return-Path: <linux-gpio+bounces-3140-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EE184F60A
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Feb 2024 14:32:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB350B267EF
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Feb 2024 13:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C326B38388;
	Fri,  9 Feb 2024 13:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pLHIyyE1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186992E652
	for <linux-gpio@vger.kernel.org>; Fri,  9 Feb 2024 13:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707485542; cv=none; b=AIjenBDUfIwT1sPFbxQPEJx3yc41soaLrdNJ/gECpV7YxmnirOlBalRaGZ0ZnMZQg7QMihUiLDaIzn/azq0gXQCZloWnrrbIJo/RB0PdixPm3q46mdvSdddLRqT7PVJLu/6HCaxgNORagq0zRB5YFOfjapD/LfQ+53HfoYW6P+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707485542; c=relaxed/simple;
	bh=cfZar783bIO5OOtHylGck7kBUlRsDOqUiNuW+HJlEnU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V/P7DrfipOMOrnhs6oRgdjM31+qEWsO8Jp6L3T3eHUXx/8HJM9gUC5OkxIU5ppRxRBrE/gNoiqS9wqby0VVFRsh3XIZ26mmxxDVZkA4XqbL915D9fOO2k3TED/bxuvImOrxp8LVW5Zz/GtjckKqmvHAGVfY/6Jv2VjIePmb3KCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pLHIyyE1; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-604819d544cso9904187b3.1
        for <linux-gpio@vger.kernel.org>; Fri, 09 Feb 2024 05:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707485540; x=1708090340; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfZar783bIO5OOtHylGck7kBUlRsDOqUiNuW+HJlEnU=;
        b=pLHIyyE1aCXdyNGtZb6IT8WyfPApFKYm/xSyGkOjxMMOR3G2gaXwUvtIM/dQmPxyB8
         fqrslgI1yt99YDImaJvv5VErO7ecZBbjmS2D5osmzmUFmPQaHvx9AboUNt3qEvYKmFL+
         Jm6cuY3CjALE77jIW0FIFR7tTSB2B4hy+VufoNS6pbAVCFVFVYEOOfdoPp9e+obcUHy0
         GiJ3aO8bg+FOWeZrQ3kQkaNrX1kGhA+6S5tVsocu5830QpcYuj4wkdRREGuw9u3Wg94Q
         z1ZiiewaSS99M0yDzaq2mx8Zbht4BSLZcQANC6hAMPZKU6VVLD1nrfOy4sJAigTdrABA
         lbNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707485540; x=1708090340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cfZar783bIO5OOtHylGck7kBUlRsDOqUiNuW+HJlEnU=;
        b=n+gUerRWfTkxjOUmg1sawrbpHSp/W+PCUOS4PygyjZjthHv/rD5sWh/hnidHqLyvjY
         KZTJJEwQRnTl9MDfnRa3hUBVel/XrCIJI/jparT2RjPWvV5cejHwiO4zztecMq773aZm
         XMxlFtUHkB8EICx8MSNfA1yHDOZNXuGFE7omg9uhA8AqIUJBs4Jifb3maDqZF5UzB1KW
         Fc2c/HIP8TPk+l3ZFhC1SeBWm912FISse40Q8CD28l9mkv5/dNZT846kqHInDmjGO5jP
         zUb1UlMZYltqyQty+5c1x5lJGrA2nSS0fOfxaIe+KCmJxQRHZaaqGoWhiLCHuR+yIu+k
         wJTg==
X-Forwarded-Encrypted: i=1; AJvYcCXP4M2MNHjhp5AGFX0uUAxug706PtbF00+ghM4957AnyAEm14nRKQG9iUIhmhhu5gDyIU0SwjE68P0hQe5YSfiE8OYlqp2KS/fOTQ==
X-Gm-Message-State: AOJu0YxFQYiu5DB7LEAeQ7j4Je3Ig/jlsLr9k7w1gHwYCTPumohYj5C4
	6wr/zGRvT3ZivNYLePUooUEDh+hDyefAp9mCeX8g+cmFe868XP+IxGRGpFBq6HKrXxVPCOntbYC
	uQN3Uyo+ah4sAENazLe6J7bf+mj0Kfzz+nLjNEQ==
X-Google-Smtp-Source: AGHT+IERf3uf+9XqlHzF2oaWkcRal3264kKvnbkM2LVU6kgNrlwktr//S7HwnRLMhN4oi2hPAU15mz7H7m6uztYHtUY=
X-Received: by 2002:a81:4ed5:0:b0:5f6:4f5a:8bd2 with SMTP id
 c204-20020a814ed5000000b005f64f5a8bd2mr1656804ywb.0.1707485540107; Fri, 09
 Feb 2024 05:32:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240202105854.26446-1-quic_aiquny@quicinc.com> <8376074.NyiUUSuA9g@steina-w>
In-Reply-To: <8376074.NyiUUSuA9g@steina-w>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 9 Feb 2024 14:32:09 +0100
Message-ID: <CACRpkdZAU-H7tmacaOFJGhDGbyzfuYCG2k2B4YDVs-ZgNjDKFA@mail.gmail.com>
Subject: Re: [PATCH v4] pinctrl: Add lock to ensure the state atomization
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: andersson@kernel.org, Maria Yu <quic_aiquny@quicinc.com>, kernel@quicinc.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 9, 2024 at 9:37=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:

> This breaks pinctrl-imx on imx8qxp:
(...)
> With this commit pin_config_set callbacks need to be atomic suddenly whic=
h is
> a no-go for any device attached to i2c or spi and in this case IPC RPC.
> Once reverted systems start normally again.

OK I backed out the patch for now, let's see if this can be solved.

Yours,
Linus Walleij

