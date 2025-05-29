Return-Path: <linux-gpio+bounces-20762-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DECFAC7F5F
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 15:59:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DEFE4E6191
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 13:59:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 354F72288FB;
	Thu, 29 May 2025 13:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cg2PB2Ns"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17510227E8F
	for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 13:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748527161; cv=none; b=NtKESTfiyvYgikmID6b+apC7e8PyQE140fQKYmtc0xiZsaFMsT6aQaIigdb7NQ/T5SSMVrX9Z8Lws0jDlEow7aJDrSs9b1v2HZ37z/GS6OcexX5isl/AxVfTYSNEHGJYK+Ygj6tVOvYMU5as29xQF5qlIRqfpYDY0EWbIWqOTnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748527161; c=relaxed/simple;
	bh=7LbxeiQ9CUarb7MM6uFQy9Q+5QfMHyPo1PcpNWESj6g=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cwmPOOtQydqPNT5Ed2H6AbP2rgKt41iHn2O3M51DGHQroqKHuLwwCn7sZbaczrRbHIFSGh37TEMK2uG57QBd+sY1lwx+Uq0zyYZPwdAIQqGJK2vdo4tjG8FT+KVNTGYHbkjm5/WNj0sA4ZjBH5TxC4Qb9y+aqJv09FY+LigW7n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cg2PB2Ns; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ad88eb71eb5so111203866b.0
        for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 06:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748527157; x=1749131957; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bd/re0W0O3SfKxkSQq5B/C3J4e51HN+gv/k4x6dlG2s=;
        b=cg2PB2NspTTW82Qn12xK+O8KVnbJs5xRi261SUqSFQDkvz2oP13dKXJAprPXik5gKT
         xsqODPzQ+hRtKPLed0FyKS5UXSBVKXoph1hfNVJgwI259/TW6yJVZy++FprAh+lkr0FH
         zrAoJqW2XDsDaxazpMJVEEuQ45y2WZxeXBe5hYO3IG1oL5+9CoIdDVFvOnc3CW3+Jicg
         ovYKx5wt95SXDO2zD98anfDAnCHMRGevdMe38Xyg7sfFIpGD1AkdkLNmICtX7KLTynjz
         Q+4j4biALOBjSABx5Gf0UCivsGJexFRJQzF60I7i2bY5XeCAoriPrrqT6B6WQNQ+W84+
         nEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748527157; x=1749131957;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bd/re0W0O3SfKxkSQq5B/C3J4e51HN+gv/k4x6dlG2s=;
        b=r+pVU1S9+53nYiYzL8K0bVuiipMaMD/HYgJTdBI4wQPsxqIO03ozv1R/pWnb9kE40/
         UJuRSdn2ZpJwQ3pz+S8ZHWUalsvrb8xEbiVdkT2AWuqlY9mevaQ34UuW6MayZYcWL/fy
         LmAlw8JPAWOMkhcA4EkwZRnS2T5NXoWWypQapkCVVCfDcTjqmiAl/qmqNsfR+yNSSWgO
         2aA+uDiJTQ+au2mrcov8+CaF9xKUJ6DaZQP29enl8Cl+l54ToHQl3xb+NUYqGUbO34dw
         PapCF+o1dRXkLBALSNy0i0jmDkZ1HDF/TJc51+fRbmIgo4ulVlUrmEEFiuqYdJKJ0ChK
         GSPA==
X-Forwarded-Encrypted: i=1; AJvYcCWuPwbyikWz4q7/J9htkxpmTnev1ZaNNC5UYa0tftu/Eq6/EgD+3wwqx9SvF+wH9YIboB52KuWJFYx6@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/+63XobaaAAstI9EBEYom4vGnX2HSX6V8pQufYcN6gr2VMvIw
	+mqr4QsGa2+JpScFaBTuM+F92SwjX03PYLFaO+vDOQdtV04pv4sy9r8iBjvz9YtXKis=
X-Gm-Gg: ASbGnctGhHynpwsdAdf1IqGtDySXABGExtZaj6sjIUGYXe9hNtEDDB4jD9WeHlrraZM
	4BffhAchJLF3h0dlp6AQ9IR3It2eB0uYNg74hUKWX5k7G62PGrRNyPD3UVMcARIsqUjjkrtOTBh
	s0wpSt9VSWmlxrQyVhDOqCbdgEb/476nbsm71kMRPfxKO/GGHNhDTbES63T+iiYiccSv2D9Bq6m
	Br5EhjEc0s+UHRn2ixQu4wPkTC88lrSLi/iGgdVtI0MT/mPMGgFVYD7eoETrd+A9TUBiiJ8+i1n
	Bc7OQe3s5sM2yOnZDcAn7Hw4ATPrtOdoOBZDQAcm2dbpFzV7AMIx6V8FFhOcEIClooUWkTJry15
	uDeKanxR6OdnG3sxywKE+hg==
X-Google-Smtp-Source: AGHT+IFe10hNzzDGzxOKftk1BYzLU57XNvgcDOZ24VhiK0GAx5icGmaI6U2aVUUNIweLENXOhsxpSA==
X-Received: by 2002:a17:906:4fca:b0:ad8:9878:b898 with SMTP id a640c23a62f3a-adacda56014mr193178466b.9.1748527157319;
        Thu, 29 May 2025 06:59:17 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5dd045e2sm148109966b.90.2025.05.29.06.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 06:59:17 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 29 May 2025 16:00:52 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
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
Subject: Re: [PATCH v12 0/13] Add support for RaspberryPi RP1 PCI device
 using a DT overlay
Message-ID: <aDholLnKwql-jHm1@apocalypse>
References: <cover.1748526284.git.andrea.porta@suse.com>
 <0580b026-5139-4079-b1a7-464224a7d239@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0580b026-5139-4079-b1a7-464224a7d239@kernel.org>

Hi Krzysztof,

On 15:50 Thu 29 May     , Krzysztof Kozlowski wrote:
> On 29/05/2025 15:50, Andrea della Porta wrote:
> > *** RESENDING PATCHSET AS V12 SINCE LAST ONE HAS CLOBBERED EMAIL Message-Id ***
> > 
> Can you slow down please? It's merge window and you keep sending the
> same big patchset third time today.

Sorry for that, I was sending it so Florian can pick it up for this
merge window, and I had some trouble with formatting. Hopefully
this was the last one.

Regards,
Andrea

> 
> Best regards,
> Krzysztof

