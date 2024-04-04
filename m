Return-Path: <linux-gpio+bounces-5078-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 874BC898622
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Apr 2024 13:40:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4124328577D
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Apr 2024 11:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA9CB83A09;
	Thu,  4 Apr 2024 11:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vhKZZE8L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E47F82C63
	for <linux-gpio@vger.kernel.org>; Thu,  4 Apr 2024 11:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712230824; cv=none; b=V4HmYU2ua+ZDyk+zj6j6EDKYm0hEjtc7Guc/3QE5ZD5irS4FvhHzeB2l9mU5sIxoGJUDFnb0vzPYYCmIzyZD9wQc8Z2DMMOTxSPQzHhJMvHbe961OuMgxu83BsWnB+IFYsR1xR8Hxw/N82vde0al8s1xKNxHNSGdtJajEADnPrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712230824; c=relaxed/simple;
	bh=WvmD+zW80mCHMaqxRf0H4QSSZ96J4F1GjnqGYV5LYDM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jk8xqj4fcQcnY3OLm89QrJaoZzOj9+yRM5R6NDRRS6ay0HJ3jPVW1FKNkQUpES65RfEwx2jSzBOwrS24u5pk7+4uxzcnE7liWzN/w27hUAgUdpkinASY7LTC/sULgDdKOHgk8f/IK5GBEFGVw2NsEc3GY4VwWVQyGGTnAZzUjEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vhKZZE8L; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6152ad16cd6so10314337b3.2
        for <linux-gpio@vger.kernel.org>; Thu, 04 Apr 2024 04:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712230822; x=1712835622; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WvmD+zW80mCHMaqxRf0H4QSSZ96J4F1GjnqGYV5LYDM=;
        b=vhKZZE8LCUpC7TmGcpPZtmobq3VonzCnzr00GKruaz8H8rS+3A7Vgtxpelw0ex6SnY
         TRnihWCzbzGP/SGsbz+/BEcH8h+M7zD8T0YL+sNKPS/fXGq2zR6oi00VOqvCWEYmtGh1
         zI/lMDshyoJvrv5JfRYqICI2nVaiMr2LVmakqKrd2Ysu2xLh8b2U5tPM0+cgJllv2/I2
         Gw7K3+xuHU+Xnsp2OPAxmQKxHpMLt06ZxZYnrhpBiBTOGzNn+32Sl4GuhO3pyGoDIELV
         OdohM861Jgk/3c3kz+vkBCE1EvY0SoQJNo0VqW9VOyqjIWU1lwFg5lbvZhJwTNPE+wkq
         Dqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712230822; x=1712835622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WvmD+zW80mCHMaqxRf0H4QSSZ96J4F1GjnqGYV5LYDM=;
        b=eMPEyNIQp1avqo/CEkR3ujnRHHpGNuOY7Hf6iI6kNGdh2p+z1EOscbdq/tP2X7N9Sh
         qG8FLDELpjVAGB40P5Gv8tqBvPG9+O44ZAIDmCT3DYYIJBT/216ZiA1XEgzTLhoFpEgt
         G6jgADsY3iJ4QVTJ3lNzQt8lB8nOzwZt6ctn6+/fzQVPklgwBzIe0I2yT2+aTSSII1n8
         u8RNXZv4AWUvFOO4y0ou608C1ZZ2gejk2BHPGGDyl4XxfCeDMVryHLZ26TV5RpgGZ2lr
         DLsnUVpUQm7Wn6FUvroJXiUKujyO/r8X5DcCL+t2En9v8JaGLi0hC1GvX9dpi0+4KmYn
         dCLA==
X-Forwarded-Encrypted: i=1; AJvYcCV3LxVw3fpURBtQ1owU3A4zlDpe0ucUc1yKZFhMv7SltLOKb18MSboj6VcuCwyLwGvF3Wmd+gKqLIawHikVAv/NGAINfBvOOJxKGg==
X-Gm-Message-State: AOJu0Yy8I5DhBsr4QH58RRpSfZ9Pw280vAUZzR4PpKK0iJqOLURfu9fb
	mmSduoPOMbfFMZqHm26ryNMksYu2cvhts7NDBeKXXrUEI+mnJz30QoKHpAOOKKSXiQGU9vEpx4v
	GnUc3mmjVNC+kIAl9uSdJ81F1icclkCOoea20lw==
X-Google-Smtp-Source: AGHT+IGd7buOnq4d3z5iEEVkv54BdiBPBzE/CfnnmwzmaRZinGTBmvb2QLdzwpSE7CR42SbuiExNTwe5Lviz1MibIB4=
X-Received: by 2002:a25:8206:0:b0:dcd:a9ad:7d67 with SMTP id
 q6-20020a258206000000b00dcda9ad7d67mr2503123ybk.8.1712230822049; Thu, 04 Apr
 2024 04:40:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240330210954.100842-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240330210954.100842-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Apr 2024 13:40:11 +0200
Message-ID: <CACRpkdZGMibZe1xeEBDGBZKtpw2iDhBnm4W2+Ef+KMMDG5BaCg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: sun9i-a80-r: drop driver owner assignment
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 30, 2024 at 10:09=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Core in platform_driver_register() already sets the .owner, so driver
> does not need to.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied!

Yours,
Linus Walleij

