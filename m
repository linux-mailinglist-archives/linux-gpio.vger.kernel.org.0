Return-Path: <linux-gpio+bounces-39397-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ghSVNmiAR2rZZgAAu9opvQ
	(envelope-from <linux-gpio+bounces-39397-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 11:27:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BE9700A0A
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 11:27:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=JHeqUIEe;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39397-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39397-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8C190301CC0F
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2026 09:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E88EA3B19B2;
	Fri,  3 Jul 2026 09:23:26 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EE13B14A5
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 09:23:22 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783070605; cv=pass; b=uVkQb03Tx6sSSrbSfY/Fqc4xuh87IdhzKyhEWO7WZTUGDY3MoDbBz1kSvfP0AE/EWsi2bUZHIhw2bzOnWDVae0CV7+z8buQpvUNWsuhwkh8AJCwqqEcTIl6oBOzDxNNVZkh/7O9TW5fkSImklvpYiPbT+RDVCWRqsX5Bp5TmtPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783070605; c=relaxed/simple;
	bh=ZlMb/5M1APEwdWuo6IoXGwwtmtCSVNt0K37Nd0YKIX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NtM9tMunnXXdtIWDB+egkplaL3K2TR44GstDBBPprIPGwIb5jzzDND80xK68WUh7lSWsZeBY5D9ILi7bSVP7y5UTvPAGTPqgi+OpxQTr8jbJdgVqdsVF1d6bD+poymAujtxsww6DN9NhWAjnAjoJlLD0kMW5rXuL9ZHRkUvQxCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JHeqUIEe; arc=pass smtp.client-ip=209.85.221.45
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4798bea72f9so243374f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jul 2026 02:23:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783070601; cv=none;
        d=google.com; s=arc-20260327;
        b=AuT+Paa/VON8eUUdEN/bplw23H5sq53DflHsc8PqjGcOjTk0srQ8knvYvgQ0+QweSv
         fHPCugEatvygumF95eaxW4OyyLj1RM0OrKiNqMexQTChx0zZHRxds+CNKx42nt8EPzdM
         biHMLWwFh/uOVGC3byyH5I3Kk+FPavWH+SV0Dm+Es/B2pu/BRaMXU50blP+8ymxlzufw
         uR1rnW25YPknH4Ph/lKGu5w4/kEL0vC99dHjnPXxJozn7ZkeBgsiAkyqpMN7E2ZgavkI
         TVF7jYv9XLbtgUlFOgwo92dPXK89neCZ+DseG8GWellV+ystjFhqritdpIru3Dl5TDGR
         IIgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cmERdAm8xkvSIVTCRBy1rHZxc/1BpXZpx42vCjx6oHs=;
        fh=Hbe/9WWIjTEtEC25tZNJnVrXfI8VfgQEsDrXMsQTvrE=;
        b=St1YZgjveKx1eMeDMpIg/5RS65j6ZAalgWYiOIJZqDWWeUMoZRzBAKu9ukuHbRGYtF
         R6sfvx2Wlu8lRQ0bS5aSdvQ6vGw+3OUXEW8SUOhhaDnT94LAqKQLuYPLa46vgkC3f7NT
         1V057OPCG/G/52mx0OLIiwdeNOZybCsv7ROZBsvzYp5AenIInoxu3zVN3q+q9S9sLi90
         4WVWI73rMeuCALj3q/eY06WwzjV2md6GJLUqSGWYLByckR0aiU6MtAF4ara1vzmnPof5
         /jULyUCj2HkYWu+MLTAKRk9MNReM/IBxK2GPeIw6PNqIl+3OA1BIueruWel+okVRakUk
         YGRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783070601; x=1783675401; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmERdAm8xkvSIVTCRBy1rHZxc/1BpXZpx42vCjx6oHs=;
        b=JHeqUIEe4JFi4N2/HFjO3S9woXC9T8spjfAwmcO7tnOaw/RrzizN+LFYDioEVH0xtb
         xfw32ugysVcgVMk0R1ExBcOpuDKZmr3EobnxRVnj+ipkY5+d4Un/3/iCwqGt9Q+HIrHr
         7hnef85FZHoCiDOhnc79SPMnJIM8yN2IDooLgcZEHN/wuzZBRAVF/WK3mCIG1ESfSSMe
         I9vG0VekOKziSx9Iy0K0/qID4iLKGTXopofPjnIG2W9xfrNcgv5Ly3ezrISkEbUFZCpc
         2CYlDJs2Az86eCaO1igD0wHWXloXf3soqjJnB9kvQEndcwUdPp9dcHMWxeRvMFbEQLHY
         eKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783070601; x=1783675401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cmERdAm8xkvSIVTCRBy1rHZxc/1BpXZpx42vCjx6oHs=;
        b=Yo9uyaAM3allRpyKErKWTVlrtFl+wEOhykXjbQcH6+pwW8UO0iugcdCaEPPBj2vKJL
         mjXBi3PbPN00nAZPOrRgeRvbUlEvOb5Ta2bRYh3CN0beXgQOKS9gjRZRuBxjqiIzs+N/
         0/5NXrlHZV7KByP9Au7lANIPZuhtCP6Gxh97sn+UpjHr9m3nwjLKkLoWvfK4bgX9uQMc
         SFqc+ZjqgQkAm7RYr0uB9aRSi9gOnvtxURqg4O+y2WsNsTMcrbPQWcKpvxbU4rIfL8H8
         viC3nFVLAVc7l9K8Ga/IqYMpbKzNgZmm4G6Zyp+Zz9khoKbGcK8eJXY4vCoWtp1XbOLq
         zQkw==
X-Forwarded-Encrypted: i=1; AHgh+RraodS4Ksak4Dhp7KO0PQgpKq4+NsHII0HHUXhLWyLqBernMxlgVRFMLB02q9d/dM4Em1/JeIyY0vLv@vger.kernel.org
X-Gm-Message-State: AOJu0YwG8uFr2IWc+TXDi7Rsd1AsswdtbdDvV7I5UPhT58pq5J6jzILN
	MCng5KemcWXo8GsRAVO1oHR4ydAhQwhmgr6ZkTef63pYlrcXup/vht5YlDMDUMi/MZ3VPV2sUea
	y2i1ga7AS17N/eSUJ2zAHVoq15+TmD2A=
X-Gm-Gg: AfdE7ckDeAULCujkwYm7pgZ98/3OHFcDfpAp6QLFe9q+96d7zH4U/YmN2dVNlgoCRYH
	mWGNvN1ukHa2J7QTj80DVpwAuvY05ScjQuAOrXM6eNVeEo58X1UhQdrLUXqNpG+iJ81rD2LWsiH
	3O5E23VTOO/NpI3VeQwz++A8EzNzPZrFIat/HMxborRKCE9/PBnzKl12FfbRo2xJkLJLJdg9+j9
	ZkqgERdMXqmIF99lNtAINNjLRdAh0j9Rny6fIxXx0Z1kmzKEU/tPd64hJtAltvFMJ/vISox/BY=
X-Received: by 2002:a05:6000:29db:b0:475:f0c2:5b02 with SMTP id
 ffacd0b85a97d-4775b45b05emr10548048f8f.56.1783070600922; Fri, 03 Jul 2026
 02:23:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702-upboard-pinctrl-add-upboard-intc1055-support-v3-0-e6bda3032914@gmail.com>
 <akYlZCn9LKWGWM9e@ashevche-desk.local> <akYnCrs85b3liEu-@ashevche-desk.local>
In-Reply-To: <akYnCrs85b3liEu-@ashevche-desk.local>
From: GaryWang <is0124@gmail.com>
Date: Fri, 3 Jul 2026 17:23:09 +0800
X-Gm-Features: AVVi8Ce2QhBa4HuuyO388fomr2VZGdb4hDwRizTcJCZmrnFjFgizZaKUg1TNxsg
Message-ID: <CANYHO6pyoh2oQO=UyMJNMAqEn3AckcJhbOWO6Vwb8DmxZrQZJg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] upboard pinctrl support for device id INTC1055
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-39397-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 68BE9700A0A

On Thu, Jul 2, 2026 at 4:53=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Thu, Jul 02, 2026 at 11:46:53AM +0300, Andy Shevchenko wrote:
> > On Thu, Jul 02, 2026 at 03:10:37PM +0800, GaryWang wrote:
> > > Add missing groups and functions in Tigerlake's pinctrl driver for IN=
TC1055.
> > > Add support "UP Xtreme i12" board.
> > >
> > > The pinctrl-upboard is provide additional driving power & pin mux fun=
ction
> > >  through native SOC pins -> FPGA/CPLD -> hat  pins for flexable board=
 level
> > >  applications. it's probe from ACPI device id AANT0F01 & AANT0F04.
> >
> > I don't see neither Linus' nor Mika's tags. Can you explain why you dro=
pped them?
>
> While at it, also fix your Real Name in SoB and From headers. I believe y=
our name
> should be "Gary Wang" (mind the space).
>
Okay, I'll check tag problem and change My Name.
> --
> With Best Regards,
> Andy Shevchenko
>
>

