Return-Path: <linux-gpio+bounces-16202-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E5355A3A3CC
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 18:13:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2849E3ACD72
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 17:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED642270EA0;
	Tue, 18 Feb 2025 17:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ivVx7Wjf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E743E17B50A;
	Tue, 18 Feb 2025 17:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739898554; cv=none; b=DzFO2NrLF7bZ1K6P36uSkL5FFzKynpEHZRT3HougbU1j90zWY7Pd61Sx6j16UCrDWwDJTFiMm3RpWyiUeGuk0GXiibiDoT1YEdop9wOVbeUrdsMjG/cM3ArqciaByYIWz5fyDq+dn877toCR2cU8n6WdkxLryp9OIJw+QJ2smfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739898554; c=relaxed/simple;
	bh=r3Cn8T3WHhu7Zt4TdPmxIPWpu+uYE3xrjh5sU/rQN8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l/FDd0RDR4B19aZQETDsTU5uNnDPBQr8gLLLB6+EYR1mpxAHIhLRgiosfbYZCx5rjA4Sa2As7P7oSG0HiqciE9YwBWbo39rcp5xKJTWnc5QP7xAA/NSEA93hO4WfeCFI2NlAwoXrji+kJoRjaFTFc5SX25XojfWmgU0IM5gQ2k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ivVx7Wjf; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4396f579634so20772485e9.1;
        Tue, 18 Feb 2025 09:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739898551; x=1740503351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3Cn8T3WHhu7Zt4TdPmxIPWpu+uYE3xrjh5sU/rQN8s=;
        b=ivVx7WjfMFts8eIJQALC65M7ti/ht7ufXfNHgn2IRyfAsvBe0BQ+vzlh2VsBEx6Zgx
         UBZL4v0QcpKH9G56wprO1dge4zc6CJXL4fp3sjsm9/yrEJZefOl9wLR7+CcgxyQCI8eg
         b++spxnHq0tV78zQ9fy4ai061iSN8RNvdWlcV5EfjTKTKsciB/4/tegv6530sauODR5Q
         aOIeyOr0YxOGEsqtd3anWidfTfNjj7pZbcj64+d4rN+lNF7U1t+XtmJ4n/LKDLydrSug
         QVV5dpcE5QZeI+P8D7paDBMDR4FO1joVZTmYhPVZ9WUj8qvPoszu0DERCU/8Dvji8xQl
         NmOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739898551; x=1740503351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r3Cn8T3WHhu7Zt4TdPmxIPWpu+uYE3xrjh5sU/rQN8s=;
        b=RSQr4G+zG2eP4bEOWRIQxE0rl1FTmywVirRetySTGh+eu5YFvHh4zaqfwU7HzL5ZYz
         +BGJcdRQ1yzWg3j4f4Liz6v2O2yOsiWPigaxoqTquGOL9ddM2/admijhMaaA7xRwXRcc
         e9XHnMz8Q4p8p9MtxnXYn+EJla3N8192OMQ4StWY8ABXEkIZbLHpAL7cccBhw7kUwywp
         P15f6YTGBsM7q538d0DHucFPlTIRTHd8ZTTUBogWUCZj126t3h4sfZyWWUqlElF138Cx
         5OtuK4KCL9UmOTvcvGSPmf+YMWzSzMa31a1DW9Uhd0rctPcXLVpXavcUTmD+NU9yWjzR
         eDMg==
X-Forwarded-Encrypted: i=1; AJvYcCVl3MnlYPw9N6OuSRnnDWNzJayaHnlOljOWfYA2uyzdSo1QcSl4ZM+9x59auGH3XRbpKaFY6GYFGZtn@vger.kernel.org, AJvYcCWN2oaRfZBxyDT+7ZDcWhcW5BpmuS1FT1G3CT1HxGdSp15bJmCXBu7GAfV5fGj9ska4En8cLPSKkd81uqIr@vger.kernel.org
X-Gm-Message-State: AOJu0YyWRdUoHMigSk2YLsHeGYD5rYy/BdSvwpGiCOmCtuWIugYRMJxH
	JyBAs55H7w2itUUHMEqJ4axy3OjKT5TfmeXcxTv6OKyP4Q8AT0GT
X-Gm-Gg: ASbGncvszuln+utKK875SrB0q/HHbWAct+5Yc5EN/tMMsma6QFVoJibiQHDjqd8FjtT
	PnUG0vamFEQRo0Y+h/k+i43YbK3xu4IbZxDYyuRHNVrnxcLIwqwPpvvl9esLSHyx7psHfA7U8IQ
	EzbNixCIVB7KzP8NH3FxUtA6I95BGMK9K0DlcQ0z83S2DqkBrSH90m4DiXXQnSbR+0TQxQl55kN
	0l95HUJrBnJb2BFCeEGpFGFr+noHcIo6O/tkTnU3QGgOF0tM40J/Eo13hXoRjfX9CDMOdDSkQ/j
	s4WKogO3wJB8wztYUM3T3xbgG/rjZTqNdPRsRn6HmZXWUwkPg1Ixl36Pz/vMVunRfXc=
X-Google-Smtp-Source: AGHT+IFlGMv2miQ0Z9W2VdMNMeh3ECaEZiiURYqLj/so8NoPpJnlEqidY8yQFjrhffXPtAAVjvhFEA==
X-Received: by 2002:a05:600c:3501:b0:439:955d:7ad9 with SMTP id 5b1f17b1804b1-43999da89c7mr5439285e9.14.1739898550848;
        Tue, 18 Feb 2025 09:09:10 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4398148f4fcsm72046035e9.7.2025.02.18.09.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 09:09:10 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/8] pinctrl: sunxi: allow reading mux values from DT
Date: Tue, 18 Feb 2025 18:09:09 +0100
Message-ID: <12609538.O9o76ZdvQC@jernej-laptop>
In-Reply-To: <20250214003734.14944-6-andre.przywara@arm.com>
References:
 <20250214003734.14944-1-andre.przywara@arm.com>
 <20250214003734.14944-6-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 14. februar 2025 ob 01:37:31 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> So far every Allwinner SoC needs a large table in the kernel code, to
> describe the mapping between the pinctrl function names ("uart") and
> the actual pincontroller mux value to be written into the registers.
> This adds a lot of data into a single image kernel, and also looks
> somewhat weird, as the DT can easily store the mux value.
>=20
> Add some code that allows to avoid that table: the struct that describes
> the existing pins will be build at *runtime*, based on very basic
> information provided by the respective SoC's pinctrl driver. This
> consists of the number of pins per bank, plus information which bank
> provides IRQ support, along with the mux value to use for that.
> The code will then iterate over all children of the pincontroller DT
> node (which describe each pin group), and populate that struct with the
> mapping between function names and mux values. The only thing that needs
> adding in the DT is a property with that value, per pin group.
>=20
> When this table is built, it will be handed over to the existing sunxi
> pinctrl driver, which cannot tell a difference between a hardcoded
> struct and this new one built at runtime. It will take care of
> registering the pinctrl device with the pinctrl subsystem.
>=20
> All a new SoC driver would need to do is to provide two arrays, and then
> call the sunxi_pinctrl_dt_table_init() function.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

I went through the code and it makes sense. I wonder if we really need to
build whole table instead of having on demand lookups into DT. However,
for now, this will do. So:

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Thanks!

Best regards,
Jernej



