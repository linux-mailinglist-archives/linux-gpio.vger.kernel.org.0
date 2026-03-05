Return-Path: <linux-gpio+bounces-32568-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNQPB6x4qWl77wAAu9opvQ
	(envelope-from <linux-gpio+bounces-32568-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 13:35:56 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D89211C3F
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 13:35:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0125E303DA01
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Mar 2026 12:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4279239E184;
	Thu,  5 Mar 2026 12:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sSGBL+Pz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043C739C632
	for <linux-gpio@vger.kernel.org>; Thu,  5 Mar 2026 12:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772714151; cv=none; b=f083jgHxUtnsaHxTq5ybP0rEY88Vvb6+ClLxoSpLXoGXCsbFBdNL05E6HWDYRQOw4VR1Qzi6uTw2sg+hebyGxVbQqYDBMs1/SfwIgfH00P2EbmwQ/7MZM1ul/D1wd9uKp3jYIyoDCZMvBtpdnhBskv8RaKQUN28WeW0CgCHskxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772714151; c=relaxed/simple;
	bh=QYsDAO4cTFaw1BQ8xQpgh4ascM3Lw2+Du0hXvtOGUK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rEY+42Xe2S4IuQiiRUw+FNZWIuBKJ6VaKoJlIxGxZK7Khsn8AP5kWadnWRHNaSwHJGfOoZXJ+xCTFpOc5zuITJzIYzvjlCxArP9vh+JU85G6iTjqKexx7yA90rNN/tyfPuvQgl1wOH5IEh6sMWBQthF08bWwspn0tqfuoNClfQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sSGBL+Pz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB394C2BC87
	for <linux-gpio@vger.kernel.org>; Thu,  5 Mar 2026 12:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772714150;
	bh=QYsDAO4cTFaw1BQ8xQpgh4ascM3Lw2+Du0hXvtOGUK4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sSGBL+PzJD9pDLBK+BpAbW60gXwjn6LeO3ql1l4clj8LF1tIsoYnYTb21YJ08+qT+
	 Ch+o8M1BcofKabnLC5Q7tbhACjuCWdA+BoKFczsuPQrpBcnRMryjk7gLgWKyfgsOAS
	 wzVgfTX2Sj5zYo3QKoZ4i056R6cIKVL0hry0UCoC2w4i6Uy/pKPd4TABRyKW77XFg1
	 N/jvgLiNZAZHJeu9fCgMKrxyPVsQCjxxDMfblAS3Mad40O5+ceTVYXOht6208s8Q3D
	 wMyHH0UbrJwQxScGOKxjB3Z3XrhL9Yo5KiQJPxNVRPIYtoP7VhtMrr7Y/LXb2DKQCp
	 peeCJKjnGvglQ==
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-64c97997b0fso5590013d50.3
        for <linux-gpio@vger.kernel.org>; Thu, 05 Mar 2026 04:35:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUMphM8aIv3BzKxeoKi40aBT4jlHkThXirIjBAqRX+KoNA09wVvqfFJWpj9MmmrfHLDP68PDCNWD5J3@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp6BwEwlpTvd7O/9NFvwMOUki1k5bgs3Z1JmMcXcC7c3j8jCsp
	l03GFgJWEFkNE3E9la0imvzKZek17nmPI4QAe/reHTCV+Kekk/Q7guqEkKnL2B4dJZyRbkB1QkU
	p7+fH2CYQuRheXynQ/xulgwGENZhksm8=
X-Received: by 2002:a05:690e:140f:b0:649:eaa9:f252 with SMTP id
 956f58d0204a3-64cf9becd23mr4953724d50.53.1772714150075; Thu, 05 Mar 2026
 04:35:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1777BBA64A3D0F97+20260304105215.536399-1-xujialu@vimux.org> <815AD68AB84E0ECD+20260304110740.548318-1-xujialu@vimux.org>
In-Reply-To: <815AD68AB84E0ECD+20260304110740.548318-1-xujialu@vimux.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Mar 2026 13:35:39 +0100
X-Gmail-Original-Message-ID: <CAD++jLme1FQsFBSnm5wv4sGz6rKu=8RPELCBKaSPsM6Y0XkVjw@mail.gmail.com>
X-Gm-Features: AaiRm53HEvefjIJ21IeyJXjS9e796eov08LiPI80EqQhJn-Z3TLk-6WhTJvpD2U
Message-ID: <CAD++jLme1FQsFBSnm5wv4sGz6rKu=8RPELCBKaSPsM6Y0XkVjw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] nfc: s3fwrn5: convert to gpio descriptors
To: Jialu Xu <xujialu@vimux.org>
Cc: brgl@kernel.org, kees@kernel.org, krzk@kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: B1D89211C3F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32568-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid,vimux.org:email]
X-Rspamd-Action: no action

On Wed, Mar 4, 2026 at 12:08=E2=80=AFPM Jialu Xu <xujialu@vimux.org> wrote:

> Use <linux/gpio/consumer.h> instead of <linux/of_gpio.h>.

Talk some more in the commit message how you do this,
and add your Signed-off-by!

With those changes:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

