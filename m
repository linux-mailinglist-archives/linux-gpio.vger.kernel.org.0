Return-Path: <linux-gpio+bounces-4987-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3503D894F84
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 12:07:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3E6C28327C
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 10:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A34459179;
	Tue,  2 Apr 2024 10:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aKOdjmG0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4625C58AD7
	for <linux-gpio@vger.kernel.org>; Tue,  2 Apr 2024 10:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712052414; cv=none; b=q3iWiIkwyHIykEaijFyWapMmW98bm39h0pwgyBZ9oFojlBFTSjZhqx+ZKsPhA3Mt1G4t+Lp4NeM3RwaeJT851bCQ7R92VjfGR3khkDLWFjo20oOW2kLMiptiC/boUOux0zQcYKBtk3mOW2f1MTmA1KEXKJjyirBrlbz7Qi4Gg34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712052414; c=relaxed/simple;
	bh=Cw2Q3xDBBRAVFPRnXEzp+S1KCZjxpnypMCXgMiTtqRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WrNbMzvZMb0a2b+BrgM7atR8NYW43cP0XP/xlB+BigF+TaEGV4GZRzyzaAQzfrHy9vx74j6Nc0C1EIoMwFLgMxdCbxidT4uvIgsoxGwu7O4jaglpfigyepGYNEinlmZoPGw/1nyKqlhsUYTDDAKzncNyf4/01lIG7gPQU7z6XQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aKOdjmG0; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-515a81928faso6097598e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 02 Apr 2024 03:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712052410; x=1712657210; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E71HktNt2vCJ+kaJF6zj4KNKSsAq8viHRU6nqxmCOvY=;
        b=aKOdjmG0tPi/68df5jLwHXaCeZ/Fm7pFgFMgqI3EfG4LUfoVBJwV9UdhpNmHyUho9b
         aS/kwC85ikolF5L07SB8+LVGwiG+x42K31ieo/cMwPu8Jrma1lJ+nDYQMTYA7WxRFWRo
         ns3xupZzWTnPOYcooVsi4aDi+vb3Dwgq0ImJPlG6PJWKZczgyOMKg8DXaKDhUzqBoHAG
         mOaonTFtRUxdEmZQ8OxEVZwDyCVdfeEmK9C11JGteZreOxYrd3hQr3mniIY1ZNdPDKyR
         sPpP4Y5E8aSZUeJxdibzVxNS9qD87/DpYcUjEUFMT1FRV/+jun4lRBv90gHY7onYJuYE
         uGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712052410; x=1712657210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E71HktNt2vCJ+kaJF6zj4KNKSsAq8viHRU6nqxmCOvY=;
        b=FLRFSkA7/62TrkikgQ4DwfUzjtHt4jjH/EydeaUygCCyDZ9mOsIsCbBfXZN9Eooo50
         0pThyFCUaE2KkTDDq8aHe0c4FJhEnlI0AHmpcels7nxc2M3GkAPDIezfObodUELmqYYf
         1slUhBwpY9W4kns0C7MaZ3L1dSo9xMZbDHVkNxaFFInG7SOduef87YsVmnQ8k0nGDbdT
         fbA/NdC1T8xOZR/ykebTAl7k1y8VE1Cxz90U8HFBveyss9IQX0udqBg2bQQR9u/MxlxM
         IKHnfStBNat5MpHAlVdUxmfoiKOe76UEKunDdt5OuZVkmD9xJ0O0pSUaDkdU1XsCXmag
         ty+g==
X-Forwarded-Encrypted: i=1; AJvYcCVIknbho4GddvcQP/2+GG9RuWc0NZwxa2ccnMmCyVNvz3kW8kKsI9xPvK2Kovm9SVZM0RcCSOlFtDyN/qXyOpfJFasSe9jtzKoOCQ==
X-Gm-Message-State: AOJu0Yxgj6iOYubKBgVdH3NU37f5amYpGZlXok73lUAidJoIlcK69LRb
	zu9h8PoSQql4v+oWs8xXE+NcceBHguzmTCxnBJ/wDoPX5OK39IK7yNbmmhbfM50=
