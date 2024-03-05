Return-Path: <linux-gpio+bounces-4153-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60314872A2B
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 23:25:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E20971F2515E
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 22:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B10E012D215;
	Tue,  5 Mar 2024 22:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QjBLif5N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E867B12D213
	for <linux-gpio@vger.kernel.org>; Tue,  5 Mar 2024 22:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709677523; cv=none; b=FmqjshKYA13ePKIAwmSXv0ueoZciL+mzkXxQaTKmsOozqzdRzXERAwchvKE0EGW8JzkU/wYwYQm7jkHRC+tbyvayRy4bI8FbAPSSSyQm6d1eg0xJE17rjWa0MI0/BVxqm3JSWBgBVcOtsjwtQwn8XO0vmYnnMe70QN/23Eiio14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709677523; c=relaxed/simple;
	bh=f3nTnJgkfAw37K33Z2PvqlSHbbqdwxuoQkfrKprzz20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ghu0nd+tH9TPQwIBKNaIloBlcXCmBdy/F0CVWa0AsmuxXz5abaB/0AYfuiN4f0xY3/I87bef+Il1+SZoCYLES4oIiRSbH46pvZdODcDFwsiPKDw5qxGmMd4UaiP70qpAVG55yiW6DUdh0GYVS6BMIkJIcfGMPn34Vyni9/vWBqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QjBLif5N; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dc6d8bd618eso6634152276.3
        for <linux-gpio@vger.kernel.org>; Tue, 05 Mar 2024 14:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709677521; x=1710282321; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MGwm2lfKrMr319TGYTOdrKoM3Z86YjxAynwdBTS1iXw=;
        b=QjBLif5NMOp7HWG/GHIQnQ23AlXp6GI5oo4C5gXs8ET03hdpvg1eHJjo7+Y0L/KPHw
         NcC0pcxcmHGoT/kZ76p7s036yBRnr87aUaOxo6nlJA69JRU8HhLcJkeepdUxh7OQvLb1
         yHOZMNI90Qm56ijDUdMyNo4crWJdCZxyoY8hK8QFw2ShR5d6o0kXn8duLKdBTFOXR7Ej
         k0JK1yDC4eLAOg6PC+NUjUR8RUAqHsi3+S52nT2MxWjUebcZSWetduF2H2gKyo7pNV88
         YHjoK5MoPYVEAaTsMEma9KMJukz1NB7T6IcOmUgjdRyW43bcCLK++1gLg6maksmI6Zob
         z4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709677521; x=1710282321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MGwm2lfKrMr319TGYTOdrKoM3Z86YjxAynwdBTS1iXw=;
        b=HG3JG+Rv1NeRK7MYJ39JuqnSpqZ2JsjrfGF7EcgXL4MhZG8OKG6bT+XWSCH1cLZp+3
         BO+vndqB+qsYKYfc1mEgBgapzndT9Rj7jUti1XR5KbbMh0ViF5rmLWlkuIYgkd4Wgygt
         y0heKx37OQnuBQE4Hh+tA/4rRTKBa0yAzPSUiy78s0jyNbKKlgJpncQC4cZ0md9hvcsP
         ytKMF2PtrU7mo5OsBEqXS+FrTUJki5XgHofWSBMu2r8caaVa7bSVo12VE5CZS37VBMPq
         eQM60jz9qRU4Sbv5XnfTZs0mMPSpDMU6LY2XAFJtR78HJ/zvt/EvFL/BtHMLrK5fAiZv
         87Fw==
X-Forwarded-Encrypted: i=1; AJvYcCXdCqrNrlRaMuOT9AoDo1glGJbsLSzvF67Nr6CfBrpkLP/tJoaUdoDu2/fZmPLLTiGnkOO42T+1P30p7NQBvdMLnlmHK1JmNVGLXg==
X-Gm-Message-State: AOJu0YwYAHjoi/wnzUrxHOSs5lrdGLJ1BhIwxTeiDobXQz1Uf5zCLKmS
	c5mr2OZ6uhkJ0tHM0fsPm4COQ4fcnypnu+MK7+vHd+MjqPiDef5U19wROhoba/5w7lSlV14gvxu
	xEqiPgiBYTX44PsmNBguM+V6ismw0W6xG3zSgLp24RbhnTHOr3W6d/w==
X-Google-Smtp-Source: AGHT+IGCdBLYsjDNCkkw2T9dTQxo/+OlDyUZJVGvcZE9zzZknOwfEVyAo06mr0npYAzlyIfo8T2NS/SnSwT0EVODHnE=
X-Received: by 2002:a81:9294:0:b0:608:7af2:f5f5 with SMTP id
 j142-20020a819294000000b006087af2f5f5mr12914368ywg.50.1709677520791; Tue, 05
 Mar 2024 14:25:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20210624214458.68716-1-mail@david-bauer.net> <CAL_Jsq+sHy=mr0paWvxOL8yT9TwuaJdfapX0sFkOJFtjCqoT1w@mail.gmail.com>
In-Reply-To: <CAL_Jsq+sHy=mr0paWvxOL8yT9TwuaJdfapX0sFkOJFtjCqoT1w@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 5 Mar 2024 23:25:09 +0100
Message-ID: <CACRpkdY2jfszTNvUHxc8-AXFwZKQaaOkcTwZrAiKi2rU5tTn6g@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: pinctrl: Add bindings for Awinic AW9523/AW9523B
To: Rob Herring <robh+dt@kernel.org>
Cc: David Bauer <mail@david-bauer.net>, lgirdwood@gmail.com, broonie@kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 5, 2024 at 6:28=E2=80=AFPM Rob Herring <robh+dt@kernel.org> wro=
te:

> Linus, did you just apply this 3 year old bit-rotted patch? Linux-next
> now warns:

Not "just", I did run checks on it first i.e.:
$ make DT_SCHEMA_FILES=3DDocumentation/devicetree/bindings/pinctrl/awinic,a=
w9523-pinctrl.yaml
dt_binding_check
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/dtc/dtc.o
  HOSTCC  scripts/dtc/flattree.o
  HOSTCC  scripts/dtc/fstree.o
  HOSTCC  scripts/dtc/data.o
  HOSTCC  scripts/dtc/livetree.o
  HOSTCC  scripts/dtc/treesource.o
  HOSTCC  scripts/dtc/srcpos.o
  HOSTCC  scripts/dtc/checks.o
  HOSTCC  scripts/dtc/util.o
  LEX     scripts/dtc/dtc-lexer.lex.c
  YACC    scripts/dtc/dtc-parser.tab.[ch]
  HOSTCC  scripts/dtc/dtc-lexer.lex.o
  HOSTCC  scripts/dtc/dtc-parser.tab.o
  HOSTLD  scripts/dtc/dtc
  LINT    Documentation/devicetree/bindings
usage: yamllint [-h] [-] [-c CONFIG_FILE | -d CONFIG_DATA] [-f
{parsable,standard,colored,github,auto}] [-s] [--no-warnings] [-v]
[FILE_OR_DIR ...]
yamllint: error: one of the arguments FILE_OR_DIR - is required
  CHKDT   Documentation/devicetree/bindings/processed-schema.json
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json

So that's at least something but apparently not enough, hm the yamllint moa=
ning
should be a hint should it not... it's on v6.8-rc1.

> ./Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml:49=
:2:
> [error] missing starting space in comment (comments)
> ./Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml:56=
:11:
> [error] string value is redundantly quoted with any quotes
> (quoted-strings)

They were so simple that I just fixed them up in-tree.

> Also, David's S-o-b is missing if you picked up this one.

I mailed David about it.

Yours,
Linus Walleij

