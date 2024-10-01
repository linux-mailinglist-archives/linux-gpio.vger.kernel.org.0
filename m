Return-Path: <linux-gpio+bounces-10621-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE48898BBB5
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 13:59:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 769F128457B
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 11:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 512931BFE14;
	Tue,  1 Oct 2024 11:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s5dwuVri"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711AD1BC09F
	for <linux-gpio@vger.kernel.org>; Tue,  1 Oct 2024 11:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727783940; cv=none; b=Ud7eiDrQorv+GCOkXhYhxc6NMomiC6oqDHOnCOAGP/yvi697oVRuFBwGS3+Xm+8fiVcSUNNykMB1l7LYSZUXAdbHQkXiPJu3qNtbl4B0D8B+RoAhTnfW9flkUmfEVRoSEwF9/uflsWSemsMWiExgL5tmriZ9OZJNQPdD7+jErgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727783940; c=relaxed/simple;
	bh=tT3uNe+7OwJiWl6dOd3zCd4RwjUbE0KVnThqCE7dP4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eTatF6jV24MFYPtAidhjBgpltRIIbYzZ5dWzg3zVWWR7BprgK1/IODH/BXF2hnBLdkFv/lMv01ygVpGrhQ9WsT+VLHStV/5uIKTr6BjrHB6BvOLNCvelzUZbJQR6Q0jV1avNrfCRzoUOgW+qAlOD5dawgMspWtMTq923tORlFko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s5dwuVri; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5389917ef34so6226848e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 01 Oct 2024 04:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727783936; x=1728388736; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tT3uNe+7OwJiWl6dOd3zCd4RwjUbE0KVnThqCE7dP4w=;
        b=s5dwuVriiLT9PY5kTmOvohth7wSiLhztspRypJI12NVtFer1FkKSP6ire7gzXZW11n
         xTU5RHrRmTl/LUuMhqp9eRaBI1PaDi83b5ozEj/YViQYDNDalZ5r6j64RcHQG2cup1nI
         TmW7h45WfAAKE209ymc8AbB+HYcEJwTeSdDP5Jn5Mu/gCFlh5wtSiV75VMpK5ZHtZB06
         zERlJFCPf/Eva/zCdWvLr3H3P7CdAzGYk/P9gYGXAfEQm+wwqV5l1eWZNCTBraD5z0KO
         YgeOQJZPaUbghMaiAp2BHS+MoB+kj3PxOsMViY63nK41q5RByjtMVSa7aeO0EimH9uaz
         WTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727783936; x=1728388736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tT3uNe+7OwJiWl6dOd3zCd4RwjUbE0KVnThqCE7dP4w=;
        b=bzAPSSs0Dip5Iq2Ra+nGVDgbq5/XQZVDYf4OLBbq9VUcIkkpB68Q2hVv423chGi39F
         1MzY5zAA7/VPRLlFbMTMVQf16U4dWncBeOLy6Ny0Qwu6XTi+ORWWZk8bJrC1v9s4ghpn
         oBeW70Nn0hT+d9hKgSugneBC1b62Isi8NXvhrTJcKcW/jkENp10XGYA0jLnGMN03IE4a
         EZNm++3lo4b9T6ZrbyK5sakLyX0MFYNZVSvUGbdf2SpkqUoSHRtplj2TapYDi4M0AZ7X
         t5r06cOWmKTuaqU4zOlw5MjVBahgDwGNpPuCpz9aL4cSenc4RpZpoJsq7H6mX+nKpD6h
         L8wg==
X-Forwarded-Encrypted: i=1; AJvYcCXDYLslmmsvj+DEgrKREMesJX6Ispfa360X0PliI/ZbaJOJzTC8Q/mNgDmamw2sb77zcN6IvmaOCWNM@vger.kernel.org
X-Gm-Message-State: AOJu0YxPeV7mswk42SSU1vT1DcIJJju/cIGuL5FbcbIxNyxRDllsnbog
	s18Caqs1Jc5ODlnbyHbvmMgmi7pRt+SVByvKF6Ezy6rv1EdIq0lNWuP+A1f1ZrfPkzxxHRmx9fx
	WjOvyl6tAp7jU9buVhzzUhHcia+xM4l7jiPzmgA==
X-Google-Smtp-Source: AGHT+IF1aWSW3u0bVeF7TKArbk/atdczzyQVZ7HJ+FgfyXMEiW9tWm+hcgU74jnyncTE1uZzGRzCTWRoyijV6XUmu6w=
X-Received: by 2002:a05:6512:1054:b0:52c:e05e:849b with SMTP id
 2adb3069b0e04-5389fc63377mr8318002e87.39.1727783936401; Tue, 01 Oct 2024
 04:58:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240917-lan969x-pinctrl-v2-0-ea02cbc56831@microchip.com>
In-Reply-To: <20240917-lan969x-pinctrl-v2-0-ea02cbc56831@microchip.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 1 Oct 2024 13:58:44 +0200
Message-ID: <CACRpkdZWp8W5W0BLzCJ6hHoqMUwCr4oZ7XZS3RbZ4YYNp__h2Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pinctrl: ocelot: add support for lan969x SoC
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Lars Povlsen <lars.povlsen@microchip.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen Hegelund <Steen.Hegelund@microchip.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2024 at 2:46=E2=80=AFPM Daniel Machon
<daniel.machon@microchip.com> wrote:

> This series adds support for lan969x SoC pinctrl by reusing the existing
> Ocelot pinctrl driver.
>
> There are 66 General Purpose I/O pins that are individually configurable
> to multiple interfaces. The matrix of available GPIO alternate functions
> is detailed in the pinmuxing table of patch #2.
>
> Patch #1 adds compatible strings for lan969x in the dt-bindings.
> Patch #2 adds support for lan969x SoC pinctrl.
>
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>

Bindings ACKed and no reaction from other maintainers for two
weeks, so patches applied!

Yours,
Linus Walleij

