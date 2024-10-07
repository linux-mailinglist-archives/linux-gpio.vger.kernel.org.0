Return-Path: <linux-gpio+bounces-10983-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5C39934E9
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 19:25:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE1061F25E75
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 17:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2CFE1DD55B;
	Mon,  7 Oct 2024 17:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NO1Jf5IO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0051DD54D
	for <linux-gpio@vger.kernel.org>; Mon,  7 Oct 2024 17:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728321941; cv=none; b=fzINIWP8Onc4CTU9Ocw0QrC9m6r3sTQ0+4WLZ+YEqYr7esHIw3QMni4GenwSL4Q8FI4unKMXlorZTIEyMHT8rkGJhP06lMLz3LRIv+hlO9nZeJi+JQfBA3OVV92aHXm9cUXqiAOSQeAbUsbyFY5Q0oyTtxdD33Bz6UX/BrM7/0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728321941; c=relaxed/simple;
	bh=TKT1fPvBhdSvjFM+su119l3omgqtUQlkCyVErd6M9rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tvaIWtAKhQhKVrXYBFdqHHVBC+o3xdWFMEnTGpuH8VdGy9v7sstdfTfwj2D/WvZfTVQkr7QumK5ej/Rs5w/TI3zV+NOtV0sCBicwKiHk+nxpU3pcAjEM+BGTLKlQ1+HIKRQu6DAk+TwoH2gDl1LwZBnbEPo52zIW82bLImKX1fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NO1Jf5IO; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fabd2c4ac0so50520261fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 07 Oct 2024 10:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728321937; x=1728926737; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tvu25YDiI2Z9U1zJ1C5SAcMTqiUsv9QKQ7L6f51vKjo=;
        b=NO1Jf5IOr7O5GndUS0EiZQbnUIQBZaOnlP9Hmrc4QDH+J6MqKOuEBQPCIE4TFd6ruh
         pb7yF5Z/med75RjJK5qCyPl7IVy+MqERaRi2dJ90ZqowBxJHbjp3PlgEny5B4UHl6ohY
         PWJ7oxlBmkOVF1SUFg4WDYV/qj+UuKOU7m4pYqCK1hWXHJFEbx5dh4gNUVFN02nk4gb9
         JetWW/m/bSlKGrPA46ehBEBrB6AqOgN9hyM10ijIHPkIH9jyISjy4mmSD8LszKizWAs9
         OJ2d8x33GK/TUFPCWPBENvk+N8/zekgO8B1An/GO8RFCVHnOLhgRNwjSslfiuBwR5Ity
         vkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728321937; x=1728926737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tvu25YDiI2Z9U1zJ1C5SAcMTqiUsv9QKQ7L6f51vKjo=;
        b=d6P3D1J7NM4brl8Q2/QsHngamRKn47K6plE5rkOHejhdG5+KAdQVxYp4rXqITIqvhm
         QNu6ffyDU3v5Hd6QZh2tODIhO3YLrCEc0itphGkJt8ApoGByhEjPe0q2MyYBR2pFOw1y
         uFB1fS1trSiM7sm1f2obEjfu9jXHUOO1tnOGBeQG6nH0G+HaYLnuEEEI4uLbzEgcwL16
         xe1riSpBFQ1eYDvLDmcKg46ji/5VoeLWePaSPk/BBQfPAeEO3H0vh6HwbImzqOTfDQjg
         vcGr+MRWS0dzOSX3kEtTAJ2BBy/pvfZq4BmIjUoEo7g3aRUG7e+pmPv9v1AKi/dINheB
         CYQg==
X-Forwarded-Encrypted: i=1; AJvYcCWBBanh3b4YXD0mct0p3cibgavkExoeURNXBHFIKJ6vpORwQCkQUUmCCSK5rdAYHKvY9dwyHBWlOaiA@vger.kernel.org
X-Gm-Message-State: AOJu0YzW1nCJeBrbNrFSnkTvcrnC2iIkL9+LpjygqIst3q59GG0sJaUB
	dKPRwHrDuljACwFwjIepDoPHWYqg97m/emAtgHL3iqs8ArEaHEiB5QuZzdrUJPM=
X-Google-Smtp-Source: AGHT+IHXXpe3wiF3z7CUGfLiUgBYqbFDfwzcAqjxebC9RdM/MyB0v33/hBXc3wcZsORKpMIqA34Y/w==
X-Received: by 2002:a05:651c:550:b0:2fa:cac0:2a14 with SMTP id 38308e7fff4ca-2faf3c50682mr57224721fa.11.1728321937446;
        Mon, 07 Oct 2024 10:25:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2faf9ac46d7sm8801421fa.37.2024.10.07.10.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 10:25:35 -0700 (PDT)
Date: Mon, 7 Oct 2024 20:25:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Karl Chan <exxxxkc@getgoogleoff.me>
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, linus.walleij@linaro.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v6 3/5] clk: qcom: ipq5018: allow it to be bulid on arm32
Message-ID: <2jquh7pamtohql4escq7kdcliyhtvztpfmp2cbcjvotmgua26g@6cz4rrhqgv3x>
References: <20241007163414.32458-1-exxxxkc@getgoogleoff.me>
 <20241007163414.32458-4-exxxxkc@getgoogleoff.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007163414.32458-4-exxxxkc@getgoogleoff.me>

On Tue, Oct 08, 2024 at 12:34:12AM GMT, Karl Chan wrote:
> There are some ipq5018 based device's firmware only can able to boot
> arm32 but the clock driver dont allow it to be compiled on
> arm32.Therefore this patch needed for those devices.

if there is another revision of the series for whatever reason,

s/this patch needed for those devices/allow GCC for IPQ5018 to be
selected when building ARM32 kernel/

> 
> Signed-off-by: Karl Chan <exxxxkc@getgoogleoff.me>
> ---
>  drivers/clk/qcom/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

