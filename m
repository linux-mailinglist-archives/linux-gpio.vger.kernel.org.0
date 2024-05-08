Return-Path: <linux-gpio+bounces-6255-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA558C070D
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 00:03:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FA301F235CB
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 22:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 024CD13281B;
	Wed,  8 May 2024 22:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QJC9xfLf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E68823B8
	for <linux-gpio@vger.kernel.org>; Wed,  8 May 2024 22:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715205813; cv=none; b=ACER6cIUS88jkTNSD5PjzqravXzkZuWXR7PVPrX1UH+qYnghyTDQyHOWsYjvkR2Z6JVS2l1+o47Lq04kPOYh1LiVC9Sva2Eb1GDIA7hfMZuDg1i9KhdYSVHuIphZyg63H+d/LQLvKMF1KjDoDQ2fPdolWV+YVsiPN+38UvS97LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715205813; c=relaxed/simple;
	bh=AM46cOLXSet9Rq0F91rGPUCQkmIVfDVSp4kTC9rcI4E=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rmSRpbP0E6R1XYs51EqLkb+/sbrwunUqBcpOYJ8CXZXJ9PwgGWCYBQ9pYGCZhOeNGRvOB5Q4rBu3cvhJ/EPvSOcJYiprY6xjBIHmld9Ux7ciE15K6W4V0Z3Q+CjpNgT9lnufHYe92moggkDiabDYqZzewdxCKjoFTXbHyqXJd80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QJC9xfLf; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-69b7d2de292so1170976d6.2
        for <linux-gpio@vger.kernel.org>; Wed, 08 May 2024 15:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715205811; x=1715810611; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AM46cOLXSet9Rq0F91rGPUCQkmIVfDVSp4kTC9rcI4E=;
        b=QJC9xfLfA8UjBtQ176HZUAgTdNPtnY3nY2/FimIC/l+LF1CPd4TLw3l6DKsPBPXhfl
         0EoEb6JPg3jEXgkh75L8xM6S7L+dVVFEgOBuQy7W58eCoaAG690mSJWbdazOw6uH+wWq
         DIkvz7xWq22RXJQKPpQoTiPy86EvjGTftC6z4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715205811; x=1715810611;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AM46cOLXSet9Rq0F91rGPUCQkmIVfDVSp4kTC9rcI4E=;
        b=RAEB0XDXS8uVCIwyzi7ucTunPVoiX9rTOnN6bHB371xAyZpCoYNy8Bm0DBhsMyHFcO
         x7Pg2SfREdhib75vugzLGmGS9jrSIkz6eXZBGM9qBhx0VWYLZYIylFvzt7kqNh8+R0Eq
         BKENdhOqTXv7mxsUW/1gspmwFgE7di8FQm2kSCzDg5uR/BeYugviKBD3Y/JEb0PUbTOU
         87egySiDaeL4VwbH/kAy9yJsk/9zcpp76l/w0YUobUQq02naXBm8ostQrUV/qk6TlMZC
         70RdEAamO0XkrHfQnZ5VNp2D3gp3xN1vB2vHJKffmHA2lAcBaC+AYnjnCS6hJTDQzuO5
         nqbA==
X-Forwarded-Encrypted: i=1; AJvYcCX+G8AuMgXcWZsJdDN1bQmc18lqJXtp7QgIyhG2IXfgh7kKQ1wmXtg/Id/avEBXARt5kN9+HMwh4D1AuJlHxMHYA9IC2FvYjE3Crg==
X-Gm-Message-State: AOJu0YxDSyxBH6wwCumpKGK/dNIOVlFlnW3J1iUpIfMnmPk0BAnbSB7S
	Ode/VKmaVTNv7ES3NrJzYMiKpMsO9DR5ODzcpCOaBYfo9Zfh/9Kp9HRkOtGt/p08rBzJkUZMT4m
	db7blXS251h1vANXLlRI6s9wr+KdCaVrGVY6/
X-Google-Smtp-Source: AGHT+IFtdEnnb6GPWGsrQGSqR3mxqnoAoPDmQTaM9KpaMe5nAzfxZdWIF5gQgUS72PNpk2rfQDWe6gtZhnoxeZf4TdQ=
X-Received: by 2002:a05:6214:4111:b0:69b:5576:49e7 with SMTP id
 6a1803df08f44-6a15152804bmr43223496d6.45.1715205811462; Wed, 08 May 2024
 15:03:31 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 May 2024 18:03:31 -0400
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240506150830.23709-5-johan+linaro@kernel.org>
References: <20240506150830.23709-1-johan+linaro@kernel.org> <20240506150830.23709-5-johan+linaro@kernel.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 8 May 2024 18:03:31 -0400
Message-ID: <CAE-0n52P9-jSLmkNcPO9uOWSzogL+QmcpO8AfzeZi558VQvLrQ@mail.gmail.com>
Subject: Re: [PATCH 04/13] mfd: pm8008: mark regmap structures as const
To: Bjorn Andersson <andersson@kernel.org>, Johan Hovold <johan+linaro@kernel.org>, 
	Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Mark Brown <broonie@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
	Satya Priya <quic_c_skakit@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Johan Hovold (2024-05-06 08:08:21)
> The regmap irq chip structures can be const so mark them as such.
>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

