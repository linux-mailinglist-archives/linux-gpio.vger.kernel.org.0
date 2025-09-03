Return-Path: <linux-gpio+bounces-25444-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 480EAB41770
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 09:58:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8EA487A5F80
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 07:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B8302E173E;
	Wed,  3 Sep 2025 07:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RqE/Oa1l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449EE2D594A
	for <linux-gpio@vger.kernel.org>; Wed,  3 Sep 2025 07:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756886317; cv=none; b=GQamhcBENxL/g3jdj5AUXoU9N7IOQJmZoeSYbOO+w02HgrQlu2dUEnFXTyOSOtd89b/pN3qdzf163/LbWTWJqedNt7ERokNUjZmpChUPXsiZ7DHHqPPTq9VHYW/CwK846F3npAqz8JB4f6KM3eahKnw2FVIopMVN1RBrWmQZ/1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756886317; c=relaxed/simple;
	bh=rcEWxO0itYV5thJHkwKpX8dt21eqtq4uCIa72lzQx4E=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tr5Q9dGsB8gMFCCzM01ICE7e4D6eAIEIOtbrDldrb4lxE4uzhBnZSWU6dGrskyqT4G/MLLI9n02jvUYWAOBJ+zg418oPTzoL5LTzv+fHmnXZuijK/hrUiIsZF6etYj/RWg/zhzOe/xCHaNPD7JVgzCtg2dxoqDO2bkL7apkihWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RqE/Oa1l; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b045d56e181so166453566b.2
        for <linux-gpio@vger.kernel.org>; Wed, 03 Sep 2025 00:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756886314; x=1757491114; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vc5TDK1H8Xst9gKhvws3EuxZaIkfxswLhF5fBNdm9fc=;
        b=RqE/Oa1lHTJpIZgNtHZTwIZpFKhZTWSjVp1rIZHh8DQl4+/VhxXClWPk7noA3VW+Tg
         l21LNTX4YCzWlu/ywDfrJ5PInw+zPFU06agZTW80Dw8bg9SvN1Um8KnKm2aIjRi2f83y
         LiaUJ2kct1nEHTI6vKndMSVkRYKH1XB99+xZZvo5XdC2nyxAitmvq6ycOFTkRj4S0ykQ
         Pou/2TEdVSDoBCznTjYzT91nlMYjlsFRL1CFsU+5b47iZ1fvrRqXPGbjkp2Kc7zRUHt5
         aLkWub1j5PtmMysxt+Ys/WsUZlMslfa8bXVszKMK6ZB4+16M/H6pJMZFaAuW2GPHqtZP
         sy8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756886314; x=1757491114;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vc5TDK1H8Xst9gKhvws3EuxZaIkfxswLhF5fBNdm9fc=;
        b=kBXgCX8ue1lcN7EEsFROLG6v7WB99nFEcNWiQICffoKE9uyjbxR3fQDLrYNdOXeC0N
         vQjxohncJCjzGWUR8C7PaSAwESKc//fjQp2c4RFWsfFCzyDUPB9KQyGaaUL6d0r45iqu
         3XEhnZdz2rXyN8PyTfU93PSzcJGMTyhCSQr4Q59ftH2vFP1g6d8mGHUrspkEsdS7TF9K
         wwS+NvfwK9ywrqg9tj57nxHsSpmjGq9H1J2Gx2Ryl++VU+z2jMaxbk0POYq3T3L3uQ3Z
         b5NYXCt4soqsEiUAUXs7SQMJ576gSRwz6PT7PvHiM/HDCRu8PeHF2tpRG4wxGBtk0S9C
         c1EQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxbEOzG5XRxHld+meBl8hNkknw00+yYqpngSRSdkmyiCdTU9w850OYh1z8X/9+FYgCDkx2PNipma7t@vger.kernel.org
X-Gm-Message-State: AOJu0YwZKvGrY8Hj1fApbMgW93cQUZjCwu3mCrjWuyDsLg9v6jHpnLRU
	6Ygth1CVYiwlVvCvpfwoOh8LvtjrRHmmvWhlLJsNL1klXNoq4B9IH7g7dspuo5riDmg=
X-Gm-Gg: ASbGncs0OYWYXwb3z23xtmKuIi4HGek2S3mWEtQOlJGn+C58DWYxsRMndbmXc0NhrLg
	MgCtOHyFm6QdcotI5rLuyAOiI0wkBByuD8DmbB8C5B39ZYd6pH0y215LiL2+Ltu4Zu7I7ok8ZI8
	96WYcTwI3JSgtIx2H8TfntAGD0V+BTajvLOgoxZjq1VEK7A/zL0cQNT6VGgLWzO7pD+9gI0PmBy
	H9ja9beeXGxR3XPWqe1UOSqEpO37OGWFNa8J3hRSf2HrFNpG1uyceMGn8zDDa9pbQQFCE2E8jyh
	XeIVhOHVhXuF6fstN7VNcAyOJaVJGq//1rPqwxO7ZJvqvZ5IzyW5+8NQp4JX4M+EC7gDW8Ywa8Y
	sBXaqUKH1PyKjeuZxxXgS6hsLqJslCVCFmcnDgi6tgzSLglRW4Jx5AKD1gTkvgJ8FrF7RsbEz3z
	ZO9T50mffI52A/LsoxHUVXgfE5nfQ=
X-Google-Smtp-Source: AGHT+IEn64Dxy1FDWMJAmp+prlXFdQxbLUeI9Tc0ZftSDAzkPfUTGMaspxdMpVBKzN42VG8J7KFQzQ==
X-Received: by 2002:a17:906:c10d:b0:b04:20c0:b219 with SMTP id a640c23a62f3a-b0420c0b768mr1025270966b.64.1756886313590;
        Wed, 03 Sep 2025 00:58:33 -0700 (PDT)
Received: from localhost (host-79-36-0-44.retail.telecomitalia.it. [79.36.0.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0413782b94sm875084566b.35.2025.09.03.00.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 00:58:33 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 3 Sep 2025 10:00:29 +0200
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrea della Porta <andrea.porta@suse.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	florian.fainelli@broadcom.com, wahrenst@gmx.net,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, iivanov@suse.de, svarbanov@suse.de,
	mbrugger@suse.com, Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
Subject: Re: [PATCH v4 0/3] Add pin control driver for BCM2712 SoC
Message-ID: <aLf1nc20SRkWJW51@apocalypse>
References: <cover.1756372805.git.andrea.porta@suse.com>
 <CACRpkdb8fFvgyWPAaP6AumwHUYhnvc7BXX0V5kwO4sts6zSGUA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdb8fFvgyWPAaP6AumwHUYhnvc7BXX0V5kwO4sts6zSGUA@mail.gmail.com>

Hi Linus,

On 08:58 Wed 03 Sep     , Linus Walleij wrote:
> On Thu, Aug 28, 2025 at 2:45 PM Andrea della Porta
> <andrea.porta@suse.com> wrote:
> 
> > The following patches add a pin control driver for the BCM2712 SoC.
> 
> I have merged the prerequisites providing .function_is_gpio(),
> do you want to do any last minute changes or shall I just apply
> the v4 version and fix up anything minor in the process?

No further changes from my side, please go ahead with V4.

Many thanks,
Andrea

> 
> Yours,
> Linus Walleij

