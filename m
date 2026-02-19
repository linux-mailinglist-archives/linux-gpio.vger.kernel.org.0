Return-Path: <linux-gpio+bounces-31872-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGSsExk8l2l2vwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31872-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 17:36:41 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FF6160B9D
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 17:36:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4889D300C004
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 16:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8221D34C815;
	Thu, 19 Feb 2026 16:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rArFXQqN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AD53EBF2E;
	Thu, 19 Feb 2026 16:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771518987; cv=none; b=BsbflerI6ocBzwS0NgIc2SgQRDBDsV3D4N1Oeb7JtBXS2e3lfq2zHRXWANYKab0Hs+PjvINUutEa41Y+Y2tv4q/XnPQeqAPSt8yqAAQJls13VbvwHTmVHD/ryVDYQv8r+fJ8ldsZcdL8PXIqeA3m9IQWNePgK/Oo8xX369j1bVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771518987; c=relaxed/simple;
	bh=zo9Q5hG5ViD/IUDOGFq+L9geUDQgexkehe+14sq8bls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gF46pYRmSVA2kp42W5XkKN6VWTBbmlWhXEgDLubJGxF5qNdrUS6MVCq7oSA20a63y+TLXhxqBoWig+QhuJBHsTG+9WTCQDOh6sKGc4FsQvTfKGU7NYtT0cw5VHgIuQCBtqn0hft46dqxW4M+5ZatOvMrjyZ+rstib2vGxKMW4Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rArFXQqN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1862C4CEF7;
	Thu, 19 Feb 2026 16:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771518986;
	bh=zo9Q5hG5ViD/IUDOGFq+L9geUDQgexkehe+14sq8bls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rArFXQqNSrdnEN8JuhgRfyv6fDF+Lrle5oOb7fjSgrrr1DQku+eq051UwSdXpcd6C
	 nQIqPr4SzBOSGfAtEmnKXpbWxaUMWT0fa1hLl0SojdT1U5ePN2DLGcq9DA7exDX8v4
	 jeav1kSDtpn3X9WL+4YyLIAj08Sn6aO2MZ5o5jks=
Date: Thu, 19 Feb 2026 17:36:22 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/2] driver core: provide device_match_fwnode_ext()
Message-ID: <2026021900-trekker-twenty-9daa@gregkh>
References: <20260219-device-match-secondary-fwnode-v1-0-a64e8d4754bc@oss.qualcomm.com>
 <20260219-device-match-secondary-fwnode-v1-1-a64e8d4754bc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219-device-match-secondary-fwnode-v1-1-a64e8d4754bc@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31872-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linux.intel.com,lists.linux.dev,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: A4FF6160B9D
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 05:31:22PM +0100, Bartosz Golaszewski wrote:
> Provide an extended variant of device_match_fwnode() that also tries to
> match the device's secondary fwnode.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/base/core.c        | 14 ++++++++++++++
>  include/linux/device/bus.h |  1 +
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index f599a1384eec90c104601422b04dc2b4c19d4382..bbf1337978fafc35eb94bda85e0bb7f6879879c0 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -5326,6 +5326,20 @@ int device_match_fwnode(struct device *dev, const void *fwnode)
>  }
>  EXPORT_SYMBOL_GPL(device_match_fwnode);
>  
> +int device_match_fwnode_ext(struct device *dev, const void *fwnode)

No kernel doc to explain what this function does?

:(


