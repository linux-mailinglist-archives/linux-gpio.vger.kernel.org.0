Return-Path: <linux-gpio+bounces-25212-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C169CB3C4DB
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Aug 2025 00:31:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BCF2A2600E
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 22:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAEFE26FDBB;
	Fri, 29 Aug 2025 22:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YdIgCpPX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D002BE03E
	for <linux-gpio@vger.kernel.org>; Fri, 29 Aug 2025 22:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756506686; cv=none; b=piLaN82NZtSjkiaQMxm+HLJPVntqndCtlH7pGPE0dNemkV6V2NE/OSB+NyQvLq87kcSABotLrY1Am34KzKfGteYk0dXyN8xcrudw9wqccLMxQWK7ehsjm28MwTQ3x8H2IurAcV1UM1dLzOJKuUH1q2aCIYfhY0GtQmtWehRNnCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756506686; c=relaxed/simple;
	bh=ABTnhbbS7L5HkpCGOSZTEM0Im5AWWxZ2DgMSTWPYRFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a1l/k1nIpJgHPaNJ5tn4K/ZLnhQlQyg4vcfyp33EZyPhxy4vjuXkOXieJTPY8cSrbT2Gv9D++g1WfT+bP2NgocqINVKmly0vi9ic7nA/GSV006nh7nVyvMSaYCy5DFRga7C02hKkFFqfPzXW9oj8bYl4GtyiJXPq71krXs86RaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YdIgCpPX; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55f3fc15e09so2647888e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 29 Aug 2025 15:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756506683; x=1757111483; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ABTnhbbS7L5HkpCGOSZTEM0Im5AWWxZ2DgMSTWPYRFc=;
        b=YdIgCpPXRFsuA8bZTTf50yN23f5FqtX1UBg6HaM5KywgC4l2o3LlCpUjp6uDQNpkDJ
         iOyDjpVnh7ssSE08Hsu125AVnJO+74c0Yru20zIT2jVc9HnjXRZqqChzw41Qp6YTRaRi
         CtjysG7/JmN+QF7bVapac2z8VpRtU3+SNRyvDrBzGjNg+IP64Pukmbbfp5mAd4wZLUCt
         nDmqrV8mHRsGVGYOsd1Ra31KLfMw5/dTOtPESfvuXUgGmDOQzg5Qq/Jfke+E1WFl/TII
         c+MV98i9LTvo6bz84MLw90ZEVxEKlLZcUNR8q83Hk/RDP4qf+X8XTjM4edg+LN9TO+fB
         g5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756506683; x=1757111483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ABTnhbbS7L5HkpCGOSZTEM0Im5AWWxZ2DgMSTWPYRFc=;
        b=ge49RW1cpQyCB/EyI9CL3OYOehWBVGH+IxISyTPoDwalutnP/4xF395JxijyPHh5Tz
         fnmda/gtbKLA0iEUvk61OM3XSPenyzqK3Q0s0G8liFM5Rr46iIMT+W+OKgIaH4p0Vn8t
         zAtcopmeNK+sIeTByZwoSdsrvN02D6ZzPreNT+ZQBvxv/KShHJeQmFVKs4uPfbiaPKEy
         6HNHbvlnx5yZG1O2jTkRQNluJsIiciyb9Z3m6Fv4jXUvM9MFzVcou/6JSz6xztlM69oP
         3O6Wa4mUAVQEv3G3VUDw68vmQqFSamfq9k/ThPab1EMHwYwclSUSUhWS4kYsJq4N5Pew
         SIlA==
X-Forwarded-Encrypted: i=1; AJvYcCVuf6vwWKjTFnbFzTlZ+LPPmh2A0xZIkSiODDdbQHobQZyYGwNv72NEl8X5C3YVNOJsZwMsDQJpQykf@vger.kernel.org
X-Gm-Message-State: AOJu0YzbMpPq87Zquf1VVOJlusiV/kcXhegSES6pFyjJdpjo2NZFot0/
	xGzqYQGuBT+6fPnORlX2Ky2P0z32lhqNxhkzAwLPEeNVtffHc3qdOQaWwnMlWddZIrLmqW5Xtzq
	wW5/wMGg/O3ro0+ltmjk19ge/Mktg0yQMrgbcnP209g==
X-Gm-Gg: ASbGncvn8D3JtH3cWHeO0B1KfnN8bAoz3LLHonzDiG/BjTn8luOAr6dz3GbnFzesn2x
	eOW0qLHsC3OpjjxePu9RyL5wJy2d1O41BrlJJfWYFA9m5aP8aPotOPi6Ez/r6d+0tYuNp7Olo+k
	4W+k02ZTo1isRuCALZBIFdaizIitKt68MY+mwTaLq6f3R6LhaFVaf+vvTKdcHqtI5BF2fEgBkvc
	LknFpo=
X-Google-Smtp-Source: AGHT+IGEsnYhsV7tsgFN84KPDIRoOPf0/B8DKbI7M0URReevQxuA0Bzr4lMQoYrnOIFpony13QSt3vd1Z/GbWsefU8c=
X-Received: by 2002:a05:6512:b06:b0:55f:34e8:b1a6 with SMTP id
 2adb3069b0e04-55f70a05aa1mr46987e87.57.1756506682752; Fri, 29 Aug 2025
 15:31:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812203337.731648-1-robh@kernel.org>
In-Reply-To: <20250812203337.731648-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 30 Aug 2025 00:31:11 +0200
X-Gm-Features: Ac12FXyB7pgkBvR7Aj25d5oehVpWxFIRJ4xjMg8x9Wn3iT-JlQETgMnYYiDN10o
Message-ID: <CACRpkdb9NKKeDT_b40aEHW7qZPsKA6omzw_OFp37zf9pF8dptw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Convert brcm,bcm2835-gpio to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 10:33=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org=
> wrote:

> Convert the Broadcom BCM2835 GPIO (and pinmux) controller binding to DT
> schema format.
>
> The structure of the child nodes wasn't well defined. The schema is
> based on the .dts users. The legacy binding is a single level of child
> nodes while the standard binding is 2 levels of child nodes.
>
> The "all banks" interrupt is treated as optional following actual users.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Patch applied. Why didn't I do this to begin with, I think I was
confused by the gpio in the title and some stress :/

Yours,
Linus Walleij

