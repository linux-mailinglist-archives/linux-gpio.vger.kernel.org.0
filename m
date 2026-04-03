Return-Path: <linux-gpio+bounces-34623-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HuUFzlGz2lEuwYAu9opvQ
	(envelope-from <linux-gpio+bounces-34623-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 06:46:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D98BB390F9D
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 06:46:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 901C6303DABB
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Apr 2026 04:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06F5C3596E3;
	Fri,  3 Apr 2026 04:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DidQGWOK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3106D3563F3
	for <linux-gpio@vger.kernel.org>; Fri,  3 Apr 2026 04:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775191563; cv=pass; b=S33Soy/FNhtPTEwp9ndNLZrFWr/iJOrh89G4vSftPvYWuLDS2o75OUlXH5rf5DaLIPRzykRTz72+M8eKie5Ky+ttdLd9tG51f0/99xRGY9ojaMURztIgYojcvqd4jo0tSxMEE4Clq4Xh6xI9WjVRCey6LORiL+QvA2HCd2y2KTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775191563; c=relaxed/simple;
	bh=groc3VAnH15CVUVhNhE5OtlEsDNXM/uA7VeW8vaOMTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ACKaTnYAYBS/uu9YyUTU+ecdfLe7YBKDq3PjSyb2EROa0xzcLAq3phmJ13Nq6Pxux0f45eHXaOf3kHY3vG/nauUOxQ5vrO9PmQzMHvDfTPFboLV+v9GxpMopFBdHxozB+H5EvvWu/whn4l+13uYk2nLQeF7pB7ejVcEXaej8I5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DidQGWOK; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-799001d73bdso12166587b3.0
        for <linux-gpio@vger.kernel.org>; Thu, 02 Apr 2026 21:46:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775191561; cv=none;
        d=google.com; s=arc-20240605;
        b=kIf3JSiCXwMGWZqRskLcpxuhHjdvh+pwETcDcpk8zkZywNvwryzZowuYmDf8N1FM1d
         QaE2qoWS3x5Rs7SFpkYPy2piRzbDfLRdu0fZI325F3SQ9R28gvDokI0Cv3sHL0x4C1UC
         6gsyizU5SDK+Q1O7SSNN8oCZfx0xNoo4PmQuI9rv7bftDkvLqcgnsk7p77Qow8cghMJd
         28kkAbp1JfzWPfFZjuv/ymfaIDiB/GKdthK7PIeAh5Coc4GpeDtJXBiEggo7IWKdbULy
         l/tuAFMc3bJAkV2BA2LbGCOEikVXHZzt/gXQIn4Qjbzb7mXRAWHjdaCWWZUJlXhVPEIE
         P6HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=udWmikDfTPoYOznLAWVnBq6+fVtMa2LFJrslNkdcn48=;
        fh=BIofZzRHGKTBzZgumGKj19eOWsyReOnCEkscmD+BPcc=;
        b=YdcaFMF4ssCijb7Z7XX+qIOWu0VhN6CTaIspFqAqRrrmaFq8MypORkjwEhH2QbPFuj
         ABG7F4sMUVnD7RX8qD+QcBn3wZcXjy9S+SW8uP/oR6SccSGZWL9M1rGBKK7WUl7bVXnH
         1A+u6kPF5cBImGl0Uu8zity3mZznirMexK16WuObRKHDr9LmWM8NoRf3UlDUu0SHPoRH
         yrq/BoTUMHvlysKCbjQlJugeEJ83kAUA/akApiOckAYttpTVRooLbKlP6bmjSX0ijlt0
         lbECx7O58/ngeElTqS2mJiPb1JxOtRADr1O4oLHrAiubAxPRjwJF/tniWu0dI/GjXUVJ
         DWKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775191561; x=1775796361; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=udWmikDfTPoYOznLAWVnBq6+fVtMa2LFJrslNkdcn48=;
        b=DidQGWOKrm72zYGNfTnKQ9IcnJWZNioKN73o236MElVFzyQKQ8qb/l+soctZqFpFYR
         KhdKkKO4KWfPBZssLoFqJJaoQDXfr0ubxMRtcYnbkp4Aw6n+hEGhzMD/e6M1vs9Vctn7
         F7uzUA9y1Hc8Am0AiyTcsudzX2bQmqDVaIRAHRwR1H1Mdwqeulzb+nkNolrXNE6n+lnA
         5zZ6mhLg+931xo6+ZY56HBf57G3FpKAkbPbK1guAlEH/oool84UFse8KKG4/MulU3zjW
         kOZ0D+JZfXdmrH7t4ojZVoyu6NPL6R7//xVc/4ow33xoSCayriKVfXDNF+A2xeU4fM2L
         OvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775191561; x=1775796361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=udWmikDfTPoYOznLAWVnBq6+fVtMa2LFJrslNkdcn48=;
        b=CBqbfhbaBBCOK0MOeLzK5K1iFAiNHKkokUz31cVoBY5Zf8vxyt0yF36QXH1D3OmCVZ
         ToQ/gIRErxLBVYGzVdy9C+fVzhYOE4qOoiBBLcYPmu/vbJhVpnf5GbCx/zo1hkxyThQZ
         t1Qhia9TuLUmDSiZ0x/9Yxu0A7aqWbLxjgAQYF8uwtfk4g7PumK3nSAhdCxs9ZTrKVb3
         g+3urmGr46JcdsuZ3GdBJQXVCa4KjacLKCU6Y95WdMl1ug/eAUIMiEzuh4emWys981bg
         +/TB9qutzj9iMWGgLBhwu2ULJk9R/aMk9wnH4iYvfx1dDfFDtrmtDsXSr39q3CdaU/Vu
         qPlA==
X-Forwarded-Encrypted: i=1; AJvYcCU6vTe99Dh/6XVOQAHnoDbcyZuCdwVao3L9GnDgc6uwiLlkksG0aprUYdZBEUrxmGZVy77yvRsjO6pd@vger.kernel.org
X-Gm-Message-State: AOJu0YyqCkH+tj4y7HmZPEs+0rM8y3uuRy69wVcWd4QL3amlE9dx0TOO
	FmeRYFd29BTYJpEz9SJV1L6py29BdGahkRbb44ILVdjnyasAcmhRBd3YY2WgM28FHnDEan8wsKS
	btx5519hRCCPkgjTQ9O6vKtCnvUUUL+E=
X-Gm-Gg: AeBDievbvOYgvqj+YYRiPmopF6jlXuWzc32RDKp1nohvgIUaeW8ChTKnbQBbIpYHSWn
	Vc+J0/IUEaWkVLXYV5JEOriD524h5/280eVSroBTOLU302yQj+UyFGM3hSZwA2NYqk1yjeIUqIS
	YaFOpsmhgDRocjCaSwjgf+/QiHEOLYhg4GJ0fj48kUVkFlBmlAUszEG/u4T2Dsw0jOfWuQYOCFe
	Stv8rG7/Cpal0flg+Xp0/gIDYqGSCHRcvAAkk48VieG+Xz0hvFW6kvPGvbX0uAk5BtVIES0Z6y3
	lO/9uQ==
X-Received: by 2002:a05:690c:6987:b0:799:198d:8c5a with SMTP id
 00721157ae682-7a4d585f69dmr19958067b3.34.1775191561252; Thu, 02 Apr 2026
 21:46:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402051442.1426672-1-a0282524688@gmail.com>
 <20260402051442.1426672-3-a0282524688@gmail.com> <20260402-warping-chameleon-of-prowess-9df780-mkl@pengutronix.de>
In-Reply-To: <20260402-warping-chameleon-of-prowess-9df780-mkl@pengutronix.de>
From: Ming Yu <a0282524688@gmail.com>
Date: Fri, 3 Apr 2026 12:46:22 +0800
X-Gm-Features: AQROBzC_c6Pz91vTEwJZ5AXR_5dXzfojiP7V5Wmo6LnqG_6F9RBzJL09w08myjU
Message-ID: <CAOoeyxVp2dY=XrujkCbWHjX4bVu4-H2=k0JHxL6akC6KwY+rVA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] mfd: Add Host Interface (HIF) support for Nuvoton NCT6694
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: tmyu0@nuvoton.com, linusw@kernel.org, brgl@kernel.org, linux@roeck-us.net, 
	andi.shyti@kernel.org, lee@kernel.org, mailhol@kernel.org, 
	alexandre.belloni@bootlin.com, wim@linux-watchdog.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34623-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a0282524688@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D98BB390F9D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Dear Marc,

