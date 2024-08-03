Return-Path: <linux-gpio+bounces-8555-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC57946B6A
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Aug 2024 00:58:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DA9D1C211BF
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Aug 2024 22:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9A021311AC;
	Sat,  3 Aug 2024 22:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ePAmxxOE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB4033CF1
	for <linux-gpio@vger.kernel.org>; Sat,  3 Aug 2024 22:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722725911; cv=none; b=aWZtZCXo6Kul87TxrPwwvjYnSV80SRotpAsAv5YJcOal6VyTNIwhwUKJU3EZko3WVr+dfe7nseh8x4oAReAIxoS2uhRK973ukUbcUCal3An2coqAut+yjV71Ju46Bu9UCtspRB/VjjTlJpZ1gBFu+/rEdrDr2iTxizc+HnxchFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722725911; c=relaxed/simple;
	bh=3BRzezbw9GSa3xz41e6WFFbhJ0iTVxVtG439svHu7GQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BC1SMdnevppvX+KOOlzzWvg5zCeUv2Z3dh62FAibM8iHVPSgmOWcSvJ4QLsh0GPKPcjanSaz5//+jybh9OgLmfGDPVYiecDf8G86NF7qz4YBSpzIOj2fTMURU8z+U6ZEgLaS+SA8FLmz4RUcUNqwW37IKO/a4U3lfmut1ic1nZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ePAmxxOE; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ef2d582e31so107879031fa.2
        for <linux-gpio@vger.kernel.org>; Sat, 03 Aug 2024 15:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722725907; x=1723330707; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3BRzezbw9GSa3xz41e6WFFbhJ0iTVxVtG439svHu7GQ=;
        b=ePAmxxOEMJyJuRV+2xE7qeJpXDR8/tu3XGhdBFnDXsal+oZ+6ZbTS9QoavkBL6ddvW
         GUJ3GGqIW1T0oD9kIbh2knbdRzrkfTi023sqr8Wk8mP0Qfy2glmUHGhP3DPAANk1ZKRc
         TZIHL97p1UI1nz8p239eHgkhkry+Wbk3M7vMNYseoS/HraMfCYVgfl3JuTVp0ME1Vwb0
         vy8RRmBuVN9L9fKmo05kDGDTATpU0IQCKE3eM0gW3QZW7irRQjlRXDloZrPoBNbC5Q2s
         CBGIV62+aByVRKKMbLcumrfCZ+EZXurn+ocoQBcfW9OnCHcf1uzJFTQ87Qe1jBQlMoVZ
         colg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722725907; x=1723330707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3BRzezbw9GSa3xz41e6WFFbhJ0iTVxVtG439svHu7GQ=;
        b=Nji9Ff1r27Lhefwfg77/z+1NfSmMgJ/4/U8UygBSlokubSE5LI+xBPIVMh2Maay7u9
         iyA1Fird+YFrdhJEscdVyAYOFSPLf92+CpsguARvgJLwMdbAnBrmIAY9CEy/vUoKBeXz
         ql2Ozh9gA1HWLIX1uR0blacIE0Skm2glU4xel7NRqDp4TA8UsBdhJpBgv7EU+BDy5jTg
         RcE80EFCZ0xx89L4wy5MmxS998VI/8CPi39vwv79IrKc51vwLkC4bHNu2h5cLJeUHY/3
         2z92NDyPAB8VWDs2ej2hqNk7Nn15Sk76MMFqv6MxeYsEcLzD9gUQznsfNo2MYgoxEYPu
         I8WQ==
X-Forwarded-Encrypted: i=1; AJvYcCU045GgLzLlHy2sDvzkTMDI4Ni+e6xeEYZzI1bmtQROtYTqMn7P2MM2AAd4h7ojRkAbSwiX1Q0c2hEWxYVmTB6JopkdozA6zFmq3Q==
X-Gm-Message-State: AOJu0YzkQDnY160aOjjDmKvgqrTGCHGqv+M0ItAuhc1X5m9dA/sIOyEB
	OCa7/LpNyAovgC39HtAm5G3WFdSWOLS9V5mzi6YZRQk4pbcdxat45HzQ+NaevDhPQumk/Xh03OO
	vk406ZurcP3EqOxpiGw1EQdWiu4F/4w0juCC8cg==
X-Google-Smtp-Source: AGHT+IE4y9kLkzPoH/zfRiNc8kfa8clmJiMKTLB0WN4Xe+IjU5ivL54qw+cgJYdb+86Oky2eUuqmhbuQKBYEt1uqbzQ=
X-Received: by 2002:a05:6512:2389:b0:52e:9ecd:3465 with SMTP id
 2adb3069b0e04-530bb3b1891mr5046679e87.57.1722725907073; Sat, 03 Aug 2024
 15:58:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <IA1PR20MB4953DC78BB0FE0C57EA94F91BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953680DE7977CAD906DBDB4BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
In-Reply-To: <IA1PR20MB4953680DE7977CAD906DBDB4BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 4 Aug 2024 00:58:16 +0200
Message-ID: <CACRpkdap4oeG6QRVbSNDK1Y5kT73_VJRgy9EM5Bst08SXmxE8A@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] dt-bindings: pinctrl: Add pinctrl for Sophgo
 CV1800 series SoC.
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Drew Fustini <dfustini@baylibre.com>, Haylen Chu <heylenay@outlook.com>, 
	Liu Gui <kenneth.liu@sophgo.com>, Yixun Lan <dlan@gentoo.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 2, 2024 at 2:35=E2=80=AFAM Inochi Amaoto <inochiama@outlook.com=
> wrote:

> Add pinctrl support for Sophgo CV1800 series SoC.
>
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>

Rob said you could add his Review tag if you fixed some small
issues in v3, are they fixed so I can apply this with his tag?

Yours,
Linus Walleij

