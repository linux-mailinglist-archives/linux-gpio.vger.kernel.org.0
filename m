Return-Path: <linux-gpio+bounces-19446-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C160AA05E9
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 10:39:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FB711B62340
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 08:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C026B2857CF;
	Tue, 29 Apr 2025 08:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KdjReSTG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19482820DD
	for <linux-gpio@vger.kernel.org>; Tue, 29 Apr 2025 08:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745915944; cv=none; b=a75cIHib2/yk26YxfhbRo8zCm4lJXE0vEMiw/T0iRovqSiiTSMUImQFPGr4h4CCL+ImvV1Nb03U7z8SIJ3iVuWcgwa5mXokJBHvzvgVdwA7p/5RwnYavfaO2TgJctRKMI6A81qXxzh8E05b4G3Eiqzh+/pVhhSc+DEBO71XCkZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745915944; c=relaxed/simple;
	bh=WJvHqnebj7+LXJjSH0Mss95pSFkkrTByr1+7aZOP8NQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QF2W58SPU8iFAwMf3Az3WhvCEFZnoj9YgSSjkIf9EEKeQ+UuqjL7hvostdG7Zz45xwrygv0oYv9JXdDPrYt3t2KRnubUG2enfibH8pWAWHX2u97AEkT65+BUOjR4pLfgJyEyI0ESUBxHuJDAVNV1D/Wox8XwRPF6cLOOKm4tLZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KdjReSTG; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3105ef2a071so56526871fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 29 Apr 2025 01:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745915941; x=1746520741; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJvHqnebj7+LXJjSH0Mss95pSFkkrTByr1+7aZOP8NQ=;
        b=KdjReSTGBvgTpmFex89UFPtuKi0R6caIge7o2xrES9RIix3CJeOEdOZGFMcpVi6bPR
         d8brQ8PDTpRDM6cE8RVQa6TF7RxLAgPzJag29qIfiwR3Y0xs5zEO3lNpYq71Nbg28iAm
         7NsitqsynazK/p3V61iGztigWAiSMFQahcXHVlGikOI9ty0SWSyUZc7dhM/RONiM40ju
         c9EGjywhnwtNmhooGGNg+ki/eQIvRLaY8hJapLNLc59yeN/NFawHKSCQkj4CgZ3NJA9o
         OLbWwamhYtKZrCTeumQd+vildwSN/hCrdb3KFPidi/RRwBRUfVw3s52ZUzuHNEEMVYmK
         pQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745915941; x=1746520741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WJvHqnebj7+LXJjSH0Mss95pSFkkrTByr1+7aZOP8NQ=;
        b=Dnh7J3z7JuhPHAb0e9fmnPRVWmAicviWic4Kzn+GWu4Spd+O9xIiaTbBD4ojxAy6mb
         HoYHM4Jd3yUtyUe3T9vCDLPlO5UNm9Xb/fOTZufLwbVqhRHuta/ARxzcojCN42Bo6zha
         vTHUs0J/wv3OHbHEP0AFTH38UqrqmreVWgBUbgwHIs1NEZNoqDqTsKsREFUZuUzZb8PF
         Vw53ljQdANC2NiU51rXW96kSYJy0af1ryg+4z92+vVQ0XPDT3loefrKK/PI0yPZ4m9Fa
         HIyw+Z2yaO6APo5lECZXnRHcQVuVpDR2LhCMRGNQlwFsBCm1UFC8KeS8qhVo9bG70Nnh
         Pqbw==
X-Forwarded-Encrypted: i=1; AJvYcCWFZ3+4kmtRfc6UY2HEDigTPO5TlGnMi+doat6s/I7nLe6OTYI2WqQ2apMGzOoF4zkr3uMPY1/2oTj3@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+vLejkqT65TrszACo6KegFw+bxSwTHy1JYkGjU3kJ/irIEhXL
	CZZet320SF6o0BLJc9gcJllkgx+CxafLiVyWWTDT4u/lVEurSyWsqmEHKvXbva198ALoqtmptCN
	8wzibnqOlXYv/UEolulsZxG+bab0tbMlk6YLu+g==
X-Gm-Gg: ASbGncsoDBBhUnBETIzSeBp4w32bX68BnXzKIZzKCSYoHVhYPKqpleYJLAPXCnDFw80
	up1Jnn49iTn9RnjD84O8R0kCSzmJfNUoXYG8Op5KKTWhK9PQ08kw9jBwvoRGRkAptPBKyKAR5Ef
	ynWjTbVH888IQpw47UqcgPag==
X-Google-Smtp-Source: AGHT+IHkuz+Fr/AzkwRns1/8PwMuipfYmUnKsBB7y+2XYRW44rUzmChg+OFPShozfJlNPd9b1oQDGXqsThys/IDroaE=
X-Received: by 2002:a2e:be88:0:b0:30b:c569:4665 with SMTP id
 38308e7fff4ca-319dd7960aemr40874831fa.29.1745915940769; Tue, 29 Apr 2025
 01:39:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424131201.157601-1-colin.i.king@gmail.com>
In-Reply-To: <20250424131201.157601-1-colin.i.king@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Apr 2025 10:38:49 +0200
X-Gm-Features: ATxdqUGYIHeg8-bt7mFBhXIoGyjQbbgQkhokYrl1ZFztjgdxtKATBXtQXvjtsjU
Message-ID: <CACRpkdZf1KgnYKXbCWEWZA4Cd748HBHDh6Y6f2OD3Oyshoe6YA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: Fix sizeof argument pctl->eint->base
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 3:12=E2=80=AFPM Colin Ian King <colin.i.king@gmail.=
com> wrote:

> The sizeof argument is incorrect when allocating pctl->eint->base, it
> should be *pctl->eint->base. (Generally, the size of void * is the same
> as void ** so nothing is breaking in this specific case). Fix this.
>
> Fixes: fe412e3a6c97 ("pinctrl: mediatek: common-v1: Fix EINT breakage on =
older controllers")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

The mtk eint handling has been refactored fixing this issue in the
process (AFAICT) so the patch does not apply to my devel branch.

Yours,
Linus Walleij

