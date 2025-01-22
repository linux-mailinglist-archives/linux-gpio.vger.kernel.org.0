Return-Path: <linux-gpio+bounces-15014-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E68A19976
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jan 2025 21:04:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 570A616ABDC
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jan 2025 20:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 582C721576D;
	Wed, 22 Jan 2025 20:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20230601.gappssmtp.com header.i=@lixom-net.20230601.gappssmtp.com header.b="0k8Z7zXV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882EE1B6CE0
	for <linux-gpio@vger.kernel.org>; Wed, 22 Jan 2025 20:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737576237; cv=none; b=Lc0b2MeGZAmncDKBoPZQiRAc89Vv36Jwk6aTUNkpYKB1tyb5oknpl578KY5TD+hseRYpwVLdKxXMCmzlc0C9cGSZkb/K4Qag0q4K5ZffW2idPDVpQESMLJ4Pi4C3UT3AiMZmISd3wMlqnpi9OHA5aE+Evtuwpd6HVMpTM2yadQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737576237; c=relaxed/simple;
	bh=8U268FgoJKxZogEEdz0oyMP0jcmVuayKjJmoFoGKt6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b++5a+F0uYk956OyvY4yeRGcdvgxu1qG0VlCB3yw4qPXWmt7mQquMwLAu2yK6ErKmzHpix17ODu9uZIRUPmNbJIzZi5rnBSNB+w8i/AB7GWQNPgZMlAt6mIYaJWzHSA4QJeLp3eKWBxW2b2+wI/4e4j06ra6SmPhHLfPj2RtL8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net; spf=none smtp.mailfrom=lixom.net; dkim=pass (2048-bit key) header.d=lixom-net.20230601.gappssmtp.com header.i=@lixom-net.20230601.gappssmtp.com header.b=0k8Z7zXV; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=lixom.net
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2166022c5caso1161685ad.2
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jan 2025 12:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20230601.gappssmtp.com; s=20230601; t=1737576235; x=1738181035; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u1bgavdzA6vjKZxygqub9VCVMgsHYIiDDbEG48FTIeM=;
        b=0k8Z7zXVfpn/2JEp2xY99HSC+XwQnIeoPgWnD+osDjMJsEuoZAfO/JcCLJgQ0cb1x7
         R7ZQ1722a8Txw0lu+Wa1TJ231CPOiWReTAKvNs21/cjKJ2eGEgIuHtETdUEnx6jEoBaF
         rJkXZXYm4gZTTGNUMUTQauy0OmDLCNHWFxQwnDOfyPrQqAR3xZbfjj/M7z9vWLXR57ms
         gGi6RurAvP9Zs2u1TJD74BtSOx8ZHA8XT/meg9kxF/8iKlZYS5rBL5eJ9+FLmPq36Cy0
         WaM5M7HplEAsLvD/GUwm1GHXarfYdLWxihH9My/uhHfVvqbX/ga0vawUJQeb1bttFDxM
         9eow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737576235; x=1738181035;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u1bgavdzA6vjKZxygqub9VCVMgsHYIiDDbEG48FTIeM=;
        b=fiI0geqkUOyjJ7T3rtxyKMzkrKBY1xXPyNUzcshusjAxeJgklvkbK7ulPxiwV/PlrR
         Zjf39GdkNPOVwA+E9/EnQfJWDSv82LhlRzb/IEIrGQqQbhC+mMG/s/lSbmiD9XF0hqnE
         OYbTJhMx0dXSiKXye0AJXjnEEOx0UzbH9G2a8Ilm1s0eddkmOs109dvKNijzSmlXNtL8
         drIQhSqwJgEbljVZC2nfoL4aiQ/7+y+Wfsf3JwtkJh9vuBVQkHzFAPIFCTQh+tk3mChq
         D72qiWmJy9pV3caZOH6uGF1on7Ia3dT3/7drKxavUQVT7ejS4sHsLtEYyi0Zu6YQVCR1
         g/DA==
X-Forwarded-Encrypted: i=1; AJvYcCXq3Vx6iBoqKZFtp2iTbyzkjeTMYQD3BTI75GnVigRMB0H8PTVbvMmKMQdqzQUpSFLv/AvTeEQf7+gr@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfyhnz1ZdtM+CMwUHa9msw/RMfo03tcJywKXs74adR23zHJUQt
	yv59PZu1c6nBwpIHao4gpuUv5XNFZAqsEqvYQRfmLDhgjSTWshJN1IGW2Zu/97Q=
