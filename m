Return-Path: <linux-gpio+bounces-25622-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD9CB446A8
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 21:44:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDD7A166FAD
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 19:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A56572737E0;
	Thu,  4 Sep 2025 19:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i0LplclM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9512826E153
	for <linux-gpio@vger.kernel.org>; Thu,  4 Sep 2025 19:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757015087; cv=none; b=B1rfMCO+1Xk9R1MGjvoKd+Y2QoP4e6K2e/3r3V5DmXd0cIllV8ct8j6gODikiY+FoSooM8fv+lCElSi6YW7D6SqzVLya7VDPHNzb9kR7znoeEA9s7t8yi2Lg2Cu+fDSlhqI0YTmz28vyoxPkAuuL62Or8G4zfzLzBzkhCmO9ltA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757015087; c=relaxed/simple;
	bh=nrsoN2cRsUh6+oDjNodKxMkbhTbg0va/okCb6ReI6KA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tweEfq1CjKCm5GXVs+4Et0k0HmVlkrwB/yM/HSsiFIIr6tNVsGz/nIDdu0HSaIlikpsxE7W7bJDS+LsJuLYBwOYnUIJVhla1zQU54+Rk8WRHDW6lBLsKx+EfJBXF4VyxobpYQJmnQ2qD6PEKbj9r1k1yE1sZRj9Jxdy0Wsr9PqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i0LplclM; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-336a85b8fc5so11016061fa.3
        for <linux-gpio@vger.kernel.org>; Thu, 04 Sep 2025 12:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757015084; x=1757619884; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nrsoN2cRsUh6+oDjNodKxMkbhTbg0va/okCb6ReI6KA=;
        b=i0LplclM94LFldL9ko/QvOW6Ciko3G24cPFgu18SC2Kb390tSTAaMgXg1VoynRyO+h
         JiNod07ixWaXyVg9MjoHkp4p/RHWgi40hh9BA4OW/QVC1nxGblOqegSOEnPT53lNSfhk
         CJTVM8xTd3FaxA02cUp/V60yxbZO6+0872xjdtm5fyttblceL4VxLZWMTSL3WR55zbHI
         o7BsI14It8N0anthekCv98klkrA7SNhejV8fvUg6TsziqSXbdTqEDzISXuHqau0me7Zu
         AcjdbtmXY9vy+uqsFHHuPx1KkwfA++QwntBO6+y5OfzmtVJTI2P8R+7Amc9OLhQFlevL
         AeFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757015084; x=1757619884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nrsoN2cRsUh6+oDjNodKxMkbhTbg0va/okCb6ReI6KA=;
        b=Oxf3F2EfJw01+GWvYo6v2lvA7gTyf0fbU+hdbxY5I1DTYbZgiVVdFnGukocOaoDlxJ
         4Ma+EdvFRb81p7tG+IJ6tXVdY0NbCKljDqtiU7Ps56S2zmXfK4iAFGjVZgtngh+zoI+u
         nxSDO/7iEVQL+hUKU9Mg3K+jHB6gHQfswUMHmWts+l6JQwtcQj2utKADW4NeNehSgo6L
         TuLTBxQk19m6NfG2n9Amfbz1TxBshw0/EOtThvR2w4HDFQ5+gRWplYph/+5VgJZL3udT
         lvghLkLtDhx529nj82f6TsOSHG/j6due4LdmwYYgdYB9cGB8FlWZfrlEmkBOZmUi/n+w
         NV8w==
X-Forwarded-Encrypted: i=1; AJvYcCW9JedFM7BUBBr0aHDYDT5beHWyuU5Qvmz09W4yAw91Nn5EOg9+JCg3PuqNVeoWfAISpXawnrYmdPqv@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa18WDGLLaIQ1k3u++3g6T24Z/3JvWYNxvWdKmLmE1DWXQYSAD
	deBIXRWtocXdmoHTK8ymD1X+ohCYiOjeW+5vqCbvR9nFRWdOsS0CVm26qHCJW+1O9qBcQHJzDOl
	PwgdFOQfIfqmmBb+yHgbfM9KRd38ANCTWrMriM/Skig==
X-Gm-Gg: ASbGncvZEhGC4ICiQRZmlbATTcOFV+fXJ/O2yq9akXv074tW1hXNdtxmVj8+Iapbqua
	2XL4HxTcM3QtEOf9ZdRLEx5PJrWaO+VAI/Cy4tnrbwY/9ZpakBirXApOdYxExDPIOUuKSDvsPId
	mwmZSO9XCEG0uRgA7HpOyDWzkwCpdn29K5fsvkQW+406CI5iHLkS+SKCNAMAMcxPVhSEmrSOQCq
	vXgNAsus2IR3KRJ6w==
X-Google-Smtp-Source: AGHT+IGW3Q5mVQSa4T86jRPxMcDx+PrjgBKT3CCZeXO2AlCJTgPkak9+H+1Qa+5a1Zu0cS0PJQgLLRFuw4VSi8OlYhY=
X-Received: by 2002:a05:651c:1118:10b0:334:45a:6e65 with SMTP id
 38308e7fff4ca-336ca9dc2e6mr50813331fa.18.1757015083748; Thu, 04 Sep 2025
 12:44:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904013438.2405-1-ziyao@disroot.org> <20250904013438.2405-3-ziyao@disroot.org>
In-Reply-To: <20250904013438.2405-3-ziyao@disroot.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Sep 2025 21:44:31 +0200
X-Gm-Features: Ac12FXzijnUJnUS4O1_UBtocPghj3eDGF7zfv9ZNj6v1waFbdxgsEZ7rJIcKPss
Message-ID: <CACRpkdZJ16O+t87aB6dVm7kqCNkiFQiExDVjRJCRgNUhDbzV4w@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] gpio: loongson-64bit: Add support for
 Loongson-2K0300 SoC
To: Yao Zi <ziyao@disroot.org>
Cc: Yinbo Zhu <zhuyinbo@loongson.cn>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, Mingcong Bai <jeffbai@aosc.io>, 
	Kexy Biscuit <kexybiscuit@aosc.io>, Huacai Chen <chenhuacai@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 4, 2025 at 3:35=E2=80=AFAM Yao Zi <ziyao@disroot.org> wrote:

> This controller's input and output logic is similar to previous
> generations of SoCs. Additionally, it's capable of interrupt masking,
> and could be configured to detect levels and edges, and is supplied with
> a distinct reset signal.
>
> The interrupt functionality is implemented through an irqchip, whose
> operations are written with previous generation SoCs in mind and could
> be reused. Since all Loongson SoCs with similar interrupt capability
> (LS2K1500, LS2K2000) support byte-control mode, these operations are for
> byte-control mode only for simplicity.
>
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

Uses generic GPIO IRQCHIP which is great,
and generic_handle_domain_irq() so I think it looks
great.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

