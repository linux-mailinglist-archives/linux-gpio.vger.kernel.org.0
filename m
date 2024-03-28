Return-Path: <linux-gpio+bounces-4753-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A7588FBE3
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Mar 2024 10:44:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 233351F2A85A
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Mar 2024 09:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F8CB657CE;
	Thu, 28 Mar 2024 09:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ydN9hIpm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E475FBBE
	for <linux-gpio@vger.kernel.org>; Thu, 28 Mar 2024 09:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711619000; cv=none; b=p5lReFv2RROMtv3ahXgY/dLBMPPISsOMPUwVyUDizTuSR3Z+UvGfjaHljlqunuW5Yg1KZXlqAxyBce/pNSqDxMzNQwHguYcN1AXyNXWrayIumchinWd+t0SznlkTG79P9iA2LpoKXrhzD05qzoiZNnWQ7HzfRowGyQeToV6H+Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711619000; c=relaxed/simple;
	bh=2bC4RkEx+VkqZ7aTbIqI3D4kCHyp83VRJ0WWVsVi87U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iuvKO6JbZmCJecdpz8L4UyQisGqqeFE31X2e+JG2CZe/1+0EdGZZXz9T+sWhg5VKdVZ9bMXVLa9L/XLH7vpht25YPjTekLthwIxbRATvYhcXNIh6BjdGYbQUFa7qVc960JAFYNa8Tx0xw4DwXlr9mtflWPOT85ZKA44eUdMxD+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ydN9hIpm; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dccb1421bdeso722857276.1
        for <linux-gpio@vger.kernel.org>; Thu, 28 Mar 2024 02:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711618997; x=1712223797; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2bC4RkEx+VkqZ7aTbIqI3D4kCHyp83VRJ0WWVsVi87U=;
        b=ydN9hIpmcogzKvl5hikYQtlK69+8rKQr5lag4xz9Z/ibEB6b8wITlrw4WchT/O6Ntj
         qUGx02EKx5nrJQ39V8e4nylcpJCPVnwhQnds7vxwDw02zirYN/Vwgg3r+9PyySuHeUlB
         XRbeGEPNEfuaaXCyaYXo2NeaPLbcNEtNb/Qlzim0aD3Dr5zqn/1He3vTGqHhaTV4FLPb
         +kKvxSOg5a9voknmbX89j4PE81vqYPtqx2oA+IcqHLqSo6CskMC/Wjx1XtQty1DQIEpU
         YRfunZGPqOPAn3pXid0J0NfcyBqDpK2E+OfjZYr9zu2odV1cw5Zrb+rORROCcGpyojmW
         gWBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711618997; x=1712223797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2bC4RkEx+VkqZ7aTbIqI3D4kCHyp83VRJ0WWVsVi87U=;
        b=HxuOKmRy183szUJ683hKNSOpioWDOqXLQ77hia0DlR9G73vN1nvZc0mLdB2L45+Ql8
         tbRW/zN74lDRGuMrfwoNzjqNGMo6FOqRmXUicQpmT1CHVJQ0m807KeSjlB+x0rcKSa4l
         /B8SC7IXJZqnZSux6SUvLEPAemIs02gNCgRGOMpouFTL4E2kQfemdk/2MCBg+q2iRZA7
         +vYMsK70ow1uPwEpS0nkGh3bCqEkiaE1EBkqBBiFzGxniU5Q8glk56s/OJiFuB1To3vK
         GR7peYd9aR2UAz+jVyeHTXVTpUJhBIEgN64GMMI3BF4K4biBQzkSNWlOy7vsnVBYS5bB
         WpCg==
X-Forwarded-Encrypted: i=1; AJvYcCVSFyirKmIDgSNF/0q+y+tTad/uTq36uZ+W74xG/vpBWVf5XRdB4sx6Vna9N4GsCIhAiyA9uv+UxBKAiT/wihBvaoCR9GYJr3ESyQ==
X-Gm-Message-State: AOJu0Yw+Kh3IPa1lJI1WpzTf9nZE9mVW+SbMSFWb5hyj4Dt6Gm8g+jnp
	32n286E9H7jR8IsRpT7vj4hZW0iTqgEg7D7I4jL0paPv2ZDHER4QuVlmhHR6jtqiK/+Ue+Y9qNx
	yyEAdk7G7uSuRQvM0AMfusZaYticClKpM0R349A==
X-Google-Smtp-Source: AGHT+IGIBgCifC94WWbmk1WL90a5JSXQTsvL9yU0DsuBNrPusLMZEBcn0E7fKCz4fiSDpZHvOK565KZ6ERPKVg6UNMQ=
X-Received: by 2002:a25:b9c3:0:b0:dcc:4b44:3377 with SMTP id
 y3-20020a25b9c3000000b00dcc4b443377mr2227810ybj.25.1711618997667; Thu, 28 Mar
 2024 02:43:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325113058.248022-1-jan.dakinevich@salutedevices.com>
In-Reply-To: <20240325113058.248022-1-jan.dakinevich@salutedevices.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Mar 2024 10:43:07 +0100
Message-ID: <CACRpkdZPVTZvjbQ19vjPWVvdW35DO2U-CgVi3r1q9jJA0OupJQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl/meson: fix typo in PDM's pin name
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2024 at 12:32=E2=80=AFPM Jan Dakinevich
<jan.dakinevich@salutedevices.com> wrote:

> Other pins have _a or _x suffix, but this one doesn't have any. Most
> likely this is a typo.
>
> Fixes: dabad1ff8561 ("pinctrl: meson: add pinctrl driver support for Meso=
n-A1 SoC")
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>

Patch applied for fixes!

Yours,
Linus Walleij

