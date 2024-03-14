Return-Path: <linux-gpio+bounces-4334-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6794C87C05F
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Mar 2024 16:35:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81175B20BFC
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Mar 2024 15:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B5477316C;
	Thu, 14 Mar 2024 15:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n1H/v/ft"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8F271B54
	for <linux-gpio@vger.kernel.org>; Thu, 14 Mar 2024 15:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710430387; cv=none; b=uTcmYszI/FcPypFMP6vXOMv9mf2zSiM2waTtmRn6UNzJqLj/mUlfh3GJHJqvRhR4AJpV0ujtANfJ2KLiwjXt+3PzsmnGwLQS2KpD/SLL7srZDK1KpFdQDG/zqrdr8vYzUAQgSdmWu5FH3SjZ8bdgh62vV963xPmYVEx7VcKR99Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710430387; c=relaxed/simple;
	bh=o1OdgC7p5Fjbh1yGz4D8klND3WPdQELLcIADzhaB1AY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WyC7xjGbEnzsmTs/PWmZGC0JxWvZPQT0aIaVdwI7i2UjSuGMUQCf6TAZAAemFotudkg8s5hUqqIfUWRIHRMDENkuILrN4qYuVsDR39Id10mYQG0Cclo2BjYAlT8VVn0E/keSqbM4KebgJheKP0xxaQEZjfzjKQt2T98nCXwV/9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n1H/v/ft; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-513a81b717cso1423833e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 14 Mar 2024 08:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710430383; x=1711035183; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OfZ44noiqcLfjfF8Ywh0SOVK7cdHIhTKcL05schUTKQ=;
        b=n1H/v/ftZpIMrmg8EPUbvZ7aKCfUauVWz6FjYMUW/BEqbz1TNtSd29RC5z4xr8D7Tg
         aPdxJtAvokq9XmXxzY5kMhugS/LV3HLyBfvzjkn2qh9ObC4A2DR5GdxuiGJ4dXcyFYNh
         6Gyh5vaM0PLFLXUGVVipPnJ017+m8M2JH4HS5NwBKG+3Jji9QpV+LWvI6IlZZwmOTq/4
         vzJ2SiJozoI0B2eUK+L4SLGIbAmoU+CRCWnieD5ZWS41vTIQ4b4TFKRtCtiO9gd/68Hg
         4qAe7Iv2XsEbaGyG7yJQ/x31QFG+IryJpVF/Ae+NHQgcAV4VcF7boz6Fm56g6MPIIQrk
         fquQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710430383; x=1711035183;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OfZ44noiqcLfjfF8Ywh0SOVK7cdHIhTKcL05schUTKQ=;
        b=vI5xZdCTdbWY4hHb/7iH9g/Rf/i4kaa2CoIsbnjNB5ZVUIX11UdCmI2vGkWaJ9GLQH
         HBJLue2+WC0yqRDH8R2m4pckvDfzGqmejijf8BWhYkwqbUtsFvx0taJpF+BG6oDTUwoU
         eq3RlK9tOPvzDGHQIJSbFTmsL4WBBWXxUUGFeaLFAIZgbxNt/0FQq2u8UpFZCWsE23fg
         fKAS6+5EqBv8WEDow1kOTUHsOYgvonPRibJlKhpkbLlIzlApKGv91ybvUg1z3TedAAKy
         9NB8u2ZRuMnX/V1k/YRccR9om3bB2FDB3+efFETWjCSEvuBtu7LLnix/Fh2z79IBvxtu
         38hQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJvlWWta5uWr36bVO48omfCfNfIM7Q7EfW9zD0ax/NgFKnKfZv2JVPFPuG3so8rYhDjQc0RfZKC/GMW5/bkXXMcvhA/IMSe8+ftw==
X-Gm-Message-State: AOJu0Yzs3T88QgvNH3seYITGgbygJG564Mt+lQ9VRkJJcWmWik68vb6p
	99v7GPOyXDPDjOHIt4lXyPheXe+BobvSWjhDP/6Nhq2yHROCiHfX4Xk1PdEpBK0=
X-Google-Smtp-Source: AGHT+IFTuAHUe3ZaxXllTu7l+7uVOWOjoymsRTxe6uGqOcnWjiy8UUNDfx+uS3Z+t2fZZ9Be4d9tQQ==
X-Received: by 2002:ac2:5bcd:0:b0:513:b90f:f4dd with SMTP id u13-20020ac25bcd000000b00513b90ff4ddmr403922lfn.49.1710430383342;
        Thu, 14 Mar 2024 08:33:03 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id j3-20020a05600c1c0300b004131310a29fsm2821478wms.15.2024.03.14.08.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 08:33:03 -0700 (PDT)
Date: Thu, 14 Mar 2024 18:32:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Peng Fan <peng.fan@nxp.com>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 2/4] dt-bindings: firmware: arm,scmi: support pinctrl
 protocol
Message-ID: <cade37a8-eca5-4d42-aadd-e6b7b2d40ee1@moroto.mountain>
References: <20240314-pinctrl-scmi-v5-0-b19576e557f2@nxp.com>
 <20240314-pinctrl-scmi-v5-2-b19576e557f2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240314-pinctrl-scmi-v5-2-b19576e557f2@nxp.com>

On Thu, Mar 14, 2024 at 09:35:19PM +0800, Peng Fan (OSS) wrote:
> +  protocol@19:
> +    type: object
> +    allOf:
> +      - $ref: '#/$defs/protocol-node'
> +      - $ref: /schemas/pinctrl/pinctrl.yaml
> +
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        const: 0x19
> +
> +    patternProperties:
> +      '-pins$':
> +        type: object
> +        allOf:
> +          - $ref: /schemas/pinctrl/pincfg-node.yaml#
> +          - $ref: /schemas/pinctrl/pinmux-node.yaml#
> +        unevaluatedProperties: false
> +
> +        description:
> +          A pin multiplexing sub-node describe how to configure a

describe[s]

> +          set of pins is some desired function.

s/is/in/

> +          A single sub-node may define several pin configurations.
> +          This sub-node is using default pinctrl bindings to configure
> +          pin multiplexing and using SCMI protocol to apply specified
> +          configuration using SCMI protocol.


This sub-node is using [the] default pinctrl bindings to configure
pin multiplexing and using SCMI protocol to apply [a] specified
configuration.

(Delete the duplicate "using SCMI protocol").

regards,
dan carpenter


