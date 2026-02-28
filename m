Return-Path: <linux-gpio+bounces-32345-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHxyJdjromml8AQAu9opvQ
	(envelope-from <linux-gpio+bounces-32345-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Feb 2026 14:21:28 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E85C31C334B
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Feb 2026 14:21:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC516304DEA6
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Feb 2026 13:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57519279DC3;
	Sat, 28 Feb 2026 13:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="djwar9JH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187C127281D;
	Sat, 28 Feb 2026 13:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772284880; cv=none; b=M9jZrUInaVCZbZmNVmEkZU83/IMWnV3RUtgGukF8Hja3LDRw4DsHSVYhQqIRvz1FFJTRhRUFXfoaLU5UtbJRxIMU6h322kRFNePuuCuvyhkWZHyhFXExm3aDJnR/gmx8/xNc1dxlvVEsFi4EmMUVOqPLKsGyozMFD4Xi+uVu4fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772284880; c=relaxed/simple;
	bh=ncaklDM+xxv5o6yR5ZjBDMMWru15gW5O4oJBGdc0wRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Flr+Och6oPC5W/a4MswwlFYgJpXViYZeOISSndqPHYxWkFgRYXNv3zTkYM35Wy+O1bfsjjeCOQbTOm2l9xelt6Q7pF2FiD9nDmoFFXbPNsqyyz/NknfjXLVHFfvdZZo5JgfMaOUzQ2rPcqvFCETu6pDwc/fcqjrZuBg2vde+IiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=djwar9JH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0DD6C116D0;
	Sat, 28 Feb 2026 13:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772284879;
	bh=ncaklDM+xxv5o6yR5ZjBDMMWru15gW5O4oJBGdc0wRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=djwar9JHBz4ZBnWfwVfBUojW2G4kNb37zsXhqlDhhX1zttvC8rS3WMfPRXVayBb2m
	 zWQe0JJhsg1hev3Js8512V2S5oANZGp5J6XJHGMzJf7E/+XA50qeO2OBKBxPcJNcdj
	 qXnjsACpErRpbvfJdHHm6m9onWZxQDEhTcYAVXjmKeM8RjK50LtlHr/ZmA3F6zl9VJ
	 5qHaKslP6LubHmMvGwR7KYYTWPQacpRkzTNw7AOXUnhjQUYea7D3NIQyE/mCA6H2Vi
	 jG1JY5c8IdKctLV8phWgFWJQI7zXSWVu7h+gM55ua0TCFLbSmwq3+e+7HzeAo3/siR
	 pIzYEXPqGzTAA==
Date: Sat, 28 Feb 2026 21:21:16 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3] gpio: Fix resource leaks on errors in
 gpiochip_add_data_with_key()
Message-ID: <aaLrzLBjUT6IqBiG@tzungbi-laptop>
References: <20260205092840.2574840-1-tzungbi@kernel.org>
 <177218313069.8853.3389428325341696673.b4-ty@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177218313069.8853.3389428325341696673.b4-ty@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32345-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E85C31C334B
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 10:08:19AM +0100, Bartosz Golaszewski wrote:
> 
> On Thu, 05 Feb 2026 09:28:40 +0000, Tzung-Bi Shih wrote:
> > Since commit aab5c6f20023 ("gpio: set device type for GPIO chips"),
> > `gdev->dev.release` is unset.  As a result, the reference count to
> > `gdev->dev` isn't dropped on the error handling paths.
> > 
> > Drop the reference on errors.
> > 
> > Also reorder the instructions to make the error handling simpler.
> > Now gpiochip_add_data_with_key() roughly looks like:
> > 
> > [...]
> 
> Hi Tzung-Bi!
> 
> For now I queued this for v7.1. I want it to spend some time in linux-next as
> I think it's a high-risk change. However, I preemptively put it into an
> immutable branch - if all is good for three weeks or so, I'll send it upstream
> for v7.0.
> 
> I see you added a Fixes tag dating back to 2024 and Cc'ed stable. I'm afraid
> this change will not apply very far back, do you plan to backport it all the
> way to v6.8?

Probably no, I think the patch won't apply very far back as well.  I added the
Fixes tag for providing context about the fix target.

