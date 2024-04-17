Return-Path: <linux-gpio+bounces-5594-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C61878A7EF1
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Apr 2024 10:59:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 034161C20AEC
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Apr 2024 08:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01A3C130499;
	Wed, 17 Apr 2024 08:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LnQpwiFd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C78F12F59F
	for <linux-gpio@vger.kernel.org>; Wed, 17 Apr 2024 08:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713344270; cv=none; b=kzRwLWPuYCfTIIbsZ7kp2jp5dY1f20yEge7tVEsIlbkTwRtwv5ZN6PIMWnNkkEhzQF9qIdZcjl5TOoVK7nH0y0JY6iu+/XGlUxxb9bR2lR7kpAhKKfI+aYuXBavMJJoAOt2vXVlTsf5SEGpqCIAnBNOmiDmC2oIvAZ7QyoMguGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713344270; c=relaxed/simple;
	bh=z8BVxDLtdMwR2IpXfpKosLBAdBPE7RA9iz1sCdxzb6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UNBENRYYcRIpWNRn+phbdbAUEm0Ns97e7Eb5x5X3pbpnYSIMUoZN9X528BwNbnftLwNAJnEruwRKSTunCQ77TIpwBcMZ3uYPKLWH8ifrsrJf7gR9KNF5rkQT6Sl/aQRKXNbCbua1F9Tf0NUiTvJ6VJm3w+AYoe7Iph+otvA8utU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LnQpwiFd; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-614ec7ee902so49589237b3.2
        for <linux-gpio@vger.kernel.org>; Wed, 17 Apr 2024 01:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713344268; x=1713949068; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z8BVxDLtdMwR2IpXfpKosLBAdBPE7RA9iz1sCdxzb6s=;
        b=LnQpwiFd9jXzL8lrb6r6QY8JE/8lT7j1K32FNAmTXXmDNxZzEtoCHRqG7laH1r4KSg
         5oagpOuc8hXTgRY0J5RkVTrPor9XnbN2L6fdIWBx4Ppp8ff440hViWrsVJWMEzJocyye
         674tuTNTT4xQJmtIb5xeefqLsw3bp5fe8QvrrrM0353ofQW32S25uciHi8hoUDkSK7ob
         ZHtca9RTaFqVsEMvyOy4NDPDsw9by5SZ0SNnx3gWuV584gmA7azxtKegl2EDYCrvoxG2
         wkNu5xtlpJ20Yd/rXCqw7BOobA7ntv+qoD6hjUKsINzgHVO92dcFg2lC6+XcYIHAu7q3
         MThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713344268; x=1713949068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z8BVxDLtdMwR2IpXfpKosLBAdBPE7RA9iz1sCdxzb6s=;
        b=LWi3HZT8Iu4f4SXJ3jcMyqxQfJNvryDUPLWbWWad4jCMna5E0tpM/0e311/udRLFI6
         WLQnITl+XjneiiktS7kQwlD05fGPz531IMWaXTIstzF0A0JqcgFvqKIMM56jIjOFFhXg
         O3y8Osnd5tjTiccVyq08vdqmuzKzi5DADQ7wO1DvfKtNne/Jl+Q3TiPlOQpfjDaQB+9K
         ryiBwukZ7lwmOuZ0fTUMs8oNg9RU8g3tZzcpyXrbAjiPJDFDQ6t+W0lSpb+Nfcm/ZYUd
         ukZWVvPiCd06pXb1R3Rhv6xEvo63p3mkSO6Hy0NI4q/7OVZKDq0564BF8ygfqfLInSho
         ocCA==
X-Forwarded-Encrypted: i=1; AJvYcCVyG+reerGxmHdPH8YbfBvaXhcrxQHLJYqZNIE1Hxso3GR+L8PEgYeN4PyIKqrAKiUN6oJifiYMHa54LdS9kt74H0Fi0jDdFh4fxg==
X-Gm-Message-State: AOJu0Yyv/22rxeWnbSYIDjD/8c7TSxAYAqlt8CBD5tZIfuaVwlPp0jZa
	QxT5Q5NoMeZP0T9seZgFp7YFrckeWAfep3VmCKWpdfKQszH/aUuM2LDrAo7oIFDEPVIT7tAJTnm
	WcQZ9zp9D3j7j1dd8t8SjqTLxmr+Z+oNVCSnStg==
X-Google-Smtp-Source: AGHT+IGjTlCzXLkgG1NfRsCozVnMoY5qNCo+yZDqI6j3kAC13Ftit11Ni9rVZhCX6UF06i6VaxBJ0wB7PajrNqO6yvk=
X-Received: by 2002:a81:ab4e:0:b0:61b:472:fa92 with SMTP id
 d14-20020a81ab4e000000b0061b0472fa92mr1815808ywk.32.1713344268328; Wed, 17
 Apr 2024 01:57:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240416161237.2500037-1-knaerzche@gmail.com> <20240416161237.2500037-4-knaerzche@gmail.com>
In-Reply-To: <20240416161237.2500037-4-knaerzche@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 17 Apr 2024 10:57:37 +0200
Message-ID: <CACRpkdYMZ7bBxKCSPJ74QYhtEPHV8cPARioGrg5ySj9j7nPE1g@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] pinctrl: rk805: Add rk816 pinctrl support
To: Alex Bee <knaerzche@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Chris Zhong <zyw@rock-chips.com>, 
	Zhang Qing <zhangqing@rock-chips.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2024 at 6:12=E2=80=AFPM Alex Bee <knaerzche@gmail.com> wrot=
e:

> This adds support for RK816 to the exising rk805 pinctrl driver
>
> It has a single pin which can be configured as input from a thermistor (f=
or
> instance in an attached battery) or as a gpio.
>
> Signed-off-by: Alex Bee <knaerzche@gmail.com>

Looks good to me, is this patch something I can just merge
once the maintainers have reviewed it?

Yours,
Linus Walleij

