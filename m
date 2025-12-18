Return-Path: <linux-gpio+bounces-29750-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 611C1CCD4C9
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Dec 2025 19:58:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F0A3530298BA
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Dec 2025 18:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E806D313541;
	Thu, 18 Dec 2025 18:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NzOjmPrn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79ACF1DF97C
	for <linux-gpio@vger.kernel.org>; Thu, 18 Dec 2025 18:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766084327; cv=none; b=VLCj+fER8N7mkWiURbfc+Pgp3N51CBC2r6bFJVOhx5Z3VUiOrN90Q9Ugev0g20KlTGzVzfPTbsZhADy0Jje1D1XMc11HMXMweATSURYs4b78VveYrpZsGIeJl/0r0EPQsU2ejewIBn+f/QvIYAK6NTg+icz/KZoVYiart0wKyIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766084327; c=relaxed/simple;
	bh=Jku28IM/c1IYSHnKsavbvy9aaLBIgMj3F4YQHgrupho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fql9EefKWN0X6rWKax3aUSxWTRvc0bntj2M+qOdfYFAbcgOUgdtE0m4Ljj6zjpOAiesQWaamREKzOxjfVSmmJc68zRBSqGgZ/jg7LPlo1ox76ktLyr+f9GZYwI4YjwtpSx4ZVvFoU5+c0DokSuwVCKnxIxN0xfnFqnT1y249XEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NzOjmPrn; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7fbbb84f034so914510b3a.0
        for <linux-gpio@vger.kernel.org>; Thu, 18 Dec 2025 10:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766084317; x=1766689117; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AQfRVSe9fO1PObUKRZHse1cNpjrf0uUXBusNVMTFfiA=;
        b=NzOjmPrn46f7eL94kTiu7+0zvL7EqcBFTL/HGLf3Rc6h3rBZjvJM5i3qCCD2fYrXy7
         eJklrOOWGmpDdYURm2bD9+/3PlBRsY8WKHCZ2GLGzwLcw74QlWuQ3QwUrvnoh8XgWay8
         gOij/Oftk04H9HcDeMjrum7Gp/tJMDS9TcpBQwDo75WutLi+yiY8j3WBiG0hbm0He5W7
         e9CpO9bAAOVDpz+N+io0xTJRBjOcs9kNkjAd+Z+kY0znjtSG4hOPaCJlbg1PV1xakEpj
         cFYP81lVX+QhyL2f1NFGqqWTbtem9suiHwzZLYFwy//KO+NJmpEmbUADkYq65Km/0XcM
         myZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766084317; x=1766689117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AQfRVSe9fO1PObUKRZHse1cNpjrf0uUXBusNVMTFfiA=;
        b=TebU5YuYz8wFPiayqzdNeFtunVvLorsgpmAWGKBDcXmshGxmVliNwKeiADjER27l8R
         6vJXYAxgANoPleOpq8/cVe6rD9xCf5YR3Sc8UslNYmuPtLeMMFDIvpSpGiNN7y83pbMj
         kJ0xTJ44oa1CO08CUlgMwr4BCrfsCAozToU8Svu8llxo1tKLlucPJ6+WER5Ta7Se5vrb
         ufs9hEWqKSe+2JY2o7XBScFCnJYLzZPLuqiTJmuTisuy3bKtvqEtlcrtYNUKwct9l4Av
         oxBTb4BHYMvRUIJC0MaP0feZAHES/IxTwks2Yhs0F57OqJbnRi3dF+ojZtpks/wmy1FJ
         +y6A==
X-Forwarded-Encrypted: i=1; AJvYcCVj8RSG5ih3B3PsFtprbFLF40M/dadVNPgjzZQN1R+j7ZEdslP0X6Tzh0zOzG/oCFwgX8kxUy9nrwYJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxiuzy9ZXzpGnZq0dM3OurCAKHjxOiJp7M6NIPGfhxnig3tA5Mr
	cA9ZEcEDYlKwPHOO7T9qon8Uha9IZ0SqZPtV+nZmfoh5Ag1czTfZMxCt
X-Gm-Gg: AY/fxX66O7Dth7f/JJYh94ldpfdQ/n7R75ejB/mUsRrX22A1qm2+QqNcSUWcMtBiO9K
	2kPtrPDZ+fQ17Bt67nLnqw14fzI/8RJ2YPS4Zalr4UiBBU3NatCXltrWGwUaevfzvF71GVIkphV
	k6HCVqW5KPEFhO3fcmQp1uladpWDpAmoc40EEusJFvQzfP26rnVV8FudTEbJ0srQcbAp8oCI3Dt
	Zm1uCpy6CNYgpz0HufjiwfqAOg49qDannOvw+AiEI6YyeTg1Fuf5Tok8fVFPPd2D/LiIHZm/CeS
	ArYhVJeDJBuoG72Z+F6+ukSpd4GM5YGAhvhotd5SU6NohQ6J80rtGCSXl51yjD4QT5vbMb+O7Ke
	4IfwCvIlMr+cFL+QcoLxosMN/K4AzmVjMbx5Fx+NRMaER2uXgAidfM27erPW9RYPAetpGGn5yJw
	/RmGmLd6v6sIcOB4iy15zYDD19
X-Google-Smtp-Source: AGHT+IFf3D0xeHaQPPXEeazhorZHgIgTwRHiyRuussKNgJjGtFBYIJhQUMgRhb/IHzjPiFdB5lKzgg==
X-Received: by 2002:a05:7022:3705:b0:119:e56b:91e9 with SMTP id a92af1059eb24-121722dff1cmr177764c88.26.1766084317443;
        Thu, 18 Dec 2025 10:58:37 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253c0c6sm299016c88.12.2025.12.18.10.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 10:58:36 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 18 Dec 2025 10:58:35 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
	herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org,
	andi.shyti@kernel.org, lee@kernel.org, andrew+netdev@lunn.ch,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	linusw@kernel.org, olivia@selenic.com, radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	richardcochran@gmail.com, wsa+renesas@sang-engineering.com,
	romain.sioen@microchip.com, Ryan.Wanner@microchip.com,
	lars.povlsen@microchip.com, tudor.ambarus@linaro.org,
	charan.pedumuru@microchip.com, kavyasree.kotagiri@microchip.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org, mwalle@kernel.org,
	luka.perkov@sartura.hr
Subject: Re: [PATCH v2 15/19] dt-bindings: hwmon: sparx5: add
 microchip,lan9691-temp
Message-ID: <8462a516-4e8f-413c-813d-e7ff0e6eaa1d@roeck-us.net>
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
 <20251215163820.1584926-15-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215163820.1584926-15-robert.marko@sartura.hr>

On Mon, Dec 15, 2025 at 05:35:32PM +0100, Robert Marko wrote:
> Document LAN969x hwmon temperature sensor compatible.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter

