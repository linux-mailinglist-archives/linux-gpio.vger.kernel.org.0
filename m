Return-Path: <linux-gpio+bounces-11199-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B66AB99A8EC
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 18:31:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A05251C23192
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 16:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2E4B19AA46;
	Fri, 11 Oct 2024 16:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="SQKDUqxH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97391990C7
	for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2024 16:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728664277; cv=none; b=YOQAdQ+6osMzCOYIdQSsTWZdZUcx1uWIMa6VAOM4wn0VKdTUlrl8DUoQB/0GmnsFiI6MHzKUsg8ojM4zDvl99i1RbFA8LiHacE9ux0ME3Gqa41Ly3bmpP3Bq+Ksi9PHcL59MY8ndVITHG3bXB9qad09EIrKiN1sTwATt4x/NDvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728664277; c=relaxed/simple;
	bh=32Mjcd2dJsumm+btTsVmfBP+NbjBoMPuUy6307MRM+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SBb0rt+s0j/YgzYdeI0dR2LfEzQHaPjBaWyK/l3cgaATTzWGOj4NGGziux8R5lojN561FeuAep4RYoZSoRZ4oHQ72pVxNer0ZezW6Ie1w6zHA9WFyu+DpKgXjSKueeO+02QJ0MHAXUguP1D5PtYaW67v3OdTErvAEPIneNp1r9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=SQKDUqxH; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7db54269325so1929929a12.2
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2024 09:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728664274; x=1729269074; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ymJ/qex09j4ioztSVDBbfNAos9AY+mRR2jHbKLcRzPg=;
        b=SQKDUqxH/+TpHnQVGvczsZAfr/bmo6dc9a1J+jx7Vv8N+0qhwQn40uVobe0ySs+rCq
         mSdJgShmtBPF4I/7whVApyOshP0s/FfeLECl7GtujkcLWSeHeFnRvX8aunvCLWKllMqs
         y8m3yw0rw6xSjKEafA3YTF7SqBuW6Z+xHTzjxnVmsC4JHI0q55RpxcyMuzqDbKjuxBJb
         eEOM5MtGNy9hSFkqeuUxYy60Jk+9Aayk5je3HjSJNPkuir/2OogSDt5V/G4qO8kmDKKy
         ol6Nrcngo/XVN1ccWsdmZp7Jb8vcpRp8cG2JB+o6UeYOFaGGGCG+9nWPdHBIOHpacsF/
         9fpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728664274; x=1729269074;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymJ/qex09j4ioztSVDBbfNAos9AY+mRR2jHbKLcRzPg=;
        b=EAxALROkJJOrSaKZXCbK0J72XRQv90E8SNvAclScbthWpVMFHXwEiEXKmqxiebJ83F
         3/lO9dDIv4lVmkZUJHA91QIfUIE4z+fdjUlpxh8ttSkOQ3jaKOGadyQsDgzBklFXl/de
         Nx3ov/dWbGLV8phgWTeV6c2ajVvOiJuhyDLL9gZCVjumGCbgCrw1vcsJxbJn4Zqb2g3f
         AdogY+fFgTjmdHfA8KPDPvS7DcP0liNrYcLZrQmkrO4pU6ag4hkboLLruuJoZkdrht72
         a00CnU50s478/z+CyDaP0Sl4rpzP41rFZ1X2whleXlYI9vu9NlFj60F8VS+pu/aYHCs8
         v/Vg==
X-Forwarded-Encrypted: i=1; AJvYcCWttfPSNOux02El9esqg5UX1pnMsoLsunBzPXnwDpgRrwiMc1KODZp/O4r3oa3VvuBv0RLNqYTji/xQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2pc2er6vQi6JYX83JwLq79Z6c+JUs6eP5cF3f9rODa0v5+UU7
	SZQNqwL63wNrHTCmXJJI/lKmO1nuTStFmYaubX8cxc5Q6fc3BDkvlCVvJfapjDTvVLv+q9kqmYk
	H
X-Google-Smtp-Source: AGHT+IFZHNKSdlUtyflW/oAl3271oyzHBL3EezDm4ZEZS8ioT4B/wsLs4jMN4bfjeIMRhEIYEroxww==
X-Received: by 2002:a17:90a:4b0f:b0:2e2:bfba:18d4 with SMTP id 98e67ed59e1d1-2e2f0b3b53bmr4317697a91.17.1728664274280;
        Fri, 11 Oct 2024 09:31:14 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2ea9d4145sm2092573a91.18.2024.10.11.09.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 09:31:14 -0700 (PDT)
Date: Fri, 11 Oct 2024 09:31:12 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Subject: Re: [PATCH v1 2/3] pinctrl: th1520: Update pinmux tables
Message-ID: <ZwlS0FiKfiPjhNSf@x1>
References: <20241011144826.381104-1-emil.renner.berthing@canonical.com>
 <20241011144826.381104-3-emil.renner.berthing@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011144826.381104-3-emil.renner.berthing@canonical.com>

