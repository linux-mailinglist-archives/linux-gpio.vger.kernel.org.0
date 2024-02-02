Return-Path: <linux-gpio+bounces-2896-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEF08470FF
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Feb 2024 14:20:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BC16288C6E
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Feb 2024 13:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 364434644C;
	Fri,  2 Feb 2024 13:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gadgetoid.com header.i=@gadgetoid.com header.b="k5uByrvI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8C840BEB
	for <linux-gpio@vger.kernel.org>; Fri,  2 Feb 2024 13:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706879995; cv=none; b=NHbB2TaMsxn+lVPnZ3/eUN25jq8/5fDizTfb7WkMV5/EuMm1AGPZtDtO+8fkJwRfUvV8uUpeDwyAG3HzJ5fX3vUbnU4cgvyT53gjC7Pg+v1bGr1vvZHdLmVofB6qcl+vrPEM00k2PrydFy3twTk0u46zPl1zsUlNSnQzmUjrTgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706879995; c=relaxed/simple;
	bh=QzU2+6bJBCYf8775kUvnTYfKeQz7MvZNZSUSH6prFBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r6CkKmQGHbNl7h+sB6TfJz/0PwTneidJxeF9wMWp9K98Cqo5mkLsvr7hUmePRPwQ+Ki6uhhLKKHPt0UWsBuLWzyM5AymkDMwL9gGmWuWFutntE9R/6FvdfmBprSL2zlAVY/t/ZrnbcEtO0PYAVXkpV58JIuliE66zYz3Gj6tldM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gadgetoid.com; spf=pass smtp.mailfrom=gadgetoid.com; dkim=pass (2048-bit key) header.d=gadgetoid.com header.i=@gadgetoid.com header.b=k5uByrvI; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gadgetoid.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gadgetoid.com
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-219122781a3so468627fac.0
        for <linux-gpio@vger.kernel.org>; Fri, 02 Feb 2024 05:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1706879992; x=1707484792; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eQf5PfHC5tQoN+jcMOZd64SAvn2hq+16QHj88c38TUc=;
        b=k5uByrvI8QoFvcxH64ek8vvsU9vApiMOPFPtTrK1MZz98nT1wS1O68LtQvQNJX+MYG
         g3SWz3GbPKrslPfRNkQVEL2yVzhw3fKzDRVpFGs1lQ21MmoGNr7vQh6KP4DWCNniL7AK
         88jMHPI4c+cnz+hAr1Z8awlu8lA+Deww9HywAYq4zXmRf3FL12eX7f2C8SI1UkMTuKdG
         Y+M0Z0tSp4Vgxq+FyezXQljtALPvbUHBmynY+a78LGO3C1MKF2wfcj0gmh76AGFll4ng
         xaZFl4hpLvum3CZi8zoOXGvD7LKAyiunK5CRLr5iRnRPvXw0LPc9LD6GGktGHiTuL5qj
         N0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706879992; x=1707484792;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eQf5PfHC5tQoN+jcMOZd64SAvn2hq+16QHj88c38TUc=;
        b=ppOkveTO51o+A0WtqYoGfWPQtWvD+QAA9STFSr8Qi6sxUmuVwEK0P7SxPg3Q+mEkmp
         dtPcR+b+nHsQWBIDk5x7MgkMa1mxnC38AFHib9k6Zcg/60Pmu35B6xMbIhZ8WaLA3O9w
         7g9br2guRtZ0ix5FT6qze2VhqPciAR44N713arHT9m0F0CRLHBttbcDeUql+xo8eYtPq
         5VlFgCU6U+9GTaYgGea5F0x/bD4MUIA0klE78ig7o3zHCwSAKiVodnd5IDPx33hKq8ej
         redOQFBZtoNsscnXmOzw8aF6OvGM2L1WUSQYjM3VTnS/QlybJVVrIfJBYGJg5893PWkf
         gEBA==
