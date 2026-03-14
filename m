Return-Path: <linux-gpio+bounces-33420-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yE3HJ3ImtWkSxAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33420-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 10:12:18 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEDE28C4AD
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 10:12:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4D5F43036E88
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 09:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9A362DC76C;
	Sat, 14 Mar 2026 09:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z3sdjKh1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470332D239B
	for <linux-gpio@vger.kernel.org>; Sat, 14 Mar 2026 09:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773479522; cv=none; b=j7xeAe5CJYGx3T5a/cLXj46dCjaGLhzRSVxK/4Ioy0dHyWjM73lK2j728RK9SNAOGwuVwgIEtmkXGlAzz8+A+ctOwmGzKFQw92ZXBAjYNjJmoDzONyvzFxWD9RF0uPm4/ceTXs/NDbdX0o70YWO2j0/tbgN7iLvI55xu0nL9pww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773479522; c=relaxed/simple;
	bh=QiwL16bjOziT5hiJB9OYiaVlhavbbKb1oaWep8hSRjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pb37MWNA0CqZke1m6jIJ4ATAQUmrzZUmTVxdj5TFMBCO6k0XHj1gag0scc3UCccN3W0gpSxoHSP28uevX/nieRpZlnmxXGptG8+SeTRHDRpTl0lxRLaw467zyssvl+oeetIuIsoQmxaNoxQd5hCKkaAz+PFJZ6K0i329am5EgSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z3sdjKh1; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439b94a19fdso2737459f8f.0
        for <linux-gpio@vger.kernel.org>; Sat, 14 Mar 2026 02:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773479519; x=1774084319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QiwL16bjOziT5hiJB9OYiaVlhavbbKb1oaWep8hSRjk=;
        b=Z3sdjKh1lXZlXlkYIuWKIJzPFsNVMop0m1taZX7dDXiPSQgwzx+GRegVyDfOmL6csF
         Nvle81qwXF3H9b2D1+Ttom0tvwDYzA0GhUYncIxgRrOmSTnoXbW/bjFsWxIb4pqE3VBg
         NkZ/gNGcKTCYd0XSR4ywkjfIkfbh4HOYh/JHAa4LxslycvKtLHsv2VGKOPJEPuaMpLtN
         SP3zGE+BczIXs79aDPzrZ/HbGE9bhpz2GJMMcLA1KygVLrBuuw4JMstA6cIGyQ+EKj0K
         13iWQyzE88sdmlOUPC/p9P9xUhxUkqJu0yc5RrQrIaWM7F8Dkkma/RY/UoPZWC6n9q5q
         oVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773479519; x=1774084319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QiwL16bjOziT5hiJB9OYiaVlhavbbKb1oaWep8hSRjk=;
        b=VRZMrK1NDyUQKDKVcVsWY+XFd06mJOoU8IvSK0FDRRdBH2V09GWMNjiOUbuWkKbldI
         0bGP2tSNj4j6epAdwuw1gjo6pP/z4UzHWUGBypR+M3xyE9yodJk5FYkxKn4zrk+bZ3vu
         klnL5fZocT7oQd+V0E9dCN+F6ZGXpkYkRq9HMfCW7drTSoaxxjdg2TIo1YX6Wgye8E7E
         /BxoY8i4xkGz/iB+eX+wyN5drMZVCwI6ojNmNxmQC6MoqXaDUXgerdP1Fk+yR1ywrFPu
         7p9cJzp4LyhsmdfHNN9pj/oNmHKUZiyOHqff1ThhtGJ+KzrFBoGRggE3vmEiP/wvU/dX
         dDMw==
X-Forwarded-Encrypted: i=1; AJvYcCXY9vGKpxZIhKDg6PUYDWE2hBzuefpsbCO73oFe5Xh0e+Au//3+xOkn4oMcHzsCtWYp9GmDc6bdnvIH@vger.kernel.org
X-Gm-Message-State: AOJu0YxEBh0Uhkb1+8Hh687JnOyvYojhL3SB2U04XPneg1HVI5YWkDP7
	L2MvGIbrkEdvG5waZgeE4Qk0Hy6CbdcoECEN34PDzuvgP7EfXs5wgdGA
