Return-Path: <linux-gpio+bounces-30891-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOg5JQfxcWlKZwAAu9opvQ
	(envelope-from <linux-gpio+bounces-30891-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 10:42:31 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DD03F64B28
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 10:42:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3B68D80ACBB
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 09:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E633A328B58;
	Thu, 22 Jan 2026 09:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="WMmVf+cD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B8E30DD3F
	for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 09:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769074548; cv=pass; b=Ti8b/wgXrBV34qioCJmVlmYr/Szdn27yWANLteZKYUNST0kDr4n8q35lRJGoaCqgJjjAPeyAqxrs/bHyMQLx6BzPBSkmEW2Kq7Ih4kxRd/wqtSFt++XVYQBGJdERbgENeAxNmStQSxjlIcXNxSm93bhkZNyKaPWMMC+5+JzU9vI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769074548; c=relaxed/simple;
	bh=CpowxPIs9WsIvTj4/MuMW1Y5/GmzHzBIUQWzh9qqtsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mt0dPe118CMePcrFe5IitdVxRQAoDRXTHgqwJVS+G4d/nls2G+M9cBQ5h1IB6bY9kZGz8IjVpyJ9w6ytEI4ecXbsPF9EDB10ICEiLU2FAIddAw41qxhtUIj5QB3rLi2jSiLXFNuAewNk6vE/6DHTixfTcFbzm/ZJBCyyvNXoyBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=WMmVf+cD; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-65807298140so1141737a12.2
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 01:35:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769074545; cv=none;
        d=google.com; s=arc-20240605;
        b=V2DZSA+q3wmf+Wv/7fDZBdF9ha17m+VzroifYiMp8fDLVDpDvIgOK3+A/XxkgtDmGW
         d0CyGZyupXQTrepxqyjOdJ56ysJZWnRUMXsJec2F8n92G6sBdRzw2/F96RJQttQ+21CN
         fe+pVbB6eYfEEH80C0q+uOMnQ9o09II7zCvEd0bW3Xqp/OHCdUBjw4rCQyEnPK9VaR0y
         vREiI5s3rNHNDCM8IJdxW/m9wLM3MhuPU91szWz0ysOjGrFP8Uu4Ht+Fcd+jjbOTFSqE
         79Y/fgvlMqC10zHtxJeZLSjagAZC27YWb6BkgDBfhsT4U1t+yD1vRUZo4e1bFykQrWrL
         oWDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CpowxPIs9WsIvTj4/MuMW1Y5/GmzHzBIUQWzh9qqtsQ=;
        fh=wMPJr2lK6w4RHAd5s5iVYB9Ax6Cuug6aZ1csySRFAkM=;
        b=IQx/UOTebSTbIsgNW9V6PwCi3+yPHh6nZAMh3kY3KyxP2cblV60dDK/TuktVf26T5X
         VjoVKmaeE2TrjXnf4EJoPT/G4X+mpoR4kNarRqYgKe5oL1n31q9SYvHTLXDta4GT1IBe
         0D5rIO6hbJwwCM45WNmfpKB9XgRy4wti0AaJTunKyb25OE9HgvoSF4xk3+/SMPHw8k+u
         bRiZj2oy6ciOIf2DBAc0kaxQxSypIirE63nrODFHYnL7VnmoF5qfEkpkCBaisp6tmIWe
         v8EBrHdcI0AOB2vzW53iVcO0QTGN9bKpvSH2DB0c0sNZl6o959jvFFq1bjftNgY7gGYK
         TWQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1769074545; x=1769679345; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CpowxPIs9WsIvTj4/MuMW1Y5/GmzHzBIUQWzh9qqtsQ=;
        b=WMmVf+cDPVXyzKm73nlXhVqX/GgwBPysyw+V8fdoMVElEaKbT5iIB+JX6bg1SMgNHp
         BZ/xpZLXmDtL49wkbLH6Qe5t/c1FlVbMBwB35Yj2bfbomiTfVmmlbRHxUoEZR/oQWck+
         Be74nd4grwTHoU8lZrxh7rK5Z11b36UuyBJ2+hjYl8aOJ18c08LpQdSkzjpNZL7dXtFS
         T9v9pdYZUJX2F6R2ZKeQUFJ7x2iA+DdPl0QupDzrrWAwUT1dVBgpkasAEVxZ/M05ccks
         CyBCrEYEw1asEPFNKbUBuBO1ZPFruijEtPlo7DqxHXrUhxmMxMlp5rmrVyWYwRFOfOVs
         sNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769074545; x=1769679345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CpowxPIs9WsIvTj4/MuMW1Y5/GmzHzBIUQWzh9qqtsQ=;
        b=AWuqEYOzZdqJj9+HFwWGqNhgEL3WO6few2PfmsVgEh6MfnKjjemq2J1xPx/s0sVXjp
         lD7wNNrp9jzb829EQIgqKKlp+qAbLuSaQiLli78euU3YmD9fcp0LoFZA0EPdOD5/hcw6
         Y3mEY6MtHDPmXbVFXQUVT+k2U6TCwGh4rcYW40Sg3s2U8ngz3Jx/xVCDVHlaobMf5uvE
         ofSfqbR2i6Obe4A2PmRLNse1UeaG4M8LHiEGi5Gah60ZdZLpnJR7Cv/dksRO4sCAflaC
         0osaRZizEk7by0FqvuzM46Goz7S8c26FIAmcTgqGxXk5iIG6BxZmYqRQPQzNWh+rHInh
         WDvw==
X-Forwarded-Encrypted: i=1; AJvYcCU1qEdczgqhO3dK+577UHVllXH1nAcEGm0Bear9EssEZQd3rE3+MjAeEr1TrIo/z67H6mvXOV+3+nD7@vger.kernel.org
X-Gm-Message-State: AOJu0Yw97+4qI4GYF2QYzo0LqHT8rGA4++F7LSHhgT7lCkazaqUgzB6G
	NRKXwpOFHJG9STeC/HgzlgBhd7j0nxZG5jQpv51AVeo4O0C6NDx/bGam0Z2frkUTjaSBjW4zvoo
	TNVKZS1UkFum2KJoKIP3uZfAbbwm/+Mjcs57xgZaEJg==
X-Gm-Gg: AZuq6aInZmrEnzEvimKUJBECB8vhQ8A/N65mY1mTn6cm9tP39SyMjGOHM6wH7jyVvOb
	10fIIixHLrECBU+p8/fKKoq63BEBpoXcqrLedN8h3TN+lzlHmEV596NomMPA7KIHB5UlOvBaEbe
	WlfWeblT4XMNdQNMeOarL/cShLF2icQJWFLKSRDX+v3Qr4NHMI4RbpRrVnCGQ6RABQ9SCKqQhup
	poxTx/9kpaaXmUPYa2me+MT96mfrdmjmdBHKdXuGC/zz6a07fYLdjcwIo+LHQbLkTuxA6BNMnf5
	FLkewTeKDfdG59UdFk3IYcI9eOJRH8FkEjOESwhtMWgQZQO+l0PmLOeEJpo4cg==
X-Received: by 2002:a05:6402:f02:b0:658:1304:b68b with SMTP id
 4fb4d7f45d1cf-6581304b771mr3388171a12.15.1769074544348; Thu, 22 Jan 2026
 01:35:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115114021.111324-1-robert.marko@sartura.hr>
 <20260115114021.111324-7-robert.marko@sartura.hr> <CAD++jLmitNVhWmUf9BBqLR2_WsAR7V-+ykVJsLK3MuOSUKQF0A@mail.gmail.com>
In-Reply-To: <CAD++jLmitNVhWmUf9BBqLR2_WsAR7V-+ykVJsLK3MuOSUKQF0A@mail.gmail.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Thu, 22 Jan 2026 10:35:33 +0100
X-Gm-Features: AZwV_QgGcZewelkI3QjoxNf_Rdp39oV_bH_54mEjrqvn-sBMKJLuqze3gq5di5o
Message-ID: <CA+HBbNEw_9FNOFxx8Mo63Aq49MxWvvuQ4Sc75mXFYpwtMmETiw@mail.gmail.com>
Subject: Re: [PATCH v5 06/11] dt-bindings: pinctrl: pinctrl-microchip-sgpio:
 add LAN969x
To: Linus Walleij <linusw@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, herbert@gondor.apana.org.au, davem@davemloft.net, 
	lee@kernel.org, andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, Steen.Hegelund@microchip.com, daniel.machon@microchip.com, 
	UNGLinuxDriver@microchip.com, olivia@selenic.com, richard.genoud@bootlin.com, 
	radu_nicolae.pirea@upb.ro, gregkh@linuxfoundation.org, 
	richardcochran@gmail.com, horatiu.vultur@microchip.com, 
	Ryan.Wanner@microchip.com, tudor.ambarus@linaro.org, 
	kavyasree.kotagiri@microchip.com, lars.povlsen@microchip.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	netdev@vger.kernel.org, linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-serial@vger.kernel.org, luka.perkov@sartura.hr, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[sartura.hr:s=sartura];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30891-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	FREEMAIL_CC(0.00)[kernel.org,microchip.com,bootlin.com,tuxon.dev,gondor.apana.org.au,davemloft.net,lunn.ch,google.com,redhat.com,selenic.com,upb.ro,linuxfoundation.org,gmail.com,linaro.org,vger.kernel.org,lists.infradead.org,sartura.hr];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sartura.hr:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robert.marko@sartura.hr,linux-gpio@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[sartura.hr,reject];
	TAGGED_RCPT(0.00)[linux-gpio,dt,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,mail.gmail.com:mid,tuxon.dev:email,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: DD03F64B28
X-Rspamd-Action: no action

On Wed, Jan 21, 2026 at 1:44=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> Hi Robert,
>
> On Thu, Jan 15, 2026 at 12:41=E2=80=AFPM Robert Marko <robert.marko@sartu=
ra.hr> wrote:
>
> > Document LAN969x compatibles for SGPIO.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>
> Should I just merge this one patch to the pinctrl tree?

That would be great as other bindings are slowly being picked into
their respective trees.

Regards,
Robert
> Looks good to me.
>
> Yours,
> Linus Walleij



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

