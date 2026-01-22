Return-Path: <linux-gpio+bounces-30889-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFq6DwvpcWkONAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30889-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 10:08:27 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EE5643C9
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 10:08:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C6FB44EEF5E
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 09:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E464431B13B;
	Thu, 22 Jan 2026 09:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ISZ+dzYh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FEA40B6E8
	for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 09:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769072411; cv=pass; b=G+SO/7ix4yqmBG6P3LrqhECdkr1JABPDXsqx8+FuY7s4uK7dg6kqGn5UCIWtdtfi2HZROgogoRtOxBwk2pqIeteabXx/jLd561wMwFCgkCI/R6oUsCqrZB3iyr+0VXI2WPAUhpHglaaEzOtRkkcXKrMTIunShLMPN69qr60g4lM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769072411; c=relaxed/simple;
	bh=+gwAuL8FJyafsH6k369v/fD/X2nT+hweNgWMuxDRSuQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cbuliyd3alLCGwzHS4bEJ4D8Azd9/EhvbMZCjOPcH8pdPZfYAQekEBHDNPyaaSbzoBCSyKZyqj6u4pUTJpvBkKUhEWul1QcVLKBxsvAmv/KNBUzTCoQRGKzPIhbTcRvX7NF+wsClfrZHh/TSmydQZ4uyKdBRlK9Bjxv4WCa0W/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ISZ+dzYh; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1233b172f02so1099461c88.0
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 01:00:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769072408; cv=none;
        d=google.com; s=arc-20240605;
        b=ggYQ0UQnvDqzN7FGCboliiLlUXWDVb+sTb/TJaA/wUFWFWSjuUjOU2OB6ck0zkvzks
         tXjH/kz8oTn17Rold1/I88oASkckyNeiDFUnkZDyb76pi1jKiZ13m06i5lxPh0IdKjVC
         ugHFdZ+Gej8eRG82dfsouYvZqDS4ScweSdxQNVsKeEmPWVIeFDPKTPd5R5sw7yvsmMKj
         Oe0bJlgbbXMU8rIf9qtjEQivmOCWCNV3hVwm8/rJwPGFDzDix/7BhiT/t/d/rg2mo3Ps
         X2H1PN7yTvRigtSosbhMwcBqpMzXo90JP0XOGKXH8xlPGL3OzKQmKEWx99OU8lE8aLgp
         UUfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UcmmVLPN0Sojb3EmvyKfGFDHgv86UBzfVWtV3XhNOEg=;
        fh=Um0sxUmYf1rIqLf8coh0RlBNe65EtcIUbUT/viLjr88=;
        b=kXeYzHyhjEAY8GmZVPRok8cST5u7OTH/ynbpkYzNuL9L4+UIUnM/713hMuQQvIcvVD
         Xyk0OZVA5/qrAqdVSBMTkw7Ct1RSPwkBUvLyPDkaYBC8Dle0DtFPkqvNgmQ6tgCTZc7+
         uIzD7yoiSZJ24gil4JCi9wRDRtByQUhjpR8J3at86RDfQ56pq7Lto4j92uzS5ucUGE67
         Tri+S2wuU1IXTaKn5c8GvEbxTYpydED92RAp5Ov6IbdS8AKimSaclFipg7UWbNS+1kX8
         piXTdLg624lo+vTarQmg+2wlh1ZVeYVT+mJgVk3Rts1ZjS7QzDr6t0OFiHsPF/STuozY
         blCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769072408; x=1769677208; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UcmmVLPN0Sojb3EmvyKfGFDHgv86UBzfVWtV3XhNOEg=;
        b=ISZ+dzYhhhp7hh8emRyxR+iJ0W37kmY1ICyTA2C/+5cwWPUFYBbbRNudr7HiH59ERm
         0wucKjhg5WwYoucjyRa6KeZ+/qkGjzNx67fv8G/WdP0uQ4boDzcDgOvrvnFiPKK+vIJD
         8emqySwOnWAjj0DLLQcBjkwQQnzzyRaydLuJgH4gXiHxfHQEyA4PT8Dw3PYuvVln2E3B
         9opSMG7T5rBBAWgk8aS6NucCarjT88fWnSvAotgnUU+dCxEL0ho1TAH7NiJUaCOXsu9m
         tMU2GXvt5ufK4w7dqDIcexUTEqmGrIPQt3lOIHnzao1mTZoihYUGelHMEu+Xe8fNKVnC
         j9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769072408; x=1769677208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UcmmVLPN0Sojb3EmvyKfGFDHgv86UBzfVWtV3XhNOEg=;
        b=YsX/N/G8EyFoatwtP0xWoLgfl4Zfln4g4+kMBDQYiPhoR3+v6INlLKF/hRsJ1A650Q
         NdXGFS/bHTTqykPf+MsmQmUUcUJAgLt8lRzIgKAOV04O89zGYWxZIMUud2poCMHAXEHz
         uyNn3Ruc59rA1LMk4cCYLQCBV5Rc0M2cDQz/Su8UfZr2tADN7+eifHczn9kKIHTEY56D
         /JM4Ju5kKIXuzozq09mkga2yodDnkeH4MOOqxXqejRTSYV4kAy5IG0W9h/c84L1uAa5o
         VwfVsz+opyZf9A2LstP/l3h0u/RBEQQm1Db9f3QDeyXNYw2MZ6DLFHLvJndJkRP2XpHX
         9itg==