X-Gm-Gg: ATEYQzzdW6RvKbIlXsbhc3pVXA1GV1SIGNMEC7iW1REN+L5gBg9lbd+NMRq7HwsWZgG
	EhW6YA0CoFnUCTa67nKpEqbzFQOpCUoroe7dKFc5DkU0TGGAE8OjVkEJawtzD8mTmcpUquW5liR
	n4MdHZLfwL0tmupJe7YNHDT9kDWc8nAJnjyG/7tfNwS4cijt12iSb01/DaNnpRHMNPf5rQqZT8K
	J3JPbqkUb2N47AzubMPE7/yw0bSe+sNnaCKgMxmbHO2wvxRADzHrXtr3cGzMp2FasAuSDqJW9mn
	OiHGZ1e3RjfjHTfRauH1sB0bRVyOPppdEzY84DnHdb/HkW668rxXhRALIA56RKk0MXbcs6gmhwy
	mv1CnWsidbx//RgeoFTuYQw87wV0Xf1Uj7wFqQIi9ISjgrYs5HtEl7wOJ/38bG4U8kgw3dFO0pr
	8f8T2rkBImnIe757OMxoCJEJSTeEgtNbbnXgMM23Fd3goktCQ5P4+xnlSezQLmMls5ZrZN/rr/S
	PzcdrIwk2YKLfQ=
X-Received: by 2002:a05:6000:2f83:b0:439:b940:8bfb with SMTP id ffacd0b85a97d-43a04d87714mr11537033f8f.15.1773479519281;
        Sat, 14 Mar 2026 02:11:59 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-12-163.dynamic.telemach.net. [86.58.12.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe2273e8sm25569590f8f.33.2026.03.14.02.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 02:11:58 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Icenowy Zheng <uwu@icenowy.me>, wens@kernel.org
Cc: Andre Przywara <andre.przywara@arm.com>,
 Linus Walleij <linusw@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] pinctrl: sunxi: convert to GPIO_GENERIC
Date: Sat, 14 Mar 2026 10:11:57 +0100
Message-ID: <1948361.tdWV9SEqCh@jernej-laptop>
In-Reply-To:
 <CAGb2v65RD3ksSnEC0RjYYQ1J-NoP9gGfeTR1UCfLgKCJEFBSTQ@mail.gmail.com>
References:
 <20260313000652.11470-1-andre.przywara@arm.com>
 <a4cfb10e4701da0649ef648136496a962be5870d.camel@icenowy.me>
 <CAGb2v65RD3ksSnEC0RjYYQ1J-NoP9gGfeTR1UCfLgKCJEFBSTQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33420-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jernejskrabec@gmail.com,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[icenowy.me:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1CEDE28C4AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Dne sobota, 14. marec 2026 ob 09:38:11 Srednjeevropski standardni =C4=8Das =
je Chen-Yu Tsai napisal(a):
> On Sat, Mar 14, 2026 at 1:14=E2=80=AFPM Icenowy Zheng <uwu@icenowy.me> wr=
ote:
> >
> > =E5=9C=A8 2026-03-13=E4=BA=94=E7=9A=84 01:06 +0100=EF=BC=8CAndre Przywa=
ra=E5=86=99=E9=81=93=EF=BC=9A
> > > Allwinner SoCs combine pinmuxing and GPIO control in one device/MMIO
> > > register frame. So far we were instantiating one GPIO chip per
> > > pinctrl
> > > device, which covers multiple banks of up to 32 GPIO pins per bank.
> > > The
> > > GPIO numbers were set to match the absolute pin numbers, even across
> > > the
> > > typically two instances of the pinctrl device.
> > >
> > > Convert the GPIO part of the sunxi pinctrl over to use the
> > > gpio_generic
> > > framework. This alone allows to remove some sunxi specific code,
> > > which
> > > is replaced with the existing generic code. This will become even
> > > more
> > > useful with the upcoming A733 support, which adds set and clear
> > > registers for the output.
> > > As a side effect this also changes the GPIO device and number
> > > allocation: Each bank is now represented by its own gpio_chip, with
> > > only
> > > as many pins as there are actually implemented. The numbering is left
> > > up
> >
> > Ah, is this a userspace API break?
>=20
> Unfortunately, yes. This means the easily computable numbers that one can
> use with the (deprecated) sysfs interface is gone, and also the pins are
> now split amongst multiple gpiochip instances.

I don't mind this at all for new SoCs, e.g. A733, but not really for already
supported SoCs.

>=20
> However if someone wanted the old "one gpiochip for one PIO instance with
> evenly spaced banks" scheme, I suppose we could put together something
> with the GPIO aggregator driver? It won't have same base pin number thoug=
h.

IIUC, this can be instantiated only via sysfs or configfs?

Best regards,
Jernej