On Fri, Oct 11, 2024 at 04:48:24PM +0200, Emil Renner Berthing wrote:
> When Drew took over the pinctrl driver it seems like he didn't use the
> git tree I pointed him at and thus missed some important fixes to the
> tables describing valid pinmux settings.
> 
> The documentation has a nice overview table of these settings but
> unfortunately it doesn't fully match the register descriptions, which
> seem to be the correct version.
> 
> Fixes: bed5cd6f8a98 ("pinctrl: Add driver for the T-Head TH1520 SoC")
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> ---
>  drivers/pinctrl/pinctrl-th1520.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl-th1520.c
> index 03326df69668..8bd40cb2f013 100644
> --- a/drivers/pinctrl/pinctrl-th1520.c
> +++ b/drivers/pinctrl/pinctrl-th1520.c
> @@ -221,9 +221,9 @@ static const struct pinctrl_pin_desc th1520_group2_pins[] = {
>  	TH1520_PAD(15, UART4_RTSN,    UART, ____, ____, GPIO, ____, ____, 0),
>  	TH1520_PAD(16, UART3_TXD,     DBG,  UART, ____, GPIO, ____, ____, 0),
>  	TH1520_PAD(17, UART3_RXD,     DBG,  UART, ____, GPIO, ____, ____, 0),
> -	TH1520_PAD(18, GPIO0_18,      GPIO, I2C,  ____, ____, ____, ____, 0),
> -	TH1520_PAD(19, GPIO0_19,      GPIO, I2C,  ____, ____, ____, ____, 0),
> -	TH1520_PAD(20, GPIO0_20,      GPIO, UART, IR,   ____, ____, ____, 0),
> +	TH1520_PAD(18, GPIO0_18,      GPIO, I2C,  ____, ____, DPU0, DPU1, 0),
> +	TH1520_PAD(19, GPIO0_19,      GPIO, I2C,  ____, ____, DPU0, DPU1, 0),
> +	TH1520_PAD(20, GPIO0_20,      GPIO, UART, IR,   ____, DPU0, DPU1, 0),
>  	TH1520_PAD(21, GPIO0_21,      GPIO, UART, IR,   ____, DPU0, DPU1, 0),
>  	TH1520_PAD(22, GPIO0_22,      GPIO, JTAG, I2C,  ____, DPU0, DPU1, 0),
>  	TH1520_PAD(23, GPIO0_23,      GPIO, JTAG, I2C,  ____, DPU0, DPU1, 0),
> @@ -241,7 +241,7 @@ static const struct pinctrl_pin_desc th1520_group2_pins[] = {
>  	TH1520_PAD(35, GPIO1_3,       GPIO, JTAG, ____, ____, DPU0, DPU1, 0),
>  	TH1520_PAD(36, GPIO1_4,       GPIO, JTAG, ____, ____, DPU0, DPU1, 0),
>  	TH1520_PAD(37, GPIO1_5,       GPIO, ____, ____, ____, DPU0, DPU1, 0),
> -	TH1520_PAD(38, GPIO1_6,       GPIO, ____, ____, ____, DPU0, DPU1, 0),
> +	TH1520_PAD(38, GPIO1_6,       GPIO, QSPI, ____, ____, DPU0, DPU1, 0),
>  	TH1520_PAD(39, GPIO1_7,       GPIO, QSPI, ____, ____, DPU0, DPU1, 0),
>  	TH1520_PAD(40, GPIO1_8,       GPIO, QSPI, ____, ____, DPU0, DPU1, 0),
>  	TH1520_PAD(41, GPIO1_9,       GPIO, QSPI, ____, ____, DPU0, DPU1, 0),
> @@ -256,11 +256,11 @@ static const struct pinctrl_pin_desc th1520_group2_pins[] = {
>  	TH1520_PAD(50, CLK_OUT_1,     BSEL, CLK,  ____, GPIO, ____, ____, 0),
>  	TH1520_PAD(51, CLK_OUT_2,     BSEL, CLK,  ____, GPIO, ____, ____, 0),
>  	TH1520_PAD(52, CLK_OUT_3,     BSEL, CLK,  ____, GPIO, ____, ____, 0),
> -	TH1520_PAD(53, GPIO1_21,      GPIO, ____, ISP,  ____, ____, ____, 0),
> -	TH1520_PAD(54, GPIO1_22,      GPIO, ____, ISP,  ____, ____, ____, 0),
> -	TH1520_PAD(55, GPIO1_23,      GPIO, ____, ISP,  ____, ____, ____, 0),
> -	TH1520_PAD(56, GPIO1_24,      GPIO, ____, ISP,  ____, ____, ____, 0),
> -	TH1520_PAD(57, GPIO1_25,      GPIO, ____, ISP,  ____, ____, ____, 0),
> +	TH1520_PAD(53, GPIO1_21,      JTAG, ____, ISP,  GPIO, ____, ____, 0),
> +	TH1520_PAD(54, GPIO1_22,      JTAG, ____, ISP,  GPIO, ____, ____, 0),
> +	TH1520_PAD(55, GPIO1_23,      JTAG, ____, ISP,  GPIO, ____, ____, 0),
> +	TH1520_PAD(56, GPIO1_24,      JTAG, ____, ISP,  GPIO, ____, ____, 0),
> +	TH1520_PAD(57, GPIO1_25,      JTAG, ____, ISP,  GPIO, ____, ____, 0),
>  	TH1520_PAD(58, GPIO1_26,      GPIO, ____, ISP,  ____, ____, ____, 0),
>  	TH1520_PAD(59, GPIO1_27,      GPIO, ____, ISP,  ____, ____, ____, 0),
>  	TH1520_PAD(60, GPIO1_28,      GPIO, ____, ISP,  ____, ____, ____, 0),
> -- 
> 2.43.0
> 

Reviewed-by: Drew Fustini <dfustini@tenstorrent.com>