Thanks for the review.

Marc Kleine-Budde <mkl@pengutronix.de> =E6=96=BC 2026=E5=B9=B44=E6=9C=882=
=E6=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=887:05=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> > +struct nct6694_sio_data {
> > +     enum nct6694_chips chip;
> > +     int sioreg;     /* Super-I/O index port */
> > +
> > +     /* Super-I/O access functions */
> > +     int (*sio_enter)(struct nct6694_sio_data *sio_data);
> > +     void (*sio_exit)(struct nct6694_sio_data *sio_data);
> > +     void (*sio_select)(struct nct6694_sio_data *sio_data, int ld);
> > +     int (*sio_inb)(struct nct6694_sio_data *sio_data, int reg);
> > +     int (*sio_inw)(struct nct6694_sio_data *sio_data, int reg);
> > +     void (*sio_outb)(struct nct6694_sio_data *sio_data, int reg, int =
val);
>
> The signatures of the function look a bit strange. I expect functions
> reading/writing bytes use u8 not int, register offsets should probably
> be an unsigned int.
>
> Why do you have pointers to the access functions? Why not use them
> directly?
>

These helpers were originally meant to be used by sub-drivers for SIO
access, but the implementation later converged so that all SIO access
is done in the MFD driver itself. In the next version, I will remove
the function pointers and simplify the interface accordingly.

I will also adjust the types as suggested.


Regards,
Ming

