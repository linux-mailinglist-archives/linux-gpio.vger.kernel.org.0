Return-Path: <linux-gpio+bounces-4169-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 056698737A0
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Mar 2024 14:21:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89051B25EAB
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Mar 2024 13:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A4F1131731;
	Wed,  6 Mar 2024 13:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H9eechLF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CC2131724;
	Wed,  6 Mar 2024 13:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709731253; cv=none; b=pPMrZgYf0m+X3a7r62hK/gHeKfH1Jtchdy+xPdIlUBkyOBty93+PoQ4k1ui28uFypzryepqNMwuVwzJDyRnAU4coWuuQiJ8n3eA9e8SBsoGH0dEJ11A5A+rPt2NFYodcSgJ9ANJ6GV36Tf349YO3uxmKHFpB83aSEFfMMfkAHsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709731253; c=relaxed/simple;
	bh=hBwQRfDB3vRxBfC1PFrHDC8bEfAnJTBEaB2IzGBEn8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O6CPtDrZkKL4tIbcAw3ZGdBPkILClf1j234HN/qXeHJb6oAIPpMyJI5VuxBAKiEwVpoUlxD35fjvevqLMT2QHACfl7wFAri785/JddLLwh3XCmATmT4MMGCVATDck/hxF3PViJMoafqpRt2Ob2cuYx8QclMb7PL9omgAcY4CseM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H9eechLF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FFC3C43394;
	Wed,  6 Mar 2024 13:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709731252;
	bh=hBwQRfDB3vRxBfC1PFrHDC8bEfAnJTBEaB2IzGBEn8g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=H9eechLFsCUlveAwDf122TxG/RfEysWowspaZGRv6h6Mkzv2guaOSGDUjnutHbXmZ
	 pJSWdZ8Z46pd9rr9/BjTMfy30R2tKQKq7hyDD4eK7KqdC7Y4eeZRPTTxnHyddo/2FV
	 Q2mTZM5qyPtaktrQmVDS+3qgCZ6VlLFWpro2/GoLmHltyAALmByoCfuumAnQd/q2vW
	 Y9+VJfkl+fftG0V0oIdZmsMdludkSIQ/NTRdjNUEhP5YQbWw3n40Vhvt9PkaWtrUWp
	 J/p6kJXl8nr68nMHSw+J26jsuOUWDDtcNS8Fi5xQULfh0g+zZMg9KXlU6m5POhoDLe
	 OSoldeGUX4XIA==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d27fef509eso13412811fa.3;
        Wed, 06 Mar 2024 05:20:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXLL7FL5uqakXyEKkPAdpG2MK1eV6IGpT3WQ08AFshKY4ysNOin9bYVNtMu5Qj9gbJahvvY5uYxfoeF0UGoz4h5qtJrgl86RCZjLTr7d1fjtEGENH3qarK/VMv/T4+QOstY9npTpP4=
X-Gm-Message-State: AOJu0YxzyVL0pcU9un9wHzzOZXb36Uje628GgFZcIgw9ZOBsLaoy2Y7q
	EsEM4Yon27KcDY90gp8LMVn4CuoIboq9OB3rDEYW2Rj0vnBEFjWGyzRQdRnoprrViFHYFgdcUo9
	dbOkuG8Ff5s6XDaYoa5OOihVXJw==
X-Google-Smtp-Source: AGHT+IFKThumhv59EjFUdOH4xKjy6uY/jkwVsSZsbZtQIc/HJ9nFKAPTxbyOPWQeWZJHzM4Y17xir7f42ecDV/1Dy+Q=
X-Received: by 2002:a2e:2c05:0:b0:2d2:e82e:75f6 with SMTP id
 s5-20020a2e2c05000000b002d2e82e75f6mr3091068ljs.44.1709731250644; Wed, 06 Mar
 2024 05:20:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20210624214458.68716-1-mail@david-bauer.net> <CAL_Jsq+sHy=mr0paWvxOL8yT9TwuaJdfapX0sFkOJFtjCqoT1w@mail.gmail.com>
 <CACRpkdY2jfszTNvUHxc8-AXFwZKQaaOkcTwZrAiKi2rU5tTn6g@mail.gmail.com>
In-Reply-To: <CACRpkdY2jfszTNvUHxc8-AXFwZKQaaOkcTwZrAiKi2rU5tTn6g@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 6 Mar 2024 07:20:37 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJWWvVQHtM6fmqewQz0YXhr5t3hzSso5CLhi_Sws8uihA@mail.gmail.com>
Message-ID: <CAL_JsqJWWvVQHtM6fmqewQz0YXhr5t3hzSso5CLhi_Sws8uihA@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: pinctrl: Add bindings for Awinic AW9523/AW9523B
To: Linus Walleij <linus.walleij@linaro.org>
Cc: David Bauer <mail@david-bauer.net>, lgirdwood@gmail.com, broonie@kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 5, 2024 at 4:25=E2=80=AFPM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> On Tue, Mar 5, 2024 at 6:28=E2=80=AFPM Rob Herring <robh+dt@kernel.org> w=
rote:
>
> > Linus, did you just apply this 3 year old bit-rotted patch? Linux-next
> > now warns:
>
> Not "just", I did run checks on it first i.e.:

Sorry, I meant "just now".

> $ make DT_SCHEMA_FILES=3DDocumentation/devicetree/bindings/pinctrl/awinic=
,aw9523-pinctrl.yaml
> dt_binding_check
>   HOSTCC  scripts/basic/fixdep
>   HOSTCC  scripts/dtc/dtc.o
>   HOSTCC  scripts/dtc/flattree.o
>   HOSTCC  scripts/dtc/fstree.o
>   HOSTCC  scripts/dtc/data.o
>   HOSTCC  scripts/dtc/livetree.o
>   HOSTCC  scripts/dtc/treesource.o
>   HOSTCC  scripts/dtc/srcpos.o
>   HOSTCC  scripts/dtc/checks.o
>   HOSTCC  scripts/dtc/util.o
>   LEX     scripts/dtc/dtc-lexer.lex.c
>   YACC    scripts/dtc/dtc-parser.tab.[ch]
>   HOSTCC  scripts/dtc/dtc-lexer.lex.o
>   HOSTCC  scripts/dtc/dtc-parser.tab.o
>   HOSTLD  scripts/dtc/dtc
>   LINT    Documentation/devicetree/bindings
> usage: yamllint [-h] [-] [-c CONFIG_FILE | -d CONFIG_DATA] [-f
> {parsable,standard,colored,github,auto}] [-s] [--no-warnings] [-v]
> [FILE_OR_DIR ...]
> yamllint: error: one of the arguments FILE_OR_DIR - is required
>   CHKDT   Documentation/devicetree/bindings/processed-schema.json
>   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>
> So that's at least something but apparently not enough, hm the yamllint m=
oaning
> should be a hint should it not... it's on v6.8-rc1.

That's fixed in later RCs.

BTW, you can do just "DT_SCHEMA_FILES=3Dawinic,aw9523-pinctrl" or even
"DT_SCHEMA_FILES=3Dpinctrl" to test all pinctrl. It's just a substring
match. (It was just the full path that broke.)

Rob

