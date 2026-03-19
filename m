Return-Path: <linux-gpio+bounces-33848-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gN+qNsc8vGlxvgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33848-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 19:13:27 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 811F02D0A68
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 19:13:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BC0FE300C0F0
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 18:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B2253F074A;
	Thu, 19 Mar 2026 18:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b="dBZo24Kq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from s106b.cyber-folks.pl (s106b.cyber-folks.pl [195.78.66.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794E43F165F;
	Thu, 19 Mar 2026 18:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.78.66.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773943993; cv=none; b=bv5MK2c3WC1+LnmgSBcp8VOA5WpD8cwbk55IFOX4rdJOBIXPeGT/ZKXTXCdGdjwrTsZwK7qs7TfYVAJT3LmBZuiZ8V8KWcJrpOLDMPJFMbKhz9X/WXEVxzcgE6cQnslyKhYBHgEg1XwdtfmS7uNd/50z8kH582dFCHZD7QtFees=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773943993; c=relaxed/simple;
	bh=p1gJtCRxZ9dXjqxx5qzyEuLAl88qY4JpM4JvZb+dSJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fM8pjHF7rUlg+umo46CYdtp0NxElSo+ftbwm7HMvyyb8I/WsAq1Ka+mVuKA7r4wDDz/HSKSpONyFWnjEue8vXJsyB2Xa6orTa2OM3GNOobYHucxgJaRAP4bOzWODHLCqUqY97twwTV4Lol+F8sB5ZrLhOkMZ1FWhi+tFXAIaXxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl; spf=pass smtp.mailfrom=mmpsystems.pl; dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b=dBZo24Kq; arc=none smtp.client-ip=195.78.66.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mmpsystems.pl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=M1WNWhIO3YiBXIdvt4jOGaT6noglgn3Bsi2PS9Y4M5g=; b=dBZo24Kqd4fO2wKVlBncyVhcwq
	JCABMSHnPWjcMfSW5UU/9SsoyEkjOdxiFyTO00AB4TLM3O3SK1fqkBUWvH+aE2u8cS933Pr+SPseC
	u5B4eMdnIN/VIpyHT/O97dqW4fxxCaAKD7j5+m2UQLjIyv+PIbB9dyuQGDoMcxBOocVlMchEa2pAa
	TgPD5yowf/CHyL8/URPwKmLm7JGHw3z1FVIBFYEB+i8gaLCl/ckqX074lmXBumsPqZGGsXld6eHO+
	QiYnIfSVMS6jG+mcRq80HuYKnzPzxayqE7kEMW/pfAbzafFPnQiQSUFDXyUXwxxGYVpgMvOSyC1mi
	B9A2/gug==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1w3Hrn-000000018rt-3cwE;
	Thu, 19 Mar 2026 19:13:07 +0100
Date: Thu, 19 Mar 2026 19:13:06 +0100
From: Michal Piekos <michal.piekos@mmpsystems.pl>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v5 1/2] pinctrl: sunxi: pass down flags to pinctrl
 routines
Message-ID: <ofzcfuc2ueuxpt2bvknqui4jirvsfo4u53hkt7eqptdrl2uo6r@uv4ldiyzxljr>
References: <20260319-rc2-boot-hang-v5-0-092834a882b1@mmpsystems.pl>
 <20260319-rc2-boot-hang-v5-1-092834a882b1@mmpsystems.pl>
 <CAGb2v64BTnUO-iR9G4b1PsX6TB4+Q_a0Tm+sj1dhFJ6a06iJkw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v64BTnUO-iR9G4b1PsX6TB4+Q_a0Tm+sj1dhFJ6a06iJkw@mail.gmail.com>
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[mmpsystems.pl:s=x];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[mmpsystems.pl : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33848-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,sholland.org,vger.kernel.org,lists.infradead.org,lists.linux.dev,arm.com];
	NEURAL_SPAM(0.00)[0.685];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.piekos@mmpsystems.pl,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[mmpsystems.pl:-];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,arm.com:email,mmpsystems.pl:email]
X-Rspamd-Queue-Id: 811F02D0A68
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 01:42:18AM +0800, Chen-Yu Tsai wrote:
> On Fri, Mar 20, 2026 at 1:19 AM <michal.piekos@mmpsystems.pl> wrote:
> >
> > From: Andre Przywara <andre.przywara@arm.com>
> >
> > Recent changes in the Allwinner pinctrl/GPIO IP made us add some quirks,
> > which the new SoCs (A523 family) need to use. We now have a comfortable
> > "flags" field on the per-SoC setup side, to tag those quirks we need, but
> > were translating those flag bits into specific fields for runtime use, in
> > the init routine.
> > Now the newest Allwinner GPIO IP adds even more quirks and exceptions,
> > some of a boolean nature.
> > To avoid inventing various new boolean flags for the runtime struct
> > sunxi_pinctrl, let's just directly pass on the flags variable used by the
> > setup code, so runtime can check for those various quirk bits directly.
> >
> > Rename the "variant" member to "flags", and directly copy the value from
> > the setup code into there. Move the variant masking from the init
> > routine to the functions which actually use the "variant" value.
> >
> > This mostly paves the way for the new A733 IP generation, which needs
> > more quirks to be checked at runtime.
> >
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> 
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
> 
> Please carry tags forward if the patch is unchanged.

Will do. Sorry for ommision and thank you for quick review rounds.

Michal

