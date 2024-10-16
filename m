Return-Path: <linux-gpio+bounces-11465-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E619A1272
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 21:25:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7282C28640B
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 19:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0E972144CC;
	Wed, 16 Oct 2024 19:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bSFquoqe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D975F2141A0
	for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 19:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729106716; cv=none; b=MJuo1my6KbPeAyk9uMIU4DnupBcBkwBGCXlHxi8a0IcFW+NWfzP+t1/33I1niRgJ4Ewdq3saAvhQs/OVY4FTDqQ/UYdDYg+w7zq4g7rxD5O7285dE6l+8hs7Fzm6ve/Na/cqPVbw5za7bJuLScA3qUryRN4tIw6bROn8evwVXPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729106716; c=relaxed/simple;
	bh=wNxPrVxXoi2e1Tzvafjzv1SOgOIdTCJ/dCL9LHe1ia4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VmtwuVtll5ROmaCCbtWmhWCCLNXqIxSdAlQ3cbUkPUWZN2IeU4qvSD66XT/U4z86MVV5gAzoirrsPWyOWVW8bvBy4FbBKWv+dCYPPJI61qpMZJDNp8DyDIhs9hyoDBobia4dWBYYfKNETzH8AQICgxg2PKgulGQdoxUboQsZt1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bSFquoqe; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e2e41bd08bso3344527b3.2
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 12:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729106714; x=1729711514; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wNxPrVxXoi2e1Tzvafjzv1SOgOIdTCJ/dCL9LHe1ia4=;
        b=bSFquoqeHXOG5dOx2RdRCl8HrtgIxUqX2Q0I/05WZR08C79Mhu/84GftwkpCZ57y3W
         CkIWvytlZJyJ076GCAorIaMoxIzVJ5bMLWzKZTm5pLYjeKr8uF/O46tk9ZnzGUnsCvDc
         VYuaZ/i5GD7JF+KAyr8ShXwHeMDrHAGAEIHuep43GYZUKYkFl2OjNHUe1CjotMQQpBWe
         gJ3KEQg6EPlPnwahz3YYV9QhRYCmLHd21YysXDwEsY2Ewxyt+DCnQbrao/zaIssrJ6g+
         yb0pQ3FcKidkeE3f3t9/0CBnFQp43gTZpufJAtZ0/7eY6dFOCyGWVZSgvWJ4QwI1CDMR
         xAFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729106714; x=1729711514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wNxPrVxXoi2e1Tzvafjzv1SOgOIdTCJ/dCL9LHe1ia4=;
        b=TWnNj5Dv1jgRR2LuBI2oVJ46EyhQKUGWYItWJ14jv2D6xlncRJv1Zc5PsX12ioFcKk
         3b8lAoOWxqpa6cTmh1HPm7i7WUW5jNYrwhF5lC0X8mo0V60tP4pVMN09JdCdKdLa67jh
         lpb6JmP7JPN6aAyvtrzZkO/nFCIzwMmpns/SGXlettVyEmyiq7tpV98rLWJjnDUNCMw5
         j3j7g6nVNLWNVKidVLPVS8nTE4YhgYdIoANBX0ZJ5ElMs240qDF00fRFrznlAFM2qhyt
         GsWEmLiikg1VzsgY7AMq+BDcmFZ9tWGaCj+P7DuQR06b1B5cOAZ1shWwixTgfpvc7bxV
         IX+A==
X-Forwarded-Encrypted: i=1; AJvYcCXuISQgBEtFAHElSwm7g/vFbKVfZvQdJWDfw/RV9XAM/60k8UgXeVuY1dEpikEsoXzxKXEmLfIhF7pQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2vV6rGrPJUKRprw4G+4TC65QfGmVgNZBJe2wXJ7G/rLVyA6p9
	gY45Owm/cdi4EmXsu1bc5v2zfYBviOXRSOJHVuyKj7p8wDUgbXcUDRZp+0tGBbInTRQYw3uaE+l
	F35A0q/NXIaQt07bt7TWgPNSuop6maib7mxJZ7w==
X-Google-Smtp-Source: AGHT+IFBVw/RdlGqnPnp7qsotKzxhR9ZidNG2YXblCllHBleF/Mnxzr0wnJO+4NvNGIVA03KRekKbqt8X8YZP+lN9oM=
X-Received: by 2002:a05:690c:6703:b0:6e3:3407:8579 with SMTP id
 00721157ae682-6e3643c9b62mr151632797b3.39.1729106713924; Wed, 16 Oct 2024
 12:25:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240723-supervise-drown-d5d3b303e7fd@wendy> <20240723-underage-wheat-7dd65c2158e7@wendy>
 <CACRpkdbRE695f-+do1HYpOZ6e4qxgUBWJzEPO2hTCuZ3xxYHQg@mail.gmail.com> <20241016-shallot-nerd-51eeba039ba0@spud>
In-Reply-To: <20241016-shallot-nerd-51eeba039ba0@spud>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Oct 2024 21:25:01 +0200
Message-ID: <CACRpkdZZeDyHJPZBuqnK1o+nWXgSAgNO7RceYB3Ao4tEOGRpDQ@mail.gmail.com>
Subject: Re: [RFC v7 4/6] gpio: mpfs: add polarfire soc gpio support
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org, 
	Marc Zyngier <maz@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, Lewis Hanly <lewis.hanly@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 11:56=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:

> I dunno if I'm making a mistake here, but I don't know if there's much
> value in implementing this suggestion - as far as I can tell only the
> get()/set() functions can be replaced by what's provided by gpio-mmio.c.

You're not making any mistake, you know the driver and hw better
than me.

Just skip the GPIO_MMIO if you think the result would look ugly.

You can add my:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