X-Gm-Gg: ASbGncsMf/1oC66Xcin5INs3YBMXQRZYBCX3QDkHTdVB9auaa2fT6c7m/dmBg6KyFoF
	E2FgexSb+T6H9gMzXjK3k2E3axHIsoWEupe390uADNhia/3OJrbvtJfwohQxQdz9AuxwlCbGLUY
	xucDyoC913rqlIE7QAkalB0kegpsrkE54cedspMJEbYLNzgkDAVUnVGsaQpT1tojJ9Ovm4JzVJH
	Pe/9BkAcGJg3svSfsGw2mrB3VpVcHVfwAro+dzKT9fyK4X4TnSSvLaTqZUZtRnqBXkwhZ25b+kv
	5DIe03wcGTOuWs2v2Lck43GZz2v1d1gMilU=
X-Google-Smtp-Source: AGHT+IGYQoN/4V8moHcEtxB7o+Ard05IbWUKGDVqlmDureSsrLAV5hr6LIlCLWp033igRwLyKLj1LA==
X-Received: by 2002:a05:6a21:3388:b0:1e1:a8b7:b45d with SMTP id adf61e73a8af0-1eb2145ffc2mr35115554637.4.1737576234673;
        Wed, 22 Jan 2025 12:03:54 -0800 (PST)
Received: from localhost (99-152-116-91.lightspeed.sntcca.sbcglobal.net. [99.152.116.91])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bcc322a55sm11089789a12.27.2025.01.22.12.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 12:03:54 -0800 (PST)
Date: Wed, 22 Jan 2025 12:03:48 -0800
From: Olof Johansson <olof@lixom.net>
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Yangyu Chen <cyy@cyyself.name>,
	Jisheng Zhang <jszhang@kernel.org>,
	Jesse Taube <mr.bossman075@gmail.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/4] dt-bindings: gpio: spacemit: add support for K1
 SoC
Message-ID: <Z5FPJLzAEVXGWJnE@chonkvm.lixom.net>
References: <20250121-03-k1-gpio-v4-0-4641c95c0194@gentoo.org>
 <20250121-03-k1-gpio-v4-1-4641c95c0194@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121-03-k1-gpio-v4-1-4641c95c0194@gentoo.org>

Hi,

On Tue, Jan 21, 2025 at 11:38:11AM +0800, Yixun Lan wrote:
> The GPIO controller of K1 support basic functions as input/output,
> all pins can be used as interrupt which route to one IRQ line,
> trigger type can be select between rising edge, failing edge, or both.
> There are four GPIO ports, each consisting of 32 pins.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml | 116 +++++++++++++++++++++
>  1 file changed, 116 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..dd9459061aecfcba84e6a3c5052fbcddf6c61150
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
> @@ -0,0 +1,116 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/spacemit,k1-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SpacemiT K1 GPIO controller
> +
> +maintainers:
> +  - Yixun Lan <dlan@gentoo.org>
> +
> +description:
> +  The controller's registers are organized as sets of eight 32-bit
> +  registers with each set of port controlling 32 pins.  A single
> +  interrupt line is shared for all of the pins by the controller.
> +  Each port will be represented as child nodes with the generic
> +  GPIO-controller properties in this bindings file.

There's only one interrupt line for all ports, but you have a binding that
duplicates them for every set of ports. That seems overly complicated,
doesn't it? They'd all bind the same handler, so there's no benefit in
providing the flexibility,.

> +properties:
> +  $nodename:
> +    pattern: "^gpio@[0-9a-f]+$"
> +
> +  compatible:
> +    const: spacemit,k1-gpio
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^gpio-port@[0-9a-f]+$":
> +    type: object
> +    properties:
> +      compatible:
> +        const: spacemit,k1-gpio-port
> +
> +      reg:
> +        maxItems: 1
> +
> +      gpio-controller: true
> +
> +      "#gpio-cells":
> +        const: 2
> +
> +      gpio-ranges: true
> +
> +      interrupts:
> +        maxItems: 1
> +
> +      interrupt-controller: true
> +
> +      "#interrupt-cells":
> +        const: 2
> +        description:
> +          The first cell is the GPIO number, the second should specify interrupt
> +          flag. The controller does not support level interrupts, so flags of
> +          IRQ_TYPE_LEVEL_HIGH, IRQ_TYPE_LEVEL_LOW should not be used.
> +          Refer <dt-bindings/interrupt-controller/irq.h> for valid flags.

Same here, since there's no real flexibility between the banks, it might
make sense to consider a 3-cell GPIO specifier instead, and having
the first cell indicate bank. I could see this argument go in either
direction, but I'm not sure I understand why to provide a gpio-controller
per bank.

Comparing to say Rockchip, where each bank has a separate interrupt line
-- so there the granularity makes sense.


-Olof

