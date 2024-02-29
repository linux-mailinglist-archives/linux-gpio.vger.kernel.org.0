Return-Path: <linux-gpio+bounces-3912-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D513186C499
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 10:12:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 837EC1F225D1
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 09:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12CB657889;
	Thu, 29 Feb 2024 09:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZSMJhSHD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353DC5810C
	for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 09:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709197954; cv=none; b=tDdSjDsR/bwkNzvVdLuFUvcLqHo7PO0UKv2XTclQF7JGIY6V1uiSWYCubu/W8OHr96ZGi4NFrWG56mzcjbKXfBuyKO4SfGL5i8rFtebV+Nkvp+Y3y2OJXvrQPg7uLeI8B0M/+5OWMKXICb1f8WptJ7qTmWwKDART146/eI0Q1pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709197954; c=relaxed/simple;
	bh=jmZ3qLypHNtRzpjVcX8wNh12ZGObOwM4O6LdoHLfufA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DS7ruG7Uj5G4X+HG9dr42si8npfYH+1Ml0L37N/FVgwluAIyF6qGkNFIbw159ZdMrvFIzdAlyFpdJueH7Nd1IWy9pRlqUbwjVb6c2mBgK/Fjxj2PxY5oPPPZQXTktnwJFBMN5dbSmOOUNQr2FLMK6GB7fUb7LbyXP52vzzjZPHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZSMJhSHD; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-60915328139so8075307b3.0
        for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 01:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709197952; x=1709802752; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmZ3qLypHNtRzpjVcX8wNh12ZGObOwM4O6LdoHLfufA=;
        b=ZSMJhSHDa8oG65KuSF6uFUq39xA4KWERowin+P+qK4Vf+pRXufiYCSp2w6LMn8XFaW
         JK/kUNjAAblNyUCYsRjGPZTA+a++QXc8YvVwb5RKN+WRk8osarsDRXBntzb1XksPv26K
         Mdap///KfZ1Cre5VQ78YhDb/P65/TIMlqrEuI+NzIPpaf3uvzDgjThXfmXIRSY1wTDwT
         ZUQRbtuTHJ04EtOdvKVLIEC0cvcggfXeZ35uikJEar0nFVFP9v0r6Ifzhe8UhHJLYjXu
         ruYSDUvKsQXr1oNxPwnnf8esp3PRQFWo/5L7+9iL1IyQ+Ceu0qxqLMq8oFnfUegEYlvI
         zrDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709197952; x=1709802752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jmZ3qLypHNtRzpjVcX8wNh12ZGObOwM4O6LdoHLfufA=;
        b=OWjufY3rCBlKAs8yMDdxc50I95Y67HacVWFpVkCpZTGF4otQnPSclJVU4qKX4v5pha
         +KLAEfqBkB0nW9Xpi+nvgobUyHrEAWE+aCUNWbchJOnd74vqa8zqm7aEjXAVHuHno43k
         ug7SnCtxADiF1e5kC2Y7YfDcK7l3nUyiv2ptMKiwCtjzuW4R+q88M2WQjOuzA3EOsN0z
         1qm+F3HoCk9IH3cCdLu+/8HEBpkoxG9Y/yhIKFs5rImP5Jbos15aixPU7Zdgg9BU9sfu
         FMbMAM7XHp2M1EWyGl5mD3CZ7xjVnVOYuse0ykDeombCoqIN8B69DoDpFgLzfsQbagvq
         uG3g==
X-Forwarded-Encrypted: i=1; AJvYcCXhbrcW9K0qb2ahruLAJZzNUYnbz5z5sC/4jMkraok+bn86M+tibuJtjsm2m7lPdl4M8Ae0LDfX/OBzxS40pHT64NGX9RJ8Ju3WmA==
X-Gm-Message-State: AOJu0YxRcDwJJgqA2FOE6lrV9PR87igXLcf7dt+RsYyEIZmONz1CBSsR
	tsfYlqKhIuKiA8J6V0T9tOQPFHouU7dRHwS3B2hxML5MGi2sDhXVIBzZE3sqjMrI/80C0CRIKS0
	xqqAsGXMjVQBtIdUAJYk2ehYCulUdXyzBxJSUlg==
X-Google-Smtp-Source: AGHT+IEAi4/pXUDtlLl34+LSgCiaeZ67gTneHjdK0XuY0Ypo72LCRTzLIF12Q3GEdeS6icfVUdzIU6lcYWk+sFDA73s=
X-Received: by 2002:a5b:9ca:0:b0:dcf:66d4:1766 with SMTP id
 y10-20020a5b09ca000000b00dcf66d41766mr1505518ybq.52.1709197952220; Thu, 29
 Feb 2024 01:12:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240227-mbly-clk-v8-0-c57fbda7664a@bootlin.com> <20240227-mbly-clk-v8-10-c57fbda7664a@bootlin.com>
In-Reply-To: <20240227-mbly-clk-v8-10-c57fbda7664a@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:12:21 +0100
Message-ID: <CACRpkdYtwyKJ-j5Uyh2=jvQ5k6c1b1rW_n02YeKJh9nuRo=i5Q@mail.gmail.com>
Subject: Re: [PATCH v8 10/10] MIPS: mobileye: eyeq5: add pinctrl node & pinmux
 function nodes
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 3:55=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:

> Pins on this platform have two functions: GPIO or something-else. We
> create function nodes for each something-else based on functions.
>
> UART nodes are present in the platform devicetree. Add pinctrl to them
> now that the pin controller is supported.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

