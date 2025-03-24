Return-Path: <linux-gpio+bounces-17919-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD6EA6DB61
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 14:27:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BF873B3FF1
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 13:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E86F425FA01;
	Mon, 24 Mar 2025 13:25:28 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CE025F989;
	Mon, 24 Mar 2025 13:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742822728; cv=none; b=qrO2RxcgmtBJM/X3VA78iOGFfiwPDjoymuU8jV/+d3zFldufakIptULjLjJIzEDNYASV6Qwv1Pp04XFVRLBO/6hgaKnkK29thzRLxmHCQ2ZEibDcM2f2amQ/RKkgbRtpCaGoD86oE1vrhf8XU2gBy8lnPTrkFb5IBkd3JLMqHk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742822728; c=relaxed/simple;
	bh=5sydytHx7h525TTyhjomwsCO0JsaR5Fp//WMRl6worI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uBtjaS2DGtG8g/EO9QjAf24LkLp99cqmKCt3T65aA7SMhgOyeZw8Rp0u1o6sU9lQJ21r80SlDDBKtAa7+6eZByYeKSDhtzz4eHrmjrsnLqGT5DMfVLBCG5oFUDnlEzBFbHVs8M1RbLpSWVRzBvhH9wKsHMeWG6Igyuzz+GgdfuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-86d69774081so1832343241.0;
        Mon, 24 Mar 2025 06:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742822725; x=1743427525;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pysUx5KjUsnCC7SRGDXolsL0u/kPjjXuwebo/Ew3v+g=;
        b=EuduDbpz5L7JywfYN4Tjh49acGhOsd4c3lYwH5YyaumuUC7sJB7hotootVnNGilV3K
         MofP5cGqV8kAs+ZfVatcQzMU1ZBYqebgV09FH35PXDrKQoow/ktPoq4xSVULy3F/MLxl
         ieb6VZXWs4ykAcVjN+RBXJusminQzWsV0tpMRbfLQGBN9yGc5lG4LCUkpIBt+E3VLeNn
         czzxZxw9AZxA8nBsz2ksloa8KRIKZJtqoHDDZ8Bqu4cq3LEgB8r/zCyce6/9XhYDaCiA
         GWV0EZR3H5+anhQ2S1NTH5i1/k5aRIqCysA5Qfu9AZdeka2WydR7Mj4liiUkMbdMr9Vj
         fmFA==
X-Forwarded-Encrypted: i=1; AJvYcCVAEzChmIpfe2HStDmYzfukNbDjgxjjA3gcoMyGyEc+OZwS32S1FveKCH/csDt0PGItHFJiLQG8T3Oq26iubv3Fx2w=@vger.kernel.org, AJvYcCWzCkf3q2WZd+xOSSXaiIQBuGwPGbuFE62Uvj3HjrdRDMb4QCng2sLwa9RBvb70yzQ1JT78cjCg6p9ZKw==@vger.kernel.org, AJvYcCX0QqwhEVKIRh+zH+NOtEka02p0mVV1V9cCH+t6qvLu4aD40Rj8FLSaA9u4eeOO15aRv7MYS6Olfcrf@vger.kernel.org, AJvYcCXz9coG5I8a6VRSc1KqAJIiCwKoe7p73EszrL4AMm+GtbUbmjeDjFDYPu1uGtkDNaavjS3ORL9dZvV/0gdm@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo63BD5bOd3D5cxEENwoj4r86QYexBS46eDqPV+v/11bEQy9pO
	ic6Tq612AdN7Rw6HGX8cmwSwU4Zo9kfmVYc9TXVueHJ+fdcIS/CzNvPOhFbk
X-Gm-Gg: ASbGnct0pOQvscCt+o8A0JFKv90StxSAjJDTGUhCUuYHZBJc0aLKZl/u3Szkkes+VWh
	1MladtIyTYWYzUYdlOuMniDzaqvQBqm9hSnSxg+a2JboKvEFJ2j0s3JIhCVbJMPpi5dG8tUub4a
	fknkrxTD8jHOSv7Dd4wYoW+if63btpEj6z97o9hTBdHdDwNfyvivhQB51lwuGT2qXYQJK/bWKR4
	B+Ex/+HGsR2OVQJs/EC627yD4gccw5tL0ORn4JMMK1AKSXaqlbtmvRwJo2HhyEx0AdW/Gelck6C
	HuUCn3k8v0TLhZtDjAxHcIgaxGkajcXLDor9UWmqNCNIOW8WwBjLEQTSspVCqDBfVO3/tsA3LTq
	aNZumD9I=
X-Google-Smtp-Source: AGHT+IHL9Ymtw3VlVx3jr9AyIdjS/9H5taPKKe/gOo+775noX2h3vSpl3dUq88TcU6DqvrglZhSW2w==
X-Received: by 2002:a05:6102:1944:b0:4c5:1c0b:4ee9 with SMTP id ada2fe7eead31-4c51c0bb1c5mr4429730137.22.1742822724473;
        Mon, 24 Mar 2025 06:25:24 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c50bdbe1ebsm1548308137.29.2025.03.24.06.25.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 06:25:23 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-86d69774081so1832297241.0;
        Mon, 24 Mar 2025 06:25:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUtVbmDoIDlgxbAdU67hlYPXmPtsvL7FdN75sSb6DmFRw9gMG6NomLnolczTDQXY/PSDUGuGUSrHrCs+NadLH7RgV0=@vger.kernel.org, AJvYcCUtvGSECi3hnpgU5FQAx2up1FbLrWti3nO2IZSY1UnadIhfkYmQODKf9Sa0prqhGlGHt2wdIhyC1MGAODgO@vger.kernel.org, AJvYcCV3WKQUMFuFOMHRS3UVWnlF0+y+ijnOuS3S1vO+ksgXHEt93EH6lziGiMZY07/TL6/igALP/4mcULi4@vger.kernel.org, AJvYcCWPWNyFLLFOxE36Z2beO9V/WWYULs8XF+ZLAWkbQD/ZVg6C8+8RyZ2GTVdqCWJDXjljnUERMo/iLzIEGg==@vger.kernel.org
X-Received: by 2002:a05:6102:fa0:b0:4c1:76a4:aee4 with SMTP id
 ada2fe7eead31-4c50d5c5525mr9355749137.19.1742822722526; Mon, 24 Mar 2025
 06:25:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324125326.82270-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250324125326.82270-1-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Mar 2025 14:25:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVKFgm_44XXq7Zq8yqosBCQc1CK9dkJoz4nLQ=aDNx-Yg@mail.gmail.com>
X-Gm-Features: AQ5f1JrAqzrQO9P6bZUVH1yKTkJKGarnEoNgpKJ1GLu55BnPfqFnSLdxcuz5LI0
Message-ID: <CAMuHMdVKFgm_44XXq7Zq8yqosBCQc1CK9dkJoz4nLQ=aDNx-Yg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: Correct indentation and style in DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Manikandan Muralidharan <manikandan.m@microchip.com>, Maxime Ripard <mripard@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Sander Vanheule <sander@svanheule.net>, Bert Vermeulen <bert@biot.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Mar 2025 at 13:53, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.  While re-indenting, drop
> unused labels.
>
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