X-Google-Smtp-Source: AGHT+IHLSxAEB2SvV6kZYK4cczrb+dS+Jp7tjyU4B2As9XYNP5YzX/G7r2iO34wGH6orIwv4AvcvUg==
X-Received: by 2002:ac2:4559:0:b0:516:9ec1:b197 with SMTP id j25-20020ac24559000000b005169ec1b197mr5087862lfm.36.1712052410239;
        Tue, 02 Apr 2024 03:06:50 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id o10-20020a170906774a00b00a4e472a8e54sm4180381ejn.48.2024.04.02.03.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 03:06:49 -0700 (PDT)
Date: Tue, 2 Apr 2024 13:06:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bhargav Raviprakash <bhargav.r@ltts.com>
Cc: linux-kernel@vger.kernel.org, m.nirmaladevi@ltts.com, lee@kernel.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, jpanis@baylibre.com,
	devicetree@vger.kernel.org, arnd@arndb.de,
	gregkh@linuxfoundation.org, lgirdwood@gmail.com, broonie@kernel.org,
	linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, nm@ti.com, vigneshr@ti.com,
	kristo@kernel.org, eblanc@baylibre.com
Subject: Re: [PATCH v5 09/11] regulator: tps6594-regulator: Add TI TPS65224
 PMIC regulators
Message-ID: <29d6a737-0bfc-4440-ac57-54c94c6d7ad4@moroto.mountain>
References: <20240328124016.161959-1-bhargav.r@ltts.com>
 <20240328124016.161959-10-bhargav.r@ltts.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240328124016.161959-10-bhargav.r@ltts.com>

On Thu, Mar 28, 2024 at 06:10:14PM +0530, Bhargav Raviprakash wrote:
>  static irqreturn_t tps6594_regulator_irq_handler(int irq, void *data)
>  {
>  	struct tps6594_regulator_irq_data *irq_data = data;
> @@ -369,17 +513,23 @@ static irqreturn_t tps6594_regulator_irq_handler(int irq, void *data)
>  static int tps6594_request_reg_irqs(struct platform_device *pdev,
              ^^^^^^^
This function is not beautiful.  I think since you're changing it from
being tps6594 specific, maybe you want to rename a bunch of stuff.

>  				    struct regulator_dev *rdev,
>  				    struct tps6594_regulator_irq_data *irq_data,
> -				    struct tps6594_regulator_irq_type *tps6594_regs_irq_types,
> +				    struct tps6594_regulator_irq_type *regs_irq_types,
>  				    int *irq_idx)
>  {
>  	struct tps6594_regulator_irq_type *irq_type;
>  	struct tps6594 *tps = dev_get_drvdata(pdev->dev.parent);
> -	int j;
> +	size_t j;
>  	int irq;
>  	int error;
> +	size_t interrupt_cnt;
> +
> +	if (tps->chip_id == TPS6594)
> +		interrupt_cnt = ARRAY_SIZE(tps6594_buck1_irq_types);
> +	else
> +		interrupt_cnt = ARRAY_SIZE(tps65224_buck1_irq_types);

Either 1) pass both the array and the size or 2) just use tps->chip_id
to determine both the array and the arrays_size.  Passing the array and
then determining which array was passed by looking at the type is ugly.

regards,
dan carpenter


>  
> -	for (j = 0; j < REGS_INT_NB; j++) {
> -		irq_type = &tps6594_regs_irq_types[j];
> +	for (j = 0; j < interrupt_cnt; j++) {
> +		irq_type = &regs_irq_types[j];
>  		irq = platform_get_irq_byname(pdev, irq_type->irq_name);
>  		if (irq < 0)
>  			return -EINVAL;


