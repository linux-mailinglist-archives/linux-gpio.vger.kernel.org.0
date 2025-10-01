Return-Path: <linux-gpio+bounces-26696-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EABCBAF3A8
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Oct 2025 08:24:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55DC17A36C3
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Oct 2025 06:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F06A02D7DE5;
	Wed,  1 Oct 2025 06:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WBmH2+ws"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4EA2D739C
	for <linux-gpio@vger.kernel.org>; Wed,  1 Oct 2025 06:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759299865; cv=none; b=UbeaGAElNQXVn8jxfyooV7V4dIiX0IPyVcwxAbxgYynONEOe2Aaq1RDEgLptCQEB1CyTZFGJ+1blTERnzvzN/4V/OeAmun64e/ZTdPFcTFHWEbIJCVNgTWpeFthIghDR7LDdRZqdLS79NmCkQcHf1tQoBaI4xwA6hLnJ+s7WMKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759299865; c=relaxed/simple;
	bh=CRAgifSudG0wZpugBPM8hbg3tAFsd9BARcUmc0q8uy0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SzhqxPs+BO5s+inuLs0GoNrYYcuswbBNunIaNjAwneRld+SHz46gcxZHG8EsmwvCzg6l6HjdDQy2nrbgTlvNxckPRBdYunRmZG0udfRb+ppiaX/7MA5/GJXLqZ0pimU/i5CB4fDvyJeb0f47WETkrF4vqiMhJjJ7JrFeIdQrXMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WBmH2+ws; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-57f1b88354eso7282177e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 30 Sep 2025 23:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759299862; x=1759904662; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CRAgifSudG0wZpugBPM8hbg3tAFsd9BARcUmc0q8uy0=;
        b=WBmH2+ws8/DDuBObE2cAr8KZ/24nrJYEIYCwS+M7mxGUmUwpdH3/oskZ2UqtynHEun
         RbP2kdtvDP7liHTY7D0oF7RdORfI+HqIrEG8bC1bkBIFgoD2/Yl/x8OXTx4msfQV7+Uk
         aDP0J/wwS1CbmxhR7grMGDhEqp5BmBP1Bp4mWug7YdxhUubT9IVlFfeuJTQY80jmRdrA
         5YHHFLH0shOZ380FYVXwdhKOUcs1cNa1/kiNTVBNP6rLHKXWICR2pWsScOd4Xr5LFCib
         l4CChbXU9ykn0RNwTi0ulhcAfrCw0uyxFXw/ntewc9zmIng2QDGIPBrCMdzMJa4HBkBB
         16sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759299862; x=1759904662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CRAgifSudG0wZpugBPM8hbg3tAFsd9BARcUmc0q8uy0=;
        b=UlbgwOfNuchO0nhSj+/SEiMslj8QOUTJ97CHpAGkRICO6CnIJck9gaztJTFsSIyNJE
         Ltm+NkTNLXyB6d5NYCnW76TlWPrGD+SX2dvtHUG+2YXRfqXToArDZWLNWim7R1Ak+qhg
         hI8uOs5UdvzjxyvBKfv7B7RtwIZXWCHcuRKWMvYJ9SNk3nN7dA1GfHeRcun9Ji5cbVF3
         gRtj/3J7+Vd7tVSbRu/LWVziklGI3DAiJDTWMGKGGp4CJgohERl6F5YUuLqHtn8Uafec
         hjttF1zahMcwao9/4M4fcwmLt7oXsH1lrPD2CfRhnGOlH0w23ELLzc31qTjGE8JO3tXn
         nJ/w==
X-Forwarded-Encrypted: i=1; AJvYcCVsUH7awRPmB+zQD2Les7wdx1C93HR0bO96TdJ2P1kDvYxlT+fqHKEPu0PKFxOP4rEfXQDqKUqaD2ER@vger.kernel.org
X-Gm-Message-State: AOJu0YwX3nqE0/SBkBmO0iaef4KY3coNxRQfmlBbv9CpNZhkArw5F4KN
	6P7fTLiEoHim835kPigPG03EioPI+ggW9n/yhIoWJsEDMGu+nIKhHRRND6xRLIlCDPN5W8AClUz
	3jJWXYfb/ZmWJ05pKEp6Up8O60yBsyX9X22+1EiN8nA==
X-Gm-Gg: ASbGncs0ujLJbg/j8cROTSbM7zkQGuj6Z8KA4KJu2NgbNK4QkWQ5tm0Wn0DJNDtfZ4D
	lzn9j319VwNAE6T893SuLMStIdYiTN+t9dmMaQnKujy3rj+pmJOOGrFtX+ekwA/xsqgDhBiq0AJ
	8nnUhhmNKqDZv72rtdeiXQJQJ0SLBLbNdPFxqCP0Wh300020wtOn6pfBVmFbANjUYZrJzl3rU8M
	Q7MCiH7Dt4MJSPaz4trkhx1DUchhdA=
X-Google-Smtp-Source: AGHT+IFozN4lyb6vOpauqxIZ3ZLWPP665BWKXXa2eLUpNSUCsqO967pjOJIApkPryd/vgSxP+dQ4iOCA8lbPex5gtHE=
X-Received: by 2002:a05:6512:6c9:b0:57a:1818:480f with SMTP id
 2adb3069b0e04-58af9f6e9famr596020e87.46.1759299861855; Tue, 30 Sep 2025
 23:24:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250917-rda8810pl-drivers-v1-0-74866def1fe3@mainlining.org> <20250917-rda8810pl-drivers-v1-3-74866def1fe3@mainlining.org>
In-Reply-To: <20250917-rda8810pl-drivers-v1-3-74866def1fe3@mainlining.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Oct 2025 08:24:10 +0200
X-Gm-Features: AS18NWB7xcfQD0XZT5zZ03zQzwmaWFrlIYwfqVvy-IagezTBvTp7mSD81HURh8c
Message-ID: <CACRpkdbhTWtu1tvGQ-nY3phUeD8+0D2TmEQQUwDXhXS5thHn1g@mail.gmail.com>
Subject: Re: [PATCH 03/25] dt-bindings: gpio: rda: Make interrupts optional
To: Dang Huynh <dang.huynh@mainlining.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-unisoc@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 16, 2025 at 10:09=E2=80=AFPM Dang Huynh <dang.huynh@mainlining.=
org> wrote:

> The GPIO controller from the modem does not have an interrupt.
>
> Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>

Can you split out the GPIO patches (like the 3? of them?)
into it's own series and send them separately? They seem
to be possible to review and apply separately.

Yours,
Linus Walleij

