Return-Path: <linux-gpio+bounces-28277-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD23C4499E
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 00:02:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C1D224E4B9F
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Nov 2025 23:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7F4F26ED28;
	Sun,  9 Nov 2025 23:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="coGoAD+5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E133A221540
	for <linux-gpio@vger.kernel.org>; Sun,  9 Nov 2025 23:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762729323; cv=none; b=BPaKw+eWbN1klgQ02pd47Cx2Ddq+BqbA7UOSlFCnrYdiuG5dV9/V6GzLOVLf9V2zHtAxbLvK52vzdHtxqH85R1kzQnOx6GmMOd5k80R0Sp7NB+5k1d/J5H5ohsFUNuUjlLUvS6clDBptx6psMCXF3n2rHOEWcJ26IIGFsdtX1H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762729323; c=relaxed/simple;
	bh=3/L0T8rSm6gsiLWrh0ubcOyIYT6RaCJ1Xiq49GwI0nI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p6kMf+2NlVd5bqOEQXw/EnkKBTG7PbV6u1mVvQUTADgNMk/6HnfqFmtqSxBz+NJJaU2Zjiate9ECQjTDaYnlyP/EtFCXyS6LQ+6II5ndXgpKkgWFYBidPGNr9iIWkSJQ2Z7u1/ZGn8yVD3FIox3vlVuq1/D6mYumuqJMxQM3nqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=coGoAD+5; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-592ff1d80feso2548203e87.2
        for <linux-gpio@vger.kernel.org>; Sun, 09 Nov 2025 15:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762729320; x=1763334120; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/L0T8rSm6gsiLWrh0ubcOyIYT6RaCJ1Xiq49GwI0nI=;
        b=coGoAD+5cxjVmuqTw06wNuC42yPJgph15O5XYIQAV4KHu04uIfEVw1/Oz36dpUBWac
         pVYaX2Lk2P0Wr9bPUCojavFmJUPNiw2zk2N0iZRdNa2z5s4g9R9t+jnj2du1KLxJC+jN
         21nO/zmz3Naf1B7y/8ILyhaVfYJNylzR1HZQcKBs9R5hG3f+O5U6Lnf0YKzL73pQEKA1
         X6OUAIdUpgBmvUjWwHyIXWKaTb+ud7tdaRzzBolXmsBjHgiBjuj8JFWFlEWwyuWqETzQ
         PfL1xVOwOMMKJay//Negz2oQQjeH5dIVoRHfVIWdcnrpGMNqHv13Z6vhwsmOpiceUKrb
         7fCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762729320; x=1763334120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3/L0T8rSm6gsiLWrh0ubcOyIYT6RaCJ1Xiq49GwI0nI=;
        b=LDFWWbdHLWAPw3R3JYlSnPquvY/xR55gpTnhDRfFY9a+lSF0o8ypRLcfLBXRA5dtq4
         yzLnAu5RLcpk1sXVv6e0yGbvXQjUlwxL5ryypreERUxSPBncgpsMK7MzmcgsqkUS+EmM
         BjzDvZ8vTfrXQ/Nlwn9cFmRzxxOsSOv73/5u+z3+Lf0ZsdoOeFNnO3A5j2c5uOAvVLJ4
         1DiG9yhcuLyVaIyvCSdJhgVYhUYh7KNi8xvdqYALmGv07i1lcaYh2r8HAvaUlieSa5al
         mcW8oRTScZZmcGl/H5KVH7QIJT4nX9Z6OV4RZQDQ1kLBIF1N6xlabauhshZmNqS9ODiV
         W0FQ==
X-Forwarded-Encrypted: i=1; AJvYcCXj0mToJa7GNQcG6d4Hv/bIyrBwlYhs+sFvPnlwbE2kc/vydd7FdXud4hzLED1CX3FVtik5BoJljANG@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+TxgWSkBaA70aTod6KFyJRKcTLiG17RrJz6wzR48WFNQmvoru
	FRDnIVr7vcYFD3m149vRlqI60+N5n+GWvG0H5ClldvCvhFFIUFCr+udv2j+rcNNAkzd7JVVqf27
	hUtpFUxE/RnYUUg1hZLAdaoCB+181tphm1Ivgh8sF5Q==
X-Gm-Gg: ASbGncsPboP4Gd4ztGSMkA+yZL8cNqDIuPQWRSugNUZuouWf1nBy7CbmV0RwV0Il6bF
	Izu5p+ZQtuKhvpqWNxg68nG+AaulKyEaD4h8+AocQdDjnFdeekAai+LhKAa0UmxIEzcd8EaK4A2
	CRIgJDwV3Qxq2bPgX85E3m7D2VAZmHVBQxa4T16LrRn+hXh9nkhNqK8cst2fHZNKoFmYiozK5Fh
	7oS/GsRr8mT9m+t+JbyBARCqnGTvxgh8WK51j7NPkOiLBKBnR0aHB/JXZOOngi27XB5qOI=
X-Google-Smtp-Source: AGHT+IEJqZS9dOiS0BTy1PWLU/LhcYPWlnuekntfeZstCDkN8jIWeEWUqE9o1x1da70TwTio8LtGZ7NuzutBZINWzRY=
X-Received: by 2002:a05:6512:3d04:b0:594:2df2:84ab with SMTP id
 2adb3069b0e04-5945f186cb5mr1826403e87.8.1762729320057; Sun, 09 Nov 2025
 15:02:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929031031.2230-1-vulab@iscas.ac.cn> <20251028030509.835-1-vulab@iscas.ac.cn>
In-Reply-To: <20251028030509.835-1-vulab@iscas.ac.cn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 10 Nov 2025 00:01:47 +0100
X-Gm-Features: AWmQ_bmRbj12Hfpc6B_yMJuZyJtxM4kU8pIbrDCZ7L1PmiDyOKOscnGYzc0nt7M
Message-ID: <CACRpkdbwzEG8fEO7mbgXTW3nn4rLUJUidHW7GJ+-OWYtch8PNA@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: cirrus: Fix fwnode leak in cs42l43_pin_probe()
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 28, 2025 at 4:06=E2=80=AFAM Haotian Zhang <vulab@iscas.ac.cn> w=
rote:

> The driver calls fwnode_get_named_child_node() which takes a reference
> on the child node, but never releases it, which causes a reference leak.
>
> Fix by using devm_add_action_or_reset() to automatically release the
> reference when the device is removed.
>
> Fixes: d5282a539297 ("pinctrl: cs42l43: Add support for the cs42l43")
> Suggested-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>

Patch applied.

Yours,
Linus Walleij

