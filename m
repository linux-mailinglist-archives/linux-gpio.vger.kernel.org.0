Return-Path: <linux-gpio+bounces-31899-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPQhA4Ngl2kAxgIAu9opvQ
	(envelope-from <linux-gpio+bounces-31899-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 20:12:03 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 676C1161DD2
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 20:12:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 119FB302E780
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 19:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 476432F3618;
	Thu, 19 Feb 2026 19:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i1olpiLa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B33D2EE268
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 19:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771528286; cv=none; b=fdOidhsPwq4afRSz7roF3yqztBERPlandAFkTtEOwqAHTmrptia5ur4YVvhqav9ZQQjrt0ZRvS9d5vih3RdNYD9SfKnCZoHFnMNZM+6fhd+nP1k9QGnhWe9CETAlZ/dFVg24l8YDRHHrL/luOGB1dTFMNb/qvbPmaQD1niBDSVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771528286; c=relaxed/simple;
	bh=Rb0+DBfdVleoRslWweeISPOle2jWWZ3LQCLlNVSSpQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D6zeLPFmQssmkSsnIP1g/wCqc/mf6CNU2WWfOCG7HSMEjTXecWE834Vi5qhh4II8qOENbrUQTAVBnFS+NjEhXFAnLn7fLsRTXS8wgMWNnF8CKnRF/Z5Hzz8dtNUk2PVQH6I8jhQCAIUs0TBt65pS8n6P2Q7QM4chJpz71sZ9OBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i1olpiLa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E121FC2BC86
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 19:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771528285;
	bh=Rb0+DBfdVleoRslWweeISPOle2jWWZ3LQCLlNVSSpQ8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=i1olpiLass+zi+ryRPqDO011PKFsP+jV3zN+AT0DtHrgm4fxXdQ+PHkY3qMmfqlf1
	 wvH+CecaMwYHKJeSai3u4pC0ngNQbTiTIE/Pr+OXt08a1KRKGpCHUpoUwVHRFGpBn/
	 15JEtQaejY5UqsWQwO9a144pKKSVznH3Ris08sHOZbeFu1XAbyqfyRIi/7lVx0GZ02
	 vimuInYeeHxhdvDHFQd/PFd7VV1cCd70xmzZXTGV9IKJNMYz/SQGmcG1F7o+HXFGsW
	 tprd9LJjOQ+Nh9imdUj8/HJq5lPm2TZi6qJj/k/4VUddsAGvWNBab6UbvP1qG55ASN
	 cM8TzHE/AYqzg==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7950881727cso9200857b3.3
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 11:11:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXXCHAnaE99R4g1de48LyMypC3ne7S+AxtKGD/BFZuKM9K/mI1+1gx81eh+m3Of4pP80nTe5LgPcqK8@vger.kernel.org
X-Gm-Message-State: AOJu0YzQsgLGBQBVmv/Zw5HeNgaxBteOi9NPDktb3BJVmzwUHNXuxOLP
	C/E1PzWM3/OA33xbSPW6SRdGheryden1bouOjftorBeZqeeHQRoytTg4X7efSmAztDzhyXtI/6I
	9i6ryevY6wC+nYy0B80PbUjOaemqills=
X-Received: by 2002:a05:690c:ed5:b0:797:f635:c896 with SMTP id
 00721157ae682-797f717b02cmr50185397b3.9.1771528285140; Thu, 19 Feb 2026
 11:11:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260218083618.67805-1-christophe.roullier@foss.st.com>
 <20260218083618.67805-3-christophe.roullier@foss.st.com> <aZV-b6TdLMdI8dm4@shell.armlinux.org.uk>
In-Reply-To: <aZV-b6TdLMdI8dm4@shell.armlinux.org.uk>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Feb 2026 20:11:13 +0100
X-Gmail-Original-Message-ID: <CAD++jLnF=8MvW4CbXmPZR=w8tAUZiL9M3N73WB++DaYYwhToDQ@mail.gmail.com>
X-Gm-Features: AaiRm50ZmYrtHjO9YzusnFCmg5M5z6i9LzHE-qxCdbPPiIH94xxykSK7yFLYpYI
Message-ID: <CAD++jLnF=8MvW4CbXmPZR=w8tAUZiL9M3N73WB++DaYYwhToDQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] net: stmmac: restore pinctrl when driver remove.
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Christophe Roullier <christophe.roullier@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	netdev@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
	TAGGED_FROM(0.00)[bounces-31899-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[foss.st.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,bootlin.com,nxp.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,netdev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,st.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,armlinux.org.uk:email]
X-Rspamd-Queue-Id: 676C1161DD2
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 9:55=E2=80=AFAM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> On Wed, Feb 18, 2026 at 09:36:17AM +0100, Christophe Roullier wrote:
> > when system suspend or unbind, need to set pins
> > to low power state to save IO power consumption.
> >
> > Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 067b17f03cd09..3d4f0e4cb53fb 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -8071,6 +8071,9 @@ void stmmac_dvr_remove(struct device *dev)
> >       mutex_destroy(&priv->lock);
> >       bitmap_free(priv->af_xdp_zc_qps);
> >
> > +     /* Select sleep pin state */
> > +     pinctrl_pm_select_sleep_state(dev);
> > +
>
> I'm not convinced this is correct, there's nothing to match it in the
> probe function, except what the driver model core does. However, the
> driver model core also doesn't clean up the state if probe fails.

I think it looks right, if this state is indeed for the sleep state of the
device pins, and this is what you want to happen at remove().

The non-cleanup of the pin states is a (maybe ugly) feature: there
is an "init" and a "default" state. If the "init" state does not exist the
"default" state is selected in the dd.c call.

These states are just some values in dev->pins, allocated with
devm_kzalloc(), and devm_pinctrl_get() for e.g. dev->pins->p,
so IIUC this will befree:ed on driver detach,
also if the probe() fails, at least that is what the original devres
design document says
Documentation/driver-api/driver-model/devres.rst

There is really no other cleanup that can happen: there is no
before-default-or-init state we can revert to (that would be the
power-on values), so there are just these states in some pointers
that could be accessed by e.g. pinctrl_pm_select_sleep_state()
that get free:ed up, and muxing and pin config that happened
in the pin control hardware just stays around.

Yours,
Linus Walleij

