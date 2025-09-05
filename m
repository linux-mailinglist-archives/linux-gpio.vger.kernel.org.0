Return-Path: <linux-gpio+bounces-25659-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF02B4519D
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 10:36:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F06A05A6A69
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 08:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EE9630C606;
	Fri,  5 Sep 2025 08:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Y8wHOUX7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CDA308F34
	for <linux-gpio@vger.kernel.org>; Fri,  5 Sep 2025 08:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757061234; cv=none; b=SdZ3tTFDS0ODIBCWD6K9/HzkvfRg24b0EpjhuVHh91vSFibSvSXvB+XlrMoV/AKXYz9W9m0KMPFHf23FqbEIWbRaAy+/fNu3Ju6iaO/l+Ch9dK9zUj98qLrU0i5WxLNo+/oGliTNve4p0nalsnY45B4Xf4qpGZ/iH2grbFV+EZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757061234; c=relaxed/simple;
	bh=FIivkbvlsUwuCxef19rZwLbxAQtBUlqR3Yy9oUPywFI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OfCtQGfzHGdb+0A5vBXdaiCZnjjyc5mubnOxUzHL4VyYytSEazYMujO/T3B2hAJVoduye4p+r8VJKym3Jdj70nHkD3TTiKi35ifkasP6XenB87dSJHgduHt6AwlfngCE1bW6eeJiUKNHy2yV+Q+UO6C9j+KrTCRR3c3HvlgHgWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Y8wHOUX7; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-b04770a25f2so279061466b.2
        for <linux-gpio@vger.kernel.org>; Fri, 05 Sep 2025 01:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757061230; x=1757666030; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SgnJRI/egxtjaoqDVVqBQgVUu4WIklNB+SAbz2GeD+U=;
        b=Y8wHOUX7gv2lRLEVRboxWfmsFRzGQ2GfjNmCwPG1gFkhIOqQTlUs8kPPR7dxKv7XqN
         mpngCDXmDpcZy0KN92rfMotPsmNw9AESxF5v2NximqIX5aYbgpaEwS+dSz5L+7N3m9U5
         kSqoxGOJnWwJR/SkVckgeuymKQFFy41CUh8TJ1E371xAX8aJuzbh/iPi0ecdVrM38Qzn
         naDc/E9nput3SOTTTCbRfs2rskAodkzyMLJQkK6AMmvdrYfgxub3GgXP2+Rc9+ErATxl
         cWLEZLWMuWLFaug8Mj1HcrOScT28tkIFWxBDJogVRIjuanKfl9Q6gt+wPofqEWKvmtiu
         8Iug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757061230; x=1757666030;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SgnJRI/egxtjaoqDVVqBQgVUu4WIklNB+SAbz2GeD+U=;
        b=ni/gg+1um6Jxslv3txH7GXuJjGc01RjBfUJK3iZJpG49Pzj6Yna2IXEPMWh1Xn0lDl
         lq49xZEnvnjEIVjDmC96E2pLAZNpmROPx7epZW/TtdqXOLPGJApC8z3D8Xzz/F2FzxjS
         juNgbj/B2oOPliwM7ax+ZO1i5b4knr9+9FKrVOOQZPtygR9IyGgFTj4MWoxqg7ctbHnu
         pwW+UA1FRbDHtX7zOboVem4RHxm2+1UDUtlicrcWbIj2jCecguqnMofb5QaDTExB7slG
         0g2vPTAdnA42jux9R29/19qRDjJxFD1uTj3A/9xWxfN/rv34cvqEk3KitfudAtHX3OKG
         j4dg==
X-Forwarded-Encrypted: i=1; AJvYcCVv+qgHCnBoo4ZlQB2scRqpGr7i3EHbLvF+gVrUowdzB2DfIN/uWbrYT/E9uuIBR+Yn/+CI6RSMk/52@vger.kernel.org
X-Gm-Message-State: AOJu0YyB4qWx+M0quc5MN+sg5NnkoFdmKKQuNzDp1byD2vGHuE4n6LVJ
	+iRQBvkBs5yVpIq+shPvGNtC/5PtvlTqNYaV6f1UBhQ9VyfLo5XiYOPGo9wpTL7OGbM=
