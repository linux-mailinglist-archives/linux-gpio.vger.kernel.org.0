Return-Path: <linux-gpio+bounces-38448-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ulONIFijL2p1DwUAu9opvQ
	(envelope-from <linux-gpio+bounces-38448-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 09:01:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF83684013
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 09:01:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="B4a/Uwg+";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38448-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38448-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7E2D930028EF
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 07:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80CE730F533;
	Mon, 15 Jun 2026 07:01:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096C73043DB
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 07:01:37 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781506899; cv=pass; b=eXE81b/H5NxCuIFi5kt34kqQBeCg8TQjgPHEZzD9aXi1/0kmiB58SCWx8+/JPtHWCaYQN8KXvMpdeda9lXJInlRYvMQXloAdEXTGm07qSQCeD46TVcMI+TeyZuVjytYSp4eTG+HP6uFh9TQFjy8MOvnmiO9tESfEXvuo4hofBZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781506899; c=relaxed/simple;
	bh=ps5h9IyJxmUkFJHOsfWNca+bbLm+2u0U9Mc/hLFrEQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AHIoqgmiTJ+Of/qPLlLw1PQ44VE5yLLnV3oFdNpYcxuinPg/iXJkc2O6BGp8Yng+5MkIf1ZbffpwrCNoXGcAC8Ad0b7s2IaN+dA9ZvZdbtgPksXSwz9JkDu8kkYYZeI/Xj18JdoJewVOOxOb4c6PmYvYK1YJKhtJdiB3YqEN+LM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B4a/Uwg+; arc=pass smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490acbb0f89so18757255e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 00:01:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781506896; cv=none;
        d=google.com; s=arc-20240605;
        b=PGb3NrwEp8d/eybQdNYSYb3PzItf30XTP2zlFatVFmauo3D87OY/J6T02ekpwk+GaT
         9Oc85Ic9Fhp0cutmTmNru78KCK+PJTDpwDq9YZEjNmpW0MUpVpzE2OfJXMHkovyqwEoD
         DymzP4E1FF1rqan2R0nm37VDq6YRzydzpVBfAVs5erYknHx6EU/ou3EyujCwPUbz+9FH
         wyQTGSmhEBeOorUP/W9hCs4uxzgIsPEop1/48ue5wy0wrrG9W9iezNsfyzRatfQ0PgXE
         lgUVS2EBXJovdhNrxbHTAeQinC39VWm6L12Ctw7YSO8QFRzPCD1+cPgzaPCN8NutS/q/
         mnXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NAiASz9K4UVLFWzUu0MAbTqlPvUnCzwvrah4mPqPve4=;
        fh=qx1hQNpSukrF3LlgPC1VPlnZkVZTi6PFaRwIxhedrIk=;
        b=NwtheGeQ5V21dMspJnaBP1c4Yh8HB5C+FeuPAWFy8aGueVg31Kjin88o7Hix4XOj3e
         1hFTijLtfkY6Bh/L6DJKOX01UPr7Oj/ZHh6xPhCeG7Svf3yob/eRElz6hH3gcPJeoUsG
         En6kArUedTrHPdPMe9Vqae3HSnfY568Xmb7GlDcvw5nkUBQ+yBfvvKGispLElm6FRMsc
         rE56wXZa3uqiFp+jckHURFYbeYouXhmoYWzz15Oszbt5swfX9NBGQSC+4SUTU9IyJyh4
         8RECXm4+QsTve1QuJRZ4+oGYFiabVoF9raG6QeiFGFWGp3FxuP8+LMzssi3uHlHIxu/Y
         rC0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781506896; x=1782111696; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NAiASz9K4UVLFWzUu0MAbTqlPvUnCzwvrah4mPqPve4=;
        b=B4a/Uwg+ogWuUOHf7GjwUSqKQL71FJECvGs7At6Bvhz7blJGNPekOAciKK/YTB3HST
         Y+i2eX4oFQ3HyiA77XrQSAk+gKH42zxABTiLU9nueSLLaxb0aMhuXVLk6uhoIhfelDCx
         J/yA5EXTpGI3t+zzYHFaoFxzOz2rLDQC2iLzo18yZge3FTJPbK029+qRZTlIM6UHg9c8
         CjhZqkXE+vzUAXdOTB8YHeak0zE6KMPbD/hF5mchvRDlQqdsWtubcnGAnmCE1gHmev5g
         EJ7/6m63NKSArw8d+S2GDvpamhqEdNR8059hu5KWc9gr/CUxxy6zCb/xfVCNvLx4AOD5
         rjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781506896; x=1782111696;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NAiASz9K4UVLFWzUu0MAbTqlPvUnCzwvrah4mPqPve4=;
        b=ZMLsxOAzhUWi9DOHV1Uudw9Td5b6PphPeBY6MbEckQj47rrVnV0+IQikMYBvNbACAg
         KHwdcwNNdztCPeZqnmdAZUrUqRDL2X7FGZqjy0AcP6mp5EQVaNcFLoui0ITX1lZOUV7f
         VcECNl4qBlcO5cOaNTDRiVXm0wL5CR8E0JeEaNhnIPyBKhfC3n07K55o69fPMhNpAy7C
         LFpb9Jx2FzuhjoM1DoaWRYAF/qjWslU8SqLzZI2OMv1l49gsGFwN6V7J3J0Xxiam3ncX
         aRqtMHNUB0lJRS2eyj+s0z1tr501ygSuvvFHaIdvofcm8996nCTS6dOoJL8J7iU3nxsb
         PgAQ==
X-Forwarded-Encrypted: i=1; AFNElJ8OZ+Gfw/VBUlD94ZQTbZ3n4Zp6fVWc9KwoXmAwhKOjn7NtapNdh9ZqvA6ibbIQn41TLKCOIAjjnlo/@vger.kernel.org
X-Gm-Message-State: AOJu0YzjpQk0DOTu5G4OF6RMXdQIHzV/UoSz2vWZ/8TTzoOL5ZCBV6f1
	4MSeoscyxQJh4d7mlFf948e9lsYKAca49rIDKAEA7S5TbMimIIrS+Bqp+D4X7iYC29USubjXcJp
	+inKIC1BzSuIHpH8K1NoWk/1CHEDKUrU=
X-Gm-Gg: Acq92OErYNBWd2HcF5h/SDpMNi1m3sEnWDE6HyjQfeNkybcsMUmggXirNR0o2vCJPNE
	jgk5M2QYgDSPZk9Bb92J+dfSp1rtvUMp7f686G6aifQHIE4D/BAqEVUEUqLENjjyQ372zDkTRNm
	evuNEZ5OegcZ/+mOip5Gn2sCNJQ4OVsBM46FO4nebuVjLNJc8OYR43TYpatRjVKFDmHRyLPPt2A
	cS76xBEfjJ2U7f/IH6feP/F70L0LL3wdTuXpWKSqOln0TGowIEgC6Y0e4Evlay48O5NTV1RmxJR
	gdpuI987ag==
X-Received: by 2002:a05:600c:4713:b0:491:7325:39c4 with SMTP id
 5b1f17b1804b1-49220164d3bmr110342115e9.34.1781506895797; Mon, 15 Jun 2026
 00:01:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260612-upboard-pinctrl-add-upboard-intc1055-support-v2-0-4111b256c840@gmail.com>
 <20260615043536.GZ2990@black.igk.intel.com>
In-Reply-To: <20260615043536.GZ2990@black.igk.intel.com>
From: GaryWang <is0124@gmail.com>
Date: Mon, 15 Jun 2026 15:01:23 +0800
X-Gm-Features: AVVi8Cd4-JM4D7NMWfb5D2fBVj9B2aSf6RXqWB2l9lMs59U63IHAUpTvgJBvctQ
Message-ID: <CANYHO6rT6pPSZAts80YsFmZ8vCNyzmEm94sSheE-0NbUdZ_=OA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] upboard pinctrl support for device id INTC1055
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Thomas Richard <thomas.richard@bootlin.com>, Daniele Cleri <danielecleri@aaeon.eu>, 
	JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-38448-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mika.westerberg@linux.intel.com,m:andy@kernel.org,m:linusw@kernel.org,m:thomas.richard@bootlin.com,m:danielecleri@aaeon.eu,m:junyinglai@aaeon.com.tw,m:louischen@aaeon.com.tw,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,intel.com:email,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6EF83684013

