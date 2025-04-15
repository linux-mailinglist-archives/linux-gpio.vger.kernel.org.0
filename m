Return-Path: <linux-gpio+bounces-18809-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B47A89552
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 09:40:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3CF43A687D
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 07:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29F5E27A107;
	Tue, 15 Apr 2025 07:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cB4JSxG6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B04221708
	for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 07:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744702833; cv=none; b=cW4JR7pG8tqdZeSK3DUhcAwVusdF1rF0bwc7JJ2iF24xXTAE587r9gggtq8FTtmJ2Lfw4SevKwoFTiFXZhn124hakP1Awm72rXqwYYhtGUxYOCntTP6TLSeyoeDSDoJsGQJsKrewa7mQSO4F+QJ1ZdhjIOs31U4ox6Kf1NGzEx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744702833; c=relaxed/simple;
	bh=bPPsVA86aRMmKsehM2IabqFVi4bzGyyaypZ1MvkVduM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PGidHGdcjXJaI+ZGrU80dITTlEs87VAQMOVSA/CexQtEnBCQ6EOxVwE+7GGwzSB4IVTeL0/t5jtUWMwArBqNlHU8aoA4bSA9sLOA8y8+2YikJ2wEIMeAHjdyCTLY0CV87g/fxN75hClVK2eEBEqDPu5v0UikI30/L4tqXzbZ4ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cB4JSxG6; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30bfed67e08so51188871fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 00:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744702830; x=1745307630; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPPsVA86aRMmKsehM2IabqFVi4bzGyyaypZ1MvkVduM=;
        b=cB4JSxG6BRqYZ9ZsnGMSOWDfp9AmdWXX24vNa53PUvyUZYNBjWdpxdbkdCLHeQwiw3
         pO83lLqarymylP/z0NgPUlDiiCuLSW3w4NzlQfEZ2aGKF3EWsYTOM7493Zbiv9edKNDV
         OGJz3L/5cMCRU2cJrSZtoL1U6rNqg6M/1zMhV5RLI5uAUN/h6rd0c2f7aXGxFbJWLLnV
         7X634LQvqQfSvXkXJUYyN4ODk458lKJfsD/i4gIET2HzXI0hHI053zX0xfMlzrGAzKGo
         iD3hxRAdrx+iBYRs6OZbF0zrC3K4VmpVFBRAqQidjT9PIivuif4EY1vsZmYfkm9hawlX
         U+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744702830; x=1745307630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bPPsVA86aRMmKsehM2IabqFVi4bzGyyaypZ1MvkVduM=;
        b=NQ7OZtnXpIocH+s/BtiYT/mu8YZFM1QX9x3qgiMRCcs0zv72k0khWh0OaOj+rEW/K3
         mnjRtoNtLr+C1+A60CQ5eIFJLCfIv1L2a7EFcaD3+pCnXWYjuZCKv3m7Ta4qrnmPQKge
         jDItyvJuTR7gUYzmVynsmgLsgYHBRxkmF90Jt2mQ7YSHzP2yaJQkpdr0uuS7VymJPR6x
         sTbxMQZ7xItdbzW60O9oBmNUcppsLD5wa/cgloFJQDCIWWg/8w1wq7ipqMBuqnpcFACc
         X05wr2xPwPaxC+JWVe3z0/DN1JnPQ+CdkAMnEmZrQLF6yeIVvl7NsbypZxLaAZbNlrp0
         5vVg==
X-Forwarded-Encrypted: i=1; AJvYcCUrMI5UlNSiLBatdOitZjXnPb37CV1vhtPuOt86z0EMYoZTMft3o+iu0wbCfWTVgBTfhGqEfUbdYh8F@vger.kernel.org
X-Gm-Message-State: AOJu0YwcueSwiIhZhOLkesUf6swGc+GMHUF9iRE14WkererBOnSHxSGX
	aH92WwWroRffPcn16OnM/Q0HTxxtfRRus0x6OSBbdQL+mOCiuK6ehTfYJHQoawiu6ltKCSDzzS3
	NTnGBKLmAm15UzybPTQMW7IZEQUV2A3mMRVLhQA==
X-Gm-Gg: ASbGncvC0lJ9lyb+2qpQXrrokf/vWGofLtgBur49li79mp6Fxgy09pTtngPA9G6jXJD
	XBaf45G1QcawcfClcLmFV7uQfrjHj3Ter5sj4RD2kSdxHbz/tbu7I659cIbVCQ+fj0KF4m1KYyH
	1vnUE4EYnRHFDQFqSroztbpTI/KDqk6/yQ
X-Google-Smtp-Source: AGHT+IFWYF5PBFz8bdBMKs/hFSmP9qdyePV80JdSmzpOU6YbNPT0plMuK8UpwqvumIMhMZzLrddrNlq7JqXr9GLcwmY=
X-Received: by 2002:a2e:9214:0:b0:30c:3099:13d0 with SMTP id
 38308e7fff4ca-31049a01919mr40215891fa.21.1744702830214; Tue, 15 Apr 2025
 00:40:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403-a5-pinctrl-v3-0-a8c067e22295@amlogic.com> <20250403-a5-pinctrl-v3-1-a8c067e22295@amlogic.com>
In-Reply-To: <20250403-a5-pinctrl-v3-1-a8c067e22295@amlogic.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 09:40:18 +0200
X-Gm-Features: ATxdqUGH5zAtbvjbTyVv3OZBDQWbnPFIqXVT2OLZ9OTJTUgQ_9-qW1g1gPLhhII
Message-ID: <CACRpkdZATVbE8nrk7_B2jE7MOqqeruV25mRdZaXdGNJ_kh1S1w@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for A5
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Xianwei,

On Thu, Apr 3, 2025 at 10:33=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:

> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> Amlogic A5 SoCs uses the same pintrl controller as A4 SoCs. There is
> no need for an extra compatible line in the driver, but add A5
> compatible line for documentation.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

Patch applied!

Please funnel 2/2 through the SoC tree.

Yours,
Linus Walleij

