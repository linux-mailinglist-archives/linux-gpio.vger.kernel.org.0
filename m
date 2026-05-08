Return-Path: <linux-gpio+bounces-36475-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 1u2CJZcH/mlhmQAAu9opvQ
	(envelope-from <linux-gpio+bounces-36475-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 17:56:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F944F90EE
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 17:56:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AC2223017045
	for <lists+linux-gpio@lfdr.de>; Fri,  8 May 2026 15:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0735B312803;
	Fri,  8 May 2026 15:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="r+qYdjAF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417A930E847
	for <linux-gpio@vger.kernel.org>; Fri,  8 May 2026 15:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778255700; cv=none; b=VqlNKQ6NwrvIt9HpAauWnj0IAOWRobBdEL7u057zjrAlWsS4SRQAKaiYgKJRPGRKh+LQBq0lzz9SP2Gfit6IlWENxbBohI3Zv69g3i5Sw8IaGk857B1D1XcmdvMDUojdZWQmyONsSkMlA6oaUMxpfXllfJYFtiTDPDPhetHYFvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778255700; c=relaxed/simple;
	bh=beGQbSohbqovdwuat6nKIVAFYzmFCR8PUrxcs94i44o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FGN25t4IyuBt2EZPlspRBfZk3/+FgBmH145ixqwfUC74hoeNEBqcFwrIuNY/ALIURlW4nI3zw1xLRTYg1uDyR/wF/OjDUPe901BLoC9t+oeGDhXvFGxJzmblPorT8HM7MvPnqYPFjipgwW1HR2hkt5yPmCADGBb7Kmzodvm38DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=r+qYdjAF; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d73352cf2so1754372f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 08 May 2026 08:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778255698; x=1778860498; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=beGQbSohbqovdwuat6nKIVAFYzmFCR8PUrxcs94i44o=;
        b=r+qYdjAFZkJSnq1CvRGaZ/LI0eK8QVoWEZ9b1iPl9bQ4fUagPkJ5pED9ioSpKvlsoO
         DrvL7Bh6e3tvTGaMBZXU0PYwKOPjbw7Sxw8y8vdeE77aWvjecDLGUuyegp7slaeFmOFc
         m8b3MlNirSpcUJr7Z89UYmFHcLpaWwjHk3JoHle6AcfeIevgB9PUjiGrTg/M1Lqj8hxx
         PjZvZhERjKUMRpg7w0l/re/UGKYWkC3uMKgNovGFMng5MGmX24mwGtoGrEHnwpwLAyrb
         /RbxexjnFUp6MOGJNDbI6hH+pNv1l2PtOczm5KPhE+ZYhNqqtd0WXLpNUXVKFjvbIaXe
         H2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778255698; x=1778860498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=beGQbSohbqovdwuat6nKIVAFYzmFCR8PUrxcs94i44o=;
        b=gzkXR7+qO3I/ZmWNXMShN88Zq2qsy1SY72vzQ2sK6DbSvTREjOqHid0URuyCSauzQM
         o47m+zEjr67xyRuuTBeg4L6AEoYWgOmuHttkfSnevLygL/w2omNgwMXdXqOAhQrobS3e
         4agp1TwdGHSGwD/X9EK5fastmHNxBDQj4SZNv7rX1QGvHfKtJW3gtlQ7YdQ/s5NnAtMP
         wRunvhAXZuh8AsyvGrZurcm35b56DaCOuFYKHiPHjvzU7y2XMOZ8ONpGOJtT0aG6U2bc
         B2cMqgdptsBP4Ykhr/Zw7gVls+2mOYqSFEhz1fewEeT12x/iuamaNPe0aFR5KeltRMgf
         S6zQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ZzRgPCtRlqyLbdG1ReW/2D7FFTLJn/k8RNO0GHplcjJPQOWlEE+vX+4j893tjEVgeq7rBROB9OXDX@vger.kernel.org
X-Gm-Message-State: AOJu0Yydueqb2jZaQtqGBcetyYFcGIYhHgl2YUJJqII9qv75xVAVdY0+
	SOnHo00x2LWpBpVFLIoGKwgNJp1pE2EGnjbJxNqcCRer9Ja4pDRb6xQjZfkftJplAI4=
X-Gm-Gg: Acq92OGplEuFsgoH77sXArCr9FBaKDPj1FNCRffe+BVS38Ko/CLc2odUS1r9CgzGxDO
	ecq+vR/2b00EwCMPbonwCSeVKCRkveKCHl+EawxNip7e06+UpmJXKZLsVc64ZeNmvk49NWrOSgM
	wCixgzNeuV98FmXq8UqPtDZWl9xw8fLa/katsLl4oXJMxTkZumLCS6RMq3/iVvYdbvlo0bToCpq
	H7ZsMc9ehHCBJJU5ZoraNzuDs0bSoFsUjj7oPOVRL5L15e15P2lKk0i1JF3c2RR03vg/f/Irzvy
	AipZAbCsCAwR6iz4MHDr+n0Ok5s5m2KOa1O2zdQALL+BdPxtbOCD3paG/JimYMJxWRhKwuGMb4n
	yq/BV0JLEIT0Mj7i7cuNrLeI6Uafsf+ou91fIGOCKT/DRuQgMa5pZ/m8HOksXTOMZlo2tIqTD8d
	aMRH8HtvSrTerSsrh+ImCcpNfRkhyafaTbOETrhRDBLi01yXjAInfvT0JGCTIri79vhieSHWAv8
	+p6KgkGQXb3w8LvNwR6ApZnztJKYCzt3DGQn2VIkjyQ+GFuDq8QScywy9DH7v2A5LoNBvjNSrdd
	WB+kWgeG
X-Received: by 2002:a05:6000:22c4:b0:43d:1c21:ead5 with SMTP id ffacd0b85a97d-4515ce1c6bcmr21753628f8f.22.1778255697345;
        Fri, 08 May 2026 08:54:57 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548eb75c29sm5680163f8f.9.2026.05.08.08.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 08:54:56 -0700 (PDT)
Date: Fri, 8 May 2026 16:54:54 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alex Elder <elder@riscstar.com>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk, andersson@kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org,
	arnd@arndb.de, gregkh@linuxfoundation.org,
	mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com,
	alexandre.torgue@foss.st.com, ast@kernel.org,
	boon.khai.ng@altera.com, chenchuangyu@xiaomi.com,
	chenhuacai@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
	hkallweit1@gmail.com, inochiama@gmail.com, john.fastabend@gmail.com,
	julianbraha@gmail.com, livelycarpet87@gmail.com,
	matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
	prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
	rohan.g.thomas@altera.com, sdf@fomichev.me,
	siyanteng@cqsoftware.com.cn, weishangjuan@eswincomputing.com,
	wens@kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 10/12] net: stmmac: tc956x: add TC956x/QPS615
 support
