Return-Path: <linux-gpio+bounces-30228-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E9ACFE7A8
	for <lists+linux-gpio@lfdr.de>; Wed, 07 Jan 2026 16:09:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 234C3310DF4B
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Jan 2026 15:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84A5D3314DD;
	Wed,  7 Jan 2026 14:36:01 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com [209.85.221.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEAF223DE9
	for <linux-gpio@vger.kernel.org>; Wed,  7 Jan 2026 14:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767796561; cv=none; b=nnkQ2sT0xGaR8N1/D0pxx2DQqhCQUPNn5YBUxFoNoacgYsGgf9F5BZLGifxpHOrUh+2Zki9JhYpOUfuU6Ds3m7k3JOfVQXsiiOTnCwnFGbL7LGM++fs8zHA+cLTM3y5Q52D38hGbP7m98Zr4Rv/+aldOHu5LCfzd1idMcBxrXWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767796561; c=relaxed/simple;
	bh=6lxm2yCRzymiJ3PB8Ax4dTtiSd5+d+ADW+gyDpHpCqk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ITlog6JHv59j/SPHPI4jyusb6+j/qK4Dw3x3+z9ff7ztC5HlxC2jw0LrzRMyiVPV/RiQeRnScZvZ9dRM0D8pQcpDh+Qz77VJGHl4sWGozmYGFwdQkxLRfHUrY3SI/3VeTlQrJQEuyw8pXtZuIjzOt8QDGg10zL11W1aSLnaxNDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f193.google.com with SMTP id 71dfb90a1353d-55b24eedd37so1502827e0c.0
        for <linux-gpio@vger.kernel.org>; Wed, 07 Jan 2026 06:35:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767796559; x=1768401359;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCG+VCgfKP1d5FB1FIYpGKsmNdPDYa7lbTJ3VDOVxBg=;
        b=USZkiAlasMMIjbJ/RaktiZPT8fYwWiitaRqHqbcAa7ccdv5AL6696YSVoOIq0UN4PQ
         BDfuxN9N5ZR9QG6Rvr+7lTyPyCDwSOVoToulFS3NfRlRdBxxYXwojHlCMX7f3CtNmAFD
         lRWfuLa2H+eos8BR1cGAMsa7TMTXjMZooTiBLbD29mw8Npy3GiLkHh3yJzLri6Ebvg/V
         /ty8EXBOp5KhkPVUPnvu0f29IuLE6iMK3tvxYELpIWNlZRGRBdMbRku79bfx+mQQErU7
         wsdeTkyFLuK1swR39VuJSTIzhzIZJcQVhQhYHPtNH97YxYw+ApQdCUuK2G8bmtBL+4hm
         5KZg==
X-Forwarded-Encrypted: i=1; AJvYcCVZA/zzb4NWlD1SrKRyKnH3nPla+eNWGAmcDq9afE8xk7KZAt9vte03eO9Ttqsl/P5esgar8AP91w6e@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh5mFf13bAwf0OYQdezVNErSVWRByPcNd7XlWmFqzGrEzHTRZR
	dod3rvi7PvIzoVgwQT8u1oZBNtFIGByA9zpddMQLwlOqUeoISbE4WO220PJfoPYS
X-Gm-Gg: AY/fxX7867vQjzrltHUUc51aEVdrAeswLzmS0ifF48euK2Sdln+sUGxYXjKUxeRQMVy
	k3aPRW2RjpMLuT5+Y2adqczNRDydR7pRflyF4UBgtZgmih+Rly96SFQcj2C9YK29niC8c4QExLl
	yWccXZUj06btR1mR5uuFuDvmBHV8UvN+o0irw+9IDWxQJNM4WA/9PxpBcdVRB8n/dSoFWdW/Mb9
	ehW5lJjBaWbU4LHpZ36okLncVZvEsZ/NCRNdfajkQFYLbyaqPc68speff0hsd68PzcMN4GliM8y
	V0JwsvzSLCvz1RoJvoRuRNAHOB/6gwkZXwwtv0Fa313ewBLU2YdnrQip57gMaxCkgm4b5eKO6jH
	6/XSdyQ1CsgVIa2rc6YJRxr/W8ETpFmpbxfF5wPQNjEnooLO0Z6j8JtDVRmcTR8xHXilz1jcpYJ
	vxd10DntxbqcJa4nHh4Hb6g2ZpM3zat69yyZpRHFveYGqfIBZv
X-Google-Smtp-Source: AGHT+IE+B5lwy6spASnzocNFwxED4NwpeQCls9JQLGCFTaTFdNE2a1r+Fn3qhI0BQIK40deUsZbPXw==
X-Received: by 2002:a05:6122:31a5:b0:55b:7494:177b with SMTP id 71dfb90a1353d-56347fcaa6cmr851476e0c.10.1767796558627;
        Wed, 07 Jan 2026 06:35:58 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56345043f83sm2320161e0c.19.2026.01.07.06.35.58
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 06:35:58 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-940c539de8fso1257441241.0
        for <linux-gpio@vger.kernel.org>; Wed, 07 Jan 2026 06:35:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVsfNPtI3Zcj3Fuqwdhw0kqjIJjHwtP7WJN24tBrHt/RoernX1Qi2hR4kTfhqgxChVcwlTe/onZxUrC@vger.kernel.org
X-Received: by 2002:a05:6102:5695:b0:5df:bddd:b590 with SMTP id
 ada2fe7eead31-5ecb6905a3emr1117507137.34.1767796557085; Wed, 07 Jan 2026
 06:35:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251217080843.70621-1-shorne@gmail.com> <20251217080843.70621-2-shorne@gmail.com>
In-Reply-To: <20251217080843.70621-2-shorne@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 Jan 2026 15:35:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUaO_PwWygW8qss47W_ErB4pm1Z2HQ+edvw1-x7ce7oKw@mail.gmail.com>
X-Gm-Features: AQt7F2qBJgoY9l-u0hf_v_IupX5oD1Vi4qcbhjbPDLtZk-LVqqhekrQVxBOS6ug
Message-ID: <CAMuHMdUaO_PwWygW8qss47W_ErB4pm1Z2HQ+edvw1-x7ce7oKw@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: Add compatible string opencores,gpio
 to gpio-mmio
To: Stafford Horne <shorne@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Linux OpenRISC <linux-openrisc@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Stafford,

On Wed, 17 Dec 2025 at 09:15, Stafford Horne <shorne@gmail.com> wrote:
> In FPGA Development boards with GPIOs we use the opencores gpio verilog
> rtl.  This is compatible with the gpio-mmio.  Add the compatible string
> to allow as below.
>
> Example:
>
>         gpio0: gpio@91000000 {
>                 compatible = "opencores,gpio", "brcm,bcm6345-gpio";
>                 reg = <0x91000000 0x1>, <0x91000001 0x1>;
>                 reg-names = "dat", "dirout";
>                 gpio-controller;
>                 #gpio-cells = <2>;
>                 status = "okay";
>         };
>
> Link: https://opencores.org/projects/gpio
> Signed-off-by: Stafford Horne <shorne@gmail.com>

Thanks for your patch, which is now commit f48b5e8bc2e1344f
("dt-bindings: gpio-mmio: Add compatible string for opencores,gpio")
in gpio/gpio/for-next.

> --- a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
> @@ -18,11 +18,16 @@ description:
>
>  properties:
>    compatible:
> -    enum:
> -      - brcm,bcm6345-gpio
> -      - ni,169445-nand-gpio
> -      - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO controller
> -      - intel,ixp4xx-expansion-bus-mmio-gpio
> +    oneOf:
> +      - enum:
> +          - brcm,bcm6345-gpio
> +          - ni,169445-nand-gpio
> +          - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO controller
> +          - intel,ixp4xx-expansion-bus-mmio-gpio
> +      - items:
> +          - enum:
> +              - opencores,gpio
> +          - const: brcm,bcm6345-gpio

What is the rationale behind using brcm,bcm6345-gpio?
Given brcm,bcm6345-gpio has 32-bit registers, while opencores,gpio
has 8-bit registers, I doubt the latter is compatible with the former...

>
>    big-endian: true
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

