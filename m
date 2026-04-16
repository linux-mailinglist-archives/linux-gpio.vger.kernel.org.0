Return-Path: <linux-gpio+bounces-35183-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAVmAJSm4GlZkgAAu9opvQ
	(envelope-from <linux-gpio+bounces-35183-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2026 11:06:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 515B540BFFC
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2026 11:06:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7209E3006992
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2026 09:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3FBA385503;
	Thu, 16 Apr 2026 09:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cKjANYqg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7376303CB0;
	Thu, 16 Apr 2026 09:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776330367; cv=none; b=PJJSaUDmcDWL+yDk1Ax6wpMz9tpUDkAvNsWaHB8+qcocCdP99RI6T+Eb8wrWw6QXq3bDL66u3fw/XcNnRYJYtyK4sjUal2mG3RwSj4/gPA4k0rgRP3Kfn/sV41E0ZCJD3EpIec9NlpzzHmvmOTMeSg9N27dXjztIU5vvrKQnoYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776330367; c=relaxed/simple;
	bh=jdvOEzFNQCnkjiaq/gjCIrrpDBLRp/B98yKiskUg1Ew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fnKCCqVL2aAhi7lNB6dz3jpYmukkhCBDf5A1vAfXLEEOgSex1af90E6k/gq4QAEi95QF0jktEvGmmlhyhlqeBrvOk7EQYw26vBXJhbA1URqUDi7SuxtJudAcgu89ZWLogsySzYDe2c1vUnYdvF3bsIv13IquRfkRlOUsFfwvQ8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cKjANYqg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3826C2BCAF;
	Thu, 16 Apr 2026 09:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776330367;
	bh=jdvOEzFNQCnkjiaq/gjCIrrpDBLRp/B98yKiskUg1Ew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cKjANYqgXYLcM+Vu6dT3zaOm17uCcf5i5yRVA8jQLAj/7AjPuaOpFSsCkTxsPvlmO
	 4m/CM47+1jCQDe/pv6hY+RZbVTCuPHo8cBiaqgiAuzhNc+U5BkT52hsdhihUyRPkiq
	 OX6PEj9BbE50j/yRJHwlDU40yfhj0p74Gwzg2s/uSjzK9nMZkSehFg1MylQftmDcek
	 W09I3eyXBiGGyzkBHt7jpK63Q2NBowPCZtb5ba54lk0kMlwfDskezXgfdIH5D91wyK
	 cVZe23obJnTeq8xFUubqxTnZS205BZ2i6CGYjIl5iqFO/A0s6+3uuce+uDOAegZqFb
	 NZBgG3n39+oSw==
Date: Thu, 16 Apr 2026 11:06:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: Conor Dooley <conor@kernel.org>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, linux-kernel@vger.kernel.org, git@amd.com, 
	shubhrajyoti.datta@gmail.com, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] dt-bindings: gpio: Add EIO GPIO compatible to
 gpio-zynq
Message-ID: <20260416-graceful-warthog-of-superiority-62acbd@quoll>
References: <20260415105628.957689-1-shubhrajyoti.datta@amd.com>
 <20260415105628.957689-3-shubhrajyoti.datta@amd.com>
 <20260415-rectal-visible-a8ccb534a176@spud>
 <c973f9d4-9bb5-40f4-8f09-72e23f92cd2d@amd.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c973f9d4-9bb5-40f4-8f09-72e23f92cd2d@amd.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	ASN_FAIL(0.00)[4.211.64.104.asn.rspamd.com:server fail];
	TAGGED_FROM(0.00)[bounces-35183-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,amd.com,vger.kernel.org,gmail.com,lists.infradead.org];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 515B540BFFC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 16, 2026 at 07:58:27AM +0200, Michal Simek wrote:
> 
> 
> On 4/15/26 17:01, Conor Dooley wrote:
> > On Wed, Apr 15, 2026 at 04:26:27PM +0530, Shubhrajyoti Datta wrote:
> > > EIO (Extended IO) is a GPIO block found on xa2ve3288 silicon..
> > 
> > 
> > Why does the compatible have a "1.0" when it is in silicon?
> 
> Sorry not following what the problem is. Yes this is hard block in silicon
> and it is silicon v1.

Writing bindings: compatibles should be specific to device, not some
arbitrary versioning.

OR explain in commit msg. That commit msg clealy suggests code is wrong.


> 
> > Why doesn't the compatible contain "xa2ve3288"?
> 
> This unit can be used on different silicons too.

That's not what the commit said.

> 
> > Why is this device not compatible with existing ones, since
> > gpio-lines-names appears to be the sole difference?
> 
> There is no way how to detect gpio width.

Where in the commit msg are the differences explained?

Best regards,
Krzysztof


