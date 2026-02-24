Return-Path: <linux-gpio+bounces-32109-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLQzJz9nnWlgPQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32109-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 09:54:23 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1248A1840AC
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 09:54:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C8C4330D5BF2
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 08:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18044369208;
	Tue, 24 Feb 2026 08:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DeK1+tco"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA4036828E
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 08:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771923130; cv=none; b=fEu5T8axwz7p+bjDsIlaOGF49hPZ9MTifLFY3m+RMxj0tkeN0bu/L1Y+f83nodHSuYDsQS5amZjaMlNOl7O+yjnSFLc00KJPoY1IBxVkTaQSAlkifeTP/HYECU+crx/rnHuy79SXjA6U3EQX36kUS5CPz5bEzbqeTxGz7d9cm5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771923130; c=relaxed/simple;
	bh=TxC+9CwQPZaQ4eZ8FYnf/MRlHREBnO/JfF0+/m7jxIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NylU7C7SrLp/EMQDfLbAqp2/D4hVesz1D9DTOcIDyzW+hmRXMqlQjkFp/JS2qqg07ODDG12u9L3cQsfnBv/NUL+w8i/yRUlq8l8tiQ5jImtv5Ind5oJZudME9ndMkrALURmAijbqsNkDdFkoZflF/eaYa2nwAq4OGhZmkG5/GG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DeK1+tco; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 804CBC4AF09
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 08:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771923130;
	bh=TxC+9CwQPZaQ4eZ8FYnf/MRlHREBnO/JfF0+/m7jxIU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DeK1+tcojVaf6QVywu3aN3pt2jTLUQJu0i99eZvTkRaRPYZ25g7dN85erlfiObexi
	 sBKH6lBcbvBusBaQ4gA6d0RAtzEGeBUZs4WOhYS83oXyXaWG/xSkuKm6XRTXynH7os
	 UqjNuiCBajKp1ct+I8Cbfp2KNyL6N5WP14aloLQziMnsl7xNT1jn889pS2KwhUv/iu
	 qAPRaJNt2lT/UJ+tDAB1B6Ad2sgz4QFF/JBFVsFQh05MjI7tXeKamHmnS/aTs+fJfA
	 nPpJrb/Aq9QGyrXSHU79buKui8S3NNtZKNWtjtnBb5AHrODfkicqEw6KJxq16ltH0c
	 RS1/idD0qC/rw==
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-64c9fcc24b3so260757d50.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 00:52:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWKbrmegS8lNCQiZgohGlsVuEbuhCix7AYHbwpZY8lgvsHCAfzWPTi+9BKHjZcvUaglxw0qngfCkfCj@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz/u5KRK6iDDggvGCIbOh7b/AAqQ9SJR9qRg63n1KcoD8Cpxaq
	FRsmlo4iS/eNFvFcJh+2pjIDJE5ZTOK7sfbCRiwb4bMZvu22Xvg6UiAmZqu4d8w262uTpBg8Fz3
	i6KVXFZU24QI8y7o9YNFjK0FQFX+4/Cw=
X-Received: by 2002:a05:690c:883:b0:797:d8ae:df49 with SMTP id
 00721157ae682-79828f3643cmr96216547b3.26.1771923129899; Tue, 24 Feb 2026
 00:52:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216085838.71518-3-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260216085838.71518-3-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Feb 2026 09:51:59 +0100
X-Gmail-Original-Message-ID: <CAD++jL=0WD3993xkwt66KGaZrKUAGK-E6Jt1DHzzTXHcrjJeoA@mail.gmail.com>
X-Gm-Features: AaiRm52_C2vP2l5LPBno5Xd20xzBqjDefpIpOf3B39RiQDyRTkW0Hul60Mk_ABo
Message-ID: <CAD++jL=0WD3993xkwt66KGaZrKUAGK-E6Jt1DHzzTXHcrjJeoA@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: amdisp: Make amdisp_pinctrl_ops variable static
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Peter Chen <peter.chen@cixtech.com>, Fugang Duan <fugang.duan@cixtech.com>, 
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32109-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 1248A1840AC
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 9:58=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> File-scope 'amdisp_pinctrl_ops' is not used outside of this unit, so
> make it static to silence sparse warning:
>
>   pinctrl-amdisp.c:83:26: warning: symbol 'amdisp_pinctrl_ops' was not de=
clared. Should it be static?
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Patch applied!

Yours,
Linus Walleij

