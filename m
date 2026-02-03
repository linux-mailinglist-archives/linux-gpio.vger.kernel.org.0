Return-Path: <linux-gpio+bounces-31366-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJtZLMxBgWl6FAMAu9opvQ
	(envelope-from <linux-gpio+bounces-31366-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 01:31:08 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3E7D2FE9
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 01:31:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5C1883006823
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Feb 2026 00:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18D7B1DF25C;
	Tue,  3 Feb 2026 00:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NKucivgU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9048834
	for <linux-gpio@vger.kernel.org>; Tue,  3 Feb 2026 00:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770078663; cv=none; b=BZUF2lnebV24czLi84WPOm8y2C+8Gv5yqZYGBFGToZOdjYUDSIPB0n0vLhNnsLfJVFIEhGxNbic0ykPIAwYQ6eHkYmycpzIts35Qp4gH1YLUVnFCWNPT5U6Ge9mLOeNRzIAPipHNhPLKubmRn+vuJYpKQk0XftDbMevP/XnbZxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770078663; c=relaxed/simple;
	bh=rCzWcUNYObszzKw2XrzSeWJXGz4cgOR0f4n3rSwcCzo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MZ+Da8c2Az+ORZYK3cSudJhX1cSkga+2v/b/yeXLEj3BPoTCCowCRQ4bOstlZt7x64vTbLJ9LTdhL+v6QaCP+Wo6eZiIgf6atjSfvdgaovX+GFN6sFgS7LXfinGFbnNsMXEfeNGdkViyUdMX95LlrkjrDHXXzKjC4HuDqQd8nSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NKucivgU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9294CC2BC86
	for <linux-gpio@vger.kernel.org>; Tue,  3 Feb 2026 00:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770078663;
	bh=rCzWcUNYObszzKw2XrzSeWJXGz4cgOR0f4n3rSwcCzo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NKucivgUsPRV7CwJQdDXL8aA9x1hpmkB9biQuIQ9lXFUnHWlbf9q31BttfeBDLhar
	 p4+g6CnLiAd4muKD6k/jesL/TXDdm1RTl3RjpG1M7NfrODuTHUYNyAn5zREzmdioU4
	 6KNPlnUcKArPtVINUQZq1Jx7xfLJWptcp8Gx2IlA6DB+OLUQuw0J4supk32q5vAjPq
	 EebhuZFEJ66KX12Xi4ktgPsZctDG+vUYlYHG9Eu1oQLMv1S7a00S52Z22PBxARxWR3
	 flDWuoyExMgYz8ysPyo5X4Gr3a9DBrreqZkfQ2+0aIiKNNqh1/0I+KCflh1TXuKv6w
	 A0OYat+j2Z//A==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-794719afcd4so51677027b3.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 Feb 2026 16:31:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVPhUMm8BRyzYxrG6ThUcMLvtZeuXxCGYtIs6Pdl75rf79bYqxrPIkrSCGPVinhHkMc5wWhZfzb1JW6@vger.kernel.org
X-Gm-Message-State: AOJu0YyZKZIYAloxfrpiWpcIbFcTEe0iG2bobpBDhbQOvb+e4AGL17hS
	mToWGKpAEo7BP8xVaOsFYsNvrZSyTsPc5ftbnb97Ig5cnY+o0/hkOvxiptye5Mp9VHcJbvIn9/0
	JbF24KY9idKqaeo7l2SaYx/yc4MaWEA4=
X-Received: by 2002:a53:cd82:0:b0:649:4689:c4a9 with SMTP id
 956f58d0204a3-649a84ffe40mr8069913d50.89.1770078662854; Mon, 02 Feb 2026
 16:31:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120080735.548853-1-unsw.weili@gmail.com>
In-Reply-To: <20260120080735.548853-1-unsw.weili@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 3 Feb 2026 01:30:51 +0100
X-Gmail-Original-Message-ID: <CAD++jLkqNNpn5FvChe6FSrZMio_p1tee4iuvjLCeE6rAG7rz=A@mail.gmail.com>
X-Gm-Features: AZwV_Qhly6XHpSp86Er5TPHloXC_y_fxAC5_LpOBwvnti6ySY695_7osyEqHr6g
Message-ID: <CAD++jLkqNNpn5FvChe6FSrZMio_p1tee4iuvjLCeE6rAG7rz=A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: single: fix refcount leak in pcs_add_gpio_func()
To: Wei Li <unsw.weili@gmail.com>
Cc: tony@atomide.com, haojian.zhuang@linaro.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31366-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BF3E7D2FE9
X-Rspamd-Action: no action

On Tue, Jan 20, 2026 at 9:07=E2=80=AFAM Wei Li <unsw.weili@gmail.com> wrote=
:

> of_parse_phandle_with_args() returns a device_node pointer with refcount
> incremented in gpiospec.np. The loop iterates through all phandles but
> never releases the reference, causing a refcount leak on each iteration.
>
> Add of_node_put() calls to release the reference after extracting the
> needed arguments and on the error path when devm_kzalloc() fails.
>
> This bug was detected by our static analysis tool and verified by my
> code review.
>
> Fixes: a1a277eb76b3 ("pinctrl: single: create new gpio function range")
> Cc: stable@vger.kernel.org

Skipping this, it's not a critical bug.

> Signed-off-by: Wei Li <unsw.weili@gmail.com>

Patch applied.

Yours,
Linus Walleij

