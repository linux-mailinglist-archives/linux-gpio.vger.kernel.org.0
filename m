Return-Path: <linux-gpio+bounces-17857-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F16F3A6BB49
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 13:58:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D5BD1629EF
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 12:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D05F22A1FA;
	Fri, 21 Mar 2025 12:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="r46ZbeFb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C682A22577D
	for <linux-gpio@vger.kernel.org>; Fri, 21 Mar 2025 12:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742561891; cv=none; b=R3nhJEqbwF6+OC6dI8mL5Zv3iu2HNhDaR5qfuwlXCV7Ky7G2kRqUjgaE6ejpe3w0ybS1hWD6m4LUZZwDBj7qdJF0dQGoUTRLj+eRNhL1GAqv7CBn+mV0vRD6yUvrJfqvqb+sTzSVRlWto5P4mh5ltfk3hTCAKCW4GtzWfC+AZ34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742561891; c=relaxed/simple;
	bh=z280nvWzjqH8OYHL1W8OEOgilfnYgC2eoWxNHeg0wg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oCHUyE2TajY7CjQy49+ErCV44pQIBj+4PdCUbJ8IlV2DfIZMcyshkJm9G1YwBxZuhp5vSu6hkchhuwOZ4q410NUQwD3Ddl5AlzWlyxoU8nTadBuvvX82QL/+71SHvDCe8jFyD10vbYNx8vyCgNT7JtqK+RdgtItAaJZVznEzDSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=r46ZbeFb; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 308333FCD3
	for <linux-gpio@vger.kernel.org>; Fri, 21 Mar 2025 12:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1742561886;
	bh=X+ZxtkB2s36Lzp8qMWZfvuM9LlrSk+y4q9/dnnBXlIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=r46ZbeFbaQc2s1U2rGVptHh4X3X4AcR1SpsE+LgaJd0z2exSuBYYFC4uCNES1NDIG
	 8x99jE0tUC7ShekFzwSMcfgZWs6v+Cq+BXXyfpymJ/ykGuf91IDAQzqVzcyovf6wL8
	 G5EUubddt8G3iQ9KUW8jDoZEOnyhsOxpF/R9spN04fo2rdtbRJFSKqXN2Eg/oPNeKf
	 Qt7Uy7XauYqEW67lipH3qYdhlcdg4FasUhOC0xmBqAHyE0GbIMxmKNeDCXBZ1uwq+z
	 H8Jr+DuGsVPYfiCiuGi7baMab42ye5/N25NKu6piY2CxyDVONDKDHYApw7TwmX+U9E
	 mxeByENxtwXjg==
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff798e8c90so3121279a91.1
        for <linux-gpio@vger.kernel.org>; Fri, 21 Mar 2025 05:58:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742561884; x=1743166684;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X+ZxtkB2s36Lzp8qMWZfvuM9LlrSk+y4q9/dnnBXlIc=;
        b=cbtl521PB8DgfTTn98BSVY9CzCxOIUA4TOKgbww8MraGYa2/49++WGKtK/x2HAzoda
         dDXiNxsd6Sb4TsyRM3ZmXeUkIxw3cHJmDVmqaPNkxvDdJ0zQVRvvQZOzaN9JSkGcCUtJ
         6f1rSZhikgReXNQDpIUjte2fpLm2s+wzuODBpvGtPbUBVaVv0lZiOZmZunQrhO4CIavx
         IBFODYqRht5zz/eXX7Lh2eWj0N2feeFCOHDMJ/lZXz6Iie/OT6xjgxJY2O8YKu50jCbR
         zi7Wpp/5AtrM5S73t1UFFtMtlAzgyHxxuyI8NTrE4eSOpo5+6qAvi9r9JtbkmITGiJrq
         /9nQ==
X-Gm-Message-State: AOJu0YyZKnjlbCbsYFk2Wi3P+FsRHx8YGieBaTcuR+nmlPX2ITHU//c8
	zaRKGaxjpB20sTghLbBzbNcLO10bfwB2A2WrcHjErECVoUv2/HMc79DFVZl8reqvM+UCeMt3xxd
	44hfWtDdPEKRTY0fitK0FnBpy6cidMVopOPiKVkkSFWogzYcuSy8I4q0nbnw6k6QtIGhE29Msn/
	hVNxfpPps=
