Return-Path: <linux-gpio+bounces-13417-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4159E097F
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 18:12:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 644FABC2A21
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 15:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95693209688;
	Mon,  2 Dec 2024 15:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k5Lk6NCL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0781209678
	for <linux-gpio@vger.kernel.org>; Mon,  2 Dec 2024 15:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733153050; cv=none; b=Qg4WySimA3Rzvs65vmo/NZauerrx+rJyyA2HD7WctSwG+4BXYj21GFqIT2NOpB8xRPtr1VfMKDdssWMeFc1Wfi1aSc0PhIy0ecR3iHpVmEFA1k95eyEglruOnzGNOapdS/3IW5Fn6itq2oJ9ze/WZD7RFo2SMG6/oNQLIG1k/k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733153050; c=relaxed/simple;
	bh=+Xl8s91uz6z0166yhunqPMLThqhGtXNxm6DGP1hGyaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aU/o8Fd8D5OOl80PxWjz2ttYgnbfFs57vW851tVfUH2ImKiHqvgAztcvDNhD3m48XeUJL+vEig88w5iDfyVvybCBPzMQIKzY6VZaBeXjmfHqskQdCgEfX/bLlYab5JAypkoI84y2J+PYm05qk2sA78Fn6crwkuOOVRSZD7IueoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k5Lk6NCL; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e398273d6ffso3020842276.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 Dec 2024 07:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733153047; x=1733757847; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XMx9usLc+8H+1O3Ux5r/Qz56sk5GB2iRle+hBCjO6+0=;
        b=k5Lk6NCL/Q9S2n2SD7XUQy3GgjWsjcXzD2V/+giR9rhAUrOGGCsMQ/r8/8dAPLYGsW
         ulCSdELHI1aTBluKfiDycsvm82o8sgvRyGtiXYSAGP0/WxrT27xmDDDgbwE+M/CCvKEd
         0uh4t60+ULG1Ks4uJ4LNZYFklbSa+BPzal9TSB/GfYKX+XXRNKkYMor2pa3wur1kOHlS
         FwhQtAJpO5o9tSZUZtX+ynvGl4TSVftm5BgyNchSRDtjBsudY0vkHF6+9NmXWz9zclq8
         x8WgYa44Bx7oS49t0Opu8E+xUy/9ma+sg7UrILv5kSFdznhmNNCq9kHIJbfa2juCgfhX
         oyJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733153047; x=1733757847;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XMx9usLc+8H+1O3Ux5r/Qz56sk5GB2iRle+hBCjO6+0=;
        b=iE3IXexXtU+xAPOUN9DiQL/KE7omgJKpFbvp5/4b5bj6u6pYC4C4Ezosob6soYw/pM
         U2RvgecZCllW/myK83Envc9IJuQF+h1m+lEJmEgcRvb5qtBX1LI/b1l+/vISTu/vxGU7
         DhjyS66tgNZddv2rr5ZLREOo/CnDyQPlvDGuXJ0Babd6VeM460qc1I45JaHeDeR1KkLp
         O93r+2Pv4LjcsLBZRQmzjPV/ISWcx9SCr5hUgJIFj7bXvyhdjR2ZZCnvo05NxzbO13IC
         6vIesU6n3a09nKR4k1siKpD4Q4VuiujlLldnK+WZ+OsE9PfkZvQEmq6fB+5QwfYj3kW8
         hdsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHs9cPEKoq3pjIkZhxb1YwnI7TbMTFZMVm6b3o+vCCaooV3PBCx455kdkeMYLlLVjEDi0pBwxQWll3@vger.kernel.org
X-Gm-Message-State: AOJu0YxiFD9Q5HzSwUSnOkrVNSnP9qsyN0G31vM6oTzqCuO9xmkK9m8Q
	ivg+hPCWEG2oauC9WZUyFV7uQpsKYkUHYTT9lb6jdaUfQfGxYG6Y8OhyxZNlc3Cm/aX6j7FLiIJ
	QAUZhrbRzTgksaYau39Nw8N9aRXPZmN5t2brxOA==
X-Gm-Gg: ASbGnctNhbTIUs9eg37OamD/aD2LfYV5skJE/5ixwjJPa9+YJVOJ2zQBxzmQamVQ3XM
	k2bN/7sIQR3N/oEjJot1Z4USSWtgcAt9o
X-Google-Smtp-Source: AGHT+IEGJdd9IwF7sSUzoqqAWgtWCRY1a0UMhBwb88ErQOHU8BaxnCWHnPMW9+ru+41yFpFYGuJqHhtoLonEK76JtT0=
X-Received: by 2002:a05:6902:1895:b0:e30:c614:5c3a with SMTP id
 3f1490d57ef6-e395b869b78mr21357729276.3.1733153046692; Mon, 02 Dec 2024
 07:24:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1732030972.git.Ryan.Wanner@microchip.com> <e9e9e4cf0753422706bdc44fe7d20ca3a686ce7a.1732030972.git.Ryan.Wanner@microchip.com>
In-Reply-To: <e9e9e4cf0753422706bdc44fe7d20ca3a686ce7a.1732030972.git.Ryan.Wanner@microchip.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 2 Dec 2024 16:23:30 +0100
Message-ID: <CAPDyKFpN-2kowdi_eCtbW1WEdc5OKh7tj60GfbPPBR0Hbpyj5Q@mail.gmail.com>
Subject: Re: [PATCH 04/15] dt-bindings: mmc: atmel,sama5d2-sdhci: add microchip,sama7d65-sdhci
To: Ryan.Wanner@microchip.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, mturquette@baylibre.com, sboyd@kernel.org, 
	arnd@arndb.de, dharma.b@microchip.com, mihai.sain@microchip.com, 
	romain.sioen@microchip.com, varshini.rajendran@microchip.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Nov 2024 at 17:42, <Ryan.Wanner@microchip.com> wrote:
>
> From: Dharma Balasubiramani <dharma.b@microchip.com>
>
> Add mmc binding documentation for SAMA7D65.
>
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/atmel,sama5d2-sdhci.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/atmel,sama5d2-sdhci.yaml b/Documentation/devicetree/bindings/mmc/atmel,sama5d2-sdhci.yaml
> index 8c8ade88e8fe..ba75623b7778 100644
> --- a/Documentation/devicetree/bindings/mmc/atmel,sama5d2-sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/atmel,sama5d2-sdhci.yaml
> @@ -22,6 +22,7 @@ properties:
>        - items:
>            - enum:
>                - microchip,sam9x7-sdhci
> +              - microchip,sama7d65-sdhci
>                - microchip,sama7g5-sdhci
>            - const: microchip,sam9x60-sdhci
>
> --
> 2.43.0
>
>

