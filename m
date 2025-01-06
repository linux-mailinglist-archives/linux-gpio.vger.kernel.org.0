Return-Path: <linux-gpio+bounces-14523-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC23A01E8E
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2025 05:35:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6B687A1815
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2025 04:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A365B19067A;
	Mon,  6 Jan 2025 04:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fn4M7rv/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29D84A04
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jan 2025 04:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736138113; cv=none; b=ObPH0Ku5aQYECy7xLZoozJvwDfJuEixWSck5F7CH4MssUlH9vfmxhqpi4fw2bFURn1hhiqiqYn0smSCGtlZb0zIaSt4FlmLB1GfcD0U3HaifWU1IISguPRL9Tu1bh3EayfmmKlVmZMKfMdcliUQGSF33pJABYenVScCsjc3/G7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736138113; c=relaxed/simple;
	bh=OM5GYYJQIEZs6lnx+JXgGkzgb/3ca7LSN7LOFvTaN04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FaNzasP9XDAvsu3qHTeKIIa0kx3te91E887lnwGbFc8swiQ5ucQDS07uJVbeeJs4oM36uhz+ODnSZ6nZXR5M+F6fpDmof4otSTugMwe+kLo7qrImKWGWv2OK+Aig1pc3hyFlWb7bOGSGDLCboeTtDEMEA7qb3hzgIYUBVxo8J4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fn4M7rv/; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21636268e43so13554855ad.2
        for <linux-gpio@vger.kernel.org>; Sun, 05 Jan 2025 20:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736138111; x=1736742911; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LfuLaRSTSw7gy1jnNNGfbkOz3vWlnSzgGTrYOpHrTuE=;
        b=Fn4M7rv/wC0nFRSewE26H0GcvMOiTnl7Fi+1fLDEP1n7EpD+bC7cb1qQxI72DOFwrR
         LovZQmpxoiE6eJ/WKPS+hvgXE+tHCMEOCdc+dBkwIoGQoaAje1bWecLUOwOBNJLuuOfh
         qOexCcCYN+ptKmkB70DNUYHROAOXomHl1NIeWXpENKSCXC2FhPouGr7+Ex4PR1PBeJWF
         lKkbcpntvrb16QJpXEAdhUvfIZRHPp1dxbt/N6z3ZoVtorUPpG8+8WyRK/wIiJk+cpgz
         YlgtP2td1N30r82n1G3ivNze5HY5Y/LVkPgpuz8NuU02nl8CfY+m9GQejes4Lm5+A8Vg
         a/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736138111; x=1736742911;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LfuLaRSTSw7gy1jnNNGfbkOz3vWlnSzgGTrYOpHrTuE=;
        b=jBK/vuaOmO6vu0kQQZMcsFn9O1I+KdJ/gJBjpW8K+w3s4n1nN3ShKsT2XW91HmVdrV
         ERX3IbAX5Paom1T0uSc/Dju2vRaiQopE00pD4fZo2TkkCca1PkHDbpQ870if88uzXPs5
         Cr2UgmP4xXVqxd0hFYsv6h4a6a8wQ+nEK1ow96CeebNZ6tEOVFcmVrs8vuDzvUE11XMr
         u7bZYECS8u/bt5bRsuBbPtCfk+mS5bFtSPggS1IUu2CCTRks5qVeB/abxzJEhfd375Tr
         BEYL9N61x3UBmtJ3bViOKv7Yv2pQJ2oPuI3hodGNafOtDCgIeEoMisdpQQlDfjZFXPHG
         YQ0w==
X-Forwarded-Encrypted: i=1; AJvYcCWDndIrG5gsgPUyHIXCNQLX+CHCGfkYbXFhONWphu038+6hDQ6AYIqGGpWYvawLO0DEFhkCdhaYIH6w@vger.kernel.org
X-Gm-Message-State: AOJu0YxZQ76IWrSdUihbG0mqxFs74ah4SyXIBKtM7Dd5RMpbyUhYewAE
	cM1nhYGJhB6nMyFb81e/3Dy+/3wqGIIFXIj0FgZuTEcLHouhBPs86fI84y3etuY=
X-Gm-Gg: ASbGnculNqQ2EjfVcLPQ7nwRbGefNgEZNSE1aD7aprOH7iMu1hH8yfeZa2yoUjQSxSd
	wCV415AgL/DtG4tjAI+xrDj71Xo1RS7xTLTw1vQRn27NSjWxhoaNBVDyS1A1UL5MbLLDXjN+Lv2
	Nd8x8zpyhRNYixpeOkc6XeU6cA1qeYdZBTyYiLHJQsYNvr4xztvrUfGwdpeIexlzJwwNS1Gn/wZ
	Fk6z1DWB3sTD+4TrF+5VV/5q2wC86xyzmAqW5L2ku2gsF/9pwvg0PM2jDo=
X-Google-Smtp-Source: AGHT+IH4OEI1Mvt9XR5zk2GUaRub3spOstatsKjyOJ/ychbjGr7H7IiUgtuZVsnqO2+cIEjfa/nh6A==
X-Received: by 2002:a17:902:d2ca:b0:216:1543:196c with SMTP id d9443c01a7336-219e6ebb776mr651256725ad.27.1736138111209;
        Sun, 05 Jan 2025 20:35:11 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9716b3sm284208805ad.90.2025.01.05.20.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 20:35:10 -0800 (PST)
Date: Mon, 6 Jan 2025 10:05:08 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: hlleng <a909204013@gmail.com>
Cc: info@metux.net, vireshk@kernel.org, linux-gpio@vger.kernel.org,
	virtualization@lists.linux.dev
Subject: Re: [PATCH] drivers:gpio: support multiple virtio-gpio controller
 instances
Message-ID: <20250106043508.x3pwt3jzh37t265f@vireshk-i7>
References: <20250103083520.1764441-1-a909204013@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103083520.1764441-1-a909204013@gmail.com>

On 03-01-25, 16:35, hlleng wrote:
> Modify the virtio-gpio driver to support multiple virtual GPIO controller
> instances. The previous static global irq_chip structure caused conflicts
> between multiple virtio-gpio device instances as they shared the same
> interrupt controller configuration.

What is the conflict you are getting since all it has is callbacks only, I
wonder why do we need to duplicate it.

-- 
viresh

