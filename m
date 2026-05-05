Return-Path: <linux-gpio+bounces-36223-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGELLwAI+mkEIgMAu9opvQ
	(envelope-from <linux-gpio+bounces-36223-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 17:08:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B52594CFF64
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 17:08:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DD89B303228F
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 15:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BEB6481666;
	Tue,  5 May 2026 15:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FQr/vKde"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D5F2356C6
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 15:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777993551; cv=pass; b=u1y3C4LPc74/err0mWCqGDPXA8Qoe9OBuuJUPa7HECP9Dzag5Jo9rOuCoHkIv3CZYRX/rJVz8Psen4KCRDkaWXSjst8mhWLjvRl5I35Svv1eaiwpHq3SMfbx9ufotjpkhEjCkxmWKT5zOQXMjwoakQMj/DoPL41YrYkad0bOqBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777993551; c=relaxed/simple;
	bh=IYCTUN6N1v/Re3k0GZcpxb3tCdf+rcqBepUL79mcPk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NUoln24vevrEyeXX4lI3iHKmTx+brsTME0+UIdeG7+fog9/HF8nnmXKpg+51YxY4BELoOg3kZEZLKUPktr12dr2HfoGvrz21g6+kmPWTE/0e1PjHsyC3qhtK7tmmBxq4+4ke9T6XrtnOGvhjIJwXB2geBDPgqkW2K08BI+vlAto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FQr/vKde; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-12ddbe104ccso5445377c88.0
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 08:05:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777993549; cv=none;
        d=google.com; s=arc-20240605;
        b=JIp2B4cuXhvMlotjCiGiSDm+VwlDMLNVEahU177LgLYtF4eBQJyBWH3ebQtMHmmjE+
         6dFr73yLAJI2Uv9lAt1gR+e3fRJGMnwLz+sEi8rcczAz2EOSP6odhQROeO8mK4M5x22+
         P7xh1hjvCqBkVCcbbC6JrLUbea7msbO2qv6KR2uHHJF/v8+1sB3PuMWf4d8/2oFnAhar
         rlEMVO8ZGij02qeNPuwenD4Qmeh3OejpBP2BF2lTPt5RifqoPdiGgdEzGl8MYz1tjvi/
         wOPNo+FWX80Lw6GrPG1QWruQoJUpvgagELH8Um463/oqPYqXcfzkDCHC3W9Ywtwndwi5
         uY3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b2MgpTXBuZF25ctiyAD+N5Wg0YAjEzCb7vJMKVNj3Rk=;
        fh=3digdet/jV3SUaBLpQM2Eyi4Ee8HMQrga4UztaEkogc=;
        b=BCeXDZ/IMdbtWo0XAQEXTtHlfBTIdiRXRosvWq50kABjiKT3vFb5LjkJujOcifULos
         RI1AgIosBI68X1Ojq2CosRvVvDNkhTrUZC4/7eMa83tXrUYOiIsWEujsp8U2YZONvaxI
         fmvoOVhFyQxxBSG+W9QURfzPcXiKeE58+YnyYTC+g9tZjGra/YJ+JmLFkEhqPEzQXoD6
         xDudg4/hzKnNotgSNVvvUCnVpjoHiuVy7geKk/hvTUUm4vyWLqLUdLPHq8koniW5O/WD
         cxD+yr1CoQdMvkMnBHGG97yrrf1G6t1VEfcBINlzxRS/slyKiuMypkdYO6MUAqvrObW5
         4NOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777993549; x=1778598349; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b2MgpTXBuZF25ctiyAD+N5Wg0YAjEzCb7vJMKVNj3Rk=;
        b=FQr/vKde08H4qGFMn/QlXNDIu8mXj5Ohpr6zwP8msGxYRnI9y6xLDJ6OfNKve9ATWV
         OrqcpVk3NQIW2VO/2hv67WVZgPdQnAXm2HIc0Ti/hr6e6QuNT1lzXuCmkmS0PdfQ7xvy
         YtxEzrBC4APNq6W/cG16GdxRAQL0Egr/YtWsihnuX31YKPtc5LbC8YqhFyHsGDF9C9pk
         XBiAhkZdxRaKXhMQlEmO+khu2PaXCR9JxzDW1J8DIbrOjzN79uwxxihowvOM44I7up+l
         CeWrytSh9VYkDhEK13uj+UF5XbYYWmkOQAXGrYbhSwWe8rdTNpJjcLdxolelYPjN7oh7
         hmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777993549; x=1778598349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b2MgpTXBuZF25ctiyAD+N5Wg0YAjEzCb7vJMKVNj3Rk=;
        b=n1MJPhAhkgzvcrC4Z96BUeFeLa0H9Qabk3nZ0q/3BwoZ7JSgV2HsViavJAqOdway7d
         eCzAQJTn0RaMkg8zV70O0dj6IJH50R2Perr6ibYFDE6ASj/YWQ9ZQ5UK9okOVEX+84ug
         auRPc3YDFAWHdFSAEW+IN05UtQeEOTs5jJ7XgmZhh22S8g44JmYTJS5tTIK51SC4lflC
         uLxkuLvPHSF9O7hqAL6Mm5wsu0gFZxEyKGXh5qi7iDjenVPc36HRNHxrJCtlTBunPuS9
         HMS+lglnLBn2dEkdtAfSClueyQWsvxhzrTD+zX9TqdEIe7L+F7Hvxamlw2Qk6JG7NaoC
         UxcQ==
X-Forwarded-Encrypted: i=1; AFNElJ/AhLGx7vG+TyfHj11B1lXXQcBFJ7scJTr6k3S5PQPWaTEukImdtsM0tly+RqNIPAlq7Xx4C1FQCa2E@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn20/iLbTWx+cXviXH71eNnoQnLGe5bTcO5kqmxrGk8ZeubYHs
	dJbGpDCATL5FEkwaflUR3WaTZrpTUrBCdDGySRLvmhmTZJvYfD7OvWDB8MqiILynRxW2Wy1yBQP
	Hx59pJcPvPhTzmmrn8ype4jnFKae59UOylVeQ
X-Gm-Gg: AeBDies40G2lPzmUa7AqTPpfqiIcKYZDH9vcikYSPbvNTjjzxRzUKUNYXOCn7EE6Ww7
	j350gAemURr5kdPVWyXPGyjkJF2prZFt+f0YKrCDFD/0dJqSu+DhQZH6IcZ1lrnhAluyrlCQbuJ
	IiwLwG3qxk3GWwHjong9TioBZQNorFs3b1qbGSUHRBZ/FF8K2M96vea0lgadP4JW1oTjSTyDmyd
	4mT1Qupjlffl3EzcoKVJNelWD0tDPoKPk5m1VJCk41SJWYZhce0lTYA789Ab+Voc46IFjChKH2y
	T7FuyznD4AM5Xwg=
X-Received: by 2002:a05:7022:4392:b0:128:cf5c:535a with SMTP id
 a92af1059eb24-130b1745e28mr2105880c88.11.1777993548712; Tue, 05 May 2026
 08:05:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAMcf8C_A9dJ_v4QRKtb9eGNOpJ7BZNOGsFP4i2WFOZxOVBPnQ@mail.gmail.com>
 <CAD++jLn9DpaknOm3S9ZUOY6Jyo=SuhVSv-vzNaw=S1uuOeYoRg@mail.gmail.com> <87lddyx7gg.ffs@tglx>
In-Reply-To: <87lddyx7gg.ffs@tglx>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 5 May 2026 17:05:36 +0200
X-Gm-Features: AVHnY4JlhLTIcdpmN-WHE3cN8RTdtvtnb-OvXooIF78B0lkoPX3xT5_W06bYaDw
Message-ID: <CAMhs-H_FnFGg1LDM2UWCUWC423udcm0dKOaDYJxMae2JdQh5wg@mail.gmail.com>
Subject: Re: gpio-mt7621 unroutable IRQs to bank0
To: Thomas Gleixner <tglx@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Vicente Bergas <vicencb@gmail.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Grant Likely <grant.likely@secretlab.ca>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: B52594CFF64
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36223-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,secretlab.ca,linutronix.de,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sergioparacuellos@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]

