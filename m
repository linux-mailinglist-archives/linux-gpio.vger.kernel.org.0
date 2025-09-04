Return-Path: <linux-gpio+bounces-25615-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0B9B44645
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 21:18:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3EB87AD989
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 19:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6E3B26E702;
	Thu,  4 Sep 2025 19:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KBgt/5sH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCA533997
	for <linux-gpio@vger.kernel.org>; Thu,  4 Sep 2025 19:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757013486; cv=none; b=oNCDvJzAdB7suKzkrUniRf6f4E0zWKlpLS2lit1cX3eh2SnsPbl+q8BgAUxBWw0wta/k3BV9zIxVnMqKjdWU6XSAltq2lCbtrBctiev34bahwNMNBzQDULHPoKpaAYfIpsu48hd+v+9YhYHGh9gICrnhLZFcSFzamgg3uaD2s+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757013486; c=relaxed/simple;
	bh=gWbxFQ6x7UcC2lbZjKJgloxh5fAj8MyhODzBvH+P2P4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SP7CFeZdOJwRuwH7+i8zxjba2zIlRiU15frjMJxe1ir81jhuKC7Fj0hcCoQIZm2oV+x5SgxMJ4D44gPO7TuUtCUfzZlKSQ3hvQu1BOBFOGojQfrakTKkHOvi0JxKmFZfJbhUnWYouxnNywwGXbKQJUps8deALtcWDn3rIcKe1HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KBgt/5sH; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-336b88c5362so13525551fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 04 Sep 2025 12:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757013483; x=1757618283; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZF5lLMA7h2yx16E/Z/NbIZblFHx04/IPYs+dkVSu0nM=;
        b=KBgt/5sHrM2l3a/1CVjYwG8yfaSHV/FyGfYg5AChUS87pDvvcTk3QORGe2kwKeUcwi
         J3p5tWH6lLScGwlWOTACneelzUqEHoeTvsfj50p87SWCZWchqiWcXeX4N8tZFiLymtp6
         1mJ6g6+eSyrFg8dqurY0bLfAJWHvOqEjFcpyGT/L4swGjw2PGbOi6Dg94QLxdbI+bs2X
         0pfyV7l8sXiLW+ToKpiZ0tw9wOSfJDzG7gab4bpX1Bfk3fkj/Snpa5t68Kafo0hTGf67
         4Qe59PCmvZOwmWXpLH7ez/x1fUngriXFocomhyOLgrTMv8OioZuNkb++h7OOXNYdrNo+
         UDQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757013483; x=1757618283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZF5lLMA7h2yx16E/Z/NbIZblFHx04/IPYs+dkVSu0nM=;
        b=u6WKKywUnq2oqM9csOYY15k2ScSxnv8mAL5ytcE3H+XYui2r+Kk6M4Maj/nVGuJCei
         uIkvzE/SlNDILoO0+mkhLKePjIZV0x2uGWkGBYHPUemkv+6vxbXZYQkfawRApV5iv6dN
         GVVY3wecsIbZ5o4ZKlmkbo8ZaVSQUX6kuVJmUeRIDbZGxMdyQyZD581JUEQyYMUn9fam
         KOybZlhnseVtVBnCeiEs28R4zXU/rRt6QKD0nKh38I/56xXXJ896IT6q4nRplTgUideJ
         ed50m+C1t1Cb3Xo/CrBdSXXfXUFGwLcoL+SawdbP3ZDMNKD59EfIWMzlrnuQBdrZK8Mu
         r7cQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqaiPDvlGfTqTIhalH2d9cJZNqXtN/zQSFVJ6V/Ea7mPGYRzYLcwlZnmpPGdEHc9vGKZHr79x8Hrs0@vger.kernel.org
X-Gm-Message-State: AOJu0YyR+LIBXe7ZPjR4wdIupth+L8B4dNiexXKX7tH+2qsY7Y4OdVE5
	tsXDsByQJNcxhavQ/d2uxwspQ+YVYPQaT615/6RAWGCnD/IeL4ulTFbfks0UXFtY3UgoQJkFuD3
	4PV6tptN8/mP6s0ZqR5EatoEKROChWlB14AL0o4kqzQ==
X-Gm-Gg: ASbGncvLJxbZxYm5jLUldSstpPShzPHe/CmpdjIoE7FubO/7Io4kOJ1Qsse9Qk9GkJ/
	fNGSo+e1By1d5247HSM46R0i9oQvbPxSTqtfGpTXsMRy4Gxs5EPXZdN0nEW1mIkfCBtf5TGrG+y
	Rwg08piGojTBP5ztV9rDNKzZEgJxbopbzQVJyta7ceeBxQTY2jmZ2sqG2B/K3xZfn6R1hWn6pbR
	WC/C20QZu4ophJxsQ==
X-Google-Smtp-Source: AGHT+IE5rwrhvv5qZHz6lW/fqD0gYW2CFROKD+rC1PEOKV3cpUw2gd7Ym9I+S+hnXU1PgSDTxTy2pPIOFXTSby/SrY4=
X-Received: by 2002:a05:651c:b13:b0:337:e8cf:f049 with SMTP id
 38308e7fff4ca-337e8cff1b1mr41377231fa.32.1757013483147; Thu, 04 Sep 2025
 12:18:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1756372805.git.andrea.porta@suse.com> <CACRpkdb8fFvgyWPAaP6AumwHUYhnvc7BXX0V5kwO4sts6zSGUA@mail.gmail.com>
 <aLf1nc20SRkWJW51@apocalypse>
In-Reply-To: <aLf1nc20SRkWJW51@apocalypse>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Sep 2025 21:17:52 +0200
X-Gm-Features: Ac12FXwADs87l60RXY9dk-u4dU-hiNHF0BGDc7fS0K4iRh-4CbDl_UBjzeodFfo
Message-ID: <CACRpkdYNaVQ+NgAhZCiKmU16jf6rtGL02JOJk0w=kezz=YRbTA@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Add pin control driver for BCM2712 SoC
To: Andrea della Porta <andrea.porta@suse.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	florian.fainelli@broadcom.com, wahrenst@gmx.net, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, iivanov@suse.de, 
	svarbanov@suse.de, mbrugger@suse.com, 
	Jonathan Bell <jonathan@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 9:58=E2=80=AFAM Andrea della Porta <andrea.porta@sus=
e.com> wrote:
> On 08:58 Wed 03 Sep     , Linus Walleij wrote:
> > On Thu, Aug 28, 2025 at 2:45=E2=80=AFPM Andrea della Porta
> > <andrea.porta@suse.com> wrote:
> >
> > > The following patches add a pin control driver for the BCM2712 SoC.
> >
> > I have merged the prerequisites providing .function_is_gpio(),
> > do you want to do any last minute changes or shall I just apply
> > the v4 version and fix up anything minor in the process?
>
> No further changes from my side, please go ahead with V4.

I applied patches 1 & 2 now, please apply patch 3 to the
BCM SoC tree (Florian handles this I guess?)

Yours,
Linus Walleij

