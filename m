Return-Path: <linux-gpio+bounces-15188-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBC1A25145
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 03:42:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12B73162D61
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 02:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 695B428E0F;
	Mon,  3 Feb 2025 02:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="SuisEVK9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B3F156CA
	for <linux-gpio@vger.kernel.org>; Mon,  3 Feb 2025 02:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738550520; cv=none; b=ErFrUhdw8hKAcah25Hzw4Fk2ycFTylBw2H7xPpBT1BR5u/fjWDRDcL57zsJg4CBThneRJ2kXYFcDevtQJHy49LluFFmey8WUL2rgbigzmEmcZQCSmIGTL02O7dAe65RcVo9fZICCUduzukjtDssd4rFNG/o6Vdb1fpry+sEj3mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738550520; c=relaxed/simple;
	bh=qzCf6w0kWR1848H5E9nYadnxcuCIu+NDN2mKGbf5Y+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T80hjjWpnrrzBC1hATCniKnCK0jv1PVw6a87Dc2qEwkxjVAdEhO9qMVpKl1FyJXElybJzkLWuZ7GYkuMOHvHX/JkSwS3E1QqYa7S5raWkIbwDnUyI8n/Xh/ChsNkmkh338MWFoZ0RPPY3dP1QvfFY5sS9YWCwQqrE5i1pgOjRkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=SuisEVK9; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EFBF83F2B8
	for <linux-gpio@vger.kernel.org>; Mon,  3 Feb 2025 02:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738550508;
	bh=xZvdSBE+LgaOYmmFBhKsCXeW+YkHJkSKnanfbLe89eo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=SuisEVK98z0yD2f47s+sMlopW77h0oIdkmdj7k1Uh1+nwZsR/C/cDOA3mfZwQvggq
	 pzR7IEt2F0387FEK8Y/hKUKkz9srm3IxZuoAwPGNqADS7pSkNO69N6zJD7W8LWaDXN
	 SBK/rtTAXfKr8FLR+6Yd4qDAS8Dtstz8ORv93sXy+pCgHwa18CJ4i80lG5q5JYnvdX
	 YQv+3pn0PWLiHt+zt4/UgSxGR24dLovc0BYv+ZtoLMPtYeiwO/TiDmui9qy/5N977n
	 EOmYB2SbSTIUADwnw+Nx9XRUN7tRJcAWONoMHArBLxyDhs3o+1/MFia7Qt8dR1NMFS
	 9Q4BSNIV4vrwQ==
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2f83e54432dso11244932a91.2
        for <linux-gpio@vger.kernel.org>; Sun, 02 Feb 2025 18:41:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738550507; x=1739155307;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xZvdSBE+LgaOYmmFBhKsCXeW+YkHJkSKnanfbLe89eo=;
        b=ctP54Wp8MrHuU0aGjJbcTYeJ6ktoipa+37ht5vtMhtgn9elWs7NxgjlmEGiIEMjijq
         kBe+a0BEPev3FYMUfT0MjB+tnvOHStVCZEsZyriyezdfMy+CP3GEpsseq5S0nUISHtiF
         uvjTPGd5+zEZWxtMGkCFWA97xV/tC6hRnbEQc3cAWAo12rgNWumk2BoMpc+MC0oLy0Ie
         QiIo45bvUBCL/z9jfL5ALRXHs6H+aI8FlLej7GmXJlSdyB9mABXbei4bxmbB95JmTyvQ
         XevfoUDPZhkLdu8kT4uMgybqZA4sbHNJpZpBXoNkMNaUnoK6MM/E0hsCDKMN7nRLz3LZ
         P8iw==
X-Gm-Message-State: AOJu0YwMBeMTvbtPtJCiEmsq7dYJ3P9OgmM6QKyeiZNO8Hh+XrAmXT4Y
	tLSu/JMI/3xVi4sti6yMJXpSd+vP3mTFDxvVDtdaXpla7uSu/77fAdFhVd4fk5hHQVlN7C3Qd6u
	bAlVdCIxKLi0ZG1pLkITI0VKlc6cIDf/Sv930DFdCucbFv07WB0AUlsp2e8msfHDG/W0uywRgws
	M=
