Return-Path: <linux-gpio+bounces-24460-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B3FB28E6E
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Aug 2025 16:19:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A16DAE75EC
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Aug 2025 14:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AE5A2E5D38;
	Sat, 16 Aug 2025 14:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XIZHRSS3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DB413FD86;
	Sat, 16 Aug 2025 14:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755353951; cv=none; b=XOtKO0SChAkWVwHoRrKc/EIjhThcEdcufh8bkyUNxV8AJCihM2GxxMUOQPaakXo4ZcTbP40rNB14NfXuo18lusb4iDX9E38fuqNLzQU8Jazeta2SHL1lhj7zDDwhU8Teu3mVDO4eBvqsu0KPv8/gU2w8OC4j+5HKVv3/gTMBLdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755353951; c=relaxed/simple;
	bh=YcFIevqPRmnHsCDkXNhTN5eFLd3vOH8VP/okgY0uJXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KaSv21ix7qyKgGHTrFlPBq69gyz4Z6hJNLI52iLTsu6VyFihX6wQTDSLgc7P5lmqWRztngO4rkSSieofG51optMyprSld3rzsmgprBu3JwS2kgC10aZuF82uHIiAi4RW5viYZcD57YWS9lrCGeebviRPBPwUJ+TBb+x3yvhXjfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XIZHRSS3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C19F9C4CEF5;
	Sat, 16 Aug 2025 14:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755353950;
	bh=YcFIevqPRmnHsCDkXNhTN5eFLd3vOH8VP/okgY0uJXY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XIZHRSS3T/81UV43SIi6itPdlSWPZRBCHS0Zs/JjSZrtw7ic3MIPMfzc+CKQ0VJlr
	 qHVI7fiSXDUFRaFwsgPRPoXCw923tDI5NAuL+QCY0DU3LnUrIHxuuQFvfO+SDqJzWH
	 yXWgoNsSNPL57xIqD/cHcKBM8RBVirUWvVTQwa1K3KpcWF9s7ggApBK78dYd675/zF
	 uDNvTsC4WWHdrZ1BkT7CY6v28HGklNsy4zOPyysmCCpox+MBqi0SxVnvrEkjX20EQG
	 QD2aKIqbxrcn0wRPH+iqY5cIZWkwr3Z2ioMP+bLTPZ8jc7gInq2mz89KAMprcDQ1e9
	 hbEfb6Zbo5VRw==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6188b70abdfso3990011a12.2;
        Sat, 16 Aug 2025 07:19:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVF/amdUQRwguQV0lQTLA2e382n0kxZ9XFfJUGN49cXOF+baHr6F2oT+3aKPxKXUCG1AqGVQJl6E/Gs9XQ6@vger.kernel.org, AJvYcCX5zS0b0rmQR28tuBM3VDAZMQyhABxBFT6pQ7WysIkXAnLsIaYAclK/PpF8osBfEheyAxPlZnDYPRSHlw==@vger.kernel.org, AJvYcCXzA2/w4hwGEC5nlcgHuPTTmecrgROIADXIgdKLD6NO/soaS5HJd8gKJNsBfu/7U1DzE9qLm+8jVwzo@vger.kernel.org
X-Gm-Message-State: AOJu0YyGAtkDnWAZ4692waSaYMIscl8behXil8SYwhXrX3S51VsaWJbz
	OUJxgVrebjT/nxdTCf0aJf1lyQSbCZ3ex5frqKaiYO+Mbvavugo3aRBxpM0PLH1Ag6/GQy8u2he
	2T+e8LB6kEBCkP5L3OzWky66hFK5jMQM=
X-Google-Smtp-Source: AGHT+IEUkDFwlk9UhU8t342L0FCVGyMnVyPMWk30oqfsuvVTNwMtk4q2cTnYOAkS6eUbn+3TgBvlePgr0B/LX2tiyFU=
X-Received: by 2002:a05:6402:2708:b0:618:adff:66e5 with SMTP id
 4fb4d7f45d1cf-618b054dbd5mr4317218a12.17.1755353949346; Sat, 16 Aug 2025
 07:19:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250816035027.11727-2-ziyao@disroot.org> <20250816035027.11727-3-ziyao@disroot.org>
In-Reply-To: <20250816035027.11727-3-ziyao@disroot.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 16 Aug 2025 22:18:57 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5ZQQpHS_b9UL8UNgX9MH8-i4DV8bid00vEDzg76rgebw@mail.gmail.com>
X-Gm-Features: Ac12FXwCN0XtFPhP6PgPuh0T8gncotsiBAGxXqlAdAXBDWQBMIikImgkiykBIWA
Message-ID: <CAAhV-H5ZQQpHS_b9UL8UNgX9MH8-i4DV8bid00vEDzg76rgebw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: gpio: loongson: Document GPIO controller
 of 2K0300 SoC
To: Yao Zi <ziyao@disroot.org>
Cc: Yinbo Zhu <zhuyinbo@loongson.cn>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Philipp Zabel <p.zabel@pengutronix.de>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, Mingcong Bai <jeffbai@aosc.io>, 
	Kexy Biscuit <kexybiscuit@aosc.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 16, 2025 at 11:51=E2=80=AFAM Yao Zi <ziyao@disroot.org> wrote:
>
> Loongson 2K0300 ships a GPIO controller whose input/output control logic
> is similar to previous generation of SoCs. Additionally, it acts as an
> interrupt-controller supporting both level and edge interrupts and has a
> distinct reset signal.
>
> Describe its compatible in devicetree. We enlarge the maximum value of
> ngpios to 128, since the controller technically supports at most 128
> pins, although only 106 are routed out of the package. Properties for
> interrupt-controllers and resets are introduced and limited as 2K0300
> only.
>
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  .../bindings/gpio/loongson,ls-gpio.yaml       | 28 ++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/gpio/loongson,ls-gpio.yaml=
 b/Documentation/devicetree/bindings/gpio/loongson,ls-gpio.yaml
> index b68159600e2b..69852444df23 100644
> --- a/Documentation/devicetree/bindings/gpio/loongson,ls-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/loongson,ls-gpio.yaml
> @@ -14,6 +14,7 @@ properties:
>      oneOf:
>        - enum:
>            - loongson,ls2k-gpio
> +          - loongson,ls2k0300-gpio
>            - loongson,ls2k0500-gpio0
>            - loongson,ls2k0500-gpio1
>            - loongson,ls2k2000-gpio0
> @@ -36,7 +37,7 @@ properties:
>
>    ngpios:
>      minimum: 1
> -    maximum: 64
> +    maximum: 128
>
>    "#gpio-cells":
>      const: 2
> @@ -49,6 +50,14 @@ properties:
>      minItems: 1
>      maxItems: 64
>
> +  "#interrupt-cells":
> +    const: 2
> +
> +  interrupt-controller: true
ls2k300 supports interrupt-controller while others don't?

Huacai

> +
> +  resets:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> @@ -58,6 +67,23 @@ required:
>    - gpio-ranges
>    - interrupts
>
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: loongson,ls2k0300-gpio
> +    then:
> +      required:
> +        - "#interrupt-cells"
> +        - interrupt-controller
> +        - resets
> +    else:
> +      properties:
> +        "#interrupts-cells": false
> +        interrupt-controller: false
> +        resets: false
> +
>  additionalProperties: false
>
>  examples:
> --
> 2.50.1
>

