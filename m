Return-Path: <linux-gpio+bounces-36571-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCMqIjzNAWrajwEAu9opvQ
	(envelope-from <linux-gpio+bounces-36571-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 14:36:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0CE50DF50
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 14:36:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 487AC3032675
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 12:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B978D38E5ED;
	Mon, 11 May 2026 12:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pj9Kr8nS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7D129BD87
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 12:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778502942; cv=none; b=OtSvPqLnLDe7mCMIubnUoYOERBje2GYtEV50DppbBKOgguce1xi7Yt9tyU6juyQifF7RdXzET7dCJQlw9UhRKxKsptun+kSHAq37k6krEgJsWeRuNyoVCn93HZzPTDzQ5dk2laMtTKgLhkZAz2fXYCVqY06xmDx0oCH36GixeNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778502942; c=relaxed/simple;
	bh=YiuC223d0U5Qg6+CWRCJHkROXXXKPD5OsF2ncUq9LEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q9aaHUXwjZ8Dkn0zKV/1uoPd/lUDj4NA4l1a3wIlqLsdy11BC/VjdBFTuZypaK+kDZCZHwTHfcfa3bEzAO3z8wJjdaxqPPuZc6h29W/q4562SDGaIxqDbRaxtK8ei/BS1KfVUm19ngqHKX0UoZWraBrNEGz92f7CVANJtIIX+W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pj9Kr8nS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62DCDC2BCF7
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 12:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778502942;
	bh=YiuC223d0U5Qg6+CWRCJHkROXXXKPD5OsF2ncUq9LEw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Pj9Kr8nStLsVetiOSco2GGCMSl2FIe8q2NUromROd9I4JzycDKico+gTJmU5dWgbQ
	 nJSl5CbsS1h/lwWigkSdjAzds3TlF/f6u2NaS5ZfxVVM56TSF7sVbksVHgWW45Ooxp
	 35WnfwL12F9kBL/wRLIMpvhmyZEDf+r5ID78/1xg7DQReYBgiti9gNC6yg/iSKoVWl
	 ay6pjvtHOifQgiZXelyuziSzYUUkXjk3RvQyxmYnGYRpP3QrKqg0thEM6YcHr+FNap
	 NbXuxFKxqN+jXll7br8tHcLAD/APQmYz1a4YwUMWe73ydQDeJBpT75As7d2D9J+VrB
	 fM3cUx0q97FTg==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-676a89de629so6895352a12.1
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 05:35:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9WECpfrD1+6ETsSKifyQSQXjjnee4ylF230DOT2DE8V11xN0VANmZDdGgQkQ6uPVykiNI0GGCLkMvq@vger.kernel.org
X-Gm-Message-State: AOJu0YzVLhu9fq1Ff0H6bF3IBiRN5Ivmw50hc1v4NRxzip4stAKFh7dL
	ohCNrqOiibYFPQ9MY1heK5Xj1sOENes8dg5Uyf2sixD9/gyPzX4GSvfE0hRjRq6YXogwCfyLoR0
	ykD1EAdYOYUsR37NfgqfLvpt0Blw8VA==
X-Received: by 2002:a05:6402:518c:b0:66f:93cb:a277 with SMTP id
 4fb4d7f45d1cf-67d642b9559mr12393090a12.14.1778502940912; Mon, 11 May 2026
 05:35:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511-bm92t-v2-0-2145e4f4386b@gmail.com> <20260511-bm92t-v2-2-2145e4f4386b@gmail.com>
 <177844236182.3519904.11223844313176518441.robh@kernel.org>
In-Reply-To: <177844236182.3519904.11223844313176518441.robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 11 May 2026 07:35:28 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ-av8qQ2-bUyZj2HBCiyypqTx0iHNSDuTkzDYUkmAcCg@mail.gmail.com>
X-Gm-Features: AVHnY4K9CD446sGH0M7JjTNmftVBOl39iUIATcxR0y0VQjQonGoPN-OagOQ_Vp4
Message-ID: <CAL_JsqJ-av8qQ2-bUyZj2HBCiyypqTx0iHNSDuTkzDYUkmAcCg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: usb: add Rohm BM92TXX Type-C controller
To: Alexandre Hamamdjian <azkali.limited@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, linux-usb@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Conor Dooley <conor+dt@kernel.org>, CTCaer <ctcaer@gmail.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 2C0CE50DF50
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36571-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,linux.intel.com,linuxfoundation.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Sun, May 10, 2026 at 2:46=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
>
> On Mon, 11 May 2026 01:32:10 +0700, Alexandre Hamamdjian wrote:
> > Add the device-tree binding documentation for the Rohm BM92TXX family
> > of USB Type-C and Power Delivery controllers. The device is controlled
> > over I2C and signals state changes through a dedicated interrupt line.
> >
> > Document the rohm,* properties consumed by the driver: the optional
> > VCONN-enable GPIO, the DisplayPort alternate-mode toggles
> > (rohm,dp-disable, rohm,dp-alerts-enable, rohm,dp-signal-toggle-on-resum=
e,
> > rohm,dp-lanes), the suspend/dock tunables (rohm,led-static-on-suspend,
> > rohm,dock-power-limit-disable) and the four
> > rohm,pd-{5,9,12,15}v-current-limit-ma per-PDO charging current limits.
> > A graph port is required to link the controller to a USB role switch
> > consumer.
> >
> > Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
> > ---
> >  .../devicetree/bindings/usb/rohm,bm92t.yaml        | 128 +++++++++++++=
++++++++
> >  MAINTAINERS                                        |   1 +
> >  2 files changed, 129 insertions(+)
> >
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/u=
sb/rohm,bm92t.yaml: rohm,pd-5v-current-limit-ma: missing type definition
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/u=
sb/rohm,bm92t.yaml: rohm,pd-9v-current-limit-ma: missing type definition
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/u=
sb/rohm,bm92t.yaml: rohm,pd-12v-current-limit-ma: missing type definition
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/u=
sb/rohm,bm92t.yaml: rohm,pd-15v-current-limit-ma: missing type definition

Use a standard unit suffix.

Rob

