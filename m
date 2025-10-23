Return-Path: <linux-gpio+bounces-27501-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB6BBFFB01
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 09:49:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4790A3A8668
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 07:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C3E22D7DD0;
	Thu, 23 Oct 2025 07:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L/ktryO0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCD42DAFDE
	for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 07:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761205775; cv=none; b=sdVoc7GObYjXNpzmq3K0qrudbz9i1gaL90p1g6IgvM6pkZ52kM94vfQjG/TujwjztJuqi0QJrQeEiPjjfM9x9weocNv40pygfR0vLy++Gh7uzv3mO+knU4PXKzLvQq/Ikbh7Gm1c5pQzMHkBs6V1ajf+msHDuol/VfD3UGzn9BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761205775; c=relaxed/simple;
	bh=LO+wB6xyxtIr/hCM8cmPiaOJf+8Rqvc7d4sXFp96uog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mOpjtoNl3q31HyLRJUesgW2xKtABYM3XtrPzyOwg/f7D3Ic+DQip08skcj1F/3tw8Q3fAg9M1uOr61ObXFPyGKWFmq4QecrlIOTRz5Dbv3GCwmUIyr4XPMoUvBw6lYzsxAEI+sQ+N0Saw7qIOj16EPCHkAht6NWiVLWo0EWwoRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L/ktryO0; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47117f92e32so4013645e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 00:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761205771; x=1761810571; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xnfE6Ztp2tsMj2MenWex51wBbAp43TymX17gslrnx18=;
        b=L/ktryO06pdNypMz76KtS5nQWpB2MYvdYUdBSoMnPnzK5YOjoDM3hFyOPfQ+W3pAnC
         aFRGM0oR2V6ypi9y+bntdST//xcaZ9Fh0ZOlBpUjoABUO6nMeABkRAvwb/l+n/G11hSr
         zBqbVkT5RPXDLgUqtIWEpZuva7fSbN0JkqyVhWpZ7uUs2jMBWsX+gvXIJbgn4Z32ypvi
         Z/mbArezGhDLH3B9U6GGpAxaXOFJFu6GvDfMwrkFiAShOaHU6VJ+qyko0Er+4XEbNuH+
         IfiCAenS/nyjM72S3yUfolBK7QOFCzsEtu7YJ5PrbCsGIPBgV5CW0dKSliANFaYab7MY
         8zGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761205771; x=1761810571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xnfE6Ztp2tsMj2MenWex51wBbAp43TymX17gslrnx18=;
        b=vQSnH7oU9sFSxi6l6Pz3bz9iZIinkNqsbBfGsGD5RQET3xM8nxgcS+Tm5Ea4FVf9jZ
         Yyd2+fjWUOQ4qHMYT+IuZ4uMpGTEZ9K2RLNeqWayi/5nPgfAWGke38uS43Kx4MonyuqF
         xFEgTgfyPb7z3zMnALIp4nZKcWgOIQ/Im6uofR4z5hlof9gxA9RHIB5c2DIrzVrdF9a3
         RUJneyEM3V5K4SQUnnO3+0W+C6cFU1IfbWSnk18Uk0sCqYFwmXsabJjSZNh8gUoCLHOg
         XUZIO5HCxON/DxWW7aCTpl5Q/JLofr7dIHOgVJx02D1g6Y+xhULDWn7qOyhQEqbl9n+I
         6oBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpr5r7wCY5J9aMPdD+8HeX7sWjBaPfDsoQSazaWdg/M9VmGE0H69UHqf/OoSEBtJpA/JJTnBbIrR9i@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/u2sUlyWY8oBaNz99d6fxfQ62TeL9Cc+UvbLAsI4ewqhcs8zg
	YLCVPQHmQXPCpn6Qu+WGYplSTSYHBypWJmgSAsbNn2F7UcI9HeB7lrQm
X-Gm-Gg: ASbGncvMP8LZDHMTwTE0YAmhTtWWwJBrHCxfgM0iP+Bi6e4ZMGrmFjM35CoW4A0/RRY
	K+86lazQnOGRMydybgE+uxplIChMz45++1X50+QVzQ8SV6wCS0BxOrGSTXQ0rpcTeYT+hbMYYUV
	xhpYebCNE2uOhD0AG31R73xoB0Mpp13LSgMamiU/GtO3IVl7qyFwEfyxZu7c4lbEYEVeEBBHhiU
	LOtZwNfp1cnDuMs9uA3TARdMMivUy53pTXuWyzWVtjtDwqxNwLC/KU+Ve+iQUXx9SgkwoUySE3I
	ED9rBtlVgUAlF8XG1cdKDovULxiXpLMvqKEq5BXwefh9xcpFENKsxr2wI9ANqkELVHf0a0vjQ97
	2qCa96wnUuRkWwGz+WJycFrAe7ZPSL4c79E/oHMZ7mbXanNZWZicCs67pNBCdMFjPvtZ/Od//FL
	v/OV4=
