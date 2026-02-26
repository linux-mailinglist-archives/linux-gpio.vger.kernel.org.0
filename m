Return-Path: <linux-gpio+bounces-32231-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBgxMUJAoGmrhAQAu9opvQ
	(envelope-from <linux-gpio+bounces-32231-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 13:44:50 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D6A1A5D96
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 13:44:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 142273013C4F
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 12:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 916CF3859DE;
	Thu, 26 Feb 2026 12:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XVomAkK6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517443859C1;
	Thu, 26 Feb 2026 12:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772109883; cv=none; b=hpXN0NLJvFlyPyZIofz/QbLoCmJDqr/zRjLa42LXT2ksQ0J8Ab5J2stmRHx4KcPNaSjC00ZUr8hqg5lyB44WpSICPpjY7AA9lVB0lrXQe/iqRVSt6NMismoVjLJaaKS4XtoUyj28mAn4Vt8KPLI8hqdEVKQOVp62a4xqVntQ6XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772109883; c=relaxed/simple;
	bh=HNefJLQ8SqSzKW9oEKPy1STJnKVxIgGwQ5gSQi1L+Ko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iMPhu+RW8Y2tUDT6zGetm0dEp8v5+wbYuUTqXLEXrhHAtRdu7lug3VnW7q7eGNYusIEl1Pynwrio37Nnmbezuruq9UxYpoyS0YYAtVvAjYypjpxT9TPGguIOjJp6gwwDtRzN+tigLfukRkJExxk6sdMBhaP2ZEeytM0PtBloTsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XVomAkK6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A75EDC116C6;
	Thu, 26 Feb 2026 12:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772109882;
	bh=HNefJLQ8SqSzKW9oEKPy1STJnKVxIgGwQ5gSQi1L+Ko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XVomAkK6ESaxF1caIRsIgsTiuxVN751D8AEYBJX9swDDDT/qLhIuCghLUR/jOoDI2
	 rlaSWQboIuIZlmAcvwJOa5R3EgbJlwJ/YSrNdQz+lO5e6bF7fP2QwxqSG3fwe8DCR+
	 hD5CX40TrCkd84H4WQcyPXaD+mwW+ocZAjf0rFzuDG0Eak0KyY2njWBjYAscMkMaj6
	 rf23IIV9zW21vjLVpMoe14DID4hiVpsW1w3oI2osyfD0KQHdDDKqYBWC3ykUKXehqS
	 p6V+oezoeVix+Nj5cKTPSFzZDggsPL/Jw0iZHdoLSBZGU1LCxPHShqInappj8ddyE3
	 j+C13auRgRS6w==
Date: Thu, 26 Feb 2026 20:44:39 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v4 0/6] gpio: Refactor and add selftest
Message-ID: <aaBAN7OOFNIpb6Wl@tzungbi-laptop>
References: <20260223061726.82161-1-tzungbi@kernel.org>
 <CAMRc=MdU_1WW82imNHPFVktn0HVSdY7kkGScEXmi+JaKRNTMuQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdU_1WW82imNHPFVktn0HVSdY7kkGScEXmi+JaKRNTMuQ@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32231-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 30D6A1A5D96
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 02:26:19AM -0800, Bartosz Golaszewski wrote:
> On Mon, 23 Feb 2026 07:17:20 +0100, Tzung-Bi Shih <tzungbi@kernel.org> said:
> > The series is separated from v3 to lessen the burden on the subsequent
> > revocable work per suggestion in
> > https://lore.kernel.org/all/CAMRc=MfQumD1ULx7yU4W2sx=35wyQf7-v4tSf44OqEu3JDBUAg@mail.gmail.com/.
> >
> > The series is based on v7.0-rc1 and applies after
> > https://lore.kernel.org/all/20260205092840.2574840-1-tzungbi@kernel.org.
[...]
> 
> This no longer applies on top of current linux-next. Could you please rabase
> and resend?

Did you try to apply the series after applying "[PATCH v3] gpio: Fix resource
leaks on errors in gpiochip_add_data_with_key()" (link above)?

Tried on next-20260225; the 1+6 patches apply.

