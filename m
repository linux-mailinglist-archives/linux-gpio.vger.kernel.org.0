Return-Path: <linux-gpio+bounces-15942-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B7AA34CAF
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 19:01:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEDC518850D5
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 18:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BC1E23A9AD;
	Thu, 13 Feb 2025 18:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="cJCGrLX+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFA728A2BF
	for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 18:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739469659; cv=none; b=sxeJe1TKcDwW4pi5ZZd+0OZW9aMGU/xA2OlkmJYII8wOZ17MBiKYnHlUszhGWJzT9VRtHB5P5uPIXrn1H24G8k2C1IPgEnphyfAnReo3goPfcar7KQa+/Fe1NbzitqmPm4kqhnsRZAsRHIM3mSxxi6E5UXUbgnmCt2P4c+pyxkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739469659; c=relaxed/simple;
	bh=4abGwX6CzCq8We7SpM6V7/PXsy+lszV/t7IY70ml+U4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JIXUlpsUv8P8oXiiWiw33sdF8GxFiQBm6GASvUcDtFoT7yotwZ4koRCcM74m+rD9WQ6SWcY0+3PacwhlgynfBSG723iY/q0R1ezEOyGs4BWQe0kIEHeVQaDNYMccLgdZuAvhI5YtSHnFmWnswhneqYcMmZens9ErrqfPrKO2iKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=cJCGrLX+; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ab7f9d87b96so188672966b.3
        for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 10:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1739469656; x=1740074456; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4abGwX6CzCq8We7SpM6V7/PXsy+lszV/t7IY70ml+U4=;
        b=cJCGrLX+wDKWARKqV36CmQ8v+Y8fjyp2liuM+b6HHeROpMu51/0IkJyyX9+E78Edx8
         8BXOOyB8smbNCYf7SGv8GpQ6RN02D19CjPfSQn8vXnZhR0gFSFPRqf+OrbfzzdKwh+0R
         VMlvu5+gB5geyZ+YsYgzBwrNBp6rE0BtISkAKInDyjNy6EQpEB6gFOyUGreWJ3LaeQsd
         zd9fRqW+ErWYIBZeFeg+sGiwOyi3qvVWWw5aYY0JMvDCJFHkpB6VqBj6EJTfPFs17L5j
         apV2zGKzMeMZaLDxTDfZh/BLXpPfEa2Qoooa/yYVgK7RNkUTYmHUac9MajCY5eyI9qSb
         sbNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739469656; x=1740074456;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4abGwX6CzCq8We7SpM6V7/PXsy+lszV/t7IY70ml+U4=;
        b=YWlOG6iYfVH/oK8y+mfCUvLvS9hjqGlnPqK97E6co1hxOaLU+qk6O6x8HSJ0szAENg
         E/01sTMX5Xeyi1LGBtZp368J0IaeuXxYW2/vEL7387KxcwTgW20WsbvriYkt+TFr5uLp
         aephon6gGgON86UFG3mpmIZwJNE2cV5kDbVwY1W/IzGCiWUbcYxAtyKaQFKLWiXxxwFK
         Ccqq887TIqCzI3sm2zAxvCDjt+AlVASfpaE6IFkswj+CVSMbKNiRUW1BPZfaAZZkazh7
         L74Z9rKZpLIPPNpoGMdJmve28LX1cqebF3exPY9/kgEMxv81r4RTtdx8o5WSMlCRCzx5
         0MnA==
X-Forwarded-Encrypted: i=1; AJvYcCXHK87ZiRW7jG8FZIm5Xyd7wALQOhtGsGduNpOS0FyE5dJlQPGimyvVTzyFF2atoGZPv3l0uGaSSmnu@vger.kernel.org
X-Gm-Message-State: AOJu0YxjW5PCIu1cCj1OT/6Fx63mk+9x2Y+a6ZREaEikVEKhnBDniIeO
	7JKp1BZYUam2aST1k2qZZ2XugmAPNrLzTdPAWlm1Z7XtynmOLAFHYObItQu6n6hDfHUOMNnRFEF
	bIqoDmfDohgsBaYipjFacQ6KgxxYKDEvf09+EyQ==
X-Gm-Gg: ASbGncubVGKSG/yOamZC6YaGyCXkPnZFt7l+STV7qri0MQumw55+nJRco6dR2dX1V/f
	8HuFdDiaVotXK9D3GKWi2LXvxpBrFBUZmAZskOQu2I+fJjXKSB8/DGM1swgQ2hIHDJ/pFegae9d
	A8Slw7Y1H97cUGUpf0tS6vyy1cf2gV
X-Google-Smtp-Source: AGHT+IEPn1vehWPEneMvy4h+MekCpIWgHCiWfjunKXP/Rg/zGzFsLUQXgBKZUi6VnPclc10evNFU6A3yPAiro3jiL5E=
X-Received: by 2002:a17:906:7807:b0:ab7:6369:83fc with SMTP id
 a640c23a62f3a-ab7f34af3d5mr742379366b.38.1739469655305; Thu, 13 Feb 2025
 10:00:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMEGJJ3=W8_R0xBvm8r+Q7iExZx8xPBHEWWGAT9ngpGWDSKCaQ@mail.gmail.com>
 <20250213171435.1c2ce376@bootlin.com> <a3c5103c-829a-4301-ba53-6ef9bd1e74e7@lunn.ch>
 <CAMEGJJ3-JXhin_Ht76EqUNAwLiNisa9PrCrdUzCgj=msGZfb5A@mail.gmail.com>
 <20250213180733.11999e07@bootlin.com> <CAMEGJJ2FB-wwyOtjjCmPJ-vUDpZaV-8MMXxV13qXnKxYSzt9pw@mail.gmail.com>
 <07b973c1-4e35-440c-9009-85302a455912@lunn.ch>
In-Reply-To: <07b973c1-4e35-440c-9009-85302a455912@lunn.ch>
From: Phil Elwell <phil@raspberrypi.com>
Date: Thu, 13 Feb 2025 18:00:44 +0000
X-Gm-Features: AWEUYZk57dt7oMdE7oJWluEUSR6yrcUWkxTlMHydzKGl0ZQ5NYeC-9oOiQGkrQw
Message-ID: <CAMEGJJ3++pZtOEvjAm2zMPVrLxQPtuzBWh4QQzGAt3NWuyyrJQ@mail.gmail.com>
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

On Thu, 13 Feb 2025 at 17:51, Andrew Lunn <andrew@lunn.ch> wrote:
>
> > etc. The same problem would exist for U-boot. Even though RP1 has a
> > standard XHCI controller
>
> Although it is a standard XHCI controller, i assume it is not a PCIe
> XHCI controller which can just be enumerated as a PCIe device?

There are too many sub-devices in RP1 for them each to get their own
function. Instead, they all share a single function, with DT to
declare them.

Phil

