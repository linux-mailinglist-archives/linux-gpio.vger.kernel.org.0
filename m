Return-Path: <linux-gpio+bounces-19011-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DC1A91966
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 12:32:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB1D57A80DA
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 10:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC77622D7BF;
	Thu, 17 Apr 2025 10:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eQPWM1LV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738AC1FCFDB
	for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2025 10:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744885926; cv=none; b=gKJFByDC2tCI4fnmkSJBC4sLu8P8vlAAbwJJjBdVZzU1Jh/GSO1GwesFS4Nr0zFn+3AXUZyEFN4lpYZ5KiwrWxpixWuGAfK7ic0E6peXPl+5M8FLk6txcXYoZl5+L1DKOLVG4V5w123AVGrRkN1ywB4Hz1Lqtt4AhShZaQ6cYso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744885926; c=relaxed/simple;
	bh=fEIfKJCBECnECwfB4LdSmyQH2scRAHFyA49UsvEKbfg=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CL9DC0m0xes+IWjX8FcTYTRDABJSJN0AlxIeL3w5VvJFtZDMTb9fgMsv6sFwIjVsDmJviYsiu5uYsGkVpuBaazm1kR26PX6s/a5qHE005s3Jv0RxRArZPVnQ3tiRGhy5w+GpG/Ckz+Qr8hBoiNh8QDrSBcQVKl3vfvrXDmfyVp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eQPWM1LV; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so5385245e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2025 03:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744885923; x=1745490723; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tkf5fQhiQh/YIIyCMZKHz3rsbVF+Y8xcwtqk69ZSgPg=;
        b=eQPWM1LVon6NKdin+4cDYHYf7hoYWHpOMR6JPhEf0HCdswwY4m9tRJ09vRHAG7XiMD
         c3iOyBsLWZwAH0Jq//RROW6UdhVXhlukwnaAhvTQedNKyMk1xUUfK5pTj6YYxr7/Qel7
         5c9gAVISp9P9JExZ7eVHKvs8ETHKvIGpM6k+BobDNpz3YgvE9LGYWcpmzk7o4N9sdmqB
         CU6kOTlsOfndhJTu7CV+GiEmxsPSI8UXTIFNrKDWN5O3djnEJbgFNBu3pWIaRUon7KAl
         IWO9hAUO8XTucPJm0/yHCnbhKWU6aEMpuj/bdm2nV+ePAVTpg+AdbZDF7y8Dn+ic6djp
         RynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744885923; x=1745490723;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tkf5fQhiQh/YIIyCMZKHz3rsbVF+Y8xcwtqk69ZSgPg=;
        b=ATuxYAdaiv6OuzZBhLL0CIYd2PINwtxlXMWPSfcTT5krtUAhhi9qwYJWUAlvWASNxt
         GIq7i274i5aItDvCOF9Z5qWxoiDWDNCwHY1756WeoHBexkl7cz4n+kH+1adtmKeL78F0
         855WUMrH/UeBmjD98B1hRB+2OycUmfqdAV2speNgYCZrq26J+71cuy3aUsaQzQx7XVBp
         5RBOKVhOwl9KT7zWaitPm2yiyO3aHLUCMEyVJsDs23tG7hPy7EI1auKxFmIsgd6zfH5K
         HsFByYbD3i77IkqBogiT3l+NgICaqJOp13pIAKQnGd2aFjkZDZ9c5CDEwlONTHIj+cbG
         WR+A==
X-Forwarded-Encrypted: i=1; AJvYcCU5bCcEGmalwPQ+zj2WZ6cFlIDSK2zgrynHX8piFOuDCd+ygxNnuXZT/oOKtAG+tm5JIemZzVR8IOzx@vger.kernel.org
X-Gm-Message-State: AOJu0YynxxNiNGKQacZpICO0jyGtlyD3huB8FC08AYpkxglmIxEERoDa
	T8UVHvCa/rM7/YykNgeDDTClokCaM0YbGIsgS9sMPwH1SLEtOcz2wwRU0agcd/Y=
X-Gm-Gg: ASbGnctuAXkaDIfMRmvGBcMOTp9xdTq9nTPUlEul7/jDnW4++2pFUGBp8wRGLHF33Pz
	2uZEIRIMWz1j+n0svd8lswhVxkgb0l/vfLGY/hm/bw+Gqaroqazx8NF9rfaJtWxkM5Til9NOb/+
	H/ZXQEAxGQLhU5iX7fXkZIYvKWefd/AZuS9Y8cEFgFOr5ekJ6MinYtPfCdLr2wjxCucmL2vfGLX
	DY/1gR1Lfjp35TLUxuJo8gyYmLBIHdQoptp+rjZ7HAQ6V8n8HlsawieNZipCfQ18jZqYyxDQyYl
	c2NPPM3moEATIXng/Fqsj1Q4j9ad8NPHvMj2bRfJqLn7aRs31zvrzfYx9CgEncGeTjASaP8=
X-Google-Smtp-Source: AGHT+IE6usGaresLBjX0+vm/8v6ChKOAsLs9MaVE8DopJjuApE+hTsGgNSyU080dBby5dOeKbC+ieA==
X-Received: by 2002:a05:600c:3b07:b0:43c:fceb:91f with SMTP id 5b1f17b1804b1-4405d61cfd3mr48465285e9.11.1744885922759;
        Thu, 17 Apr 2025 03:32:02 -0700 (PDT)
Received: from localhost (93-44-188-26.ip98.fastwebnet.it. [93.44.188.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4c8188sm49137285e9.5.2025.04.17.03.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 03:32:02 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 17 Apr 2025 12:33:25 +0200
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
	kernel-list@raspberrypi.com
Subject: Re: [PATCH v8 07/13] arm64: dts: rp1: Add support for RaspberryPi's
 RP1 device
Message-ID: <aADY9Ye5ok14m3F2@apocalypse>
References: <99269f7762ec0124315e0e8977d9ca4f469f89ce.1742418429.git.andrea.porta@suse.com>
 <20250416192905.GA78240@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416192905.GA78240@bhelgaas>

Hi Bjorn,

On 14:29 Wed 16 Apr     , Bjorn Helgaas wrote:
> On Wed, Mar 19, 2025 at 10:52:28PM +0100, Andrea della Porta wrote:
> > RaspberryPi RP1 is a multi function PCI endpoint device that
> > exposes several subperipherals via PCI BAR.
> > Add a dtb overlay that will be compiled into a binary blob
> > and linked in the RP1 driver.
> > This overlay offers just minimal support to represent the
> > RP1 device itself, the sub-peripherals will be added by
> > future patches.
> 
> Would be nice to have a blank line between paragraphs.

Ack.

Thanks,
Andrea

