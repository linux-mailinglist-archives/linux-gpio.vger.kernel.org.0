Return-Path: <linux-gpio+bounces-16665-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 988D3A46DD6
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 22:46:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A29C63AA1FF
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 21:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4D9225D529;
	Wed, 26 Feb 2025 21:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xk/u0j4I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F4025D520;
	Wed, 26 Feb 2025 21:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740606382; cv=none; b=It2DYItEUQQqvhqZd9/fUh8FqCV7RG+/JCAsBY6OPKt8EF0fGasicYhUAJcnuTull65B6Z5knTD17vR5CBUARIdR5xUUZ3lWomdQxgDNIPABsWkjzanOBnth5hV4mQ6G/cEHo7wMp9rcImdvcxO3/EEotXFWSYce8sKZ/w5izgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740606382; c=relaxed/simple;
	bh=vDS2m86MVEOOJ/jODeGIyoehwvTtnHgSNxooCbbAH/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N5H/v5zI/JezE6bEBwF5swVIeuL14hDg/N9VfGWCTYqf1kfOawDqZdfWT9d+7zBA/P98RIvtFlFkEyTifzXmn3XY5Q89TlSkB92lIJkJBHV+4fL4nCFlnF9xUtdbOBDxOnT6lJdkCX2pQ86diJBml23n3akWx4B6eT19/JfF8xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xk/u0j4I; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so2110355e9.0;
        Wed, 26 Feb 2025 13:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740606379; x=1741211179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v52o9iFz2RvmSJmry90JmfMqduEAHrHJVM746pOYQ90=;
        b=Xk/u0j4IekaZzyWl3dszAqoEpIR1p3tNOc4D6bAPpBDd6oUfe2AZRluGdPOrs0ISH9
         6ayUDsfTenHDjJaiRCv3ByPaelX5ZPqFTB0idI2tDXWWvXFaQIzXROm1IZkOKpwdDBu0
         6qHU8qAVStiqOswgKTMgsfx3zf8JMDGp8x5R7jxSOUmJ9hW/C8+CUrFmONxizZ1e/35T
         tJPEg1DEc4Hh44ohp49QLtcXfmDbhuOEzS0eCbrWCOBd3Rd6xLE0MxEPGWVi/swTKPMD
         8Xtqrv++K4q/Wwh903NJ7pNPkVJWsVU4NTw017MeT1TzrydvEuWV3dLojmAxnQOhyqhc
         EEFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740606379; x=1741211179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v52o9iFz2RvmSJmry90JmfMqduEAHrHJVM746pOYQ90=;
        b=Gi+qnLCdvqbtiA/QSmEDLHjhH+v/drt9f1q9y9fL8DS09YZwNAgM0IttIaJGFWbIR/
         ay0WcxEc2blDM7sdu0eL9DSGGyQ0icBlLZ8GJSIOgKa2XP4eai3EfEeZ6L/Ti0fV+KsP
         Ck7UWUJgvXh5fre1l1nvZ7tsKYuShLV0YyxSuUhmd4lHP+7t+EBlWwYLzScKH45qKS5E
         FChaXihn0kzdWNBkdTV6vxyySc6oJXTtTGmzWsHhpFJTua/8KEPR6/02bLBIzD6d11Mx
         LA0tT3jJFaWW4kqS3sLTnrtxdnq3wamTqZvpg/VidOSMto2bOMMmZLHoD8fyiX/i8hnU
         q+oQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3cdfcB8wQA2zNy0InLcJlKDzJrdY5je6SHUXlaQuw2rTlm0tLhsg07tBBzm0lNAU4OhAXLxFASHI/Klda@vger.kernel.org, AJvYcCX6sHb9+ZmWmsD2Es8u64i3KBs3Ys8jbHu2wvXbuKGIIKI8qSokUmG4qQKihZnDW5JhyvGMmunEN2Tq@vger.kernel.org
X-Gm-Message-State: AOJu0YysfBbscqtAVdLMUJrXWH1DJwJlV7cqYsH2WjpuUDSFHA+tbNRL
	c3/Cv69T1BpKSdQbTKxrhJZHAQQB4gwNyr6LyZCfzpQyx+UWpx8k
X-Gm-Gg: ASbGncvAR26juGInw6tzPk5E+D+fvdTsLNq/zeVEM2juFeGwSahV7HYnFZedHzGeb8Q
	0+39QjFInmCZ18XpSWO27Cyh/2NbrMb1FMyBlp9CrwFiu44t1IRs6BamqITr2+pkVv+slOuZeZH
	k1E+ixD1SkiDG34xs11vJj49XrFeo277/xg2LxgzGDTv52cMftEIHHD3lGvpthI5I5Ff4Bo3KGZ
	dxF5edMIv6yDktbyZdKoZRpr8pG8b3+7JY+nPgi1h6YYX+uJJlBraQtHQWPTsM+pa7lT+Ri+Ejx
	TCfSx1UeLuPXT5MLdw6RQGqee7+eZfPjtliVRKBGeRuCSVQZV6K4RvGJkxuh7Yr5
X-Google-Smtp-Source: AGHT+IH2F/nrBIX+jYcZEENuWK+JQ6D/Yvxr0QqyXWYSNiGB6DiVbth6DgCaUN9pisIAXAjJHPHLwQ==
X-Received: by 2002:a05:600c:3b04:b0:439:98ca:e39e with SMTP id 5b1f17b1804b1-439aebc36a9mr152755485e9.24.1740606377462;
        Wed, 26 Feb 2025 13:46:17 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba532b0dsm33608875e9.13.2025.02.26.13.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 13:46:16 -0800 (PST)
Date: Wed, 26 Feb 2025 21:46:13 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
 <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2] gpiolib: use the required minimum set of headers
Message-ID: <20250226214613.1e814f9a@pumpkin>
In-Reply-To: <Z72fBfM4afo5SL0m@smile.fi.intel.com>
References: <20250225095210.25910-1-brgl@bgdev.pl>
	<Z72fBfM4afo5SL0m@smile.fi.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 25 Feb 2025 12:44:21 +0200
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Tue, Feb 25, 2025 at 10:52:10AM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > 
> > Andy suggested we should keep a fine-grained scheme for includes and
> > only pull in stuff required within individual ifdef sections. Let's
> > revert commit dea69f2d1cc8 ("gpiolib: move all includes to the top of
> > gpio/consumer.h") and make the headers situation even more fine-grained
> > by only including the first level headers containing requireded symbols
> > except for bug.h where checkpatch.pl warns against including asm/bug.h.  
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> 
> FWIW, I have checked the current state of affairs of linux/bug.h vs. asm/bug.h
> and found no possible issues with the dependencies. While linux/bug.h drags
> more than needed into this header it won't prevent cleaning up the rest of
> the headers. So for now we can stick with linux/bug.h, but at some point it
> would be better to be more pedantic on this.
> 

A 'fun' activity is to pick a random file add "#define _IOW xxx" at the
top and see where ioctl.h is is first included from.
(I've not got a build machine up at the moment.)

Then start fixing that include sequence.
Moving a few headers around is otherwise pretty pointless.

	David

