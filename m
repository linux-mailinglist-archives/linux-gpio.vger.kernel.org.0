Return-Path: <linux-gpio+bounces-1601-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C45816A7F
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Dec 2023 11:05:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A925B213E9
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Dec 2023 10:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 304FC125C8;
	Mon, 18 Dec 2023 10:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0AdP6oK7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E74A12B7A
	for <linux-gpio@vger.kernel.org>; Mon, 18 Dec 2023 10:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4669bebc10aso320061137.0
        for <linux-gpio@vger.kernel.org>; Mon, 18 Dec 2023 02:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1702893912; x=1703498712; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L6wrxzNiJLPICSs0iPNMafimclxZEX+Zib5f22SAc0I=;
        b=0AdP6oK7yehsYJtwC2yYHyK1TVLYscgr2nd1MRYXBjrYRNmZ+nyIQlHCViRsYT6GxX
         S6qgf1HBMw9IgwFrnq8rdjBXW1AVdDh2hsNBe/aThekQhzt92wkMUtjT0BD9jIU01P5A
         jSuVQkXY2CvT/mf1CFFCkgot3P51chXyaidk8pICNjsXkYrAdIaejUkhuSr9XVjH+ftI
         XQQQ6Sgb2rvyfUGSEoR6ZiJW8JtW2yPfE9Dw7COOX6rI8waY+C8V5YrbDuukth7PJV04
         YDgvldfSTk3tNvsS+BbshNap3rn3W9QhqDbdtI08vyFx0rZi+ak4zdA+TupMPQuE0CX+
         ONAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702893912; x=1703498712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L6wrxzNiJLPICSs0iPNMafimclxZEX+Zib5f22SAc0I=;
        b=nTE3XLFIFOpO2FL3ps2jxYuWPRF48Z9bXI92t6o6nqMWeZAdf5iMN+IecWWfWLn8M+
         p+lPBmdD8gNhSnkxO6Vl1lmRpP9BL1tnmPal6Zi8DNmdjyr207XVojAPX16bH7J44RLx
         xdZT9ivzKea6dddGH+EqVvE7M4Ai60TovAcn9rnp0+l0kV0GMLMINxDG9CaTdmqjDq91
         ZGI+hgAe4m5B5LLMAczJC/0KgpZNnNrbQ9LdiD3fOubuNsDNr9d2x8CW1K5zTes2WgdZ
         LmClvI/Puk4wyzhTDdt7XMka+Xcu+Bc6FmMZd5zKPhkuLnfdJW5gpEPG2SKCfg+EDqG6
         sZIA==
X-Gm-Message-State: AOJu0Yx2oOfYxi/q3jKps3Wy9tQvdXNlU+lnnpUfkvBlcMKiYitVNKKx
	OT4UvKMKNvMW17PvAeiwBdlXcqb7+N252+dduIGmZA==
X-Google-Smtp-Source: AGHT+IHxszukyE2ttJO6zuq02rDfSZeRaEjzppPvuzY0whsH7Q37cz7BAVBbB7KrH+ZPYf13rsSeNKkUCMPPIVQXCPo=
X-Received: by 2002:a05:6102:3e8e:b0:466:5bd2:a2f2 with SMTP id
 m14-20020a0561023e8e00b004665bd2a2f2mr6539984vsv.1.1702893912242; Mon, 18 Dec
 2023 02:05:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231215143906.3651122-1-emil.renner.berthing@canonical.com> <20231215143906.3651122-5-emil.renner.berthing@canonical.com>
In-Reply-To: <20231215143906.3651122-5-emil.renner.berthing@canonical.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 18 Dec 2023 11:05:01 +0100
Message-ID: <CAMRc=MfovbsbxDGvheHkhE-oiXyMfpCpcqwKcZRwHbCjKvwJYg@mail.gmail.com>
Subject: Re: [PATCH v1 4/8] dt-bindings: gpio: dwapb: allow gpio-ranges
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Hoan Tran <hoan@os.amperecomputing.com>, Serge Semin <fancer.lancer@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2023 at 3:39=E2=80=AFPM Emil Renner Berthing
<emil.renner.berthing@canonical.com> wrote:
>
> Allow the generic gpio-ranges property so GPIOs can be mapped to their
> corresponding pin. This way control of GPIO on pins that are already used
> by other peripherals can be denied and basic pinconf can be done on pin
> controllers that support it.
>
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> ---
>  Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml=
 b/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
> index eefe7b345286..ab2afc0e4153 100644
> --- a/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
> @@ -65,6 +65,8 @@ patternProperties:
>          minItems: 1
>          maxItems: 32
>
> +      gpio-ranges: true
> +
>        ngpios:
>          default: 32
>          minimum: 1
> --
> 2.40.1
>

Applied, thanks!

Bart

