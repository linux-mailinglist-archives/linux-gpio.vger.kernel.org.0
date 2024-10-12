Return-Path: <linux-gpio+bounces-11236-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 205F599B529
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Oct 2024 15:46:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 41EB2B21150
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Oct 2024 13:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAE1D17C224;
	Sat, 12 Oct 2024 13:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="wN2cn9eI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CCA8F64
	for <linux-gpio@vger.kernel.org>; Sat, 12 Oct 2024 13:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728740769; cv=none; b=j5QLvAwnnz5Wnqf3zjeKFq3MbEUCSKgJzi+TG4L/NbvEiOiNcWVXS+Ppexx0TznPDJT+GCXMChHp7lnB0FfzEIcPOvaIv1OH00XrdvIzNZMYSgzk6Aft7YGx/HQcTvOw1y7s/Eu8Peu4LtFHluXsZfqSL7Feg46ZrxlMZRjO0TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728740769; c=relaxed/simple;
	bh=ebBei98yWqwECubA0Qj+BklY8AWX98r6XzcnfOG8vKA=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=USBcFGuBJhiXkh1foT5QiQu1Gjm3svQAS71QxfGkCjKXd7qqp4M2tWSXAqCi15IM+Ues/pTcFeXjC2ZV3Zijb1sSa87PGcA3I3rhiclw0NrkueBicSYg8WWqtv33IBzt3UgQkKSfEJ2uaEJTX7udYlT9UPRiMKGdFznR2nLmJtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=wN2cn9eI; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 591C33F17E
	for <linux-gpio@vger.kernel.org>; Sat, 12 Oct 2024 13:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1728740765;
	bh=wX2+LM1EIphUiY8L+Ud8kXahS9GWghUjKo8VomtJpRE=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=wN2cn9eIBlvXSCQ3CM2o1b5U5VmvORm16SzpiYdlKKYA5dmZh/r20wNleQKCqG66Q
	 0drzcyEsEI97Z+GyQrX1i4lJs5k/zR1D4z0CH8FmHMMPxHYXdxFZ7f20uzpNKjJ994
	 p0gCZQJHbICf3XLs3Q+rL2/9BZXxctZD1XXLXj9mE2wuigJyxsH4B67X8y+XQeXsSd
	 6CNYWKNyiA7KofEYH2RvCwsw4hSy5T2MCeqiSm0w3+7tNLE71LdkHGOGhKJpe2kzIa
	 hgq7gCXWTIEIRPNvvfwu5o2wpjhLM+TjJeJ/qtl9PZ5+z13cb1WmjSoYUqY1pWg0Am
	 L1sR/zfxYWOlg==
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-287c1894419so2298455fac.0
        for <linux-gpio@vger.kernel.org>; Sat, 12 Oct 2024 06:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728740764; x=1729345564;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wX2+LM1EIphUiY8L+Ud8kXahS9GWghUjKo8VomtJpRE=;
        b=THdR1dVrJY/HmL97X3pPMVrVRpADFO0Rd5X0Jqv8QP7218MXHpnq4tOwRXp4OORxAY
         iIrtrfDuktFg+RrEc6TCKNGVWMYPCXYqcwPH1YThV4E5wB1xyg88rFn4EuCOE4yU6c7/
         imZq/Z/0bjxm0l3YBlkDwQ1ZaVQtjQ2BjK0vmJQa1D2rzagYjSfJ9WPaTR55yec95B6m
         gVOox/OXRYr9tC+Fh0Rmxy0fj8n8V6cldXahZisbPixu2x+YZFE31SmySHjQ675mdRZh
         UaMfNDkuUc+GjZLhB4sMMWqscAd53zmMsEC4LG/eIdqTfUFiNzXQ2ODN0Rz1jm9UrbO5
         hm8A==
