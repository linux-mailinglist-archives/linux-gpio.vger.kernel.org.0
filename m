Return-Path: <linux-gpio+bounces-15940-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F36A34C92
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 18:57:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A83E188CD35
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 17:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6453223F42D;
	Thu, 13 Feb 2025 17:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="DCdtDMF5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7134D23A9A6
	for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 17:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739469472; cv=none; b=Ex+mME7J+ov34XvmY0J/ILIrOIAnNBfECXsa/SY8YSb7L8kePvCOVvHkeGRcOmsVFnnhpSQwL2GgoaawzNswW+Q8wyI8DJNNib8HryxNwdruvzwEzRwE3l3o4W8zpL6YWeakVzl+QxOfCS+pmQ92d9vOlZ44Z7T/QQz09yZNvak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739469472; c=relaxed/simple;
	bh=uxe/sPCuvuszkG09tatgP/sxrgyFyklm5riZrTlzQJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mqMMXh8+VRrktRGrDnGIxw7PMj8A4IKoiVGxXdc5+jZDJthgc6UCHuw3FnkJ+e+3z0Xml/KYPK4fe80owWNvTstLlPJOMlIrgWcR7pRFCcMvpk0h419NG9cvFi86XFzo6/NBZaSJU9eJB2PZ1KsxIPlA3jFAtrsGOg8PSaEU9U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=DCdtDMF5; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ab7f860a9c6so246216666b.0
        for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 09:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1739469469; x=1740074269; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uxe/sPCuvuszkG09tatgP/sxrgyFyklm5riZrTlzQJA=;
        b=DCdtDMF5xCu6D99J8ipr2xNNMloOw+nxwbV7J0RxdRxacuH4MLAcWkzqtpIHvJYCsM
         KGY4uK5XpYAuDtgVd4Ss3RTctRp88G8zCecrUOV27ugzkMoH7212U2Rs+kcEbKuKRNsC
         +jX9HQbSahUZr3i8BcpOM4+R0eJzFvitJafrZFsHdXPaXbYmguyaG/uPo64CMcfSYKAs
         7klaC8saAfUGmAB3+4njsEQkayE/iCvnAOWqyl/7R3VHT4+UWu8hUK0tJo/izRYCY52A
         rVD6D6AGDYBB5GYW+BeM0dZ2MHE3K/nTA9ZOG0U/bHhHZalhV6dmmVuojwom3Xybtn/4
         Wdxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739469469; x=1740074269;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uxe/sPCuvuszkG09tatgP/sxrgyFyklm5riZrTlzQJA=;
        b=of4orleNmapvHZjpAS2odaddXlc6SfqSZprDaiSGU5A/Q+pwQ7LTWbQ09Z4qHyztvT
         q9YQyfspvvBX47YTRzAbK+eMp02pVOXhi7O+/hYiKTpsIPmVBLgJJnBVQuvHhmnDyPRX
         UjjzaS087s4EsTSHy/JkaZ5LJSCU5k/5DAhZI1ZOGxVN4wyrQPb9H1VqX4Y6jiPnTWrj
         WArGgEqZY7U8YeH9ucH01na60jWcloUVdO8Y7ulwrLwPeVr2yA6AMi7NRum9pl4CW4Kp
         DoVbU88qztDC2qkpOV/W4WnzMHBCqc/SH6WTnmrj7qe7aUg6a1RtGoWRzqJ5vV3+FfY0
         tEcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZHCupB2ommZHbgkpp9qYGwFACjN81a+i+e80nf/GTTMEmGDcJw+1yjTBXtUsQCnhg72AtMDGyZ/9U@vger.kernel.org
X-Gm-Message-State: AOJu0YyJwafRKwACyUrddyz3Y+YrxGG5rw8qIfBScqDQ87m+HxANVU3c
	7Nbhz8ME2Je9ecBY+yAwt/rM9q3Lq7ey+TGwpF2o+heARwvQleujJVrV4ZGLylkmo5ycK2XZqWr
	gGG9lcnvPfBfwmtufS+KLtSo/J6CzIaG6VPTjlw==
