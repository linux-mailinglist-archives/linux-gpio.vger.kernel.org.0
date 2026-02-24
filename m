Return-Path: <linux-gpio+bounces-32122-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BmmC8punWk9QAQAu9opvQ
	(envelope-from <linux-gpio+bounces-32122-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 10:26:34 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF0F1848D4
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 10:26:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3E28A3049D6B
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 09:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6053F36C587;
	Tue, 24 Feb 2026 09:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qMn+C6+M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237D2368285
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 09:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771925167; cv=none; b=Hwfs0xotbkqbKh7nuasBNinMnDpi8nffcMVCU2S1Suxx30/rv7patYmO2BSCu+gJ9wmTzKodWMhLLlAOWxh+8AIISQyJXhLa1bL8gzholZuBzpya3gyLI6Viji3IAM3jroXWAWrCXo4v7ofDfWn49XQ0DcMFrM8eKoPq1X1T4X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771925167; c=relaxed/simple;
	bh=pVNrmYp1Uam0EbdSBHUim4n7iG/uWJF4SCKjfxEEVuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QQ8MHPmv4KWWeBcABDPcLNbUsY1OjgZ4mirfLGax/aivnhpzgLPZB5qjKfzFY0eWyrDGGjKc7QOjMESuDBYKr8zJ6tyYqvIgi70czi3QHxlbfUK9j2LysTCK5PSxpWAcHqsucpw4V4JL7OImTJViebwStrU4sBPZzA9slnBdeNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qMn+C6+M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5374C2BC86
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 09:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771925166;
	bh=pVNrmYp1Uam0EbdSBHUim4n7iG/uWJF4SCKjfxEEVuc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qMn+C6+Mwlp6JXD1Cb9rAPpQNmDTfldK2CpcdE8T8oIm2u3kcnU5dPr70KXs+Ik2J
	 a0JH5zJDhFTU7B0n/1NTZNqRZdohTapgJe7trZa6VDD1XWDHhbrkGSNCw9V1Qoibxz
	 pdVsUbaLV0KY1Jau/xf/ye0ASC53cN32hn356KUJdxJ6Th+GN+oit/a0A6PodtvB3l
	 YNlgrqhxm5w4q8aBeniDGgJ5LdPXePdc+GRZpwizuBrmm0Uen/5GnAgqWgsW464KKE
	 xKJ+75hoeDkQ7ZngKbODxjxo2tfmdnt2F5/gYI7kM3JwO3ayxWlad/xBL5PqTu5UgB
	 fjUbPS452CnEg==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-797a52d8c34so49799607b3.2
        for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 01:26:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWAyNCo/Brxd931cQV68S1D15/yDl0R+3J0Xm4AGCwlzXQ6vKuI7niDWmCFwI8braYEK2O9zPGGoIWG@vger.kernel.org
X-Gm-Message-State: AOJu0YzZs+DkUW1NPoKVURkryaG7OHJSuWOZqh3eXNYy4k7eEbgep6Mi
	Ny6FReIfY43u5d2RWBRRmYL8nHiAx2LifNnfCK3ZqYQP2RSNYbVyFims/DUWTnrdTHIMzTVKbmI
	M+tB0TC0f30nTEP9IdOtrITKkiY4lFUc=
X-Received: by 2002:a05:690c:c04a:b0:78f:f3c6:f303 with SMTP id
 00721157ae682-79828fd2c96mr71536927b3.38.1771925166146; Tue, 24 Feb 2026
 01:26:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260222-pinctrl-pic32-v1-0-db86248da18d@redhat.com>
In-Reply-To: <20260222-pinctrl-pic32-v1-0-db86248da18d@redhat.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Feb 2026 10:25:55 +0100
X-Gmail-Original-Message-ID: <CAD++jLkKwQrPb4ouz7Es73W-hwaRaz4s0EewyjVGLKmyVT8wpg@mail.gmail.com>
X-Gm-Features: AaiRm52XQhqlb_HaTSqp1rT8h2iRu1veqaqJFe0gIL2qGvRYs7Sn-wsAItgzaU0
Message-ID: <CAD++jLkKwQrPb4ouz7Es73W-hwaRaz4s0EewyjVGLKmyVT8wpg@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: pic32: allow driver to be compiled with COMPILE_TEST
To: Brian Masney <bmasney@redhat.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Joshua Henderson <joshua.henderson@microchip.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32122-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,checkpatch.pl:url]
X-Rspamd-Queue-Id: ADF0F1848D4
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 12:33=E2=80=AFAM Brian Masney <bmasney@redhat.com> =
wrote:

> While migrating a pic32 clk driver off of a legacy API, I mistakenly
> broke one of the drivers, and the issue could have been caught with a
> simple compile test. Now that the dependent patches have been merged
> into Linus's tree via the MIPS tree, we can now enable COMPILE_TEST
> for all of pic32 drivers in this subsystem.
>
> While changes are being made to this driver, let's also fix any
> outstanding checkpatch.pl errors with this driver.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Thanks Brian, going the extra mile as always!
Patches applied for v7.1.

Yours,
Linus Walleij

