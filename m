Return-Path: <linux-gpio+bounces-31402-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oH+fE1QogmnPPgMAu9opvQ
	(envelope-from <linux-gpio+bounces-31402-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 17:54:44 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A2CDC541
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 17:54:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E8E5A3048650
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Feb 2026 16:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7637B3D3302;
	Tue,  3 Feb 2026 16:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a3lXLVmW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384857FBAC
	for <linux-gpio@vger.kernel.org>; Tue,  3 Feb 2026 16:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770137624; cv=none; b=n629hrXmEoN6cTLFfPALixu/pt4j1OAd9ri2fVtbow0Yot2zUUacu4xA7d0pmYuvFcu04cvnYtKeYEgehGLDcPkLDLJGYY9BAT0w68PyTQo11kuNZSTGlYJricZjJqBmYwBCw8/Z+fSjb/LuuxF2utjpBbWWkCXOsJbhVds0hhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770137624; c=relaxed/simple;
	bh=In+xquHWoZBaw2PD6PDwd7Foyz7Q6UdduSfMTMauVfU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mVxi1p3aRgz3NPxUOWKo6HbcbVZoQJ5m94NiLnCuLX18byF6X3yyQXzqwWpjwYQjUk7oHrPdnCBgVcX6RA8etuuQEeDcpmXu458hvPqqkPf+5m3PZ8E65V+BKrKJftEaUQ/V853pDy2GNgY3/jAHrtxEaMEKLpGtaMwUc8SKXyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a3lXLVmW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BA54C16AAE
	for <linux-gpio@vger.kernel.org>; Tue,  3 Feb 2026 16:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770137624;
	bh=In+xquHWoZBaw2PD6PDwd7Foyz7Q6UdduSfMTMauVfU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=a3lXLVmW8XaVVyXFHP77Jh8kiXU9phxfs7k1HTPB3KQ4ZiobhKePdhMdEdhN7DXQ5
	 UE9tKH0KVOb+EkRW12cv9v500DPMcgo674XPA5o9qgv10BewZcXvTEiito81sbiqz1
	 qUYFlyAZTOplvsET76c5+JekJ1/imiqg60ghT647PlMjENwXHs/oxkass8KdFrx8SA
	 Ls6+IIngna9AArC4qkyiCDekgMRFqBW89lFtR/fAyrqcTql27Wa64UVygw8G6hnWD9
	 +/h3IZyG6OUv9Z2cslufFT0NYzzGsiDbZylzyy5Jkm1C4nKtN/eoR+H4weObKMM1f0
	 lKh2PehlKZilA==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59de38466c2so7327991e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 03 Feb 2026 08:53:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUkN5edBAmXVIm8n6iqmM52w915jYxns2btZHqwvTVFbBME+fPZe6QyL/+zkRCQAuCi8HVHILkt+4wn@vger.kernel.org
X-Gm-Message-State: AOJu0YwWjFnXNbVVsOKiVpx/k3HQ/glTtthpFqEF805B/Iiycs8swLKi
	gpwRRr9K3sFNBxxxnXc+lE+cR/5QO0oyMdVhBs8nDrYnNG2GFXSmIAAiY3jQ8GUvc6DUChM0jHT
	DADiQ4MIO8jIMyn6OsHqxUNuRrF99sAQFtw3RzyYROA==
X-Received: by 2002:a05:6512:15a2:b0:59b:6f90:4a2 with SMTP id
 2adb3069b0e04-59e163ff132mr5847751e87.16.1770137622739; Tue, 03 Feb 2026
 08:53:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203061059.975605-1-tzungbi@kernel.org>
In-Reply-To: <20260203061059.975605-1-tzungbi@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 3 Feb 2026 17:53:29 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdnzSEDD8tiioY9h8QmWA5k=h=DHMbvKkROQ9OFMKDycQ@mail.gmail.com>
X-Gm-Features: AZwV_QiPVGWFUfBmIgY29grURrZuflz5CVbstkGa2ijfZYwFaDTE-cJ11YGJ5ng
Message-ID: <CAMRc=MdnzSEDD8tiioY9h8QmWA5k=h=DHMbvKkROQ9OFMKDycQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] gpio: Adopt revocable mechanism for UAF prevention
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, chrome-platform@lists.linux.dev, 
	Dan Williams <dan.j.williams@intel.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-31402-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[16];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 17A2CDC541
X-Rspamd-Action: no action

On Tue, Feb 3, 2026 at 7:11=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> w=
rote:
>
> This series transitions the UAF prevention logic within the GPIO core
> (gpiolib) to use the 'revocable' mechanism.
>
> The existing code aims to prevent UAF issues when the underlying GPIO
> chip is removed.  This series replaces that custom logic with the
> generic 'revocable' API, which is designed to handle such lifecycle
> dependencies.  There should be no changes in behavior.
>
> The series applies after:
> - https://lore.kernel.org/all/20260129143733.45618-1-tzungbi@kernel.org
> - https://lore.kernel.org/all/20260203060210.972243-1-tzungbi@kernel.org
>
> Bartosz: the series was planned to send after -rc1 comes.  But I think
> it'd be great to send out for your early review and testing if possible.
> The series base on v6.19-rc8, driver-core-next, and gpio/for-next.
> Please use the temporary integration testing branch
> https://git.kernel.org/pub/scm/linux/kernel/git/tzungbi/chrome-platform.g=
it/log/?h=3Dgpio_rev
> if you'd like to.
>

One high-level note: for this to be accepted into GPIO, the revocable
API contract must state very clearly that revocable_try_access() works
from process AND atomic context while also allowing sleeping inside
revocable critical sections. I'm saying this because while we use
naked SRCU, we can rely on the SRCU contract. Once we switch to
revocable, if someone - for instance - comes up with an idea of
replacing the internal primitives with rwsem, GPIO will break.

Bartosz

