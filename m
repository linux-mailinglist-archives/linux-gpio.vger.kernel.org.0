Return-Path: <linux-gpio+bounces-12277-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 865B69B410E
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Oct 2024 04:34:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7644B1C2138D
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Oct 2024 03:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1521B1F426C;
	Tue, 29 Oct 2024 03:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QiDXsbfU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C884400;
	Tue, 29 Oct 2024 03:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730172883; cv=none; b=r7W5b/x+8s/Zb+Cdv+N/wIC+2GqerAq0LHHXNiBvtNu5ezdyfFmDpJUn8i+P+FWlxQ0Tqj++mHg9RVOaY/ek9Yg/au13MxSmdnk8l+UiKQnhpgExL4/SIoNmO8s+YjOLijwOmXoKZ7d+Ea4GSyo2esxetB//00JEm2qwrP7TJ3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730172883; c=relaxed/simple;
	bh=VuyoKFAcDtnQ4PpGjHCCGhSvnc0JWzo5gDQoSbB4d9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fkIEMbmMmO3uVuxkJoOGFH7IXxd48Js03clrvPb2Pfps822a8pObyxMmYwJ7V6E1G3L9n4Uxt35zVG7zFDcO45vb8EV8gFfGVeT9VbeTfL+b3f9rR8YKBxl/z/tHHbUbDJsaTi7nIWvmdFtqB3j+ygcp4WJgU5mP1mOKgeUVB0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QiDXsbfU; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20cdb889222so46941385ad.3;
        Mon, 28 Oct 2024 20:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730172880; x=1730777680; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hSg6iwg6m8H/oTxICMnvBDVJFOncGQFLnOpMpcMDaOM=;
        b=QiDXsbfU2RfpNx59HWUB/u8uEev8HGnlws9SbiV3ZnAt0XJCdK2Zc1f2KBEsOX+jOE
         Ct0x76COC4kzRDQ5nx10x7XZCrUVuanpg8GEF2KrnT77LF3UBSJpDo6Sd01ZX2k9du68
         hHyNJzL9uTMRmU4dr90zpYjQ5ZbdQh8G0OPehck9yP2EVYGk/uIuOIKewUwsnhKMbiGR
         qxjhgjdWorRQ9Ukplyv4upAZqZ4Q5uqsX/Hmuw2YnVsmJTXh+TCQmeeR4xwXAn+hEe7i
         GVyLPxGXV46VPwyKUD5F6RvDG95e1uGokfpK9rx8vmpKZt6UINgjq+knc5W78u3TSmHo
         ckqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730172880; x=1730777680;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hSg6iwg6m8H/oTxICMnvBDVJFOncGQFLnOpMpcMDaOM=;
        b=JofN7an7YXl56JDsLb3L3JrCnmwF3HJUzVkh8irzWocC/ZY7upEOvcge5cAolipzET
         BQNQiSpDqAhggo3FUj1x3kSWr8Liipzue56mK75Ehyf1WDvcFUAdexDQqGwseNW9S3pd
         DAKx2d6NHCLF0Pi3MX1rt4zXQvbYdLy8Yz07F7uUsooWAGOj1VJ9L5oD36ooJZZZPUki
         LMRLt8VpXDHIuGbzQqMk304t6rnOZlJ0vdC+rTK66u6ZJc2nLthB4rEgmo+pYZ2Qqu8f
         y4K88ErT2UaEAnqi7GgPFgA0SVXwFRREACwLK8B+sJkQJ6BuAON/7GFBDWi4TuTAy0JP
         WNwg==
X-Forwarded-Encrypted: i=1; AJvYcCWWmqSWn1lspJpgV/1THNsWUNelqrCu2I687qIUmz4WuKV63z2bWvVS288mZqi0+ShzVPTJLunhwV3b/w==@vger.kernel.org, AJvYcCWq8E/Kn6Ak2eQ+XfDCHdpxkSGnkaxKBWB8KkDkTVzUIkQVFi+jO7I2btozjgjwWjIH12ES9v9HhuaE@vger.kernel.org, AJvYcCXdsyRtg8L0ml6QmjsAm5xxznvh+i9yWTWBm0kJLc+pNOxXgBa70NFdpxv4FrrAeGqbn2KeIhNDV92qNg1H@vger.kernel.org
X-Gm-Message-State: AOJu0YxSKvocnxTQak9fhJ835/ZbCVURAwy6nPRYyyyHHTUB3yLllVh9
	orfaEZmNRibfVZBDZRobvGTU2sQwRPRAEH+mosk+UkpUCmGZVVIK
X-Google-Smtp-Source: AGHT+IHRfJL20TOTFufsIiVQ2aqDX8rcEhb5BS+f95mlHBX7cYDc6ZdYndIcZMOVGpfkVOvMZ60Pug==
X-Received: by 2002:a17:902:d507:b0:20e:986a:6e72 with SMTP id d9443c01a7336-210c6c0906bmr151590325ad.30.1730172880132;
        Mon, 28 Oct 2024 20:34:40 -0700 (PDT)