X-Forwarded-Encrypted: i=1; AJvYcCUhKrEcnZi5eQJb1gXz6fh0qusJTdbz8IUt0s5mL6SdWrF80qjkH5DGp7eDS9DIqHU6hu2iYWJ5sTxi@vger.kernel.org
X-Gm-Message-State: AOJu0YzlOvX/jJKNm40RK9TOQa0+Q+YQenmNOe483/WEpQAUssyveInL
	YJ5J3Fn7W/w0YCr3eN323TC8wPJLaP+bstvOcQNeUaAsOP0e2AoMGY8zI1Kl/sz6q1XZAW8yh0v
	d8deY/eaAR4okzUVZDBURjstViVDRb7yv0wynIuSYRXFwknFYJCgDJ6c+pZxJ+PEmgMMLef7lq9
	iyWZt0gMWgEqTgUeOENIag19XnRPDW506UvhiAeo7Geuqgmx0baA==
X-Received: by 2002:a05:6870:9a20:b0:261:17e7:59b3 with SMTP id 586e51a60fabf-2886dd63017mr3691896fac.3.1728740763938;
        Sat, 12 Oct 2024 06:46:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGP4R8o1xTNt9NnlgIKlLHoYXBR+jmFI4otlWWTHp9Xr17E6cIWspGpN8K84jN8jnyBWovayalZRE70svxjXkQ=
X-Received: by 2002:a05:6870:9a20:b0:261:17e7:59b3 with SMTP id
 586e51a60fabf-2886dd63017mr3691884fac.3.1728740763638; Sat, 12 Oct 2024
 06:46:03 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 12 Oct 2024 06:46:03 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240930-th1520-pinctrl-v3-6-32cea2bdbecb@tenstorrent.com>
References: <20240930-th1520-pinctrl-v3-0-32cea2bdbecb@tenstorrent.com> <20240930-th1520-pinctrl-v3-6-32cea2bdbecb@tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Sat, 12 Oct 2024 06:46:02 -0700
Message-ID: <CAJM55Z_8d10_8g8D_WwYqi_D36JVs+7UdooO9p81Vuwd8odSyw@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] riscv: dts: thead: Add Lichee Pi 4M GPIO line names
To: Drew Fustini <dfustini@tenstorrent.com>, Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Drew Fustini wrote:
> From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
>
> Add names for the GPIO00-GPIO14 lines of the SO-DIMM module.
>
> Tested-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> ---
>  .../boot/dts/thead/th1520-lichee-module-4a.dtsi    | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> index bf1c639072b8..ca84bc2039ef 100644
> --- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> @@ -29,6 +29,12 @@ &aonsys_clk {
>  	clock-frequency = <73728000>;
>  };
>
> +&aogpio {
> +	gpio-line-names = "", "", "",
> +			  "GPIO00",
> +			  "GPIO04";
> +};
> +
>  &dmac0 {
>  	status = "okay";
>  };
> @@ -48,3 +54,36 @@ &sdio0 {
>  	max-frequency = <198000000>;
>  	status = "okay";
>  };
> +
> +&gpio0 {
> +	gpio-line-names = "", "", "", "", "", "", "", "", "", "",
> +			  "", "", "", "", "", "", "", "", "", "",
> +			  "", "", "", "",
> +			  "GPIO07",
> +			  "GPIO08",
> +			  "",
> +			  "GPIO01",
> +			  "GPIO02";
> +};
> +
> +&gpio1 {
> +	gpio-line-names = "", "", "",
> +			  "GPIO11",
> +			  "GPIO12",
> +			  "GPIO13",
> +			  "GPIO14",
> +			  "", "", "", "", "", "", "", "", "", "",
> +			  "", "", "", "", "",
> +			  "GPIO06";
> +};
> +
> +&gpio2 {
> +	gpio-line-names = "GPIO03",
> +			  "GPIO05";
> +};
> +
> +&gpio3 {
> +	gpio-line-names = "", "",
> +			  "GPIO09",
> +			  "GPIO10";
> +};

Hi Drew,

I just noticed you've moved these entries compared to my original patches, so
they're no longer sorted alphabetically. Why?

Please see https://docs.kernel.org/devicetree/bindings/dts-coding-style.html
under "Order of Nodes".

/Emil

