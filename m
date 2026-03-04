Return-Path: <linux-gpio+bounces-32479-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAdOJm8jqGl3ogAAu9opvQ
	(envelope-from <linux-gpio+bounces-32479-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 13:19:59 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2AE1FF9A2
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 13:19:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 46CB5302A7F0
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Mar 2026 12:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFCAB371D0C;
	Wed,  4 Mar 2026 12:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mPGS7qcY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5106F3A8728
	for <linux-gpio@vger.kernel.org>; Wed,  4 Mar 2026 12:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772626785; cv=none; b=eG3WTrengcRBJNWoUcApWLZDAm7uawnudsEN77DWZiBCe5XXFQXOnSqLw/ROMbGC0gOs2c6taD0OjcX9Sk1+57pGcvw51bNiHf5ntbcHvM0Doe/SUk6iFn3mS3gYRrHMgrq/5v0muQZ3kS+MkCi4AyE7Rq4AGu9bo/RsZVgYL0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772626785; c=relaxed/simple;
	bh=8jaB9xhr+C3taJqbbWa5n/w0SjBdD0Ab/HQmNKTmf5w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DX6b6OcXbr9LnVGWDJGouT+DlCMDB+O6nH499FQMrk5dh63jlNpAUh4iJTjhd98cmsG5ytp9fqkXyP+nur//F9Eh/CfVx8a50WZcHjz7qoXvYCtN6dsZ/YahSulGtP4ysFNuimmV/H1ucFwOj40NRMuVPQ8cUk2RhQqZtq1Nxbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mPGS7qcY; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439b790af67so1934076f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Mar 2026 04:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772626782; x=1773231582; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FrV9cbgp4wuO7j5QZsaUWjFR+kDOuc1YVBeslenYsE8=;
        b=mPGS7qcYgizPq0GUZEFxBiiZXF7J3p+av3wLK1Y+kbcw9Zz4Hi0XPDjE3MnudZb42x
         5MYVxuHHhzpxS2V1aHm8eI+I+0Tf5qIbElxaYYqDPw6Ax73zRmJwkyr+Nysi17c3Rppk
         z3its7D8ypyaT2gg7RKuZ41epVo8umsilAbjwI+JvMbz8QZq14KK19EBTMSgtt/4ZcgC
         RYnH2xIRZK5G2+Nmim/vXEx9EZPOcuBR9n/t2usMiuG9OyopEW+fTr9+MOhZbKj7JXvF
         B6GNfEdf4hIXoIOf9zT71etn5a5IE6Km6u7TwlZNblgB6hj/NClk9fd81to/W49WEJLt
         H5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772626782; x=1773231582;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FrV9cbgp4wuO7j5QZsaUWjFR+kDOuc1YVBeslenYsE8=;
        b=O5XtFuGkPHxkfoUi0UNbfT1JoeG3yZG7b02w05i0coMMDzGvIRcxHufXyBNptRdapf
         Jwfa7SLgX5s6rYhSw7z8Vbn6jlPtCDidCG5gxHaUIOSpqKV0WL4XCXrFREFYUN9FFCpu
         mywmewJTGR9YbbpJ0BG14GezxeRVoJ5t/U2Yku972mhPpC75wRMWgejRNvgrU7Ty3/ur
         +M+PAnlNW10R5k1VgZl6tmy/C8XID4EI0oyBRbJsK4j3KpJYIaIYXt9BEtU49SphFqBE
         40IFBnKMUhJ/q+KA/jt80VBX5CUMYjg8Ki/dNFaldiKlm1shoc+MD5G24Dpf9XKz/iLx
         zr5w==
X-Forwarded-Encrypted: i=1; AJvYcCULwp0rWbyH0QMa8JwAnHoVuQMV0CHTgb1qtPN0VMyjOJS56B3UEDAITOB+viGBuMwkZD7j0PS/rpCI@vger.kernel.org
X-Gm-Message-State: AOJu0YxUFZqNkRdeaDf2oQwBuzjRs22BS2vDmYOnermUkqxwH1I82sFR
	nNrHHB3oflciyO34Nakjj8LpHsOy3SLjbGdFPkJ7UD+u6PDPWshryblDAF3IFv/J
X-Gm-Gg: ATEYQzw98/dDvWGUesgExnK3oxOQCDlcLT0Rod1mM/fLvtkZ28vQ2MnoR8a6fDUl7BL
	sAorNxsWsZkrcHeKvs/+zvAOpbBDSBZhPc/RUdlnUiO2Uk07WBg0tR15HGbWB+ZM/2gSZ6fUnTF
	KHHaszM4zJi/13wO36VlMDeK4KoSywCZCEQHCk78s8JGlEuitTxvzb8TNhZvEbH5THHBoXNvrmV
	ndbA9Fc2EbCN1xNQYLvqTR/n9btxbx0ciGwpRm+1NGa42xFs9gj1Ln0VfHE+9MRh3PzF5P3APeC
	HtsBQf0YBRYFBAIX/lLa7SrL6bMOOFXeHqnBDyTTIw7I4Sl7I4OpwuSc5cFu1fO1Sq0QvjPug6Z
	nuMCDmL9oyboxuuoY4qit4UD878mCoylEFFHdporY9oGcXrdX1YhETk8vpMYv7Uu8r6nteL4xKD
	VYuIdZXwz1SpZylbVGRJGE6A7a5KRQerY=
X-Received: by 2002:a05:6000:2912:b0:439:b9e8:635f with SMTP id ffacd0b85a97d-439c8a9f004mr3065699f8f.21.1772626781522;
        Wed, 04 Mar 2026 04:19:41 -0800 (PST)
Received: from [192.168.1.187] ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b3cc2e65sm27010827f8f.2.2026.03.04.04.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 04:19:41 -0800 (PST)
Message-ID: <f3fa4c490a61c4544fa93682f3dd18e0f98b8473.camel@gmail.com>
Subject: Re: [PATCH v6 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: kernel test robot <lkp@intel.com>, Nuno =?ISO-8859-1?Q?S=E1?= via B4
 Relay <devnull+nuno.sa.analog.com@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>,  Jonathan Corbet	 <corbet@lwn.net>, Linus
 Walleij <linusw@kernel.org>, Bartosz Golaszewski	 <brgl@kernel.org>
Date: Wed, 04 Mar 2026 12:20:25 +0000
In-Reply-To: <202603041109.HFnPWnj8-lkp@intel.com>
References: <20260303-ltc4283-support-v6-2-efe11502fad2@analog.com>
	 <202603041109.HFnPWnj8-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 9C2AE1FF9A2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32479-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nonamenuno@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,nuno.sa.analog.com,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,01.org:url]
X-Rspamd-Action: no action

On Wed, 2026-03-04 at 12:05 +0100, kernel test robot wrote:
> Hi Nuno,
>=20
> kernel test robot noticed the following build warnings:
>=20
> [auto build test WARNING on 78558965440b27814592ec82d8f3668395953b1b]
>=20
> url:=C2=A0=C2=A0=C2=A0
> https://github.com/intel-lab-lkp/linux/commits/Nuno-S-via-B4-Relay/dt-bin=
dings-hwmon-Document-the-LTC4283-Swap-Controller/20260304-010255
> base:=C2=A0=C2=A0 78558965440b27814592ec82d8f3668395953b1b
> patch link:=C2=A0=C2=A0=C2=A0 https://lore.kernel.org/r/20260303-ltc4283-=
support-v6-2-efe11502fad2%40analog.com
> patch subject: [PATCH v6 2/3] hwmon: ltc4283: Add support for the LTC4283=
 Swap Controller
> compiler: clang version 20.1.8
> (https://github.com/llvm/llvm-project=C2=A087f0227cb60147a26a1eeb4fb06e3b=
505e9c7261)
> docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
> reproduce:
> (https://download.01.org/0day-ci/archive/20260304/202603041109.HFnPWnj8-l=
kp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202603041109.HFnPWnj8-lkp=
@intel.com/
>=20
> All warnings (new ones prefixed by >>):
>=20
> =C2=A0=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [docutils]
> > > Documentation/hwmon/ltc4283.rst:258: WARNING: Blank line required aft=
er table. [docutils]
> =C2=A0=C2=A0 Documentation/mm/memfd_preservation:7: ./mm/memfd_luo.c:13: =
ERROR: Unexpected section title.
>=20
>=20
> vim +258 Documentation/hwmon/ltc4283.rst
>=20
> =C2=A0=C2=A0 256=09
> =C2=A0=C2=A0 257	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D		=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =C2=A0> 258	power1_failed_fault_log		Set to 1 by a power1 fault occurring=
.

Arggh, will wait for more feedback before spinning a new version.

- Nuno S=C3=A1