X-Forwarded-Encrypted: i=1; AJvYcCWoW9nOsva1seCYnXdlBHgWoLP3J2gAARXjLFJ2C37JgOfIULV5DJOX4Hl+yVXBZkAw8hzdiknSxGJf@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6aEU/aoE9jAw6v6xNEDMxSFKYReP1XJX3s2CId83flg9Sjdar
	/gT/ubWRPcpfVYe4Tn86PV1G4GhBVF389Kk7z3/4i/qwMPrOw6rMQ5cJ5gQLuDbcLHUh0WAq2gl
	SbqQHYGzPgh36OisBr1Wv7VDAab650is=
X-Gm-Gg: AZuq6aKoXv9QAw4N0rDFXYS5upQn8HJXxTK70ZG3QBuMsZUsIciHrrmSOI6vxyTKOms
	GfUUFIMYDG7GBfVkNSA9soB6kb1kC8yAub86TgSdXFRRt9P6AKGPTam2eSIYUIFodktbDJhOBkw
	Gg367g64PopegVAie7r3Lc91TYnZMAXcaFW0SS+Ew8+mmimaKY28iBtGoCgy3Y75Vw3BdN7R43O
	1wqiT7Jjqy5SvdoL5afsJ286N0iKK7+nrPIYak0jHUO5sCYFPJb4Q5kvKoG6jl25AJcYXGsu2LI
	AsqGBgJTXllFBchItJNR6gBA01vAF78hB46VhjsS99a9IQNh8t7dbNdiHvbXDHhl4LnK0kONp2y
	a5OGGmPo9r38uipdI4+U8
X-Received: by 2002:a05:7022:eb47:10b0:11b:a892:80a5 with SMTP id
 a92af1059eb24-1246a9683ddmr4799166c88.13.1769072408307; Thu, 22 Jan 2026
 01:00:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121142047.10887-1-shawnguo@kernel.org>
In-Reply-To: <20260121142047.10887-1-shawnguo@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 22 Jan 2026 11:02:47 +0200
X-Gm-Features: AZwV_QhQ7Di6OY00AIHWXVDVc4TW2QFRAihJ3KdJEN07TYFMxvmJku0VPJz7aJ0
Message-ID: <CAEnQRZD1Hzs=+4piUr9rUga7RqV9PSuB9ZFiMY+qLoRz_2-W=w@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Replace Shawn with Frank as i.MX platform maintainer
To: Shawn Guo <shawnguo@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>, kernel@pengutronix.de, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30889-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[arndb.de,pengutronix.de,gmail.com,kernel.org,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[danielbaluta@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,mail.gmail.com:mid,nxp.com:email,i.mx:url]
X-Rspamd-Queue-Id: 63EE5643C9
X-Rspamd-Action: no action

On Wed, Jan 21, 2026 at 4:33=E2=80=AFPM Shawn Guo <shawnguo@kernel.org> wro=
te:
>
> Shawn is no longer interested in maintaining i.MX platform, and would lik=
e
> to step down.  On the other hand, Frank seems to be the best successor
> for this role.
>
>  - He has been one of the most outstanding contributors to i.MX platform
>    in the recent years.
>
>  - He has been actively working as a co-maintainer reviewing i.MX
>    patches and keep the platform support in good shape.
>
>  - He works for NXP and could be the bridge and coordinator between
>    NXP internal developers and community contributors.
>
> Signed-off-by: Shawn Guo <shawnguo@kernel.org>

Thank you Shawn for all your help and guidance!
Good luck Frank with your new role!


Acked-by: Daniel Baluta <daniel.baluta@nxp.com>

