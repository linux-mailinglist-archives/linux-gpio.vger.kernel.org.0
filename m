Return-Path: <linux-gpio+bounces-36518-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBInIvqoAWqFhgEAu9opvQ
	(envelope-from <linux-gpio+bounces-36518-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 12:01:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DBA50B7B3
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 12:01:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 55E40301FCA5
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 09:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C0C13C2797;
	Mon, 11 May 2026 09:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uPrXkRf2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE302C08BB
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 09:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778493391; cv=none; b=GqvSRLTHdHtAFIaA6+GuHYW/ndTaP7lc4OACmE8ZaPOp8iRgHbpjDX7bMRzJd03UP/V9XV7nHP91Z8SekeH/Q22R3UZAoXzE7ZBr8wQ4q4YTACsoi4y+0VjqfS4x8zVFkGViX3u3ufwmVWEbHS3Zbtkp7HWRSAS36io8D3bonVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778493391; c=relaxed/simple;
	bh=jwdSVRtGIcWLrvFZBuFl4JD/KFS09NR7Zl+VS2s9cis=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ma9aqZWksPEHte+bgV5G2o/ZRqL6G+FXrBANMMQPJaMtt3n/AQxuEZHg84KOjKV9YA65MO/HRs10YM0aG0NBBw9TjlNhdTU29aBnoi+/BYMjrGk42eEoTOHScagpmb3Kmim5rIOeQTCCnB8JqDlkMoVYpaa+NON5FxTxPfKS/to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uPrXkRf2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08A4DC2BCFA
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 09:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778493391;
	bh=jwdSVRtGIcWLrvFZBuFl4JD/KFS09NR7Zl+VS2s9cis=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uPrXkRf2dpI3Vvev8P0pLDS4e7hO7mU2LqL+AtaWtY59djlXphhFhGPu816+iBdyl
	 oGWiWaeLqmYdmTG8YZ618U3vsyvAkn9DhQI+Lr61gWXFf1Z8ArdVR8HAWGX93MHmqL
	 cJUMDMFtfbPKCThxwweAgKPkWtzYpUvS76fRb0iiTxluzclgWue9DiiXe7mktbk6xq
	 YE7UitzXgB5R7fWrJ8nPVHQV1h4inSrMkpw3H4XcjRj0+qpNR173h8Gn9QZPNdfr8Z
	 p55IkUTGWQYccsya9TDeEU/MyU/GYaAYslmKX+FmywD96tnOYXDLwhvw53SiGHdKdi
	 BxLZTFT9jAhvw==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38be5e86918so51930261fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 02:56:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8XvUnHHoyUz1ZYE0cuycyNacoP1B7u8oDhvhXkYpgJVZhfXZpkxCcudtK+qKxscxdilgpQD/8Ojb5+@vger.kernel.org
X-Gm-Message-State: AOJu0YxL9IMQ363s3A4igAgZbwadrIH9EBOSbVJsVPuzshfN34O0q/LA
	za1YIZ+WFgNI9bL3pNILVVFb2qGQRPd/bd+v8xrGQqh8YfDyvavHcffFZFwf0lTk8h+EhMSFeb0
	6cms1orNpFF9MuPbgrrKxzmqlak1X0g+sGfo1gs9M3g==
X-Received: by 2002:ac2:4c48:0:b0:5a8:6e82:6840 with SMTP id
 2adb3069b0e04-5a887cde953mr10788336e87.20.1778493389690; Mon, 11 May 2026
 02:56:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508-regmap-gpio-sparse-fixed-dir-v2-0-deee84df3027@kernel.org>
In-Reply-To: <20260508-regmap-gpio-sparse-fixed-dir-v2-0-deee84df3027@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 11 May 2026 11:56:18 +0200
X-Gmail-Original-Message-ID: <CAMRc=Mfzy=pWuvJ5Y1hqoWuYk8JSwzBxNFeVSwyFQ76CAEZXLg@mail.gmail.com>
X-Gm-Features: AVHnY4Jptu-kvQCBK498hk4YxhSY_00vKKM0YTN77FK8-5HHk76EbJ9tycN7An4
Message-ID: <CAMRc=Mfzy=pWuvJ5Y1hqoWuYk8JSwzBxNFeVSwyFQ76CAEZXLg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Improvement spotted during patch review.
To: Linus Walleij <linusw@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alex Elder <elder@riscstar.com>, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 06DBA50B7B3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36518-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Fri, May 8, 2026 at 2:51=E2=80=AFPM Linus Walleij <linusw@kernel.org> wr=
ote:
>
> Support sparse unidirectional GPIO lines.
>
> To be used in a forthcoming submission.
>

Should I apply it or will Alex just include it in his series?

Bart

