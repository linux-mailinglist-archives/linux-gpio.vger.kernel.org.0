Return-Path: <linux-gpio+bounces-839-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A6976800D90
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 15:43:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46623B21213
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 14:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A53623D973;
	Fri,  1 Dec 2023 14:43:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21A3A129;
	Fri,  1 Dec 2023 06:43:23 -0800 (PST)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6d816bb0a61so316601a34.1;
        Fri, 01 Dec 2023 06:43:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701441802; x=1702046602;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DCYZ+Bm3daBed4GwrX4PtDNVJz6r8G24Nwx9MUZT7rU=;
        b=la6D/a8jJOgSu6HN6KqphjfVzPX685wpg5yKoPxWWs1Cl+NuZyLQWZLckvET1aRn2K
         c2G9Hs6GsZxg/z9uSQXhw7xiFsf0JBCJK4f6LtKqSyl9zH3xnBZXQ3fT4XIDPvUBeZ2m
         UjUTLlGPYVrYo+f8tghnrrfCgTYFBo4aGX3xuKGuSfND0GA8v8joeGdv8/MmxB8YlZq6
         ejnbq6iyndjWy1zbogL+MHLuP3yh4YPhQF5IUNY/AtoGgoeDqcYUVIpYW4eU/FBDUk0M
         /rSdZfq/TACgL0DkXjbN/oD0Y92rZxJ2R/Agg6J1fYFWojegaJn5fvBC8P3XDBAh2q3j
         EsbA==
X-Gm-Message-State: AOJu0YyVM4A7J6knHZur0D+FBN02egqJYxKg1UAzrWbteRzNI3xahNTc
	p4GfkejfLc1rXnyMwBZ2cA==
X-Google-Smtp-Source: AGHT+IF2zodETBseSreraJBpW9QxMb/lCf9ow2JUhJ8zudMIxLZnyoa3e6TakQXkdfxmZEiRVplWlw==
X-Received: by 2002:a05:6830:c4:b0:6d8:41a7:9ac0 with SMTP id x4-20020a05683000c400b006d841a79ac0mr3173521oto.15.1701441802409;
        Fri, 01 Dec 2023 06:43:22 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k2-20020a9d7dc2000000b006d8017dcda9sm510847otn.75.2023.12.01.06.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 06:43:21 -0800 (PST)
Received: (nullmailer pid 980001 invoked by uid 1000);
	Fri, 01 Dec 2023 14:43:20 -0000
Date: Fri, 1 Dec 2023 08:43:20 -0600
From: Rob Herring <robh@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom,pmic-mpp: clean up example
Message-ID: <20231201144320.GA977713-robh@kernel.org>
References: <20231130172834.12653-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130172834.12653-1-johan+linaro@kernel.org>

On Thu, Nov 30, 2023 at 06:28:34PM +0100, Johan Hovold wrote:
> The Multi-Purpose Pin controller block is part of an SPMI PMIC (which in
> turns sits on an SPMI bus) and uses a single value for the register
> property that corresponds to its base address.
> 
> Clean up the example by adding a parent PMIC node with proper
> '#address-cells' and '#size-cells' properties, dropping the incorrect
> second register value, adding some newline separators and increasing the
> indentation to four spaces.

This is fine, but I prefer these MFDs have 1 complete example rather 
than piecemeal examples for each child device.

Rob

