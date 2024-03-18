Return-Path: <linux-gpio+bounces-4428-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0FB87E90E
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Mar 2024 13:00:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 298AA1F234E2
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Mar 2024 12:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAE36376F5;
	Mon, 18 Mar 2024 12:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e0qKRJgz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034B5364DA;
	Mon, 18 Mar 2024 12:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710763252; cv=none; b=QQlvKxBXUaHGtgV0/DJF5+o/PVZF0Vk94WSneZjJSKmurbNuAfqmpTH4BrMnM7XnMr/i38EBnm1w1V8cY/jkg8KZW1ecafTM2heObvnUqhmGKN1QuiyxHuoAmukS2lzwh/WmyB+Z9lr+E+RwF4qSUT3zeVPbzzBHBIm1ooa358M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710763252; c=relaxed/simple;
	bh=EcPy4nCgH8ZAQ1vUXmJDobkMSH2vBopPh0gs1mNUAVQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=XAKmvA5Eq+xLGZXsa+unpsNXvpvro1oSJj00PzBjbqO3ojHvpWBjuNW1gOCZHrI1ao5Asr56PnDoddbyw5qyeU4vtjti7b9Bbkomcj5Og9t5SLCz0I5lATZCpIANGyawc1TrvLipzNG26V2tgiklS8xTj2AU5lOM85GXmGvcDKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e0qKRJgz; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-4d43c633fecso944887e0c.3;
        Mon, 18 Mar 2024 05:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710763250; x=1711368050; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JKiWzpDebtLMNfbzh97cr7lGgL09om1YKm4qVvQT8jg=;
        b=e0qKRJgzzpsiNl/ScJJMk60dw5KiID+4sprX63+aejnivGmc8NJqijGuB/CKyU3lHF
         ZSBbOO54Pt2lax1Lotqsr6wude0VcsVjcN86rTUDwBB1vqRroJSdgqZsO8cZY2KVFcOk
         g8S3mqRs5TE/LomFLvgyLzZBZmE8M0hS7A+70q2pfRKxaxqy5ttclt6BK3XwUk6nahXn
         DLKmJLgyKrjjg8PMLBPzZxd1czvlrBdr3eqOkSU31AqAeadikASmlo8kUXtWkorXO78F
         0jT3WS2LeZDz0ojLJnvR5K8v/Wc+M/EzbRcpeiPRDkXctfffjZt7JwXZZ30eWbMTvFn6
         z+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710763250; x=1711368050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JKiWzpDebtLMNfbzh97cr7lGgL09om1YKm4qVvQT8jg=;
        b=rMoZYaCHy1kbczbB4XL/d0QC1wAcAGuCmtEfGoWTcWq9lXoKL5CYOVOlnrxqvHBQTA
         oDFczGI62H4x8T5hzTFvJ405KpFD7UfmWx1mS+LUNy3vZoLzrzeCa96P6+3V+aEtzqe8
         2MBLrsc92YsskW9YtFdQyCMpsYagMuYrs33hzyS9iZsz9ARWaVymBUXlgzSErqZWUtxj
         Z4F2SHNWPTmXf0qibtsGvpxEedmYQ1OvEp5l5X6kbSapYazue6ygAACEeG3asTamNbTP
         V8Ex/vIcKV8T4KQ6I0uj+1tZ6MgRLsOh5uxGoyIpi4M3bj14hhpy6bi/ntFif1msCJhj
         YLww==
X-Forwarded-Encrypted: i=1; AJvYcCU7y+OtLBgvwNiEOACCHsFVaCmODDPvvenk9pHizNZ36F+qoCmZ4ty5luaS/GEQntG6kmpSV4zCkYQHTGnIVfpLrUtxoVwptFC+574Azl8JEX4GZv4Q7+hQM8Qums0wFuXcv1oOvtW7oi+tpfaK
X-Gm-Message-State: AOJu0YzGWapgSsQ9tzedxxmRlsGWSE3ALI0krFWyV8EhLA0Hc5KdZ/iX
	qeR9fGd/31WiCbgbfuzNID+CN/96PVQMr/zIyDSY/Sy86CHv/tJipeVrcBJpucviiMq/E+iYunj
	doJXAyWMI+L9SC3p/xgJW6bucw5I=
