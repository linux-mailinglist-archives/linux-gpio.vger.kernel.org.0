Return-Path: <linux-gpio+bounces-16503-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC53A4238B
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 15:45:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E83A3A8C48
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 14:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B32C7194A75;
	Mon, 24 Feb 2025 14:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="eoLN/1nr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5131624F8
	for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 14:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740407669; cv=none; b=sw3KnoxyhJcOdHQzLAUtlMJJYsC21DcVz8SuQXbo6uc7mP+tyUz46TJmHdrY4eoV7o2hkSTzumbvPLWHEaKB3TgTZTTBGdK/1aLjNB9dMXCBQydG61H1evCMkpGtr60SSNZ+ehQFINSU6BK+IVj3Ie8MtA+RTn2XCNBfCXV8X80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740407669; c=relaxed/simple;
	bh=gtWoGKMaCntSoWB3c03NP4J9WjVIr1FotK1T44+GyYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uWYW8tYo+3oCIanqMjixxPRanb62qszSw3Vsk7tOt2p/OXCs7ZQPehBuXBm0EgrjF8CL6qyMRck4UwisUHvusISP9prvBcb5TUJA8L3sfsm42pwrCpha9qWs7dbS9iblpWcecU9uCDfllwJGEff0gXFmDYp11jb/NwKGuuDh4QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=eoLN/1nr; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 295F2403E3
	for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 14:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1740407665;
	bh=yhFJ4UHx5R5lOf0wcq1Nd4uhLZ5ZR5NOQL7ZBIbthnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=eoLN/1nrS8znZf4RX+gEGhlWGQlrRndvkWojrWEh37KqeJNz1hfQHKcmiRobkHgwE
	 v7x7CuUuq2zfgr6hDYBFwmSEhD4ZMNXpt0gn3xhKyfQIqLK+EYlh/Rc/1hgda7uZgy
	 xqq9UnSc4j190bYFbvZ8Rfqi5rTBX3AcOepxREGUhUj7+pIzvtNHk4eUS73NM3z9QW
	 aUcqx+PK631wEdi+dK2VSkVd7cpvdWQwCwXByMTLcu9ogbH1uY+xkH6+Jr4fETR8hy
	 Tldfds4EuP0hnvw3oWDSdCM6H6VsblxgOWmRZOsgp/DpiBzYvnsn216xc3AsPI+ZPU
	 Hpp9kW3xJHOmw==
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2fc45101191so8633401a91.1
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 06:34:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740407664; x=1741012464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhFJ4UHx5R5lOf0wcq1Nd4uhLZ5ZR5NOQL7ZBIbthnY=;
        b=UolZowNRJr6na4Hi3Dp5bOM9dFZTSpQRbkBcWRMo5Q9lAZybuRoL6h1kgonP1D8IKr
         slhNazBzKSJhbzuRhIx/d+VZ4KUmuydX/e5ts6YKaRM4cTFdJ6I653m+RWHdVJZkKtMI
         6TDAKSt5eCPAxMPuS4CeZRCWAi4LQ50PLB4m1fOaw7qaIkmwijdUZppn3fkbL4W7WmQr
         FzlAzDk0ZfMdL7KKeRQyKFW2pBE7zCYIrFoy+ZNH7X9Jbr6UaPF5m0ENy5eWQ5RzuITT
         ELSA9qXpQDNgwH/cc6cf+Kv/1Nd7AxDnds2nagZjq+F3C72QXV795QUwCd89yeOHfqkm
         8Z/w==
X-Gm-Message-State: AOJu0Yx+g5/ARI8iwtbms5coIMKmwgzo/BLODgrg9DSpMAQmin4ovKi4
	+LjV/yZuKc5RdksVqGkv17Ngz0EQHge6unSlYgdawHT0fumOWjJ0Eu8+it7fQxD1az9FCnszf1b
	Ndz5nP4puHPh1v8tF5WxYQxfC9tt7xSN1EMDIxFgZdkHSExCUEX4eHmR1YfbhhlYpva6uGVnOfw
	Q=
X-Gm-Gg: ASbGnctDRG8M75+kKLscUsdsCkvxoG10s2UmiT43m9iqZbVLUFGsnBSXrd2AYfZJMwG
	11Hbh0StjbsThondZp8vkZMZ7qK85n3dQn5Kgm0eagzvFEw/Oe2XfUk0PPTU22Hog1SVRkuVagv
	Rr9aPOxoxFA8ojkHI2yosox8xUUfq4KdgsNUfkq2jCcauSZnLlRsd/3T5nDu7VUOL0RVatFFd1o
	thPwGP65M2Csv5VVXjPD26YneDUgOszhMJBE9JHOhJ6bK86CN38uwvDYdqVotlDH2r2rdbaXLx2
	MTIfpbeLnoVA81hu2A==
X-Received: by 2002:a05:6a21:4613:b0:1ee:be05:1e2 with SMTP id adf61e73a8af0-1eef3c889c7mr24653478637.15.1740407663753;
        Mon, 24 Feb 2025 06:34:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZoGO5+6SYNEGvQLUG/Lrjbn6pkdcM+ukmw/rDgYUp43ttu6AmhAB4GYyEKrbM+g8j74n7bw==
X-Received: by 2002:a05:6a21:4613:b0:1ee:be05:1e2 with SMTP id adf61e73a8af0-1eef3c889c7mr24653444637.15.1740407663438;
        Mon, 24 Feb 2025 06:34:23 -0800 (PST)
Received: from localhost ([240f:74:7be:1:de7b:58db:ab85:24ee])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7328371e36esm14345854b3a.61.2025.02.24.06.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 06:34:22 -0800 (PST)
Date: Mon, 24 Feb 2025 23:34:21 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, geert+renesas@glider.be, linus.walleij@linaro.org, 
	maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Add synchronous fake device creation utility for
 GPIO drivers
Message-ID: <htq76fls75dk7a5nn6u6lqwzm6k5evbgp4uip2jf7kuoq7tjaw@dck7tgbmek3y>
References: <20250221133501.2203897-1-koichiro.den@canonical.com>
 <174040547574.48618.1949653889364615138.b4-ty@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174040547574.48618.1949653889364615138.b4-ty@linaro.org>

On Mon, Feb 24, 2025 at 02:58:58PM GMT, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> 
> On Fri, 21 Feb 2025 22:34:58 +0900, Koichiro Den wrote:
> > This patch series introduces a utility for some GPIO devices to reduce
> > code duplication. There are no functional changes.
> > 
> > In this series, only gpio-sim and gpio-virtuser are updated to use
> > dev-sync-probe, as the current gpio-aggregator does not benefit from it at
> > all. A follow-up patch series that introduces a configfs interface for
> > gpio-aggregator will convert it to use dev-sync-probe as well.
> > 
> > [...]
> 
> I don't see any further issues and it passes my libgpiod tests so I queued
> this series for v6.15. You can now base your aggregator work on top of my
> gpio/for-next branch. Thanks!

Thank you! I've just sent the aggregator work v5:
https://lore.kernel.org/all/20250224143134.3024598-1-koichiro.den@canonical.com/

Koichiro

> 
> [1/3] gpio: introduce utilities for synchronous fake device creation
>       commit: eb5ab6ffb4ca2d28121455dd7452061367ed5588
> [2/3] gpio: sim: convert to use dev-sync-probe utilities
>       commit: 2f41dbf9cb84349f510ebf2165c13102f79a550b
> [3/3] gpio: virtuser: convert to use dev-sync-probe utilities
>       commit: 45af02f06f6943d73cf9309fd2a63a908b587f57
> 
> Best regards,
> -- 
> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

