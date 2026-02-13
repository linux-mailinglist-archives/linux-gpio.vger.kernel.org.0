Return-Path: <linux-gpio+bounces-31655-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDHSG73hjmluFgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31655-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 09:33:01 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D906513415D
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 09:33:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D02D301E9A0
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 08:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4337F3314B4;
	Fri, 13 Feb 2026 08:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UgFzx3wG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0519730C629;
	Fri, 13 Feb 2026 08:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770971576; cv=none; b=CRMvGhkj41y/vKA8oUnv70+3YdaaYYOmzdUktMDxvbXgxZL9fCEDshVuIARG46FfKQVQ83erSA5MdNIKBe9SaInK9vtHranHJj7MJeav+0mhGCzC2rZlUwJ6a4EI2y5A9ow8J5SBJTt5Ytfc1nR9GUJKjiT9FP1VBTba3MXaLec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770971576; c=relaxed/simple;
	bh=6GS26ow2gZZx3KiNG3xbqGtyQ2NWZkVMgRBjnbdL4a0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Egs/Y3AUDkCWv9Iz/UaACFXo6PloSv2vqyozRayfRz1PgaB03vmCy4EhGw/xTYI/LboNjEMjtZz5I4wyaWtmi3J7O1l+h79pC6KxPb5sfy1wjkQdpfUQoZj03X5UQw9gvJXc5zEzL6Fovr8O/q2FVp7hzPMiGmApqgdDQxx7HRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UgFzx3wG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71C14C116C6;
	Fri, 13 Feb 2026 08:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770971575;
	bh=6GS26ow2gZZx3KiNG3xbqGtyQ2NWZkVMgRBjnbdL4a0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UgFzx3wG8ICGdaYmPyHvc2e1qCr7Dwg4zDBZZuCXUmZR8Ggjdb/qW2rh9hIeModH5
	 fUHv6szzJ/atCmj8fo9vUUFsTe3N93C2Xg4C2sVvsn4lUeft2u1zidIF4oe7RWJGFM
	 +093Ih5tGQVeIaMnBQK2hHiSlCbDULoPUycKHHvJrKgov5UXHgsLd1thVS0T3r9HlV
	 /vBbeQtUFDYoddCjSkkQF4VlM20DZM4gTlaVpaj0kamyXDsv4LZJhczY9udM9IGNW4
	 Dzr3/M/aHJBVylWVKo519TIrJoGkcXswdDeGlFyNa5JPoQ3f+pnlIRyP3zwG0uzroN
	 s+HiiJRfy3U5g==
Received: from johan by rho.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vqobX-000000008Rc-1Gwt;
	Fri, 13 Feb 2026 09:32:47 +0100
Date: Fri, 13 Feb 2026 09:32:47 +0100
From: Johan Hovold <johan@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] gpio: sysfs: fix chip removal with GPIOs exported over
 sysfs
Message-ID: <aY7hr2NGmZ3gBd5Y@hovoldconsulting.com>
References: <20260212133505.81516-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212133505.81516-1-bartosz.golaszewski@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31655-lists,linux-gpio=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-gpio@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: D906513415D
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 02:35:05PM +0100, Bartosz Golaszewski wrote:
> Currently if we export a GPIO over sysfs and unbind the parent GPIO
> controller, the exported attribute will remain under /sys/class/gpio
> because once we remove the parent device, we can no longer associate the
> descriptor with it in gpiod_unexport() and never drop the final
> reference.

Is this a recent regression? I'm quite sure fixed this once back in
2015.

> Rework the teardown code: provide an unlocked variant of
> gpiod_unexport() and remove all exported GPIOs with the sysfs_lock taken
> before unregistering the parent device itself. This is done to prevent
> any new exports happening before we unregister the device completely.

So please add a Fixes tag here to document this.

> Cc: stable@vger.kernel.org
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Johan

