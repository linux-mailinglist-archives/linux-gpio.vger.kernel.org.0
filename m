Return-Path: <linux-gpio+bounces-36419-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Lj/AMwi/WmGYAAAu9opvQ
	(envelope-from <linux-gpio+bounces-36419-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 01:39:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 719F84F02E8
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 01:39:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 89ED5303E101
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 23:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1803F372B5A;
	Thu,  7 May 2026 23:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QvtxiuAs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE6D370D55
	for <linux-gpio@vger.kernel.org>; Thu,  7 May 2026 23:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778197190; cv=none; b=me8Dk7RY7MVj6fOovt22ERLTPt2GlE2vqC1WY4sUgN/ii+gUPKSjoRoaJf81fEb78r+dqpx2eT4a7K4Zxc1DTCg+m8FuWmFH9JbAOiV1lM5hjpF5ZSvtegX7ep2N9aIVbK+GmkTsf68HfntsEKhxEdMvluAMnFYWGk90LLCZoFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778197190; c=relaxed/simple;
	bh=vFH+WCKmJFo+oFxj5WEkyqvJ7Aj4l64pwYaHYcrT4og=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V4cLHbkJxgnJcUsZzh3IHebhHyj1PesKkFiJ2mLxjVY3sA2rUnVWA6vz1Wk4mpRB3jukUEW4/ar8GNSxHAzi9xG+hpv7jquKOz2l/VRwi1Uhx9sWZUTAIjjzmI8KhJkh/NDOrgiXiyZD1IQ5TLi8rtp87jv5fRBZ2HKYTUmlBV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QvtxiuAs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5C7DC2BCFB
	for <linux-gpio@vger.kernel.org>; Thu,  7 May 2026 23:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778197190;
	bh=vFH+WCKmJFo+oFxj5WEkyqvJ7Aj4l64pwYaHYcrT4og=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QvtxiuAs5eVQPns7jJlqtGTfdl0EJbsvK9NI8npq8OMLSMiSWuCojWaz5XpXCmsan
	 Wrki/Tmn5sP1n1hrh9a2tAMgBvgvMEetyZYlRhkxOrQVeYBuNqQAl5EXhaTsb/gSNR
	 N3tDJQnEgUpi+Ise+Rk6oQ7UnD9f6R7jz6KRO3R1A/xImq8iYtkSFjrHRyKlIJgIL5
	 ASW+UJLGkyWDkDPCeYIjie9iYtMbF/4k/99cseI+aVLIVKfYiQesyhpsoJ+guYxgOD
	 it0716QbosCqZPJKCq+d0pprmnZzhD3cOjygZs+ebux/Q4N4ntZL4+fwJKlOkXvmkE
	 QFWR3BZF83oDA==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-67e2498f3a7so2005734a12.2
        for <linux-gpio@vger.kernel.org>; Thu, 07 May 2026 16:39:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+cBLYxgHXp5/5JyiRp03e1IJZV2AGf33VZi8HL7LegSc1O95IW/q8INiYPNsaErPQqsj4Nq2EZZnfK@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5GbBdsXDZSlnjnxqCKbYjrN55gunFNfMZG6xA23vqaZZ/jkJF
	d3iwEWUcqsZLJWSo46NywP4pkT76f4UVRsq02sIXhYlB4/F8zJ4C94QFM6g+YPWcxFWHsO87VOI
	qvj/6rcyxPzLpMt78awsMXGZfeD2Irw==
X-Received: by 2002:a05:6402:2113:b0:67c:1ed6:2793 with SMTP id
 4fb4d7f45d1cf-67d648a74e5mr5797376a12.22.1778197188726; Thu, 07 May 2026
 16:39:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260501155421.3329862-1-elder@riscstar.com> <20260501155421.3329862-9-elder@riscstar.com>
 <1f34cbce-e2dd-4e80-b136-55d0efa50002@lunn.ch> <967c1d96-9a48-48de-b7d9-58b63e782aee@riscstar.com>
In-Reply-To: <967c1d96-9a48-48de-b7d9-58b63e782aee@riscstar.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 7 May 2026 18:39:37 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKayEDa2-FDoxM_JU3Yvevd-Gs_eFKCQ8NY8A8oBsD13w@mail.gmail.com>
X-Gm-Features: AVHnY4K23N33ivg6cLD9mNxL7odw3uUNL3DiEAJ7jfws_C2Zwld0dAM-keay8pI
Message-ID: <CAL_JsqKayEDa2-FDoxM_JU3Yvevd-Gs_eFKCQ8NY8A8oBsD13w@mail.gmail.com>
Subject: Re: [PATCH net-next 08/12] dt-bindings: net: toshiba,tc965x-dwmac:
 add TC956x Ethernet bridge
To: Alex Elder <elder@riscstar.com>
Cc: Andrew Lunn <andrew@lunn.ch>, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	maxime.chevallier@bootlin.com, rmk+kernel@armlinux.org.uk, 
	andersson@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org, arnd@arndb.de, 
	gregkh@linuxfoundation.org, Daniel Thompson <daniel@riscstar.com>, 
	mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com, 
	alexandre.torgue@foss.st.com, ast@kernel.org, boon.khai.ng@altera.com, 
	chenchuangyu@xiaomi.com, chenhuacai@kernel.org, daniel@iogearbox.net, 
	hawk@kernel.org, hkallweit1@gmail.com, inochiama@gmail.com, 
	john.fastabend@gmail.com, julianbraha@gmail.com, livelycarpet87@gmail.com, 
	matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com, 
	rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn, 
	weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 719F84F02E8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36419-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	R_DKIM_ALLOW(0.00)[kernel.org:s=k20201202];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_SPAM(0.00)[0.695];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_GT_50(0.00)[50];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.105.105.114:c];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,mail.gmail.com:mid,riscstar.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,1c:email]
X-Rspamd-Action: no action

On Thu, May 7, 2026 at 5:17=E2=80=AFPM Alex Elder <elder@riscstar.com> wrot=
e:
>
> On 5/1/26 12:38 PM, Andrew Lunn wrote:
> > Why not add an subnodes for the ethernet interfaces?
>
> We will define "ethernet" devicetree subnodes of the PCIe functions
> in the next version of the series.  Something like what's below.

Are they PCIe functions? As in bus, dev, function addresses. How to do
functions is already defined by the PCI binding.

>                                         -Alex
>
> pci@0,1 {

The 0 here is devnum and the 1 is function.

>          compatible =3D "pci1179,0220";
>          reg =3D <0x50100 0x0 0x0 0x0 0x0>;
>          #address-cells =3D <3>;
>          #size-cells =3D <2>;
>          device_type =3D "pci";
>          ranges;
>
>          ethernet {
>                  phy-mode =3D "sgmii";
>                  phy-handle =3D <&tc956x_emac1_phy>;
>
>                  mdio {
>                          compatible =3D "snps,dwmac-mdio";
>                          #address-cells =3D <1>;
>                          #size-cells =3D <0>;
>
>                          tc956x_emac1_phy: ethernet-phy@1c {
>                                  compatible =3D "ethernet-phy-id004d.d101=
";
>                                 ...
>                         };
>                 };
>         };
> };

