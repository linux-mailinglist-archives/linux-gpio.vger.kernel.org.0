Return-Path: <linux-gpio+bounces-22077-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA22AE6C38
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 18:15:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BF963B7067
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 16:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86CBB26CE3E;
	Tue, 24 Jun 2025 16:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TaPjP4BC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C1C2E174A;
	Tue, 24 Jun 2025 16:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750781670; cv=none; b=MfcEMdgRrQWH5S+DeJ6QcgTqvje8SbVonMb2CZbuj3hHefLcW04IqgykpLb94cGW/jm1344yc3Rm3yQFbMiWwxF66FpM9tMTZf21nMs7yUH2Rd2qzMdVT9hsMOAlgx5qaIecsvFEMCTJoKTzs5LHEeQNbu84TktT1BYXzVteBUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750781670; c=relaxed/simple;
	bh=hMxQT9ivNs17wMcJ69YhVe7QBLHdoqcHGTcyWV1LUM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q7HMFFr5p8XnrfXq8a1M/WQKV8m4ApC/cSoTY8zXy3HowhMSe1XQvMIL5mNs4rxvU15ccBhrJLEvdvbl7KJx8m6MVxlVgLxWGHfpyYYjofpC8XCOJkyKfp26wD3KcNljggU3noQWtA/oPapDj4ggKunDgcA0aI3/fEH3CrqStgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TaPjP4BC; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ade33027bcfso100490166b.1;
        Tue, 24 Jun 2025 09:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750781667; x=1751386467; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B2hJc4hUnpKA+D5XoufJNAk6lZn4GYmwTvIaYpB/Ywo=;
        b=TaPjP4BC82XAPR+0TwG19QdU/kVkctVvSB4ZS9E2PEQ1Op+bYjNJ4ZbfAb3cBy/5ar
         6+ruBX9GbDEaLIk0kx6Xc4e/3sCXIq7qKUqTlY2HMroX2+qa5Adz2jQR/u9YCPoGTfSe
         NAyLcQ5Cm7edeBWrTgcfoVQBN6kighkOlr56h7eL+PQ7xyg2uFS7EXKpvVxaAMCVNOcy
         wOaIcIyGoJ4GNoyiI+BYWNMp/BX8h9Vg4r/Ra6YsoSLhFTmj3jhJGoSQkxq7NXndp6ZY
         chYX86IziE80K1LtcXgMzlEb/aAIZFNZzPR54mfTxVOpJtp+tfv/E9Pgc/Fr+EbiRaTh
         im7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750781667; x=1751386467;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B2hJc4hUnpKA+D5XoufJNAk6lZn4GYmwTvIaYpB/Ywo=;
        b=cmRVVvasxqf95BVev8FBUijAJRSx2HPo1LDuGy5aZIBvN0SbbXDgt4F400BIP619W3
         H6t8tZrY8pCRQLsBZbQBC63bd34rX0O247XVlcsg11VCOYivIupOIRtM6rpes1Ap6pzt
         Uu128EjB1M3QjQWmCWaUpjmsN2babd34IJ5OjR+mlbvJLawDvjKGUsAVi62Bt/ZKZKoR
         Q7/ygUsoqZE73eF466uIllEofEJ28BLxuIhDF7bbRchVxnZy74RWrLVvWpkG6DttiYde
         A/U6lGkgEW6wz2IPePw5+nACqSR2tfFGssBo8EhgxmYmJj2UxqaGp0fVgbtvtbl0dQBY
         TKpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWa4c2J27nnc8crLHHbdPdNfGfKWl3bj7xeVmHMUhaUXGPXqpdDRoKogWPXE+o1LCkU+USzvrzpvGJ5pg==@vger.kernel.org, AJvYcCX6Zn9A1XDTtAPnQ0jnl+rFgeWfnKii9K1kdBe/sKu5t/+njYbYclQIgEMIX7tXU6hEfeeBe5raRvUhRHsY@vger.kernel.org, AJvYcCXqoiugTsIby+S5I8P5i2m6tSR+LkiRKsqc3BnTKlv5L69vFJFZV5DMR5usW90aa0cUAcb+aYADJTZ9@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz/99v4U5fr78iypsNXQNyMHp48uyyeP1O6z4igVOMkdNlQwK1
	wfwauTTzQD1Bw3YD/IDkw4s6VukqzjuncTuYugPlLTZO9kcDLJagi8WH
