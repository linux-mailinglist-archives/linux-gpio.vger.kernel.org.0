Return-Path: <linux-gpio+bounces-17828-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E2FA6A890
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Mar 2025 15:31:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19651486910
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Mar 2025 14:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64207155398;
	Thu, 20 Mar 2025 14:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b3oCv5rp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7262638FB0
	for <linux-gpio@vger.kernel.org>; Thu, 20 Mar 2025 14:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742481046; cv=none; b=gLEqFw2YoZwKdDLcRs6dq7iZ/RqF7fYDqg+wgQf6q6tfVJ2HrTy/8xURtIZz+A0SSmPhO7OVks5ZHOT5qWz7K1VgKdP/b/V8IlIk+SRjxYqEv05meEQvPbpC/jyuE9sRe+nGxuk61DzK4kzxhiynUx5FdbcErp83yuhFoQti+WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742481046; c=relaxed/simple;
	bh=HtaZt1pdvIMw+/r2UyjpYL962NSzFMuw3Sp0l7Zj8r0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b1u6cC+TgwUeiyt5LATsAFGpC00ZKIuUyM1X20WdFszMYwZPp0BcElIAjugABaI+6pUSFctGPbpneMTcSlAxUNhxH3GWGGTRSkevC0vxScYXcnsJ2Ygnw0rYF0QPjdxEDa8vs6NC7ZafZNkcLugUeSRcBtnUz+q+Pzl9hyFRb7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b3oCv5rp; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5497590ffbbso998040e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 20 Mar 2025 07:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742481041; x=1743085841; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HtaZt1pdvIMw+/r2UyjpYL962NSzFMuw3Sp0l7Zj8r0=;
        b=b3oCv5rp5vePs8p3DyggA8ZIeRSuEj6xgDWIgndtyj9MZvp9yB1owYyiCkNpIO98ye
         xukE2nZBex0+20r1XlDDnwGJ+OYiARYYstVVR03qptzYoUdDUr4BcBnATjEIR+L+Xhp6
         xeJSuDYM8duDCCJamD45TL4ycRvAVCp4qE6TecYczv3inOsbD4rwHlg9fQ+VqSr3ekOJ
         +LEx4GSViMq5FA8LDoZcylmMQti+53elt4xMOnzEah1l+IYAXVlbatyTykS9/UdVATzb
         /91LHJYNLWgr38xZyJ7xVRhrizk2bWHreZKovqoYMKAQNlYkRA2HwWj5q2/XsVq4Jz+y
         FpFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742481041; x=1743085841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HtaZt1pdvIMw+/r2UyjpYL962NSzFMuw3Sp0l7Zj8r0=;
        b=SCB/EO0tw/ZeHqI8j86J5RtWg6TAvkzV3IrPokNEj0+LLLxh4GzuwFnEVNHNHjFarW
         ChGMmEjN1V6oZrkad9jun5QjJl4RKh8ztScQF5eqtEGjIyXIqstpFg/dNPNp3fOv/gtG
         flUsYTv/C5U28HDpAAz1TUgCYZpx4pxNqTfawM8VeRLl3nFYGLvmbX2yCXHrU5ZfcN0V
         un0QH82jJEpaxpFnrTaeXoLibmlIC5PJvnbZUcXS3/WZcV0V5xyAAY+aKThyd60hJ3rb
         m8RrYwLV2nrYwoB9duu5VnpplM6YOOTy70LC9xnvqpj+CtqAyCE+EV2fd11TAV3CQb5b
         0R1w==
X-Forwarded-Encrypted: i=1; AJvYcCVol4SxWcK5Pg0c13Mmj0dN8e1A0wEXMXpA7Ckhxzn+zShtESqhSaH4GVzxsPO/lEyZe695rdkW4vMm@vger.kernel.org
X-Gm-Message-State: AOJu0YxnWx/dQRA1GYOoC8wi+4IKqR2qw1wHWhmlaMsCyMkSwyXPzU15
	fZfzuwww7LQD5s082/8iwjixgW7Ao9ZBPOUdxHjUtfqGFu8B4WInRdqzaZoNO13k0Z70OQ4kbGr
	cLubU0Is5FOGyQEXpCNdKhcBjHgrxRXlTVPgA46Luqi2dYAdH
X-Gm-Gg: ASbGnctzkIuX2HnbUtfvwlJQdgLp0Jz736et2iyrt7HZUjGiVJhnmfZi8KaeQFFvN/I
	V6n9xXWalXo6lWHqJ6Hr19By1gpkyP3GPbpXvSNlam58mBVCSMNOBU9SaFmoxqjPZn4qOygiXwU
	j+/cg1q7CQhESD/jTXI3oJ/DA=
X-Google-Smtp-Source: AGHT+IET8DYooDeg9qUjIiQRVG4fHBWkFzaxPik2uWctRlPPDxeN/VkNHLY2SmqfTOdLGIlEKYoRBwnSeQbXDk7G0W0=
X-Received: by 2002:a05:6512:2344:b0:549:6cac:6717 with SMTP id
 2adb3069b0e04-54ad067ef93mr786026e87.53.1742481041305; Thu, 20 Mar 2025
 07:30:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <PAXPR04MB8459BEB700FB66FE693EF1CF88DE2@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <CACRpkdbHr_CpoqGwE+mXxV0My30ZcBRJmK9313fXN0rbPDPbDA@mail.gmail.com>
 <86v7s6myka.wl-maz@kernel.org> <PAXPR04MB84590CCC9DA69172B665B71188DE2@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB84590CCC9DA69172B665B71188DE2@PAXPR04MB8459.eurprd04.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 20 Mar 2025 15:30:30 +0100
X-Gm-Features: AQ5f1JpqvGEmXPhYRqMVtqTJwsHUXpAhFsu-q4a3U4muWb14ebpKTU7UaGIAWi4
Message-ID: <CACRpkdb+tow5a1wmbW9aUjDfuevWNyiFQHJ6rT=NpBWVfaTYCQ@mail.gmail.com>
Subject: Re: GPIO TODO
To: Peng Fan <peng.fan@nxp.com>
Cc: Marc Zyngier <maz@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	"brgl@bgdev.pl" <brgl@bgdev.pl>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 3:51=E2=80=AFPM Peng Fan <peng.fan@nxp.com> wrote:

> I will do my best to add IRQCHIP_IMMUTABLE support
> for remaining irq_chips created by gpio drivers.

Sweet, I have fixed all the easy ones (I think).
Those that remain probably require a one-by-one approach,
and some tinkering.

Yours,
Linus Walleij

