Return-Path: <linux-gpio+bounces-36892-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yF2VIXnaBmrsoQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36892-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 10:34:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC99F54B604
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 10:34:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD5713031012
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 08:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C66F3FFAD8;
	Fri, 15 May 2026 08:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OhxdOiSo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD1337C11B;
	Fri, 15 May 2026 08:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778833714; cv=none; b=J1KWBhviG5rWoMuzlIIH53jwEWO1OyCuSXIoaw3IFaNlMGRPlhNp1j34IjkwSlOtMuCOCBBIO4w9k/IHR0ED5lFiqt3RvZoBq1C/QOaz+vr890D44XvOZzSpoejtZR2lXyoqj08e8y7OJ7gtjNAtKtcdxk7mnianMq2Ew3puMxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778833714; c=relaxed/simple;
	bh=LFEemsBggQfv1u98nkZBEBpaFHtd2zQ/yDfv4oNsllM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pUuvs5sts8wY2JmWK40BpZkmiUtgxxvMKS3KSUQClLguITYT5ueH1tbMzXyhkILRzIeZqM3E1L9G4VM+zQjRG1XI0MbeMghIgdZtyqplXDTCs8iqpXWOsCXURy6Qxa1rRSQXGgqssSLj2BArMp/EOzCOtwsMQbpZl1DQWvKyFy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OhxdOiSo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20359C2BCB0;
	Fri, 15 May 2026 08:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778833713;
	bh=LFEemsBggQfv1u98nkZBEBpaFHtd2zQ/yDfv4oNsllM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OhxdOiSoxz1uBwTenAYJBFmM5BSYGdUcdhCrJDBenFOOvg3ThEtopHxfZMre5nSZV
	 0SpRNFA9bqoVOnXO/0ACvKG0sVFJ9N9nOGyJ48cCraeNbGPWHc6R03okF6v9yO4lyA
	 w+Q2oVc20RFyNAGPKWSzko810jaX8XC0MYxEBsnexNAA6IHohwXGsbn1PkfFwS5XP/
	 E1BIsNcO+kaxsj8MwrCFT0xJTGvAn5rl5b3T4XW0SQro3uW6ZaL/QQBFmIRgmqK5r7
	 aMsg2AtZfQCvsIFXKGB7f1m07PSUbI0GAthG5/DIe/XzACCxjJNVY8Zve475iuqXeW
	 r3aTQvf4taINw==
Date: Fri, 15 May 2026 08:28:29 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Benson Leung <bleung@chromium.org>, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev, driver-core@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Johan Hovold <johan@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v10 8/9] platform/chrome: Protect cros_ec_device
 lifecycle with revocable
Message-ID: <agbZLY0wn85JqTFV@google.com>
References: <20260508105448.31799-1-tzungbi@kernel.org>
 <20260508105448.31799-9-tzungbi@kernel.org>
 <20260508115309.GA9254@nvidia.com>
 <agVCoxuTu7l60TH-@google.com>
 <20260514160214.GH787748@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514160214.GH787748@nvidia.com>
X-Rspamd-Queue-Id: EC99F54B604
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36892-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 01:02:14PM -0300, Jason Gunthorpe wrote:
> On Thu, May 14, 2026 at 03:33:55AM +0000, Tzung-Bi Shih wrote:
> 
> > > Given you say this is such a bug I think you really should be sending
> > > a series that is patches 5 through 7 from the other series and a
> > > simple rwsem instead of misc_deregister_sync() to deal with this bug
> > > ASAP. No need to complicate a simple bug fix in a driver with all
> > > these core changes.
> > 
> > Apologies for missing this suggestion.
> > 
> > For "patches 5 through 7 from the other series" I guess you're referring:
> > - https://lore.kernel.org/all/20260427134659.95181-6-tzungbi@kernel.org
> > - https://lore.kernel.org/all/20260427134659.95181-7-tzungbi@kernel.org
> > - https://lore.kernel.org/all/20260427134659.95181-8-tzungbi@kernel.org
> 
> Yes
> 
> > Could you provide a bit more detail on the rwsem approach?  I'm not
> > entirely clear on what data or operations the rwsem would be protecting.
> 
> Just put a rwsem, or even scru, inside the driver's fops.
> 
> You can refactor that out to a misc or revocable later.

I see.  Thank you for your suggestion.  I will explore it and send out a
new version.