X-Gm-Gg: ASbGnct0aP+LGQVQBEGH7D9PsRiX1K9tISF3/lv7o0KTtvuE1JpqRW+p+CjqS0fVdQf
	6BKJkA4q1xF20Pr+btLCrDICS9gx4HCtIAOJPxRhKeir4SfA85t6JYdNLPnGi3vtMR+QBJGdodM
	Wm/oi47uE72Y6TxE+emo2v6uLu3QVg
X-Google-Smtp-Source: AGHT+IEK78m51sGJDd3X7obouAmtice1DYZhDC7vdVZTdA3vPC4baSC0McAYMZqXZ2JdRz2CuZ0fh5G5y4aENoDxPdM=
X-Received: by 2002:a17:907:971a:b0:ab9:63bf:8105 with SMTP id
 a640c23a62f3a-ab963bf8270mr490444566b.1.1739469468776; Thu, 13 Feb 2025
 09:57:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMEGJJ3=W8_R0xBvm8r+Q7iExZx8xPBHEWWGAT9ngpGWDSKCaQ@mail.gmail.com>
 <20250213171435.1c2ce376@bootlin.com> <a3c5103c-829a-4301-ba53-6ef9bd1e74e7@lunn.ch>
 <CAMEGJJ3-JXhin_Ht76EqUNAwLiNisa9PrCrdUzCgj=msGZfb5A@mail.gmail.com> <821d4c74-09b0-4c1b-b8ef-f8c08d0f6b5b@lunn.ch>
In-Reply-To: <821d4c74-09b0-4c1b-b8ef-f8c08d0f6b5b@lunn.ch>
From: Phil Elwell <phil@raspberrypi.com>
Date: Thu, 13 Feb 2025 17:57:37 +0000
X-Gm-Features: AWEUYZnQGb_LTFgRMGvR2NkevZWJdZdjShSWV1aYMFwhkUzlH95FjIU8_Kkz2O0
Message-ID: <CAMEGJJ0QbzCScfTRA_pw_8A=iMYMAAFs69zFNLwcOxF5Syugpw@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] Add support for RaspberryPi RP1 PCI device using
 a DT overlay
To: Andrew Lunn <andrew@lunn.ch>
Cc: Herve Codina <herve.codina@bootlin.com>, Andrea della Porta <andrea.porta@suse.com>, 
	Arnd Bergmann <arnd@arndb.de>, 
	"maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, bhelgaas@google.com, brgl@bgdev.pl, 
	Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, derek.kiernan@amd.com, 
	devicetree@vger.kernel.org, dragan.cvetic@amd.com, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, krzk+dt@kernel.org, kw@linux.com, 
	Linus Walleij <linus.walleij@linaro.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	"open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS" <linux-pci@vger.kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, lpieralisi@kernel.org, 
	luca.ceresoli@bootlin.com, manivannan.sadhasivam@linaro.org, 
	masahiroy@kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, saravanak@google.com, Stephen Boyd <sboyd@kernel.org>, 
	thomas.petazzoni@bootlin.com, Stefan Wahren <wahrenst@gmx.net>, 
	Will Deacon <will@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 13 Feb 2025 at 17:45, Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > Or do you mean a custom board, which has a CPU, RP1 and the button and
> > > fan are directly on this custom board? You then want a board DTS which
> > > includes all these pieces?
> >
> > That depends on whether you count the Raspberry Pi 5 as a custom board.
>
> So you mean the Pi 5 board would itself make use of the resources the
> RP1 device has? They are not simply connected to headers for plugin
> boards, but used by the main board? Hence you want to describe them in
> the board .DTS file.

That's correct. But even for plug-in devices, those which are on
non-discoverable buses need overlays to declare them, which causes a
problem when the overlay application happens before the kernel is
started.

Phil

