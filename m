Return-Path: <linux-gpio+bounces-10689-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 093CE98D3F8
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 15:04:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BEFB1C212CE
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 13:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A6EE1D0173;
	Wed,  2 Oct 2024 13:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qivo2e/9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A641D016C
	for <linux-gpio@vger.kernel.org>; Wed,  2 Oct 2024 13:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727874277; cv=none; b=tBv94z1DHIXARIoGPOH1JFrbgOhvrVV3QRGNj0wasNm6Bh2SleofLSD3UdpS0F4HJHKPDdz7A/IXKVKO+CtzyHIunW4vi30zRrYMrXrlpRGWxT+jJUHzncXxNqWeqhrBDlG0qG8A1bmZWkCfWRJ+Mh+NFt9S1yYOmr+MkdCeZBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727874277; c=relaxed/simple;
	bh=/fIycOpjSLsN5BbAckoBFIWNE8YqUlYV8RAkXscfy40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vBVQ1SDs08/8PgeZwrlVhm1OVNnMfizLuuAOufyjCv3LVqbg7hIXmfXejvcfrqF8DXvOuXRkGz1Q8SsElXOd4Re2v42dgBclFvgIKL0z2lEyay5xiRlgXtk16mfdebx9iSSvUsfZOjBZ9Sh8i2MuAkkKoiPN3mdgV8lB6YcW8NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qivo2e/9; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539908f238fso4300697e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2024 06:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727874273; x=1728479073; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/fIycOpjSLsN5BbAckoBFIWNE8YqUlYV8RAkXscfy40=;
        b=qivo2e/9d+89wznBmwcZo6gPm6jQNzUVwzrF2xtSgiyAx2CBZxpkp5Tpyjh+JOWwBD
         DraaN8DKrsD/d866fSLUNWU//If+qlbJUsNMqMx9rVSFgnumSBZ9NYAXnOTkTisrAdWH
         k3cExB0dYc/ka0VYqE5IMh8wX2yqzqMQUAPf4DW5jBUC6eVc4nespzlbOON1WkhzmZnL
         AyqsAKvNAt6gOd6saWtBPxTR/NccRdSS9PFOPfMJpH8v+9zASOxudP6Tmr1sizJMDyOG
         l2sZhQ31xemVc30Gj6TRRN+uj0TfFogJ5n39ep+2YXPaYe0kquAL/Q/X4WGVgm+SrNAl
         Xv2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727874273; x=1728479073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/fIycOpjSLsN5BbAckoBFIWNE8YqUlYV8RAkXscfy40=;
        b=LfQnUQSz00ihHbrPIavcTIh6P5qqRQq5z/3PSEPmvjsZ+BpYV4AYGL2tKhPxc2/QTQ
         qx/+3IZM7drdfkFl/BLm/PtlEH+RGMq7rOfXmwKarlIxNCI/aDiwinoiJMpFRzAvzHWC
         OI8hWZ/Bo9qWk70WrTVJHv+DwuXYaG/3KxpH10yhGRBFRa9s5RcITZXFmYUFkkOB/RWt
         53dKbdQ9l5T9wZoQFcBcUveSRpt0xFjPSDtOZRwJbaZPf/5b7vBoazIG9Bc3EEWfq0tX
         4JERE3lzmp7xjlWFBSHFE2jyQoNS+Cv1k/u7WHO2wLCVoFO1g0uegEzhNDqWsN4q8aX1
         WJqg==
X-Forwarded-Encrypted: i=1; AJvYcCUnY9YJ75FSCjJLTtho1VSBFt9pBBHIeIFKGooVh3i+wd6FPjHw41IZy28YPnugcQPC1h1VNp3aJLi6@vger.kernel.org
X-Gm-Message-State: AOJu0YxT2UQHMCuzGqOYU6vDDY3iCbAR2+x+1fE6Bbd8odIn4PAokTLn
	B99UzwUhHQ0VeHdQBUK6QZBh2AdnQ4ePUdWFiRF6m4jEoU0KvbQ6vSSA/DwMnSB8RTuT2FNeJvq
	TtiooNw9Q/B3amtRGBWhO7H5V+q4zsGceLV97NQ==
X-Google-Smtp-Source: AGHT+IG4QyEypWxp66yGczQG1KjP8WKtwfTEeOqpHMYhbQ+oat58phUwHrQdPYEaxLvZsnZ1AGx51Vzl5JVAL4d0OKQ=
X-Received: by 2002:a05:6512:e8c:b0:52e:7448:e137 with SMTP id
 2adb3069b0e04-539a065d3bbmr1732159e87.6.1727874273269; Wed, 02 Oct 2024
 06:04:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240925173504.1906872-1-robh@kernel.org>
In-Reply-To: <20240925173504.1906872-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 2 Oct 2024 15:04:22 +0200
Message-ID: <CACRpkdYh22c08kLWDJ3wmK+i9-C2ngXdJwhg-kAXfdy2+mcB0Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: st,nomadik-gpio: Add missing
 "#interrupt-cells" to example
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 7:35=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:

> Enabling dtc interrupt_provider check reveals the example is missing the
> "#interrupt-cells" property as it is a dependency of
> "interrupt-controller".
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Can you please merge this into the DT git tree?

Yours,
Linus Walleij

