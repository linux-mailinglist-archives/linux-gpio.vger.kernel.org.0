Return-Path: <linux-gpio+bounces-15311-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1985A26AF6
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 05:18:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65328164910
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 04:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81BAD1552FA;
	Tue,  4 Feb 2025 04:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rQm3TiVt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE51235947
	for <linux-gpio@vger.kernel.org>; Tue,  4 Feb 2025 04:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738642688; cv=none; b=pZWiKixUt4zClWpcPGZeCxNnzuPxgYnxIpPSnNVsm3EDX7ZQheiYTlkDX+hRSvgoeqkuP96XzcSfrpnYz5HFSqkYmbI7x8UcRpogfVCSNQcgwVhF3WOM0klxpMP5EkZlsmWiHXj6nBu/yy0cheSBcGUoH+Uc8MjUe6vg1p7z6KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738642688; c=relaxed/simple;
	bh=STGaDr1uklKKtl9q5tY+Bpx4/8kNo97luzvTOEWsoD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ynq30WKx0FIFlV8DRJb786V5x3ZkdJyEv3gxqNgrhepcomPcqyqOb567/MUiW5O/p0LvldSzxHz2kMw7ZTvYQChuITDYecb5nvBA4YFlwkB5fHbshVEH4c7uM612tl1FrK/VYczSd1wGcG4SlRlxwIKRIOxFGw73ukLMjYDpxxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rQm3TiVt; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-216395e151bso62309265ad.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Feb 2025 20:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738642685; x=1739247485; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AaEvES/EkVvW7c8/aoDjL1idC5qIURhkHhxPxl3VEqk=;
        b=rQm3TiVtyg6wxk/DXkZ5VixvfSD/phBjuH2IcUsWuH2b+7ogoHnCS+Nge+hdmmUhro
         KYm8b29oWuNxh5cDdoLooe7On35ZT+JBHJWfiubp2T3n8U0cs3G9M1f8ntvjxnEqYnKu
         kuOE8cSRTU0A6APhxvNd7yusAK8LiCwW0oZjlw8vWIl+f0Vg6RqrWlCI+/XGwZ3Soqlf
         /SmyEOpRuuQUmjMoS9KGbL/9JT3HLOiPT6B733ap/ddZA/CeUgmuriHWepNnTRuJX85Y
         wHL4PVBZKP0trQrP/Q4V6vwRaRYERNFpkjXa7UQqtpqUfzr4bRM3oIUi+T/M2xjSEs5O
         vH0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738642685; x=1739247485;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AaEvES/EkVvW7c8/aoDjL1idC5qIURhkHhxPxl3VEqk=;
        b=ClYyQ4GfIcHG7bOitH+CU4i0c09tx/sVFjj3jVPdDoVG8sx0mt8RfJzEn/hsdMCJ9J
         YN+xmNcCWqykZQypw01a/sCluHAU+BwoqMJFnuzsK23/2wL6aVbhm1gDeQ/JD70iBKHw
         kLN2uX+Tds+FqVgsl1m+PMGjDoiJcEbvlKttHrrPVPsSe3qIjoUkmo/BGixhJvv/p0jK
         XKz3EDDhohJ8Jx4gBUmf2if5I9RBXSlN69BlaG6jRkRR7UCA++M2rcBf8vK5GqzHPPlt
         a5v6snIH/8HTFjQgZim5wIA59K2Gur1fPNRQlhZ6ddXNvBb8PlyER4t4UKfFzjGLCZlF
         Lldw==
X-Forwarded-Encrypted: i=1; AJvYcCV9fQgb5BFkpry87PyeFqtGRNffxD0kFnP9zWMTr9c4D70/pxlYBOPSKwbj266ZxfjkHLJaNJjRfBLb@vger.kernel.org
X-Gm-Message-State: AOJu0YzqfE8/KDq3ZdL0cimHg6ETRgAG71vjRKPebbke/frSO5CobHOc
	j3dXX0mfbUgpPTUCY48spgALTMlHsqkuq4KWou2RXHQreTO727B+Silpmbu4IxM=
X-Gm-Gg: ASbGncuv6oSJTzeZ1rRjmPewaFqunKPbAu9kpLV9UECG9ZGsKlQjt4xaGAosDpyJU4R
	NOLWAKpvkCMO5GPgNQ0tUxyK4hysMJCcyXiXJK2xVaSouq5qKDuad7BT5PLlEXzVp3rCo45+foB
	jOVAYyq+lhb+oWjMe9mKwGhiBvZeUA+Ed8VxvbkSu3+ghXbPgYLZZA+PmS2Y5PC2Qq0EiToQIJv
	mjKhmaWq/9H7nNCz23HkbMDB1Hk+znvYQutH0AFSb42UU1vSAKVL1kN/McR4nA9m356XD5SpM5o
	1Pmpufiq7ALPmy0zAw==
X-Google-Smtp-Source: AGHT+IFjMn3EBzlXCBp6AXDeSauKUxZZvB9ykoeUsoa90+X21Um5pTQcJH0A2ASCyTiekgMMvlNjBw==
X-Received: by 2002:a17:902:c40f:b0:215:a2f4:d4ab with SMTP id d9443c01a7336-21f01c22b19mr14461895ad.7.1738642685085;
        Mon, 03 Feb 2025 20:18:05 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de33254a8sm85511535ad.246.2025.02.03.20.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 20:18:04 -0800 (PST)
Date: Tue, 4 Feb 2025 09:48:02 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	Phil Howard <phil@gadgetoid.com>,
	Koichiro Den <koichiro.den@canonical.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod 3/3] bindings: rust: tests: disable device
 before dropping the resources
Message-ID: <20250204041802.e7xq3f7i7tkgfsyh@vireshk-i7>
References: <20250203-fix-gpiosim-in-bindings-v1-0-d2c9e0f3a29d@linaro.org>
 <20250203-fix-gpiosim-in-bindings-v1-3-d2c9e0f3a29d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203-fix-gpiosim-in-bindings-v1-3-d2c9e0f3a29d@linaro.org>

On 03-02-25, 14:25, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Linux kernel commit 8bd76b3d3f3a ("gpio: sim: lock up configfs that an
> instantiated device depends on") uncovered an issue in Rust bindings
> tests where the GPIO simulator device is not disabled before removing its
> configfs entries. Implenent Drop for the Sim struct in order to disable
> the simulator first before dropping its bank and device objects.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  bindings/rust/gpiosim-sys/src/sim.rs | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/bindings/rust/gpiosim-sys/src/sim.rs b/bindings/rust/gpiosim-sys/src/sim.rs
> index 71b9453..e3cc95c 100644
> --- a/bindings/rust/gpiosim-sys/src/sim.rs
> +++ b/bindings/rust/gpiosim-sys/src/sim.rs
> @@ -328,3 +328,9 @@ impl Sim {
>          self.dev.disable()
>      }
>  }
> +
> +impl Drop for Sim {
> +    fn drop(&mut self) {
> +        self.dev.disable().unwrap()

Maybe self.disable().unwrap(), since we already have a method ?

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