X-Gm-Gg: ASbGncuZx4TumV0zINETS6d+cWQMbdJQTwfFHFU6iTQvjJozuyn03dHifXXYK1c8eOp
	Zqmor2vGsIw0zeoK/izTxvj+Hgn8bPnaT/tfH5Ago+AqZ3Z7Iy4aPHVILmuY/kZnuoJ85ejOJr1
	NcgHkWRGcpza3SpMHTRlOUy0mJhPl0JBdpPaJ3NdVqWVT4CDMe8A/bCtSXSVyhnDvbInXWfhyIZ
	qPlqN3WtLR9MOKtO1ELAVMjNPGKJGa6mz66yUS4tUrUClWJMmkvXA/+a3/Rfp/uW/Dz7wVmZLkW
	d7pjwA==
X-Received: by 2002:a17:90b:288c:b0:2f4:432d:250d with SMTP id 98e67ed59e1d1-2f83ac17f80mr28520528a91.21.1738550507049;
        Sun, 02 Feb 2025 18:41:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6i84l0H8/NyTIQEDPCj+dTbpJBMzycl508u2oFUGlYYYue6YCfB1i+fgYjqkSujkuoyg7OA==
X-Received: by 2002:a17:90b:288c:b0:2f4:432d:250d with SMTP id 98e67ed59e1d1-2f83ac17f80mr28520510a91.21.1738550506665;
        Sun, 02 Feb 2025 18:41:46 -0800 (PST)
Received: from localhost ([240f:74:7be:1:33e1:5e62:5b35:92b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de330025esm65084985ad.166.2025.02.02.18.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 18:41:46 -0800 (PST)
Date: Mon, 3 Feb 2025 11:41:43 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] Introduce configfs-based interface for
 gpio-aggregator
Message-ID: <vscpr2piax6vgbrkbrfi5iboszymcuotflqjnk2jufannsgmvn@s6dyfs4ftbk3>
References: <20250129155525.663780-1-koichiro.den@canonical.com>
 <CAMRc=Mdim2aSBs+JsL8dECfG0Vvrvcq6CHaGHbBoVhNhSZn9Kg@mail.gmail.com>
 <2kz6mz6nglozgrwudkgziles4wievwfkkl2oo7qyvosirchjuw@y3wfna5dsekv>
 <CAMRc=Mc3qBXaATpYRAXeHne0+mBjErivjvUe4rBEj2ksansatQ@mail.gmail.com>
 <CAMRc=Mc5WWNErJfEQ4sFRQm_+vDRMa7KBKSPSnP3W8scu4G19A@mail.gmail.com>
 <rhdrieapetwdr3z7roguf5nex3esazhygjbjx4zklkrjzqrlsv@6vc5zmk3il5e>
 <CAMRc=MeRBABW6JCScGvsRR_4+W6u5QMWJwA7yMB9gj7=uOeD0g@mail.gmail.com>
 <xrllvn5tmshdbb2mjlxvoc4rpalnefy52wwd5p6s55ehhysl4l@k4w42cd7hxkn>
 <CAMRc=Mf6FZgTNBGUSsm3H2nSBLbp+DpamzbZiHZ67Xc62F3QnQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mf6FZgTNBGUSsm3H2nSBLbp+DpamzbZiHZ67Xc62F3QnQ@mail.gmail.com>

On Sat, Feb 01, 2025 at 05:10:07PM GMT, Bartosz Golaszewski wrote:
> On Sat, Feb 1, 2025 at 1:26 PM Koichiro Den <koichiro.den@canonical.com> wrote:
> >
> > On Fri, Jan 31, 2025 at 06:22:50PM GMT, Bartosz Golaszewski wrote:
> > >
> > > I too think a-1 is the best option. However, I'd go for line0, line1
> > > etc. convention as for computers it doesn't make any difference while
> > > for humans it's more readable.
> >
> > Thank you for the comments. I’ll address your feedbacks and send "v2"
> > later, Since we seem to agree on the overall approach, I’ll send it as
> > [PATCH v1] (i.e., without the "RFC").
> >
> 
> No, please don't. It'll be confusing. The RFC WAS the v1. Next
> iteration must be v2 with a changelog.

Ok, I'll send it as v2. Thanks!

-Koichiro

> 
> Bartosz

