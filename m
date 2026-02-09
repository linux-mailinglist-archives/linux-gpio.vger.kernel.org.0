Return-Path: <linux-gpio+bounces-31521-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBizG06EiWl8+QQAu9opvQ
	(envelope-from <linux-gpio+bounces-31521-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Feb 2026 07:53:02 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1129910C403
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Feb 2026 07:53:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1543E30046B5
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Feb 2026 06:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B21931D72B;
	Mon,  9 Feb 2026 06:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DQjYhmi7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18EA131A56B
	for <linux-gpio@vger.kernel.org>; Mon,  9 Feb 2026 06:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770619971; cv=none; b=krJyqNoRPHTr4AmxCjEaYgV9m79rwT5DsAinybybh5XIY6tMcZlefb3x0XRvcTx1KieI/9tGS7Z7nXHRB1xR70dXjoFgbh3SRDoW5uJ1s9HSs//Jkr8MYd9b3HVk+u6/ueATjOHPOJopJ+SPT6oUO3NP5YkOKitFicSfrVPW6+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770619971; c=relaxed/simple;
	bh=/kFRoYuACeQTKCTxiXjtG5+68kwbn0hfkvaxOeODr9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UdE4Qy8BUbVZId6dSxciv4oVCAedXjYx/Mjt0vLJez9u7wf0nPUg7rd0fyO/ajc3R56k8Ym6B5YerHFBb4MgGEfohEAlnvrX/xYnKPj8u8k1R88FjcwXEv+CLRLzRaMKkBto0xKMtIAakYvKgdZk+cFqZw16gqelFblLZYcaS7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DQjYhmi7; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1270ac5d3efso1942945c88.1
        for <linux-gpio@vger.kernel.org>; Sun, 08 Feb 2026 22:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770619970; x=1771224770; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nlLTEe8ameB93s6BYEpWBdg65WpZgPkz7LnczmeGp9s=;
        b=DQjYhmi7JTK5EaxB3MEsMN7+EtZ2ZiOCr5cNDGWGnmZLj0poO1lThyolPu8Txfe5y6
         fE1F03ySseqrLwszT0zdfSRuP0iLZEyE8gC4VBr8Ilr1vupFwaSR6X4oc5cLOSDFkwPp
         jq1MeXqkcVgGiXRlXyTbRd6D2AHtkkkbmB1AOjIQuZ04xcXSRBsqYpDkFmoixU0arA3X
         YfGZmqqVAcN9JzqSPPP1GEgZDaBktTLHurlCVD7sKJZ4ivj7f2JOD7QbJSTuKKpu2+u3
         tlGqXa6Ak8l19mJe5N+jSPsrvBZYkXpM6qt4T+2FhO68lJ6avVmEOhJ8vghewjJC8XE0
         OViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770619970; x=1771224770;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nlLTEe8ameB93s6BYEpWBdg65WpZgPkz7LnczmeGp9s=;
        b=hoxPhN2yRHKSKHr1qSauc6W06jhsc+lm2xWP+MmC/TWS4odo1URrO9hFCKS364YxP6
         TVYvzzqWRxH6aBUgCdk1ql5S/sILlHcT+pLpKDMYt0qdkcTT5peo7J1afjSZ8zJfCMMJ
         UecfbZsG14l6EbeLCH94sSXZHJ3fdtGIiNp8GQi6wZ0O6Fm4rHyVgpW7PHlFVCKRupH2
         1Lsu8D9KoNrwBiuwh9HfzliM7reZ/RKWePZJrgcWpCDUlew3DYx91i1Tx0onnkEDrEcv
         XX/EktcVZkiiA9lu8/g9lubMz5lprKnf1/LATwSdlmrxCUKy7GscOuHgPL9zGZJOzZd/
         dUrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUelBRHhJIx4F+motq/Iafywcb0aZCwYxqEVz81YuTSWCSMt+79IUsRTntCLSFmK2x1mlYvfpdjhHdJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3YICoKlXHp/qbnn4HCbrd5wzWqBUjBnLC81HdD5m0sfObl3hu
	SLS+mOc3YWrUqRCtDzED6jvfiOs9Iv6M4f8YFWQSk1Rz+rPJ03Q5sWdC
X-Gm-Gg: AZuq6aLbXAWLYC+7kJtLJ9V59k1BwMx1TUFd1aa7EUkDTdWS2GNIG9+iENhcqNYREnv
	qjIJ+aDUdpAX7fb67bwqa5SEJ2e84NdNU096+QRbCHGbg0TykHEwtxMG0229OI4/QAyDZBctHLU
	8HsS/OGayif4tQ3bwTAVU2J90FIUlTZ7II0kHcOtHOn+kAR/aTcSnZSd2s77aZzCidb2+e2Tw6Y
	icJi+G0p7y9sRcJ87bLYlHL43xQx4JEB1eOlYdFwTSGSbaaOW98l44WYWmW2a5pOvw9XaF4spNs
	A02M+cjEvfMene5+3xddAG9X/L8EfFM+3L7qgz27fn4l1bJ1V5ruRRY4Dp6ZSjKM2aInzqLgZnA
	aeTEVi+nqDOKKHrxXgdsi6zUVqJ7WhuYTsrpl5Ij5ISttduHPKyBVgxTyp2wikKw/oaTGkdskm9
	9+HVxxO1xf3uKLDzTijEIpFXi6uXOJKSDJyTsNtUsaMYmN6LvFhQ==
X-Received: by 2002:a05:7022:222a:b0:11a:2e9c:1130 with SMTP id a92af1059eb24-12703f54480mr4347778c88.7.1770619969983;
        Sun, 08 Feb 2026 22:52:49 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:d70d:15:1011:7b14])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1270414f28bsm8837954c88.0.2026.02.08.22.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 22:52:49 -0800 (PST)
