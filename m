Return-Path: <linux-gpio+bounces-9453-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4F2966117
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 13:56:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B75871C232BA
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 11:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E0ED199FAD;
	Fri, 30 Aug 2024 11:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K43oIYq+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5723D199949
	for <linux-gpio@vger.kernel.org>; Fri, 30 Aug 2024 11:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725018970; cv=none; b=RCmYUKRxNI5eQ/ll6dLt4SYQqH2EaT6I+wh6xRus2N2w8XXvn15cdcIW3d3GHvGBWX1UfGjHIuvGYUudx0SI69MeN1Zewf4oG2bTb9G2pWS6tYBBVnk84K/jH7uDaHN+Ra47K/AVe9lg6LUfHF1KsSMoLGP11BZA+cMu1OVYg5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725018970; c=relaxed/simple;
	bh=g0qYXdweblof+d4zDg0csLIusMtS4NAWZKZItJ2G/hc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MfS0uTuh+lXHcxr0aJxazuTHQa/nW7jmL3LZEuqLH0ImHiWuHqOWv2qhp/29eCp8Fwar+00RE4tkI0dAId266h8V/oVBUs/1QgXFIQwfPLVF4vT3GpTSq/MMyXP6rSMplqjJgWh2Lscyn5M6SpXMbLDiczuT8nqon8vmcpm02sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K43oIYq+; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53346132365so2178510e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Aug 2024 04:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725018966; x=1725623766; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0qYXdweblof+d4zDg0csLIusMtS4NAWZKZItJ2G/hc=;
        b=K43oIYq+FfJsFMjjg5nndElG68IoSrOuMZfmij8JKMRBPCWwF01IcrT84A+YIo3jm4
         BpvWUIRwcUWArmtoSe0+gnKFWUwqr1HIuumvXij+o4iVGlaynYi46eIjiVM3c1+RRkp0
         +cvN8jg+YJ02k1FUPxLWoFLVl43N+4YL/4PDwKVmERdIbWcFtmlOiTcISsi3t8LqlxDP
         xi5ZHwBhmclBybHUPbRlL7fhq9lAX4a+TNWuWFx7Q9ZVIcKwc2IzURSayZjzDEmXB6xP
         gT2jne04hMh8eANrGD0KIpZfFDt8csdqJ9FkBF+ABRok0J3zjvx5XC8f2gYuuuXmu4N8
         az5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725018966; x=1725623766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g0qYXdweblof+d4zDg0csLIusMtS4NAWZKZItJ2G/hc=;
        b=XesEmSivfa0sQeiMNphzZyqBfVVdg+HceRxi/oYENdV0n8REbQ1345yXGIA/WMOBQZ
         aaPAhU3gbWuCl5aR5NaO6X/1bQ+50/aeQECvJIl2NJj89Rm463VqgyCIyjNcT16wicEh
         bXUMgM+idZqDUWgbjAERSLxYB5jwd3SWnNnUc9pH109ZUjaJgbnDpyiXIb33SvDIOHOb
         hyco2tOKu0Pyle40Qx0awKlD5/X5+h3VnNMVbd3x+F6rwJl0PJ9GmyEvjxz97zk17AqJ
         EqA4Y0b7y3fJWz4ICpXfn7SAVvBaTGETNoqYL+Z2ZOg05nv8uIDAp6J0Ss/vz9FSsuaX
         kG3A==
X-Forwarded-Encrypted: i=1; AJvYcCVD1V0pKfIMkib4+jpb31iNSUF25XfTH2Fv3m192HSAw3/QSPDT40ay7pzBsh+4PzsDL937CjNGY8fU@vger.kernel.org
X-Gm-Message-State: AOJu0YxyLLRSeXl87HW1WoSoPhkna/7AAEcH0NW08lkpGHeh9w3bwife
	Sad1zeAy79/PC99To8pRLKeSlFzgc8/yRB8A8Y7Wn0GoUQGlOVZ2raebSLd7WsCAeOE5vjIn802
	AeAE/3Tt1bulHamRo/+3ihwGHZRrR0m0RiPNwtA==
X-Google-Smtp-Source: AGHT+IEhVXXIgwo/6ASpdFFF5AZjaTOeKyyZK0GOqTEt+wGYPxxNJSILIeAnEbT6DYaa/jQlNjiZpOVwSqoK7dzPOr4=
X-Received: by 2002:a05:6512:e94:b0:533:483f:9563 with SMTP id
 2adb3069b0e04-53546b8d711mr1185811e87.45.1725018965745; Fri, 30 Aug 2024
 04:56:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240814061315.112564-1-manikandan.m@microchip.com>
 <20240814061315.112564-5-manikandan.m@microchip.com> <275606ea-2740-471c-b998-353ab6808591@tuxon.dev>
In-Reply-To: <275606ea-2740-471c-b998-353ab6808591@tuxon.dev>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 30 Aug 2024 13:55:54 +0200
Message-ID: <CACRpkdZbGqy+z+JoMoMXt0jmCCjuHUVj0q6p7QS1VBAKby57sA@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] dt-bindings: pinctrl: Convert Atmel PIO3 pinctrl
 to json-schema
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: Manikandan Muralidharan <manikandan.m@microchip.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, nicolas.ferre@microchip.com, 
	alexandre.belloni@bootlin.com, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 24, 2024 at 4:35=E2=80=AFPM claudiu beznea <claudiu.beznea@tuxo=
n.dev> wrote:
> On 14.08.2024 09:13, Manikandan Muralidharan wrote:
> > Convert Atmel PIO3 pinctrl binding document to DT schema format
> > json-schema.
> >
> > Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>
> Applied to at91-dt, thanks!
>
> Hi, Linus,
>
> I took your Acked-by as an OK to apply this to at91-dt. Let me know if I
> should revert it.

No problem, as long as it merges just go ahead.

Yours,
Linus Walleij

