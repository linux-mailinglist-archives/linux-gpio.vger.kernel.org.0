Return-Path: <linux-gpio+bounces-4814-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A36BA8913D4
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Mar 2024 07:36:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E2C96B21EF7
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Mar 2024 06:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6368B2D602;
	Fri, 29 Mar 2024 06:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Ay1mw+WD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8142E2576F
	for <linux-gpio@vger.kernel.org>; Fri, 29 Mar 2024 06:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711694192; cv=none; b=Fo3WLOrRiUqiym3UTUhXznquwH1oWucc4WmwfzkkvS1ys/QQErVH+Zpq2ZwFEyy9zFXvJwCk1EVMB8rk/pgIow8ycL5OTddtVP4XJ3XAl1xQOVwpzy5/EGA4NkjrACHyYIejEPMXCm/hyeT9aDOuHClXSGD9u4KVjjFA18bTPyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711694192; c=relaxed/simple;
	bh=zvuXhVzKRKNmjsXHGNO71Xw7k2AL7GmRkRL9GC6fsuw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SEc1BP6QibBP2BNHFfzhdsBGstmCgDqQqPBSvQg/q+cLVcwLmU+cZPHYbTIe5r/xQvSvIDxUDDgZQBZsBrCo1lli2o0MFHdbTOefNxeAS9KD/I2dGhoruf1D1pGFyGxSWi6FfJgcNWTTU4bRLb+LPdNvByW0Jn+p09BzqOy7Y9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Ay1mw+WD; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-341cf28e055so1214223f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 28 Mar 2024 23:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1711694189; x=1712298989; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=43xZx60rfZWmX/MW6KInTEWOudBJZZMkJu12Y5dNCZU=;
        b=Ay1mw+WD5UM8yLaWezfd9y8AEU3ImzlCFbk9BuyIWsAoszrdlIGHbAG4JvrSGIhB22
         yZyZX1e6vyYmpuHsq6ZQlFcGZTZyQoWkBWYUJ+wBmfOjtIB8s+AB8GGpnXvkKf7V0ZOM
         Yv6baXkQH+CLCawSJodgtYPbwGMXtUh/T0p0jGRdgs9WTyVK1rdxHYEDT8E3WnnrOgcr
         0lOKi5pgcP6j01rXAB8IW5JE73tcTKWcPai+oZnZOluLmJueXvdKOTKqdVSTG8zbRVJ4
         nRqmRJLjqj7S6oV5O8pf/RVYP0rWaoF0aHvpHLJ5HzYuqi3InjUe/MDtxMltod2gbFiq
         xDaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711694189; x=1712298989;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=43xZx60rfZWmX/MW6KInTEWOudBJZZMkJu12Y5dNCZU=;
        b=v6nkzqGcZ5FrjWTap9OZW3UyNhx/Wmdh16KkgkughkwcD7UFft5bUfYclSfTHb6tgS
         TIIp9FDXIGPFIsibZ9lVpK3welE5llE4eFHodeSWH7eH+0xHfUKFsSyIzwGhL9AukrVK
         svIAuSoAg6C7QKLYw/qu1kWKQDWCvWNaD/zQ7TeILTlxvyFJ9s/yA/BqljeYrYOzWa4i
         PdlhSsjcGWis5DV/xlYZy5L2nnynN4j5UbBJw5z3F2g0XRnQoz9a3BKrdPoKdfkg7e2C
         5ky2f7nvzTacggiZdg3FHihmju3rIWDvT5WCW48nepUl883jX8JnH9u1cIrHoPRwTEFA
         3aYw==
X-Forwarded-Encrypted: i=1; AJvYcCXlFhXTlN+T/9nA58VwS6XY2AL7Ijy4vgM/336pD8LwtAu38QRTkOX/crx1dLcJQ3P+jR65CjetfkFI//6Uw1SCIG4m2nPxOF6nyw==
X-Gm-Message-State: AOJu0YxYHVxddhM6PS2vcIXlKX6jNVC4VZj9BNsr25LphhXdrK2OReOW
	2juRTWSPlNtyoDCdTIlNJb53HyCne+5+j6bq4+H2GIqK6JHut7L5wkNUtEeb3pA=
X-Google-Smtp-Source: AGHT+IEVLeAaHFiI4gvE43nlAphVjGnGp98O60VdyrE/01nb5Rcj1iSVPlTnLH+WsyKz1julrP/fFg==
X-Received: by 2002:a5d:4b8a:0:b0:33e:7f65:bb7b with SMTP id b10-20020a5d4b8a000000b0033e7f65bb7bmr820243wrt.5.1711694188839;
        Thu, 28 Mar 2024 23:36:28 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.147])
        by smtp.gmail.com with ESMTPSA id bp29-20020a5d5a9d000000b00341d28586afsm3494618wrb.2.2024.03.28.23.36.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 23:36:28 -0700 (PDT)
Message-ID: <16dc5bd3-9231-474d-8056-d7b0240716de@tuxon.dev>
Date: Fri, 29 Mar 2024 08:36:26 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 13/13] pinctrl: renesas: pinctrl-rzg2l: Add support
 for RZ/V2H SoC
Content-Language: en-US
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240326222844.1422948-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240326222844.1422948-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <25bc9ceb-c5cb-40a2-8c3d-d9666b88546c@tuxon.dev>
 <CA+V-a8uegButH84aUY1N+0GzZx2LkRBTxNtg7y1Y-cUvvFfJpw@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CA+V-a8uegButH84aUY1N+0GzZx2LkRBTxNtg7y1Y-cUvvFfJpw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 28.03.2024 21:51, Lad, Prabhakar wrote:
>>> +static void rzv2h_pinctrl_pm_setup_pfc(struct rzg2l_pinctrl *pctrl)
>> Have you managed to test this?
>>
> No S2R isn't tested and is just added for completeness, I wonder if we
> should have a SoC specific flag "pm_supported" for this, as apart from
> RZ/G3S  nothing has been tested I believe?

Yes, only RZ/G3S PM has been tested.

