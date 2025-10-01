Return-Path: <linux-gpio+bounces-26700-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC26BAF5E6
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Oct 2025 09:15:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF554172A3F
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Oct 2025 07:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBE5717A2E6;
	Wed,  1 Oct 2025 07:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UIJgm6gp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B721C28E
	for <linux-gpio@vger.kernel.org>; Wed,  1 Oct 2025 07:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759302928; cv=none; b=WkjtftQbg4ckAKbsFOXCD3ZxTAJz+P8elLZrYoWqQaKOrOWnKdAC7bsjYerL2QVG2vNRwCTsxzVexRc7txerckgNs8zQzCEmUkIN0s/BmKOo3tK8W3YbHyWy2/ZsKtRgsnJ5phk/tuX+3XViHJqZN1RfiG3q22yAvbuzOOzP78Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759302928; c=relaxed/simple;
	bh=KLOUoFvpz3+9Daoni/vqhIeATvg32tx7vSxzv4KrSWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UXLjqJZ27hQcDSYWoXw9GG2gwPbMaJ8ZJTYvCZsIk6ViG2cg7D3YOwGNpVgW+OSMHJrtJszpTEs8wOXcOLGJ7pjjjCp5U2uBjhINoJ92ka5K3DTS8WuSTBJ6T4HksInk5zie8CDfBnhYJ3SJWwBl4UcYumlUoV7sWwA+19DZXGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UIJgm6gp; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-57a604fecb4so8293342e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 01 Oct 2025 00:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759302925; x=1759907725; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLOUoFvpz3+9Daoni/vqhIeATvg32tx7vSxzv4KrSWY=;
        b=UIJgm6gpqR34LrvO/Dnj6u1em273Fm2u6GtLGUY8LhyHf1KS8uDKPhLqBOwpfwOyty
         ZA0GI3gBCxNltJ0BT3FQduz0l28HOB5UVptyO5oJ4bbf6DZB9a9SxkOuavPJ3+RCIpgQ
         Vll6meLlYM624OFqPCiqq/gGTiZKjxl253JGjjiCcYS8j3XrxgiUAQNFkokroqhReDHl
         XpxxkHxSI/xtCgkQYsooR4gdtWm5uBHNvD0cwzNM3YUEfmEPrc6S176Lob/zf5IaHdVY
         8NwO2xL/+oYA3+m3Yudp4mbHp/Jqf9ZOw96yQRpq37I0+TlCe6fe3NHhpexVrB1H/3v+
         57jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759302925; x=1759907725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KLOUoFvpz3+9Daoni/vqhIeATvg32tx7vSxzv4KrSWY=;
        b=CcC4hLMICT1mFZ+dMv8YoUL/kmYcVJpdS3033huOZJz0F4t85ozuGQ+pcPnW8pREC/
         9Ixgi3ZLZqEP9gqzaIBB0wLraRvIpfm9I9qd9gtCUn/odWQd+PqELOuMCQOt78fLwPvP
         sENRA8lALbFavZeBJwSIV3CBEu6ybZ86bBAoYs9S7vZc4kX68Mat4iIChbh9BfItoD0g
         cqPrY9HhnR6F1g7vZ6I2Dv6NCul65l0zn1V4ze9twx6AjgcS4oJJ9G9nFKWsaShGOLWg
         tY0QYcTb6q1qYrCiAW02BhfjK+HSvcCAPStxjuBuRrXOgPci3JBbWLn/B2NfkPb1IMe9
         6Brw==
X-Forwarded-Encrypted: i=1; AJvYcCU+1tNnjfIMHmlUAWPkgvif/0pg/3j0EKVlMhf0uP3ciO5Xs0W5rMr76nVQkQMFz15jXPP7uhl7xUIj@vger.kernel.org
X-Gm-Message-State: AOJu0YyuSNQWW6YNCFZqQCmEOlD+rHs/jlGWCXfbRiRk0JbJ2gEuPEK3
	7X9vDApXNGtg4TBdidZQ6FB5p/iQ3LCZj1JHGbrstcVkbs/PUMmkemKsu4a0whwt3NbsvQdZ+dG
	ufcI+B9zH+7/c7OciaUomJM/DQ8hGSYDhWqjBO1s7y98vu4Kit0F1I0fprQ==
X-Gm-Gg: ASbGnctrCqEhWEh+zm2R6j5QZD7pEdyFBZw6AKV+lFqicbg3N/Wn204/JDu/cxWzBwe
	9MlaqzH1mmQIv/Z9zAH3u4DY0OITRflZNHsqGNnnW/M99vCxlfVUOV+yyluqM2m2PGyGzsb9H15
	20zkVWGgr9dCbj5vCiGjIvu80QZm1gYgLbf5mc1hIhaWssEoPS5BTJkVEsKxwjXKbUt3MxivbZL
	Sil0yXn4D5l2VbtBfzRZ/xEuFoVdFo=
X-Google-Smtp-Source: AGHT+IEnqFN8uRHySmhyFBckr+4qfapD0oIDbjAXJpBIKMb/6cpABxlfPjflIdUDyU81H5zIY7PLLDU9mAVEsotGkaw=
X-Received: by 2002:a05:6512:1319:b0:560:8b86:75ba with SMTP id
 2adb3069b0e04-58af9f755c8mr685869e87.52.1759302924877; Wed, 01 Oct 2025
 00:15:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250923133304.273529-1-mstrodl@csh.rit.edu> <20250923133304.273529-2-mstrodl@csh.rit.edu>
In-Reply-To: <20250923133304.273529-2-mstrodl@csh.rit.edu>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Oct 2025 09:15:14 +0200
X-Gm-Features: AS18NWATFpTIxuKt6TOYxlvCdRwC0-rKJPWCBiTCdTUgjY_Zw5e5ezG3W3zJtXc
Message-ID: <CACRpkdZ6_YkUsCNRFfRM1v68fpvAJcdqPRtAKTGqLqHf1geJog@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] gpio: mpsse: use rcu to ensure worker is torn down
To: Mary Strodl <mstrodl@csh.rit.edu>
Cc: linux-kernel@vger.kernel.org, brgl@bgdev.pl, linux-gpio@vger.kernel.org, 
	"Paul E. McKenney" <paulmck@kernel.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2025 at 3:35=E2=80=AFPM Mary Strodl <mstrodl@csh.rit.edu> w=
rote:

> When an IRQ worker is running, unplugging the device would cause a
> crash. The sealevel hardware this driver was written for was not
> hotpluggable, so I never realized it.
>
> This change uses RCU to create a list of workers, which it tears down on
> disconnect.
>
> Signed-off-by: Mary Strodl <mstrodl@csh.rit.edu>

Oh this RCU thing is a bit terse and a lot of code.

Can you look if you can use the new revocable resource
management API? It uses RCU underneath.
https://lwn.net/Articles/1038523/

Yours,
Linus Walleij

