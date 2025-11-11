Return-Path: <linux-gpio+bounces-28355-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D14FCC4D579
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 12:13:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 500C7189F8D4
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 11:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D267A350D47;
	Tue, 11 Nov 2025 11:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZxwgTHmc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0896B2EAB61
	for <linux-gpio@vger.kernel.org>; Tue, 11 Nov 2025 11:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762859201; cv=none; b=FZYf/FDHMrUzIgDpbbDHPI8g/i1OQrT3tgfPBaa7Hm27j4smU0FkfyACRJT/GHPKavklnmgy4eNTAMwFWxloNL5l9hmFQM7dUmPxq5gngLqFo542TcDzmUKcMUYzYlz5xUBUKygY0/xvba+kzG/zylu5cD+SXWh5lQ9Ni/jzCPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762859201; c=relaxed/simple;
	bh=wjKmAWI7i3OKj2wAozsu3qUnx7HDyiUxDn1DPfUHvzk=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZbL/Ra7uNDkwiDEjIPDMBqhucgc8q+SUY5KGw9IXmlXfzWuyJ+tHuvYgjvvC6Zj8gWxV/PwGZy3vpVvKIHIizCWqzODCsLB6bjbmFTPu5iO6P0Xcio7kb72RR0hj55RulEDU2rxcxG5j0SDEDXCh3kQqUunlif8vSqMvdM2nECI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZxwgTHmc; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477632cc932so16299225e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 11 Nov 2025 03:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762859198; x=1763463998; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GqeaPnqItnFtRKGsXgxFGwXrKkh4CIZ1QtjFn5LjAOA=;
        b=ZxwgTHmciUuwxls2DCH5W5AN9wmbMX7MGvOWyOX/c/n1+TSf1Cia+uBicCNxPtF4ju
         lEbeZcOdExtSV21ae2RHQUpgEno6go1rm6j5DeYWZF8S1NLMKeN+5FUR8u0pXHX2va15
         658RzEX14yA/ItojnlTIe74hxRJndrBtXzlT5hbQnceekn9vTR0WMLm803Rm+e2c2p/k
         bE0vxJa87pFe81zn2s57NH6RZXfyyt38y4YN9IV9B7iSJszEeDFNDZlWjzrfXU4Sa3Ei
         o6ZjvLbXkBOZKehIJNZ125yFOpgOvWhHJGCKfSriE1ElfsiHclElIlNrG425NAhDDO1P
         RLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762859198; x=1763463998;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GqeaPnqItnFtRKGsXgxFGwXrKkh4CIZ1QtjFn5LjAOA=;
        b=OpRoExG70ofRjjwg0ag+SGz6arOukiMHW6QoQ9cz64Ce231wevR47R6wQOecItwDPp
         wKTtf5U3QwSht12tKCWHQFFNNVjVF6VIhF9rikee13Z6pXGVRA1cqQAhdhaWNtHzgsYp
         dOO++hrwQ3Srp5zukX4HD3/PpcDzjizth41Qh6qkdruE75CaVdnxxscW4XdR/cxSC8C4
         aoP3F1ZKidzkdgZSHkO5BiQIeULq65m9f7Bh7aNghobMs9ILBk3UA51HTaKynzonyz5i
         zbmBIb6VATeUP7WOl9YSNHeo7QyS1/b67dfG8JWfBTlTOHjmLO3xs5YYCU2s/EGkdCdi
         ePqg==
X-Forwarded-Encrypted: i=1; AJvYcCVdOv/WoHMi/AhIdsMzWnb9mBgmf5Nry9lVMtig47uAo5awjecRe50f08Vqt0I5XQZ1dspy45UHRmlr@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5q3pkDkNJzR+Su7MApNHRNtC2fO4g6/VpTsPXOuYmz1O915Fj
	IsD+mYK8Tub8YqOONp7i9moqq1UkDueYTKzMGBUwYpHUZsSmYFkBf3zw
X-Gm-Gg: ASbGnctGiG/m4MuurdfHHCi4bB4nOME6eHdtuyTspydeX1AUyQ43GdtD59bRNBVx607
	Asdjo9MlUDEAENhNPptzS6Ve4xT+Y9EVhhteJlo15i/+6/pV8S3+h0sv0Ck7K69rp3tbBstx+6t
	cbel6Z0pbWZiGSa/+RTYpJr3mg2im0d1OiMAZQZipY0/nI4P5hRCxSnvB0Ti2PLmjTLvmhB4veL
	NrbWT5IibkXr0U2nT3MZ1JXLj0xgz7LD5xYaABaeBApXyw7cWG3HEjGzQxMVa143gmc2NlDi9E1
	/Xwdtk9sKNVEDBJgk3ZuqjCjIZyKFF/Rbn9kCiWImyEga+Gyj/Ere4nEPafNHmIZwBZiG++jgUp
	W97xhlzb9W8dYsYIH1RTHwaapHpy7Vs6/eHigEk4pyZnwlRHEhmxDv4vU+RXvK1ij6kFbzYw2dL
	t0UmUDtSLUb9SD6vy+wbMp5TcNZYDT
X-Google-Smtp-Source: AGHT+IHo0/ZJIgGnENwBn854yp6ABmQngtssmchs4xiNiUy0O6fPJmQpRDhvemlWrdEyLklYh4J5vg==
X-Received: by 2002:a05:600c:6a81:b0:477:429b:3b93 with SMTP id 5b1f17b1804b1-47773263384mr69643045e9.18.1762859198228;
        Tue, 11 Nov 2025 03:06:38 -0800 (PST)
Received: from Ansuel-XPS. (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4776bcfd021sm306780595e9.11.2025.11.11.03.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 03:06:37 -0800 (PST)
Message-ID: <691318bd.050a0220.855f2.f45f@mx.google.com>
X-Google-Original-Message-ID: <aRMYu6AcsZV1rSEw@Ansuel-XPS.>
Date: Tue, 11 Nov 2025 12:06:35 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/5] pinctrl: airoha: add Airoha AN7583 support
References: <20251106235713.1794668-1-ansuelsmth@gmail.com>
 <CACRpkdYOXSm5BaHgij_=L32kq+fkx_ggSJ7G5a=064FDvMR4EQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYOXSm5BaHgij_=L32kq+fkx_ggSJ7G5a=064FDvMR4EQ@mail.gmail.com>

On Tue, Nov 11, 2025 at 12:46:48AM +0100, Linus Walleij wrote:
> On Fri, Nov 7, 2025 at 12:57 AM Christian Marangi <ansuelsmth@gmail.com> wrote:
> 
> > This small series introduce support for Airoha AN7583 pinctrl
> > support.
> >
> > Most of the changes are generalization and cleanup of the Airoha
> > pinctrl driver. These are needed as all the array in the inner
> > function were hardcoded to EN7581 and didn't reference stuff
> > from the priv groups.
> >
> > Everything is changed to match_data and priv struct so
> > adding AN7583 is just a matter of adding the structs.
> >
> > Also the schema is generalized where needed to address
> > for the small difference between AN7583 and EN7581.
> 
> All looks good and bindings ACK:ed so patches applied!
> 
> Suggestion: since this driver has:
> 
> 1. Exactly one group per pin
> 2. Use some accelerated GPIO operation, .gpio_set_direction
>    in struct pinmux_ops
> 
> Have you considered implementing the new .function_is_gpio()
> callback in struct pinmux_ops to tighten up the GPIO strictness?
> 

Thanks for checking this. No, wasn't aware of the new OP, will check it
and send followup hoping it's not too hard to implement.

-- 
	Ansuel

