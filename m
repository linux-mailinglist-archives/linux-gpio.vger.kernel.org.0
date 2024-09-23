Return-Path: <linux-gpio+bounces-10358-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A7297E822
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 11:06:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBDF7280DB0
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 09:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44AC7194089;
	Mon, 23 Sep 2024 09:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gTjZ7KOE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B78328684
	for <linux-gpio@vger.kernel.org>; Mon, 23 Sep 2024 09:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727082403; cv=none; b=Ep4nV6R7sM/cu8/GaZ03K1hfTNCGaWdNFrXPLUepfrz3vpKOTvHvpquOB/iWB6vmJMTN4S0TkDiHVRX24ohj7Mrf5kPACv91wNrvZvjnnYesAQn7n7T2w/LogOlQEbNYDbrABmB/3XQNTswtcrNUpFNsu96i9Z70iKQ4h/VO5B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727082403; c=relaxed/simple;
	bh=gI+AbpiTkDl6kn2RiQQW+4/uOeZaJelNEMjqGqbZrFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VN277AKgiTlk2vP+3AjATDMELsHmkw1GGP/Ph5fqGXOZ4VRel1cWjuUnyxWuxK/zb7S+L6x3A/h9Lk3fiNAzNKqpO3kE4kSNyH+1jfM1DqmnRc2cuql2XPaVknMx33Qlt5mYMAdtlhQDYaiHmLXO9iNGBg3yVd6FPIetL8uvJD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gTjZ7KOE; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5365b6bd901so4572590e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Sep 2024 02:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727082399; x=1727687199; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gI+AbpiTkDl6kn2RiQQW+4/uOeZaJelNEMjqGqbZrFg=;
        b=gTjZ7KOE1b2fkh9CDZumMjefNm6r11KWkCf/oAIy7tG15TsQv6uUlT1PjeJyAbVQLQ
         ECTV4axGy9yYsYWnqj9+0T2BUtBY6w48u86iFfticQ6E9AUwMXgKczTiqEZKJQnz/Znb
         mQ7Ur+AMFTcLE1GhpKarNYrrE/UDJvdJtw35iTtvaYjvJYemu0b9Kf0sJcA1X48ERtpQ
         PY4lvPWX7FShN1IshgQ9KSEnJijcq11hyfV7cQu4/TZSaftKJ9xOjY93WNfe3b+qCqpj
         Dvf2idvagsQZHzgSinglJ8D+9Xw6/HeK5ELbIjdxOnCyuqrZEYkVKlKlhBJdcBWjab19
         Os5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727082399; x=1727687199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gI+AbpiTkDl6kn2RiQQW+4/uOeZaJelNEMjqGqbZrFg=;
        b=EbbIVaP/5xrlgCogaH8LBX9bSylpsgVSGffaDN3UddQuOA4zqKDIiVWa57X2YPVAay
         YksIHGggz5yOlofzyvfVujTsJeu/CzLjpd+u4WpsiG4g0YNsPy9wtvgDMWfRlfO7SWQS
         PvCvXZRa2alSgZIBlMm0fl8bPz6MTRMHoJxusfTHJZfwK0kQUYi2bOUMrGE0Pp6enE2T
         kKd9yfRUsQBq1h4i6IzLU5tSf5erqfcBfMf13OKYZ90qA7irkIzKYS+0wxSOvhgVDpfE
         tFhV3PJHs7QZlZr5PVWoL+dEwaoB21oVSXlGwdmCOrWF213xoRW/vqoSwqK0Yr1utSil
         WmAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSq4cNm6xAqNTLwT0dqW2xlY4Tidd7W7jDHStX0zkZ/mSxSJo1FIAIJWXtr407xYU2gtVLF6cyUPRq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4gd5W1zcEbWhq0uKaK5qYrEWvDGgZ9eWx6YKpo/RWwImr3Pit
	I6x4H6NFVqB3QcmJgfnJo+N/guK4/jzo/JyU0yXvNLc3vuuEZV2L8HP2z9iR4y3cxXrcIKrpTjo
	4LEJoRZhE6Z6CCORvehdpls2i1Ga4TnwW/fLihA==
X-Google-Smtp-Source: AGHT+IGdGIC0Q0OoO8XccO0CG6LWJ+zYGfstTcDloUaOK1j6nG3XeE48x8Z4GVGdrxN6tEmmP+pZ6cHUO9WoWDX6B1A=
X-Received: by 2002:ac2:4bc4:0:b0:52e:9f43:c13f with SMTP id
 2adb3069b0e04-536acf6a74dmr5045100e87.7.1727082399252; Mon, 23 Sep 2024
 02:06:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <77f543046d4d5c19206f829ddcf8e093d3e3f6da.1725440917.git.geert+renesas@glider.be>
In-Reply-To: <77f543046d4d5c19206f829ddcf8e093d3e3f6da.1725440917.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 23 Sep 2024 11:06:27 +0200
Message-ID: <CACRpkdZmkfVRunkUii6vhT-58Wa94LcMJGa3mpeS+Rv2+1-ZfQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: k210: Make (p)clk local to k210_fpioa_probe()
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Damien Le Moal <dlemoal@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 11:08=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> There were never any users of k210_fpioa_data.clk and
> k210_fpioa_data.pclk outside k210_fpioa_probe().
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied!

Yours,
Linus Walleij

