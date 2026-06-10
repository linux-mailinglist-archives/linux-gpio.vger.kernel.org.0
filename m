Return-Path: <linux-gpio+bounces-38298-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qN3DBATcKWrxeQMAu9opvQ
	(envelope-from <linux-gpio+bounces-38298-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 23:49:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B97C66D1FB
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 23:49:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Sy7jK8Ae;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38298-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38298-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19FA030C34D3
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 21:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 757B727AC31;
	Wed, 10 Jun 2026 21:49:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191BE40D570
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 21:49:51 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781128193; cv=pass; b=W26o61ZVJguKoHQ1TvgoMsd715O3uxdMQjVxzkY59TGmBYnVMfHEzU+eg/5eifbJ+aHiBQ2AR4tTYv+siWhAUl97+c7EMAPgiGkl2eH66Plp6d+N6EWIuOTvFVfuh454UfhKCpJnKeuz9651Uibf9lpSlpxunbFBSP6b+usvYRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781128193; c=relaxed/simple;
	bh=LG8mk97/4kJrftTxVU1/SPbywdBZ/L8UT8aDebbvRR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sD7e6OwkrLzp3vgmDxWuqwnLEZrNiMd7khdgnnkWVnKffKt1tq7ll5zX4BhKWsYLRZrREn29D7ZHAwG9gOXi/Wl0HDLzb4+RznTMKuq/x0At9oPHCzv8299QAMkH4U8mZwdEUYb40j1bm6du43FzzMvQy+ioqQVrypgb7fTZugU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sy7jK8Ae; arc=pass smtp.client-ip=209.85.222.195
Received: by mail-qk1-f195.google.com with SMTP id af79cd13be357-9159f631656so45924785a.1
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 14:49:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781128190; cv=none;
        d=google.com; s=arc-20240605;
        b=YgCm4FSD7ZZYTYpatP3zR24APlgvTlzTLLkdxqI+emfTQYbF5num5PxK3HT2DeKVw3
         oiIrh66Tco3HPFmc1t/a8QP6KtWWMAcwjGR9Kp5FgFPsP2tXaYu8uDzlptj6Fu8+xvQK
         K00XqvOEs0gqJuKsW1yd+oChvsPEkLPgDUk85HlXb7LMdCkFN1lsHXGsv/pLeIk4+XZz
         w54nIWkI7njwLEB1oNjnULQeRDsiNBIokIBkxI/sIb67wRGLyRjUK34f5JxP5bKW8pDI
         uPt5RIJ1jvDCbvBc2tJRqoaRdkpi93dKbD6NYiqCksJDnMW92HooVpllqsv8ZShtJpZj
         nr3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LG8mk97/4kJrftTxVU1/SPbywdBZ/L8UT8aDebbvRR8=;
        fh=3z+fvqN6FJ1ktBE426jMeGSkp7DZYgKCj7eusOfxNcQ=;
        b=ZPOrk5dXSET2B2QumZAoDYjsvFRqg4ygyMjGXjgLwtyPtYzN+IeW8vEQMBRdbwi/6N
         TbPKdsCfIuxke1R/i3JuV4yFcLfD7zgYHd+LbD6MGDn2plp7X0V98bptacSGtGjmSt9y
         zzsvaXfOsrLenACMkfsX3UR7z33/Yorws61z0pPNoKlGr3RpRWd7VnWJtrl+0UdjII63
         lVeyY40mjJWL9uyYb1WERaQ+1tZwHlC2Tb2npCe84GirR3cqhc3S+bTOlUBuxb+FGWW+
         dCRtuLhHCcWpiki7f0dolxvFtPa6R1u0ziRbCvJjjkfrrmUYAZHEh2HlTbQ3Q+Pegixz
         GiLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781128190; x=1781732990; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LG8mk97/4kJrftTxVU1/SPbywdBZ/L8UT8aDebbvRR8=;
        b=Sy7jK8AePVjpB8178/t3qgTWU+ZbrDIMAn3s9QzWraJI5Q8/2L/ux4wFtvk3SEuafz
         W+nkeaG6bART6pliBC7g/VQ9BziWuIR7VgFM0BTvrFMvsLQyEZIx8uzGY8OF06esTM4C
         rdmXqE9tZavNrhK7ZgdhxqvOK6Wml30x+2UgkdgyiUQV04BlX1Ox2qZlnaLgVapfTp+u
         4bMtUDD9IIYyE3NTfTYhvWg+H7d4wMPxYCcIqTwDdLF3oA5+fvets3ZkCdt+9IYBM+1K
         NIb0oIa4zKJHAdYMFhLCWpmj16BqKEWMO+OaJa+NYtHq3dGrglL7bVCYN3/gNkf3o1zZ
         W9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781128190; x=1781732990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LG8mk97/4kJrftTxVU1/SPbywdBZ/L8UT8aDebbvRR8=;
        b=Mx776rp0pq4wtddFVL4OYkOaPaXC2705NrGfhYwN5aY2sQVJ0I0WaF5Ec3iPIB2fcp
         ntm+k+1QHt9R1AkqVLKb8ijeRhcd5frsDWM52u7267Yca+JyTzCm4x3V9IQlrZ85uBjC
         dQMGUk40exjxKfPd8e4jIZQgFEc2VcsMRwqj9N1MeNsxpZiIfiewagPe0qGRICGZMJ6e
         lXIJQlr7BejOjldJRD6KKw87DyowSrL/hkfo0EvFGEySQTJ5wtD8UNX2TYhIEUlbBPhA
         Hvyv/HlfC7eJPKpmhrZWPY4G3SYFWMI90MH/8DXBkMzX9PnL5oQ16pLTGGdOPyuklF6c
         nPCA==
X-Gm-Message-State: AOJu0YzNp5pd3dcPZwF/2a1tXVXXcTpr585WCaHOo6D06RDXF9w1PHzy
	M9nBEWRgdPfiXHJFwxv1qo6tOr21EJ1QOZNxRpEd68iaS3e2fBvY7OK66tth2v8ArmiAN0yE+2H
	VSj+0djJHUsgAEBh3HgPztlIxwZMJHp0=
X-Gm-Gg: Acq92OEDQpCCd3HwMi6B7P5CYucqC1KrBHYZjJV8I3rOSvf/pzy52gr3HM/DiPf+4eZ
	+vEqG2RHpLwaPZGVFcWff/IZMaxRiEfQLlzayPUC4hH1yrmjhoDdTecniqvZAIBq7iba33nw4rO
	L+yXo0cMeSweq365OCB4KVJwWD55rushWFSGoiuig1lj2ds2UYkyOckqgvDIyxHCvX0EqAXLlkN
	Yorhu0GfFJZVoZLAMADwIkw1vJKhDGmPA30IVxmbKIOMVG0ANPnMNFIL6ah6HODsPQvdv5HHEIf
	27s63Lrg0O6vAb4HDGTMQYgmYMES+ATfHX9wkgAhKJwIQuWAif1Gf6r8i8Bm/O/i8Ug+W21N3fN
	yKfQ=
X-Received: by 2002:a05:620a:690f:b0:915:9b90:332f with SMTP id
 af79cd13be357-916074a4308mr80322785a.11.1781128190423; Wed, 10 Jun 2026
 14:49:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610205007.44881-1-enelsonmoore@gmail.com> <CAD++jLnnXt_rmAQ8_zgEjcpR2ck_hufS7nSRLdwGJzJ0SGZ3Kg@mail.gmail.com>
In-Reply-To: <CAD++jLnnXt_rmAQ8_zgEjcpR2ck_hufS7nSRLdwGJzJ0SGZ3Kg@mail.gmail.com>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Wed, 10 Jun 2026 14:49:39 -0700
X-Gm-Features: AVVi8CcBqiyj6BOj_0pMwui4MmmTVjMTpEG3fvJ-JR9uozjbjftGYJ1tXOt0ZiQ
Message-ID: <CADkSEUgqAyvJNfBnPxTPMuJ2pvkVE7bZ2q_Qsb=t64ogaQoAZQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: nomadik: remove dead DB8540 code from <gpio/gpio-nomadik.h>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:linux-gpio@vger.kernel.org,m:brgl@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38298-lists,linux-gpio=lfdr.de];
	FORGED_SENDER(0.00)[enelsonmoore@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enelsonmoore@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5B97C66D1FB

Hi, Linus,

On Wed, Jun 10, 2026 at 2:02=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
> Good catch!

Thanks! It looks like there might be a lot more related dead code; try runn=
ing:
grep -Ri '[AD]B[89]540'

Ethan