On Mon, 15 Jun 2026 at 12:35, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi,
>
> On Fri, Jun 12, 2026 at 06:13:31PM +0800, GaryWang wrote:
> > Add missing groups and functions in Tigerlake's pinctrl driver for INTC1055.
> > Add support "UP Xtreme i12", "UP Squared Pro 7000", "UP Squared i12", "UP 7000" boards.
> >
> > The pinctrl-upboard is provide additional driving power & pin mux function
> >  through native SOC pins -> FPGA/CPLD -> hat  pins for flexable board level
> >  applications. it's probe from ACPI device id AANT0F01 & AANT0F04.
> >
> > Signed-off-by: GaryWang <is0124@gmail.com>
> > ---
> > Changes in v2:
> > - Add brief introduction pinctrl-upboard architecture in cover content.
> > - Add more detail explaining for pinctrl-tigerlake commit message.
> > - Link to v1: https://lore.kernel.org/r/20260610-upboard-pinctrl-add-upboard-intc1055-support-v1-0-8185d2abbfb1@gmail.com
> >
> > ---
> > GaryWang (2):
> >       pinctrl: tigerlake: add some pin groups and functions for INTC1055
> >       pinctrl: upboard: add device id INTC1055 based UP boards support
>
> Both,
Sorry, I am unclear what Both?
>
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

