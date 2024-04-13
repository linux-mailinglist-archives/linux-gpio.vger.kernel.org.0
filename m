Return-Path: <linux-gpio+bounces-5451-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0468A3D17
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Apr 2024 17:09:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C72F1C20BC9
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Apr 2024 15:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3CB845C06;
	Sat, 13 Apr 2024 15:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="My7h+C74"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0313445978
	for <linux-gpio@vger.kernel.org>; Sat, 13 Apr 2024 15:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713020981; cv=none; b=J45RQD8n9mq7ONmmpM4joU8O2e4K5pMO7SciKeZnjofbnYjhuKlzHM7beUz3aorApWKiGtVenzmixxxX0rmQ5cEd8+7RtsVLXxvu11XwP4176az/UUmUf9BXRuD4TPb+cUeL8/lhcRz8GzeHLoaIsO6ooSxSTj1rsUbUdgpfOX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713020981; c=relaxed/simple;
	bh=/NjYV+1zOoIBYarTIVIWxP8vVCv6VUoUEXR5Fe09YZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=n8QHhV5jORROusyustQNqYPmQNonYL0E6lna4PYtWuZlNkQBjScRM8NJzC1n0lLXtCcyIl/JMuIqu0zEt/T9GVv8HBY1Nb0ZAyJZyI7D/f+UrFpT6qBnVAgEwG82tpoi8YEWFpeomGI9WmvVU+8XpCu4iaiUspY0aLdXpvQBcWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=My7h+C74; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-56e6a1edecfso2880712a12.1
        for <linux-gpio@vger.kernel.org>; Sat, 13 Apr 2024 08:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713020977; x=1713625777; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uUjiWSpKaaRot8DcPu9d3bUDl81R1NzujRT2QNtvHUg=;
        b=My7h+C74dRW4wE+Xqh+COiI1ainFn5ZLFCvPd8aMYSWDtpLrkecCnPoKEKztpEVxs1
         CDw0p3761cLgL9+x+3RL6R3FfZpSp+oY1RojX7nAK0oXMUNDgt/QO8Xdo8oed2kg88lq
         aQl6TJaa1q7ZaKPLyOeJSh/TSwxgf3WIg5VV5U7RVsz9LS1g+pF5T5ROgpTrq3DQevcf
         9KxapTLkU9I7sgBzK0CSJP6jZvElZKUigDVgI5M6FOdkTVBiVvTVhbmcq7ZpcoRYHVG9
         84XtGyXGYwhTcIGMW5xq5ZKWUl/DkER47+3l2C8ZohXpM4mKQsuUm/xDrDO6qd4zfqqr
         sKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713020977; x=1713625777;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uUjiWSpKaaRot8DcPu9d3bUDl81R1NzujRT2QNtvHUg=;
        b=AB5B9obj/bYcFE7ZQoK+hIxAj+6YzTlveB3XkzyE33Z6i6MH4wd00+GRYXf1nqMo6c
         ndXjRP5gG5kIqi8yrxr1dxWQ5PcX/YIQI9VjNz0sCNo1gH9VFog9+5W5BQTy2SI+tY1n
         tQDZZgrr+rzPn8RaTlPtxTK3MIgr6lBqt9c8VYQMT/lbAeVd6KH2r2b/JFO4/bZzXMFh
         5hLMqb9cqhuqMvNYHABLBVsN4pRv1QjKcNCJ01+I9/m6C4g6UtT/jYXJDlFnjmaJDXrg
         GSlHF2lf6UNCWuxv+KJjb46xeQhXvycbJ18Az3tPHcJ0d1pNZH393CdAvRIzIHV5r/GC
         jwug==
X-Forwarded-Encrypted: i=1; AJvYcCUc4u5WvkIMkUwbWfgxBddMsmC196purbXet4h+zcJrFPJUX+LwVIkBi2tdOeNiAsLbBV/7AtXB9hnEoQLe2BJPnQs5KZsC3KPvNg==
X-Gm-Message-State: AOJu0YwivVzqfNgif8cNkuwKZcItuU/zQ428pqX/gR8lPTVgZ3czypTP
	fAFS05p0x+C2jfJFPTwkabCHwr831EJfd7nn+BYCCVx2laFZvVogB20SIMxsBKw=
X-Google-Smtp-Source: AGHT+IFc3+tRxkNnLJgriwRgYfCZg6Q2OengoVU4yFnYPJb1OCMAgLNnXGgH+u17/mdvLCec6XsXsw==
X-Received: by 2002:a50:8753:0:b0:56b:c210:870c with SMTP id 19-20020a508753000000b0056bc210870cmr4440554edv.15.1713020977139;
        Sat, 13 Apr 2024 08:09:37 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id g37-20020a056402322500b005700e153647sm806121eda.38.2024.04.13.08.09.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Apr 2024 08:09:36 -0700 (PDT)
Message-ID: <f245966c-267f-4159-a9ca-2561693d24d9@linaro.org>
Date: Sat, 13 Apr 2024 17:09:33 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Avoid error message on rk3328 use
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Johan Jonker <jbx6244@gmail.com>, Dragan Simic <dsimic@manjaro.org>,
 shironeko <shironeko@tesaguri.club>, Etienne Buira <etienne.buira@free.fr>,
 Jonas Karlman <jonas@kwiboo.se>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <ZhqO-DEmh-6TeHrt@Z926fQmE5jqhFMgp6>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ZhqO-DEmh-6TeHrt@Z926fQmE5jqhFMgp6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/04/2024 15:56, Etienne Buira wrote:
> rockchip,rk3328-grf-gpio is handled as syscon, but syscon mandates

syscon does not need such property. I see it in gpio-syscon, but not in
syscon.

> presence of gpio,syscon-dev node (or it will call dev_err() when probed).
> Correct rk3328.dtsi and related documentation to follow syscon's
> expectations.

No, look at gpio-syscon driver. Parent is used.


> 
> Signed-off-by: Etienne Buira <etienne.buira@free.fr>
> ---
>  .../devicetree/bindings/gpio/rockchip,rk3328-grf-gpio.yaml      | 2 ++

Please run scripts/checkpatch.pl and fix reported warnings. Then please
run `scripts/checkpatch.pl --strict` and (probably) fix more warnings.
Some warnings can be ignored, especially from --strict run, but the code
here looks like it needs a fix. Feel free to get in touch if the warning
is not clear.

>  arch/arm64/boot/dts/rockchip/rk3328.dtsi                        | 1 +
>  2 files changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/rockchip,rk3328-grf-gpio.yaml b/Documentation/devicetree/bindings/gpio/rockchip,rk3328-grf-gpio.yaml
> index d8cce73ea0ae..2c878e7db900 100644
> --- a/Documentation/devicetree/bindings/gpio/rockchip,rk3328-grf-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/rockchip,rk3328-grf-gpio.yaml
> @@ -38,6 +38,7 @@ required:
>    - compatible
>    - gpio-controller
>    - "#gpio-cells"
> +  - gpio,syscon-dev

No, not needed. And also incomplete - where is the property defined?

It does not look like you tested the bindings, at least after quick
look. Please run `make dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).
Maybe you need to update your dtschema and yamllint.



Best regards,
Krzysztof


