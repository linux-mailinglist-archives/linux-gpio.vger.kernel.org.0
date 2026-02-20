Return-Path: <linux-gpio+bounces-31933-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gI6pLscRmGmL/gIAu9opvQ
	(envelope-from <linux-gpio+bounces-31933-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 08:48:23 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD6A165606
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 08:48:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86C363013A41
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 07:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0064309F1B;
	Fri, 20 Feb 2026 07:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R9qpPid/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B64322A
	for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 07:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771573700; cv=none; b=Z2i3YKsPzf9GkFrczb7H3tfPF50CMcqe+VlWkL01zeHkKg1BZVcQqVBOz7bw9AKIRlXNpzLl07/bqVSMVe1h+qklhkVHhozV2wLhjpoFkiYGQsfV+k+PaPATkscK+8xP4QlS3rsfjEWciGscBokE2QysEX1rzFdwNJ0e67hYBzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771573700; c=relaxed/simple;
	bh=v53LQV4Q3T9hChRDLZRrM4Ic/sOZcM0MQ57kKZHBTpk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VRmOw+oegT00gcOi94i1VMoLTxcSg38drcuIb46H9+IFRHdcB8WD2ObDUW2WyzxWJDk2prmSfDymK4WY2uhQepV5jFm9D6ZR/AVYyXBvxfe5oUgdEdJ5BTvVuiDOd+3DmGWtQVqyRSCg6UaK9Kh8fV1di0puoa79oAktxbqBwTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R9qpPid/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6511CC116C6
	for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 07:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771573700;
	bh=v53LQV4Q3T9hChRDLZRrM4Ic/sOZcM0MQ57kKZHBTpk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=R9qpPid/XoFAhyCcyuRAs1WN6wztt37YYmD0db05wMJ5wQ/4651vb9zMH7fN4Gqk2
	 xETmRlucw6lPkJiFpKG2Pox8MWTt/Y0xJIpmCepL8S4mz4XSl1G7EbrVInHBbaaU3b
	 i0uW9GMsEfdsUvaE4mKyOIClWOrjqgyikxQOtWeAuU+OkHZ+fENRYA85Ehzew/R2DM
	 +hpJDKZTK0Q4VCGMj0YcyftEKEoWvkDmmcN4x8qz0G1cL3bmsfOrhxxOQRnaK6oZb3
	 LwHY6xEUAaQdDpGwZ0w0sSwiEXwmPdq9k+LGnY0recm2e/qnF23jMqCcWdgpeYE05i
	 L76YPYzt5Uv+w==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-794fe16d032so16024017b3.3
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 23:48:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVk12hvJUKragfze6PyYFRNMGG132nZ7C3qOgXJXJ5iDX4SUML64xcnTp+0+rx9fBf/fyqRyuproTg5@vger.kernel.org
X-Gm-Message-State: AOJu0YxmdNfCFchjKphI9XcKhUvnVkuqZe/kirxCwkCnZrm8EgOg9UqA
	EiSrMS5KvFmcmodKM2LEmsiVhlGejMaFWdJ0t+FUdVWTaQ30QEpkyhuEkGj6FIZXbUbUyjFwRS6
	Gq7kzdwnp5sb1pmmGjbEcEZsR8GSxd50=
X-Received: by 2002:a05:690c:c4e8:b0:796:32e3:7d70 with SMTP id
 00721157ae682-797f71c3cdfmr63361147b3.15.1771573699647; Thu, 19 Feb 2026
 23:48:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260213092958.864411-1-tzungbi@kernel.org> <20260213092958.864411-3-tzungbi@kernel.org>
In-Reply-To: <20260213092958.864411-3-tzungbi@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Feb 2026 08:48:08 +0100
X-Gmail-Original-Message-ID: <CAD++jLnwMys_UtK6q1BQrLUXtaJMB1LLGavFNeK9iUHycHh2_w@mail.gmail.com>
X-Gm-Features: AaiRm53xMg_n2Y03o69iDiTYqfLxXGD63U_pCBqPoQwpkgBE7XaCz468RDhNwuk
Message-ID: <CAD++jLnwMys_UtK6q1BQrLUXtaJMB1LLGavFNeK9iUHycHh2_w@mail.gmail.com>
Subject: Re: [PATCH v3 02/11] gpio: Remove redundant check for struct gpio_chip
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Johan Hovold <johan@kernel.org>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Dan Williams <dan.j.williams@intel.com>, chrome-platform@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31933-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1DD6A165606
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 10:31=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org>=
 wrote:

> gpiolib_dbg_show() is only called by gpiolib_seq_show() which has
> ensured the struct gpio_chip.  Remove the redundant check in
> gpiolib_dbg_show().
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

That's a very nice patch, good observation!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

