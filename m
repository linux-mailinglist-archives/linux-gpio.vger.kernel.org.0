Return-Path: <linux-gpio+bounces-29629-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DA7CC481B
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Dec 2025 18:00:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5473030A0E72
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Dec 2025 16:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2426324B0C;
	Tue, 16 Dec 2025 16:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="p2nctEGS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3091C8611
	for <linux-gpio@vger.kernel.org>; Tue, 16 Dec 2025 16:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765904111; cv=none; b=Ur+N4D4QgNbTd+ckv6mwQ4LkmULoHQN3yly0CAxRpFn8alF6tSlmS+UxwxTOSutQ8MY9f2DvH/EfWbTPsuJ4hDDmcpdjv9SwlmEb8/TCc2IhfFX1GaAz7FnNO8Xh+hZbswUOhzR78rWH1FplvAI66STF1oj1HUAEfhokksohv5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765904111; c=relaxed/simple;
	bh=UN+I8vzJ8cwqizu/csjxQGAMQDSJQX7rflsi34zqodk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HttNJuGVYJm2h7/6ai2PiRZExuGjDHfuTKX34Ow5zqmeibiXMEzHrMg+cpMwoQjvhr+Ln/pFdpG4FH2wfZ1IvmyV8+fXi+8HwUwl7xAyN/ZINJ3r7kWSMz28282aPtu7a85i4U9K1V8o/XJROV1jS9bwpkAjJAGHjUYCNoY6/nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=p2nctEGS; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64198771a9bso6811956a12.2
        for <linux-gpio@vger.kernel.org>; Tue, 16 Dec 2025 08:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765904106; x=1766508906; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UN+I8vzJ8cwqizu/csjxQGAMQDSJQX7rflsi34zqodk=;
        b=p2nctEGSNrBNH4w0gv/yBfai7zSBJT37Uc/6sCOChec1JnUq/nw1WTcH4vymi0Gysn
         AroI/pZ8T3uPg5QkGXajLuB2WTjrAnztoLvBwRjqyRxmsBdcDCAW7YCLK+qAy3YVpRm5
         0jIkBfTX0ws4dfu2mNth8gjTjWhMx2EZQOKy6QhhKNirbkDGS7qdWp8SyOJJBY5ST3/z
         gC/oZXzU3ZyGWPCk/JG9jpo9Vkqgmrtj44yEOluChgE7zG0ptlixUvmEO84b9YPhYhTg
         blywLMj7i/cbZeihiF4uHL5VtC3JYGC1MiBUPlqXRuBI1Jo8lJ3VlO+hLQD3TfNz6+g/
         TiLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765904106; x=1766508906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UN+I8vzJ8cwqizu/csjxQGAMQDSJQX7rflsi34zqodk=;
        b=um+LJyrp7ocBTqzgov2D3SSbMnEgFTRaG3Pgumf28EmTe+rLQ5n6MuKyUw4GU+P4Xm
         dFkmZcVW+d91asOVY+e4rM/3YnUnXSJcsVZ9J0FZL/3CkFg20Twh4VtQaR3eZdk5VVXg
         UQ39QRiCaCHocQnr2kjr19zKHCfvGdwaYmnXsgqdg8cqKhgms+LwX4WhNXca7CmwpOxz
         a3h8zVmd7gGcdd31yd4uiQZE0i8IokeMrl4sto7PLC55RK8iIyMVSO0LnE70t93Xi3Pf
         7FtsBkk/vCWQpB5z1efN7sjJwANkOBS3Sqp3rMHh+YvJpcLra7BvsX2OCpNXz9DpFJEB
         vqlw==
X-Forwarded-Encrypted: i=1; AJvYcCVwyR4P1FuAkap62zXQq3oH8kVk4NZwv4f72VJCPQLhIGETHCLF50skgVrBTZ9kwY91pVY2G62TCOEg@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq3cWCOM0ddiRDa+01Auuv19JohHDAKQ1sXIsc9fx7xB+5g/L7
	zKoCN4iOnjjeCt7kWc20uqXCRU6Txr+Muwr8WnphR7al2iUOc+vFD7mFjh4DmEUfu/W2pSRW4WM
	XTpKa3ntdD9auWCrkZ8zEyrqf5MuO6F1HBF6wKw4ozA==
X-Gm-Gg: AY/fxX7w2D2BpGaaGvLmoqhNqTXgpaPiOkWknzsm8QTFaTkIJmJ2Qyr2or5fKVfSd0c
	jdU6+MYvMfdliTD6jZ2izx/p9EmufwF5/GzAIMRiBDpG5ziOXQcEJEdtXm6q4SzZEXUuSNEK/el
	fiPw8WUeZck3zjexXo77gqksVGgeFE9X/0dg7wmFQZiUyK8fGW6mulMCRnonVsjLvMXmGJQ8BoV
	vn8ouE5rh9pUyWQIXfgFY96ZkIMS0qfqhBRlVHdRQUYbsvGa3aFvZ02siQZl2Uocn5rnCD3
X-Google-Smtp-Source: AGHT+IHss9Bd1xLNKBKVvo2auf8JouoGjNJ+pij6L9GBIFkYaw2yQJkBsu5mTJ8ApxjlWW3ipaEa8krFjlxvR+te8cI=
X-Received: by 2002:a05:6402:430c:b0:64b:3a8d:8f2f with SMTP id
 4fb4d7f45d1cf-64b3a8d8f4amr1282460a12.8.1765904105940; Tue, 16 Dec 2025
 08:55:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
 <20251215163820.1584926-4-robert.marko@sartura.hr> <39d5371a-ed3e-4262-9cc9-e76c039f352c@kernel.org>
In-Reply-To: <39d5371a-ed3e-4262-9cc9-e76c039f352c@kernel.org>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 16 Dec 2025 17:54:55 +0100
X-Gm-Features: AQt7F2pB7VocjSO0euYm2JMWHk2AXNZHaLhwttYBwdz_DAq0CW2nlyHeH65guEQ
Message-ID: <CA+HBbNEsXG64L26S-78A4E9dUOnfdtTEQoifiv5Y16_oQeiiHw@mail.gmail.com>
Subject: Re: [PATCH v2 04/19] dt-bindings: arm: move AT91 to generic Microchip binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, Steen.Hegelund@microchip.com, 
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com, 
	herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org, 
	linux@roeck-us.net, andi.shyti@kernel.org, lee@kernel.org, 
	andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, linusw@kernel.org, olivia@selenic.com, 
	radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, richardcochran@gmail.com, wsa+renesas@sang-engineering.com, 
	romain.sioen@microchip.com, Ryan.Wanner@microchip.com, 
	lars.povlsen@microchip.com, tudor.ambarus@linaro.org, 
	charan.pedumuru@microchip.com, kavyasree.kotagiri@microchip.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-clk@vger.kernel.org, mwalle@kernel.org, 
	luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 4:56=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 15/12/2025 17:35, Robert Marko wrote:
> > Create a new binding file named microchip.yaml, to which all Microchip
> > based devices will be moved to.
> >
> > Start by moving AT91, next will be SparX-5.
>
>
> I don't understand why. Previous layout was correct.

Hi Krzysztof,

In v1, I sent the LAN969x series as a separate binding, but Conor then
requested that
they should be merged into a generic binding, and LAN969x added to the
generic binding [1].

[1] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20251203122=
313.1287950-2-robert.marko@sartura.hr/

Regards,
Robert

>
> Best regards,
> Krzysztof



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

