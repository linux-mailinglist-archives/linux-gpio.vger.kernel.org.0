Return-Path: <linux-gpio+bounces-18742-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 994D5A86E32
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Apr 2025 18:43:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C0A27A5505
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Apr 2025 16:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A5351F0E2C;
	Sat, 12 Apr 2025 16:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k3gH4QIn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C4A1AF4D5
	for <linux-gpio@vger.kernel.org>; Sat, 12 Apr 2025 16:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744476210; cv=none; b=GxMNxk6W56yxeikP9/JJPy4oxCl6UfqI3ZhMMtEW6kTUcVWRV4FEQVF0PfrZnNckcexnAUvHGHUPAlSs+rBIl8ln+t53rXpua3slwYIQ8mw2s3jUfR264t6ypdpCY429UVH60csnR/50L9ur7Ix2E1SV0TMA/DbhAxBNpD2kgH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744476210; c=relaxed/simple;
	bh=QyGAX3gvnNPkHq56Ks2u/KuVyL37Hy9JBP+koRLpqqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D+c+mzOUKrghrV8o4aXedJNzOhEHf1z3rCbN6ALs6A73pZj35gWwjd29nPWa5Mc553V5S9NT+1NuDJIiWhNP/hfgjn+rCFPngw7tQAOBXBa7wT7w0EfZN8r1EabrwzrqS7V0PF80uIqXQgb5RUvSaM65u0HKzwjGwMvUi8Ud5f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k3gH4QIn; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3995ff6b066so1553837f8f.3
        for <linux-gpio@vger.kernel.org>; Sat, 12 Apr 2025 09:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744476207; x=1745081007; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tgJ7FmlMySY/gakk4Le0yZ8LtG7TbtIjOQVOYVhLjjQ=;
        b=k3gH4QInP1HlFuzVkqJzqutWowx+ZtBlr2tNI6M+dzNC2ShjGDw3u0ycvQ+VChMQML
         QsfrC0GihqABN79/2UGefnqlFq60pFFxAPE6ZCK0IBc1cOOYyJpFEpyuWQgNX5GjCyt3
         DWEsBD5jpYE6zPNriGc83VwXQg65zdTkzpBYpAX3QM5up47ynfGmL/GYQy4A/miwKJvB
         kqK4FzeV7JRp690dfD0t2EYXLRKtTLQ06A/Gan6vqC48d6CTzfIqUbkdTC5MKId8t5X7
         cO5jrcq2gZhaJk5neKzuNGzMkph3BCCzSmxBVgGMPCuMDpGl83hLKcOCNW6vNEN37tMI
         hWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744476207; x=1745081007;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgJ7FmlMySY/gakk4Le0yZ8LtG7TbtIjOQVOYVhLjjQ=;
        b=YSXdQ7TEkpSTStlAnwve7nfkVwKHI5or08h1cEDJydwe/hJx/87laol5cdgBmjExHu
         Gygwvp97pcVwnP8u4Y/t3M+jeGvqDxp/6cMBIwnOjeSezb4mBmLHHKK1Gkb6VzA4hBB3
         yE9xRdKxSV7hs8Lr4xeR68fQ5WbEiAcNPXofMZ5bfG2lp3BLaa2T4zMrZ++9U9afxlIy
         FvD1Ck09mEqkGpOKA1rHKEOTyOj/hQ1ecnUXqlvffBSziFw1sI1ugBPhrTDBoS7Sr3TO
         kStajDrN9FbUDz3hpbfRMdzsOroczS7OP2OrA4/0LojM/S7MnhRWdvZmSmzFrcvhr/bo
         U9Rg==
X-Forwarded-Encrypted: i=1; AJvYcCXTDSQFrLR+F5TFpzYqbfTepOjzCLuw6ha7bpmMqd7yk4bSe8p7KsvEgKbEqLDk7zaiWg2unn51+L/E@vger.kernel.org
X-Gm-Message-State: AOJu0YxPNtBwrcK4wFWwr1ZL+TDQ4XtdhEsLApOskVPbTBons8nowcob
	LUhr93hhOd1WVjQ0zShnXFs5ZeB38aSPRyNSz66tB5C4Cj+xBNCSK12i9xCMHyc=
X-Gm-Gg: ASbGnctXoFgK4E6/JKic4Fd8M06AdeWJWydfBKwPAPEICxzJQl8DmxRiG/ThoDfFRW5
	txW+cOjg0JG40ESkULRRJYmrnnB/wQZCvyHdW2s0reRmAbzkxoGOWX0+qyrCyH3CGy09URnOEyK
	VgyTFgkyBFUY27DClmq+s82AhsMAwG7UGKM9wn07Z/V5ldrHpNQhf3qH0ZT3PqtfZ7bdM04egQ0
	sMzzaZbldbrXjvrNNzJ99zwfY/jtEA3mTDHirTGKfmshuBQ2sXs5DlSFQo0CnPEjZXa/ur6ozdu
	+tDWC918LGGdkx3o4SXCKAW6AJ57wFuo7KBguR/eZ4jKKBPdfgZatUNF
X-Google-Smtp-Source: AGHT+IGdnRf+gEkkeW8b9r86hiA8RBuVbjG/9HFncHylTiqjI9Go6YaMUkdgogkwYq1c+nx6je/y+A==
X-Received: by 2002:a05:6000:40cb:b0:397:3900:ef80 with SMTP id ffacd0b85a97d-39ea520081cmr5520055f8f.22.1744476207180;
        Sat, 12 Apr 2025 09:43:27 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eae977a7fsm5467993f8f.45.2025.04.12.09.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 09:43:26 -0700 (PDT)
Date: Sat, 12 Apr 2025 19:43:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Koichiro Den <koichiro.den@canonical.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] gpio: aggregator: Fix Smatch warnings
Message-ID: <7bed7798-1671-4926-8d97-2e9ce34a683d@stanley.mountain>
References: <cover.1744452787.git.dan.carpenter@linaro.org>
 <52ap2hc6ii7hlk2zixxf455nens3rxtwvrrwhlv4ii5avpgmcq@lbrdov3ygay3>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52ap2hc6ii7hlk2zixxf455nens3rxtwvrrwhlv4ii5avpgmcq@lbrdov3ygay3>

On Sat, Apr 12, 2025 at 11:45:08PM +0900, Koichiro Den wrote:
> On Sat, Apr 12, 2025 at 01:14:53PM GMT, Dan Carpenter wrote:
> > Fix some static checker warnings from Smatch:
> > https://github.com/error27/smatch
> > 
> > Dan Carpenter (5):
> >   gpio: aggregator: fix "_sysfs" prefix check in
> >     gpio_aggregator_make_group()
> >   gpio: aggregator: Fix gpio_aggregator_line_alloc() checking
> >   gpio: aggregator: Return an error if there are no GPIOs in
> >     gpio_aggregator_parse()
> >   gpio: aggregator: Fix error code in gpio_aggregator_activate()
> >   gpio: aggregator: Fix leak in gpio_aggregator_parse()
> > 
> >  drivers/gpio/gpio-aggregator.c | 21 ++++++++++++---------
> >  1 file changed, 12 insertions(+), 9 deletions(-)
> 
> Thank you very much for spotting these issues. I doubt myself for having
> overlooked these.

Heh.  Don't beat yourself up.  Humans can never compete with a computer
at being nit-picky.

regards,
dan carpenter


