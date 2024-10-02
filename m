Return-Path: <linux-gpio+bounces-10692-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5616798D450
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 15:18:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19519281BBE
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 13:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DA6A1D0419;
	Wed,  2 Oct 2024 13:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EQIfCvSa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFD21D0410
	for <linux-gpio@vger.kernel.org>; Wed,  2 Oct 2024 13:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727875061; cv=none; b=Sw4z08grQ3uKYxd1jGeYWeQy/8VeHI5lfzfGr1xhCMEYzKsJGV3pFdCdkUCc8tUv6SqQLi5q7HVahpZLVHY+PNHlbfghgtfV/4Ld+Fs6Vw6qGrDU53vfy4N7MKJeDYx46W5aXKm6ayKD7hau5eU3FKwZOiWn2L4aZFrKx5cnkK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727875061; c=relaxed/simple;
	bh=EQnoQWtsuGD+LuzrYNHU9VWc+WEoxNhpL3UZMiEz4RA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jtrWMuyYWJl1TMAqS4xNsgo/hlukXErj+0tU8sp0uAYO+MC+WPVU/EWNYusYYdyuhvcZAng1puprO/lhH5fSzFVFH5fYUs4urUK8QL6rbiBhcgyEU+uak+xBoIhFp6P3u7GvM/fFf/H0P87bpHy6Ct01WfAdikafrdU1GeUNILs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EQIfCvSa; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e25cc9c93a9so6282690276.2
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2024 06:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727875059; x=1728479859; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EQnoQWtsuGD+LuzrYNHU9VWc+WEoxNhpL3UZMiEz4RA=;
        b=EQIfCvSaptDG9IFRNOg+zVnEUaKpcehahkIDqXWVD+Tuj6uNH+wfG3v7egXakSKva7
         cwAfK0tPFOPEJmZpG7OZxHMrgcfNBu1Fb5Ogv+VjoswhBWVPExPgfz2WlSFp8HkBPf+1
         pi6FhXnBUSjRLmZyhs3IoQ89PwVA9wBWOnO/MNXf84htrRIHhSD5PcYO2lGTgJ9VYRx2
         ffpwHVRUaQMhXk79xjaInCqzsuR9lZ8hA4G8WPuXghWWK50wRklm1E3M/ZajEAuzwbLP
         o7J7i6dRdzuDbNpEuwyNLhwXQ7Er42iEOtop1usYbrjlvS9AdOXjEQCqLZePKN5FCh9M
         8WIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727875059; x=1728479859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EQnoQWtsuGD+LuzrYNHU9VWc+WEoxNhpL3UZMiEz4RA=;
        b=bBDIk2ikY/y1kkRcDAdqGVRxLZ2KlOWqED2xDtRPKiDumEisewVBUHQ7H5ExAjjPJr
         aERSj+uEWTHtHJdYGggH6k7Hen9tHsf43yRhaZTyuY74NIB2Rvgo11dExYMkMtcwlpan
         TOR+DlMgkwDE7D1BpLak69eB1HT34LPJzdb9thQp+eqO/DGdUrrXIVl4kkBhB0OvEmU7
         i0h8w9LIcNKS80C3nLqDPrvPSSqcj4zrtVqlZ0hBNUSo+/TVTHNpgGPp9IjF/Ufkn69g
         oXHXf4N4325sLaN9+JcNkX3UJ629oKtkEaacrrVjJdjjV1S5yCIYvW0u6qWBXoUMVVaw
         xQHA==
X-Forwarded-Encrypted: i=1; AJvYcCWDaCGM0sqS7ozd4rRInBzqA39Ftx1iw11XxOTNSTLrW2PT5Y+zhBZQtHBuppJnvJCDuFsE/7MEvC+z@vger.kernel.org
X-Gm-Message-State: AOJu0YwNxl2e/6rTHhfeZSXW3ZeX/y3DXPd/RRCufUFSb7m7m8URGQLB
	N6cJ03OpBoQZRMn9CAfSCKFkU799tZesxiA9F0ScN/Ue0iO+FrCvSvPJu0kcpmbHrLpPIQkcSIe
	CNP9j72NzFSuVkmml3rzgERBDsv2HxHfJBGAHQA==
X-Google-Smtp-Source: AGHT+IFKPdvFB/MIXBnTTTels4FQ10s047q87gh9N2MKOl3kAi22pP6X3loDa5ir9ZyNilvwZBftNU/R/9JpA7UmDW4=
X-Received: by 2002:a05:6902:2508:b0:e20:290c:c646 with SMTP id
 3f1490d57ef6-e26383b7a5dmr2391246276.17.1727875058729; Wed, 02 Oct 2024
 06:17:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240930163207.80276-1-brgl@bgdev.pl>
In-Reply-To: <20240930163207.80276-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 2 Oct 2024 15:17:25 +0200
Message-ID: <CACRpkdYRCf6+-7TrBUbGMJrXEy7LY8FrSoqLX4=nOFMSmSLY=A@mail.gmail.com>
Subject: Re: [PATCH] gpio: aggregator: simplify aggr_parse() with scoped bitmap
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 6:32=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The bitmap allocated in aggr_parse() is always freed before the function
> returns so use __free(bitmap) to simplify it and drop the goto label.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Very neat!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

