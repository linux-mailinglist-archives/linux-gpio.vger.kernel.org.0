Return-Path: <linux-gpio+bounces-31969-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCbyNSKBmGlMJQMAu9opvQ
	(envelope-from <linux-gpio+bounces-31969-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 16:43:30 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC83168FD1
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 16:43:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A30383011D5A
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 15:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9456E345757;
	Fri, 20 Feb 2026 15:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EKe0E98M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55016286430;
	Fri, 20 Feb 2026 15:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771602205; cv=none; b=uwualfhF3J0KdbYeosPyTJpXe2Ljlbn1MVKj9uIllpAF1oH0z+Ad+2UAlLHUcjy+K01eW/eMHkNW37kbUO4VVT9s5Jj4jx0ZMxp3rqS5+4jHI9Syzue5ZCZuWOZoQKP7YWztqVCufiDLtK1MOXxDlYwxTcW7UaTi31tpH0waDCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771602205; c=relaxed/simple;
	bh=kg2WuXP7X3de/f2zUy3LWo9RNh1w4lXTTtyimLoycFw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Dw2ll7+zCIMtNL7x1hu/ICmD0ewN65uw/Dzeyf+b9CW000TdIz/9xhfxMnA3RP7uLe2YONr34nWkiAdph8e6x9wiDbLh05Omxx5Rg5S09uVrOVfRgzUduvyCOHd2tI96CrZm9+X2T98HTJ8evx8TVt1ikwen0UBhTGDVx6quXsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EKe0E98M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AACAC116D0;
	Fri, 20 Feb 2026 15:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771602205;
	bh=kg2WuXP7X3de/f2zUy3LWo9RNh1w4lXTTtyimLoycFw=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=EKe0E98M9+npQREHtUTHdPAyKf4dY6BIH9MdhLMySKYMYNxRLI+4o2CDG4h9ywppY
	 JGNiJHODvx9XUIyu5Ihj8aFtk7kptYyq290NIzom9+EbAHTYw3vBIV0ZW189IIpm6Z
	 e6DpzcMtYbbpqnbFRvTmT9GvCAlpiSVzgbFK2IjyUTprt53Lt2kcRI6KBR+1lBLI3N
	 siHpEhwR0gE/O3QayRmfb0SQAcy81BPfG92V2b/rAHI7h9paYamzLL92hhoZM6qZLk
	 l82+3xekU1UBF+juxLdDF2BOktoGvx/mwycuOz0GG8Z2vQY7ToZeQ9ql8/E2rs6qRC
	 szBcTBr7Ai+nQ==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Feb 2026 16:43:21 +0100
Message-Id: <DGJWKFUBSS0W.2AECDX36IMNAO@kernel.org>
Subject: Re: [PATCH 1/2] driver core: provide device_match_fwnode_ext()
Cc: "Bartosz Golaszewski" <brgl@kernel.org>, "Andy Shevchenko"
 <andriy.shevchenko@linux.intel.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Linus Walleij" <linusw@kernel.org>, "Dmitry
 Torokhov" <dmitry.torokhov@gmail.com>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>, "Bartosz
 Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260219-device-match-secondary-fwnode-v1-0-a64e8d4754bc@oss.qualcomm.com> <20260219-device-match-secondary-fwnode-v1-1-a64e8d4754bc@oss.qualcomm.com> <aZdraIXlkAHwP-Pm@smile.fi.intel.com> <CAMRc=MdYcbO74sbjvKeg5k_E7EHfovFHHasDx2erWfcO39zBNA@mail.gmail.com> <aZgPGndb-6FTlnyR@smile.fi.intel.com> <CAMRc=McUnsnVOVvxDwTKmchrvyh-_HCwEyJLnseE29d00Eicbw@mail.gmail.com> <CAJZ5v0gM08=Zq-VMHX-RT78L=HDacbayM7=SoQ2di-Hsc2SB0w@mail.gmail.com>
In-Reply-To: <CAJZ5v0gM08=Zq-VMHX-RT78L=HDacbayM7=SoQ2di-Hsc2SB0w@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31969-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,gmail.com,lists.linux.dev,vger.kernel.org,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bootlin.com:url]
X-Rspamd-Queue-Id: 0CC83168FD1
X-Rspamd-Action: no action

On Fri Feb 20, 2026 at 1:08 PM CET, Rafael J. Wysocki wrote:
> Secondary fwnodes were not intended for device matching in the first
> place.  The idea was to use them as a secondary supply of device
> properties that may be missing from the primary node (think of an ACPI
> device object accompanied by a software node supplying properties that
> cannot be derived from the former).  They could be added by a driver
> after matching the primary node for the benefit of a generic
> framework.
>
> IMV, the example with children inheriting the fwnode from their parent
> where the user wants to add a different secondary node to each child
> doesn't really match the picture described above.  At least it was not
> anticipated.  The idea was to allow the parent's fwnode to be extended
> and then (possibly) inherited.
>
> That's why the secondary fwnode pointer is there under the primary one.
>
> So all of this goes beyond the original anticipated use of secondary
> fwnodes and it seems to be calling for a list of equivalent (not
> primary and secondary) fwnodes in struct device, but then of course
> there's the question about duplicate properties and whether or not the
> fwnode used for driver binding should be preferred (I don't see why
> not).
>
> Until all of this is resolved, I wouldn't even add a generic helper
> for matching secondary nodes.  I'd just put this code directly into
> gpio_chip_match_by_fwnode() along with a big fat comment explaining
> why exactly secondary nodes need to be taken into account there.

I'm aware that secondary software nodes were originally intended to supply
missing properties only.

However, I wonder whether the capability to match against them isn't actual=
ly a
natural, unavoidable consequence of how software nodes can be used to bridg=
e
(broken) connections between providers and consumers.

Or said differently, once PROPERTY_ENTRY_GPIO() - or more generically
PROPERTY_ENTRY_REF() - was introduced, it exposed secondary nodes within th=
e
device graph, which subsystems have to consider.

IIUC, this is also the reason why gpiod_fwnode_lookup() [1] (which is event=
ually
called from gpiod_get()) has to consider secondary nodes.

So, if I'm not mistaken with the above, it seems fair to provide such a hel=
per.

[1] https://elixir.bootlin.com/linux/v6.19-rc5/source/drivers/gpio/gpiolib.=
c#L4675

