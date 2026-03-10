Return-Path: <linux-gpio+bounces-32905-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EB8GG2Hkr2nkdAIAu9opvQ
	(envelope-from <linux-gpio+bounces-32905-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 10:29:05 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 03985248681
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 10:29:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 622AC3042610
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 09:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBA3043D51D;
	Tue, 10 Mar 2026 09:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CuAdMO0T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE2143D502
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 09:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773134937; cv=none; b=LdKujIB7+/pLbiKMEOsrP+cAkrF1C2+bEa61POrDDfYB0p/LJsD/bRHXiWSrWYdSGFSsLyntikZ/4cZCDrSJrgaQnYlXZyyi2BgRn9Q5UDfE042hwLL9ajcXchfSbdYAeAlavso5meJKRil1ivQIzDySitK8/UaV2gn12jgFBNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773134937; c=relaxed/simple;
	bh=sZaxe7E+Iri0Yj4ZeX/Y23Uobn7iJJUUZV9GAydph+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pv+EI9yVpnYAwOWFFixMmjub4mKu51rcu/Rmoyj/C7C/x6UjWuni5ExyztYjjjAemc/or1fEA3PQsvXYsAhuHtGRAYKVKeCzuM5f8/J1mR8JazMksS23bnG+z42WIavRPl4VlRkM/21Kbin7mwycp8dj9c9RCIGLuDP8UqoL5zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CuAdMO0T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4170AC4AF0F
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 09:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773134937;
	bh=sZaxe7E+Iri0Yj4ZeX/Y23Uobn7iJJUUZV9GAydph+U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CuAdMO0TU2BREyIbTlTvzg12VlLDCz9aJVBV4hiOzhEr6oyGITm0UAXhO6ZwJQDM2
	 CUg7uUBNZ2MRGFJrTybiu73YNd46mkm8VYsEMXEvs5u6XWMkE6Y4KOT0fMvdw2xfc3
	 HbXsPbLrhCEQhMQBeyLs53m0XnDsRFUH1mw8VZCRaWlg7dJa8ch0sGyGdzQkBkxG1D
	 iN3pIW1O/et8eji8F2wQaQP7pTANcOOa4MXmxVWzIDWemUeEHopTOL5o7RLE/xPd0e
	 xoxUq0uBhn1Bi2uHco4A2szqDuQdF6ZLTLt5tEhjfrDUCL7mschCdLaO3CGeygg7Rn
	 ZD3DDD77mdf8A==
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64c97997b0fso8922813d50.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 02:28:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWdaV2/FPLjHx2NGqExEArJhr35oG7Xp1CLD3ZnxG/rLSCrEPux9wi2CJdxYJziJgETS+wvT7qdPMhn@vger.kernel.org
X-Gm-Message-State: AOJu0YzLJWcp5O8p7AWY/TbVTYjOrAzPwKiTtzlGmV6sQLwKdbwR6YmM
	6pEOBxH2P5hpuCmclKuAO5GAS7J9ECoQQVvZMDak/aP+ACU736ZKjdk4wiLr7tL1SL2bFy6tZ8B
	OxTCjv9+O51hS4URjkghQSr1JPgFd11U=
X-Received: by 2002:a05:690e:c44:b0:649:ca5c:5990 with SMTP id
 956f58d0204a3-64d14316d3dmr13079461d50.66.1773134936582; Tue, 10 Mar 2026
 02:28:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306075244.1170399-1-eleanor.lin@realtek.com>
 <20260306075244.1170399-10-eleanor.lin@realtek.com> <20260307-purring-kind-binturong-1fcb37@quoll>
 <1baf65a11c26482cae4f7b54df1521c5@realtek.com> <af8aa42e-8ef6-43c0-9a46-173420ffe49c@kernel.org>
 <0ed4a4e5e25e47ca8f040ff4632ae0c1@realtek.com>
In-Reply-To: <0ed4a4e5e25e47ca8f040ff4632ae0c1@realtek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 10 Mar 2026 10:28:44 +0100
X-Gmail-Original-Message-ID: <CAD++jLn81uWf=3QchYHgfAqof9Wq_t8PEiKEJqezbYT0vCuEaA@mail.gmail.com>
X-Gm-Features: AaiRm53ys6zPtcAwL71zHshpZVqBa6i3gejjSIKMd2ptpnfhLQmIJqyYSNvWc2g
Message-ID: <CAD++jLn81uWf=3QchYHgfAqof9Wq_t8PEiKEJqezbYT0vCuEaA@mail.gmail.com>
Subject: Re: [PATCH v2 09/14] dt-bindings: pinctrl: realtek: Rename
 'realtek,duty-cycle' to 'realtek,pulse-width-adjust'
To: =?UTF-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"bartosz.golaszewski@oss.qualcomm.com" <bartosz.golaszewski@oss.qualcomm.com>, 
	"afaerber@suse.com" <afaerber@suse.com>, =?UTF-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>, 
	=?UTF-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>, 
	=?UTF-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>, 
	=?UTF-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-realtek-soc@lists.infradead.org" <linux-realtek-soc@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 03985248681
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32905-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,realtek.com:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Mon, Mar 9, 2026 at 12:00=E2=80=AFPM Yu-Chun Lin [=E6=9E=97=E7=A5=90=E5=
=90=9B]
<eleanor.lin@realtek.com> wrote:

> > > Therefore, changing this property name will not break any existing
> > > device support in the mainline tree.
> >
> > Yeah, but will break all other users.
> >
> > Best regards,
> > Krzysztof
>
> I understand your concern. I will drop the property rename and keep
> realtek,duty-cycle, but I will update its description in v3 to make it cl=
earer.
>
> Hi Linus,
> Although you agreed with the rename to realtek,pulse-width-adjust in v1, =
I
> will revert to the original name realtek,duty-cycle to strictly respect t=
he
> DT backward compatibility rules. I hope this is fine with you.

Sure, it would also be possible to support both, but that is maybe
a bit messy. Let's go with the old.

Yours,
Linus Walleij

