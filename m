Return-Path: <linux-gpio+bounces-19826-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 284F6AB0DDB
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 10:54:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9C897ACC59
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 08:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D33B274FCC;
	Fri,  9 May 2025 08:54:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5FD2749C1;
	Fri,  9 May 2025 08:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746780852; cv=none; b=dSRY3Wovnj5bCbGSw0dNTofklZbhk5wXbGOojy9rgUw7E+dzHsI0NwnUD7vILNuSQnc7ykhjEQNeHGSr71IKq6bUx/BNgCMzzSAtuwuoIMrEWk16LWCOL6jrDOG2pkQc+MVCi5KWDIv4HdYUZSLrPd1etUjwO+peG87lFcdKlJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746780852; c=relaxed/simple;
	bh=dIQ36xNG7rFv+g5+VuGeU2vZCqINIrKTuYD6nYivyQk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fATSFO0ZF8m4eo9MHg23gpzNVYrzG/E1qzXD9L9BjYZKFo/9fH5/QdDvaDBVl/yy3lY1esz4tmGZCPLPq3nOH7awmpkpIWWjJqiPUFDaxGluq+8Smwjnzq7py/TAC/W2O2Ib8v3vofs9ekCXDFLmuOm435clBtAHspeXtwN1CpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-52c58804270so341314e0c.0;
        Fri, 09 May 2025 01:54:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746780848; x=1747385648;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/n8O+daMK9Ya5qhmCoYyLgEWE9aqvg/6xpt2cDxB2CA=;
        b=d6zRkLEKwOr1x0X1SBoB82wXWSiNBX5S8ANVLt+QkdLlQngn3u/PleVHWbAjX6LM4C
         ue3q31ub41uGk6PG+ZNQrZkz3fLYgodckjJNXZ3xLXRTwz60uSC+1XHX43r+KORCJ7Zt
         EJtCbvj79DLSMTUE+8AKmplWnmAVH9xCj0xDC9EiB4ZFJgVbFLZ2cgnBrBNRjjA1T0uc
         6KNsD+gYsqW2szDynsgYA+vbQmL7XTQpddM36BENqnbe1nFBQTYTigqsf0SnduJpPP/a
         yEPsCBXyduRb+Tu7OqpTT0gHbHpTggyxuYviooCYTd7DdqC8w2mgAPrArVhUm2eo9Rcm
         Kl4w==
X-Forwarded-Encrypted: i=1; AJvYcCWIncINs5HQfLmmi9wcYIMnf5hedxIMBmvbGT79VGm8N+YOQaBuIQrdwmNXZ8LE0flGtxFlOLRY4UREnXNaK/UB@vger.kernel.org, AJvYcCX3QWFjJrcDfjYYvcJylQFHRXArqTduAvpFk9BMEZfN8wAMI1SkDaSBEvVIju4EybRrMXyz1i/2qX5euOyF@vger.kernel.org, AJvYcCXeBgBN0Uepi519XTHZAYqlrOvuD33IFKLDfWQs2uif+pMTs+UbI3XBrcwKyiFs1HaHEK4jPGW+4bNa@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3PJyhr0A4m1NQOW+DIJQluUyiE6s5bfkSf2Vsei44t1gsR7QQ
	Pvt9B65kKMNsFlrdhIYb+0WfJSE7WYkRJtHda84olcMOU0ElHe+QypxHNQUI
X-Gm-Gg: ASbGncurXDbjtJBux4yWFOUlGvw24GnSL7tIgyuiCo6N9U9MZUmDKIQ0K4jDi3np9GZ
	VfLfVuUBb8tlYmrEC6mCjR6DZuINquSNdDnHsc59btHtlQuWiOyOi4HBTJhqBuWU5Ft5i9FLb2y
	rEXCBPQlv+1vz2YPHkIMwQ+ihLdjNm74XBwz0yEUm9uSM8LNVOvOHherG6790j0iNsDrjHm3hjE
	oMI3HgA+orqvhCVco8tma6aTeLGvzjm8gjhm+P4FSLc7PI0d3VyOOkJlmdKFXcW/sdVsaWg2qR2
	amf96ICqdLAMSA42eIiJUdZdXHB/MG1Hpmz4XY75Ysl5BMjN8oKpQVPde1G+oag0ZgInfuYqNYL
	SJ+8=
X-Google-Smtp-Source: AGHT+IFS1E8zSsASuIslXWr4BY0BpFM3pAJ8PNJL4XM2KV82ovaEovOCTSP1hQwdsX2FxKt3riAn6w==
X-Received: by 2002:a05:6122:828d:b0:520:62ce:98ed with SMTP id 71dfb90a1353d-52c53d2ff33mr2291528e0c.6.1746780848441;
        Fri, 09 May 2025 01:54:08 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52c538a6e70sm801137e0c.39.2025.05.09.01.54.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 01:54:07 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4c6cf5e4cd5so1712828137.2;
        Fri, 09 May 2025 01:54:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWTQgetaWgCCXBCpTs/Wjanyr3fELPFCIT5qD6fdej+qELHfpJX3l2mxqUlW5jD9wTADS30QE3dcEvT@vger.kernel.org, AJvYcCWp4F22Drq9LmGwNFsPR0xaeyaA5mfCWnLxuOmJ7kuEPChadirVeK1n1F695NcBhxfE7AGXNgzYU7cbEPLoMV3Z@vger.kernel.org, AJvYcCX0KmnlGX1+co7PtaJ5QV1iTtC0rdYRjIwGo6MyzkYgsQ8yZEsNu42G64YGup5JFOq258eG/1hjQjht358b@vger.kernel.org
X-Received: by 2002:a05:6102:3e25:b0:4bb:de88:d027 with SMTP id
 ada2fe7eead31-4deed33fb02mr2118228137.7.1746780847314; Fri, 09 May 2025
 01:54:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-aaeon-up-board-pinctrl-support-v5-0-3906529757d2@bootlin.com>
 <20250506-aaeon-up-board-pinctrl-support-v5-7-3906529757d2@bootlin.com>
In-Reply-To: <20250506-aaeon-up-board-pinctrl-support-v5-7-3906529757d2@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 May 2025 10:53:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV2Y0gSt+6-5eUMusJc5XexDu7yFq6Qw9hrkzVszh=r2w@mail.gmail.com>
X-Gm-Features: AX0GCFvtlzUj3sVpHR4wgcapabeNrbr0S1wglOu34WYtYWzhq6PCycyr8AITEbE
Message-ID: <CAMuHMdV2Y0gSt+6-5eUMusJc5XexDu7yFq6Qw9hrkzVszh=r2w@mail.gmail.com>
Subject: Re: [PATCH v5 07/12] gpio: aggregator: update gpiochip_fwd_setup_delay_line()
 parameters
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com, 
	DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 May 2025 at 17:21, Thomas Richard <thomas.richard@bootlin.com> wrote:
> Remove useless parameters of gpiochip_fwd_setup_delay_line().
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

