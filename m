Return-Path: <linux-gpio+bounces-10253-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4A697C343
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 06:11:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 209EB1F22446
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 04:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA6C911711;
	Thu, 19 Sep 2024 04:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NhNQ+f/9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF55156E4
	for <linux-gpio@vger.kernel.org>; Thu, 19 Sep 2024 04:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726719100; cv=none; b=pmGuiost3p7R1UdyuRzb4yn8JofdSw9M9iDbZwmRgWNGdeYD1zYTqik1YkWReXhnjM86wS0KQn4ALzcF/41H5PajOpQDECbG7AkldoyFlcJR+v5VEbLeVzaGkHzmWqW7+LihkLTGHwnvWCMvECdrMEtBwk+9J2F4yZhYne8/Dyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726719100; c=relaxed/simple;
	bh=zEYYAv3qczRpJviXmtASr0i05BM1eBkKyYqxvu2Ua2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=skOA4rBdQjVPzKVemh+WlsxVDthiyKH/ZbV5YzYzz87dZPrd1pEcE0JCw752hwvgK/CT0B1uvKzcIBI6Z/1f843AUJnvMALuJfw37VQ86OF/ZwS/cImw4EEd3d8iMNhexZAIc6waBjk7IfguSPKbJqkmjNwWW+A9C5ysmGbo6zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NhNQ+f/9; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20573eb852aso10335115ad.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Sep 2024 21:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726719098; x=1727323898; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=029Ua4wyEzH22324VMaORAzxWfqDBatJKTLEcCR/GiA=;
        b=NhNQ+f/9x3GnnhXgHRkZxfqPm/lZj988socFkIFJ+c6TvQhj0taUS7a7HDwIVlGH5Z
         cPYvdZN6Vvv3OPoA8OnoglJXl8d2tfisP+EzPpnZJR39xBGpq6qR1VVjfIcaABaXTTM9
         K7UFu9qJkEdySmCwpwYGgfjTFZSz6qcq9ykMEJTsnv/Y6Us1O7CWm21XSLfGirz14zNp
         P2z+qZ6fOeYCP260mV5/7/0jhMlPpve/e0ktIkL6EDj7si4mTjw8OxWO9MJz5khLSPXM
         E8lf/6b2957BTKYEpc6qg/CgZlpUD4nGKftdG/ITa1izS3najXQYfsXgoKkEEG6QPiBP
         Mwnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726719098; x=1727323898;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=029Ua4wyEzH22324VMaORAzxWfqDBatJKTLEcCR/GiA=;
        b=sYI+8TXfTyhptFNqNg4XfHnjp8W4aNF7MybnL+ikZ7jRIFFoRAF0xQt/U9ohtjbDsf
         PznDXxdQXRQw+IdnU4Zx3J7GV7f7fPdchdNyak/onVDj2L+LSAH4Zk3aUcrqI8gJZfcz
         m4cCI5ryHkS3xa+s8Lc/TitcISJOt6ed1eFUm3e8/lZVSoD3UkipOJBI2R5yVjh9+uX7
         u5VgxFmJT5cu6s6kSxCyYnti2VHIYILAgcI6issMq34hqJ63JmOnwgslWEkJHFy82XeB
         jwhImC57MXQt1ORSu+fP5s1OD37UugJUk7Pn3KGRia3gP1hSYJh7Q5N4lqbxTHPSTpHY
         e0ig==
X-Gm-Message-State: AOJu0YzHivUVRodKdbf7av4kyDaNFcnvMKcu0Wj16KR0ITd9/tOUP9jo
	qu1GgjjPLx1dCebd9XGoh0tfWHp0XCJfWbAoE5Ih1fuPGe5Azu6RMU4eAUQr
X-Google-Smtp-Source: AGHT+IH6r/DFDqCbtq3M2Cf1PVNTD9i0cRlXIsoW4QhRiQjiIbziGJKASFvDT2P/OHehsbhW69AoUQ==
X-Received: by 2002:a17:902:ccca:b0:205:59b7:69c2 with SMTP id d9443c01a7336-208cb8b3888mr28931535ad.7.1726719098273;
        Wed, 18 Sep 2024 21:11:38 -0700 (PDT)
Received: from rigel ([203.63.211.120])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946d1814sm71820655ad.150.2024.09.18.21.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 21:11:37 -0700 (PDT)
Date: Thu, 19 Sep 2024 12:11:34 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Matt Walker <m@allocor.tech>
Cc: linux-gpio@vger.kernel.org
Subject: Re: MCP23S08 Pincontroller Bias Configuration and GpioLib
Message-ID: <20240919041134.GA54544@rigel>
References: <CACjtZiReNNqzonwri51fCPArKR-D9nzQ4HgZAM_EFdzUW0LGOg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACjtZiReNNqzonwri51fCPArKR-D9nzQ4HgZAM_EFdzUW0LGOg@mail.gmail.com>

On Wed, Sep 18, 2024 at 09:21:11PM -0400, Matt Walker wrote:
> Hi all -- I'm trying to do GPIO from userspace and have run into some
> confusion I could use some clarification on.
>
> Assumption: It is not possible to set the pull up bias for a specific
> line from the device tree and expose the line to user space. And it is
> not possible to set the bias from the old sysfs gpio configuration.
>
> I'm therefore trying to use the GPIO_V2_LINE_SET_CONFIG_IOCTL to set
> the bias of the line. However, the MCP23S08 (pinctrl-mcp23s08.c)
> driver does not have its implementation of struct
> pinconf_ops.pin_config_set called. Instead I had to add an
> implementation of struct gpiochip.set_config.
>
> Confusion: I thought the pin controller was solely responsible for
> configuration of bias and that the gpiolib would magically know that
> it needs to call pinconf_ops.pin_config_set. Since it seems like an
> unnecessary duplication of effort to set bias config in both pinctrl
> and gpiochip, I figure I'm missing something. I thought it might be
> that the MCP driver does not have an explicit call to
> gpiochip_add_pin_range, but that wasn't it. I also tried adding the
> pinctrl definitions suggested in the device tree mapping, and that
> also didn't work.
>
> Thanks for any insights anyone might have! And if there's not a better
> way, I'll clean up the driver and submit it as a patch.
>

Not my bailiwick, but looking through the code (both gpiolib and drivers)
it seems to me you should set

	mcp->chip.set_config = gpiochip_generic_config;

to hook into the magic that you are expecting.

Cheers,
Kent.

