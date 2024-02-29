Return-Path: <linux-gpio+bounces-3961-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A97486CA6A
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 14:38:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C82F5286BC6
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 13:38:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33FAA86258;
	Thu, 29 Feb 2024 13:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z9Kqqr9S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE4E823B0
	for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 13:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709213925; cv=none; b=TaCDvV1HDLhj25rL/Zj0yR7IpNx3UL7xr/2QS9DbQpM6GenS95AfVzLuSkpnMwAdo5avwFaXKnZWSi8FyKjrh+hokFGNkKXOETy7p4rzNnvWLMFfMWO73fbdqIOprGaIxyYc1ySfcipiylsAIaUP4jS1mN/F6jJ2kEsY1YWjNX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709213925; c=relaxed/simple;
	bh=IgTG61UP+6FyhLCLuzFpVqoxtaeq7U//LN38utfZLxY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rXD9Iw5MNDapB7Exb5CFlAM4iLt0bQZhoQ/z5lPsm8lo3Hu76E7ZUz/PsSr/TCOTuUXdjPTTWTOOIyA5ZTgny7xUsjFHUpziEPZhYFNB7swbOVgSwTwDWwk5ZFDJjgqpVAdNmjj3VOqR2s08uHAZ3D3JswooqnJl1yZtt2BCSRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z9Kqqr9S; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dbed0710c74so860107276.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 05:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709213922; x=1709818722; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IgTG61UP+6FyhLCLuzFpVqoxtaeq7U//LN38utfZLxY=;
        b=Z9Kqqr9S/du3pt1DwFfxkty40yun2kbpGuXsls5dArBUx/N5nf0Re8a20KcqiT6fKW
         lJPnCUJNTM8zXDByFbLsjX/fYGj+/ppiHliocmsw3DrOf1iJeMYH6JfrH8O6VQBFRRRF
         exkm7IL+683UWpHoESs3jDULwNysjpRgaD3bF7CZk3KKLx+1eQ3JZI8DG5UjpomFTuAH
         04v38upX79vjFkOi4+uR/k4BkT6PT87/39Wqel3+MxKxbWArEG4Wtu3p8yh8mIu841Z1
         hx7EdqH/FJJLtS/vKp0nWNlIRQpvD58AmGICvJEcpHAhH4MO/KCZtaJYvfUjcv/D3U//
         JIqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709213922; x=1709818722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IgTG61UP+6FyhLCLuzFpVqoxtaeq7U//LN38utfZLxY=;
        b=YS6C3q/8UNDRMPaSFlKS+V9BfINqQ7iToYyXhYLPGaQOfdGCya8WevkTwEpbvG/Ff1
         RHdpvPW3U9YBPD9VK8yWuZcmxy3I0raPbeCxvMZs1ZlH4t8Mh4lcKtMryuOSv7rG6Jr0
         eoWDFG2UQ469dbWGPArf+Bmvxr7S/rE4rIzeLESvRjRjj5UA3sIyXhqH62RL+sFGKPzX
         TWjoXDHNN5RYWzJv+H5TQdak9QLgkM6CSjXmBbO/Lknb0QldCfnszjQ0ebwSkCTvJhkG
         d4wOnGWWFFDMIKUJqgz+gj7Lw18qgDn3plwfHVgnhe8fh+8Y/T3rD3jSlgSRmvQUOHyh
         mMjQ==
X-Gm-Message-State: AOJu0YwbOApaogjy8FuZqD/Idtbvo/PlsemEP7tj7RqVFceKjgcpWYDs
	jdZGxdz1ldl3soJnlJOeAc0Qad7imBf8386AfyJCsjrAbC14nVnJugEUE25r4QtGJ9vY8KJSxJk
	v2sZWs1Jsir6BHfEb2T6O1O6ibL5L1DoMgCEPHGizSOeaEA8m
X-Google-Smtp-Source: AGHT+IHM+r25TrBY9AX9ipefyLXUMLaheRjIdWYWuABgl1FVp0VyIn45HlK3V83H/L/hgt8QY0zg7MnvQFGOqbohVwM=
X-Received: by 2002:a05:6902:2193:b0:dc7:4b0a:589 with SMTP id
 dl19-20020a056902219300b00dc74b0a0589mr2680154ybb.55.1709213922539; Thu, 29
 Feb 2024 05:38:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240223162850.3914349-1-colin.i.king@gmail.com>
In-Reply-To: <20240223162850.3914349-1-colin.i.king@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 14:38:31 +0100
Message-ID: <CACRpkdaPxGX249Uu5GsP79+ga2=k40u2+oeGUYpEaXAnh4+F0g@mail.gmail.com>
Subject: Re: [PATCH][next] pinctrl: ocelot: remove redundant assignment to
 variable ret
To: Colin Ian King <colin.i.king@gmail.com>
Cc: linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2024 at 5:28=E2=80=AFPM Colin Ian King <colin.i.king@gmail.=
com> wrote:

> The variable ret is being assigned a value that is never read, it
> is being re-assigned a value in every case statement in the following
> switch statement. The assignment is redundant and can be removed.
>
> Cleans up clang scan build warning:
> drivers/pinctrl/pinctrl-ocelot.c:1404:3: warning: Value stored to 'ret'
> is never read [deadcode.DeadStores]
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Patch applied!

Yours,
Linus Walleij

