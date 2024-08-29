Return-Path: <linux-gpio+bounces-9370-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3BE964613
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 15:15:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CBC03B29ACE
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 13:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB9AE1B0131;
	Thu, 29 Aug 2024 13:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bOq3mxti"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84571B140F
	for <linux-gpio@vger.kernel.org>; Thu, 29 Aug 2024 13:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724937209; cv=none; b=f0UeOjEF8/9NvNM7VJhY309NK9mk3nV/TcQ9ctply0lEEfBXyWjvyOL8hD7ZDCY1UOqy1LL7vWFUI0RtnhPwbBO6Rc8yHP0nc8Xe3VVEdw7Aa2JQR+tKGoH8ADqFbDksEFl4Po7FNgqZwudltlM0zR0gdPnP/hxZEipvZla/h+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724937209; c=relaxed/simple;
	bh=qnYIj6qokB7Iw7VUBkmFypMZWVgIcjZrwzkwlqFBP9c=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YfDvLnqtwY+U/Q0tdRDflh2xeWQCED5ppwXgLqce+3b72yqx4l7+Tx3HQpxguA2iMQaJsVMW+OsLmprQig8hDXCkmJ4zRWogXjA6S4Yar29ctJiwk9+Y/FDw09YsLi+axRnnezxZxx7A3syEz2vMEwKp53pJgnQyx6X/hMm6AXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bOq3mxti; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5343617fdddso1156887e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 29 Aug 2024 06:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724937206; x=1725542006; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:date:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zcevrydr3wb+wZ7r5tLJWsjj7JW9bLBAqf2EeUSSlJQ=;
        b=bOq3mxtiP/KD5pf247A1dz5lzzRSKFBAyidvd0+TklXn+fMV3qlpgNe1xLhsvgyeLG
         2mjCCOhmITe0B1ZnBiGD6BFqfSFe5cyZIjxXexfICVR85AELhHnbNZ3qbxhq8U96iUY0
         Jl/NC9ck0azR8T/UKP10IsMFOCky37/Cyj8VgTiqzY5rknMVuM8AYGbToOHdYRW6G/ke
         zuSbnwmLsD4kk1HjqVc5MQQbW33UbNNqpQOFBOIwgac+qIwjbs2ZRyz436iRQG1Weuaj
         d+6BZ+dRyYY7/48p6AVNgFvybtNhBWzH58C8th7dQbndZZcGiNXoO4rAtMJGM+E29Hrm
         yESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724937206; x=1725542006;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zcevrydr3wb+wZ7r5tLJWsjj7JW9bLBAqf2EeUSSlJQ=;
        b=AbFh5ppmXrDxZELx6FYq0tpB2oHVvj4lMl5f5zGoCgW3rrZEy23lsZ6pi0EMFOPHm5
         AoBSwg8g/71lNwPw3YYvqexqK017gfIesUXYuYfzG4rAyGx/slFQSJSFMNyuFW1tZ4Iv
         W02xrZvK7gSjFCYZu5A7GVBWiQMwo6MlkCk083kBBTrFmjuAS+bPYnAMNRI2pCawbA6v
         uVQCoEKcI1bdTINiExntCAjADveLV1d11bJbPfurZOdaqT9fevpDHEQTBT+hCeRuCL1x
         k8xQI7oJBg5CqDd/mcfjmo5wfJrmR9a+pXPOS0uJWdsNIXO2HLSmGZH4lskL1yy0HgoG
         VDIA==
X-Forwarded-Encrypted: i=1; AJvYcCWg+/oNjOqesh+u4blV0hvNa8W82JJGTCipRMLyJVTALpw/icxnr/pzjahJzu3CkPkgDtM400Pv5uhD@vger.kernel.org
X-Gm-Message-State: AOJu0YwIf+AzTWs8eNHXfVF8byBHAzBxymBxp2hQJ5t1U/rVNhFnHP9w
	tjR41amZ13joklATQXPD/A0n5KpDM1igXLJGOzDsO3znRNaCnUpmZQEAhtpLVJQ=
X-Google-Smtp-Source: AGHT+IFLMk4m6y7fSkfLg3A3IXASRJuXYrAbPU9+Ww0KPnYO42UsA+Qqa5Bo9AeJfKaUmIGFU/dvxw==
X-Received: by 2002:a05:6512:3b9e:b0:52c:cd77:fe03 with SMTP id 2adb3069b0e04-5353e54d499mr2408631e87.14.1724937205212;
        Thu, 29 Aug 2024 06:13:25 -0700 (PDT)
Received: from localhost (host-80-182-198-72.pool80182.interbusiness.it. [80.182.198.72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226ce4f5dsm697741a12.89.2024.08.29.06.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 06:13:24 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 29 Aug 2024 15:13:31 +0200
To: Andrew Lunn <andrew@lunn.ch>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arch@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH 00/11] Add support for RaspberryPi RP1 PCI device using a
 DT overlay
Message-ID: <ZtBz-1scwp9OZ_FY@apocalypse>
Mail-Followup-To: Andrew Lunn <andrew@lunn.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arch@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Stefan Wahren <wahrenst@gmx.net>
References: <cover.1724159867.git.andrea.porta@suse.com>
 <14990d25-40a2-46c0-bf94-25800f379a30@kernel.org>
 <Zsb_ZeczWd-gQ5po@apocalypse>
 <45a41ed9-2e42-4fd5-a1d5-35de93ce0512@lunn.ch>
 <ZtBjMpMGtA4WfDij@apocalypse>
 <e6e6c230-370f-4b04-8cb7-4158dd51efdc@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6e6c230-370f-4b04-8cb7-4158dd51efdc@lunn.ch>

Hi Andrew,

On 15:04 Thu 29 Aug     , Andrew Lunn wrote:
> > > > WARNING: externs should be avoided in .c files
> > > > #331: FILE: drivers/misc/rp1/rp1-pci.c:58:
> > > > +extern char __dtbo_rp1_pci_begin[];
> > > > 
> > > > True, but in this case we don't have a symbol that should be exported to other
> > > > translation units, it just needs to be referenced inside the driver and
> > > > consumed locally. Hence it would be better to place the extern in .c file.
> > >  
> > > Did you try making it static.
> > 
> > The dtso is compiled into an obj and linked with the driver which is in
> > a different transaltion unit. I'm not aware on other ways to include that
> > symbol without declaring it extern (the exception being some hackery 
> > trick that compile the dtso into a .c file to be included into the driver
> > main source file). 
> > Or probably I'm not seeing what you are proposing, could you please elaborate
> > on that?
> 
> Sorry, i jumped to the wrong conclusion. Often it is missing static
> keyword which causes warnings. However, you say it needs to be global
> scope.
> 
> Reading the warning again:
> 
> > > > WARNING: externs should be avoided in .c files
> 
> It is wanting you to put it in a .h file, which then gets
> included by the two users.

Ah I see now what you were referring to, thanks.
I'll put the extern into an header file, although there are no two users
of that, the only one being rp1-pci.c.

Many thanks,
Andrea

> 
> 	Andrew

