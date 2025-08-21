Return-Path: <linux-gpio+bounces-24726-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BD402B2F409
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 11:34:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 321FB1CE12A6
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 09:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C58F2EFD83;
	Thu, 21 Aug 2025 09:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="T8ff140E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE742DFA25
	for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 09:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755768853; cv=none; b=uFUckFNNjlsCpvTQs1RMiGLRnYI7DHvCGv954Y87zW9yoQDbq3l/usOPusma1D9yksb1Thh+ICVsRZPR+zBm42QZuKF9U8WoABwInC7u/FzFi8cCUOr6E6NVVhp0So8AkCpJtMBLptENn15UlTz6n5ieeza4jhfNqpSjWOCXlFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755768853; c=relaxed/simple;
	bh=PNb/nRsrwcOa6HJppSS/RjzXDIpOjCmhW2yjf0ZaEM0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D4HyrauHes/yeUN2lnTqS5gaB04QHv+w6uh5unuFyitf5e4ODK2vGy0Z73rBkte0IPdNXIx7XjaKUtgw1Qyc6hPCoEwHh600XvWrNlPbUHQIIvnqxkpGSMltE16eFuB/HA0CvuUKDKOsk5HrdVMhETXqI/uyb+cQdf0YnkeN5Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=T8ff140E; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-afcb72d51dcso99627866b.0
        for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 02:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755768848; x=1756373648; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ojUaTpvSXrb1YYw6X/ClOYy1t7RbcHRqQubeSVaCHY=;
        b=T8ff140ELmhvUmLOgm1aUrKOHy6927rQh06wP/kR+Z3/t+AfNQ2B6PqniiiYZipO6o
         i0pve8aGPZA98gvBNKABbsQp2JeOWNmN+prarI2FUMsnpt9SLHBFcRr7GUqp1QcjP99p
         vysmHSmby0G2i4YLiRBAW92I5z+orngT81xTvdSfDk+XDOtMXJh1uuJPvUEiwVjoQb9H
         Kp8/k+zdwmLQSFVYOffokg1olT5/uGfMjMd+yNYK+jF+HWUAA0/qPmsapDmamRvWgLTS
         JasJiD/QhpQ2HMyN9DBGQEzwG07GITqFm9VkbWAQLNwER3E6C8Mw+N4YFIgBn8keD+Is
         XNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755768848; x=1756373648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ojUaTpvSXrb1YYw6X/ClOYy1t7RbcHRqQubeSVaCHY=;
        b=n6wWmQifI7ecgd0d+Nd0cAJ+p0aZnS0r/iEPgdcUTXWsBHGh7kNFvl8xsUYNakQyDC
         BMYvmHbDPLKPGvj+bCRf6hLJhdS+DGRhjoAoSOOOOEHpyOOpVcfXanRak3keB6SoDPLK
         ISi2jQl/TO05rVGM3O0JNbow6lF9lV8b9ry0c1fElA3HVgBLDIof9pkb+KVwlvBqnPKn
         1mqipWxkRYw0UQuY/nrQSolPt/zTGrglMNnj8eC2xGhYAj5O04CEvIhyWODWz/H72nBt
         rVAcjVmRQnpz87eUMvdU9+dfT5bvhjHMMuvVFz85LBzOlpZtldwZx7dqh94KVcx6S0ej
         NXVA==
X-Forwarded-Encrypted: i=1; AJvYcCWECm9OaRm4uWn5cd2lu8C7lxn401oVH5PbEkKxgMKyzesX+0/FmSLKU6M0QIeEGE+B0FVX3H5r4JRO@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj1H+4bGMAeilaTXLHJe549c4bLy4dd971gXaQOKcrnAG5e/H/
	n/0h5AMpIUYNAU/sJ/H6J42gfAX4SVlcOUORD6XPMObCTlg/yYR9KyHxldz7MZ2uJMg=
X-Gm-Gg: ASbGncvWPQTWjS+rO0fbb2ujmxkbI4/9PFUEL4haNmtWDko1NsmSxuxIabS7dOAKZ9v
	cZkkDjeh6AvkJOl3Vx7Xj0UP8zS5qlfHdO1omqtnFgUoCRKmd8/og052gofcnxM7UkMMy8Tnijk
	4ipQ2ckjsQM3eALE62wxkWotS8g0eS8lARBI9yl1Qm2Hdek0rExZm9K3sSos3nJSA76YXQmXprJ
	oZpRzZ4zsV3C0LHyvKSzVgQy7Tq3I8eHWMm17UiFcftLaq57rmeGXafFDz+4LddF5HDQy8M+MDj
	nrPnvPvLzChMsoOf67iFqGK3dE18P1nJ9Tju8QPQO6MiuWKXRCGJo/CGY5uFvXXABEzkb2GCQLa
	VtTwUMyppjZa7sHVK+8lWHenboaGfiBtZQCBiVkY4RlBnWlRqolUaEeSZTObD
X-Google-Smtp-Source: AGHT+IGPCUQP85VmKt4U/J+vg5UYsiEcQk49TrIi2gpsuaTBNikjE5BQOCAgsWj7wUzO+PxhtVD0Ow==
X-Received: by 2002:a17:906:6a0c:b0:ae0:c943:785c with SMTP id a640c23a62f3a-afe07b35df2mr161258766b.35.1755768847653;
        Thu, 21 Aug 2025 02:34:07 -0700 (PDT)
Received: from localhost (host-79-36-0-44.retail.telecomitalia.it. [79.36.0.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded2bc305sm350000666b.18.2025.08.21.02.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 02:34:07 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 21 Aug 2025 11:35:59 +0200
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: Andrea della Porta <andrea.porta@suse.com>, linus.walleij@linaro.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	florian.fainelli@broadcom.com, wahrenst@gmx.net,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, iivanov@suse.de, mbrugger@suse.com,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
Subject: Re: [PATCH v3 3/3] arm64: defconfig: Enable BCM2712 on-chip pin
 controller driver
Message-ID: <aKbofxfSKO4oGKHG@apocalypse>
References: <cover.1754922935.git.andrea.porta@suse.com>
 <04c67a8fc50f2688fd3a6616bc03b3ac4d4977fb.1754922935.git.andrea.porta@suse.com>
 <570088fa-2861-487a-a2db-2d1d87d700f6@suse.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <570088fa-2861-487a-a2db-2d1d87d700f6@suse.de>

Hi Stanimir,

On 10:25 Tue 19 Aug     , Stanimir Varbanov wrote:
> Hi Andrea,
> 
> On 8/11/25 5:46 PM, Andrea della Porta wrote:
> > Select the on-chip pin controller driver for BCM2712 SoC.
> > 
> > On RapsberryPi 5 devices it is primarily needed to operate the
> > bluetooth and WiFi devices, to configure the uSD interface
> > and the power button.
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  arch/arm64/configs/defconfig | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > index 58f87d09366c..fafcd7851eb2 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -592,6 +592,7 @@ CONFIG_SPI_TEGRA114=m
> >  CONFIG_SPI_SPIDEV=m
> >  CONFIG_SPMI=y
> >  CONFIG_SPMI_MTK_PMIF=m
> > +CONFIG_PINCTRL_BRCMSTB=y
> 
> Have you tried as module and part of initramfs?

Yes, it works.

Thanks,
Andrea

> 
> ~Stan