Message-ID: <af4HTg5P3j0GsNvt@aspen.lan>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-11-elder@riscstar.com>
 <2ce5897d-5bbb-486a-b0f0-0e30e54b451a@lunn.ch>
 <afy34kj2hPxIlArO@aspen.lan>
 <ef6df85f-11ac-404d-958a-8cf69b3b6bb6@lunn.ch>
 <af3IKKkjl0jK8GGB@aspen.lan>
 <f15e2fe2-88c9-409d-b953-cdc94aee4e16@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f15e2fe2-88c9-409d-b953-cdc94aee4e16@lunn.ch>
X-Rspamd-Queue-Id: 10F944F90EE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[riscstar.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-36475-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@riscstar.com,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar-com.20251104.gappssmtp.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,aspen.lan:mid]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 03:34:42PM +0200, Andrew Lunn wrote:
> > BTW if you are bothered by SP_SEL_SGMII_2500M, that name comes directly
> > from the TRM and I'd prefer to keep it if I can. The enumerated value
> > we have to write into the SP_SEL for 2500base-X is "SGMII 2500M".
>
> We try to avoid anything to do with SGMII and 2500 because it is
> technically wrong. Cisco never defined SGMII for 2500, it is something
> silicon vendors have made up, without any foundation in any
> standardisation. We much prefer to refer to it as 2500BaseX with
> broken signalling, which is a much more accurate description.
>
> The TRM is also not a public document. If it was, i could see some
> value in keeping with the naming, but since ~0 developers have the
> document, this is less useful.

This is a pretty obscure register buried on some of the TC956x glue
logic (e.g. it's not part of the DWMAC's register set). I take the view
that if someone is debugging the hardware interactions deeply enough to
care what this is called then the odds of them having access to the TRM
are actually pretty good.

However having a different name would be only a minor irritant to the
poor soul trying to debug the thing! I'll rename to SP_SEL_2500BASEX
in the next rev of the patchset.


Daniel.