X-Google-Smtp-Source: AGHT+IEOcU7bUeKefsM5+yuekmyBgCe71B9SmwLKXSz9+GAzPKJhP7x9O3aLOMj9EX8od7GNFSFUbYMsMf3AyQcoVII=
X-Received: by 2002:a05:6122:2087:b0:4d4:66c7:53fe with SMTP id
 i7-20020a056122208700b004d466c753femr1378944vkd.15.1710763249410; Mon, 18 Mar
 2024 05:00:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 18 Mar 2024 12:00:23 +0000
Message-ID: <CA+V-a8uEoyjjNCydK_Lr2CVOPN4j2oL2moVU8RgTravv3ygO9w@mail.gmail.com>
Subject: [QUERY] RZ/V2H pinctrl implementation
To: Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Currently I am implementing a pinctrl driver for the Renesas RZ/V2H
SoC. I will be reusing the RZ/G2L pinctrl driver for this.

On the RZ/V2H SoC there are a couple of settings (like
output-impedance) which vary depending on what power rail it's
connected to.

For example, for the output impedance there are 4 groups of pins.
- Group1:
      Impedance is
          150=CE=A9 / 75=CE=A9 / 38=CE=A9 / 25=CE=A9 (at 3.3 V)
          130=CE=A9 / 65=CE=A9 / 33=CE=A9 / 22=CE=A9 (at 1.8 V)

- Group 2:
     Impedance is
          50=CE=A9 / 40=CE=A9 / 33=CE=A9 / 25=CE=A9 (at 1.8V)

- Group 3:
     Impedance is
         150=CE=A9 / 75=CE=A9 / 37.5=CE=A9 / 25=CE=A9 (at 3.3 V)
         130=CE=A9 / 65=CE=A9 / 33=CE=A9 / 22=CE=A9 (at 1.8 V)

- Group 4:
      Impedance is
          110=CE=A9 / 55=CE=A9 / 30=CE=A9 / 20=CE=A9 (at 1.8 V)
          150=CE=A9 / 75=CE=A9 / 38=CE=A9 / 25=CE=A9 (at 1.2 V)

The power rails connected to these pin groups will be connected to PMIC.

Below are the options have been explored,

Option#1
- Passing the power rail information from the PMIC to PFC (pinctrl
driver) so that pinctrl driver can read the voltage level and set the
values accordingly. Here we will be using the
PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS to get/set values
Pros:
  =E2=80=A2 Debugfs can show the value in ohms
Cons:
  =E2=80=A2 Race condition at boot between pfc, i2c, and pmic
  =E2=80=A2 Late time of probing
  =E2=80=A2 Impossible to validate dt-bindings correctly
  =E2=80=A2 Manual doesn't say that pfc has access to the power rails, this
could be a challenge
With option #1 I am currently using fixed regulators but I see an
issue when we add a PMIC driver with regulators for example if i2c
pinmux (to which pmic is connected) that itself requires
output-impedance setting.

Option#2
- Specify the voltage in the pinmux/pins child node alongside the
output impedance (using power-source property)
Pros:
  =E2=80=A2 both driver and bindings can validate the settings
Cons:
  =E2=80=A2 the figure of the voltage supplied will have been replicated, a=
s
it would be listed in the corresponding power regulator, but also in
the definition of the pin

Option#3
- Have an IP specific compatible ("renesas,v2h-output-impedance") with
value 1, 2, 4 or 6 (which indicates x1, x2, x4, x6 strength)
Pros:
  =E2=80=A2 Very simple to support and validate.
  =E2=80=A2 The user cannot really get this wrong
Cons:
  =E2=80=A2 new proprietary property
  =E2=80=A2 we would not be using the output impedance property offered by =
the subsystem

Please share your thoughts what could be the best approach to add
pinctrl support for RZ/V2H

Cheers,
Prabhakar

