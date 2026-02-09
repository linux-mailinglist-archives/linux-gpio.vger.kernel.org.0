Return-Path: <linux-gpio+bounces-31520-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHjAAWiCiWkg+QQAu9opvQ
	(envelope-from <linux-gpio+bounces-31520-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Feb 2026 07:44:56 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9E610C334
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Feb 2026 07:44:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 562CA300851A
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Feb 2026 06:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BAB9314A83;
	Mon,  9 Feb 2026 06:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fqt6dHov"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0172FF16F
	for <linux-gpio@vger.kernel.org>; Mon,  9 Feb 2026 06:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770619490; cv=none; b=kUPygKwDts7kQpz6rsLS3uOsbIjsKrF9qz5CDm/Q8MvNmnJi06AhV6avrzqNBAyF+zn6Y6gyGj4vZPNzA5+jlDdcy/UM15QE9cF2ixznzIlOFqV1gD0JvbTIEjyAOHL6BvnYXQ6fqPzL8OM8yU5O7x/2giwPFr+/5Jxkzh2EEG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770619490; c=relaxed/simple;
	bh=rl083AGm/GDxO6xD0bxp6OujZChAx9Boqm/mAFocjes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gd6zcjTNfnADMAEG9VAGyehecAeTiZF0vuUErV1lq9SnWe9m572xnzOe3VZlUDkoluRUN55hPzAdE2XNtOd+1t6up5bqt8Lf6h59zzlJjssB2BI+tHozGGXIhg1OSoEsWypm2xuSiqLHCL0cl6UZbc1EEfgtAnJ415L1SusaLTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fqt6dHov; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1270be4d125so1164813c88.1
        for <linux-gpio@vger.kernel.org>; Sun, 08 Feb 2026 22:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770619489; x=1771224289; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jFhlfJ7m/6DKCQeVppsPkElvkhB5OvMrtI/5G0B0bhc=;
        b=Fqt6dHovKc77I1LRSE+GBWlYjC8vfNDnml5ILU2dtdh87sWr5AEvkRsCkxyVdnPq8p
         Kn9CdD3Q3TOVH91vD7CzV/X/rbssKV3mT+hnmJbBy1Usgu2U8GoxlfBZahobsnCRp3PM
         kAEGmu0SN8Zi6ayuZZrFGeQqP3GAuny6jyTpAb5QmdXviVnDn89lOz8s2FwlIHHI4l3k
         0cTOErCZTyUoPC9EeqnDhjWXBCPHwpGNpnmHpRDBLC04P8Q3vCmGV7hwUXeC6nNgyQLO
         8ywA1WVyNG9HnwkdpX+Tr4N6+zYTNQUVSDc97M+qRpPNpEG1ngAECh+pGwH73/RRfG0a
         1kVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770619489; x=1771224289;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jFhlfJ7m/6DKCQeVppsPkElvkhB5OvMrtI/5G0B0bhc=;
        b=UiF6XGQRHt7DPx0QVvliq4zkDBYpM3s5Z1woxxa4SuGXcB4deEUOMkmMuZ+iBelIr0
         cE2VYU3BhlaOUvQ3D3X4uV/nsxnLU4XZ6sIU6Qvtz6RJL3Ycdx+ifGkvbNxy2mOdYR8G
         rWCG2GMw0cTBJy9EP1HROof0Comqf8TODlotNl2ec6uOFg5l/N+hK3ny2E4xWXr5AKq+
         stKLKHyj/oKWvUuQepB02bsTmwT+dbmfFi5b0cLhXBbuq95UPaPXasnrg0X7Q3nF67Eg
         a3rVjYbLTZ+mIwFA0xL7ZbpintVTCmV2NrTa7sgVv7ATttCawrEPrAyyYcH9EKoFy80y
         7JHg==
X-Forwarded-Encrypted: i=1; AJvYcCXeP2tz8Wd4RqLfnlvw39KhVxo07EsRDY9hE0ID7mP0Zt9CDNfQIFi/EEOUOmwIE65ifgeNwQy0WgSC@vger.kernel.org
X-Gm-Message-State: AOJu0YzQNyMcOUpieYcpE/lbzWuTwYoUciWvoQjzf5U6xjxIEla1lb8O
	DnKcrwGtWzYaIOydcV3ATumc5VmF4sX/BwAMcr/DS2DBenqYKO0JXYLA
X-Gm-Gg: AZuq6aJU0ZJgAKzaI2/ydFO/47uFy6uyI1nX3GHM2XlS46Ck5h1B7/u0HFWs48Hfwph
	y5zpR0q0Ln8IUfdpcvMqkxAa5Z3fPWiu8l2occVVl0w1Uw3TN1zy3RWBgMyCH6CChS+ogr0HNT4
	qFo2QdwGd5F+KBewrxTgQMg8lSK/IsmEUHaZJw/j1KvW+7sRgK9Ca33SRlWMvlEelsBtq/mOPxI
	hb6eHtGWQp05rncz4TUyVq4Ne8p36Rb3KYduX+Go6yN8SCd4+lERpiG1++qqL8crI6NmAxH/3aR
	qp4it2hU1hxaPJ4+5LlrYqO6MFKOtmD1/m1DUEFnm8RMrBJv+PVMJu4n+8NgOh5ntqFyYGfFbfO
	Wq8kqrKuQIvt46FYF5wLpZPlw61JWzD4ETzUFfh7pi8wWmijp6JebWV9cg4zh2K5FsfJA9KE6t0
	k6HcNsWv39BBGj7cF+xZAToHh5Q/zBRjhrq2v42WzskvT2TpEcMg==
X-Received: by 2002:a05:7022:2522:b0:11f:1e59:4c2d with SMTP id a92af1059eb24-12703fd9003mr4406577c88.7.1770619488856;
        Sun, 08 Feb 2026 22:44:48 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:d70d:15:1011:7b14])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1270414f28bsm8824958c88.0.2026.02.08.22.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 22:44:48 -0800 (PST)