X-Gm-Gg: ASbGncsI+k1DFW6s36GmMoJ3F2AyFO81LJpYLcrLdIfNTJtJFTaraWrM3PoisyswJ0E
	vjFAA3O7kBPfT1wY9jzJwSBx0WDBGasrSQ/m3KyuDPBqWIu3/4lI2f6pciaksQzCGSMbygG5CuE
	uJsHPnib35qWH6P9eBDNjbZxj4UOwyps5x4GQfaZfCY360M3Zr2mQ19f6AZ1pFGpqX6iGkyaOqw
	JKAxG7JhWxyTX4dnlBm8acOITnYRIkkRxQoTD1LaQzURVDYAITaqcM9tfelEnKRHF3oHNzkj2Uv
	SqBBBsAwGRDUKZLXhg==
X-Received: by 2002:a05:6a20:12d4:b0:1f5:7ba7:69d3 with SMTP id adf61e73a8af0-1fe42f2c7d7mr5640355637.15.1742561884002;
        Fri, 21 Mar 2025 05:58:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAEIXvDR9YkcYynUamT4Rrj+f3xywPdxSw4vlWDu7dDWi1/XRMEfsrj2VE7GMw5RZlAgHBMQ==
X-Received: by 2002:a05:6a20:12d4:b0:1f5:7ba7:69d3 with SMTP id adf61e73a8af0-1fe42f2c7d7mr5640313637.15.1742561883547;
        Fri, 21 Mar 2025 05:58:03 -0700 (PDT)
Received: from localhost ([240f:74:7be:1:2dba:1af7:27b6:24fd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73906158066sm1770268b3a.150.2025.03.21.05.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 05:58:03 -0700 (PDT)
Date: Fri, 21 Mar 2025 21:58:01 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 4/9] gpio: aggregator: introduce basic configfs
 interface
Message-ID: <ufka2h6gbtjdvg3fokmhx3ql5h4chrbu7cooi6ej6vhxcblrog@j4gxuzb64atv>
References: <20250315164123.1855142-1-koichiro.den@canonical.com>
 <20250315164123.1855142-5-koichiro.den@canonical.com>
 <CAMRc=MdOSsakJm4H5=cqVzdKDrrMFO2t-wKVWRCU83saozepxQ@mail.gmail.com>
 <6mcl34zdx37gjh3a3y4lc5kgb2vv5notvs355oewiwogpgg5g7@jcuukymbifnm>
 <CAMRc=McpqUsEsMSfwo+WrzWdaW6YnMbptpj3fAoS-JfVhSm9mQ@mail.gmail.com>
 <oneoncbyv3iwb54kvjvmerv4xxhixgeqp44ubeikvy4yst3az3@g5c7uxgkonbx>
 <CAMRc=Mfg1aNUQ+HeJurEH15+6e8dhmDS480SLOcmwOGP1u+iyg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mfg1aNUQ+HeJurEH15+6e8dhmDS480SLOcmwOGP1u+iyg@mail.gmail.com>

On Fri, Mar 21, 2025 at 01:42:49PM GMT, Bartosz Golaszewski wrote:
> On Fri, Mar 21, 2025 at 1:33 PM Koichiro Den <koichiro.den@canonical.com> wrote:
> >
> >
> > Actually I wasn't aware of [1]. So let me summarize: does this match what
> > you have in mind?
> >
> >   Before this patch series:
> >   * forwarder:        gpiochip_fwd_* + gpio_fwd_*
> >   * sysfs interface:  new_device/delete_device + aggr_*
> >   * platform device:  gpio_aggregator_*
> >   * module init/exit: gpio_aggregator_*
> >
> >   After this patch series:
> >   * common utils:     gpio_aggregator_*
> >   * forwarder:        gpio_forwarder_*
> 
> Best don't change it in this series unless you touch the code. If you
> do, then yes, gpio_forwarder_ works.

This patch series does not touch GPIO forwarder code, while touching all
the other things to some extent. Ok, I won't change prefixes for forwarder
codes.

> 
> >   * configfs:         gpio_aggregator_*
> >   * sysfs interface:  new_device/delete_device     <-- _Unchanged_
> 
> Do change this one to also use the gpio_aggregator_ prefix.

Alright, so what you want is: everything except GPIO forwarder code should
be prefixed with gpio_aggregator_ (perhaps except for some small exceptions
e.g.  to_gpio_aggregator()), right?

Thanks,

Koichiro

> 
> >   * platform device:  gpio_aggregator_*            <-- _Unchanged_
> >   * module init/exit: gpio_aggregator_*            <-- _Unchanged_
> >
> > Thanks,
> >
> > Koichiro
> >
> > >
> > > Bartosz
> > >
> > > [1] https://lore.kernel.org/all/20250317-aaeon-up-board-pinctrl-support-v2-0-36126e30aa62@bootlin.com/
> 
> Bartosz