X-Google-Smtp-Source: AGHT+IEj8V5br8WN0dlHMXe5guFyspPGkB6zQprS+APL5o3M8jdylAnbTHE9vsz4fgFQFpMJhX8T5A==
X-Received: by 2002:a05:600c:3b05:b0:471:d13:5762 with SMTP id 5b1f17b1804b1-471178761bemr163567305e9.4.1761205771309;
        Thu, 23 Oct 2025 00:49:31 -0700 (PDT)
Received: from gmail.com ([51.154.248.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c4281314sm82172465e9.4.2025.10.23.00.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 00:49:30 -0700 (PDT)
Date: Thu, 23 Oct 2025 07:49:29 +0000
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Michael Buesch <m@bues.ch>, Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] gpio: bt8xx: use generic power management
Message-ID: <aPneCYtkbxWp4Hox@gmail.com>
References: <CAMRc=Mf4FnBoZfdR3gG47te=X53jASzb6MVnUmNw2q1rtUwxzQ@mail.gmail.com>
 <20251022192901.GA1265216@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251022192901.GA1265216@bhelgaas>

> > 
> > This says it's a v6 but I have no idea what changed since v1. Please
> > provide a changelog for every version when submitting patches.
> > 
> > Bjorn: does this look good to you?
> 
> Yes, it looks good to me.
> 
> Reviewed-by: Bjorn Helgaas <bhelgaas@google.com>
> 
> FWIW, here's the diff from v1 to v6.  Mostly just iterating on
> compile warning nits:
> 
> diff --git a/drivers/gpio/gpio-bt8xx.c b/drivers/gpio/gpio-bt8xx.c
> index e8d0c67bb618..324eeb77dbd5 100644
> --- a/drivers/gpio/gpio-bt8xx.c
> +++ b/drivers/gpio/gpio-bt8xx.c
> @@ -52,10 +52,8 @@ struct bt8xxgpio {
>  	struct pci_dev *pdev;
>  	struct gpio_chip gpio;
>  
> -#ifdef CONFIG_PM
>  	u32 saved_outen;
>  	u32 saved_data;
> -#endif
>  };
>  
>  #define bgwrite(dat, adr)	writel((dat), bg->mmio+(adr))
> @@ -224,7 +222,8 @@ static void bt8xxgpio_remove(struct pci_dev *pdev)
>  	pci_disable_device(pdev);
>  }
>  
> -static int __maybe_unused bt8xxgpio_suspend(struct device *dev)
> +
> +static int bt8xxgpio_suspend(struct device *dev)
>  {
>  	struct pci_dev *pdev = to_pci_dev(dev);
>  	struct bt8xxgpio *bg = pci_get_drvdata(pdev);
> @@ -241,7 +240,7 @@ static int __maybe_unused bt8xxgpio_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int __maybe_unused bt8xxgpio_resume(struct device *dev)
> +static int bt8xxgpio_resume(struct device *dev)
>  {
>  	struct pci_dev *pdev = to_pci_dev(dev);
>  	struct bt8xxgpio *bg = pci_get_drvdata(pdev);
> @@ -258,7 +257,7 @@ static int __maybe_unused bt8xxgpio_resume(struct device *dev)
>  	return 0;
>  }
>  
> -static SIMPLE_DEV_PM_OPS(bt8xxgpio_pm_ops, bt8xxgpio_suspend, bt8xxgpio_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(bt8xxgpio_pm_ops, bt8xxgpio_suspend, bt8xxgpio_resume);
>  
>  static const struct pci_device_id bt8xxgpio_pci_tbl[] = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_BROOKTREE, PCI_DEVICE_ID_BT848) },

Hello Bjorn!
Thanks for the review and mentioning the diff between v1 and v6.

Hey Randy!
Please let me know if the diff mentioned by Bjorn is enough or should I send a
new patch-mail describing the v1-v6 diff?

Best regards,
Vaibhav