Date: Sun, 8 Feb 2026 22:44:45 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, patches@opensource.cirrus.com, 
	Yauhen Kharuzhy <jekhor@gmail.com>
Subject: Re: [PATCH v4 04/10] gpio: swnode: don't use the swnode's name as
 the key for GPIO lookup
Message-ID: <aYmBYlEcbVJ2ELZ_@google.com>
References: <20251103-reset-gpios-swnodes-v4-0-6461800b6775@linaro.org>
 <20251103-reset-gpios-swnodes-v4-4-6461800b6775@linaro.org>
 <aRyf7qDdHKABppP8@opensource.cirrus.com>
 <CAMRc=MfD7ZbwU4akkCJNgmRPwgSOqSVi2-L2dJDOBHrfdD-yZw@mail.gmail.com>
 <aRy31U8EQA1DO/R6@opensource.cirrus.com>
 <CAMRc=MfNf+WMtSW=Wag0QHAaYzcRe9igrbOeRZiY92KmOH70oQ@mail.gmail.com>
 <CAMRc=MdKN4Uj4RZk=3L82c0-0Z0CihbAfzVK0zMBb9Tsjh3BqQ@mail.gmail.com>
 <CAMRc=MeYEoiXWCdYNSmmbquMwmt99vPgzW+0gmX22Of9o127+A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeYEoiXWCdYNSmmbquMwmt99vPgzW+0gmX22Of9o127+A@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[opensource.cirrus.com,linaro.org,linux.intel.com,gmail.com,linuxfoundation.org,kernel.org,pengutronix.de,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31520-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bgdev.pl:email]
X-Rspamd-Queue-Id: BA9E610C334
X-Rspamd-Action: no action

On Wed, Nov 19, 2025 at 10:13:30AM +0100, Bartosz Golaszewski wrote:
> On Wed, Nov 19, 2025 at 9:41 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > On Wed, Nov 19, 2025 at 9:35 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > >
> > > I have an idea for fixing it, let me cook up a patch. It'll still be a
> > > bit hacky but will at least create a true link.
> > >
> >
> > Scratch that, I didn't notice before but we register both devices from
> > MFD core. We can just set up software nodes there.
> >
> 
> Here you go: https://lore.kernel.org/all/20251119-cs42l43-gpio-swnodes-v1-1-25996afebd97@linaro.org/
> 
> Please give it a try. This is independent from this series and should
> probably be backported to stable.

So think breaks more drivers:

https://lore.kernel.org/all/aYkdKfP5fg6iywgr@jekhomev/

I think it may also break:

arch/arm/mach-omap1/board-nokia770.c
arch/arm/mach-pxa/devices.c
arch/arm/mach-pxa/devices.h
arch/arm/mach-pxa/gumstix.c
arch/arm/mach-pxa/pxa25x.c
arch/arm/mach-pxa/pxa27x.c
arch/arm/mach-pxa/spitz.c
arch/arm/mach-tegra/board-paz00.c
arch/x86/platform/geode/geode-common.c
drivers/platform/x86/barco-p50-gpio.c
drivers/platform/x86/pcengines-apuv2.c

Thanks.

-- 
Dmitry

