Return-Path: <linux-gpio+bounces-38007-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CBBiBmOUImr6aQEAu9opvQ
	(envelope-from <linux-gpio+bounces-38007-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Jun 2026 11:18:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F1445646C95
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Jun 2026 11:18:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="Xr/7eR4F";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38007-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38007-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 681B03045E70
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jun 2026 09:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF0164C77CC;
	Fri,  5 Jun 2026 09:15:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3404C77B1;
	Fri,  5 Jun 2026 09:15:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780650937; cv=none; b=S/0dBhp2ab0tS/Y12doZ1qxKU3s110xh/ocKyvCZ6D694xGMpwOCh22xKb9zKBLo0hOPgQ7xOrHI769YX/XkT6ZdgUVecrBhMD4drfEteMlBs09jgKfDIH1MWnSTB1kGVAkapaoOl+Tb8tVDYZftANe/NauzF7Ep/H9UFBpcIGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780650937; c=relaxed/simple;
	bh=KRbZa4yH9SD5oC00vvBSsN4H15VKW/BBINcxhBiwbDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=svvYVVRI/zM3NwIiDUdZQstwCqYLNlPhuWidqw6BU8FM+2f0s+d8nKWVROuHqSipJ6g3KdxYM8qnh2+MHVp2TamiYxGd69RcNs9jF7PFlRhcZD9iC2SUQgVbF/bVIBoYwz8sGp1FI2VMXylSmNl29y6+ILHBOYrlm79d0Zvyh08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xr/7eR4F; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 654561F00899;
	Fri,  5 Jun 2026 09:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780650936;
	bh=KRbZa4yH9SD5oC00vvBSsN4H15VKW/BBINcxhBiwbDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xr/7eR4FHFeVm/KiiQc65+cj13HnmMsHTNwzlHRrAdR25oNAAiwTpqp2qER4FIGKW
	 dPhnDLHRLzc4QYZyZ4TDyZO9RAPgT/3ENrggbVyuqi11t0TipDTBtwnTbgOfoPAuEM
	 AJePO1eNtA+evMRgUbNjXXEZzjfTfWdCEVYKvDhL5LNDgoc8T8lWsaVols9F4lT255
	 K5nhV+71mWP0jJN1sPD0lUl+U1brmu8xOzIAez5hIhYJSX5aKO24WFXHBPXzAVGX9v
	 uZ7J/akRTDI4S7VgHrLhAEcqbXlUgnpqHN0ZswNvkkqIdRlf13jfF6vypyVM69br8v
	 LIwGHd+sXWIRA==
Date: Fri, 5 Jun 2026 11:15:31 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Wolfram Sang <wsa@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jie Li <jie.i.li@nokia.com>
Subject: Re: [GIT PULL] Immutable branch between the GPIO and I2C trees for
 v7.2-rc1
Message-ID: <aiKTSrD7GYCwrVDX@zenone.zhora.eu>
References: <20260511123042.64315-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511123042.64315-1-bartosz.golaszewski@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38007-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andi.shyti@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:brgl@kernel.org,m:linusw@kernel.org,m:wsa@kernel.org,m:wsa+renesas@sang-engineering.com,m:linux-gpio@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jie.i.li@nokia.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andi.shyti@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,zenone.zhora.eu:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F1445646C95

Hi Bartosz,

> Please pull the following changes adding the gpiod_is_single_ended() helper
> for v7.2-rc1.

merged to i2c/i2c-host. Thanks!

> ----------------------------------------------------------------
> Immutable branch betweeb the GPIO and I2C trees for v7.2-rc1

/betweeb/between/

> - add the gpiod_is_single_ended() helper function

...

BTW, your signature in kernel.org doesn't contain your Qualcomm
e-mail.

Andi

