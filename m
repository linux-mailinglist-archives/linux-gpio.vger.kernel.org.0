Return-Path: <linux-gpio+bounces-33489-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNePJmnPt2mDVgEAu9opvQ
	(envelope-from <linux-gpio+bounces-33489-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:37:45 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAA029720B
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:37:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A4A62300463E
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 09:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1AB0382362;
	Mon, 16 Mar 2026 09:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V+Xsb6y7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CDA378D96
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773653860; cv=none; b=izzlDUx1TCXPaNRLCBaYhKaFR9VBsrbO37DUGJEFjSrmcGQ7uOutzAZ5zxAYESE6poBSMvcN+qXs3gjT31Zbqz+SvK69YVyFFBrKa67TV/00XxzqeBBeUSqcs6FDBTM8HmNk5uJRWXj4OJVxV5+QORzc7LQSE6x4aoXiUiB2ulg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773653860; c=relaxed/simple;
	bh=MzrE4iCp4oKa3wQ16nwKGJ1A0i+9mBfB7UKYhL7FvKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=is+MIncpYjOcFEZfC3BXbjksJL0er/HwEVIChkoqbwko4IAm0L/IwWiNZrJE6AlVzIPZRt1Iq4Pmd9q6ZmRFkVuW8miLsW0/s5dVQPMMk/7nsEeiOjogyAH52n48pbrrg/cIwyhNDJnxYu11p9WLsrVnX1oOSiM8vUwtNdl6ndQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V+Xsb6y7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51F9CC2BCB5
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773653860;
	bh=MzrE4iCp4oKa3wQ16nwKGJ1A0i+9mBfB7UKYhL7FvKM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=V+Xsb6y7Yis06X23lLVRkqoI3qr7IUbx85V9BKULlwfbZ/+9usIfqBgCzW4Gr32hK
	 MIKWfDFtGHbzi10xHSaXuDJJqZqIqtMWPbX7n+V1LFDu/kb0Y8FaqjODhnf/8ki5LG
	 5UCfO5XxKlhhA3YGkvlusKl4IUcfwTzFu6V0gqP3zAfBkTsMTwp50/6/MjwqMCBdJ8
	 5Sq6OfucN/xzwlPLDkyy+SzxdPOnAedxoBrCN7QgnWK3PHc6GAvTOKMV1jvECtyNkp
	 zBp3Z04r/JGitEVqD7ys2GmhSa8WwjRABYXbzByj/VGM90dv0eU0BZ4LuBEiEedWah
	 gaDXmuR1FLa5g==
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-64ad46a44easo4056485d50.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 02:37:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWi3LXtpJn3R4jhOUuV+L5RbVicdwpTmWovI78p94ltEs43q6d7f5r0FuJge5Q66u3utnuZJkc7lYK4@vger.kernel.org
X-Gm-Message-State: AOJu0YwJZ6zw0BJs7pOkvbRkknIaVeBpuxzVKRezYnKZCZGOHZ+XRReg
	xaevP9QHc41+oMVyAGrVRMm0UxCr0QgLggGNy5KPkScR5uYm6AbKl9aQcRuyMYYU26UHMXROscs
	Dzt4JeAbtOktSHoFFkokNKaHbch8x6PA=
X-Received: by 2002:a53:a087:0:b0:64c:f4f4:20ae with SMTP id
 956f58d0204a3-64e630cd15fmr10231603d50.78.1773653859622; Mon, 16 Mar 2026
 02:37:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-pinctrl-mux-v3-0-236b1c17bf9b@nxp.com> <20260311-pinctrl-mux-v3-3-236b1c17bf9b@nxp.com>
In-Reply-To: <20260311-pinctrl-mux-v3-3-236b1c17bf9b@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Mar 2026 10:37:28 +0100
X-Gmail-Original-Message-ID: <CAD++jL=U2xNMMHk_LyH8CX+YpC5EGPVRasM11yesXSH4XLhqYw@mail.gmail.com>
X-Gm-Features: AaiRm502_TKXc5AbWLkrvmd3tP0wuZLSF0MFm9-65pKX5TkH-46UxmauxcJGcog
Message-ID: <CAD++jL=U2xNMMHk_LyH8CX+YpC5EGPVRasM11yesXSH4XLhqYw@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] pinctrl: pinctrl-generic: add __pinctrl_generic_pins_function_dt_node_to_map()
To: Frank Li <Frank.Li@nxp.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33489-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,nxp.com:email]
X-Rspamd-Queue-Id: 3EAA029720B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 8:08=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> Introduce __pinctrl_generic_pins_function_dt_node_to_map() to allow
> passing private data and skip_npins to pinmux_generic_add_function().
>
> The 'skip_npins' to skip parse pins in dts because on boards MUX control
> chip switch the whole group together, so needn't handle each pins.
>
> Keep pinctrl_generic_pins_function_dt_node_to_map() as a wrapper
> calling the new helper with a NULL argument to preserve backward
> compatibility.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Ad attested by several reviews, the pinctrl subsystem maintainer
strongly dislikes any use of __double_underscore_function_names().

The reason I dislike it is because it is ambiguous.

For example there are __compiler_intrinsics such as
__iomem and all the stuff from <linux/compiler_types.h>.

Then there are __non_atomics such as __set_bit().

This means __inner_function() just adds to this mess and creates
a big confusion for the mind.

That said: in this case you're just adding a parameter, just add
the parameter and change all of the in-tree users to pass false
or whatever you need, these is just one (1) in-tree user anyway.

Yours,
Linus Walleij

