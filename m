Return-Path: <linux-gpio+bounces-32413-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DvfL0Srpmn9SgAAu9opvQ
	(envelope-from <linux-gpio+bounces-32413-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Mar 2026 10:35:00 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 055131EBEEC
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Mar 2026 10:34:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4AFFD307670C
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Mar 2026 09:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 965CF38C433;
	Tue,  3 Mar 2026 09:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b="tZvqQI9c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from s106b.cyber-folks.pl (s106b.cyber-folks.pl [195.78.66.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A690E38C434;
	Tue,  3 Mar 2026 09:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.78.66.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772530334; cv=none; b=hDb0xka/1pgRgdLIpe4W0kGUO3CKKbOHrdfctORNXybjMAIdBpts2NWCES/iAruqJy29khag9+0oOA8SLPGAf8Ddq/yC7sWstVB5ReE02WuPgSetv22+ky+JQHPr4Rr0FyIHjRci3+p2CuhctmdxsR9X7D48hvI3Q0KN4XDcaO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772530334; c=relaxed/simple;
	bh=nK+SmsiFH+4zAIZ2K9+vs/QA+l4b9EWeZL2ftP3d/GY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JMo1lPCGAyyLTVbpgtSObMJqI/zBDKVna4dMHxdVBMMxCwI6hxjs3OXxCPJmkJI6Ls/uFq1TOTMxW8jqHso7X5EEzX9qKuar6faYx5KnuOCfLrxrA17y067biHuwIqUd06YSPDV1UUuy6rWj+LvGl+loTgcrtqA9ut2jHolNl6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl; spf=pass smtp.mailfrom=mmpsystems.pl; dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b=tZvqQI9c; arc=none smtp.client-ip=195.78.66.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mmpsystems.pl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KEjCuvh+1o7c3QuvXcWCTwWwK1bIzgUXtUF5yo6ollo=; b=tZvqQI9cEnCtdg2tUvHwz/fCR/
	9DXPX3tFzCGH8BkcrVR2ae+al19fKWLBCuIhYXEGDev2RLxXPbwwKeOW51YIy8xilzr4336J/0nHM
	Nm3EflM3JVYPrXMdxEaqeblcqwkYu/0yXw10rKEiP0+SDLRa5HYXvsh611v3etaDiwB30lgf2zyE0
	Jc0D8ZNDO/oAsEqzX20N7PGfSrBvcf3ld5QQ/b7IRnZMt2RfuU85AA4r0aEcVae+eKs0kUZoUBTHL
	CBjw3IKPbZAI366dCNaFnHXl+TkFDEktW3Aedq415OnrtHhPCWuui0fsyvoNIHp0oSFwK9kHRq4Uf
	zyYnnvoQ==;
Received: from user-5-173-212-70.play-internet.pl ([5.173.212.70] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1vxM6r-00000006SJt-2Edl;
	Tue, 03 Mar 2026 10:32:09 +0100
Date: Tue, 3 Mar 2026 10:32:08 +0100
From: Michal Piekos <michal.piekos@mmpsystems.pl>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: core: use dev_err_probe() when applying state
Message-ID: <43dzum53l2s764e4oqdovwafzggkr56lilkdnmtcqxzhuiy3ts@aigz6n6jj7e2>
References: <20260301-pinctrl-dev-err-probe-v1-1-94a0a2cecc6c@mmpsystems.pl>
 <CAD++jL=iAX-bWxi9XH5emwddZ-fcKu=dsSUQSEH-9-EBaJw58Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL=iAX-bWxi9XH5emwddZ-fcKu=dsSUQSEH-9-EBaJw58Q@mail.gmail.com>
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-Rspamd-Queue-Id: 055131EBEEC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[mmpsystems.pl:s=x];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[mmpsystems.pl : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32413-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.904];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.piekos@mmpsystems.pl,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[mmpsystems.pl:-];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mmpsystems.pl:email]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 08:32:39AM +0100, Linus Walleij wrote:
> On Sun, Mar 1, 2026 at 5:46 PM Michal Piekos
> <michal.piekos@mmpsystems.pl> wrote:
> 
> > When applying a pinctrl state, -EPROBE_DEFER may be returned if
> > dependencies are not ready and the consumer will retry probing.
> >
> > This is normal probe ordering behaviour and not a real error.
> > However, pinctrl core currently logs:
> >
> >   "Error applying setting, reverse things back"
> >
> > even when the return value is -EPROBE_DEFER, resulting in noisy
> > boot-time error messages.
> >
> > Replace dev_err() with dev_err_probe() to handle -EPROBE_DEFER
> > consistently and suppress error logging for deferred probes.
> >
> > No functional change intended.
> >
> > Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> > ---
> > This series contains a single patch to suppress spurious
> > boot-time error messages when applying pinctrl states during
> > normal probe deferral.
> >
> > Currently, pinctrl core logs an error even when
> > -EPROBE_DEFER is returned, which is expected probe-ordering
> > behaviour.
> >
> > Switch to dev_err_probe() so deferred probes do not emit
> > misleading error logs.
> 
> Patch applied.
> 
> Mysterious overly-verbose commit log have traces of AI
> spice.
> 
> It is mandatory to mention in the commit message if an AI
> tool was used to generate the patch, was it? In that
> case tell me so I can augment the commit log.
> 
> Yours,
> Linus Walleij

AI was used in patch message preparation.
AI was not used for patch code.

Thank you
Michal Piekos

