Return-Path: <linux-gpio+bounces-21725-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59513ADE76D
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 11:46:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B1FF3A521D
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 09:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA31285040;
	Wed, 18 Jun 2025 09:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Qupafl0c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B432F81720
	for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 09:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750239941; cv=none; b=geKr917iJSp+m+wGGFG76h65Drw2p0RQ1p+jdkZzeQuX2lnGLBFScFjiqmRVVOs3I5yvJWeQk97M7BD+gBFFBHkOAB4EbAUHvgK6aGrIS9JwOHSCOYoi/DQzuGGZMsnoLaPWU4cHWpwMR00WWdGxhBwjdb7Oa2h2hKXxp2MWp54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750239941; c=relaxed/simple;
	bh=iAjLoMsszcwu/0Vb0KghUOteF+dXhpPUULmxrg+YQxU=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VRychlL6/eXR962p8keFoINU+QO+6QoeEURopqVbzKofD24ArDQb07Rx/j6g4ERSRC3/X6OYuj1PIYG4BVYqVVl9OBlxV69j88/uRV+40N2YP6cDkUyFxNvcYDcRIZgVTcuCt6ngYhbWCSR/yzEiv+4DhevplTjcWHzMRGCFVa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Qupafl0c; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-adb4e36904bso1295033566b.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 02:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750239938; x=1750844738; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UYnRFTZ45S0BZCYHJEL9/estxYeR2eD0JqS9fCRB9Zg=;
        b=Qupafl0c5CMMKlHN7UvUZrt/02ySqRGQpRAnC5qKjbRYjkqTLAMniB2gGJwOWDcYYA
         RAG4LIIOepVqdNxJJ5QtX5Zizs/sZ4ef7KQzgDot1F3FYYZIGWR70raM5X/d855K4Ile
         QtSHCO85ZvwhZSvehGiplrMrkwezuYMQvYC0cd+xheUti/NVFcQnVXSI/J45jPYicrga
         zVoEcyLbUiokXNk0wmuI+3eoa16RUoBfy8jg0hmuGJSVtOeGtRIbelVF4hyTgjgi+Ixa
         dnM7scfcH9aph4NEjaaonb4apI8T/MgDa9qmaIsEOplGxlEO/JaQFJSPIiRDAY+ZR0s1
         IDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750239938; x=1750844738;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UYnRFTZ45S0BZCYHJEL9/estxYeR2eD0JqS9fCRB9Zg=;
        b=CqpCnkNMI9/+SbRJtN/6BIjwLmHKvxdL8rPVrfFv26lq45sHhj5wFTlOOJWJmAHiK7
         nosi1k0b/+W6wIkLGKxFPPAVo8TQ8KyUe3mWvOJA8PO9OD0Um/iIodTkQ4oNeLggymw1
         NvoMeae5qHXdA1NlsHuQBXs5PUcy9dOvAe9W3tqSVKXDI1EuJ5VPg3OmHYF8dO1hZuqm
         EQQ9nWSCd4F3mCuhKZQj8nnUoqTmdteWQeRagkpBEyR6sxAlJjfeNnL3RKmka4eLFiYx
         c4quk/5yCCrbpqT6pCvLtfDdXwpZ1CawxbxfzzCJW7Jh056oeMh3FByEZU0q9RZsobq2
         TqtA==
X-Forwarded-Encrypted: i=1; AJvYcCUHOTgBDDLCexYiUG0YpSM2lyILD+At6dlqhgmSIG5v6U4Y3hsJRa+94Nf3LbYsZ4szjvGys+4gaM/B@vger.kernel.org
X-Gm-Message-State: AOJu0YwOHoxEU2U0H8EgjA6qmMMmgAalWhC1YIyT5KqpNCWjnhoEU42E
	Nz/2of3Yrs8lQmvsn+JSccZMKP0OFLSC6D//V7bjBp2jMGatZq+XKmHrvp/DMQw3Ysw=
X-Gm-Gg: ASbGnctFWOo87QrMmI7wig/Mo0vO9kcOd+Bo0YOskf1Kd5FnvhbLdLzKysZRU75reMh
	4cdmeNsuv3X8jsJNlsO1SODJLSM33mUmX2GVSZPju+UzMCXLn6PZN6RhiNZ9LCCRd5Pi0jLMdTw
	RRUvzB5Eph5k8Hu++CbEBYxR776ZgMGop8a7S1zeDq8uuI3KpoyRQODCPsSTLg47VHx/VrGH6FP
	Q7qQS5S8yVSKcby60ReUQYLazbPW8xHqVJrhNLah/c9Mca8mmQxvAzKBg7bKKs3OjdNikc1Ruez
	qqI90O3IgE3N2sk7P4aP3c82K6+YH1AxMJoaCjl8VMRnBiXXmY3kg4y5iv2JJNQKU9zMtghl3mV
	SKvw+lsj8GB0wAwTNVxyvrO7+q+Ee177KxM+VD58h8MI=
X-Google-Smtp-Source: AGHT+IHVR01GWZaWv7baTcjU5O0kFwotFGhrlpvKdhdubFxB0wxEVad57csE1YDZMPi3+Mm5z4P0Fw==
X-Received: by 2002:a17:907:3c90:b0:adb:2577:c0c5 with SMTP id a640c23a62f3a-adfad5c74fdmr1544262766b.38.1750239938008;
        Wed, 18 Jun 2025 02:45:38 -0700 (PDT)
Received: from localhost (host-79-23-237-223.retail.telecomitalia.it. [79.23.237.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8158d4dsm1015674366b.28.2025.06.18.02.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:45:37 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 18 Jun 2025 11:47:16 +0200
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com, Matthias Brugger <mbrugger@suse.com>
Subject: Re: [PATCH stblinux/next 2/2] clk: rp1: Implement ramaining clock
 tree
Message-ID: <aFKLJELw3JuFI9GR@apocalypse>
References: <b70b9f2d50e3155509c2672e6779c0840f38ad5e.1750165398.git.andrea.porta@suse.com>
 <20250617145144.GA1135520@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617145144.GA1135520@bhelgaas>

Hi Bjorn,

On 09:51 Tue 17 Jun     , Bjorn Helgaas wrote:
> On Tue, Jun 17, 2025 at 03:10:27PM +0200, Andrea della Porta wrote:
> > The RP1 clock generator driver currently defines only the fundamental
> > clocks such as the front PLLs for system, audio and video subsystems
> > and the ethernet clock.
> > 
> > Add the remaining clocks to the tree so as to be completed.
> 
> In subject, s/ramaining/remaining/

Ack.

> 
> I guess we actually get some functional benefit here (something that
> previously did not work, will start working after this patch)?  It
> would be good to mention that here.  "Completing the tree" sounds
> nice, but if I were being asked to merge this, I'd like to know what
> benefit it brings.

Sure, I will add details in the next revision.

Many thanks,
Andrea

> 
> Bjorn