X-Gm-Gg: ASbGncsQvUJ02OYFBH5IQXAuQSWk350YKqTkXSMXCk4E8rVxaUK/ZVHoFEAclkdmubJ
	1rnRD4cPSHWdt9dtkk68CG9quLCrya+EgE499nwxJdOx8IXQKFugDXzdpt6578KplTj4m+29GrZ
	eXZh4zQfAPi5U4PBXqXJPkBgdh12voDyaLy4kWSHY5exNNov1vuCdWgVeyfi4ylOzXwDtvocW7O
	AH3J949UPw8+tefOA4gqWiHuOzBa6AbzQ35LCYmDvKIjFo23xzdPYy52jZ8CC76cyOGG8fDKTAV
	9dibN8qVIYeFEmyY0petTC4N8/m0K+8dNRbGULYDxTM6Qc8/hdAf52inXYBbrijmDwvFCBlaAn5
	WdoXPKDL4KWqlqWzzO0SmOvSNjjAyCns02jVLkkKEYi2o1u1IzUr8xr5nEovScrY5/ke+sWJvfN
	WOcoQJ9PvGDSGffPnIU0pX0dSgqAEaSE9l
X-Google-Smtp-Source: AGHT+IGKUP3RZ5t2/gasPzJzuI8AOjzwK+b1qdxRjHmmhV48QCT+F5m6d9XTYWi3CHhwJeSzib8Gkg==
X-Received: by 2002:a17:907:a44:b0:aff:9906:e452 with SMTP id a640c23a62f3a-b01d972d878mr2222435766b.31.1757061228746;
        Fri, 05 Sep 2025 01:33:48 -0700 (PDT)
Received: from localhost (host-79-31-194-29.retail.telecomitalia.it. [79.31.194.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0474be5e99sm476564766b.94.2025.09.05.01.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 01:33:48 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 5 Sep 2025 10:35:45 +0200
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Peter Robinson <pbrobinson@gmail.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	florian.fainelli@broadcom.com, wahrenst@gmx.net,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, iivanov@suse.de, svarbanov@suse.de,
	mbrugger@suse.com, Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
Subject: Re: [PATCH v4 2/3] pinctrl: bcm: Add STB family pin controller driver
Message-ID: <aLqg4ZTbUjsgoMwy@apocalypse>
References: <cover.1756372805.git.andrea.porta@suse.com>
 <bee7c98a96c7000db32495b94ebae2ea06fe0e77.1756372805.git.andrea.porta@suse.com>
 <CACRpkdY82ohgX_7YP16DJrzDvxMHcSu3rW+UtEmrP0AQiD_Exg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdY82ohgX_7YP16DJrzDvxMHcSu3rW+UtEmrP0AQiD_Exg@mail.gmail.com>

Hi Linus,

On 21:06 Thu 04 Sep     , Linus Walleij wrote:
> On Thu, Aug 28, 2025 at 2:45 PM Andrea della Porta
> <andrea.porta@suse.com> wrote:
> 
> > From: "Ivan T. Ivanov" <iivanov@suse.de>
> >
> > This driver provide pin muxing and configuration functionality
> > for BCM2712 SoC used by RPi5. According to [1] this chip is an
> > instance of the one used in Broadcom STB  product line.
> >
> > [1] https://lore.kernel.org/lkml/f6601f73-cb22-4ba3-88c5-241be8421fc3@broadcom.com/
> >
> > Cc: Jonathan Bell <jonathan@raspberrypi.com>
> > Cc: Phil Elwell <phil@raspberrypi.com>
> > Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> > Reviewed-by: Phil Elwell <phil@raspberrypi.com>
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> 
> Patch applied!
> 
> > +config PINCTRL_BRCMSTB
> > +        tristate "Broadcom STB product line pin controller driver"
> > +        depends on OF && (ARCH_BRCMSTB || COMPILE_TEST)
> 
> I changed this to (ARCH_BCM2835 || ARCH_BRCMSTB || COMPILE_TEST)
> because Peter Robinson told me the Pi5 needs this driver too.
> See commit 1d99f92f71b6b4b2eee776562c991428490f71ef for details.

Indeed, thanks for spotting this!

Cheers,
Andrea

> 
> Yours,
> Linus Walleij

