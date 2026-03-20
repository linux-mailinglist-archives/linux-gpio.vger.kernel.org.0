Return-Path: <linux-gpio+bounces-33920-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GC2nCUxLvWn68gIAu9opvQ
	(envelope-from <linux-gpio+bounces-33920-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 14:27:40 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDE52DAF32
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 14:27:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DAE4A3022FBE
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 13:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E499D259CB2;
	Fri, 20 Mar 2026 13:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sCVjZ5hE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7890346E43
	for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 13:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774013253; cv=none; b=IEI8In50Zsd7nMMMlN0eX4Wm4flSE57EPbQH8IrlYL42NdF5ADoUn45Uv+EoiS6JLAoVYCizEM/QzO1559HRXEIppzbjwTmdZEFJg1HyglTShMgxAaRda5SoMrDGqvhmU+Xs/WZKqTrtDYbseW82QHOYRjJaQFHJBPLm9tzFz4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774013253; c=relaxed/simple;
	bh=fSdC6nRI2uCqIhg1u1XGagrxET9dRdNdAdm1QiCl1eI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bx0aVR/vSL9x18UpQX3FKVjMo5S7m+RjskLENUDf3cpSEmQAXqgkdlnt0SmxzGumYum+Fl0kcRjf1CsADwS7a8HIJX6EZE/+TP4vtE2V1ZSvSwggT0Xfs0BlvDn4QHpmgmzJf925dbihGmEsyoU2RbDVU1Ti+TSGqJcimCtTQqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sCVjZ5hE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CB64C2BCAF
	for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 13:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774013253;
	bh=fSdC6nRI2uCqIhg1u1XGagrxET9dRdNdAdm1QiCl1eI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sCVjZ5hE48RUAtyuqBoHt3kBIF383Naz5B11gttywCAe5Bm2+UdC7ha6oZ/Tb97i0
	 7aq5D/5cPrDQcaz9290jfUlHPIpmVi4KKf5XAtmOAxa56YOungAWI1b91XDCkEhqv3
	 t626heyEM+j4UmLfmAw0ITqz7/l8k3VpUQgbEfnOqWQHHnT0QyR+GBauEHhApeHFxY
	 Ymo6xEVkSLJtHjpaX0o7lP00L+NXKZjlKJmsmmdLQm2Bzu9pQC+AsFy7dehCYwAPCq
	 5iAqMHc7fn2/H5gaZN62ugi8VK2RcNVgHSAaTU3gkBhpqyscEZRdeSS+3ZGSWGWwd1
	 qAB3o8eqOjOPg==
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-79a75818937so5382707b3.2
        for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 06:27:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWueLLJLAbCtPVb9kLki8S+DAd4tq6oGWs6W/oqUEKUgItxPpgFbnd8cRcqcY+uoyKtfD4cj2QAruzt@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ2lwtvrIPzJQ0BnS0zBuXyfXM2oRKtCpJLMpxyjZbPciSNT77
	YhTXQXceXlelA96Wr8nDvR+a2xbR2wcluIrjtmg07chbcTiTR2L8CjSXnM629LBNV0+HKKWZa2C
	bBmDOFIs4nv2ZeG9CbKVPuIXK4nAwooE=
X-Received: by 2002:a05:690c:b05:b0:79a:51df:6a0a with SMTP id
 00721157ae682-79a90c39a45mr28260187b3.60.1774013252835; Fri, 20 Mar 2026
 06:27:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-pinctrl-mux-v3-0-236b1c17bf9b@nxp.com>
 <20260311-pinctrl-mux-v3-3-236b1c17bf9b@nxp.com> <CAD++jL=U2xNMMHk_LyH8CX+YpC5EGPVRasM11yesXSH4XLhqYw@mail.gmail.com>
 <absvZ5wzAwpbjHf1@lizhi-Precision-Tower-5810>
In-Reply-To: <absvZ5wzAwpbjHf1@lizhi-Precision-Tower-5810>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Mar 2026 14:27:21 +0100
X-Gmail-Original-Message-ID: <CAD++jLkp1CFcLccmLP0BWQSBKkruGCPT71dMeuyu3JY1N4T50g@mail.gmail.com>
X-Gm-Features: AaiRm51PUQY-ru1LXvqRM-CPXfn2OmCbeRvVURB1M-6XemqxSCR95oLy4VR6qXM
Message-ID: <CAD++jLkp1CFcLccmLP0BWQSBKkruGCPT71dMeuyu3JY1N4T50g@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] pinctrl: pinctrl-generic: add __pinctrl_generic_pins_function_dt_node_to_map()
To: Frank Li <Frank.li@nxp.com>
Cc: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Haibo Chen <haibo.chen@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33920-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.535];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: BFDE52DAF32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 12:04=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
> On Mon, Mar 16, 2026 at 10:37:28AM +0100, Linus Walleij wrote:

> > That said: in this case you're just adding a parameter, just add
> > the parameter and change all of the in-tree users to pass false
> > or whatever you need, these is just one (1) in-tree user anyway.
>
> pinctrl_generic_pins_function_dt_node_to_map() directly feed to
> .dt_node_to_map() callback, add parameter will impact too much.

Why do you say that. It already has many parameters, one more
or less doesn't matter. It's not like this call is performance-critical.
Just change the users.

Yours,
Linus Walleij

