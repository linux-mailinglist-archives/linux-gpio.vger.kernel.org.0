Return-Path: <linux-gpio+bounces-876-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8989380143D
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 21:22:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 365111F20F02
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 20:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 366EB56B8C;
	Fri,  1 Dec 2023 20:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xbg9v8PE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0605810C2
	for <linux-gpio@vger.kernel.org>; Fri,  1 Dec 2023 12:22:27 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6cdd28aa7f8so2446969b3a.3
        for <linux-gpio@vger.kernel.org>; Fri, 01 Dec 2023 12:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701462146; x=1702066946; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrfP90jcqZlYW6I6TEZeGkqknODGecVZSkwhDN6qItA=;
        b=Xbg9v8PEL9xQ0bApbmuxIuR1zvdSC2spjvXgrmeCZrH0NzZqJhnaSHVPqESzNVuBPN
         CVlS2zyTUCYXNXoZuXCs4f8SiHhcow2lKTMMj0VUMjkQoayoZo1ZZuNQv+dD0dw9cmW+
         Pj6OEXdUnUP0Vlpf8gpoOlAzTSjc24xrwxd0+3kyLJMZWGKspWaXJoHAhGl45OO6JqDB
         prNlXZGFYhEgEaCWilmZS9Voc14DMIiodha6QFKXqDeEUZrT/Atjfrn4MKLJMvemuVDh
         liKpfs2Add2088Io0e4Al7Z6ZoYqv2VmYPXIEi+yYLwdoGciwmH8CQ5ylM0jo6lXTTc/
         +5cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701462146; x=1702066946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rrfP90jcqZlYW6I6TEZeGkqknODGecVZSkwhDN6qItA=;
        b=Q9ObCcYl3/eweNbpU2sbqHNvlTqn+BEvSr/+fFjbu5B6fhAtuLRj9M+CvrRnnqceUP
         XbcOrN0pMHJ1F2vbcwbRgQPPSxnB5ocjrg7tK+B3WNet2baZ4DBrTBv09bI0lowVjz6W
         x0FR4F69/U9mfUCJyxfa8sTNY1UH7Eg0Lr3yX2MvPSWwi04c6lRlHbNfzgvTwXcb3E8d
         H2KIQQmTh1a7DG+IQuVvHwWRUfld7Cy3eZyQC6GTw10lyeyherswg+KaqVrjC9tzg3GS
         nAogK3Ehvg332hzJ+4OBAfWtcDQE87NctFxW1nPiUDifR0xF2V9gz8qZF6uqVy2RHPuj
         I9ew==
X-Gm-Message-State: AOJu0YzGCR/K64RXoFmpSKLymwI5aDHp/CO0d2Wj5mKfTSdSnsHzm3Gz
	kmeoe6eZkExhghIhDGeDDitKPXVReQfm4NSERO64WA==
X-Google-Smtp-Source: AGHT+IEa+Nm4EPl06pYreypzkRcRDwxR3bjsnfPBv5pBgMt1rJE6obpO3lBCCsEkVD7QzwvAQ1hWQAuAUhQ9mUqzIOM=
X-Received: by 2002:a05:6a20:1592:b0:18f:97c:4f43 with SMTP id
 h18-20020a056a20159200b0018f097c4f43mr43291pzj.79.1701462146357; Fri, 01 Dec
 2023 12:22:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201160925.3136868-1-peter.griffin@linaro.org> <20231201160925.3136868-6-peter.griffin@linaro.org>
In-Reply-To: <20231201160925.3136868-6-peter.griffin@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 1 Dec 2023 14:22:14 -0600
Message-ID: <CAPLW+4mm8+U=wnXRfRG7QQHh02tiS3uo3Fw9ywYaCumV1qPB=g@mail.gmail.com>
Subject: Re: [PATCH v5 05/20] dt-bindings: arm: google: Add bindings for
 Google ARM platforms
To: Peter Griffin <peter.griffin@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, saravanak@google.com, 
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 1, 2023 at 10:10=E2=80=AFAM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> This introduces bindings and dt-schema for the Google tensor SoCs.
> Currently just gs101 and pixel 6 are supported.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Other than spelling comments below:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  .../devicetree/bindings/arm/google.yaml       | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/google.yaml
>
> diff --git a/Documentation/devicetree/bindings/arm/google.yaml b/Document=
ation/devicetree/bindings/arm/google.yaml
> new file mode 100644
> index 000000000000..be191e70192d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/google.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/google.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google Tensor platforms
> +
> +maintainers:
> +  - Peter Griffin <peter.griffin@linaro.org>
> +
> +description: |
> +  ARM platforms using SoCs designed by Google branded "Tensor" used in P=
ixel
> +  devices.
> +
> +  Currently upstream this is devices using "gs101" SoC which is found in=
 Pixel
> +  6, Pixel 6 Pro and Pixel 6a.
> +
> +  Google have a few different names for the SoC.

Suggest removing period, or replacing it with colon.

> +  - Marketing name ("Tensor")
> +  - Codename ("Whitechapel")
> +  - SoC ID ("gs101")
> +  - Die ID ("S5P9845");

Semicolon seems off here.

> +
> +  Likewise there are a couple of names for the actual device
> +  - Marketing name ("Pixel 6")
> +  - Codename ("Oriole")
> +
> +  Devicetrees should use the lowercased SoC ID and lowercased board code=
name.

period -> comma

> +  e.g. gs101 and gs101-oriole

Missing period character.

> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - description: Google Pixel 6 / Oriole
> +        items:
> +          - enum:
> +              - google,gs101-oriole
> +          - const: google,gs101
> +
> +  # Bootloader requires empty ect node to be present
> +  ect:
> +    type: object
> +    additionalProperties: false
> +
> +required:
> +  - ect
> +
> +additionalProperties: true
> +
> +...
> --
> 2.43.0.rc2.451.g8631bc7472-goog
>

