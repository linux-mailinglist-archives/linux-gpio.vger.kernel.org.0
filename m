Return-Path: <linux-gpio+bounces-25618-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84778B44663
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 21:30:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51108563936
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 19:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D82E272810;
	Thu,  4 Sep 2025 19:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Oz1kEODm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49109271A9D
	for <linux-gpio@vger.kernel.org>; Thu,  4 Sep 2025 19:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757014196; cv=none; b=SMmPByJJaYAJRSehOlmyMF7cYznnQgHmYRX2joDA344cMXWX5O47dfZlxjn8ZKEJwv9Ji83n9vfzI07cnt7ewCnIKDmkHJRy+FcmX9vOBQ8EorhN5MVj5V1fggx6WJgNleW2WTgbwW+Cx/hQmg0obTYrpCc6NVoWYZ25PLTXE4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757014196; c=relaxed/simple;
	bh=dMnCp8lDJ58wlkg0f5C1YKuXsb2gVD3F0HfT6YNyqik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sowjJi3mvte9SbOd127SsSylKrH/A0okeXPIiVjOnn6IMhYZmoqQ7KkLSjcwETwsv60AdKorf2h4ykF/8XZ+XpBqoZg+ZfDm23rw7l90sHdrxoZsuWR15xMmDSI647FzGpmfKd0wJ+sU4Vn7wDl0D2rT2jkxiCvocefjVbHRJrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Oz1kEODm; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-336cee72f40so12624061fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 04 Sep 2025 12:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757014192; x=1757618992; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iv0SiejT9pGvOZKgqag5hFnMWEWIdp2Oclt2dtVzm7Y=;
        b=Oz1kEODmH3VC4KTlbc0UlnW9sojp5w4jtKWw1pU0jBfSnn+r7RuRce1uo7fEZ/cdT3
         7yuyaYs1GrW0Pmr8YzDJbUlug9ion5pSq6uB+Oqd+X3qamjFZentq48a/6aueUIk6Sc9
         bQH3Hi7TIZR59ynHmC2J9Mb+yxFylqo/XmcMGqfbwcohNDKYUI151ucaLW7+KpnQOEAO
         CdBICwVzNUxx+UCdmzbmV2bIF3Ry+B80k5Iuaq73C0xVjbp618j56iaZxWijLule48c+
         j8CKOSd8H5cTNG0p1Qmfe9KfwutnjZLjliUkjYSIyM5iY5vhBfN6ZOqLQj+KCSLb1hc/
         xKSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757014192; x=1757618992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iv0SiejT9pGvOZKgqag5hFnMWEWIdp2Oclt2dtVzm7Y=;
        b=fw8p8v69YiTdc2gtUCx/xVrsEPY1c7iIjpV78vblG1D3exVXM6ZtPwLAkWEf9XF+oH
         7yqGiBKhk88IuHDfcJlepsySn4/nkYGvpgMway+8zAarKcrqd69on3RgfpeTU5wDvxn6
         Fm31v7iPl+X3LPF7qkycuBdQVf1zvcE7lFwV4mAa7ia8SdWKNgvd4VlMfm9uxz+Qwvby
         eG3yGdt/DOFjZtcqfrscPPFfQOFTxX6Y/ZZgF42iGTid5iUYsdKrTgMiyt3GAvQjl+T5
         bN5pPG6mq85TZU+IEUtcC8V1fo7PnrAB78up1fcau2xSNTY+RTWsyvmZmMEzF+I4qZOD
         e75w==
X-Gm-Message-State: AOJu0Yyz6BpdB06pv+qkOIu/RQI63Nv9bcVJjmuZrQBTJBSB8A9cZsqB
	YtPyt2gx7vc/tLIcdKKRum25Nwe5XKPms1a3yOIudBpVto12PJnjtcahNfZwkvqZu5n/RZhKRPJ
	WtXZOjIX8LHyVFXA4Q6SQIGDoEpVMf6ustxlzJyx8UNXqVrsgl1vy
X-Gm-Gg: ASbGncvY2GmMtiL1w9yqtZ4QYepExFjgbLp3A3psx1sLewjzsw8Xzrm/oP7d6WOLes2
	VE5XAa8VAuq/8roJrYAsDFOg6MbG27Ft9bw3j80wWaFPzVpC0ztT+HLiyuWQOa7lW0kW1P/oBml
	cmnnZnRszgnZEI3HPs4E1cGeqwkY85oxpDXIurWvyoISqHPd4+h8cK4DFWQj9ClHefkmk2v7BOH
	MIKzLs=
X-Google-Smtp-Source: AGHT+IH1kBQqBQ52jB6hqXMmqfS3SVBooZioI1g0pD2KpZUum1w4TdABG7XyFaic4aps4hAPOGeiBCP48WLyX2PmnYg=
X-Received: by 2002:a05:651c:1547:b0:336:e024:5c3f with SMTP id
 38308e7fff4ca-336e0245df9mr46926441fa.30.1757014192308; Thu, 04 Sep 2025
 12:29:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250903091915.2026-1-luyulin@eswincomputing.com>
In-Reply-To: <20250903091915.2026-1-luyulin@eswincomputing.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Sep 2025 21:29:39 +0200
X-Gm-Features: Ac12FXxXmGzHHllI1tHQQlAEHb6DXbv5xtLEukKmH1YJ4aihsiJyHyrI9aS8ODI
Message-ID: <CACRpkdYSOGkeN34tzLtKMASS9gskNzsVGP=7_08CQvT-O6dobg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: eswin: Fix regulator error check and Kconfig dependency
To: Yulin Lu <luyulin@eswincomputing.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ningyu@eswincomputing.com, zhengyu@eswincomputing.com, 
	linmin@eswincomputing.com, huangyifeng@eswincomputing.com, 
	fenglin@eswincomputing.com, lianghujun@eswincomputing.com, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 11:19=E2=80=AFAM Yulin Lu <luyulin@eswincomputing.co=
m> wrote:

> Smatch reported the following warning in eic7700_pinctrl_probe():
>
>   drivers/pinctrl/pinctrl-eic7700.c:638 eic7700_pinctrl_probe()
>   warn: passing zero to 'PTR_ERR'
>
> The root cause is that devm_regulator_get() may return NULL when
> CONFIG_REGULATOR is disabled. In such case, IS_ERR_OR_NULL() triggers
> PTR_ERR(NULL) which evaluates to 0, leading to passing a success code
> as an error.
>
> However, this driver cannot work without a regulator. To fix this:
>
>  - Change the check from IS_ERR_OR_NULL() to IS_ERR()
>  - Update Kconfig to explicitly select REGULATOR and
>    REGULATOR_FIXED_VOLTAGE, ensuring that the regulator framework is
>    always available.
>
> This resolves the Smatch warning and enforces the correct dependency.
>
> Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
> Fixes: 5b797bcc00ef ("pinctrl: eswin: Add EIC7700 pinctrl driver")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/linux-gpio/aKRGiZ-fai0bv0tG@stanley.mount=
ain/
> Signed-off-by: Yulin Lu <luyulin@eswincomputing.com>

Patch applied!

Yours,
Linus Walleij

