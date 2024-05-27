Return-Path: <linux-gpio+bounces-6672-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DB35F8D0382
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 16:26:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D21FB2E9CC
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 14:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 126DF1607B6;
	Mon, 27 May 2024 14:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uo6lMTJS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEDE15ECE7
	for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 14:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716818540; cv=none; b=A9xTZf5L7ggbl5WMfWMlElOd559E5jhZbBcz2BWrJvE3c5KiHI1D9xbCdQFqFR1SN9ueYVR9pjf8hC/zviBkASJvwxGtJEYjbNFAbIO0V8OLUB/U9H2DINeA1CPp/F//e0+EKEE2YCV3A3BQF4seZOfhi0nyvq+3QkZxsEl1ghk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716818540; c=relaxed/simple;
	bh=H9YtbJAz0lWtxxI5dSAjzObouxRSql1cjuogk2/HE04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S1X/Ht1HFGXX2aY0lg+6KBmdVQgfg9Qy2DFS1CNZnKV7mcq1108caTwgu5ireVlgB2Jn2Gsy2RkCExOpZNfbNYzUlEGDvuXBV4wisW+MJ3hfy8nYGsn7u6YSp66gN+dhe82Q8K3lJ3E6S8lS314vYH/YnqV91WyCGYihiLfGKN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uo6lMTJS; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a6267778b3aso226369166b.3
        for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 07:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716818538; x=1717423338; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V3ZJSdg732IEDAg/X5ZtP8XP6njMmewxtfTRqhu30AQ=;
        b=Uo6lMTJSDVogY+69w9Q8XgJW5fh2hvX9So8n+GV1ffW9WlQB4t9rAhcTCvK/NWThAi
         aNb7tI51PGvJdlWrcDFdHmCulc0WlFw0J1Khqrm4klug38pcVBpE3iSwQnFhGti17Ob1
         toVh2BPVZdRPT1Ltu0FeTvzFUFR4RcxhTThTisDnEWb2/3BwTt34JLAneKpvsi/6sHEJ
         UrkPTsjYQb4a+FQkab+XT5ydscP8fqAxOlatVUvN3yoCb4BMZnPYHy18HUwHl0SZ5gtZ
         zn8Bhmnt9vMdpc5EifYiUU11gXyqRpDmEubiTPK/cqj51kHacDj7kvlqSIb2tVL62Lpr
         cAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716818538; x=1717423338;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V3ZJSdg732IEDAg/X5ZtP8XP6njMmewxtfTRqhu30AQ=;
        b=RRMSI+PpCmz8P1bHJ4hkWe7bDtz+6qdi7BQXGWQhivA52J6wuetBMdf6KdQzjAMgFg
         LNFqbBZ1qGqt53qdxSLyOVKFp8skeOyYYNu/1oPnPokofS5abAssESTLrIQ775iWKKrE
         Al46ETqZ25jEjgYm7GIX9RWMzMf46bF0pSJAHEs2z1LU+72qSES1aHk3Mzx+b50WC5fR
         tQMobr9qaH6eEPiYqMXUUoHPnfO4cKI8JBmKyIn8S4mD1WqhYUsFcuVuDqVa9ssdx98h
         keehTw2FN3hJzwcPMfnQoOoOYEIHnFldZOhsSroBlA/hC1sg+l1HFAK4eai3FgZ9Y/wH
         Nh9A==
X-Forwarded-Encrypted: i=1; AJvYcCXK6Hgg9iY1eLvuyG8siMWplO+5jes2Soi3JnbJoibfPLD+lClzc+pwvg3oXTLg9+E10hSZ0pVA9huCvNClV0no49luitwN0lnlvw==
X-Gm-Message-State: AOJu0Yzq/4AuPgHZo+JUnpPdAcTPDY0c2zo/lK8Z5pm7WrDrRl3L7kIq
	IKYSW+BbSwL0j3/n+B8Lo+CCcMRSeuYyNvFN0w7allr4OfIuDONq2WPOhIBq0hs=
X-Google-Smtp-Source: AGHT+IFgM+OP38ZRP3oP7w5ejOGXdOAIbIo0Pp+7im1U3FuKtyvAU2zaGVMcsTGgZFKwQBd5rZsEXQ==
X-Received: by 2002:a17:906:abd0:b0:a5a:896f:9be0 with SMTP id a640c23a62f3a-a62642eb70bmr725672266b.27.1716818537450;
        Mon, 27 May 2024 07:02:17 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a62dbdfca11sm204613166b.145.2024.05.27.07.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 07:02:17 -0700 (PDT)
Date: Mon, 27 May 2024 17:02:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Dmitry Baryshkov <dbaryshkov@gmail.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] gpio: amd8111: Convert PCIBIOS_* return codes to
 errnos
Message-ID: <09f2f3ac-94a7-43d3-8c43-0d264a1d9c65@moroto.mountain>
References: <20240527132345.13956-1-ilpo.jarvinen@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240527132345.13956-1-ilpo.jarvinen@linux.intel.com>

On Mon, May 27, 2024 at 04:23:44PM +0300, Ilpo Järvinen wrote:
> diff --git a/drivers/gpio/gpio-amd8111.c b/drivers/gpio/gpio-amd8111.c
> index 6f3ded619c8b..3377667a28de 100644
> --- a/drivers/gpio/gpio-amd8111.c
> +++ b/drivers/gpio/gpio-amd8111.c
> @@ -195,8 +195,10 @@ static int __init amd_gpio_init(void)
>  
>  found:
>  	err = pci_read_config_dword(pdev, 0x58, &gp.pmbase);
> -	if (err)
> +	if (err) {
> +		err = pcibios_err_to_errno(err);

The patch is correct, but is the CC to stable necessary?  Is this a real
concern?

Most callers don't check.  Linus Torvalds, once said something to the
effect that if your PCI bus starts failing, there isn't anything the
operating system can do, so checking is pointless.  The only fix is to
buy new hardware.  There was a hotpluggable PCI back in the day but I
don't think it exists any more.

regards,
dan carpenter


