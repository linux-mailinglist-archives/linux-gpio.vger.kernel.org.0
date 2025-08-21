Return-Path: <linux-gpio+bounces-24759-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 59894B2FEC8
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 17:43:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBBC41C22D9F
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 15:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3927B274B29;
	Thu, 21 Aug 2025 15:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HQ4uaKV3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67AD23E359
	for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 15:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755790511; cv=none; b=Gnd4lw/Jvtx0s+QmxFi1/UudFN/JVhDzXHg9HFas11APmYrjgZ2zm3Cb7FYX+LCxdqMsIxxTuDsuJgq12GBfTWcC1/UQHUkkFZfteKpG/eGzwd+BnmC0Kp6uzIsPdYdmPj1Txcu+Nr1ed4WX0lQGrAz6MmCQlwXHk2KsVzQnAuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755790511; c=relaxed/simple;
	bh=uM1DaZTN4c/PIqaezw/b3XVLI8CoBrBbp475FXL6Bzo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eP1n2/sQ6c2eFiS6jrU5VUFdu52yjsjv9ZR+H2M7GJjqqdDAfyv9i88X3I8h2cKwA/cn2lqFRmSnEVbnGzPCePYufP55Mff/grf3bQmnrhvn7XdnPW6NCVrdb+pTxOSAopLk37rjoByn4+4l4mTC237pil1uoV31pIRHo2C0J14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HQ4uaKV3; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-afcb7a3a085so192920666b.2
        for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 08:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755790507; x=1756395307; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bmT4+9q+WF2xuKvhWm+16FMNcdazw5pWXArjlhN4f28=;
        b=HQ4uaKV3/xAEwTazNgWf1qnJRbTGBKl3No4pd7XyP1/avBkeytennDO2l84KossPmW
         wOMNwZvAdV6FjizLcQeGYfRRUyKK5AEU8ZZgCHIXa0Aq6PrRscqc1gqxzq3qw1UZVVh2
         aDB27RSb1cJ/vxMqp8teAkirnB0KmcML8MuujLDIUFEO7VCiZnKSS03KH8i3KCDe2wle
         MijnJ0uv0RPjPY5YteKLDZeXyqRsftOKiLUhOmU8QjedRDeJVohuznw5ZBMECyxF9pVw
         qdEXTL3K7Vl09nVYD3CxeBPR/bFCR8sVhp43aV1x5F0E29/RDK4H+POc33mI5FONkgYD
         /Y6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755790507; x=1756395307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bmT4+9q+WF2xuKvhWm+16FMNcdazw5pWXArjlhN4f28=;
        b=hwKSzFbou7cWvdhy164ut+SN3GYYelOowX8TTkq/xfUrIOsyVmeifjbpmnNdtDGNOq
         hn8COpdVHpUHwoTBNAK1CMcbY7LLWOIh7i8jz+atgyzeqhu3hkoRDcS201bfWDFWtYOT
         lS899afl5wGuqv+YOCTuGMQAxgNl8Sk28C9XzRIOzEEmbbJ24i+rQtq/RUKvP0GmCHQP
         5Q6WAz2QI4Ze++7XPu/acdpwopX54Gnwmqzf+Lx5zM5DjhJWIIKTQTGRsivWYEPLxYii
         kw03+Nzq2kOHkOEtTZvHCf/TBgcAYPcKh+3sjRriGhlrMrzAVGo8Eqv+HfJJIt05rkEy
         w9oA==
X-Forwarded-Encrypted: i=1; AJvYcCUQxwLq8Rph62QwwcXVQjsgyXbg/1DV3dLN6GWQYtXB0dzH1pPlzwya4d9/z10gCXZ0MbFzxC+HSx/Q@vger.kernel.org
X-Gm-Message-State: AOJu0YwMXW9mpvfFu0CjUZzMGUaHn0PpQfWFYwB3gvEDsMnCNSpA6Ql9
	KOxncoVwigJQOu8hEmUhJ1XxA9MvTaoMGbQ0NlJhRWEyM1YFAY4sbfsePF8EDvzfPrw=
