Return-Path: <linux-gpio+bounces-16747-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9F3A48D4C
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 01:29:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5160A16E4A3
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 00:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECB99219E0;
	Fri, 28 Feb 2025 00:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nlmr8vVX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1E5276D3A;
	Fri, 28 Feb 2025 00:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740702488; cv=none; b=udXB/BdRbU0kjXvVaLlhR53UUYPwvlkwhvIo09j/Y6/Kx0gTiPyh/UEZRf2DH2xAOG8HMN+KifCBP/DuIqP/qTEyfs+b4VcV9bO3DfME4RegfnmM4NFm6qna3lEPL+ZL6VTKJ4aUa7t1kgWhfsDFN4hJxbmgxhQZJdao+z2d1ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740702488; c=relaxed/simple;
	bh=+9RsH0KPu6vWpOP2lmZTuskumM1aLXqb6Juv4x/xNSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gFintr0ifY+AJTEI9amjWiM4p7rq4C5/tFX5eVtWueZlLhQ40/95364GOY0+AuhShn8JftRz8iLWIwuB4TyzjP9GrvOZG+r9nCwhR+gDVvhTaigIq9qcv70aa9dz9I8EYhWWm9SEKCggSNukGCbqNvgs9ydT5T0hlEdiTHwlwKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nlmr8vVX; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6e1b11859a7so6886876d6.1;
        Thu, 27 Feb 2025 16:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740702485; x=1741307285; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a9MGkH7t3nRTRnc4pXiJCICsI8ph23jIAM1ENCvMIuI=;
        b=nlmr8vVXvGOwfLLwNsg2rgWXeNUVo/mITJg+raMmr9CiJJ2vjOKl3dFdQM7MYbgt5I
         ghW3XsNTJsaVnT4VZOewRUOFN4ckfdM/c8l/mDTNA9q9NE9eEdSnt/K+9CVPDBtBDA/F
         Nx20mFsT0EPQuXKPdFesr+po/X/pN9XzbcEeF7oZRVAbBXb6kDXOHmXODnmeRxcq3fNF
         oxMKfYwac33w0/pWtPTahO4No4G/68B+3mo2XLHMCXdoL8943nTvvE5gcaHslHEHXFoT
         1eBrQf6+LJviWWiaFFVMPr/aqMMBPLjnq44xxDuDl7KrK34x+vlIknrZRUH+QoVdcBhR
         jZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740702485; x=1741307285;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a9MGkH7t3nRTRnc4pXiJCICsI8ph23jIAM1ENCvMIuI=;
        b=ejyD8FXoAn19nfpF9sTRlLY/j/qIn031gVvXC/M9CBLerlh9JE5G2pjBoNNEd4utbx
         a2TdQ2lBRQLX/r4//cdJMzCazaOOSh/0t0P04xh6mgIgxnO68YjObJzye3Zmmt9bI4eE
         7fM8ivAO1kK3RKreI2m/tsuOOP4g4JiWvTw3qRoYKCmKq98/+JqFECUf6YsHusJaURvf
         HzaKq6zt7xTn5ll75nOCMj4U5lJJcWZUdg3Xsf81jtKM2rX53jCmkrOsZP2KF0jr1E+X
         7wnJ07yIJZeSxH/MoZAMVgp5tM3ntciPXYMOWSygLvWeedmkZ4Yu4OHoZDGxm54644MJ
         eTrg==
X-Forwarded-Encrypted: i=1; AJvYcCU1/q7G/dcgf5piD3OA7ho0K/JmLW8lINl4FoV4x7dv3BV9GnUEpc1XcIQw30W4bDSVQw/adAN3/7haCg==@vger.kernel.org, AJvYcCVUcFTPg8jFyDJ71d1eLsfZOjVqDUTxj5t1FFcVQ6xccNfsitD8WmAix7bd4F0qlb/T4T7yjSAXraDQ@vger.kernel.org, AJvYcCXCkE0+UVIK/iV1pucSkRFBXnrrabejWHQp0K0juTqw7VxmplNMOZm6TLu/lqkTfaAZ+sNiy10GbR3VwWxV@vger.kernel.org
X-Gm-Message-State: AOJu0YwAE05CutVhgTXfiyO18+T4v4grp2FQkge6pyDX24uSSu8/RToP
	7ohiX6p0Nuu/s5niC9zZTdpRU7M573M65nVAI5egLMQI34xUU1UQ
