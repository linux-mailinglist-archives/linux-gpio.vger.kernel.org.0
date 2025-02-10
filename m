Return-Path: <linux-gpio+bounces-15655-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE7BA2ECF4
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 13:54:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EC7C18856AC
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 12:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38BBC222589;
	Mon, 10 Feb 2025 12:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="P3h0rmGS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BF3223323
	for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 12:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739192046; cv=none; b=h3oyGF+D5iQQ0rZxG7BLWr2kadWbSAm+5kvj8eSb3unZOmcd1BQnB8XR7J3Gk9ZcMl9vlHxwLBO3h/PCER04kfYBy1nnt4KSar5SyctD/O6CQwuchBjJ9kW1I6T25H06VtmT158pQUzkHx2Fdz5Xb0bTOcyH0or6PrNDaFQuscw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739192046; c=relaxed/simple;
	bh=7A6tQDHT8Gygs27nVXNQUFzlGL1/SnpgPWEJccOdUoo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NgsY/dm+qUu8FQ91Mct9f6or0k0N6YoKIojhnDAbXj3o6bh23mGL5M7A6omSU2SwB5zM7A9FEdZ0ZSTSVMqcLuLIVrJd/1g1q7DO2arwrRd95WbzcWwzmFP4IwYIc+/VZNhv1k+WB78gjsjG2MY2ol6WoUbqJskEKcDnNId29Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=P3h0rmGS; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-ab78e6edb48so422222766b.2
        for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 04:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739192041; x=1739796841; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rf85jElMNnrDZvKC7vVh5MfFio59DRgJHRcTUJEvgGI=;
        b=P3h0rmGSIzJypOlZkNcOiyOuXI9tPLb8MlACDEThOAmgaAuxTYNrH+YuKT7i7yUlJe
         3GV7NlcMOfW4VBTuhIIPv267BuafGzPV1lho4qwXOY7/1CvHrjhg+v4v+hWTL5gKOmFA
         h6egxTBbEwr5mmM4yJvfrYuUDz+Z3ybIOY70fvMIfk+jM4yS+Jdvdmv+NH1DuGF/yn+B
         eK82cPFvWzpWNWbg57bM2nERXIMKbOa2lVAllWKClLUiUXvd+X/DNIhXSWpWVHk0PqNe
         U/x2tQfgAgNUvIFXKhvVwAhpjwIqKPTdBvxkdDss43zbnZMMlY77rzoTYBgTMANcMrkV
         wwzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739192041; x=1739796841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rf85jElMNnrDZvKC7vVh5MfFio59DRgJHRcTUJEvgGI=;
        b=BSNdWvtaot2TqLceZHN3MTmgOnmWyVSzb72NLpvKjRbv1xSIHAZZhqSatHVcdHUhVL
         tY7SFTdN7P8Zql8561ieSn15rx19ewBo2PWF0xZyK1bXusQTVbFLJrkbFlKxEk8f0xyU
         7O+FwuRrGh85iPkVY0wK9zQArwlYtJ04TJVr2czB7cn9Xc+iVxFTLWh658I5m5lw3U7Y
         FBvyQKeSLK2x3bt/iKqPg7GGGEzf9vpf0+bEdYxfMgBPeRCKCUaZaW+0eOClO/SHXFBk
         FhkypPdJgJleGRKS2RcOeQ6C90M7rU4l5nozFxgLG0hwrKUiUXO9ejQSulKFEpVmpykc
         k69A==
X-Forwarded-Encrypted: i=1; AJvYcCUlU3GqlJ+7PsBJL3iP4n+NAICwsptCPbtx8XMXsTPaJ8QD65UoQQSO5DvKL/o8pPYedQnfFcEBHKHq@vger.kernel.org
X-Gm-Message-State: AOJu0YxHfO8VAjOIvZVealCiMSe2ApgqLQSa6JjdPYeTAlG4etVfFxD7
	BArIzetI9R4EvgdwffoDLhei0htEwYZZPjzMxFLKWy5q3f55e+4jV7T8GKzSskg=