X-Gm-Message-State: AOJu0YzalkpYIpTn5EkSDScaY3Vny26EtVpDgV2FF6D0M0ZYljANeowp
	P/AHpC1IT9+uWnQLtuYPyfpoBpVSGi4iKf9yImUHyPkxQJQQ63SyuQ2ljOAkfWLuORvAJ8VmBbx
	qzh3pT8IOcV0YV5Y9j1pLclDmBSZOHPHkktwWbg==
X-Google-Smtp-Source: AGHT+IGj71Z6qTMXGLYc4dHSH4zFF7fZQYjeArgxrtyh7tp+4FcyBUw5qhhSYcLNsE1HzllPHBbZkh217Ks170E8QOI=
X-Received: by 2002:a05:6870:1684:b0:218:4626:93cc with SMTP id
 j4-20020a056870168400b00218462693ccmr1980169oae.34.1706879991771; Fri, 02 Feb
 2024 05:19:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240128163630.104725-1-wahrenst@gmx.net>
In-Reply-To: <20240128163630.104725-1-wahrenst@gmx.net>
From: Phil Howard <phil@gadgetoid.com>
Date: Fri, 2 Feb 2024 13:19:40 +0000
Message-ID: <CA+kSVo88y7n9dyo57fgjybC9=1b_dgTPA3u-_kUH9X_79HF4tA@mail.gmail.com>
Subject: Re: [PATCH V3 0/2] pwm: Add GPIO PWM driver
To: Stefan Wahren <wahrenst@gmx.net>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	andy.shevchenko@gmail.com, Angelo Compagnucci <angelo.compagnucci@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 28 Jan 2024 at 16:37, Stefan Wahren <wahrenst@gmx.net> wrote:
>
> Add a software PWM which toggles a GPIO from a high-resolution timer.
>
> Recent discussions in the Raspberry Pi community revealt that a lot
> of users still use MMIO userspace tools for GPIO access. One argument
> for this approach is the lack of a GPIO PWM kernel driver. So this
> series tries to fill this gap.

*Thank you* for picking this up. I've been stuck down by covid but am aiming
to build and test this on a Pi 5 (with a gpio chip over PCIe) to see if it runs-
though I am fully expecting a PIO solution (using the Pi 5s RP1) to handle
PWM in this case, and hope to rely upon this gpio-pwm module for previous
iterations.

>
> This continues the work of Vincent Whitchurch [1], which is easier
> to read and more consequent by rejecting sleeping GPIOs than Nicola's
> approach [2].
>
> The work has been tested on a Raspberry Pi 3 B+ and a cheap logic
> analyzer.
>
> V3:
>  - rebase on top of v6.8-pwm-next
>  - cherry-pick improvements from Nicola's series
>  - try to address Uwe's, Linus' and Andy's comments
>  - try to avoid GPIO glitches during probe
>  - fix pwm_gpio_remove()
>  - some code clean up's and comments
>
> V2:
>  - Rename gpio to gpios in binding
>  - Calculate next expiry from expected current expiry rather than "now"
>  - Only change configuration after current period ends
>  - Implement get_state()
>  - Add error message for probe failures
>  - Stop PWM before unregister
>
> [1] - https://lore.kernel.org/all/20200915135445.al75xmjxudj2rgcp@axis.com/T/
> [2] - https://lore.kernel.org/all/20201205214353.xapax46tt5snzd2v@einstein.dilieto.eu/
>
> Nicola Di Lieto (1):
>   dt-bindings: pwm: Add pwm-gpio
>
> Vincent Whitchurch (1):
>   pwm: Add GPIO PWM driver
>
>  .../devicetree/bindings/pwm/pwm-gpio.yaml     |  42 ++++
>  drivers/pwm/Kconfig                           |  11 +
>  drivers/pwm/Makefile                          |   1 +
>  drivers/pwm/pwm-gpio.c                        | 221 ++++++++++++++++++
>  4 files changed, 275 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/pwm-gpio.yaml
>  create mode 100644 drivers/pwm/pwm-gpio.c
>
> --
> 2.34.1
>

