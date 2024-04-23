Return-Path: <linux-gpio+bounces-5795-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DE48AF7E9
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Apr 2024 22:22:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4FCA2B2301D
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Apr 2024 20:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 016E314264F;
	Tue, 23 Apr 2024 20:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UaGGyLk9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B97B1422D4
	for <linux-gpio@vger.kernel.org>; Tue, 23 Apr 2024 20:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713903755; cv=none; b=R7N5HN0cP/qlfdDiKdaLfDYXJF//iQx+nNisrY1MATMVxV1BaJWd4hVuKrzZielW9xR6iYYnsRlmBF4NgiJZMqAexKu5ANCV5qHqDqoSUP5nZz3hyVPRjbE2dCebCYTKFbOwfYZR3PL+7FE4Gse9jd96JO7/Ji/3b4qEj6bj7Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713903755; c=relaxed/simple;
	bh=GGErmkzlmC6WZeWA3tNtKikh8sr6ZPY2e3b9gFjXmWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e6JIXObGOGvuYel8JB34zfcJUacBAVFikF8QpsepRX8DHkEetihGopO8UKu/Obwk9AdVM/65RBw3oADKMny6MApZL9EjpkypTST0cV7ZR+MGXffkfKnVS0rWYxl6L3FsL8XXpeK7dymT0jyyxQSq5FOh4UL8j5ow6Uj6NFsSpfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UaGGyLk9; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-de477949644so5417901276.1
        for <linux-gpio@vger.kernel.org>; Tue, 23 Apr 2024 13:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713903753; x=1714508553; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGErmkzlmC6WZeWA3tNtKikh8sr6ZPY2e3b9gFjXmWc=;
        b=UaGGyLk9Cb27kT8FC2fYbRJwUqnyUowz3pRiIrYfYl67nVQEO5v5fZjhBmi+6NB1T3
         1P9JwjU62OPTbTSRA2bFKtteA4MQTeTLiKUKRNyItifo8Z6BFbpa0lWao+s76cHj2oc0
         PDjAUSLcuLTQwibRdWJo4iZj7K8dpHx1iwmyLE+6pivQMWaGWoTJFMvoaj95KnxvwIev
         zZc9k6PiV9FmaBfcAjMIJIcBFactrM2ugVkSWYa3wFAjPRVQWXwBDyS/L/g6zuJrIKfF
         dVOmkX9mm0wjeWtWvPWidDx1FaGd36znjRnHxdL/lDcLRFvQG4joB9I/ncy5W3+Tsg4O
         gy4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713903753; x=1714508553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGErmkzlmC6WZeWA3tNtKikh8sr6ZPY2e3b9gFjXmWc=;
        b=qVslumyWWwz639ur7iTA+vUBSBJIzA1QypS9UQ04DvAgcqPjENK7dzol+Uo8bbheRO
         cFoBKY3Qute6f3sxneRwxN97M2IUpp6GGU0p+PL4RgsvVCqkHq/aJebbf4NSjfHjE+ll
         aDkBqa5olw2WM8x6EL36ADO2FN836nk05PSAWVwvsgnAwYyWQ7jz6ktS1NhByUs94CNF
         xIvlekj3EF0nzDGwAWAOhA89w63ChiKJeibjKOCs6/lD++Nx4lUXo3aJtdQ/DO5qvDRE
         LT2UvCLRSHJ3tHzANe7YD2NW91Hb7IRSPDHpYZKe84Ba82aIXJoRIKbV7G3NT6O6gZxO
         FlPw==
X-Forwarded-Encrypted: i=1; AJvYcCUKCLMGfA0F0VnfwJJ2X8gtnQ4R/pGRgGk3wTOQJUOJtaaOT3Nr6sGQoNCQaCmn1As2gTvNpdQsCdlHZOuVAYkagRER6BV7f5XfEg==
X-Gm-Message-State: AOJu0Yyw9eCjQN6eRPXtS48XzkqUKy5/I20mUFc9OpzH+7WG/YCDyzH/
	I6Gpg6CE3qVxGAEmtaGegIn9xwzK/U49Q8ZOlE9ul5VHA62giU8h3x2iRLMcW6kMh673ydXKjf0
	HL9T3ke0DSn25WiBEJnGYazZ6bYo1VWnX6b6zerWoj4FKKSyl
X-Google-Smtp-Source: AGHT+IHxh1O/61oKqKBZj0/l6rCF9/gTe4NYPI6eeRZaerGL9bnOmfNdfhEXsMyfKOn5oHbujkuB6lRkBsp9K/L5um4=
X-Received: by 2002:a25:2008:0:b0:de1:2874:730c with SMTP id
 g8-20020a252008000000b00de12874730cmr780232ybg.26.1713903753454; Tue, 23 Apr
 2024 13:22:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423184605.2094376-1-opendmb@gmail.com>
In-Reply-To: <20240423184605.2094376-1-opendmb@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 23 Apr 2024 22:22:21 +0200
Message-ID: <CACRpkdY78Jd38b32QdJrCbpT_-99F7tZ2--nhg+tPqkaqNfZsw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: brcmstb: Use dynamic GPIO base numbers
To: Doug Berger <opendmb@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2024 at 8:46=E2=80=AFPM Doug Berger <opendmb@gmail.com> wro=
te:

> Forcing a gpiochip to have a fixed base number now leads to a warning
> message. Remove the need to do so by using the offset value of the
> gpiochip.
>
> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Doug Berger <opendmb@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