X-Gm-Gg: ASbGncvgGKaZYU30QH7FZ/MoM8VHQUdERQJiLuTc/7FsRBe6/yN+Bui4pv5TKujg+CE
	YQ42Qp6hqsGk4w49tMJZw7zeqFVgWgOWDVKBYcbDb5e5RnoVwquvROz0Q+vDRMgHutJzLgWWt8m
	+kuz/i2fklmaKzj+0+/0X4vMH5B/8clXJM3UQc17D1/U+0zi/U0+N/V2KsJfh57yFrFXUi50Rfc
	DikurKZ5j3As+pBFHgVhjlYSqlPNwiuqTU7BfSrJ/s+9ctTPELw4BufhNGDBUolhwB39CG0rtjx
	d4choG9EGQletTRUPLUFzFlIkPaJvdqD4+xTXJr9IdtdQ6o5TXkq1jzM/v139N88zk5xOS1vTdd
	yvac5Ged6E3Nz90SNHZsUl9F2hwBWhVSGKcV1qv0P7ddTLKQSWmc6WECfs9Aj
X-Google-Smtp-Source: AGHT+IE6i6MAcGkPSHSM0qg6lud9wFnrIlBRLuMIlOpoA2gcWkZO7oMKz2wMyUruTfC+VDFOVZS35A==
X-Received: by 2002:a17:907:86a7:b0:af9:d7ba:4dd7 with SMTP id a640c23a62f3a-afe074c7c05mr256732966b.0.1755790507054;
        Thu, 21 Aug 2025 08:35:07 -0700 (PDT)
Received: from localhost (host-79-36-0-44.retail.telecomitalia.it. [79.36.0.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded539d39sm399697766b.110.2025.08.21.08.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 08:35:06 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 21 Aug 2025 17:36:59 +0200
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Andrea della Porta <andrea.porta@suse.com>, linus.walleij@linaro.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	florian.fainelli@broadcom.com, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, iivanov@suse.de, svarbanov@suse.de,
	mbrugger@suse.com, Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
Subject: Re: [PATCH v3 2/3] pinctrl: bcm: Add STB family pin controller driver
Message-ID: <aKc9G9owEfYD-_qM@apocalypse>
References: <cover.1754922935.git.andrea.porta@suse.com>
 <bb746d2fd50ecbb9963438fae8601c2e4901a126.1754922935.git.andrea.porta@suse.com>
 <6d812c08-341f-4f7f-a9ed-4545217cb8a8@gmx.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d812c08-341f-4f7f-a9ed-4545217cb8a8@gmx.net>

Hi Stefan,

On 11:18 Tue 19 Aug     , Stefan Wahren wrote:
> Hi Andrea,
> 
> Am 11.08.25 um 16:46 schrieb Andrea della Porta:
> > From: "Ivan T. Ivanov" <iivanov@suse.de>
> > 
> > This driver provide pin muxing and configuration functionality
> > for BCM2712 SoC used by RPi5. According to [1] this chip is an
> > instance of the one used in Broadcom STB  product line.
> i'm not sure about the whole driver naming. The cover letter describe it as
> "pin control driver for BCM2712 SoC", but this patch is described as "STB
> family pin controller driver". So as a reviewer, I'm a little bit confused
> of the domain of this driver. Is it for a single SoC or really for a whole
> family of many SoCs?

It seems that this is indeed a whole family of which BCM2712 is the (first?)
incarnation. I'm not really aware whether there exist other physical
implementations but I'll amend the comment accordingly.
Please also see:
https://lore.kernel.org/lkml/d6ab66cf-09ac-4f53-9102-11f207d16db5@broadcom.com/

Many thanks,
Andrea

> 
> I'm asking because all the other BCM pinctrl drivers are mostly SoC specific
> and not really general for a product line.
> 
> In the former case, I would expect a driver name like pinctrl-bcm2712 to
> make it more clear.
> 
> Best regards

