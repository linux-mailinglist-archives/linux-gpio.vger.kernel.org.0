Return-Path: <linux-gpio+bounces-32649-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8InlCcOhqmlLUgEAu9opvQ
	(envelope-from <linux-gpio+bounces-32649-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 10:43:31 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8423E21E23C
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 10:43:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D38713108957
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2026 09:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 125CB346ACF;
	Fri,  6 Mar 2026 09:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y9nx1fic"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83AD346A0D
	for <linux-gpio@vger.kernel.org>; Fri,  6 Mar 2026 09:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772789947; cv=none; b=YCwaO0HMYS7Y5y2U5RlwtaK8x+574jgXKh+u6z/dQfsECt6AKtu96ipgyRuW8XwaiAsg58uqamKvlB3QdFCjf2F/2076WrBQGdR+u9kNBUTtn/7LBhXLgPMB+5rT2R7ZbTEeurlUFPzTJ+KQG9K0aJUS4CZdhvD2j+F8k4SFzQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772789947; c=relaxed/simple;
	bh=rYSOOXpkoFJdrL1NPSf5rkoWzV92gzYi669jEpsYvls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NdrLKCpNuxnp4BOqkykCgCccjV6wcvdTpavUgUl3HvQjmslMsSjqf9rPb/q63bWumcQVfpiO7Dn0SJo/U+S2+fVMujk2GJm5SwK2t3AVp2Dq2SibxfkdRKQyb3wlkbB4ZCyQZINGB7shPhDSB8AkC1c5SHLHcaO670KQQq0+DRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y9nx1fic; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D606C4AF0B
	for <linux-gpio@vger.kernel.org>; Fri,  6 Mar 2026 09:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772789947;
	bh=rYSOOXpkoFJdrL1NPSf5rkoWzV92gzYi669jEpsYvls=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Y9nx1ficr4tLVAJpDIwbmxaDuvFATOp8+NdNFrfTIhSeRBmfa86WxRCQ2yQ5WiciP
	 E8pfJCGslVsjSoBdlR91Sw6Uy6pSrA/mAxCyAni1UdetJ3cXC5S4o7CSWMT9XB7gZR
	 +YbBDcQc0WkXDPKV9vrgfmj/5ZboMyQas8OWq5W2AQTFq3Rd+bAbvvaLHCxn0C0YFr
	 1yPRPOVqMI3I7wExc6JgnCfIY9Sg6EoBspfHkd8RwC+wU1EZ/43xXNAxFI8MkJQ2Iz
	 9nDRSBOG+z57sYKpBt5KeJHIeersx2fjsGAPi5SfRXFhZkyy7r/kx2rrZCD6WB8Jqj
	 GHs99goVQhvxg==
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64ad9238d8fso8868228d50.3
        for <linux-gpio@vger.kernel.org>; Fri, 06 Mar 2026 01:39:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX5lGRJ5clmiK7IWK8kNijnMY+R/Y8LZ4v8r7EK3wrCGkJ9X0uKiVuHw4KUSVD2NZ9jlBgqhUKmw7j8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7sP/fMZLTppuQB9MGacREJrVqxGHSGmJqk3NrYCp3v1aYKXOR
	IkiCCaUaatwjQNhecKzfw4La3QkVYbVpILrw6G4+4jn3zehel8GCr522YxBERfMWnJp310KZIdb
	r2m4nRqONCmYjw/LAmL7+NXbbp7+T7kA=
X-Received: by 2002:a53:ee57:0:b0:64c:b098:8046 with SMTP id
 956f58d0204a3-64d1418ee0emr1203778d50.32.1772789946680; Fri, 06 Mar 2026
 01:39:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7187C401290C256B+20260304084808.440955-1-xujialu@vimux.org> <D5F95320CE72E20A+20260306035539.2443355-2-xujialu@vimux.org>
In-Reply-To: <D5F95320CE72E20A+20260306035539.2443355-2-xujialu@vimux.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 6 Mar 2026 10:38:55 +0100
X-Gmail-Original-Message-ID: <CAD++jL=sj=DCuRvOveVeUo1RWmS9ZvA6YqXNjOQf3qhvyRzL+A@mail.gmail.com>
X-Gm-Features: AaiRm53NeM6JXBaMsHRX5zNF9kdjR-GGQovZIV0Smv7jXgjQSEjIMK3Gzrx3URo
Message-ID: <CAD++jL=sj=DCuRvOveVeUo1RWmS9ZvA6YqXNjOQf3qhvyRzL+A@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Remove <linux/of_gpio.h>
To: Jialu Xu <xujialu@vimux.org>
Cc: brgl@kernel.org, kees@kernel.org, krzk@kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 8423E21E23C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32649-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vimux.org:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

n Fri, Mar 6, 2026 at 4:56=E2=80=AFAM Jialu Xu <xujialu@vimux.org> wrote:

> Convert the last three NFC consumers of <linux/of_gpio.h> to the
> GPIO descriptor API, then remove the deprecated header entirely.
>
> Changes in v3:

v3 looks great to me.

The NFC subsystem is orphaned, so I suggest Bartosz simply
merge this to the GPIO tree at his earliest convenicence.

Yours,
Linus Walleij

