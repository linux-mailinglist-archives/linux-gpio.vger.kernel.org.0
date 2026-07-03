Return-Path: <linux-gpio+bounces-39398-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +BVfGCGAR2qZZgAAu9opvQ
	(envelope-from <linux-gpio+bounces-39398-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 11:25:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 038DF7009C4
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 11:25:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=aPcAUNVY;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39398-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39398-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CE280301D79C
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2026 09:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 261B33B19C1;
	Fri,  3 Jul 2026 09:25:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EC63B14B5
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 09:25:00 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783070701; cv=pass; b=fUBl6WjKZEWezQso77JcrcFqhEGV7DcSVcOUy1903yfEWglUMgc9WvEVY8CdF9lNelv++wl2n2QOHAxXF5H6iKGf+N3XSER3tbUl09JtpWZ5oSEMXZN0ruQvYOmMxEufTQq/XaQtPntATSl+Nj9CCIF2K8uJQSHl57e/crqQpEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783070701; c=relaxed/simple;
	bh=iL/O2JBFDixzHK2hImzkuzO4vKJa7ZYkhrTq3scPlj4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ksrSOXPggmZS1XpCYBaIteIxDUrmNkXpIduQNvgtEGFZQD9AYT7SHZowze88B2l4+EZtUdobDRDdtZ+fBoWH/wnNi3ei/pXcAefPpKMaEASCTvBqONwrJ4Nk7upA3NmpHWu8vBKMbS/VW/HZGdxHWujfTgi2i72Ie2T0S69pSVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aPcAUNVY; arc=pass smtp.client-ip=209.85.221.48
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47640541585so226879f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jul 2026 02:25:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783070699; cv=none;
        d=google.com; s=arc-20260327;
        b=kKWafZ7IdNYO3e2pge6rdQbCEL6Bt06DKiWMDtUyi5Xfe68Ynwe9b04LmiZwQx0J7l
         wx7NCurAOpjwK8hAZf2OXkBb5+39rdLfhq+4BdIgwDM3cBqrpkzE+TDoBOCdkm+TEISh
         f7JBz5KRr+4LUS2+NwMRQmzLqZ9t+6h4PJmyZboCAYU1pQEZ45dlotpGqQwQTCWUPqOd
         AFgFwqiz5Qv3u5gb8lHjRQZju7UQU68/sVQvrM9llctlce4G2vdWFzDQf7X7TeT/wOpw
         QWHRsyRtFDcUyHTuctUI0m3pZIXUY+j5Kv/zviMtC9TqyWQGFvI+R7jdUdOaYkpjdeP4
         uwWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V6BVDWVkWo/QjGxRj12+OrTRvl8JM2liNp94DTh5iU4=;
        fh=O4JRNNkvYcp3WhZUFWUTc9FR9CysZ+zrgg3vRLU4T94=;
        b=VaYnqZtJqsAL0+exlhZrECCVxSaktSYqlgyxsP6oZI9tJUw3TUwqmaIFoxfEpfI2hA
         q1Qn+k4pvJzDe4e1/tomgJp2C+1pVDgvwdMI2rSXLAkqbJEXa9rjy+8tHWc31hLycbUd
         Ex7kdAvMysYW6PTWB1aEau942L4/v2PTUCIOVk+c/cHxlKpbsa17ZQ6Q7UfrC/UjQ5FG
         uFIKkwQmKATKIOS8+qs+jxcORhi//CI3PNx8aXOtl+nle3bdvAZi9dvYf+3+l3rsHbvJ
         hOlBYkugIDaOS8BTG1Q1qTRWXfZdNWFDUJyTmtg99Bzc8YEC+5QU74SNHquVzy5b5kNu
         NKwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783070699; x=1783675499; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V6BVDWVkWo/QjGxRj12+OrTRvl8JM2liNp94DTh5iU4=;
        b=aPcAUNVY42MgBggqZpNHAYK6Nq7iLxN6Pd3tYO/P6Owk9YogPlJHOsGQGLa18FnwYb
         9jVLvmV7usaD2pn6QXGjt5YphsdQ4tgmCDsKwBkH6aaTA/99GlUuBH1kL3KbD6nrrfly
         yftgrmpksSs12CXmeGlUuZ+Gi13XdadwoCswFw4C7AAltOgMzC6aNf68croiaylyrO9w
         9aRHlwsduuvHR/VDly0BbmJ3ZEUCSgnuT+SxPwtGG4zIPeY18IepFQlzcfmSDLqSVVaF
         04rHsmezH+mqkJJbun/cU6y+yyxToGhX6ZHrBRlK98yTWPqqT/ROtSZIRU46mwazFJHt
         pReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783070699; x=1783675499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V6BVDWVkWo/QjGxRj12+OrTRvl8JM2liNp94DTh5iU4=;
        b=YxNllFKOjvkLJCt3N15HbeBs1k+FtjgskOGqyJuhH9gSJvlwnG31mq2qQkloynp0nx
         tEMQSMg2RhWQNrwR67T89SC7V8SHFfdYozZNYSHIOIqiCn1t9uMk/QTZWlGIDC4yYnWW
         BDnhVEAAltE2fE2dlagwtSkUz0P/5fL1NAaOpxxK7IYUVtj5uL/hCzc0h4Yt0uDdP9wc
         gGsKXzbI/YfmRz6rEOEFeh/pDLLENvboMW4kjajT9bOHMA8F29SCIlcO4MpU4LO3JzM8
         GI5OpD5lbi80Blw883fES7jbbA0EAmJgOKRLKzeZDS2CJbyiW1hrQZZQ8Vq+jBuKJ0YH
         d3lg==
X-Forwarded-Encrypted: i=1; AHgh+Rpwz0UbgI/ebYraBDEsyJ3fGV3aK9onYzdf+PMcmIHqdwrq1yryfn/tLU/lg2WItQFU5GDAqow30Jq9@vger.kernel.org
X-Gm-Message-State: AOJu0YxKfuBlosuKeG6L7R/lEObY1/x+9nNPw8/KWO+sDiFLaQvS1XHo
	mX+TKtcGn1+jiCDpspl2SuEXOv8OELRwXBBApQ8zHhGUupFQ1kRRH0ZBuWwWcr8to+4YSJZOKIb
	QJylbkv7A1ykOG6o+VG5/OctSLMgRCmW8+JjG2qo=
X-Gm-Gg: AfdE7cnGswmKt/YZmFsWEJ0ZYpK+t5bkS55PlDqsVyJMM6ZhrJ/x7hMPcOZcoRg7US9
	/KWHkNJ3qRJXS8R6dnSEK1Dg+3YNSesyCN9vrERIbWisfiUobsjuQ1MGmA+QcZBHj57MUuFsE7T
	kxsNCsodvuQpcC1lx4HxvHCQe67S6anJcy6OGA8DZAoJgpSnpMXNVOhc18NNBSmR8YT6meMD2r/
	b3OUAHEfyrzBDcKaj5SKnOTTXGD07FvS2//qcNxoNq5rJEVmRaoV8uh/Dj5aYl7VzNaLGSIWyo=
X-Received: by 2002:a5d:5e8c:0:b0:46e:8226:96a8 with SMTP id
 ffacd0b85a97d-47757798292mr13806532f8f.17.1783070698621; Fri, 03 Jul 2026
 02:24:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702-upboard-pinctrl-add-upboard-intc1055-support-v3-0-e6bda3032914@gmail.com>
 <20260702-upboard-pinctrl-add-upboard-intc1055-support-v3-1-e6bda3032914@gmail.com>
 <akYnmNdvTXTffNbH@ashevche-desk.local>
In-Reply-To: <akYnmNdvTXTffNbH@ashevche-desk.local>
From: GaryWang <is0124@gmail.com>
Date: Fri, 3 Jul 2026 17:24:47 +0800
X-Gm-Features: AVVi8CcpYh_h6mBJSVBUw1QWBajnLqEblv8pl2eyLgn7XMHxrCP8clgHOD-Ec6o
Message-ID: <CANYHO6oPLkV_iSUco1Oy3gSdQ-x=EzJhiE-YyPD-kVzRBssZZg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] pinctrl: tigerlake: add some pin groups and
 functions for INTC1055
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Thomas Richard <thomas.richard@bootlin.com>, 
	Daniele Cleri <danielecleri@aaeon.eu>, JunYingLai <junyinglai@aaeon.com.tw>, 
	Louis Chen <louischen@aaeon.com.tw>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-39398-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:mika.westerberg@linux.intel.com,m:andy@kernel.org,m:linusw@kernel.org,m:thomas.richard@bootlin.com,m:danielecleri@aaeon.eu,m:junyinglai@aaeon.com.tw,m:louischen@aaeon.com.tw,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[is0124@gmail.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[is0124@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,intel.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 038DF7009C4

On Thu, Jul 2, 2026 at 4:55=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Thu, Jul 02, 2026 at 03:10:38PM +0800, GaryWang wrote:
> > Add i2c0, i2c1, pwm0, uart1, ssp2 pin groups & functions in tgllp_soc_d=
ata
> >  for device id INTC1055.
> > The pinctrl-upboard driver set the correct pin function corresponding t=
o
> >  these data.
>
> Please, fix the indentation and wrapping issues here. For example, you ca=
n
> use the following version.
>
> Add i2c0, i2c1, pwm0, uart1, ssp2 pin groups & functions in tgllp_soc_dat=
a
> for device id INTC1055. The pinctrl-upboard driver set the correct pin
> function corresponding to these data.

no problem.

>
> --
> With Best Regards,
> Andy Shevchenko
>
>

