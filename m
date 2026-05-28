Return-Path: <linux-gpio+bounces-37604-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMnkOXqmF2oaMQgAu9opvQ
	(envelope-from <linux-gpio+bounces-37604-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 04:20:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE125EBBD7
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 04:20:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 30B293014430
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 02:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFFBD2EAB6F;
	Thu, 28 May 2026 02:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nbxeuozG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C37A26158C;
	Thu, 28 May 2026 02:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779934840; cv=none; b=QiMCKAQuItNfWfkCcmC2+o9/AQypf+qBzAaJwH64+V20EQR/mqJOifbdbHVG9YuhQO/LiM4GAtdtwutu65KXKU5ni5v6VNozHOD7T/Z6AUrhfM+dtTh8pxz/NYxZWEQH/plqo0mz7OsqYd5IoNjfCkbNaktj6WW5OWnXGWYShuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779934840; c=relaxed/simple;
	bh=7Fp6b6bUG3ZGebC3cdlW3AC0LXqycyUvc1huDyPIzFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tl54BkJFLMComayX3w2pJpTgRoJD8l8jBLL/wzNHnVxikD82qTsiFEKs5lrkY7udDbT8tqW1607JlQrqKDgobKDenhn450nduXpUO94/gr/lgrLOmayCi5qgd7JcBYlvx+szbddQGWXfcBvI0WQ+a+cJ/Y9ua2fRXoGaBRCpUgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nbxeuozG; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBFCA1F000E9;
	Thu, 28 May 2026 02:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779934839;
	bh=SkQAGEJ+0mJpsenxrEv8nn0/fOuvPHd8IGHv5d05r/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nbxeuozG0DsUWC0gOw8X4Xxb1msIFUmGuN78TPNQaQlQehZVOiLXFEBipQTt/sXJS
	 uYH/uZrTcb/FR3666C9WDQAqoj3+w1pDoEWVTtiDFx701Oen8ZLfql1tNli5vZrR97
	 vFQ3xxeMU2Yrrtkndz0uc5peN5OvX99CrZ2ZMtghPzrnJdMwz0xNALVfEa6+KgFpWm
	 dBEWbtXExz4CMVicTKCfLpda4FbkTn7PqPFTEsNGvu1MK3xmhhSCQWkxA3s+Z26O2Y
	 lCfZ5SKrDSaKrIhal4eQD0+JS3ewbwwb/kHe1f1h76827R/ExyxzhN1tVpGRuqi8ty
	 atch8uDjo89ag==
Date: Thu, 28 May 2026 02:20:36 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, linux-gpio@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] gpio: cros-ec: Drop unused assignment of
 platform_device_id driver data
Message-ID: <ahemdIn2aOc1y7G5@google.com>
References: <cover.1779893336.git.u.kleine-koenig@baylibre.com>
 <06dfc8d1df46467269ee6113f161edac234e51cf.1779893336.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <06dfc8d1df46467269ee6113f161edac234e51cf.1779893336.git.u.kleine-koenig@baylibre.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37604-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,baylibre.com:email]
X-Rspamd-Queue-Id: 5CE125EBBD7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 27, 2026 at 04:57:27PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> The driver explicitly set the .driver_data member of struct
> platform_device_id to zero without relying on that value. Drop this
> unused assignments.
> 
> While touching this array unify spacing and use named initializers for
> .name.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

