Return-Path: <linux-gpio+bounces-22561-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C90AF0C7A
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 09:22:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82CB41C21608
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 07:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D88722DA0F;
	Wed,  2 Jul 2025 07:21:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F571DF977;
	Wed,  2 Jul 2025 07:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751440916; cv=none; b=mwMliEePsU6qy8l2OzvqApqBHxXVxRBxZtsYke/0TKvGFRTxceh6pg425qCwFi3p4AikLVwzterO0srjamUV1p6V2+hrztsgW74kcKnliQm+0x/+sTTY+UoT1SSq2d7eAFzXtKAOpF45H9gI+uXU8DoJ094Kms2eX8uZKWl0Bx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751440916; c=relaxed/simple;
	bh=hg/fpzh0iibuHgzu9OoE8pUDa3xBOZXjJIvugVRypCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PNhZX5MVQpq0oQT2FbQXu1apQYCskhhOrl3b/y4JrIMY6n+VUuuRLHFJ2Y17LCKzzdifRI6CzmVYNttTEMtT98CeXJoR7WISjOlqpM0AAyha+XaBo0YYohWGo5p+YgrYBft1VUiOlnwtc4Kk0gSTgy7ZdrU0dC2naPwoybSOw8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-32addf54a00so34284241fa.1;
        Wed, 02 Jul 2025 00:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751440907; x=1752045707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hg/fpzh0iibuHgzu9OoE8pUDa3xBOZXjJIvugVRypCg=;
        b=Vejqni5DMN1uW2nmcJA7oQdfqsYG9yb3CjIt4Rpo3LWm6LPDQ64Kk6q503lY9A5aob
         GX5tphyWWXVzk82FyptVu6G3hGkbiWIwG/pTukDvwD5JSd+XnWXEQYWf6Sp/oe65dg7L
         iaAiXG/f3VApjAL4bCXfh5YiaCog+sI7c8oC1/Z7LcP8Px7qIFV0PL3gny/Bh05E3fre
         Lr7VhSniFuPs26GLYUGhuxeoGZj73yi0j+H48zTD69zl4+fq71G8nt8whN326W14PeSB
         qnIiLtMskXN8ruO4+ZakoW4nVkQM/9AFKZGzqAFx4Gy/rsZMGx/59oBlndj5cKHtQ7ab
         XCzw==
X-Forwarded-Encrypted: i=1; AJvYcCUGyyXLOQmeqZhUQhXbymfvC+yuBA27zDOy1PYaJ49tpSLEKDtWkSwWR3AWKYLL5IRNHHv4B3tMDrN8I5WM@vger.kernel.org, AJvYcCUtVZAw4y1kZwg450/VWycek/waB5jdjBepgIRBvzVHKKXAeBI/i2cabH56/0ahzSDoxn4pkMsbU2hOLA==@vger.kernel.org, AJvYcCVGVnWdSCs6FUQEMSKhdrPfSbfiyMIDtzW4zdISde4SKvkKnmYljx0AiT/RJkCuCEXTlYY8hPxrcOPH@vger.kernel.org, AJvYcCXdrJ2nfZMjvStzm9NTswAiNacjb/3REuGFv2LVFSwLopp9RYFDrncifVI411EwTTSh2iJMYL/mE8h6@vger.kernel.org
X-Gm-Message-State: AOJu0YxvDmJqnFctUbin0gtOgva+v48+dvPEzvwQkmCyqu9I15mn7SwP
	knWt5LUUriuLHNQQ13kC6MDw99mkOdxwemSSvZapWl7DhhF/8JZ3MjXzz9rNjAP/
X-Gm-Gg: ASbGncv/LaoyPB6FIh4v6f86SXHQFHzworeq4U4Kwc9cygAiLrW5T7CDTGa+f5tdOiP
	5vSc4RPOXv1o1jgGK1JrrJUT2FnmqYPfZLOAj084mc1EoKqmBbhEonL2NYwinka2OYOwBX44Gcj
	i7v4E1UUClcbVPlSfNU/NFejUtKbI0hoIOTyBWpbQ+Q5Ca6aKTV6M7nyluDYYrVSMNSH6l5TPZx
	FfRleYsuIgKgBOoMX3hc0nSS/izQmXIAzwNMixnttNTpT/1liKqCrUTuXIhrEJRk4MGj2wDalmn
	xn5xm/pVfvgplOapYRCktS+SaNoJ6ogbYHSIz+XdJu+ksHoUu9zw8kBLe0yOvzyT25GS7g2jOQB
	DrBFLqe6vYCxM3e1lSk4=
X-Google-Smtp-Source: AGHT+IHgLRqkzL+NlyH8Y6vVuR8370P3PmAbmab6X52g4MP/vDndubojlp9QRSfXIxwvisq4oLRqMA==
X-Received: by 2002:a05:6512:3ba6:b0:553:24bb:daa1 with SMTP id 2adb3069b0e04-5562829f64dmr616313e87.11.1751440906742;
        Wed, 02 Jul 2025 00:21:46 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2c5e6esm2056383e87.156.2025.07.02.00.21.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 00:21:45 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-32b43cce9efso33353911fa.3;
        Wed, 02 Jul 2025 00:21:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU0wwoySBpjLrgSHrtrl/b0FSEySBxY6scQIaEULw88HLqwX9P73b0fM9jtFjbjr7iubQpmrxifM+fFzg==@vger.kernel.org, AJvYcCUolpaqVoLQqb1N8wwTecjngshn9OzEu7QVTJ698PjumqY0lqVtcKznYNCXljHGDrFEpNmPrJrl2uf2@vger.kernel.org, AJvYcCWOXOZ6+6W5B7k30IbhssfBQWiO8gVIfTeVEYtF5z/TQjcCia4FlYorpVQVFA3G/+3sqfXnKqsNjmhL@vger.kernel.org, AJvYcCXA0xoWBOtN5TQAt06UVlQrN/nRHnvjZRz4QLotZx7EqbOhqO/YVkc8gGQNlaBISUS+sYCBMD9EerWMuv9K@vger.kernel.org
X-Received: by 2002:a2e:881a:0:b0:32a:6e77:3e57 with SMTP id
 38308e7fff4ca-32e00059701mr5163051fa.21.1751440904870; Wed, 02 Jul 2025
 00:21:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701201124.812882-1-paulk@sys-base.io> <20250701201124.812882-2-paulk@sys-base.io>
In-Reply-To: <20250701201124.812882-2-paulk@sys-base.io>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 2 Jul 2025 15:21:32 +0800
X-Gmail-Original-Message-ID: <CAGb2v65KrLwM+gQEWFVrzCcGPL+Fdhmb9b0FTJGkxrDqv4ucig@mail.gmail.com>
X-Gm-Features: Ac12FXzCUNmtlDRkeXVtg02FaWchFlhOllywrVEAHXAtLHX_qmyxYGIEnu1zURg
Message-ID: <CAGb2v65KrLwM+gQEWFVrzCcGPL+Fdhmb9b0FTJGkxrDqv4ucig@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: sunxi: v3s: Fix wrong comment about UART2 pinmux
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org, 
	Yong Deng <yong.deng@magewell.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Linus Walleij <linus.walleij@linaro.org>, Icenowy Zheng <icenowy@aosc.xyz>, 
	Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 4:13=E2=80=AFAM Paul Kocialkowski <paulk@sys-base.io=
> wrote:
>
> The original comment doesn't match the pin attribution, probably due
> to a hasty copy/paste.
>
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>

Acked-by Chen-Yu Tsai <wens@csie.org>

