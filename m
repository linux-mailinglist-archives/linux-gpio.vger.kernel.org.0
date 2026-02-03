Return-Path: <linux-gpio+bounces-31383-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GQq4KLzFgWk0JwMAu9opvQ
	(envelope-from <linux-gpio+bounces-31383-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 10:54:04 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B545D724D
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 10:54:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D61D3075F8C
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Feb 2026 09:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7428C39902E;
	Tue,  3 Feb 2026 09:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yh7zXQ74"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34776393DF5;
	Tue,  3 Feb 2026 09:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770112320; cv=none; b=Fz8/+5TV5NaRHtVR520oZyiBDScEM726FfkP22h/AasnbT2RmAhZYfWu3yMvDOMI/bJE1ksFl0Azxvcs0AapYEBJZHNf7/Z/C20m3d+2AN/2B3jGB6ZBdwUSOFfO3Xxgp5a7i5AJFsiotlveggMe1EnnKzmrz6xFLCW74en7g/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770112320; c=relaxed/simple;
	bh=JoSo1U6Ut8p2NIj9qp0jlb4l/KgJvCWtB/NubAXASxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=flQ5V3zoRRriKpAfzwmglGj2CFqziYKEkpcqOf0FQsJY2zIH9PwkMhA9f1yy3gGTHxds5tXPS9YA1SHAmWe+fyXXsxkfoQ/J07rc/ZDq8Llp3Er8rzkZ/1CVUofj/Q3wOiYr45/CuoLValoNM5TZi+lBQT2itbZXPK2T7rB+tkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yh7zXQ74; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 672ADC116D0;
	Tue,  3 Feb 2026 09:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770112319;
	bh=JoSo1U6Ut8p2NIj9qp0jlb4l/KgJvCWtB/NubAXASxo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yh7zXQ7443ey47b/4qL7hWhikaxa7wSLA9BvoIZd/S8NGfOpmskBo62jAFK1E0k1R
	 M1u48wDhNaYfRQVYJP2cNktX6g77jpAKi1z3Hir9j82XX7fsALNQf+94U9RSyZPZIS
	 FRs8+P3uJAYK0YhwQTTBthhNjBHY6uSRS8vn6rf5rmDHZk6RgotMcj3REsevjWsFEH
	 6e462cyswn4UFcwfdIJy4h9qAuVex2BqOeJsVhCIKoT16cWyO72WmqV4MiTTtq146E
	 342uCEEtFkQ5Odn+ZPo5PpGypDgY+LfrJhyL6Hz5XuAPSNb7FcrUEUvboSHSF4ZkKG
	 ENu9tai4XJxkw==
Date: Tue, 3 Feb 2026 09:51:55 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linusw@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Johan Hovold <johan@kernel.org>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Dan Williams <dan.j.williams@intel.com>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 08/11] gpio: cdev: Leverage revocable for accessing
 struct gpio_chip
Message-ID: <aYHFO0TlXMP4Bli-@google.com>
References: <20260203061059.975605-1-tzungbi@kernel.org>
 <20260203061059.975605-9-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203061059.975605-9-tzungbi@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31383-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2B545D724D
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 06:10:55AM +0000, Tzung-Bi Shih wrote:
> ---
> v2:
> - Change usages accordingly after applying
>   https://lore.kernel.org/all/20260129143733.45618-4-tzungbi@kernel.org.
>   - Preserve a local storage for `struct revocable`.
> - Combine multiple patches (see "v1:").

Forgot to mention it in the changelog:
- v2 fixes a race condition reported in
  https://lore.kernel.org/all/CAMRc=McDaipt85OHm0MksLkuf6E79dY1uNSqqbcJnoQTUs81Pw@mail.gmail.com/
  and analyzed in
  https://lore.kernel.org/all/aXEEUWwkxHZzCnaI@tzungbi-laptop/.
  In v1, the blocking_notifier_chain_unregister() will be skipped if the
  chip has been removed, leading an UAF in gpiolib_cdev_unregister().
  In v2, it won't skip blocking_notifier_chain_unregister().

> 
> v1:
> - https://lore.kernel.org/all/20260116081036.352286-14-tzungbi@kernel.org
> - https://lore.kernel.org/all/20260116081036.352286-15-tzungbi@kernel.org
> - https://lore.kernel.org/all/20260116081036.352286-16-tzungbi@kernel.org
> - https://lore.kernel.org/all/20260116081036.352286-17-tzungbi@kernel.org
> - https://lore.kernel.org/all/20260116081036.352286-18-tzungbi@kernel.org

