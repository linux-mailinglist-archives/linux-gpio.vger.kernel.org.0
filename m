Return-Path: <linux-gpio+bounces-4689-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D58788DC61
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Mar 2024 12:20:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A4E7B24038
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Mar 2024 11:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 343AD59B4F;
	Wed, 27 Mar 2024 11:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yPn0cnQa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6364159153
	for <linux-gpio@vger.kernel.org>; Wed, 27 Mar 2024 11:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711538431; cv=none; b=qdsH49IrXHDQ5SoyQ77Sgd3Xwkti02mz+zdku/XXGxT2WGxSkcIGtT13DlhIT0lxLBNNbv/qhp39VTLHSUpNVOfkMCIv9bJRm9whklsXoIbchGv/punaZCqyYdlTfLQuNSYqjfl5qF8b5Vj4m00mWCPXQgJtsfZ0pkJev3swZXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711538431; c=relaxed/simple;
	bh=sLGilc1NTQU/20JtIzlYYh9ER3iVh8O5ZE4v4dpJ9gE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LZiSOZfjdGIyWdtvDQGuXZhtbw/q40KOQm0bkHyheQFE7daiLKErdlvoA2g8nZM1tbWJ5bO70q9SXF9VviB9LJr0OMKHGprb/WFG7ks5DOolOFJ3ODNkTs99Rm/npMJuPe2SYuceBqdwXNwqcITTIw0xIkAwpwwNHfMWVSCF7jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yPn0cnQa; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a474c4faf5eso426497166b.2
        for <linux-gpio@vger.kernel.org>; Wed, 27 Mar 2024 04:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711538428; x=1712143228; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+rLYEsrATiPL/v2vO8QHboqtuHAhSql0Vcajen2fdC0=;
        b=yPn0cnQay92fwD0uKnNOLyV7j/xVNYtUzIqoKMnnIcDT6hGSGGMmBOZD53t+8Kt3bC
         Nzzz8l4E6dSM2RNQchTHB4XFk25X6WbM2gNbc+IfjfE6u8NJ2oQfoTiAi2kb6Eh6/lKV
         MGkDvo1AM83bsBAb4Y6OkxDCKVoKNsh/xIMV6qMUYrHbwDrfsUNoocR3Ak0iNlVhksKN
         9YGtsWu0E82S41gdu9SHmIwg8854RLSau+s2RF5KhF7/mJOrDbyCsJSjaXbavL/2fV8d
         oWYzT6rFbe1avXAkJ8GSI0Ru8cjC5esyAh9hNJ96AbW0YADpPMU4oe9RhzsFGxB3Rtt4
         /GHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711538428; x=1712143228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+rLYEsrATiPL/v2vO8QHboqtuHAhSql0Vcajen2fdC0=;
        b=usQCoyr8DRx5lkWpZYfmKeCqc39qxt5qWd33ogChG41fx1cl4WsJ068+d1qS8CacEx
         FIjE18D5I0s780pZnyTK+oSQjcaAh1OnGw1h7UBQJzeyLor3sCnsKPUkrseU1FUHkWcH
         XuuavcHMI4hYfyFr6FOHx74Q8zMrZcs+lUKv3bUgzpUz9NK3TA2OTKEfu5AGDEPcTRHo
         mQ1POOlfi54SvXJcR7712kIBYZYwhhpv0p2kPjJ8R18JhQFzINACfmYYREka3ZowdWiC
         zwsUOywWoY6DVsILrTVxaOYIP8VbzhMdXuhTpcJ+g/iVCeLpAGE8IGLgUG90zP4j5sZT
         DSZw==
X-Forwarded-Encrypted: i=1; AJvYcCUas9cFahPAwfZDFKv60HaZ1TWICGvfXPxoxyNuQHi8HH2zYjMdsKkAntn1zxccXy/QFB1S0pUilMt6mdHThGkInHtqxCywdQyuuQ==
X-Gm-Message-State: AOJu0YyRETXB+3e0GIrdau5k/i9KAJa1upoYxB8Bs8tq0eL2mcBOY3zR
	dhJT2zSlfRBxSrK4uyniB1Vvxb1ZOpdwIsbjCyfz7NrJ102fv1RvxnvIgUcwHk8=
X-Google-Smtp-Source: AGHT+IGeBgEp7hvEv/ZVJCOrCyHMMCcPPW3O1khQf6wm+VqzRsO348+zMqvIj69jGo7U7jADPphm8g==
X-Received: by 2002:a17:906:3747:b0:a45:ad29:725c with SMTP id e7-20020a170906374700b00a45ad29725cmr670356ejc.62.1711538427605;
        Wed, 27 Mar 2024 04:20:27 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id l19-20020a17090612d300b00a46cffe6d06sm5307387ejb.42.2024.03.27.04.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 04:20:27 -0700 (PDT)
Date: Wed, 27 Mar 2024 14:20:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>
Subject: Re: [PATCH v6 4/4] pinctrl: Implementation of the generic
 scmi-pinctrl driver
Message-ID: <66e34e4a-82e1-4c52-843e-019daeaf4768@moroto.mountain>
References: <20240323-pinctrl-scmi-v6-0-a895243257c0@nxp.com>
 <20240323-pinctrl-scmi-v6-4-a895243257c0@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240323-pinctrl-scmi-v6-4-a895243257c0@nxp.com>

On Sat, Mar 23, 2024 at 08:15:17PM +0800, Peng Fan (OSS) wrote:
> diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
> index 87d9b89cab13..0ecefe855432 100644
> --- a/drivers/firmware/arm_scmi/pinctrl.c
> +++ b/drivers/firmware/arm_scmi/pinctrl.c
> @@ -465,6 +465,7 @@ scmi_pinctrl_settings_conf(const struct scmi_protocol_handle *ph,
>  
>  		tx = t->tx.buf;
>  		tx->identifier = cpu_to_le32(selector);
> +		tx->function_id = cpu_to_le32(0xFFFFFFFF);
>  		attributes = FIELD_PREP(GENMASK(1, 0), type) |
>  			FIELD_PREP(GENMASK(9, 2), chunk);
>  		tx->attributes = cpu_to_le32(attributes);

This should have been done in patch 3.

regards,
dan carpenter

> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index d45657aa986a..4e6f65cf0e76 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -450,6 +450,17 @@ config PINCTRL_ROCKCHIP


