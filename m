Return-Path: <linux-gpio+bounces-11873-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 554909AD4A8
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 21:25:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D1B71F23301
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 19:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 275431D1F4D;
	Wed, 23 Oct 2024 19:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FNGbsmLX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245B419DFB5
	for <linux-gpio@vger.kernel.org>; Wed, 23 Oct 2024 19:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729711521; cv=none; b=RmnynzO04GJEeFoJZ4Nl7Kz9pkIoF+GdNEom0JEaH4aYJ0vemWtw3hKVMf38dMF+LzsV2r5wQVjrPxC8HqwDLgH3HWlbfbBj3dGxLV7d/LQH34OBC0v/3hasKaBdgvzXnZz+YHDecJ2D21LueM2CcYTKrrWuJ1GeVxDK6nHb/UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729711521; c=relaxed/simple;
	bh=jVfaEMDiqxEbMojHP9PBFB3cC/z3et13Xb9WEIyCI8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fIUioViXzp6SbMuCkDuEtSTCgzop8C/OfHDISj9wkbKNYNubm/xWjAO/GpzOG+SccOW1xQLd0GPZU7D1DEsX7WQgwWwbfttAnd90INQRekexjWoPPPLDw3VucxgcehqlM9CJ/l7YXL9JVJ6VbHK965WZJYhrcsoG9miqCB2LGlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=FNGbsmLX; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a99f3a5a44cso7548266b.3
        for <linux-gpio@vger.kernel.org>; Wed, 23 Oct 2024 12:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1729711518; x=1730316318; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hmLs1fnyFuhch9ym0D8390T3Il2G3hywHxmDwOxNics=;
        b=FNGbsmLXPZI6Avc0gmC3hTHsRiHcV+GnQITmWelRuQdGbuRhK3J0BDxgP9CXzuLCS6
         zZeYTy/3Mr7ViWEELOY+PRI1naDJOVnETmHvQH69eSAcT+j4stcxwtehALGYLt7+g424
         kFHKlc5TCYKekkhz5h9b2AnwFKw6o6XZD7u0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729711518; x=1730316318;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hmLs1fnyFuhch9ym0D8390T3Il2G3hywHxmDwOxNics=;
        b=GXDCFFz90gk6ojGsGSE8nQPWhlCovcPGO78Jxt7TW/H0RL55FKG7vd13/N5BeK3PoB
         /RdVntmww/oWhMivhlIhSGEkiQtWYCzi3UQ3nsx4B+GJn6We1VPbnuS+oKr8nkfPWu0o
         KdygBxeJnHYTWoSZFRRxLml77cp2mnZq8W61eAL1wqR35rLJqBZ7dEvfGD9BPFdjyA+6
         G5aYP9YJziAjDxcPykBidexjFHnAdGSR86iCdz6L3uvrv75R+QXRU3bHtiCHQKOMdoW1
         b0oCdiYsHMH5UVo6fHSPKKNOrhZR7jmhuTYw3qr6KFtNgc5IPEQqoiz/xNo9Eta3J5mz
         D/bQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2g83wVqCbe9ib/DjtQAzkv609iT6VQtSoRz+Wu5Zvj7iWJyKJ+B8+rbVeWIFdGvP/27Xzl0qwcVDu@vger.kernel.org
X-Gm-Message-State: AOJu0YzhEADpBpTVv2xcO9ueRIaVU7vSxwrPQZZs37ziPV33ej+3QWc0
	xjBkOAj8BVAlR1DZ8U6cnXj8dRQoOQjxTFX+aFRYI+kstD1bSt3d3/443j7f4rVhTIeJow0Afq7
	qLJbeWg==
X-Google-Smtp-Source: AGHT+IFpi7bzcp3rktVwpuo2biJ3j8OOv4QpfPWzTpDAjQD6xL+4eX42oisFNfHjxRXAYhv2MXPnXw==
X-Received: by 2002:a17:907:961c:b0:a9a:8034:3644 with SMTP id a640c23a62f3a-a9abf864274mr339667166b.14.1729711518179;
        Wed, 23 Oct 2024 12:25:18 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9acbdb4d98sm50482866b.149.2024.10.23.12.25.17
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 12:25:17 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c9634c9160so154634a12.2
        for <linux-gpio@vger.kernel.org>; Wed, 23 Oct 2024 12:25:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUXrzHoj3lVtj4gyMeDn+z/sprnA0Lzj5HgXbczrkGrjEATl3Cl3LpLPRQiE97rA6Vaal5poq8upa+Z@vger.kernel.org
X-Received: by 2002:a17:907:72d5:b0:a99:f4be:7a6a with SMTP id
 a640c23a62f3a-a9abf91ed4fmr407338266b.47.1729711194415; Wed, 23 Oct 2024
 12:19:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a08dc31ab773604d8f206ba005dc4c7a@aosc.io> <20241023080935.2945-2-kexybiscuit@aosc.io>
 <124c1b03-24c9-4f19-99a9-6eb2241406c2@mailbox.org> <CAHk-=whNGNVnYHHSXUAsWds_MoZ-iEgRMQMxZZ0z-jY4uHT+Gg@mail.gmail.com>
 <e25fb178-39fa-4b75-bdc8-a2ec5a7a1bf6@typeblog.net>
In-Reply-To: <e25fb178-39fa-4b75-bdc8-a2ec5a7a1bf6@typeblog.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 23 Oct 2024 12:19:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjw0i-95S_3Wgk+rGu0TUs8r1jVyBv0L8qfsz+TJR8XTQ@mail.gmail.com>
Message-ID: <CAHk-=wjw0i-95S_3Wgk+rGu0TUs8r1jVyBv0L8qfsz+TJR8XTQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "MAINTAINERS: Remove some entries due to various
 compliance requirements."
To: Peter Cai <peter@typeblog.net>
Cc: Tor Vic <torvic9@mailbox.org>, Kexy Biscuit <kexybiscuit@aosc.io>, jeffbai@aosc.io, 
	gregkh@linuxfoundation.org, wangyuli@uniontech.com, aospan@netup.ru, 
	conor.dooley@microchip.com, ddrokosov@sberdevices.ru, 
	dmaengine@vger.kernel.org, dushistov@mail.ru, fancer.lancer@gmail.com, 
	geert@linux-m68k.org, hoan@os.amperecomputing.com, ink@jurassic.park.msu.ru, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-fpga@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-spi@vger.kernel.org, manivannan.sadhasivam@linaro.org, 
	mattst88@gmail.com, netdev@vger.kernel.org, nikita@trvn.ru, 
	ntb@lists.linux.dev, patches@lists.linux.dev, richard.henderson@linaro.org, 
	s.shtylyov@omp.ru, serjk@netup.ru, shc_work@mail.ru, 
	tsbogend@alpha.franken.de, v.georgiev@metrotek.ru, 
	wsa+renesas@sang-engineering.com, xeb@mail.ru
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Oct 2024 at 12:15, Peter Cai <peter@typeblog.net> wrote:
>
> Again -- are you under any sort of NDA not to even refer to a list of
> these countries?

No, but I'm not a lawyer, so I'm not going to go into the details that
I - and other maintainers - were told by lawyers.

I'm also not going to start discussing legal issues with random
internet people who I seriously suspect are paid actors and/or have
been riled up by them.

              Linus

