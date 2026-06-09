Return-Path: <linux-gpio+bounces-38170-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eZgQFyj/J2q26wIAu9opvQ
	(envelope-from <linux-gpio+bounces-38170-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 13:55:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F182C65FB9B
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 13:55:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=eIZgaB21;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38170-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38170-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6866530279F8
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 11:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00DE140488E;
	Tue,  9 Jun 2026 11:55:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55E6403E9B
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jun 2026 11:55:14 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781006115; cv=pass; b=Gx/0H7c3EFBUIHHFm39ZlRFaom9FT7N0rBAooWLMYNZc2l7DCoPygcxgLG+YgXIJ4HRvRoUIwySHj8nwSp1a+bttMQ+xYm3CoBN+0YikudAARRgZ7kYxXb7dMA6Na1G02miWAYy/spGfhUqzy7UI2XOUMR5SqYL6JqyQ8r0VEWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781006115; c=relaxed/simple;
	bh=gBdjKSDy37K8cZqRNblrRR2SyW32Aa10nN/LmheHbp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AY0hxLz7ij8yCEEa2q0fRwmRr6NhJW1a0aVngTeVwK68k93NOrzbgX8+5InCS5mtlD1W35NVugNuPffvFMlIb+NdgA0rlgHM/rJ98jUyts6FCAlShNdNJ237/TN/PTy6gYvyByY6fVgEcxOW3yDJSsQfPnxp3CwoM61r/QuVLKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eIZgaB21; arc=pass smtp.client-ip=74.125.82.44
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1370417c01cso7063904c88.1
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2026 04:55:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781006114; cv=none;
        d=google.com; s=arc-20240605;
        b=iysW73vGZ906NecGNEg0rw255Gmz+anN3KG6WZARHzGw2GGvtWpFa6jjykbE18PjDQ
         3pkB258LMM0q63Jak47X0aErvfYXcKZAfTHwvDt0es9mFqYqU0cThlr+i9Q4C2WIoNvW
         VPdVs9xHBvoEVLeQRA01qgyjpI4Gns00xBssivB19/kAWSn62h3AtAifV4V+k4hw3Oul
         76zgU8dudZBu+xs2einwfXszqixqk4SuuNLUIGTqGr+AKXP20vAB7+DLxttb3WIupCRa
         1lUBJZB8Nr1AKXuBUGjPG9d2tw62aVWDq9WgRmu3nxnvhct58MFUT0B1Wnklfxti3Xgm
         11IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1CRSOI89gkYAyGLElqYBFjj29+lkjSgq4z5QOW2Gjmo=;
        fh=BHndyO8wQodm9R5UayEMwqiY6+rDTbMCHRRPVAxQHKs=;
        b=RSn6RigOT1Lg6+uzOlZ11ocabZnrLMaap5dmFAPKpGEFzNox2Ze8gWpidJgO3nji3A
         sifZIYb+1cX7OZKkaKi+kvbQF3XSJ3Ajy7dRYmUrj1b+GXORuua2qUOOGpzYOFw9RWC+
         KutCoyxC1LhOzV2uoVVHvCKdtsxiIsW6/oyBZcjpI7HeJCZKCiDLEHBqgPvps7IVKQ2i
         889ms5hoElpjK7YoJAmn6Wt3qAZn0Oucfy6rAArYDYWloznbjP3fa3yN6Otsl6NcbYLA
         b47LLCxhnofjpGM3d/PMjGhmQPfMTInYjWlFk5SXySkd8RgVbZ4b0d526Az7ieDT26sM
         YwUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781006114; x=1781610914; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1CRSOI89gkYAyGLElqYBFjj29+lkjSgq4z5QOW2Gjmo=;
        b=eIZgaB21uBcKBDFf406eVasIG9BLGLtfLvaKzsP37GpSglawTeW+Qx8yvkDdVR2xDY
         Jc8XxKH2RfuJebbeya3fYqTyLHUImB++H8VSUBhxD0BLzdNYUFuHMSTZ46pkQDnGnbPA
         IIGTBR9QvG3QexNLIvZY+5B6gnTpU6pG1twloTuYnEW7k8hB+z+lo4DZpYh4QbORTkKa
         h5Ya97HaCDNS39Gl/kTbU3SVehLFBRnO0/6nD7tIDpApPrPk+0BKMKjCr8GcsNmKYYPr
         YiAJrqmCyJr7KXw5wz1K1OTXtB6YDu8wR/RQ5Y/FvBu6c8TLAhhI7IINZbtGDOKYl7Rh
         /yRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781006114; x=1781610914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1CRSOI89gkYAyGLElqYBFjj29+lkjSgq4z5QOW2Gjmo=;
        b=hiTvlCrfB3SZSnw1mxk9Yw2Ur9HQhLeuscC+H+23N2LZvPttqxzV33ISj4bsAmnHCz
         2ohEwplrwX1aLuyWF82WSa/uA9zT7CWpOZZJe4VGF6twMRMOBu7kOqS43ccGNpbPefly
         njHNOhnPfwZGUkvYcrnFiyawFpIK8Gbu+qg/3vLicSk5hPsYTuyHKZXQbO7IecUoAT7W
         uyfHO2u0y2xNEy/tPmRJXBVRj+a9i8ICG9mW3qxgP53OjIRqVpzKc8yzaMMWiV9YXLuw
         2a99GXc8gFdwZrS6XRmxz3CkdwX7RwjC79jHPivpdQyRNkKtfG6YAwI0QqMQqvPvY5Xg
         Xwzg==
X-Forwarded-Encrypted: i=1; AFNElJ8eyhc2Q3QiF0sa09l2b/ApvAUayyktTTZ/CZBpOl5P2NPZS1cNa4G7ALuIXqiz+e0ud3om6uiiorKX@vger.kernel.org
X-Gm-Message-State: AOJu0Yw59f/fiG+gxnLmE5IaDNqI5jb+35PFmsYVi2N14l2rTryJ4jNJ
	lWis8BqQBAogmrMdDy3fQUqU7vgVed8ow5k38+cpH53Pt+p0hlXFBBme2HbVnqI7yPev5HULTAR
	wZJPbG1tXCCccCBpAqmKOIxfI+j7L5I8=
X-Gm-Gg: Acq92OEtxSYwtHHPTB71aDQ6aFYFSgClqFyJ1SOn3WtuQDCcrrdDXc4EfvBGjb6osA/
	j+aI5tFgOdG3q20GFn4WQsT3X8kZ/HNSyQymzKPPlPfcendLTeC8J7qkDP1auaGd2zDmy5hEqP9
	Rwx1f812vLgMHEsFxuvAb6My7iRXBFYHyh3iNRYCOYV3klTYV3uxf9ccYIpaglpGWV/gAn6qsYu
	HCGsJydm6C45oJNpgJdONZ4210kOYXW4ExQpfZvR05pl0jqXi3StgJC7fW/c2dw10Z06od63+RG
	lGRnrf6xZvwXgs/uJgmyWlMJGA==
X-Received: by 2002:a05:7022:423:b0:137:f2d0:da6d with SMTP id
 a92af1059eb24-138066dff7fmr9828284c88.25.1781006113564; Tue, 09 Jun 2026
 04:55:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609031118.2275735-1-sergio.paracuellos@gmail.com> <CAMRc=Mcg6aErmF8rVfM7hSNNyTs+2apJ2Tv6VPevx29Q_NUhJA@mail.gmail.com>
In-Reply-To: <CAMRc=Mcg6aErmF8rVfM7hSNNyTs+2apJ2Tv6VPevx29Q_NUhJA@mail.gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 9 Jun 2026 13:55:00 +0200
X-Gm-Features: AVVi8CdpNnw69EL6lcSWtzAI42jrF3okaay4eRKuW-HE2QsRjYuiqnsqJf0y9YY
Message-ID: <CAMhs-H9+1zjH9RhaYnZJNKsz3JaoFvWXc267iuvuRFNpdTowUw@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: mt7621: fix interrupt banks mapping on gpio chips
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linusw@kernel.org, tglx@kernel.org, grant.likely@secretlab.ca, 
	anna-maria@linutronix.de, vicencb@gmail.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38170-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:linusw@kernel.org,m:tglx@kernel.org,m:grant.likely@secretlab.ca,m:anna-maria@linutronix.de,m:vicencb@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sergioparacuellos@gmail.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,secretlab.ca,linutronix.de,gmail.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sergioparacuellos@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F182C65FB9B

On Tue, Jun 9, 2026 at 1:36=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.org=
> wrote:
>
> On Tue, 9 Jun 2026 05:11:18 +0200, Sergio Paracuellos
> <sergio.paracuellos@gmail.com> said:
> > The GPIO controller's registers are organized as sets of eight 32-bit
> > registers with each set controlling a bank of up to 32 pins. A single
> > interrupt is shared for all of the banks handled by the controller.
> > The driver implements this using three gpio chip instances every one
> > with its own irq chip. Every single pin can generate interrupts having
> > a total of 96 possible interrupts here. It looks like there is a proble=
m
> > with interrupts being properly mapped to the gpio bank using this solut=
ion.
> > This problem report is in the following lore's link [0].
> >
> > Device tree is using two cells for this, so only the interrupt pin and =
the
> > interrupt type are described there. Changing to have three cells to set=
up
> > also the bank and implement 'of_node_instance_match()' would also work =
but
> > this would be an ABI breakage and also a bit incoherent since gpios its=
elf
> > are also using two cells and properly mapped in desired bank using thro=
ugh
> > its pin number on 'of_xlate()'.
> >
> > That said, register a linear IRQ domain of the total of 96 interrupts s=
hared
> > with the three gpio chip instances so the bank and the interrupt is pro=
perly
> > decoded and devices using gpio IRQs properly work.
> >
> > [0]: https://lore.kernel.org/linux-gpio/CAAMcf8C_A9dJ_v4QRKtb9eGNOpJ7BZ=
NOGsFP4i2WFOZxOVBPnQ@mail.gmail.com/T/#u
> >
> > Fixes: 4ba9c3afda41 ("gpio: mt7621: Add a driver for MT7621")
> > Co-developed-by: Vicente Bergas <vicencb@gmail.com>
> > Signed-off-by: Vicente Bergas <vicencb@gmail.com>
> > Tested-by: Vicente Bergas <vicencb@gmail.com>
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
>
> This looks relatively good to me. Sashiko points out several issues in re=
move
> path but they're not different from what many other drivers suffer from s=
o I'm
> willing to let it slip with the potential of fixing it treewide later.
>
> I won't be sending it for v7.1, it's way too big for rc7. I'll queue it d=
irectly
> for v7.2 and send it next week with my merge window PR.

Understood, thanks for letting me know.

Best regards,
    Sergio Paracuellos

>
> Bart

