Return-Path: <linux-gpio+bounces-28759-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4EAC6F125
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 14:56:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 762C72EFAA
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 13:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28E223624C1;
	Wed, 19 Nov 2025 13:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Snt6j7LM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5F83557FE
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 13:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763560329; cv=none; b=R6fNTPgWEpDgjl8DhiA7KKmjNL17mUWI1TNkFVQHRGnxm3WPOA6OsjjGldH01tKaXcWMCEbb8qnYhkqJtB3644oiOIOlBe/o0AtP4d3jBahqcz7wpzbDeXEyPNSLJm1XY48bx42LFc02jHHTt6c20qgzmgJazC+1zoM7OiKn6Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763560329; c=relaxed/simple;
	bh=9Sw7qNK2MuqEfcGlDiodQEmkMQSxPXI8ojkn2672gPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OIBiGNWhupwqIcATClXDrFxoCAZKldxg+e+oWGGVug2sokUQ79F5hfKl5lUpT3g0FsFQ7Y4I3URgctIKStoUv+2Xf1FOLxRu+F5VC7HdmPaNW5ETO021EXo5eMVD4YlO79MyseaOmkOa+bVfROESEa9M6WvGedOGBNH51NgU7Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Snt6j7LM; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3761e5287c9so60861941fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 05:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763560323; x=1764165123; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Sw7qNK2MuqEfcGlDiodQEmkMQSxPXI8ojkn2672gPY=;
        b=Snt6j7LMr4k9kZO8xqFcQpVv8OepnY4KrYS3NPi2/fSBBSq+/W4E6Y+Nb50ZpN1xgH
         1Ii7RksL0kRAQipraGoxabQ66PlwbcDixQTl/8pFw9Pd/uqsViV5Y92oIQlJalZLGtzZ
         vMdf/TkiQg96uzTO70A+QrLzd+pcORoHcbgPv0WHIUakRIzziE2ug4YGa8Vhhjwx4bLP
         vhV/TGB247IWW6BenW497MUVUz7pvyHOG0uMIMfcJZhVg2TXSf8iy56iBmvsgI6N9Lny
         P8f1/kij6nMvzOElOEp1ZNAKIXanN/r2+5W21iUz8w7Abova9RFSIupEhgyN68RPpOMA
         KegA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763560323; x=1764165123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9Sw7qNK2MuqEfcGlDiodQEmkMQSxPXI8ojkn2672gPY=;
        b=L2Pn6BTOJeNTLAkEoZS42XwNfE/YLbGpYqj3vYdHG7wkSeBePMvMCq8FuwEbEOmZqZ
         456U2E4kK1fLY3++W/wMbgV36hsLja64oVxP6VFmTXc46OQT2ECiqeQnH92j/J9r7X8l
         exBECsaD05xxOtb/mQhuruW4okP976kackjttn1+x+UDxcJZkvKZrhqh6ibOmZcOCV5t
         j3y/oTJ2+PbLjQt8V39pvJqu6LWeGO2uaPjgb7AFrBo46aIKiTQAdd338RGsevkXfjGZ
         EL/kGZFe407Dtht5B3Glsm2yzRUX1BTFEgK7Zog1jhlGVYqV/xTwWgU61ZDjf3gkYROF
         brdg==
X-Forwarded-Encrypted: i=1; AJvYcCVupFtTmAwDDRtaoEe/Mbe/BYU8IcTc5dSbXEpuO+04JpSIBNK8cfRROnMxZboK3u5eiL9af/J/RwWa@vger.kernel.org
X-Gm-Message-State: AOJu0YxJDRGr9BgED01RntE0zMIoPxm7U68YtxpRtLK67aeOg7AbkXdS
	pp8ZwHhNBhWGB/BO25BDkFN+E6k5/s0Rt35+2KOnNauHY2HWBcSbBCDyAQIcGuPEMzOX23MxrOK
	SYQo1dnvHupLrObqq1uk3j/wh5l3/vX6gLhqOw7e8aA==
X-Gm-Gg: ASbGnctS5QEV56DdN3w9HE7XiY8p4hHg2aqiHzJGgEpEOBA+C+rUkkBqIbjpsXqjygs
	ffLyTIvTgkB3QtSoF9EZJfAac89cA74tQFlf5GHDIjMyhQspLh8Iumvn7DeazXhwRykASycynaI
	wWsZ1YuMx9bkUbWjE5nszcJ50GXIQXiZW9jbOYWHzkOO1/3KGRsctbcRihduh1iwOZvzg4sL9bi
	G9nJHB9rtsQrvCy/K7j9B6txOTmMbLzejdhlmw5A9bzi96qEdvzKlGAekLsg3Aqy/wmGeI=
X-Google-Smtp-Source: AGHT+IEmqj3lGDApr9edrXMaFwN0H3cZ82GlBpdq67AUQg80YKIMgCzJi1RzhM8yWFVqY0UQAGJbUbSB8ccCc0F5BHI=
X-Received: by 2002:a05:6512:3b9c:b0:578:f613:ed9c with SMTP id
 2adb3069b0e04-59584201168mr7597957e87.43.1763560322586; Wed, 19 Nov 2025
 05:52:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117-upstream_pcie_rc-v5-0-b4a198576acf@aspeedtech.com> <20251117-upstream_pcie_rc-v5-3-b4a198576acf@aspeedtech.com>
In-Reply-To: <20251117-upstream_pcie_rc-v5-3-b4a198576acf@aspeedtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Nov 2025 14:51:51 +0100
X-Gm-Features: AWmQ_blwvWUHZn6LSm0qwvTRD5Kr7vftxNarMVR6ZM3aN6PFLC6U4mHy-OgOWik
Message-ID: <CACRpkdYp4NuxDA7QLnqQ_pfd7sFZuDjCuZQ8Jim3BYXN=u=2Xw@mail.gmail.com>
Subject: Re: [PATCH v5 3/8] dt-bindings: pinctrl: aspeed,ast2600-pinctrl: Add
 PCIe RC PERST# group
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, linux-aspeed@lists.ozlabs.org, 
	linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 1:38=E2=80=AFPM Jacky Chou <jacky_chou@aspeedtech.c=
om> wrote:

> Add PCIe PERST# group to support for PCIe RC.
>
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

This patch 3/5 applied to the pinctrl tree.

Yours,
Linus Walleij

