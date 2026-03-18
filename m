Return-Path: <linux-gpio+bounces-33750-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +P7hIcOwumkVawIAu9opvQ
	(envelope-from <linux-gpio+bounces-33750-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 15:03:47 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8142BC905
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 15:03:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C3B2329BC5B
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 13:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29C723DA5D7;
	Wed, 18 Mar 2026 13:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iNIO5oWw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB223D8124;
	Wed, 18 Mar 2026 13:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773842056; cv=none; b=slnKMsOO/ixa19aqnJoF0orTi3ujaouuNb7t2PxJ4YQ6ITTr/PygjhklajVgYi/kCllMe7MqPB2G46pRSArMcwbVzEnK10uTeuyy0CzZDZlmObW3bInj/WcgXzVRvULdoF6zeZRxQCVY8cB7//6eHrwL3320317WIGBGXW5FBAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773842056; c=relaxed/simple;
	bh=ZOHuAKIvF/750+Fr9Gw1RoDcG7pMffownTTVw1YBoW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cqYXQ5jlkGelvwtKHMyzBpNNOaTFL8fvPSv7uCIGYbJtImGwXYCJKKJhkuDG1U7W/bcBVEh41KcovQEEqbku1wTZhAFC22WjwEDSVkl0JQ4jn6cRPMvAargD8UcrxycodV6ekC+t6m2o2KZD4rYQLqFNmyNAmJHc/L23o/N84gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iNIO5oWw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2793C19421;
	Wed, 18 Mar 2026 13:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773842056;
	bh=ZOHuAKIvF/750+Fr9Gw1RoDcG7pMffownTTVw1YBoW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iNIO5oWw/MI0gmxVUPdnB1ZiGDL/a+A9pGuKVyawMdvsTsD/TafF8MPMh/QXiZwur
	 /LsgZWtMrlEL9JVuj3JscN12J+qKYegE/A91HX6oqIKItDfmFB7iJ4RPQmpiivIiTg
	 FMth/6Sbzwio3AFZiJo8dY30+/Am2IouSTQ3L2O4=
Date: Wed, 18 Mar 2026 14:54:11 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Jim Cromie <jim.cromie@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>,
	Chris Boot <bootc@bootc.net>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: scx200: move the header under linux/gpio/
Message-ID: <2026031805-manmade-footrest-4c7a@gregkh>
References: <20260318-gpio-scx200-header-v1-1-626688284f17@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-gpio-scx200-header-v1-1-626688284f17@oss.qualcomm.com>
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33750-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,arndb.de,bootc.net,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim,linuxfoundation.org:email,qualcomm.com:email]
X-Rspamd-Queue-Id: DF8142BC905
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 02:48:38PM +0100, Bartosz Golaszewski wrote:
> Headers exposing symbols specific to individual GPIO drivers should all
> live under linux/gpio/ for consistency. scx200_gpio.h is currently a
> top-level header directly under linux/. Move it and update all users.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> With Acks from relevant maintainers, I can take it through the GPIO
> tree.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