X-Gm-Gg: ASbGnctX8eNHiwfs1xi2T077Q+elmJYPcZyzEvpfy+o+X4JNTORbUDVDTEliAZiWHOE
	Kmzy9Qwvo5vqfiZ7RtMYedR0SiM2HNrdKh3XQ8QCKCvKVF65ynHb9xbWm5WQCLWFfEp4cwZfQpa
	4QAS60OmEpKs6jBQLH9Iwlku3waIitalj9krxpKCEHcI3Y4dAtcLLPPAcRx9FTGjiYjkkzf+TTO
	Zlik1GkhVY8/doFZLLXY7J8Z4TAQO0U8MpFG55tKSfa/pRQiSMl2AuPGJia8OrMJorzHm1iKVqv
	FQ==
X-Google-Smtp-Source: AGHT+IFUPO2RW2JsYQqQUr6pL0sTdbw5IaL0xieXgH4JRQXakfoILurMP/9rER/IyNOwxRjJIl9ByA==
X-Received: by 2002:ad4:5c64:0:b0:6e8:9a55:824f with SMTP id 6a1803df08f44-6e8a0ccd0bbmr19941486d6.6.1740702485066;
        Thu, 27 Feb 2025 16:28:05 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e897634d7fsm15808146d6.3.2025.02.27.16.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 16:28:04 -0800 (PST)
Date: Fri, 28 Feb 2025 08:27:42 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 0/8] riscv: sophgo: Add pinctrl support for SG2042
Message-ID: <n2srdxjhpivvzolavm6hj65xybrn3qwmvq6locrgpz65aeiomu@yicfi6qltjir>
References: <20250211051801.470800-1-inochiama@gmail.com>
 <CACRpkdYfZ8izsBJaKUd__jXGHnDBU9Tha=2kozjzHssoppgY5w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYfZ8izsBJaKUd__jXGHnDBU9Tha=2kozjzHssoppgY5w@mail.gmail.com>

On Fri, Feb 28, 2025 at 12:00:34AM +0100, Linus Walleij wrote:
> On Tue, Feb 11, 2025 at 6:18 AM Inochi Amaoto <inochiama@gmail.com> wrote:
> 
> > SG2042 has a simple pinctrl device for all configurable pins.
> > It supports setting pull up/down, drive strength and input schmitt
> > trigger.
> >
> > Add support for SG2042 and SG2044 pinctrl device.
> (...)
> > Inochi Amaoto (8):
> >   pinctrl: sophgo: avoid to modify untouched bit when setting cv1800
> >     pinconf
> >   pinctrl: sophgo: introduce generic data structure for cv18xx pinctrl
> >     driver
> >   pinctrl: sophgo: generalize shareable code of cv18xx pinctrl driver
> >   pinctrl: sophgo: introduce generic probe function
> >   dt-bindings: pinctrl: Add pinctrl for Sophgo SG2042 series SoC
> >   pinctrl: sophgo: add support for SG2042 SoC
> >   pinctrl: sophgo: add support for SG2044 SoC
> 
> I applied these patches 1-7 to the pinctrl tree and created an immutable
> branch:
> https://web.git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=ib-sophgo
> 
> >   riscv: dts: sophgo: sg2042: add pinctrl support
> 
> Apply this patch to the riscv/SoC tree.
> 
> If it is required, that tree can pull in my immutable branch, which
> is based on v6.14-rc1.
> 
> Yours,
> Linus Walleij

Thanks, I will take care of the device tree.

Regards,
Inochi

