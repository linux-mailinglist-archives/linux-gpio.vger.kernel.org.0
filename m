Return-Path: <linux-gpio+bounces-26140-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD35B56DCF
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 03:22:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC6E27AC066
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 01:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CACFA1E3DE5;
	Mon, 15 Sep 2025 01:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BFu+ld37"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDF21A3A80
	for <linux-gpio@vger.kernel.org>; Mon, 15 Sep 2025 01:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757899324; cv=none; b=E8AX0kw/smw3z32veIUbs94HTlI7XLJ797f69qArkliGhG0pmR1cM7G3RLRewnp1Zl7/66msCxlHDn+0thBIC1OP2rMuvYNczaUxVg/8phqAyWV49VNDbmZH/ZSXS8s4EdISJEmzYXkWQ9BzerXDcCACWsdcC1tHH6RlCoLMUzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757899324; c=relaxed/simple;
	bh=AjKw6PEaz3BcGdiBDSwiRmCOJqo1nibhkDfGdbCSQ3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WKXxUzKCkcSObUMxor6n/p3lyOr4+j9ygW/pzjtGwSLXgrb8r5p+gp/mCy1NOAcnYr2WP19sYFmeLEvgUKwaFGDR3yjqNtGhpzKmXCyJcYHsMyFO3FBLvuBHa/PurJZKR1oBnoIBJlDVUDXoc2QYnUG/IztjkjmUg7zAP9Yzgvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BFu+ld37; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-77615d6af4fso2840725b3a.3
        for <linux-gpio@vger.kernel.org>; Sun, 14 Sep 2025 18:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757899321; x=1758504121; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zhrGXtUHP77SSFf0UteGZvmmtOiRSwSPGvsy3hAXYxc=;
        b=BFu+ld37nf9FiKKQ7L0kPWRxYjbvyGCD3ZtEzdQD+JC6IzI7iwx9dKe9MCmOMP4SQt
         kOVyrxfAX3viK0oQE3n3Jew44Bb/iH4+gMbV67PGNarxLKP7wAgwpku1r4JqHcvwugBh
         MDCj85GMjKDrtyfWACDh2HAps5ka2ZMAECN1eiU8MIIjbUgFy6wTKFVmbuRZtUrVJnOs
         MPVL4BVVj88nreLwMJxUyLO2mCCSQW5WwTyXCtvJeHE4r6dVpWDLzpjGpeWTugOTSvoL
         6N4hdEHjN/TK+gqEvvZ4WcX4Pv0c0m3gx9piZWua19iHPVtRF0CCmBiWGcvNCu4oDSIV
         E9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757899321; x=1758504121;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zhrGXtUHP77SSFf0UteGZvmmtOiRSwSPGvsy3hAXYxc=;
        b=NCntH7TQy+c0IfSXP+5Vl1jy97asCoaPQKshD0NLNRnII5LtLSE9gcTZW7P8ZuyBm/
         Ore0lHYnoJhjMi+jRU5YF/nSpVjg7hXt/DRpyjM9I9Lau2ismGrcEIeNFK6G78W3OlOa
         T+HZUDCo1EpTopIsPiNiKJnIZrG4dcQYdW2FUnaKtlHgw7u3hC1U3wujweQ1iweOhw80
         KQD8EsU7NZdNZMmxl65UtMFHkCft6MZF9pGdNjbvOMTBa2TpxSUEXn/X170ryzZ7Ofeq
         NRMdsrb+oLfXX2NJgXL5nkFpvjzo1rK+hZwGMAANhyvdkPGPEI5Angzz9yhh2z2rE3bY
         x3Ig==
X-Forwarded-Encrypted: i=1; AJvYcCUepgUUh3qMD53VdkBw4VnoItH5bgSb5dImSll56Jq1up+5IcfauQZvqLHg18eWcL0hzC+CK8s8kBDw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1cpUD4HIBROk+/+r3zzTSgFTYpZtBHD3nffj5xXnU3ycDPnpg
	kVj8oeI6bJMMQLQqrHiH9ILirHLiwJaolVkkjDozDIj3Uc4uPoB+MU5H
X-Gm-Gg: ASbGncudv7/iVqj/x0eun1wINYHhjZq0bJV1xw/+4xCOhYwIdjsiiTftaVQbORW2D3n
	5dxpXcrqC/foMkfhXNpJMiLBm/VxIVBG+Dbl+GM47IXaN+jjQ4WKs4KhA4zTKFulDOz4vL61WmE
	sJC0JmR54sFnWDPKtmBQ0/fkRuLh8GkaQP92N6AAFiDtinLFjq6nuUdW+FI7c4fJOvEXyCE/9LE
	QrisGSISCAmTiHoSL1lTCDhP1e5+hbyXba4CbS13iFLRwtOIN3Uo1YjC9AQ3XsL9YYzbS1ZQTtS
	gpviopgXqCPL+T0swtmlQ+mX61OL8anNfFRVOutCV8TKUm4yEXe+5Q685DQVOMtvd2NezSVepmr
	FZfmnFSktSStIw78hgUyEqg==
X-Google-Smtp-Source: AGHT+IF7cZF4LyNOq8KLkkPfU+soq4VEFgYqOlZpq0rovEoiTKXGjy1E/ebjq0srKeY/xi5pzGFAvg==
X-Received: by 2002:a05:6a21:e082:b0:262:8bce:33e4 with SMTP id adf61e73a8af0-2628bce3f27mr5200250637.20.1757899321383;
        Sun, 14 Sep 2025 18:22:01 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:aa7d:7a2:2fd7:5bae])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54a3aa9234sm10446429a12.54.2025.09.14.18.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 18:22:00 -0700 (PDT)
Date: Sun, 14 Sep 2025 18:21:57 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Mika Westerberg <westeri@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] gpiolib: Extend software-node support to support
 secondary software-nodes
Message-ID: <kpoek6bs3rea4fl6b4h55grmsykw2zw2j6kohu3aijlabjngyc@7fbnoon3ilhw>
References: <20250913184309.81881-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250913184309.81881-1-hansg@kernel.org>

Hi Hans,

On Sat, Sep 13, 2025 at 08:43:09PM +0200, Hans de Goede wrote:
> When a software-node gets added to a device which already has another
> fwnode as primary node it will become the secondary fwnode for that
> device.
> 
> Currently if a software-node with GPIO properties ends up as the secondary
> fwnode then gpiod_find_by_fwnode() will fail to find the GPIOs.
> 
> Add a check to gpiod_find_by_fwnode() to try a software-node lookup on
> the secondary fwnode if the GPIO was not found in the primary fwnode.

Thanks for catching this. I think it would be better if we added
handling of the secondary node to gpiod_find_and_request(). This way the
fallback will work for all kind of combinations, even if secondary node
happens to be an OF or ACPI one.

Thanks.

-- 
Dmitry

