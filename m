Return-Path: <linux-gpio+bounces-33529-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHXrLtwMuGkWYQEAu9opvQ
	(envelope-from <linux-gpio+bounces-33529-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 14:59:56 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D3629AE61
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 14:59:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 914063022E11
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 13:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F80539B94A;
	Mon, 16 Mar 2026 13:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FhpcxDUh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1317486347
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 13:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773669586; cv=none; b=fwTvd0gj10uPh44QfnD8YvkT0nJ+PQtKnb00EgXB6h9FW6LXJLJkoJffgibigrHRIpx8A4kms8nrkb1mJMrcalQkXWc3YI/rXdirKPwYupqtS1iTzrvBgYnwuXQ8Oop6Al1Z+7yBnnO+zd3gVqjVdTUYzgOVTjwxQ/DTCEUwrXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773669586; c=relaxed/simple;
	bh=Fjb9fZZs1ZvFOQ4C9uQbO/1B6MRyMCO+ilDgqLwjVi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ePzamLiVLi4gkl62pNwfQx/MZgkUKXQ7If5o8quAgDRvIWJ23T02lJIpBwmsD7V53oDut01I7bA1+79Whsyn/awdfAx0Ai0MrVvOFU5hL+1/jLungP2abOXifhE6ylFlKdgduo85jcnsphmSfBhPq975otEP3nuViSf/bBlKORE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FhpcxDUh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E270DC4AF0B
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 13:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773669585;
	bh=Fjb9fZZs1ZvFOQ4C9uQbO/1B6MRyMCO+ilDgqLwjVi0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FhpcxDUhFXxP/s3z39GyLkA3mHIjnO2p5Uh4OJyIo2zbv+tGGXQhmmy61586p5uK/
	 nAaSsf36BROI3y4U/G/YXqD559zF1wOqncS7bdegu6Ks1lIccfTXCkIffTyhGOUERr
	 wxKfVzq3H8C4TaefrFOl+se3XbNKBj29IiDakLpcXawhz/CbJqsZQzdavfFNAMZ1V6
	 CsutPglymEjrrSA9rEz6jYIpZdIusb58StT18CTu5s1DVtaMVWj7IqEoUYmC2ovuac
	 Jtus0JLCX8SNvN8/IyExRHpJIy9B98M6iGC65oDVjYcjTT+djMPSsU3qx+VLNm9FCF
	 IqZBvPgKqtEPw==
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-64ae222d978so4856846d50.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 06:59:45 -0700 (PDT)
X-Gm-Message-State: AOJu0YzwyNpmCg567L2B9HHzLMP7Wn+e11+tEI3KZlCwvEusfNWHU68S
	T53POj1Mu4G6A4WcCYYOAIYesap8YndfsoorPgtWu1L1E8lhv6Bmn7bve+6Vbgizkq/812i1TJ0
	Ef9dMzbhUfOzhEaQc68lsRjoHEKTks2U=
X-Received: by 2002:a05:690e:1c7:b0:63c:f5a6:f2ef with SMTP id
 956f58d0204a3-64e6307f5dcmr9995930d50.65.1773669585234; Mon, 16 Mar 2026
 06:59:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312193717.12221-1-rosenp@gmail.com>
In-Reply-To: <20260312193717.12221-1-rosenp@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Mar 2026 14:59:34 +0100
X-Gmail-Original-Message-ID: <CAD++jLnRseLfMFq982ggXSYCrO-5xoxPD30eepGKY6-EEeuhLA@mail.gmail.com>
X-Gm-Features: AaiRm51aOzZzJaZ_mm2VdjhqhKeQ3AoEaq_JqIIJjrVjOdtyD03zXAXm1_l24VE
Message-ID: <CAD++jLnRseLfMFq982ggXSYCrO-5xoxPD30eepGKY6-EEeuhLA@mail.gmail.com>
Subject: Re: [PATCHv3] gpio: virtio: remove one kcalloc
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, 
	"Enrico Weigelt, metux IT consult" <info@metux.net>, Viresh Kumar <vireshk@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	"open list:VIRTIO GPIO DRIVER" <virtualization@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33529-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 58D3629AE61
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 8:37=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wrot=
e:

> A flexible array member can be used to combine allocations.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