Date: Sun, 8 Feb 2026 22:52:46 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Linus Walleij <linusw@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>, patches@opensource.cirrus.com, 
	Yauhen Kharuzhy <jekhor@gmail.com>
Subject: Re: [PATCH v4 04/10] gpio: swnode: don't use the swnode's name as
 the key for GPIO lookup
Message-ID: <aYmDlY1yURae37l5@google.com>
References: <20251103-reset-gpios-swnodes-v4-0-6461800b6775@linaro.org>
 <20251103-reset-gpios-swnodes-v4-4-6461800b6775@linaro.org>
 <aRyf7qDdHKABppP8@opensource.cirrus.com>
 <CAMRc=MfD7ZbwU4akkCJNgmRPwgSOqSVi2-L2dJDOBHrfdD-yZw@mail.gmail.com>
 <aRy31U8EQA1DO/R6@opensource.cirrus.com>
 <CAMRc=MfNf+WMtSW=Wag0QHAaYzcRe9igrbOeRZiY92KmOH70oQ@mail.gmail.com>
 <CAMRc=MdKN4Uj4RZk=3L82c0-0Z0CihbAfzVK0zMBb9Tsjh3BqQ@mail.gmail.com>
 <CAMRc=MeYEoiXWCdYNSmmbquMwmt99vPgzW+0gmX22Of9o127+A@mail.gmail.com>
 <aYmBYlEcbVJ2ELZ_@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aYmBYlEcbVJ2ELZ_@google.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[opensource.cirrus.com,kernel.org,linux.intel.com,gmail.com,linuxfoundation.org,pengutronix.de,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31521-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bgdev.pl:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1129910C403
X-Rspamd-Action: no action

[ resending to the right addresses for Bartosz and Linus ]

On Sun, Feb 08, 2026 at 10:44:45PM -0800, Dmitry Torokhov wrote:
> On Wed, Nov 19, 2025 at 10:13:30AM +0100, Bartosz Golaszewski wrote:
> > On Wed, Nov 19, 2025 at 9:41 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > >
> > > On Wed, Nov 19, 2025 at 9:35 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > >
> > > > I have an idea for fixing it, let me cook up a patch. It'll still be a
> > > > bit hacky but will at least create a true link.
> > > >
> > >
> > > Scratch that, I didn't notice before but we register both devices from
> > > MFD core. We can just set up software nodes there.
> > >
> > 
> > Here you go: https://lore.kernel.org/all/20251119-cs42l43-gpio-swnodes-v1-1-25996afebd97@linaro.org/
> > 
> > Please give it a try. This is independent from this series and should
> > probably be backported to stable.
> 
> So think breaks more drivers:
> 
> https://lore.kernel.org/all/aYkdKfP5fg6iywgr@jekhomev/
> 
> I think it may also break:
> 
> arch/arm/mach-omap1/board-nokia770.c
> arch/arm/mach-pxa/devices.c
> arch/arm/mach-pxa/devices.h
> arch/arm/mach-pxa/gumstix.c
> arch/arm/mach-pxa/pxa25x.c
> arch/arm/mach-pxa/pxa27x.c
> arch/arm/mach-pxa/spitz.c
> arch/arm/mach-tegra/board-paz00.c
> arch/x86/platform/geode/geode-common.c
> drivers/platform/x86/barco-p50-gpio.c
> drivers/platform/x86/pcengines-apuv2.c
> 
> Thanks.
> 

-- 
Dmitry

