Return-Path: <linux-gpio+bounces-5909-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECD38B45C6
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Apr 2024 13:14:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C4111C20D6A
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Apr 2024 11:13:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AB3F4AECE;
	Sat, 27 Apr 2024 11:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gjwb+yHB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D85747F7E
	for <linux-gpio@vger.kernel.org>; Sat, 27 Apr 2024 11:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714216433; cv=none; b=a2QVFFqpBlINqvYi0zQ4KR0K3JjmSyKtOvjx040OMuPPZWoN2Yop+jAw1255nGkcy3rvvnQTDcYt9k2pAqMQcJ5z0y/QLjm3rjqea7rVVFgpDj+6JKXVbnnYcvcr5Al/RrNP+MwMtk5a2u4ihAu403F2nnO+IO39JJGFYilji2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714216433; c=relaxed/simple;
	bh=Z5qfOnWdamTc+T2nZyu7qHNYdjyHqF1xekWpTIgiRSc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GSN2LwHoFoeBf+9QhqMXBZymKeepcTz0OKEFhxn5aAfSPRmXFUupgmnmpRVxpvhR3ByERRt2hCkdQUvXqZdhtO1LQBjB//DLA/J9my1k6UM0w64Xv82Fg+zVBOWJLRPIRK1TcCPZ+JE+1uVXWtBl9OPcmR/nocD1P3x3HRlxihk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gjwb+yHB; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-56e48d0a632so4489169a12.2
        for <linux-gpio@vger.kernel.org>; Sat, 27 Apr 2024 04:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714216429; x=1714821229; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4RDYgLk1RtD/QZsZ7nsHxXtHxKa5q/ot4f4fZ891gTM=;
        b=gjwb+yHB6TymEvpZCgZYjNGSwcloiwJLyf+VyQ5wCKT8oZoUwr/PeHYyTr0ZrkLKIq
         6636+At0ZmlPYnGyrmhPnr2IkkC8kygdvLGpZPnHv9I3/cALYhclUjVCWFZM1CGmVSUm
         eWE7+Yv8N/luafZWaDb9dBGcF9ZZX+PKcg+wUEXAAwRWwJYJJJYHTNOPfNHxccDqyM/+
         Qb99fFqtYH8XH6m+OCJwxDSsximbeTR7nk19hhGxghO1eoVbzNA8msyxuuwtnAwDB1uV
         MLvyIUON3iRktBK4L8Wx6h8Yth0DD1fDll6oRqLXe04wy11asBG1e/iXa5h/WzUCDIIS
         zSsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714216429; x=1714821229;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4RDYgLk1RtD/QZsZ7nsHxXtHxKa5q/ot4f4fZ891gTM=;
        b=VwqG8eqj94mpMGZoO9yq2ksjQfcyBdTR+QsVWUJU8P2EQhsLCfR7cB2e2Z8kymCZpK
         jgoACcFpLSikavxe2LY6e8O0KwgEzKu/4rPv4Bt2KUKY2q43T37kpkd1T/YzG8Hv1Qyn
         /xarKF6vqZlwO+1SpKvogBokNiGqFdmoOZiOO8StFposMIDW0WxpSyAQRIu7xJ17j4KK
         HBT/QvCHP6yjIt6mDLJ6PNSXeONpLVGCHfRu1G1TZ9OV5nrU2VsIkDLShe5NwLG6u/4q
         7YSE5dhP/ynUnFg/vTjO+sIXqUpQ6/0ky6gLSTZvaG5sQL08c4DUtSjHyynFPmGELiUU
         l/JQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVr4GVGjURlkIsMZuqFIdx65+vh1mVh3IJoav7B0GOK+SvbrV+H1isIBRY73CW0dcTiD8e/9CorTUm9q4YlegaeZTy6VFHR3VizQ==
X-Gm-Message-State: AOJu0Yx9jh/VFvWMhKahT7a9sFCJySGajDIxbcCup9AkhtIuEFj+Ltzo
	2GXLb07mCSQGKSV9XxmetJhZkrhz3i0VMOcvxC8AqLvOsVJmiLdCcXSKc3FDsbQ=
X-Google-Smtp-Source: AGHT+IEEs920x533drbPxLSc6HQCIbc9YyZpIJ14gZErY6tXi1wXzKTQxnvCeVuB+NCa/EXFabnckw==
X-Received: by 2002:a17:906:aed2:b0:a58:a2f9:d795 with SMTP id me18-20020a170906aed200b00a58a2f9d795mr5383931ejb.59.1714216429515;
        Sat, 27 Apr 2024 04:13:49 -0700 (PDT)
Received: from localhost (host-87-1-234-99.retail.telecomitalia.it. [87.1.234.99])
        by smtp.gmail.com with ESMTPSA id ah2-20020a1709069ac200b00a4e393b6349sm11462597ejc.5.2024.04.27.04.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Apr 2024 04:13:49 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Sat, 27 Apr 2024 13:13:50 +0200
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Al Cooper <alcooperx@gmail.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
Subject: Re: [PATCH 4/6] pinctrl: bcm: Add pinconf/pinmux controller driver
 for BCM2712
Message-ID: <Zizd7sPYOhifpTJZ@apocalypse>
Mail-Followup-To: Linus Walleij <linus.walleij@linaro.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Al Cooper <alcooperx@gmail.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
References: <cover.1713036964.git.andrea.porta@suse.com>
 <8fb5dde9404875777587c867e7bdb4f691ab83f2.1713036964.git.andrea.porta@suse.com>
 <CACRpkdYmfEz-eM_R3ifGnbu6saL4Fd60D2ksyCr0SW0X6M_1VQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYmfEz-eM_R3ifGnbu6saL4Fd60D2ksyCr0SW0X6M_1VQ@mail.gmail.com>

On 15:07 Tue 16 Apr     , Linus Walleij wrote:
> Hi Andrea,
> 
> thanks for your patch!
> 
> Some comments apart from was said already.
> 
> On Sun, Apr 14, 2024 at 12:14 AM Andrea della Porta
> <andrea.porta@suse.com> wrote:
> 
> > +#include <linux/pinctrl/consumer.h>
> > +#include <linux/pinctrl/machine.h>
> 
> Really? Why?
> 
> > +#include <linux/pinctrl/pinconf.h>
> > +#include <linux/pinctrl/pinctrl.h>
> > +#include <linux/pinctrl/pinmux.h>
> > +#include <linux/pinctrl/pinconf-generic.h>
> 
> I would just expect these.
> 
> > +static int bcm2712_pinctrl_probe(struct platform_device *pdev)
> > +{
> > +       struct device *dev = &pdev->dev;
> > +       //struct device_node *np = dev->of_node;
> > +       const struct bcm_plat_data *pdata;
> > +       //const struct of_device_id *match;
> 
> I don't know if others commented on it but drop all commented-out code
> or make use of it.

Forgot to remove those lines. Will ve dropped in a future patch since
the pin controller driver will not be included in V2 since it's not
strictly needed to support SD boot.

Many thanks,
Andrea

> 
> Yours,
> Linus Walleij