Received: from localhost ([121.250.214.124])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc02ebcdsm57394395ad.223.2024.10.28.20.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 20:34:39 -0700 (PDT)
Date: Tue, 29 Oct 2024 11:34:14 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@outlook.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Yixun Lan <dlan@gentoo.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/3] pinctrl: sophgo: add support for SG2042 SoC
Message-ID: <dza57u6svlsbi7tmxujb4z4b5iqvzthjhyjybt2sklys6ovnpi@kcefsrcevr2h>
References: <20241024064356.865055-1-inochiama@gmail.com>
 <20241024064356.865055-3-inochiama@gmail.com>
 <MA0P287MB28228810469B6A46D26CAF51FE4B2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MA0P287MB28228810469B6A46D26CAF51FE4B2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>

On Tue, Oct 29, 2024 at 10:59:04AM +0800, Chen Wang wrote:
> 
> On 2024/10/24 14:43, Inochi Amaoto wrote:
> [......]
> > diff --git a/drivers/pinctrl/sophgo/pinctrl-sg2042-ops.c b/drivers/pinctrl/sophgo/pinctrl-sg2042-ops.c
> > new file mode 100644
> > index 000000000000..f1c33b166d01
> > --- /dev/null
> > +++ b/drivers/pinctrl/sophgo/pinctrl-sg2042-ops.c
> > @@ -0,0 +1,583 @@
> [......]
> > +int sg2042_pinctrl_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct sg2042_pinctrl *pctrl;
> > +	const struct sg2042_pinctrl_data *pctrl_data;
> > +	int ret;
> > +
> > +	pctrl_data = device_get_match_data(dev);
> > +	if (!pctrl_data)
> > +		return -ENODEV;
> > +
> > +	if (pctrl_data->npins == 0)
> > +		return dev_err_probe(dev, -EINVAL, "invalid pin data\n");
> > +
> > +	pctrl = devm_kzalloc(dev, sizeof(*pctrl), GFP_KERNEL);
> > +	if (!pctrl)
> > +		return -ENOMEM;
> > +
> > +	pctrl->regs = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(pctrl->regs))
> > +		return PTR_ERR(pctrl->regs);
> > +
> > +	pctrl->pdesc.name = dev_name(dev);
> > +	pctrl->pdesc.pins = pctrl_data->pins;
> > +	pctrl->pdesc.npins = pctrl_data->npins;
> > +	pctrl->pdesc.pctlops = &sg2042_pctrl_ops;
> > +	pctrl->pdesc.pmxops = &sg2042_pmx_ops;
> > +	pctrl->pdesc.confops = &sg2042_pconf_ops;
> > +	pctrl->pdesc.owner = THIS_MODULE;
> > +
> > +	pctrl->data = pctrl_data;
> > +	pctrl->dev = dev;
> > +	raw_spin_lock_init(&pctrl->lock);
> > +	mutex_init(&pctrl->mutex);
> > +
> > +	platform_set_drvdata(pdev, pctrl);
> > +
> > +	ret = devm_pinctrl_register_and_init(dev, &pctrl->pdesc,
> > +					     pctrl, &pctrl->pctl_dev);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret,
> > +				     "fail to register pinctrl driver\n");
> > +
> > +	return pinctrl_enable(pctrl->pctl_dev);
> > +}
> > +EXPORT_SYMBOL_GPL(sg2042_pinctrl_probe);
> Why EXPORT_SYMBOL_GPL? sg2042_pinctrl_probe looks like just a global
> function should be enough.

See below for why declare it as a module.

> > +
> > +MODULE_DESCRIPTION("Pinctrl OPs for the SG2042 SoC");
> > +MODULE_LICENSE("GPL");
> 
> pinctrl-sg2042-ops.c is just a common file built together with
> pinctrl-sg2042.c, right? Why you declare it as a module?
> 

This is for sg2044, which has the same pinctrl ops. Build this as
module could save some space for the final image. 

> > diff --git a/drivers/pinctrl/sophgo/pinctrl-sg2042.c b/drivers/pinctrl/sophgo/pinctrl-sg2042.c
> > new file mode 100644
> > index 000000000000..81411670f855
> > --- /dev/null
> > +++ b/drivers/pinctrl/sophgo/pinctrl-sg2042.c
> > @@ -0,0 +1,642 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Sophgo SG2042 SoC pinctrl driver.
> > + *
> > + * Copyright (C) 2024 Inochi Amaoto <inochiama@outlook.com>
> > + */
> > +
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/of.h>
> 
> Sort in alphabetic.
> 
> [......]
> 
> 

