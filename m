Return-Path: <linux-gpio+bounces-28275-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9850C44981
	for <lists+linux-gpio@lfdr.de>; Sun, 09 Nov 2025 23:56:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95434188A710
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Nov 2025 22:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3422C26D4C4;
	Sun,  9 Nov 2025 22:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RN7wdptD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300F71D5141
	for <linux-gpio@vger.kernel.org>; Sun,  9 Nov 2025 22:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762728969; cv=none; b=gQUUwNfh3a7rSiYhWEGLg9UITDsw4/WOqzJ0DMxOxC1NaRslnYrb2XIMBDhB3/p1Oua67TOJWhdGJr7o8B976hIP7E62szXbuPNtQR5QOq9PYWsd4S4wzOBXdhznav+UAZmnohLsM3J0w6ktI1sbZs1WuUI7yUnxOoboaYUzAuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762728969; c=relaxed/simple;
	bh=PLFGWQAspdbCZRDef875kIYLM1p0E4rzqKQQiCIOPHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PUTv13d5X5EXNllGcPartoMvk3QFpoZf78lWbza0GDDBS0vesnMYa2/D9dYzpKVtRtNEbiZBWrBlD9jXVov1Y3XWyX2zqpl3gQuE4MuIXPgYOmgDrUiTWqkGB3P9MtgInNEgEIH3sclQNaoycevECeRm3byGFGBTenxVcTLInLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RN7wdptD; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-37a49389deeso17295391fa.0
        for <linux-gpio@vger.kernel.org>; Sun, 09 Nov 2025 14:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762728963; x=1763333763; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vsVnuKc6cjflpQWcgE4gpq5jpcc5QldZ0S+6grxXq2Q=;
        b=RN7wdptDmjEeTE/85vn8Q8Uonm2dZ13MD/I1PRDcV5tXjXm6n7aoTQV+DiU7Gl8C1G
         LtNdVXHbHVAO6iXqo6ZblSuv2qhX3MmmhUuQkj7i71CqGK4V1Awoiv9WiaXaN09HopG1
         +irTNiHo5lFl/Zjh2ww5k/Pn17YgKsKqcC01lCWUuEhk6azncZBx6dkzq3OgjlfGLFHG
         dSuOTvCN0njp3r3iPXud39G7F6+DOxjZxPsk0CCbVk+qKKhBinBD2Jjd4yzIe7A3VriJ
         YISUPoEdN69At2IRAbhU3RJk/ezl1nOgH9lotOJFqU6k+ABKA7DosoZ3tb7+PVn5bwNO
         4hcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762728963; x=1763333763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vsVnuKc6cjflpQWcgE4gpq5jpcc5QldZ0S+6grxXq2Q=;
        b=rszfipN5PRlH5BKsOtkBMhzJaDu5S+qLrQQ3MhbbB16bAEVjb/6RDEN5adUzgZGdn4
         zbyvHy6JGHCIpTF+KQx9+UoIsxzAvXCgbNqQ0kfkrbCR3c+32brJJk3jeFNJSw/KgxbP
         xSEPzlq2x0Ob2RTQDaM8xq4QPeeBm4ToAtLv5jD/8R/86ufiP8tjltaG8nTvCf1l1PeP
         MNJUE094a/jsktGySf6Qgq/uweNzy/6HMMqPk9evRI0tdv1EF6q0vCWpjtrIz0Otk65c
         BjrMKcoWUYXEHplyAjk2Q+sNoT/YMlsjikNs/5nlzJPN9L1bUpFfEKfz4/1iCHFx6lbN
         nADQ==
X-Gm-Message-State: AOJu0YyP2JAfulJc+TRoNOxWOcKJK5CInrdN6dE2ksUo7hCKW9EjmpIE
	vkIH+ajj15nDonnWo9VfHatXJ3q6nxyEcYErgGftFUQ0WtC3jpzDNCjZK2AfKzFZizZbeyWhqbL
	zrVKJDuzaAC3XB3SOcXQstIzcFR3UjKtTemID2CGb/QqZDaxdbRMP
X-Gm-Gg: ASbGncsKaecUtT6qmo8GHyjT9M6KrzNj9C4o3VrSVwED10q/8aQy8iR/ToE7n7GgnEN
	MfqZ9ZrTzv8p7fvpccuORQxvZpdZbjsKyvITZjLUoSwi9lp7PqgG0rYfJhrf4QKxOaAz0stw8A2
	/AjG0FGqqmsdD0iYfRgTmSgBwkJ0A+i4GyQTjhiPKj5O48bd+5pss4ftqGZfyuqAKiOX9bZtopJ
	Hb8f+nEXhjrPGTha6A4xclrAMt/JN2PiM5pLLLKmpBTZt1/E0ZVNy7O9U5Q2R5sQmNGZz4=
X-Google-Smtp-Source: AGHT+IGxal11KMK0AVWrPPETyfd2Fbys/t+t+fib2c6sSU5/wtz3kucnMR8Cgt91zKKPda+AvoBQHik9p8Say+Amk8Y=
X-Received: by 2002:a05:6512:3c8c:b0:58a:92cc:581d with SMTP id
 2adb3069b0e04-5945f1e0185mr2142297e87.50.1762728963144; Sun, 09 Nov 2025
 14:56:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761906880.git.geert+renesas@glider.be>
In-Reply-To: <cover.1761906880.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 9 Nov 2025 23:55:51 +0100
X-Gm-Features: AWmQ_bnqa0cEGYyZL8QXQZaZ7D5Q2RPrSMm_Zqk2iLrLMm8olzmGDV2oTbnQTJ0
Message-ID: <CACRpkdYw63fNruavFCn6x83VqaGw2JJj_-6D+j17kin-7YNDwA@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.19
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 11:44=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df567=
87:
>
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v6.19-tag1
>
> for you to fetch changes up to a5fad3aeff41f89ac94230d66ee5f9c1526cb3ce:
>
>   pinctrl: renesas: rzg2l: Remove useless wrappers (2025-10-27 11:53:27 +=
0100)

Pulled in, sorry for the delay!

Yours,
Linus Walleij

