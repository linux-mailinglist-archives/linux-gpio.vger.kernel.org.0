Return-Path: <linux-gpio+bounces-32786-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FcPNSIJrmkN/AEAu9opvQ
	(envelope-from <linux-gpio+bounces-32786-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 00:41:22 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E142232C42
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 00:41:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3C11301B721
	for <lists+linux-gpio@lfdr.de>; Sun,  8 Mar 2026 23:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 018B035BDD7;
	Sun,  8 Mar 2026 23:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KJG7p9s2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B930F35B650
	for <linux-gpio@vger.kernel.org>; Sun,  8 Mar 2026 23:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773013253; cv=none; b=Km6mJIbEy2M77zXpdzZGb6sENICr6hxQYBSL5YUnLhpiCu4kMbMTWBosXwUVO0+CasfMzrwo6b0Q5Yzx47R+EQo+1YY+ay7yR74o9NtFeBDpH6z/4MF9zfNJ1gen2BGY3KF7BKg25MPzq9CV/u1ISDbapo3h+nGeMcQ2h8l5UV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773013253; c=relaxed/simple;
	bh=886yOsmgMr03UfDw77dZfLDvbC5Q93qvbfwF3WDyRFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hslG8q3J9fbyrs8D1YB5162lV2KNsKs8HK9F9Yex3eHAnF/wn4AnTLDn6zwX3oEYwKykWUoUuwkhjnpicTIebKtmuCU9IGxbOSQHxz3q4KIM6GjbPxFack7qV4LK6rlKtKTa7g3YQtgz+PTWqmofT8WQdlK4Z5neIBq0Ro151ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KJG7p9s2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A401C116C6
	for <linux-gpio@vger.kernel.org>; Sun,  8 Mar 2026 23:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773013253;
	bh=886yOsmgMr03UfDw77dZfLDvbC5Q93qvbfwF3WDyRFE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KJG7p9s2e95DG65rsuy3fpE59sjy0m4Nli6U54WKx1+uAR7Pw6RE6UupWm+5VKEUQ
	 JRmErT+F5PR77oJyHiRgLAxSErT7RsZodfuQFTuuJ674j+i5HgaGQ8zoekcClUZRMv
	 Tt/2h7cqulZjBVQUe6OpNC+CxNz85ivcC9DC/kczvB4r1Vd0BT6rmflTG715+JCLx3
	 DATgREW3YQHoot6X/A7mo0YHtT/VuxPL3vQKheNZHLEudu8kTnf8u1vC6i3Sj8WWhB
	 +y+Ao4YaYMW+b+AkPo1ZjVZ3cPF7O1Hqlgn4iRzftSmjZJZ03e0m6HAFyDg8hr9zPh
	 5x+xp9UkNhP2g==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-798527f822cso108680477b3.3
        for <linux-gpio@vger.kernel.org>; Sun, 08 Mar 2026 16:40:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWpW0RZbblpPgEIC/nHA0zhFjwXQb92mtZLFCtQPCgkB1QZa+u9FYtZIVDfCgimMC/jo9c1zwHzVPSM@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0MpE0fBhE97+ppeBDKtzabUy5IOkOPu9sYX0QjFfjkEFM6zfZ
	BGY8hZDYBclmoelEQ8ZZLF383e/+td3QPhhXicUIGDdQPz3DA8H5i3Xnnw0atq73xVgAMR+AhTb
	H+EKunulMu4musBlov515FxT6xSvQCuQ=
X-Received: by 2002:a05:690c:ed6:b0:798:78cc:3e59 with SMTP id
 00721157ae682-798dd6444f1mr97812207b3.11.1773013252777; Sun, 08 Mar 2026
 16:40:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260305124945.10781-1-johan@kernel.org>
In-Reply-To: <20260305124945.10781-1-johan@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 9 Mar 2026 00:40:41 +0100
X-Gmail-Original-Message-ID: <CAD++jLk0QCZRbA4NWJ+sBDD8WsBk1zN5MD_iVUCFzcj9xQQucw@mail.gmail.com>
X-Gm-Features: AaiRm50c9N_rKWeiHHuIfIadQCWrCsBx7jtt--5v3RNL_54PJOZNzCIJCUhp8SA
Message-ID: <CAD++jLk0QCZRbA4NWJ+sBDD8WsBk1zN5MD_iVUCFzcj9xQQucw@mail.gmail.com>
Subject: Re: [PATCH] gpio: mpsse: drop redundant device reference
To: Johan Hovold <johan@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 3E142232C42
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-32786-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.963];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Thu, Mar 5, 2026 at 1:49=E2=80=AFPM Johan Hovold <johan@kernel.org> wrot=
e:

> Driver core holds a reference to the USB interface and its parent USB
> device while the interface is bound to a driver and there is no need to
> take additional references unless the structures are needed after
> disconnect.
>
> Drop the redundant device reference to reduce cargo culting, make it
> easier to spot drivers where an extra reference is needed, and reduce
> the risk of memory leaks when drivers fail to release it.
>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Looks right to me.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