X-Gm-Gg: ASbGncvW6Oa4bmIfOakrAQ5ZL6YRNxQA2+C0Tzp5alnfp9HkfGLkd0fNOGlBPH4O0B5
	y87bqr2D5lS+iS8uxHZ+Mop0mt+ZHE5U77SXj8XiUxdoD7EK2XenzG+W2GjdxOqV4RWVzzZZBI3
	kQfeBeC4aX8HGZZXIEwbC0+ekJls6TEmYOyOD8GKuHO9Ff2kMb+14vTxMm67P+S6iV1KTyFXgUV
	J9EcrC+CiiOtcD6PwdO/4op2rxHcb9ealpG3Wm4H6drH2MlK1kIHfzn5dwMbxwKPVmvlE9/U3TI
	btQ/wE9+3Ljtmrey9rAIcvLvOsFMraChGTFIuc2FFQ/vMl4OMc+IGdfDmZw=
X-Google-Smtp-Source: AGHT+IExaOon2TXZW9Vep+azLuX3PC+zXsCFuFLx/CO8qnQeXU427WnR0bcNBj8GMhFUwVXVl5oCDw==
X-Received: by 2002:a05:6402:5290:b0:5dc:6e27:e6e8 with SMTP id 4fb4d7f45d1cf-5de450706fcmr34849448a12.24.1739192040759;
        Mon, 10 Feb 2025 04:54:00 -0800 (PST)
Received: from localhost (host-79-41-239-37.retail.telecomitalia.it. [79.41.239.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de5a2fc79esm4970729a12.10.2025.02.10.04.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 04:54:00 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Mon, 10 Feb 2025 13:55:00 +0100
To: Stefan Wahren <wahrenst@gmx.net>
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
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v7 11/11] arm64: defconfig: Enable OF_OVERLAY option
Message-ID: <Z6n3JLOn-PrSt3Pa@apocalypse>
References: <cover.1738963156.git.andrea.porta@suse.com>
 <49da5d0cf961fef23a1622253825443eb51d660d.1738963156.git.andrea.porta@suse.com>
 <ab88fe2a-4f59-47d1-855b-517d98773f3c@gmx.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab88fe2a-4f59-47d1-855b-517d98773f3c@gmx.net>

Hi Stefan,

On 14:42 Sat 08 Feb     , Stefan Wahren wrote:
> Hi Andrea,
> 
> Am 07.02.25 um 22:31 schrieb Andrea della Porta:
> > The RP1 driver uses the infrastructure enabled by OF_OVERLAY config
> > option. Enable that option in defconfig in order to produce a kernel
> > usable on RaspberryPi5 avoiding to enable it separately.
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> > This patch is *OPTIONAL* since I'm not sure if OF_OVERLAY is a desirable
> > feature to have enabled by default. It would be advisable to have it included
> > so that 'make defconfig' can produce a kernel config that will work out
> > of the box on Rpi5, otherwise OF_OVERLAY has to be enabled separately.
> I think this isn't a good approach to convince the arm64 maintainer.
> This change is not really optional for the Raspberry Pi 5 and possible
> users/testers/CI rely on a working default configuration.
> 
> So my first suggestion would be to provide a scripts/bloat-o-meter
> output (before/after). Based on this the maintainer can better decided.

I agree with you. IIUC what you are proposing, the following metrics should
help to decide. The defconfig kernel with CONFIG_OF_OVERLAY=y added (wrt to
the defconfig one without that set) has:

- same uncompressed kernel image size (due to ELF section alignment I guess)

- ~7Kb bigger Image.gz

- 3 new modules (all related to RP1, i.e.: clk-rp1, pinctrl-rp1 and rp1-pci)

- 27 added symbols, of which 5 exported
 
hoping this is enough to gather a rough idea of the impact.

> 
> In case this change is still rejected, we still have the option of
> something like this [1]

I'm ready to go down this way should the previous numbers not be convincing
enough.

Many thanks,
Andrea

> 
> Best regards
> 
> [1] -
> https://patchwork.kernel.org/project/linux-kbuild/patch/20200203184820.4433-3-nsaenzjulienne@suse.de/

