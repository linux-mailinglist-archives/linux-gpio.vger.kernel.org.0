Return-Path: <linux-gpio+bounces-23456-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12648B09DBE
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 10:21:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BECB189A5EE
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 08:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 894F6221F00;
	Fri, 18 Jul 2025 08:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wxAi4bhi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB46721A420
	for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 08:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752826886; cv=none; b=Qvy5MgGiCTnNMWLpODwHU9M51Y8tEC8OJNo57YNUfk2sGH2IwC0L7A4RbmZoOYRTBB0a3Qk+6ZPeQsnyWfWZ7qv25YNh4PJxdgcgVYRKWJdfY3gUkgNplckMCzkQs3cIwzTs2HfMAljm9Y8kBNehFtghdbxkpOyWfxT9o8czGoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752826886; c=relaxed/simple;
	bh=ehBRfidVMiTgGu4yqitjDYf9E4aZ2H0XQi7Akm7vD3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u2Uu1kN/PbR/nuIJ8nmhR6WLSsIga7cxw76LNDfKgjsSKoFXqGLLb+6IVdrWVbtcP5jViVr9YG92wbTTgMo2pr8QIrZkd/dofR2RS9mQzGJCP4TPrzx+6zwYBxCAGRf6qDiSPXIHMgxk1ri8N2PgfJUntB6YGqINCpDlF2Kl5Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wxAi4bhi; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54b10594812so1805989e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 01:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752826883; x=1753431683; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ehBRfidVMiTgGu4yqitjDYf9E4aZ2H0XQi7Akm7vD3s=;
        b=wxAi4bhiOUU3MfYunI+AG6YzRVV5pig1KV5XWgiqVH1IylauN/Y4U23DDUspwOYm7g
         7a5MDJfIL4N9CF5gJSO8bANSbpRvslHuGmzXsAv6TDRnvpWAdIfJfGEN/Ks5nQJhVFHE
         daOqV5rncYKJC0TD+sUVY8K+HzWvZm95VHTe+JfW2Zj+wj6lH2ZPbyJcoIrN5JLDeXCB
         owYeSXbP93Yusw7+8QXWjd3+Gxz4iqngm9UrnhHgKw8ZgeF8Ef318qNNdUKiSzqAe5K3
         rZzONZge8NT424LlrteslQ//Mkkc8YbL/y2/CBdJ4kvaf444DUZYfaCDHLb+EehCfXO4
         yKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752826883; x=1753431683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ehBRfidVMiTgGu4yqitjDYf9E4aZ2H0XQi7Akm7vD3s=;
        b=jQfJUYGcFakaOFSuf5l8UXCvSSmvGqtgOUT74awFqGQxDb4ji53zed5TpVYIwVqcIy
         Ig3tiZ/XMiSHKQ25kD7UE2tQ7jJhQby/0LgmBjGHH+hz0zhRV6ZxdxwK5EBE0diV37xB
         CG7J5N9Qwtp8Lju8rEQjz8xdwvhTROqnWz4mSOEhe5OIvsPRE6ztql9T07CfpRxBSSHw
         M3ZkqD/0aw9XPYSCPrzShOIRcptxvmDHchSo7vAAooquyUwhHBTNxlY3BkvkcdTgLSyJ
         xV166HOOV/diAlmS/uUtMOWzkK4S0mYZ8GoB+0v5x6gn61gUjhk4oDsUOg/pbfZVoB2F
         EBYg==
X-Forwarded-Encrypted: i=1; AJvYcCVV36n+WO5dSeW+0H/ALOAsP1fAMgQdV1KFMEt6ILW9HKvHC1jM1EYWRpI/b+whSZXsTHMmoUYlUyXA@vger.kernel.org
X-Gm-Message-State: AOJu0YwXb/38QXPdK+0IsMv/iuuyMChcHSDCHQNKPAlRuObCodV9dhD9
	qubYQydG2n/AQAQUd/0lWudTdIVo1vT8y2UIPeUhzIfuDdGsNmm+tSq5XpO/nNmFpc4Lym3qb/d
	ni93d13ZnI/hZPiewyqowpFzk+EA4oKtIWEOPHz1COA==
X-Gm-Gg: ASbGncsTMY2jFVuwateHKgYE+OwEwQ5Mr2HkRdITzF2rFEzChZgwNnpK+xlxd02p2o7
	E6KuAErAOVLc82gRVw7zm+/j7rUH4BhWJU615hCfhZLd1MLruq2xb4pwtBNkU/mhi0E82u7Rx+q
	B1wXJ1elsLareYaKtj6AXKciBlxy1AB1d7sqUr5Kc+xe3B+Pt4lAIb4vRfNwNrX/uLXqqkfXPV3
	VsGk2oF9KQXBigycFJfrHywph9iYA6s0vW+Aw==
X-Google-Smtp-Source: AGHT+IEaWSG03ounh8FuQGPFdYkiUPh2qNisS32R9MoEM8O70oPinE1GtqhwtKAZTDuOeWMM/l/IcLkx1x4qZ+HIn40=
X-Received: by 2002:ac2:5616:0:b0:553:a2c0:da70 with SMTP id
 2adb3069b0e04-55a23f563eamr2309934e87.26.1752826882698; Fri, 18 Jul 2025
 01:21:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714202829.3011298-1-robh@kernel.org> <20250718101147.4906bd60@akair>
In-Reply-To: <20250718101147.4906bd60@akair>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 18 Jul 2025 10:21:11 +0200
X-Gm-Features: Ac12FXybEW0KgacJXEKotlpT_ULwdNJr0HEMAnGR1ZlrBw7Vllv0nLHyyPwCvSw
Message-ID: <CAMRc=Md_r2J50EWFMyr=j+JU+LqcBZQ2z8SR8EbK3pkD_xQkEQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: Convert ti,twl4030-gpio to DT schema
To: Andreas Kemnade <andreas@kemnade.info>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 18, 2025 at 10:11=E2=80=AFAM Andreas Kemnade <andreas@kemnade.i=
nfo> wrote:
>
> Am Mon, 14 Jul 2025 15:28:28 -0500
> schrieb "Rob Herring (Arm)" <robh@kernel.org>:
>
> > Convert the TI TWL4030 PMIC GPIO binding to DT schema format. The numbe=
r
> > of #interrupt-cells was wrong compared to what is in use. Correct it to
> > be 1.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>
> Thanks for taking care of it. Now it is in, but anyway:
>
> Reviewed-by: Andreas Kemnade <andreas@kemnade.info>

No worries, I updated the tree with your tag.

Bart

