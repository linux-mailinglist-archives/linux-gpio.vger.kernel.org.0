Return-Path: <linux-gpio+bounces-35860-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOqKM8Ep82lsxwEAu9opvQ
	(envelope-from <linux-gpio+bounces-35860-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 12:06:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E888C4A07EC
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 12:06:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A0E953073BA2
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 09:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 307083AEF27;
	Thu, 30 Apr 2026 09:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uJAvl/oP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D273ACF1F;
	Thu, 30 Apr 2026 09:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777542803; cv=none; b=gpUIDIY9oUkGL6l0qWE8kYakBKqZ43yTJFZHAv0bDeIBNT53U20WNbj8lm8JcOiyOgtrUnnaSNj/YjceEW+rBQ9vCPXPffu8sZ0k/oJmttpCVs7UV863zR9ZdzdFB5sSZaIiX2kV1iXRoRZEKxkeivZRDq/N2F9nCkvSotLjmeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777542803; c=relaxed/simple;
	bh=gLv1J8aooT74j+73knzVWxsx/gzOvweF9fEZO7MZcxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fuWFBVUoItpj03zV7IrFyLWH+yllPgU+eR6LU7ZrJnEbu1gd/Fiy40FAQ0r37ZGKhexu7YcfvHUlcyb7LrawnDN4/BfX9ERVR3caLjbZliXE/a513oJnvbdOa2k9m3vihnWg1uqf0wc0u97EGpE4SjHLXKYTMWXcpJqsCRX6Jmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uJAvl/oP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38EE2C2BCB3;
	Thu, 30 Apr 2026 09:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777542802;
	bh=gLv1J8aooT74j+73knzVWxsx/gzOvweF9fEZO7MZcxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uJAvl/oPgfNiolqKg8hazCoSihF3+g1J5/e4c0nTChld06K/09kd6Tfa8GdgYkZvU
	 ItvKzojJBvnHZzKx/MB1EnVrOk7PuJfyB+wbHfwptkptKqzNawrNmHGD3nFsJfxifO
	 +sgHeuFf9TT6K1ikxLoNqw9YnsNrvp1zwWHoxoK3GLg6VBmcaG8LDOjeg1obPCTQwb
	 llZa97VdDEE0yU6vyx6MjuWyZiQqDYvJEp6lkEcgnb17FEL24sWEBmNTNOZobHyocx
	 jKnPvzkB89pBRQChqqm7ntLzDuqOpv6dIf3Ca/F8pnbKy6MJuQ4J0oZsdvJLa9dSUP
	 Gpp7Xxm1iej/g==
Date: Thu, 30 Apr 2026 10:53:18 +0100
From: Lee Jones <lee@kernel.org>
To: Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: (subset) [PATCH v3 2/4] mfd: timberdale: set up a software node
 for the GPIO cell
Message-ID: <20260430095318.GH1806155@google.com>
References: <20260327-gpio-timberdale-swnode-v3-2-9a1bc1b2b124@oss.qualcomm.com>
 <177754249505.2432539.2686885340680056271.b4-ty@b4>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177754249505.2432539.2686885340680056271.b4-ty@b4>
X-Rspamd-Queue-Id: E888C4A07EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35860-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On Thu, 30 Apr 2026, Lee Jones wrote:

> On Fri, 27 Mar 2026 11:49:08 +0100, Bartosz Golaszewski wrote:
> > Using generic device properties instead of custom platform data
> > structures is preferred due to the resulting unification of the way
> > properties are accessed in consumer drivers. There's no DT node for the
> > GPIO cell in this driver but we can create a software node with device
> > properties and attach it to all the GPIO cells.
> > 
> > 
> > [...]
> 
> Applied, thanks!
> 
> [2/4] mfd: timberdale: set up a software node for the GPIO cell
>       commit: 2012c0d1b91767b68dedac127c3575cf816313e1

No idea what's going on here!

-- 
Lee Jones

