Return-Path: <linux-gpio+bounces-14553-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDFBA0378C
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 07:00:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FC31163822
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 06:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A61B1D935C;
	Tue,  7 Jan 2025 06:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cAfq5GcT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F40C1A840A
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jan 2025 06:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736229652; cv=none; b=BB5wrLpGKKE5HakAM3J8zvUs0JATTRYpTl5mOsGmz87cQwe5Vqxw5Zv9C5nmhItzuYQ0vu85YIq0k6hyiO0fbtNo0WJjelweDYRRg2zq9sEGXtXncBM1k/aZZ5IPu1S1IH9i46cUr/BX+wLenAcBnmzmFWLi5XY//G5iGpnEfJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736229652; c=relaxed/simple;
	bh=pcTS2IIvM5b/ePXGvpNyGCKS7Bb0XTsBiAqUhzDkKDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sIIyutPd6Yb/wxcCmjYSOPFxmxTgcy82/TCfAQOYlw52nMEUU/Ptnec3WVCi905HMgI3BT93XwjdgOQEQ+ovxkI+VKG/rNlV+WtFtvzRUf47lWyw2V93OtLFw8kdROiHqt3ViJgqEozxiyjdlDzPtej2pVTyzRvxltkoaN/K9GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cAfq5GcT; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2166022c5caso194306705ad.2
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jan 2025 22:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736229648; x=1736834448; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1LqtCCFqO+EmbQDGZfil95JY56xLKJrZ75mF8dLQMY=;
        b=cAfq5GcTwzxQp2wB8zU96KA6NVEo4cBpFig/Ck3YYSV57k7p5hjZQwrzQud0WPKyej
         SNBL2g7I2dzsThX+lJZsxv6Fc6eZwO7bZ4mSHhWAP5GvMnV3uZXtSeuJEl824sWaRPxp
         IJVYRptbJcHhjmvKyeVko8435sinAvUl4JGK7UPLkDRB1SXo8ArF/a8zisUeDAalzveW
         CQBGL5mQJ/CRa3+FGNKM9PV8SJPlfSKgMEkD99MRdh+vaShvppLOYyZv5lpGrmCyQwLr
         fjxCiKvtj6+dbaXtuJUJcrlwqEmzjATOWw2Z7rXfU5lLepckVe3uHY7JX6HZizZ/XvSb
         nIRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736229648; x=1736834448;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q1LqtCCFqO+EmbQDGZfil95JY56xLKJrZ75mF8dLQMY=;
        b=MDJLZXewSYR1Qp0B3Fuf/79PZxDimEBcy5GcDUYq9JKTfBqI4GP8zu1WyQF8tfi1cd
         gzoU5WPkzvZxuDq9h5wdJpho7XsD7zkoJnLI7+ky7+0hUawj/DToR2N7eECZe+xqh1bh
         hjktyQmvCxjJH9XmBcs9y7nVqjFVDR2kNBkzRpVSxquUbO/17QMnDvyA/9KplfuamctM
         OxDGJ6hfU07/ejlP0zNnm03853vXhQiy0+wq2Qqnolu91h7AudrgWZYTmRw1iGfdCqZz
         Q1vN4fumaLfopFsLrL9nNSmOJEs1f/Hh79p99cdqwxnbbBDNTipEDezOtWcEJFgr1YRZ
         nKBA==
X-Forwarded-Encrypted: i=1; AJvYcCXKlxbYyxl+Bkp660lDcmVohK2s4KlzwTR54WWrx7w24XMp1xGEQ7BBeHGgl7EjSdQ54G5hzBpBPX9P@vger.kernel.org
X-Gm-Message-State: AOJu0YwUT3BBNYKgCLFdcGlWcSS09lWMFgq5ruvXhJD7N0/7AR87HP80
	B9FXDYqIOvNCuoHXJx/7tL2ntW95OwqssooMuU48oeXVpOogR8LpB8Wh/T3zAP4=
X-Gm-Gg: ASbGncuz3Sa/TSbNN5gpoerCKn9wM1yyZqpFH7q6sQTTNwPkMwihg6oeRP9n5wjsL+b
	PdGocHfKhghUFsY1EMSHQeKae2yNIxfkP7+AsWKYDPq2xsSXNxrpVxP1jPSaxMUvYz5G64no6KC
	YKx+wV+hXIv05SpQfFi6xeG/bLX44/Kxe2pKDMhM1Yb2dh2Ox2Seo7991zAs3T1LNS1tI0flYnJ
	nCW3AnzJ2HN1la3AQDpzy/DUbjdMFnYxAUGko1Np6VVxGxmLCSLBVx5S2k=
X-Google-Smtp-Source: AGHT+IEV0SW8UbkPJKhQiSFE3WXE7urmJef0CRVNx98DBDbQuc5ZLOE88pPCGk4dWb4wb3Z1ikREsw==
X-Received: by 2002:a05:6a20:1596:b0:1e1:9f57:eab4 with SMTP id adf61e73a8af0-1e5e04609b4mr93184649637.16.1736229648586;
        Mon, 06 Jan 2025 22:00:48 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba72f7csm29716122a12.4.2025.01.06.22.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 22:00:47 -0800 (PST)
Date: Tue, 7 Jan 2025 11:30:44 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: hlleng <a909204013@gmail.com>
Cc: info@metux.net, vireshk@kernel.org, linux-gpio@vger.kernel.org,
	virtualization@lists.linux.dev
Subject: Re: [PATCH] drivers:gpio: support multiple virtio-gpio controller
 instances
Message-ID: <20250107060044.hteiw6dgycz5rr7x@vireshk-i7>
References: <20250103083520.1764441-1-a909204013@gmail.com>
 <20250106043508.x3pwt3jzh37t265f@vireshk-i7>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106043508.x3pwt3jzh37t265f@vireshk-i7>

On 06-01-25, 10:05, Viresh Kumar wrote:
> On 03-01-25, 16:35, hlleng wrote:
> > Modify the virtio-gpio driver to support multiple virtual GPIO controller
> > instances. The previous static global irq_chip structure caused conflicts
> > between multiple virtio-gpio device instances as they shared the same
> > interrupt controller configuration.
> 
> What is the conflict you are getting since all it has is callbacks only, I
> wonder why do we need to duplicate it.

Ahh, so irq chip should be shared actually..

static void gpiochip_set_irq_hooks(struct gpio_chip *gc)
{
        ...

	/* Check if the irqchip already has this hook... */
	if (irqchip->irq_enable == gpiochip_irq_enable ||
		irqchip->irq_mask == gpiochip_irq_mask) {
		/*
		 * ...and if so, give a gentle warning that this is bad
		 * practice.
		 */
		chip_info(gc,
			  "detected irqchip that is shared with multiple gpiochips: please fix the driver.\n");
		return;
	}

        ...
}

For your patch:

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