Hi,

On Tue, May 5, 2026 at 4:21=E2=80=AFPM Thomas Gleixner <tglx@kernel.org> wr=
ote:
>
> On Tue, May 05 2026 at 14:01, Linus Walleij wrote:
> > On Sat, May 2, 2026 at 11:52=E2=80=AFPM Vicente Bergas <vicencb@gmail.c=
om> wrote:
> >> As a way to prove that this is indeed the problem,
> >> the following workaround makes it work.
> >> It just inverts the sorting order of all matches,
> >> so it picks Bank0 instead of Bank2.
> >
> > That's a tricksy bug, I can't exactly see where the issue
> > is.
> >
> > I think to solve this you might need to allocate an external
> > irqdomain that deal with the three different gpiochip
> > instances when translating the irqs.
>
> struct gpio_chip has this:
>
>         /**
>          * @of_node_instance_match:
>          *
>          * Determine if a chip is the right instance. Must be implemented=
 by
>          * any driver using more than one gpio_chip per device tree node.
>          * Returns true if gc is the instance indicated by i (which is th=
e
>          * first cell in the phandles for GPIO lines and gpio-ranges).
>          */
>         bool (*of_node_instance_match)(struct gpio_chip *gc, unsigned int=
 i);
>
> That driver falls in the category and lacks that callback, no?
>
> Thanks,
>
>         tglx

The IP core used inside these SoCs has 3 banks of 32 GPIOs each but
there is only one device tree node because the registers of all the
banks are interwoven inside one single IO range. Thus, the driver
internally sets up a gpio controller instance per bank. The driver
lacks of_node_instance_match callback but I am not sure if it needs to
be implemented in this particular case since the driver is using
of_xlate callback for this.

Thanks,
    Sergio Paracuellos

