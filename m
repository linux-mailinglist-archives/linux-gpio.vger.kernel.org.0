Return-Path: <linux-gpio+bounces-15968-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDD0A350A0
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 22:46:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D6EA1890A0F
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 21:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99A711714B7;
	Thu, 13 Feb 2025 21:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cecShce4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8343A20C490
	for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 21:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739483170; cv=none; b=NBptvlbgiLnXXJeKY4D2b00IxsoFEM3tHFx1mgY/jRkMtCeXDBvuFCpLCt6uzYkdHDM9G0lZmsJCc3Wby6/GyTiyCxLJJ5e5j5eUf/CpbOuJvGPsYxXlXFCS4Y44kMnkcmjl2NaE8jQN09QL7R5BjKXz2CIElONdxEQvKTF7ik0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739483170; c=relaxed/simple;
	bh=5BDKfPEQoQKNl37BH3w80oASYOsI475hq+Fhk3cevNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VtjaTpAeMhI64N/VBXt5Qhscb6DuRPwl55WdGqIfxZCbfYA6ftfdPRfwmEWtwyPlE/emOFXMk6taXWhEHF9wOm8YduCzALSvtz5qdpwWUQVtG2eV+3hSQDUgQ6b2CTqMULD7rSWMHyKHYQ4WXW3nZ7SJEs9BZLoyIE5/1A2lS9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cecShce4; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-307d1ab59c6so14337461fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 13:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739483166; x=1740087966; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kVfu1NW+vppBIbPYgYDsbWT6TbEthzVowdxgCrkUjA4=;
        b=cecShce418/BhmqUl1Zp13RwAi4uSQe/yNGNyTGxXmFuGZkpw8+x86uo44Cjk/hP0P
         XTkmqcoV4+FnOW4pCJ+BqtoM5BDuGG/FDDBHLYLiMBUtbBTaZDAFE7cQQaY20uVinWWj
         w7w77VDYalPBhd8Jol9RU57llFf5wynaYWSQyNxQH+aN8PVWKVYMHUpBbM8/ZLvTRCC0
         ihP7A1VfGETjRD61i/FLBJSevyIPtGkEqxHPKbPdRWWsxH5ASiqSalVTAf88DWdybF4i
         kd2ZFotZ6vq/L+4RyvWLUQYfRUeLTmWNI80sU+t6rjDggMsT8zi3JX/IGTwszl8WWegm
         Mr/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739483166; x=1740087966;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kVfu1NW+vppBIbPYgYDsbWT6TbEthzVowdxgCrkUjA4=;
        b=dUk5dYay77CKlSLX/YRa7pb5rR3AiULuT3hLc+0uaYN9IPVLc9tZL8h6VNF8tN6qXc
         JfQYvQ1YaQg2h63PIkmrUw+eBD1FduYtIzPIBIHkxzl4i4jYodLTq6OXUY/OH/aRcW8b
         L3yMT7oyjkZu4AUhKV21oaH3KlIlxygbmcst4IURQKuLh1B30TFwMp88D2NpLsK43VyB
         7wfecbNjAjSoiFItocNHOEPgRJjZEOZXzR9RTE7RtOobd6UNwWOq9Sve0cm1obrWy3OJ
         o5GJmNwilG5xpu51BWbi/4+5S95/9hrZCqNteF5neoZMVTKe+GZMu2B3XtwDP/RdmqoS
         9fcw==
X-Forwarded-Encrypted: i=1; AJvYcCVWceeWhC5l7OBfLGaoxu6IGKBnJW6RRt3l+w6bSPDn3uWX4Rdz/3Fi/DkGT+bkcJjSM1EkbekT0gXF@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6OGXxQFMRXdGF4TAuFZFM1PMNjO8hhCcoQZ3lUeg798bj407Y
	v0THvGJbXAFeuwlK/+eKc30+cJlKbedrzwGENYuNrh6WRXwjO/cBPRF0Jlv8K+57BusKXRemQ6W
	rsJU7V7DWM4I+C4WONPgUMi0+C8td7BFHdBQrxA==
X-Gm-Gg: ASbGncv22uBC26gZQNuREkzLuECT1mDAc1qKVgvD1y1yj64q0frve/LAJasJFMXsWLN
	RdY09hkIscnm+sZ3UwS2n0YDnZR7nhCTyYW9vjvE3EqnhRI5aBsz+AtS/naoqc7KqINC6T1sB
X-Google-Smtp-Source: AGHT+IF7cW4HbsRSE+zEEB418//pZVxCpudCIYRSWJ9fxNosPbB13IE7XmFd5Ph5xOjv8MH4ir+hgKvJhTH6zINBiSY=
X-Received: by 2002:a2e:a912:0:b0:302:1fce:3938 with SMTP id
 38308e7fff4ca-30903643504mr40744881fa.11.1739483166542; Thu, 13 Feb 2025
 13:46:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206181714.417433-1-johan.korsnes@remarkable.no>
 <CACRpkdaNDJrGZ4Y2PPUWQfm6BprfNACYWD7srs3sYHMEsdX1Ew@mail.gmail.com> <DU0PR04MB94963632094E71ABE730631990F12@DU0PR04MB9496.eurprd04.prod.outlook.com>
In-Reply-To: <DU0PR04MB94963632094E71ABE730631990F12@DU0PR04MB9496.eurprd04.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 13 Feb 2025 22:45:54 +0100
X-Gm-Features: AWEUYZmEX0y8tQAlD3jIqTGLm7JPlOFvKpJHyNQQoYaTgfGwxSxp-eh-ybIRuPI
Message-ID: <CACRpkda7ZRR+1_6bJN+qgrsb=GQyyujg81uie6n5rX_U3tAynA@mail.gmail.com>
Subject: Re: [PATCH] gpio: vf610: add locking to gpio direction functions
To: Bough Chen <haibo.chen@nxp.com>
Cc: Johan Korsnes <johan.korsnes@remarkable.no>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 7:21=E2=80=AFAM Bough Chen <haibo.chen@nxp.com> wrot=
e:
[Me]:
> > I have no idea why this driver isn't using gpio-mmio.
> > Not your fault though, just pointing out obvious improvement opportunit=
ies.
>
> I check the code, for vf610_gpio_direction_input()/vf610_gpio_direction_o=
utput(),
> to let the input/output really works, need to call pinctrl_gpio_direction=
_input()
> for vf610/imx7ulp/imx8ulp SoC.
> Refer to drivers/pinctrl/freescale/pinctrl-vf610.c, it implement gpio_set=
_direction
> callback. Also for imx7ulp/imx8ulp pinctrl drivers.
> This should be the reason why not using gpio-mmio.

If this is the *only* thing you need additionally from gpio-mmio
then what about just adding a new flag to bgpio_init() function
in <linux/gpio/driver.h>:

#define BGPIOF_PINCTRL_BACKEND      BIT(7)

That makes gpio-mmio call these callbacks when setting
direction?

Yours,
Linus Walleij