X-Gm-Gg: ASbGncuYrw/J2Bn3EPvP7XsNfDBboqbkWOFEhmGjR/r8GNUJf+Oix+o3d8qhur8RTCH
	KLcnCBH9PrSv4l/n20fJ5LCzF1OP4CQM8aUH+4FULcnCbDyUQy4kK2fy6lyicb/7zrjeXM+omRI
	27dNz0joyGr9xLPdPeOIF/bmelDUwytRm+jiUfyeQcbUUfrbsUuwk/D56fY4I7t3Vp4rn5uUFQe
	8GUR7HpOl01qroQAz2Vu4jtsjCCSJii9ZzPl87LMJNS/ax63MLcqPzyRNE+fNcg9ypni5bLoAWD
	dF0CCIhs/6MEHQj9A3FyoXX84N3QniQH44LgicPoNrjr49KmWJzuih7aEm1/QMjjvkrjNyL0wIC
	7QAJUlEdTcA7WjP176aZRznc5ek/Y1cCL6P0=
X-Google-Smtp-Source: AGHT+IETVYqdcYw9iMsIySmRYZrHTjx3OIsh3aRt5hqLHb7AOMHCIRNujIA0merX9VFaG5IGMjGEsw==
X-Received: by 2002:a17:907:d70b:b0:ae0:b06d:1fb1 with SMTP id a640c23a62f3a-ae0b06d2370mr278552966b.37.1750781666584;
        Tue, 24 Jun 2025 09:14:26 -0700 (PDT)
Received: from ?IPV6:2a02:8109:8617:d700:9227:164e:14d5:9967? ([2a02:8109:8617:d700:9227:164e:14d5:9967])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053e7c6fdsm888167166b.3.2025.06.24.09.14.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 09:14:26 -0700 (PDT)
Message-ID: <49977010-65a5-4ad7-b86d-5e779d0de3de@gmail.com>
Date: Tue, 24 Jun 2025 18:14:22 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/19] dt-bindings: media: i2c: max96717: add support
 for MAX96793
To: Cosmin Tanislav <demonsingur@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Julien Massot <julien.massot@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS"
 <linux-media@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
 open "list:GPIO"
 "SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)"
 <linux-gpio@vger.kernel.org>, Cosmin Tanislav <cosmin.tanislav@analog.com>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
 <20250618095858.2145209-7-demonsingur@gmail.com>
Content-Language: en-US
From: Martin Hecht <mhecht73@gmail.com>
In-Reply-To: <20250618095858.2145209-7-demonsingur@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Cosmin,

I'm preparing a test with Alvium + max96717 + max96716. I can't see away 
to overwrite cfg settings to force pixel mode or tunnel mode. Any plans 
to add this? Sometimes it is required to force the other mode than set 
by pin-strapping.

BR Martin

On 6/18/25 11:58, Cosmin Tanislav wrote:
> MAX96793 is a newer variant of the MAX96717 which also supports GMSL3
> links.
> 
> Document this compatibility.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>   .../devicetree/bindings/media/i2c/maxim,max96717.yaml          | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> index ab46a5f0bd7e..23f611177a87 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> @@ -30,6 +30,8 @@ description:
>   
>     MAX9295A only supports pixel mode.
>   
> +  MAX96793 also supports GMSL3 mode.
> +
>   properties:
>     compatible:
>       oneOf:
> @@ -39,6 +41,7 @@ properties:
>         - items:
>             - enum:
>                 - maxim,max96717
> +              - maxim,max96793
>             - const: maxim,max96717f
>   
>     '#gpio-cells':


