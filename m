Return-Path: <linux-gpio+bounces-32585-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBRDEut/qWkd9gAAu9opvQ
	(envelope-from <linux-gpio+bounces-32585-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 14:06:51 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DF18021262C
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 14:06:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3042830ADB96
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Mar 2026 13:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6CF73A0EA5;
	Thu,  5 Mar 2026 13:01:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD6F39659E
	for <linux-gpio@vger.kernel.org>; Thu,  5 Mar 2026 13:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772715713; cv=none; b=nzHBCiTiI9H6n9NCkJQLzCtmjK5XERmVQEsL7Fu2AjJQMekIStS+1LKFTenNTYAku75fw+/Svs05Gq6jXPKSO12nSC/GJiSrtR2rnFZAKEcQoBspoPzDWLHM5Sk4OT1dTXjJO9SWWgvcnpT9xkXnJcTc9hT+etBfTkW6kSPwW9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772715713; c=relaxed/simple;
	bh=mzxuHFEBJ8rIbeR5gmZexUBLMULkEpRVqRmwwCFyU/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SdXfxmNg5b3UesVlPAvwn18zFUYQ5l1HPFeEbB/eCEkZYWA92Hu7BemczR8n1KQ/AUGevbJuVRyeqLHoPG/Pxa8VPEy9J3JqIgNj7SI41QpXWn4eWryIGhp7MBxsdycUQv5jwI8gFBJv5yQahqShyxs1WCoyUC/+D3VENxCV8ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2aaf43014d0so59794035ad.2
        for <linux-gpio@vger.kernel.org>; Thu, 05 Mar 2026 05:01:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772715712; x=1773320512;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7IxpxVkGnClS/pzWnTPcTEx+bl+pPZR21vGpLksfVXc=;
        b=QHsX9Dexma4/HxD7sgtuCz48x6yPZz7AAnrJ51z1lPayt6H8jBhNHUtgTuzyP4UJ6U
         /onfNFN0CIEb2IvVJkn9ZuleTCy3k+wF1Sl5/+HJy7hkWElJHtXZk+aRkDW5P8syRLuq
         vpxe/s3eZvhlrBCk5VaqYC8oX4n6gSVVit9OJiod8VBTpWy3gFE9AqAt6h3xCRZIrHJX
         Le2sOII0drI/F/tHy5FZiVEVcKyBcNv6yDLI0jytQMDSxxIuAAKiX75z1aktM0RfppJx
         iqsr1dgv0nRZw0x+gEBcPQ33LpNf6dNkZn02lbEHNcJ7kxgv8DY5khEsTCsDdRRvOKy3
         RifQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6xXRKWhjFQa+lF1ymrTJJO/bFg8QTmwr1IU+6/I2fDpGA89YYsrJupAtn1k/ZmpoQZdwyWYXvCpe2@vger.kernel.org
X-Gm-Message-State: AOJu0YyYgzKv5BJNNtsD6CVYWY+IquGUlxgbklsYF058CpaGu6eHRxli
	AGX8YqyFP04UBvsBK20b4Tb7mSXr/eFqFs/YbsYKcZQazQ+TZTtw6k1Z
X-Gm-Gg: ATEYQzzP3PIoZbiuM6io7iuRCnm6orQVj69eYuA0YVbM63YOyEZrIziAOu5es5qESZP
	ZYbDKE96Ic/FkswwGXHhwR/6D3oyHNt2hQwuEebg8wHqoBdfY30KC0HhpW65KwuhQ597hznEQ30
	WYDcocherz/TZWdUXud89aaEtvCt5pNx0+TDoXJj/CO+8UzdiK+VxiJVXoZSMR3qzrrU6/YBdPU
	fzZwW6/A6d2G2IQpUuGaA2Uy0LItwgrGnXu8V3BXnSyQ7GwN+39EtP6p4XvtI/EUDNQ+hhKhoIu
	PgGW9E/oR2q0tCY32YLdmEMwrVPBkDRpwygt/sOG7pJcI7+loZGGHaNaH03cdioaEAGEH5MM/7O
	uS9JpFTJJGVXczQdGeD6q85b3XNqKkxt8F4ZHFLZgFMsy1S59jmUslHuYTVbBN7eR9pIgDyWg5x
	WBR9H0HmvJtw92fBiqrDizalVNweqD4/xIj9mcL7wVlyfw62EZKpbz0dcrGuIWegfyYbQucMhzC
	rcM8LTMBC/nUYXJT2WJG0uctJDoZp4ajkyIqTzlWOwI+z3QSLKTaIThAHjvCQ==
X-Received: by 2002:a17:902:ce03:b0:2ae:5b52:3818 with SMTP id d9443c01a7336-2ae6a9deb2amr60551085ad.8.1772715711782;
        Thu, 05 Mar 2026 05:01:51 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae54136b28sm115696425ad.73.2026.03.05.05.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 05:01:50 -0800 (PST)
Date: Thu, 5 Mar 2026 22:01:49 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>,
	Joe Perches <joe@perches.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
	netdev@vger.kernel.org, spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
Message-ID: <20260305130149.GA1659133@rocinante>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
 <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
 <20260305085148.7cwo3yflp7vcfldf@skbuf>
 <f3a5aa3df78553ffc0fd0024f5fd36a4e2158c88.camel@perches.com>
 <20260305114352.2f7btqixg4tu5bzl@skbuf>
 <20260305121532.GA1649635@rocinante>
 <20260305122957.GA1652563@rocinante>
 <20260305123956.ojkt4k3ly64xz7fu@skbuf>
 <aal6kWDx_3XRGB4K@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aal6kWDx_3XRGB4K@shell.armlinux.org.uk>
X-Rspamd-Queue-Id: DF18021262C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.86 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linux.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32585-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kw@linux.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-gpio];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hello,

> > > For content match, it could also be:
> > > 
> > >   K:    phy
> > > 
> > > I believe this would match everything of interest?
> > 
> > Yeah, and way more. Think USB PHY, network PHY, etc. Don't want to drown
> > the linux-phy mailing list in unrelated patches, either.
> 
> Also phylink, any memory management / DMA stuff that happens to mention
> "physical", and probably numerous other examples.

Makes sense!  Sorry for the commotion here, then. :)

	Krzysztof

