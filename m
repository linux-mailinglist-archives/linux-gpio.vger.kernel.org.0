Return-Path: <linux-gpio+bounces-31909-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBQyHCp+l2kOzQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31909-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 22:18:34 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A2D162B50
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 22:18:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2F24B3006D62
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 21:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95448328B5F;
	Thu, 19 Feb 2026 21:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="owm1hZmN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577AB30ACF2
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 21:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771535907; cv=none; b=p6hGJ/RLyzOIVQYDYkb1+vc2ATgjXx+EJtfjvUSvFDYCAsmpMhTiMPxRdEDTKvQBRZSa0oVoU8mzbfkStpmRtYXE0ZqnpaZt1UZpCrGhyVjHBmXo+S39mlDHy/ixoZV0I+IHdc6VLbaseHr6xT8gPZh0ptSIqDuDcdulkIq+lMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771535907; c=relaxed/simple;
	bh=tUxBIDwQVugNVs9UIJHAxDvi+aHj8+1zMS8gHbDHIhU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gpKVYyiXso5ykjQQzHOIl67MVrVz+z3x54q+KQHeDdRsgquLiU17+5jy36G9Vrf04Af0LnI6e5RRmjPbbafQtsUMhhp1icxXYBKYMpFHMyyQoiC71FFY+6uxparPlhMSA//MdvUifVlotv+XQVWwYBswFsNTQsPXhnxAPfs2ziQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=owm1hZmN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D54FC4AF0C
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 21:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771535907;
	bh=tUxBIDwQVugNVs9UIJHAxDvi+aHj8+1zMS8gHbDHIhU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=owm1hZmN7mf4NjB4OZNAlZGNvfy3mYchJfUx9pr5XROwG/GWMBhEiAfCTcymjnXDV
	 zcKLmdHQwNfmtdKXQU6VjKgWs2ff/sLLhBhl2lyOoBO+yszNahNWW+zXepfSZAjCc8
	 zY8b0NJPcwcoosTfh5KOWFo7XtsH7DTsP4mioJuY7mW4stOgu7k69SYhZ6p+jwjZPW
	 mxTb6dNx6XQ0o6QWt1yIe5wuvGrnPigok0TC+k8ZfjvdWWPLSpRHwVjrZY7FNjTPnb
	 C6yjSDzKuHXiXI9NnZDhDVPdZINtUyjFRwG3s8FZXak7EznF7lTXf0Sk60F6mIdES0
	 p1AzChZfZ2rOQ==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3870778358aso13077461fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 13:18:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXXlxVPmNVb8FaBhEtZiRDwnpHNRqP1CgX9pDe4lz7JMTYhdOB50/UdbOJC1K0R0TUnem1aaZc8L8Ya@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf1HT7FFsyJyVO8H56H35tvMLTQrj6DRvJzvhmv/96lkniyRYs
	2Pt1pzrDURWtrfrvhON/+tRoa380RO4t2CbHMMe6ZyOsF/zdebRkvOaz2OLD21q/8X9iXkH5oRK
	hdiZTSmw1tk4fuZB3zKDAnoXxg9zcQvz/yLNBGaCOyg==
X-Received: by 2002:a05:651c:555:b0:386:e95f:edf0 with SMTP id
 38308e7fff4ca-38810566d71mr66114931fa.27.1771535905636; Thu, 19 Feb 2026
 13:18:25 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Feb 2026 15:18:24 -0600
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Feb 2026 15:18:24 -0600
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <aZdkN2zje5CEaar_@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219-device-match-secondary-fwnode-v1-0-a64e8d4754bc@oss.qualcomm.com>
 <20260219-device-match-secondary-fwnode-v1-1-a64e8d4754bc@oss.qualcomm.com>
 <2026021900-trekker-twenty-9daa@gregkh> <CAMRc=MekX-pXJEs7W9vn8-exAXyfNN3JMwrVNDPXg0b77X1NNw@mail.gmail.com>
 <DGJ3H078RVW8.28AJL6FR3OKOO@kernel.org> <aZdkN2zje5CEaar_@smile.fi.intel.com>
Date: Thu, 19 Feb 2026 15:18:24 -0600
X-Gmail-Original-Message-ID: <CAMRc=MfcrD8NNh+8WaO_3BYG8Eqoi5wz__s7AeCR=rt1NkWrkA@mail.gmail.com>
X-Gm-Features: AaiRm529pThMQ4J2sRCbBqIoJiC2QeV84imdoNVqUkRjuOHAAhgtwENRY-0VvR4
Message-ID: <CAMRc=MfcrD8NNh+8WaO_3BYG8Eqoi5wz__s7AeCR=rt1NkWrkA@mail.gmail.com>
Subject: Re: [PATCH 1/2] driver core: provide device_match_fwnode_ext()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,oss.qualcomm.com,gmail.com,lists.linux.dev,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:email,mail.gmail.com:mid];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-31909-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 97A2D162B50
X-Rspamd-Action: no action

On Thu, 19 Feb 2026 20:27:51 +0100, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> On Thu, Feb 19, 2026 at 05:55:20PM +0100, Danilo Krummrich wrote:
>> On Thu Feb 19, 2026 at 5:39 PM CET, Bartosz Golaszewski wrote:
>
> ...
>
>> Also, is there a reason why we need both device_match_fwnode() *and*
>> device_match_fwnode_ext()?
>
> Yes. We don't want (at least for now) to dive into bug hunting in a 2+ years
> horizon if something goes wrong with [currently] working drivers that use
> device_match_fwnode() against the cases when there are primary and secondary
> fwnodes present.
>
> I won't put my bet that extending device_match_fwnode() won't break anything.
> And I don't want to invest (waste?) my time to learn each of the existing cases.
>
> The proposed way is robust and safest. And for the record, I will be the first
> person to push back device_match_fwnode() upgrade without a comprehensive testing
> on real (affected) HW.
>

Who's got the final word here? I responded to Danilo's email saying I can fold
the new code into the existing function but you are against it.

Bart

