Return-Path: <linux-gpio+bounces-17892-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 391C6A6D51A
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 08:31:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FD8E165E62
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 07:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 563BB2512D0;
	Mon, 24 Mar 2025 07:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PMS8LhNq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505CE19644B
	for <linux-gpio@vger.kernel.org>; Mon, 24 Mar 2025 07:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742801464; cv=none; b=u87q+DfGlTVjaANOaVHtlzqy/aPYEKDcyq9LXKfF/97EMqMmbrynPa03JAgOkpYx2qeKvGNtWq7HTbrmKhhBca5Qi/glQFhlmMJWxyPtut8ovF9+BfmzSPSUyhTnon+UlWPbUEQoE/WVt43In/vN/VgCxhVmp0IWNbziVCUgDYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742801464; c=relaxed/simple;
	bh=wFVPP9vrm/IpUuXPozdTr3WZBrU9bbE4t2LjemtCNYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jQbSt3YPvjKhQQX8BZeCRpd3/3G63R78gW4z61biAtQd7ULiUSVzQIN4nq8VfX6ezW8D7COjQ2w2SQpAhwBK3jjNbkyxJ2aOMVN4YRJvHT7lX9Vw/4tDGsXajuQ+RehO6AqY0X9yS8zgrwKRzkfZMuNWPSbZVrhrs6J0IwI0XLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PMS8LhNq; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54acc04516fso3650691e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 24 Mar 2025 00:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742801460; x=1743406260; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LADn1kANv9yfbuyperCIqqOS/gvroECf2fXmlFm+UsU=;
        b=PMS8LhNq7rRUO385P4lXW0rU9qKg8qHy7iNAP14PbUvuYpHdJwsPafAvU7mBZkAt74
         oZ63my8crKLFLangHhp2bbcP1ZbXRVFz/gcX8kqTttN1DJMS47ItXCAvv5dJBgvyJB+W
         xp36pG1IoP1D/qW0HQOt7rq/Ept4rYSUHshiI069ahdLD7t0GQcg6XuzfzIj5zE1rtJH
         CX6lLcnrUJAGd0RSkFU0nPcO5VF9EVsYnUjx9of1q4Hy5fT2Ex4WcUWyC1zMvARoJzpm
         c1GCCMbcLYyQn5RO+ki9PI7byFYbfPZFCIkmmB9yIsVIkKkmbbETnfzLTr1c8wa10tLv
         aqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742801460; x=1743406260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LADn1kANv9yfbuyperCIqqOS/gvroECf2fXmlFm+UsU=;
        b=QoTZgTbDdEXWElBuQKarO/xaj/+Lb+bJXQZHYwMVCK8ouzaC0COcT7EkC5A7DyuMM9
         6n4Pg45kxmN9PgNJAR2vPCx/zH3E+fUZX+OlugNZhTHfkSCTMnkKSWutZV2euG7OVgmh
         MnpjbXbAP+zAuOSRMfo0HAKrm1CcgEku+P7Dxs1cUDc62Dgum5JdtbDUYjps5j/kVgp1
         hvut7DP1omUjrauNzN48BNmYT3lYB+M0PFHk00nz42krsG7DHrOr1djUamp0TB0ePXD3
         vjuixk0QE8r8HlW1F+/QgVUIURVc4xbytfcYRC2f/yKHb9j7qrTATQxM+Ki8BPqe8OTw
         uFwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFPA881xANFjlxNUic+QRRSmxb7pbuWVYHpwaoECgdxOjFd/bEvbgpzulVVvD0a8y7refwM6jXRJ5O@vger.kernel.org
X-Gm-Message-State: AOJu0YxGonZs+mFBsewJF1yrEKAddq9kSII79y8nykzfScK1xDC1PY1e
	iwuQqvFIR6uDsvT3INC5mQkrUddsLw2M4Zq6pbHD7S52FZau5AO2VBv9WULz3WjqhUOkXmwIO3d
	nIj61A3iVsN/euRpnFTT0V2Utf0whlkMwzjnqZg==
X-Gm-Gg: ASbGncu8alv8Z9S4oF+azprdKubUr3EkV1cuZQVShncmxZYJPOldo19tF5/uWdyYjZA
	HzqKmnGVfGtYxV2TrZqq7zw2pyqphgsLacmXfFDoKfyUJqgGceb/TvKhcpkbTwXF9dKQfOznX9I
	e7dDkb3ruh/MCeIAYSavfA3Rg=
X-Google-Smtp-Source: AGHT+IFfY75E83XPsnnpR4d1GJLdT3BEM1cMFJPNDF5onGmESgudM5Wglz+nZtIx6LfxsWNWpFn+XfQWwGmynVuCBtU=
X-Received: by 2002:a05:6512:b99:b0:549:6460:6b6a with SMTP id
 2adb3069b0e04-54ad64fbfbamr3771531e87.46.1742801460181; Mon, 24 Mar 2025
 00:31:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324-wcd-gpiod-v1-0-27afa472e331@nxp.com> <20250324-wcd-gpiod-v1-2-27afa472e331@nxp.com>
In-Reply-To: <20250324-wcd-gpiod-v1-2-27afa472e331@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 24 Mar 2025 08:30:49 +0100
X-Gm-Features: AQ5f1JotataG0hZSkN3AGVCpQIszAGWu_3pPzj94x551CNQv3UQ4vd0DTWvGPVg
Message-ID: <CACRpkdZmaAg-CMp1PhR69-VPnP43DigtaEy8aAd0MhUJ0gcWOQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: codec: wcd938x: Convert to GPIO descriptors
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2025 at 3:28=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> of_gpio.h is deprecated, update the driver to use GPIO descriptors.
>  - Use dev_gpiod_get to get GPIO descriptor.
>  - Use gpiod_set_value to configure output value.
>
> With legacy of_gpio API, the driver set gpio value 0 to assert reset,
> and 1 to deassert reset. And the reset-gpios use GPIO_ACTIVE_LOW flag in
> DTS, so set GPIOD_ASIS when get GPIO descriptors, and set value 1 means
> output low, set value 0 means output high with gpiod API.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

