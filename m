Return-Path: <linux-gpio+bounces-10697-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D131D98D52E
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 15:27:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F74D286680
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 13:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C577B1D0480;
	Wed,  2 Oct 2024 13:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VXl2mcQ4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734181D0430
	for <linux-gpio@vger.kernel.org>; Wed,  2 Oct 2024 13:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727875656; cv=none; b=Eif8/H5D7hOO+SsDJC2deRB/l/QEr1bLVFAjQiVLb6yYktteNDBYkp3cZd//3l7URY04+oNx0vpqLkWz0kUlwwQjsxwcsgI6OTjY8a7Yuoj0z+6Jrm37YirQzQQLqRGIPqAtqJ2HmsXfAk1lMDR83hPOl5v8tbgK9f4+swcuoGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727875656; c=relaxed/simple;
	bh=WoaKlEMcbSsOUyOIA8eSRKVBqOjCka78j9BYwitbv+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kQ1gjSrSn7OOmvn8kzgd/Ca5oZVx8FrbOsmcS6+y4jjw4+2rsJLP7qR6+U/zNtvSHdma61zyXoCSBxDB2RFTzBsJKvT8mEMJKbirShELFJF7TRmeGW9klbWFhMIkWmHJGZF06+tdlOLFLZxlBHBin4HaU7Xj6jZKpYnO7TJ/bgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VXl2mcQ4; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e260b266805so4341720276.0
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2024 06:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727875653; x=1728480453; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HzBc2EV9uqxoflmRRfK8jFyB3aOAk7qQbpOPz7vBxc=;
        b=VXl2mcQ4JSg0wJ6R1TaxFWgkde72UF9KMv8tX2Vp9z51EvzF1GpO018dRSoy4bRauz
         7uSfnhp81eJL3WWPDd5yCk70pbuoiAiEfSowYJ4PjpHLK77kGJss0DU05wgGexr5QLXf
         mMFSyXvBhOZpz6tjz1Sz4lUgwcSv/+h2fAEf3bE0OFYYQEWbGBx83ddazO5kOHC4Zvge
         ZgbywDs+OaB+FS+9sJu3NYfgXna+Kf+2x4ahQ6LCe6mDolTvIeN1YFX1tQzMySN00z6L
         okcPY+QNwEKku5zxG/uOG9fdJMeaMyDXfn0yFuDkqP648OcJau/CurFrRYd0Sx05Jwtz
         pnkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727875653; x=1728480453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2HzBc2EV9uqxoflmRRfK8jFyB3aOAk7qQbpOPz7vBxc=;
        b=mpgSNWz7DAp/BpazlYx2WC7lTds3YjZ+Lv5Of0aBTvWFvXYqIlk6cZ41oahPSkzkoF
         G+IlnQPCveFyBJwn3xf0n7+Q9diURpfGd4Mg5LH3WDKLPKXQwO6oHHulIhQ7qXOPXmJL
         96U8LIUSYKdHU9Fo2m/94ha4KIvFaXE5+gbmn0MEd/ofQpNBqkGtZBTkvik6LBtWp44S
         Kj0b0G51iD43YvaVe90sagMOSpypGn63xmXWB2uOD+8VTc0SwJruUZpPt8sMP5hzf0ft
         9C35dvLsI8Wz94KQrN4edBm0hLBkFCFMUUl8JeWjt0Ul6GGe7VZkKVgto6a/1E/5e8bG
         Qobg==
X-Forwarded-Encrypted: i=1; AJvYcCWZn7+nZkHvPMZe5AkJhb8mfBAt82/bkGkQurDOukDX5xboWwjD3E0qbxBTVWbn3Zf4BM4TW1+eNixa@vger.kernel.org
X-Gm-Message-State: AOJu0YzooCLdcsaKHwq/XfS3k8YlQndkU8K4ARYlX/CeiE9xq9x42qCz
	mAg52KIBOj6+lOkMUD2TXobOryAl89soK8wYW09gRkU/5zCS5E++nEViuvMh/ksAVJbSdBrh+hf
	vbP3gEZ0zSi+uVMYhZEPqA7taDATFXtUd56grnw==
X-Google-Smtp-Source: AGHT+IHZUCB4vEl2AW6EAUkIG+axani700+S0OSjD1AjUsJbKs++2/eQZRuBsA/6kNKQfxt26/FJDiTjtYis5ARK10o=
X-Received: by 2002:a05:6902:248a:b0:e20:2232:aab6 with SMTP id
 3f1490d57ef6-e263838535amr2218907276.7.1727875653468; Wed, 02 Oct 2024
 06:27:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001-en7581-pinctrl-v5-0-dc1ce542b6c6@kernel.org> <20241001-en7581-pinctrl-v5-4-dc1ce542b6c6@kernel.org>
In-Reply-To: <20241001-en7581-pinctrl-v5-4-dc1ce542b6c6@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 2 Oct 2024 15:27:16 +0200
Message-ID: <CACRpkdZMWKb1h0-sWECCY0E3CxxMyLwCr4M3k6vrY9aAfpzMVg@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] pinctrl: airoha: Add support for EN7581 SoC
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lee Jones <lee@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	upstream@airoha.com, benjamin.larsson@genexis.eu, ansuelsmth@gmail.com, 
	linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 1, 2024 at 7:30=E2=80=AFPM Lorenzo Bianconi <lorenzo@kernel.org=
> wrote:

> Introduce pinctrl driver for EN7581 SoC. Current EN7581 pinctrl driver
> supports the following functionalities:
> - pin multiplexing
> - pin pull-up, pull-down, open-drain, current strength,
>   {input,output}_enable, output_{low,high}
> - gpio controller
> - irq controller
>
> Tested-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
> Co-developed-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
> Signed-off-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

I missed that there was a v5 out and responded more to v4.

Anyway, I think the last comments on v4 still need to be
adressed:
https://lore.kernel.org/linux-gpio/CACRpkdbXWMU+wq6DvviCQPQ0EzKUm9oOnyFh34B=
m=3DY8K-HmT0Q@mail.gmail.com/

Yours,
Linus Walleij

