Return-Path: <linux-gpio+bounces-3223-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B75748527A2
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Feb 2024 04:04:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BCCD7B2240D
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Feb 2024 03:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 153B08BFC;
	Tue, 13 Feb 2024 03:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PCTVKcVV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7D88BEB
	for <linux-gpio@vger.kernel.org>; Tue, 13 Feb 2024 03:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707793456; cv=none; b=IcNNUiB/PNVlr3TPsU2Y2xuMNHx6qJWqCwCH0i2zV3rADZqIiMfGwhXRWOij0bODLB1x3tPYLyaVaO/QpwnSfayPy1l03fPr2YJ3zlbhs2sjtabbR3Hjig1dYW4YLtbUC885WKBNCVPoCV3FSgr18eRxNzPd1dDt3kU+4kjAFpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707793456; c=relaxed/simple;
	bh=9lHURotUlCuVLR7gp+x8RxXYFBrpBUZ842wEydhtyOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dMikTjnc4WylmJPHR8Ee2i93Vf10c/gAlK1uS3xWEG7LHhmo+lzxUZ+t0qeQ7ixtW7tJGzchNHldGD8+QhdEPEHemVwzpyBQYwYNhk63VNr9ilPOHn3EOFdXGLCcbEXrnvRLklCBomleshIquwqtkI6MUcSqwAYESu1o3x/li20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PCTVKcVV; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5cddfe0cb64so339830a12.0
        for <linux-gpio@vger.kernel.org>; Mon, 12 Feb 2024 19:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707793455; x=1708398255; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ije+LoRsi5iy2jy7/vJJnoc0piyfSPsPlghXR51BEcU=;
        b=PCTVKcVVyeexS/g0Ln/L8OujabUMwbFl635hCAeagncalmSnZ0p451569O7z3z+5Xy
         1Vj8xvjfrpoutK9JrmdHfoR3KCJHSzg8NUl15TY8VAc+i7B2O9aOcXystpDs1BZH5Wsq
         e4mOOgx/1tF0E2HRDlOw9rcK3ys/7d6GNGK6VlfMtao2smdOEtRl2ZyPkfX9jPoMKmh8
         JEMg2F47Mlqoymdae8tcAUXTd/071jHN3kHF7HeYqJ+TIUJPcAR8ssYmR124flxjimEm
         b8imHYyO0KRCCYY/Ee8GFy2Vm3dNqzi6mgawujMVTRvwxeFHQ2bTNhwU3z6UhDM0Ws5u
         s8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707793455; x=1708398255;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ije+LoRsi5iy2jy7/vJJnoc0piyfSPsPlghXR51BEcU=;
        b=bxFowxEnO8Pve5j8KJ1I13UTc691xMCh4jXAGvm46hCkgb0DpJ0iVQU5eMHe/ZD5Wn
         LlnVJ0rFSKsxsjaQjhs/A/FxSOGi4pe3KL+U7LmlUV50D1yKCg8GyUPXz4BQGLDhOoaF
         BI3eMMFb5YSOBml7AxKzTbEQ6sieB264hy+xzLPJJjKuSRF5IWbmR/nLbOcQyqDbapVz
         UhMkgQfnxDD7aOEcAvp+BMx005TsGbsc2c02PB/64bne5eWbZZeAwKaszuBDkVZlmF6V
         yhOEaJRFVo3qX7yJR+DCQmTVdnkUa6yb9p0zUThUUkxOV93bXzAuwJJGDsBPbQa1dIQi
         7p8A==
X-Forwarded-Encrypted: i=1; AJvYcCUzEPgwDL0jyIBGrFnGawqLYYfTPeevb7dmg0kLdCFXRZdybAjm/Gr70u37kl9ExzwX6Tsw/uhDPEJyHAkSFDZF4CyaAp/Vhl9RRA==
X-Gm-Message-State: AOJu0YwfViDn4W/eX7BaRQewIM/vcuPK+paaE2l9qMvtPAi/pK7u27e+
	fv4K3Y2NWg0iEogu9bavy2dbdj/Kq0PQ0hzRcpfy0r83AeES97vi
X-Google-Smtp-Source: AGHT+IGU/kOmzjl7sCh1yY3LTNpwUhbcKSC2TR+f67a5w0epil35H9hWa0uHux+/OMXSm29rOLvSzA==
X-Received: by 2002:a05:6a20:9f4b:b0:19e:b9ba:1a6a with SMTP id ml11-20020a056a209f4b00b0019eb9ba1a6amr6590116pzb.49.1707793454672;
        Mon, 12 Feb 2024 19:04:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVy0H0fV+UpN5MWBGUE28rnOiz7rhTBf65vLdnk1IwPLmNS+XAgeamtNruoJuiXjO6cfnUCBiz+poDmFCgD8tGPUVF6M4DBfc+nH0HvaoTr6NCGuEVJAh1YO6lcK3gHm5onYJMMQjM+/kOYz3H0QMnIDUJOZJav
Received: from rigel ([220.235.35.85])
        by smtp.gmail.com with ESMTPSA id kq8-20020a170903284800b001d7610fdb7csm1018593plb.226.2024.02.12.19.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 19:04:14 -0800 (PST)
Date: Tue, 13 Feb 2024 11:04:09 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: WARNING: fs/proc/generic.c:173 __xlate_proc_name
Message-ID: <20240213030409.GA35527@rigel>
References: <39fe95cb-aa83-4b8b-8cab-63947a726754@gmx.net>
 <CACRpkdax5HaGoW+uZzt0v2Bx+1sPErYRZh7FWQixd0AFFTeiwA@mail.gmail.com>
 <CAMuHMdUCR5DxBW9yxqukq50FRpSsYnP=Lj20QKJtAo7hz=5yUA@mail.gmail.com>
 <CAMRc=McSdtnqLWrRHoi=6bAuUWfvGqnB+B9FavDDrMfH2vbCkw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McSdtnqLWrRHoi=6bAuUWfvGqnB+B9FavDDrMfH2vbCkw@mail.gmail.com>

On Mon, Feb 12, 2024 at 03:11:43PM +0100, Bartosz Golaszewski wrote:
> On Mon, Feb 12, 2024 at 2:47 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:

...

> > > >
> > > > I'm not sure where this should be fixed.
> >
> > Any names ending up in sysfs cannot contain a slash?
>
> It's actually procfs. Every irq has an entry under /proc/irq/xyz/
> containing a directory named after the name of the interrupt. In this
> case the path of the directory would have been /proc/irq/xyz/R1/S1 but
> of course this wouldn't work. Should we replace every `/` in GPIO line
> names with `:` for interrupts?
>

Agreed that the consumer label (not the GPIO name, btw), needs to be
sanitized before being used to create the procfs path, what I am uncertain
about is whether that should be performed in cdev, irq or even procfs.
If cdev then I would also like to see irq document that the devname cannot
contain slashes - it currently only states:

 *	@devname: An ascii name for the claiming device

Sanitizing with ":" works for me.

Cheers,
Kent.

