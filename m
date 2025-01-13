Return-Path: <linux-gpio+bounces-14717-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAE2A0BA2C
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2025 15:47:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E8E51888707
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2025 14:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E6AD22C9E9;
	Mon, 13 Jan 2025 14:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pPO8LK3Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C53922C9E0
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jan 2025 14:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736779357; cv=none; b=NolAcGEH+ds7lZLD0oSPFFY7lIihT/NAx8N+8LwGjaXXXfmW6DjP1+2h7loSOd19XFs13ZF2bQOrTwr9cgAz/qGmYLbsFpuGt6Vk7qq5Bs7zf+fn95nq+/7f3368s1mxyZ8uHnNz/NEQJOa0BSxRe7ovBIvl3OpSnm1e7zqiM24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736779357; c=relaxed/simple;
	bh=7W2mhWlK4BTLc7JxE1Pn3ZSLtHFOTiBo+aWyoKQ1jUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j0IsfnYiqLJFdNVIhtZVWQMrfmroV734DfDgJuLJ9UxZfW4TIDPJeZqezvUfn8Zweonejozz0Kmnmw4M9iovPTvV+0mTIjsrcD4LNhZihPVStUpPKGfgDh3ROWQtdYQDJu03aBdnqD6rWPPsuIm0FJKONA6vIcDcdofFM/jd75A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pPO8LK3Z; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3003c82c95cso32013721fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jan 2025 06:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736779353; x=1737384153; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7W2mhWlK4BTLc7JxE1Pn3ZSLtHFOTiBo+aWyoKQ1jUU=;
        b=pPO8LK3ZHzhtuzWp7Qv6FslshKIVbUM9moWsnJxDXjErWmnt9WSQFmRanC8GmWavj2
         VWSa5I9ZVwtm4vnlKG4WwMGhGfKi3CzMScEtVkKmfOKeesesTBqZFAxtt1BeLKekdl4t
         sdJPeCGdFJG54YLJWLf5zKoCe9cKY0Zr3sjpenN5V6Df8/zklwLsDIi9euf3priKIIpe
         p5OmycaxzSZdxrf+N0k6b/ZuVxWIOaj+8tCAfx9tDzB/srwOxSuri2oPWS2Olu9b0oai
         2Aq7zlEGugacFCP/BEON1yX5ScuMAaPeduSXKL/J1140IHm2vRqiTPhN3x/zRCEQOdle
         fTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736779353; x=1737384153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7W2mhWlK4BTLc7JxE1Pn3ZSLtHFOTiBo+aWyoKQ1jUU=;
        b=g85VBE8FQPDZGVQDLZuwSFLLE0polz06mwFhVPc1PbeTgcCpKyI4BBtOymFn9tvshH
         rsj+ZbWOL6IzpYGkCqM3vyoHrOpfWF2uu0wWy/JlOgXItWV5+PofupWZTqmhPI/YFIvA
         am9213E6QctBz2KAUyMRoMvdrp583bwEN+bjVSo4MvQ8QtGJbQTepERnxGQG8OnzVnjk
         fOXuKu/+DUbZNRxEaEV+PVQcI6RUiM5dIcLK0NjboMjLY9Q2gMJdWxTvq0xJNdtB2gdq
         qbOc2cx/BovW7a9hONcxodrvaa7u2hL6KvFYtcNMFfKYqIHvTaJBRxpFxTh4L+78AmVc
         Exkw==
X-Forwarded-Encrypted: i=1; AJvYcCXc4UxCNpQcdoLLl4/71jRlQXkR3GqGN/hfbWsClB/i/ZokmVwMijwaif9cvluvtMIIytSoCo2R4sWu@vger.kernel.org
X-Gm-Message-State: AOJu0YzSHQskz8iDXxqc7/xH53mAeQVzqscueaDyoCh1j/DiPvfHD6+R
	s2p/EYdgZ3t5WHDqoqrl/ceLmdzlZ6UqcXVTXyUsmiCroRlnO6rjWBBiUTIVZWA6epeilZklXU/
	5Sfwf5hYps3QJRn2IvtgPqQ+/hy2TFqmaIVmTgg==
X-Gm-Gg: ASbGncvo2qlnvVVUs4va+gaUxByS0zb2ZXxCFDAoinx4AvRRK12CTEb1O2u5EheTZWA
	G5OZU3BSg8/vfy7LCCNG9W5ue7xpJYFm4/Z33
X-Google-Smtp-Source: AGHT+IENOE2ll5qeBQdJ80yylesb06tRQDSUG+UU61Vm3q3uDxQQ0+DlCXsReKBTut8XEJ7ObVreQKDUPla+i1+OZQk=
X-Received: by 2002:a2e:bea4:0:b0:302:4135:7d99 with SMTP id
 38308e7fff4ca-305f455e7b4mr69133281fa.4.1736779353384; Mon, 13 Jan 2025
 06:42:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250108-fpc202-v5-0-a439ab999d5a@bootlin.com> <20250108-fpc202-v5-9-a439ab999d5a@bootlin.com>
In-Reply-To: <20250108-fpc202-v5-9-a439ab999d5a@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Jan 2025 15:42:22 +0100
X-Gm-Features: AbW1kvaddZgkHI_ZE8MDKIDy3uHycNLLq64wY8GBa-n8x8phy3UrJ9DEp0n2mjk
Message-ID: <CACRpkdYgJ_rbrTWh0HS-F8DJJ6u48uqr-zQ555o3Q4mYnFhjXg@mail.gmail.com>
Subject: Re: [PATCH v5 9/9] misc: add FPC202 dual port controller driver
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Kory Maincent <kory.maincent@bootlin.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 8, 2025 at 5:14=E2=80=AFPM Romain Gantois
<romain.gantois@bootlin.com> wrote:

> The TI FPC202 dual port controller serves as a low-speed signal aggregato=
r
> for common port types such as SFP, QSFP, Mini-SAS HD, and others.
>
> It aggregates GPIO and I2C signals across two downstream ports, acting as
> both a GPIO controller and an I2C address translator for up to two logica=
l
> devices per port.
>
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>

From a GPIO point of view this looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

