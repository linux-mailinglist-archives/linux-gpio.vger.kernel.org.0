Return-Path: <linux-gpio+bounces-24553-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A748B2C38D
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 14:30:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD44F1892945
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 12:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 922E5305074;
	Tue, 19 Aug 2025 12:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UuJvqFvd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D629305079
	for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 12:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755606212; cv=none; b=E6DZ1rolDDeNkgsifkjalSUxVE+S6XF5/m8WcXYs8f/hPZgg0cM0vLOAKnpUPFAZna5wnMUmqI+sbPOIg5c6LiEBo05ANSmkCalqR++gQa66+Q426Hhem4j/rCYdsrdmhrjKPWTqwaU8mzGHUZSHDuKQnR11Goa/E9wHbquk3co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755606212; c=relaxed/simple;
	bh=iiQQlEftWDHeZ442gvLmUIzyr80dSO6bfAzIWf9nGzE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CFjt6ZS1Jr8zrdHu8Rxn7cpn9e7TNd4kupnRU47c4C6fUt58ifIRubfwUQ8/F8P7Fx+rRuQVa3x2DtAXHnoW7nH8+5bO67keekkcJPOS4bhGHOQ6yQs1XoOvd/VhwKeo7Xon++pmpCRzOtXEq4L/wXHv93ZgSPW44MDRipJqvr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UuJvqFvd; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-61a1c6a5338so3047406a12.1
        for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 05:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755606208; x=1756211008; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZNet/+lY0dGDPv7CdnV+riykcgjZjz2+nmwBWCrU12U=;
        b=UuJvqFvdtrKA5J7rMA8yhI5epgo2CQ+nlqFcYa+vKBguTrNxBxQE06qxbOsz+YWlHf
         QfnEHp8NaGZlSwR+2dLTM8Zke7vSlBaU1kGQ+/TN+FD/duQ/MlH6gPfjmVG77GSHBEcl
         +/P3nSgQ+vj12S5TW61/V7XjrupBrBREPj9SUHw9Z+NbG1FCuignQ/t8QzUwhCH3/Ufk
         FOJkLE8i610/GYfxGcIoQdwYDZODOxzmY7jrALT7FypKungobW1RVgPBA/1mv3BqLrY3
         Tg/BMAakHbaVv/IY3+CHX73pi166CYwdYprKdyxNu6Oty7fY8OhwfaqkHc+iFIL7g8gy
         ADEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755606208; x=1756211008;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNet/+lY0dGDPv7CdnV+riykcgjZjz2+nmwBWCrU12U=;
        b=YYsvBVSS+5MNIf1BQzTRWGbAhyRMuqdNgNPSVgnM2JAnN/KGB42NKlqVcmm7c3k9JG
         pGqPmNPNYKCs8uv/gN+xIrhpjYJ2bN2v/90IK41C0j8zAGFRKicxPxxcBRI1u3LovLFY
         rhvHeZ60wMGd8VKtNYzdbumo3qGZDHFLu7oEunSccw3NNT1AJxkOOkC7Isobb6GAi4Vp
         WNCWaNqOlDhDZDUwqe+2Adra/09F1xYK4YBN0SzGAEH3Y3rBzH5uKXl31SGemQqdx3uJ
         YbepoVYwdxD1yj1i8WOeQnDo6VLf8GBkSXBZcJ/G4oC632beIF5krmP4pZLmeSf+CfKx
         6OHw==
X-Forwarded-Encrypted: i=1; AJvYcCVJpHOY9eH39XONLKmRq/yR8192vldLGI6P7k0aRshFy5qoB1OYeAyL0WJaRKhTndWHyM/Cj6H089vV@vger.kernel.org
X-Gm-Message-State: AOJu0YxRr6dFA4URZ+0VBWu0UVXvkYhShsPhP3ez1sThCiQShE/OSS6U
	TWwFLY8Zt4LqllznDiaSRjtphljzonfabM6UYNf+tXJ3GZseRBQbvNgE2PfqN++xk0NgoI41HSk
	eKujijFY=
X-Gm-Gg: ASbGncs+exoVB8kaWBVf9Kzf6VqXh/8PK6oe1Z9dnUnqiDwL1cYkpJyxT7uC0lJ0S3F
	GDejTKojLyoduqEI3FV+dfnUbNItVqOLwTQHF9XwL7bxa8JZ/TBM5bq8ZWWLEOz+jWen5T/UmbC
	IeZZ/wTd1aDwwhVXJT2UbDHTUj3R04GU/mJrchz30w/dYCJ8UfT50OCJCP5KIf9bzv7uoN0bJYk
	w4qboPyKyLMeHA9T3YLVAA2X0dEAP3ipmxFvr/xZvU7yc6dVtxKayMDbmin9/V0L5pDyllLKp2C
	Z9EHbVlr83GfH3fuBb17lSWZrUAbJ+MnZNAoGbyKoy/t66v+27BlMtLSe3/NL2FkokYyuA0ZYxJ
	cWqrozB2U/jRYEq6tKFn89HpmA5LzmXelGu0h27Vdn/J9qjSr5ZBIOZRZVqb/
X-Google-Smtp-Source: AGHT+IGBR9LjrSdYCCyx4joMeVPXsUe/7J9VYrQBtQLP6UWnN/NWeqjv/7La8X6OrPIYcB35RsOs2w==
X-Received: by 2002:a17:907:948c:b0:afd:d9e3:953f with SMTP id a640c23a62f3a-afddd21ce37mr238165066b.63.1755606208358;
        Tue, 19 Aug 2025 05:23:28 -0700 (PDT)
Received: from localhost (host-79-36-0-44.retail.telecomitalia.it. [79.36.0.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdd01ab55sm996821466b.97.2025.08.19.05.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:23:28 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 19 Aug 2025 14:25:20 +0200
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 13/21] pinctrl: remove unneeded 'fast_io' parameter in
 regmap_config
Message-ID: <aKRtMIzJPCSNdLlf@apocalypse>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
 <20250813161517.4746-14-wsa+renesas@sang-engineering.com>
 <CACRpkdZgmW9MXAKbMxQ9dHz8-Oi8pVCPqnV5OE3FbA4KT+0yQw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZgmW9MXAKbMxQ9dHz8-Oi8pVCPqnV5OE3FbA4KT+0yQw@mail.gmail.com>

Hi Linus,

On 14:02 Tue 19 Aug     , Linus Walleij wrote:
> On Wed, Aug 13, 2025 at 6:16 PM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> 
> > When using MMIO with regmap, fast_io is implied. No need to set it
> > again.
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> Patch applied, rebased on top of Adrea della Porta's changes
> and fixed the two new instances as well.

Many thanks, really appreciated.

Andrea

> 
> Yours,
> Linus Walleij

