Return-Path: <linux-gpio+bounces-35949-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id bZO+IDzU82ku7wEAu9opvQ
	(envelope-from <linux-gpio+bounces-35949-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 01 May 2026 00:14:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6574A8725
	for <lists+linux-gpio@lfdr.de>; Fri, 01 May 2026 00:14:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0ABBD3006B50
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 22:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92EF539F164;
	Thu, 30 Apr 2026 22:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+OQ2IUB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A783822B1
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 22:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777587257; cv=pass; b=XCW8RhDf278HSv0WoawTiQNLWsFF4EnJgsamZcsWHwYayWL1bPJeYNXZoPw81I30TRTYqzSOQoGXfjfnTw+vA9vxinYALrVQ0O0Ny+w3/LDInONviH0cufXBbeAcc+/Cr3Fg8knQzm/h/4oY0P2AlXildPj7uBo1rHtI+5kbk+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777587257; c=relaxed/simple;
	bh=fnkadRgpeprmtKDbJ+PN8aevRiS6O+5ljTot5EgQs4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bZL450KEOLQABzliiC5Hn+8dyo7VoDzmxl7tht2SdhZFkcqJNzQ9sQaQEGRVzmZ+9DWIZnfVVH/A9N+BI4oFhi00W+lmQMFooDYS1XUx4LAbm2aRMwEs0zSee7XCsRuoTx6ClYJ7ATjxibsvzeHfG2RkhfE8eBvkRONNk/0yYTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+OQ2IUB; arc=pass smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-60fbbac2938so700127137.1
        for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 15:14:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777587255; cv=none;
        d=google.com; s=arc-20240605;
        b=U3ZIaq3OuNj5GbEspqyULIr0YT0aVrfDxLbUJQ3/B/7cxNJzzz2g1D96f0WkjTWESQ
         jAuoruQ++dByqraEU4TannECGZT7/Jllx7r1Swy375bCmPAxug3BJz7Ss55BCn6u1tCW
         ezJACLP8Zde24VkLXygePC2ssrL55YP9ZC8SN1sTuK5lBAMnmeTwL72u3a9ZGxfD8H4Q
         T33paKMOZ/yhk471QTHseygW89BmVXje3ygNT2muYPrIIadYpjJWFkHxb0M39Corcrg8
         Tg68mKZ/RKLfhpsMl7LKPP1qPN4S5v64T96FRv3Mr6tF1jFOSioo0Z+nZF1AuEe1oJPx
         TK/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fnkadRgpeprmtKDbJ+PN8aevRiS6O+5ljTot5EgQs4A=;
        fh=Q8aijUgRP3JnleZWf3fak7RuNB7GWlbI2w8Mii3gU+4=;
        b=WMqPmQR0IrgxN/3bKgjgA4DbX851b96mk8U+sNHDF4ZURsebmvDn4rJKuKeHpNv8iw
         3SMCtkR75VN/0WQwl2OdUY4q7oSq2nz7sQ5GpglbLxeD5gELgDJlcN5/delGFUP48hnp
         UMdUs2oUGnlJT+J/khi8Ivioiv6bYeiKc3Tghddrf+UKRhSFyZt93UDf6dOeYsoL4Ol7
         Gnl0Erqh/3rboPUAxZgR11mTlBi4jQC3hqolg8Z9J/F7lKD6pK0VK7V8SdeEgxW3tBPX
         VpSXzffMPFbvUyvyUeu27PxstXLDkoPFSBBQLh/9ECrDt5zdB7UOJCl8LT0CyinL2iMH
         U+ew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777587255; x=1778192055; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fnkadRgpeprmtKDbJ+PN8aevRiS6O+5ljTot5EgQs4A=;
        b=f+OQ2IUB75xn3Gcbzrrh4t7gQ6yWlx9uxWjL6qYyehudpAnrieew9rB1v+mmzGZT1f
         LKr/1B+Ss5QFQiVZ9roRKS4/Xv7KB+J0zAjqn0bNWlFL3CgI8iheT8IPCnjtIgnHe0IT
         adQN7Ppl37kep6uf0SqWhtGhwBmfS1vSoGPt7cmXZhH/HNo8vnBLOSDcFHqGkof8la6R
         7zJOt84/TuvYwN59vjodsBsB0o2GjR3edXcjVkI1UVTc+YASf7LgzrHIj7QWJzVXankD
         C93/BwD1Pb3EJ9Af/0cfJmaVZ+T2+F25VaAI5dxYt8YTu+kJjdl3BAPufpaEwbn8wdra
         ildQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777587255; x=1778192055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fnkadRgpeprmtKDbJ+PN8aevRiS6O+5ljTot5EgQs4A=;
        b=LbXYT3Wt1cJnh1xEXl6LEpf6juisi/y7h5/kPDSck6/h7JMQJzhdjVnnFWCKeeLacL
         hbxqKOHC9xaROHrFlLOcqyI36b4PzC+hPyz2Au6/0GUDH5ElfF89b5voHtSoeGOQy6bF
         x0AYmjr92S8GPXt87PAH4sScHIYT0yN8x0ZLJeXUpUUOXt9GMJ0p4HyfQuKSgWkDrY9c
         1qyjYjEGP/yZ7gXIgrBv+hJWWh1yNPc0Rp9joia5JPkF76Ufim4e0AZlMvCxLJQugnFI
         iDa/2SE57AFsltOWZ2ZnJYriYycSs0MRrULZLqAJOOreZC4x1tcKOjWfgu8ZiEZ70qNM
         n1pQ==
X-Forwarded-Encrypted: i=1; AFNElJ82w+68JQu+VLrhY8w5USjQfY7SP1DOvIZl3tayFg+FZ3yURH0QYbWwth1w/3VtDBrZcoSkThmtvA00@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3ZehsiKXhuhBdoCOS7NqicSZZuYrirXq+hcaK7m+8itQPC2ul
	/xjk7XIQ6PW4RKTJzOfmGHCmkwp0Ue7vt+XF0yMQD+/b/cDBxkEjBePxx080EWgjQqOrS6G0nGj
	LXU99uxKeGRumoFeqOlKWgC5LNxYIaP/U+art6H75qg==
X-Gm-Gg: AeBDies0B9dLe5hS1tCf75mzoVZMn3mHjaucm2mh9eR/nkAPiLXKjYVD3tLMDwN1mJJ
	8PbsIaMZJVoIw0OBqWj4UwoXmtziSfrPTbV76wwaRXWw7+K/S+zP+X0AUTA93iIWYxI0iCH0ddM
	OXzYsOyFpvsB7AzEVFAjPhFOdubcXPRt20TO90CHBLhq+6Qh1buWPYfttadbggStv+TjPLMssUT
	dPgBlST5YCz6KPnlKaSgmEczgRxFJnLZ+nmYiPUQUjaoXw8hxhhZAAISKC9woHDfD3RMHJkQfxT
	NU/YyZRyA1Aehz1M19XRaoNaReYCZH/9hindsWcETVNurhNFo08vI0UU4ZtL
X-Received: by 2002:a05:6102:38cb:b0:618:3503:5663 with SMTP id
 ada2fe7eead31-62c33007bd0mr347932137.8.1777587254750; Thu, 30 Apr 2026
 15:14:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776872453.git.happycpu@gmail.com> <20260429035134.1023330-3-happycpu@gmail.com>
 <CAD++jLmOO2UmBUx0CseCnrK_Dyw1O=MbeXzOmvuvSSnN12Vchg@mail.gmail.com>
In-Reply-To: <CAD++jLmOO2UmBUx0CseCnrK_Dyw1O=MbeXzOmvuvSSnN12Vchg@mail.gmail.com>
From: =?UTF-8?B?7KCV7LCs7ZmN?= <happycpu@gmail.com>
Date: Fri, 1 May 2026 07:14:04 +0900
X-Gm-Features: AVHnY4JkbRdIMPXcavkf1aKOaenr3awK6baJ6X0mHvd_uKOoYJ4bVrDtc31ZKyQ
Message-ID: <CANh86Rbrza8Txh2QAPZ5LEsfHW9V2L0o0SdyszdA_=f0Vs2ykg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: 74x164: support lines-initial-states for
 boot-time output state
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 1C6574A8725
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-35949-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[happycpu@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,linaro.org:email]

Thanks Linus, appreciate the review.


2026=EB=85=84 4=EC=9B=94 30=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 9:09, L=
inus Walleij <linusw@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Wed, Apr 29, 2026 at 5:51=E2=80=AFAM Chanhong Jung <happycpu@gmail.com=
> wrote:
>
> > 74HC595 and 74LVC594 chains retain their output state from the first
> > serial write onwards. Today the driver always kicks that first write
> > from a zero-initialised buffer, so every output comes up low until user
> > space issues a write. Boards that rely on the chain to drive signals
> > whose power-on state matters (active-low indicators, reset lines, etc.)
> > have no way to express the desired initial pattern via DT.
> >
> > Read the optional lines-initial-states bitmask, recently documented for
> > this binding, into chip->buffer before the first
> > __gen_74x164_write_config() so the chain comes up in a known state on
> > the very first SPI transaction. Bit N maps to GPIO line N (matching the
> > nxp,pcf8575 convention); on this output-only device, bit=3D0 drives the
> > line low and bit=3D1 drives it high. Property absence keeps the existin=
g
> > zeroing behaviour intact.
> >
> > Suggested-by: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Chanhong Jung <happycpu@gmail.com>
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
>
> If more users of this appears we can start thinking about brining
> the support code into the core gpiolib but for now this works
> fine I think.
>
> Yours,
> Linus Walleij

