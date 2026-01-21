Return-Path: <linux-gpio+bounces-30864-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AHqBanMcGkOaAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30864-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 13:55:05 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BF83D57235
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 13:55:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 44F304C801C
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 12:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D14B448A2A2;
	Wed, 21 Jan 2026 12:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tSkBcFaB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B309481FD1
	for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 12:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768999474; cv=none; b=iF5BlRr2t6bz2eF9naqEC3m+14uyHxyzGAmXrtOV/S+jBPyUtZwcgz4gQFtdc28pHibVdMB4aZ5YQBdKWC6ry9WWeVLUhcR7bjgJa2QINxNl4/rdON4ok26mwtBLX7f9QetWvjTEGHVmu3GPyQokoF/N4uErW6qQMoDAqkIKTsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768999474; c=relaxed/simple;
	bh=jxOrB8wfEeC2m9GMBQa+QZHxO/B1NDwQHQf6JSIEBVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BqCNs+1qrlVL+HC6JWA69YFThcec7HGQOEXplKF65O9mDZpt/B9ljcYtzbO/h8TC3tE5RveYuXk/m/XjNa8dKqyyQIy5VZVm6YB3cTMWCRQryR9KoHt8SolBn4GlfD6LtapvC6yu2ei1D23DwaYkaTXfkJXJjFotIAd0rqlXExE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tSkBcFaB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BC1AC2BCB7
	for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 12:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768999473;
	bh=jxOrB8wfEeC2m9GMBQa+QZHxO/B1NDwQHQf6JSIEBVs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tSkBcFaBbZKibs5kVPOyBS2H8PmTauBESCSL+Uwgla7l1IPLG7ugTJqOT/c7/WJED
	 z2PgR6Cqiho3fzbKqjLPG1QL7BK6p+Em96KUWf6DOiI+5VC+oQZNvgo9ScF/NeYq0W
	 nmQPcl97qd3txxyvjCF1Oua5hmkG+gruuC2O20O4qrxV5vncGLiCz4IRK0hgyuetg5
	 OSPC1T1fxTDD9PtM5sVB2uXqjQ5k8EocivxTTjqh1fCSj0veoZmjnKP+ieppSU/y3u
	 YdnmilYNvb2Z5M+1ZdUUCqK+VWzaIC5vcamTTMZm2OsGLrtbUSdHp4GS0MrSx93bSV
	 GG4dHr5OW5+4g==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-790884840baso62083317b3.0
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 04:44:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXYZJtupBq2peWYrPSeRyqIX7frggum53ovCU3JmsLk7eLTs1Sq6OixZSrsOy981G+Nh6hf9gxeTbs/@vger.kernel.org
X-Gm-Message-State: AOJu0YxY74Tosgc/iIlshRl9WWylXOxgMc046qDsElVdQZWi0MgS88AI
	QpIopuf00mL34PzkmDTdKSlU89HBCbwfXIkt0DiZJ47w2fPsmKzdf5m8QNxuNo2lHMx1JjTINEP
	+d5mwykLusVVBReNwXgCdrsxzRkKyQfg=
X-Received: by 2002:a05:690e:12cc:b0:649:40f7:f20e with SMTP id
 956f58d0204a3-64940f7fb03mr3287094d50.46.1768999472553; Wed, 21 Jan 2026
 04:44:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115114021.111324-1-robert.marko@sartura.hr> <20260115114021.111324-7-robert.marko@sartura.hr>
In-Reply-To: <20260115114021.111324-7-robert.marko@sartura.hr>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 21 Jan 2026 13:44:21 +0100
X-Gmail-Original-Message-ID: <CAD++jLmitNVhWmUf9BBqLR2_WsAR7V-+ykVJsLK3MuOSUKQF0A@mail.gmail.com>
X-Gm-Features: AZwV_Qgthmlr5E7M3bcNO1COpCtqKG_0WAWJfZBTcClME9lzo2DlyQIrR9yT_Bs
Message-ID: <CAD++jLmitNVhWmUf9BBqLR2_WsAR7V-+ykVJsLK3MuOSUKQF0A@mail.gmail.com>
Subject: Re: [PATCH v5 06/11] dt-bindings: pinctrl: pinctrl-microchip-sgpio:
 add LAN969x
To: Robert Marko <robert.marko@sartura.hr>
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
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	FREEMAIL_CC(0.00)[kernel.org,microchip.com,bootlin.com,tuxon.dev,gondor.apana.org.au,davemloft.net,lunn.ch,google.com,redhat.com,selenic.com,upb.ro,linuxfoundation.org,gmail.com,linaro.org,vger.kernel.org,lists.infradead.org,sartura.hr];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-30864-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,mail.gmail.com:mid,tuxon.dev:email,sartura.hr:email,microchip.com:email]
X-Rspamd-Queue-Id: BF83D57235
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Robert,

On Thu, Jan 15, 2026 at 12:41=E2=80=AFPM Robert Marko <robert.marko@sartura=
.hr> wrote:

> Document LAN969x compatibles for SGPIO.
>
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

Should I just merge this one patch to the pinctrl tree?
Looks good to me.

Yours,
Linus Walleij

