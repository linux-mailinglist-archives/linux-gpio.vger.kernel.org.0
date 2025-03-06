Return-Path: <linux-gpio+bounces-17144-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A10F8A5492E
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 12:24:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D97AE169362
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 11:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17506204F7E;
	Thu,  6 Mar 2025 11:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i10MCi+E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B071FC7CC
	for <linux-gpio@vger.kernel.org>; Thu,  6 Mar 2025 11:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741260253; cv=none; b=aqqVuGPkcTNOroOoRVXXhuOQ/jQG8iQAJqjChKgJdnpaO94Hw6I5mjag56tDT5+bJTf+0SeqlrqijZo9BR/Y4XPxHDTKpEGbImHW394lGaLKrXRzAmNbTkONB8PHO1Hjv1CzGfUwyRyPeY7TglPaJy72g1t8xfx9dOPLJ3DtmRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741260253; c=relaxed/simple;
	bh=TlrvRCPySdQOxtujofeQxJmxEKL7GhiXvuM9GTzF67E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pMKpEjR5IrA//dWeGwrHTELItZAjt5aQh+qPV56qS73y5rTIOXg2TczBvYQbO8VlpJkM9gQeICjbvcHatYSvuuNq+Fn5W6v0CGTKi9h6V9tUeGh8fNFrWsT9qG4QJihg6Ucpwz+9ybo7L1EsGC1SZZGRspSs+ipzubR4+wysLhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i10MCi+E; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e4bed34bccso783876a12.3
        for <linux-gpio@vger.kernel.org>; Thu, 06 Mar 2025 03:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741260249; x=1741865049; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TlrvRCPySdQOxtujofeQxJmxEKL7GhiXvuM9GTzF67E=;
        b=i10MCi+EgS5KTWmcXCV/WkJC60/Md7pToZmf19bqbFfI7m4VBt1MjVrshSXrxRd0dz
         zCEigUnse5E+iP2SmisaqsjVV2iQ3x+Dj5vJ5McCTKFvHY/2gVJWYEMZk0BgCJlCbVBZ
         6u1jztiqZRnyU+EIBiOq3XlgONZ18PvwoGRMY6+UZCUKg5BYuloS8agVYSRtm24v4EAg
         58O/GPXRShMKF0uByALJpNRmoeEkmCdrqrEQeZI9VOjxsGtr1yM++GWGyWV3dglyIrMd
         wnAJWWtvETybHHUKN4896f2rEAaR4yDX8cPdLjZWNIiWH7usGpZPjgTYtzXqHf21E3s3
         iChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741260249; x=1741865049;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TlrvRCPySdQOxtujofeQxJmxEKL7GhiXvuM9GTzF67E=;
        b=d9IYVVZMFOyEvQhDg6UmAVjTmvHOD4p8p4QRLxZqaX9KH8b1IGuMqpFN8HmaVxRLgG
         oixLQvNaxP2HrYGX4YBILCGpnL7+O+IA/NXfSDcV8yaYOGVd6Q50sd5KBmlz5rGO4fQy
         8+V/WWjLhCm6TVJ6hBPDg7clnGkIPS7lpcSDQZUj4myQAoIQs80uJiv7Q2TG0a9dwkvU
         w3b9bl6WoTk4CidQ6otvUowgqfDVWyaVabZFTLWN+h6KLEOjMLvuXe+ttpzpTVitQBGm
         AOCmROvcXN+tHYaQHE6VZyDGNygxbJOIjVYrdzSAjOtAQy6YySjzOEqC22vUcHRUVgUE
         QjdA==
X-Forwarded-Encrypted: i=1; AJvYcCVweictzyTxLEsh8LaaX5Hv9/U0398RUIRPBOldYgLGfRIKsW6prH5t6k7tI4Gxaeqa35ZWb/MXURj+@vger.kernel.org
X-Gm-Message-State: AOJu0YzcVBntSAESNi2ldZm1+WuVlwR0jOAeLL7o3Pg2ter44miA3J/b
	CT01eD1Wc9fpfLCMOPdorCdWie2hmUWSyD1+6b3gHJ8SkRJMC+3OdB3Vdq5TCMk=
X-Gm-Gg: ASbGncsz9sg1YAEO1bGbDlzJrQFhXf68Yhktv79QoONANyX5RZMAQ8DPL/hFXitDuBJ
	awCPVbW+2CvZpmEmQyXrcKTJhNQxvh/Vt6wNsFCkW8sHrEEQeLsy1YwV/gyK80k+z5YvYT2lslw
	X6txIo1Mlt5kCEAGXbvNgWHGB/wyYPECeBPvGZq85y17TjV4E63tAcCGnPFrsVMvLPmUaG45OOZ
	vj6lcK6ynoCIQXe0VjCncnmKu2QppeqszubieOPcHKy59GSIhpm2cTYQYcO2a6z8C4rCRbLvG9v
	Q9Jq5+UFQOa0rHkTEXGOtDRxC9aqP8/krRxTvV2rTQZXAYz6
X-Google-Smtp-Source: AGHT+IFJXG+ZAc6aSsP/TLrdtpd9ymEZvmqs4+Y8AAQtnIEGb2pYE1iRRI6PfSoONQjn41daLbimcw==
X-Received: by 2002:a05:6402:3547:b0:5e4:cfb0:f66b with SMTP id 4fb4d7f45d1cf-5e59f35248amr6527924a12.7.1741260249102;
        Thu, 06 Mar 2025 03:24:09 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c766a194sm787181a12.59.2025.03.06.03.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:24:08 -0800 (PST)
Message-ID: <4a200a7bf5f39034ce206a6c9240a307eadd45af.camel@linaro.org>
Subject: Re: [PATCH v2 1/4] pinctrl: samsung: add support for
 eint_fltcon_offset
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski	
 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
	 <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tudor.ambarus@linaro.org, willmcvicker@google.com,
 semen.protsenko@linaro.org, 	kernel-team@android.com,
 jaewon02.kim@samsung.com, stable@vger.kernel.org
Date: Thu, 06 Mar 2025 11:24:07 +0000
In-Reply-To: <20250301-pinctrl-fltcon-suspend-v2-1-a7eef9bb443b@linaro.org>
References: <20250301-pinctrl-fltcon-suspend-v2-0-a7eef9bb443b@linaro.org>
	 <20250301-pinctrl-fltcon-suspend-v2-1-a7eef9bb443b@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2025-03-01 at 11:43 +0000, Peter Griffin wrote:
> On gs101 SoC the fltcon0 (filter configuration 0) offset
> isn't at a fixed offset like previous SoCs as the fltcon1
> register only exists when there are more than 4 pins in the
> bank.
>=20
> Add a eint_fltcon_offset and new GS101_PIN_BANK_EINT*
> macros that take an additional fltcon_offs variable.
>=20
> This can then be used in suspend/resume callbacks to
> save and restore the fltcon0 and fltcon1 registers.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> Fixes: 4a8be01a1a7a ("pinctrl: samsung: Add gs101 SoC pinctrl configurati=
on")
> Cc: stable@vger.kernel.org

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>


